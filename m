Return-Path: <linuxppc-dev+bounces-8935-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66139AC3C20
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 May 2025 10:54:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5V2S54ytz2xfR;
	Mon, 26 May 2025 18:54:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748249696;
	cv=none; b=Yy8Cy0q08c5pQRxxaKQBd36iIFLOE8InI7mML09Np17k51KtNkt5hRovSmcwQkRnGSZBz+rOPUmlStuQc4LI/8B0ZtpZbFfNJHjHRVO1zDjvA3ihpmM6u+sUSMD+kXVqJUApYFZY1aEmPAIVS72qmfCBQYCsSG9MPmizaOEttrc9xvlJ6gE2iuPekd7VudXkvHa6n60XwAIE3NxRn8DhcMBrTyHbKSB86AxoEIk/0ZvY8jXMBcBgyhFhPrQKE/Nm6oCFjyYFzjsIamZOPD13IZoNaji8b8fu0FGE5ieChZpUR7bzcXbP/Trwkx7FChF1yFJCRcf9XH2JMlzTRhrF4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748249696; c=relaxed/relaxed;
	bh=ZERPBESWHCzHAZIRg67GVfwNEEmyh+2Nz/8LZQRFxvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ibMt8ZCrlGzFqU5cB+zw+vwtttbBq6BT7km7dWSRxyvG62wgDc3sZTuHKKa0EGaQyzYUk2Av/LSpMQsZKQRKDXa5sHJJauNrsqeUp8UQO0G6JeXjC1FjFG5D0BbgR1eTEkxZv6Ns0MlhWwD2ZHdLk/HC8YU3xp1e3+xX8n25Q5ds6geBBNeTkQyLZQJBQ6VZ+C6dZ8IsXqcriwJOMJ7hOii7MJnqngPdNHOi+GzOPgzWa5HHdbRImW3j8kUVDhboipTSDF8nRhyNsr3Y5+XJiPKVyJ+u+HhHApg18Znd5bJoMAL+CI9yC6l5msn/0Q3h1WWPbJKaDAmrjFmz6XVW+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b5V2R2wlQz2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 May 2025 18:54:54 +1000 (AEST)
X-UUID: ef5a1a7a3a0e11f0b29709d653e92f7d-20250526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:2a582296-71b1-4427-aff1-0d66ba2e24a6,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:30,RULE:Release_Ham,ACTI
	ON:release,TS:37
X-CID-INFO: VERSION:1.1.45,REQID:2a582296-71b1-4427-aff1-0d66ba2e24a6,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:30,RULE:Release_Ham,ACTION
	:release,TS:37
X-CID-META: VersionHash:6493067,CLOUDID:01155e3f26d2f9f964f0833965c5c673,BulkI
	D:250522180435BN613KC0,BulkQuantity:7,Recheck:0,SF:19|24|38|45|64|66|72|78
	|80|81|82|83|102|841,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:ni
	l,Bulk:40|23,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:
	0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT
X-CID-BAS: 1,FCT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: ef5a1a7a3a0e11f0b29709d653e92f7d-20250526
X-User: aichao@kylinos.cn
Received: from [172.25.120.86] [(112.64.161.44)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 2088584585; Mon, 26 May 2025 16:53:46 +0800
Message-ID: <3869e6fc-1cbf-4113-9b34-0cbb5d4b5176@kylinos.cn>
Date: Mon, 26 May 2025 16:53:42 +0800
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
To: Christophe Leroy <christophe.leroy@csgroup.eu>, perex@perex.cz,
 tiwai@suse.com, johannes@sipsolutions.net, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, broonie@kernel.org, jbrunet@baylibre.com,
 neil.armstrong@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, srinivas.kandagatla@linaro.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 imx@lists.linux.dev, kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
References: <20250522050300.519244-1-aichao@kylinos.cn>
 <20250522050300.519244-3-aichao@kylinos.cn>
 <8ad901c3-3fcb-4643-ac5a-c1f30f93d07f@csgroup.eu>
Content-Language: en-US
From: Ai Chao <aichao@kylinos.cn>
In-Reply-To: <8ad901c3-3fcb-4643-ac5a-c1f30f93d07f@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Christophe:

>> The for_each_child_of_node_scoped() helper provides a scope-based
>> clean-up functionality to put the device_node automatically, and
>> as such, there is no need to call of_node_put() directly.
>
> I don't understand this explanation.
>
> You say "no need to call of_node_put()" and the only thing you do in 
> addition to changing from for_each_child_of_node() to 
> for_each_child_of_node_scoped() is to _add_ a new call to of_node_put().
>
> I would expect to see a _removal_ of some of_node_put() when I read 
> your description.
>
>>       }
>> +    of_node_put(sound);
>> +

The for_each_child_of_node() function is used to iterate over all child 
nodes of a device tree node.  During each iteration, it retrieves a 
pointer to the child node via of_get_next_child() and automatically 
increments the node's reference count (of_node_get()). Each call to 
of_get_next_child() increases the reference count (refcount) of the 
returned child node, ensuring that the node is not freed while in use.
for_each_child_of_node() increments the child node's reference count in 
each iteration but does not decrement it automatically.
If of_node_put() is not called manually, the reference count will never 
reach zero, resulting in a memory leak of the node.

In function i2sbus_add_dev, it used device_node out of 
for_each_child_of_node(){},  it need to add a new call to 
of_node_put(sound) to reference count.

In function i2cbus_probe, it used device_node in 
for_each_child_of_node(){}, used for_each_child_of_node_scoped() is 
better than for_each_child_of_node().

Best regards,
Ai Chao

