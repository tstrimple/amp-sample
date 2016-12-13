SELECT
	A.context.data.eventTime as eventTime,
	A.context.data.isSynthetic as isSynthetic,
	A.context.session.id as sessionId,
	A.context.session.isFirst as sessionIsFirst,
	metrics.ArrayValue as metric
INTO
[amp-sample-output]
FROM [amp-sample-input] A
CROSS APPLY GetArrayElements(A.context.custom.metrics) as metrics;