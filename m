Return-Path: <linuxppc-dev+bounces-8934-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC05CAC3B91
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 May 2025 10:21:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5TJK00qYz2yZS;
	Mon, 26 May 2025 18:21:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748247712;
	cv=none; b=ijeiO2h+JBlExLr+BOzFNIoLOuRqQfM5gHqWWQBAeSsLt3u61X32PRRiFbOgEvUnBdcGKPMfoIq/XEjL6abOWkB1tFm2tTGk47PytaDyJpHTESvChFsoeWAO2Fzy58aYDm016A3CHIGO1RknmnVIny1pEp2PQAvSLRIN/w7bNIKSjipzJlHU1a7ES+0o6HG2emlGSyc3SxkSwYz17IBNlG90tchpW+1V/vacUcUwqDXnzviXMLmyEXEX6iOXrbmkXYNFJnyxNu1AI1g0nktqP6Mvqkmb/ViHoHfaVAODi4ANUIRfMlAM8PRpFb7oGhsm9vdxInxjrSl7ygSvE132OA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748247712; c=relaxed/relaxed;
	bh=IU68HzhMRXe5qhgZzz56iADDqZ9JLDiGP7esB8flIyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=npRwAubYaR1OUbAI362ZiKpfLSGEHZgNaw+neTzD499cSQk4k1dTPs7VNT2Jyve1guqoJym5RDl55/k3OOUsAFaJzXXvTQn7w239jGGTrGFLTM8QisxavCB5vY5ZNmP8EuEai960nC9bLKERy7l/WMTJ3kZY/ayZMHGqW0lR7BIh4pnHs7AMwcCeWfa1zNFsvnSvtrbU6rv0BvMEyyaddJ09kObnSVZ0AhwS3glypLO4MiOkiD12TWM2Luisut5jWzrYh0r9UZUiIn2d5UD3JT5PNVw7Z+N2XCXlQmd0NLurlZCO6MiQnQuQwmUJvRLZD3cjh4qdm8/UF2mbUyNh6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b5TJH439mz2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 May 2025 18:21:50 +1000 (AEST)
X-UUID: 50581bc43a0a11f0b29709d653e92f7d-20250526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:c8cffb3b-ca75-422b-af48-838dfab09a5d,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:15,RULE:Release_Ham,ACTI
	ON:release,TS:22
X-CID-INFO: VERSION:1.1.45,REQID:c8cffb3b-ca75-422b-af48-838dfab09a5d,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:15,RULE:Release_Ham,ACTION
	:release,TS:22
X-CID-META: VersionHash:6493067,CLOUDID:3b493ef02f725a96f0d2e58473886bae,BulkI
	D:250522180435BN613KC0,BulkQuantity:5,Recheck:0,SF:19|24|38|45|64|66|72|78
	|80|81|82|83|102|841,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:ni
	l,Bulk:40|23,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:
	0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT
X-CID-BAS: 1,FCT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FSD
X-UUID: 50581bc43a0a11f0b29709d653e92f7d-20250526
X-User: aichao@kylinos.cn
Received: from [172.25.120.86] [(112.64.161.44)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 784335124; Mon, 26 May 2025 16:20:42 +0800
Message-ID: <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
Date: Mon, 26 May 2025 16:20:37 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
To: Johannes Berg <johannes@sipsolutions.net>, perex <perex@perex.cz>,
 tiwai <tiwai@suse.com>,
 "kuninori.morimoto.gx" <kuninori.morimoto.gx@renesas.com>,
 lgirdwood <lgirdwood@gmail.com>, broonie <broonie@kernel.org>,
 jbrunet <jbrunet@baylibre.com>, "neil.armstrong"
 <neil.armstrong@linaro.org>, khilman <khilman@baylibre.com>,
 "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
 "shengjiu.wang" <shengjiu.wang@gmail.com>, "Xiubo.Lee"
 <Xiubo.Lee@gmail.com>, festevam <festevam@gmail.com>,
 nicoleotsuka <nicoleotsuka@gmail.com>, shawnguo <shawnguo@kernel.org>,
 "s.hauer" <s.hauer@pengutronix.de>,
 "srinivas.kandagatla" <srinivas.kandagatla@linaro.org>
Cc: linux-sound <linux-sound@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-renesas-soc <linux-renesas-soc@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>, imx
 <imx@lists.linux.dev>, kernel <kernel@pengutronix.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
 <7e708dcc98c6f0f615b1b87d190464cfe78be668.camel@sipsolutions.net>
 <eb1ddeb3-06b6-4ac5-b20a-06b92c7f1363@kylinos.cn>
 <23aadbd78d3585c900c579c26f360011cf1ca830.camel@sipsolutions.net>
Content-Language: en-US
From: Ai Chao <aichao@kylinos.cn>
In-Reply-To: <23aadbd78d3585c900c579c26f360011cf1ca830.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


Hi Johannes:
>> Hi Johannes:
>>
>>>> "simplifies the code" is no need to callof_node_put() .
>>> Fair. Except that's not what you _actually_ changed here. Like I said,
>>> either it's buggy before or after.
>>>
>> In the function i2sbus_probe, it not return a struct device_node, so , I
>> think function for_each_child_of_node_scoped is better than
>> for_each_child_of_node.
> You still haven't explained why it's even correct.
>
> johannes

The for_each_child_of_node() function is used to iterate over all child 
nodes of a device tree node.
During each iteration, it retrieves a pointer to the child node via 
of_get_next_child() and automatically increments the node's reference 
count (of_node_get()).
Each call to of_get_next_child() increases the reference count 
(refcount) of the returned child node, ensuring that the node is not 
freed while in use.
for_each_child_of_node() increments the child node's reference count in 
each iteration but does not decrement it automatically.
If of_node_put() is not called manually, the reference count will never 
reach zero, resulting in a memory leak of the node.

Best regards,
Ai Chao

