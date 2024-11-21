Return-Path: <linuxppc-dev+bounces-3454-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE479D4531
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2024 02:12:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xv0b34xGPz2xps;
	Thu, 21 Nov 2024 12:12:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732150716;
	cv=none; b=AxMSMcPbGKXtoScB4xFUm8u1/tqN+IttaRJ8g5ofDInu/0TOBMCuCEwtzCDjFATAFeJcAqT+x0d6rGjsvKrMhUDhUjEUbj5Ox++C5mPun0mxvSBSh28pdosm0rMuyTrKQKQdm/p93LMKKGdhG3QDVRF5qdWsBbLme+3Z6PyyUQTLGcK9WYK/ndsGdRVnTnopWolYMzpbOV1WtnxdJEtyrtjzdDfVFFkabjk98doCj3bsZVrwIY8jRLByXgFJB0rSvFJxDnd2ECcDysQRtNfzX/l9WY2mV2j0XDl9KqnHh4b4azJjVK4lxLcASU9rQG+LS8suHjrVFcrfEgpejC4SKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732150716; c=relaxed/relaxed;
	bh=ajgCy8uLTflhIqB9P6/gHAoqhge3/BouOLtZWMHI8qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mB0pUfuzYnpqXE5x6sVgp7JoQkygSib7IOybGmXgjWYS38OSwbAJHy1JPkFRdKp5DWOTf5NphTfKsqYiKbf7Ik6SAOctHs4UaZzRtcWZC68Sx/Ag9yi7Mw8U0xoBRfawhkqgrQTQxlOGBtmz1MJtFbFlT693DGxZ3APJgrroxoq4Vofxf7KSqBIsYLev7w23UjlQ7ln1uP9YU2g1k8E0o+t0G0lLdBgar4w8vdZu1t0K9fzg3OcFQtxBc32OCkxRWw/Qyc0uaRr9vLZhSb7hefloJqrdFibnwMnU71MpjzzPsMpe8VInJEdpRBwoKxt+Ms4CL8wRddIQsfZWkY9XmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xv0Gd3SYCz2xps
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2024 11:58:31 +1100 (AEDT)
X-UUID: 8f299912a7a311efa216b1d71e6e1362-20241121
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:d72081cc-bcf3-4dd3-b518-6f0d4c47927a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:194cac105c72739bf0966551aad64ceb,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,URL:1
	,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 8f299912a7a311efa216b1d71e6e1362-20241121
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 953411326; Thu, 21 Nov 2024 08:57:19 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 5350D16002081;
	Thu, 21 Nov 2024 08:57:19 +0800 (CST)
X-ns-mid: postfix-673E856F-26500222
Received: from [10.42.116.241] (unknown [10.42.116.241])
	by node4.com.cn (NSMail) with ESMTPA id BDCB616002081;
	Thu, 21 Nov 2024 00:57:16 +0000 (UTC)
Message-ID: <ec6dfc5b-7713-41c5-87dd-3254578e54fa@kylinos.cn>
Date: Thu, 21 Nov 2024 08:57:15 +0800
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: cpm1: qmc: Fix qmc_probe() warn missing error
 code ret
To: Herve Codina <herve.codina@bootlin.com>
Cc: qiang.zhao@nxp.com, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dan.carpenter@linaro.org, xiaopeitux@foxmail.com
References: <bac2dc94-1bf3-4dcf-b776-cd78ef992d28@suswa.mountain>
 <82d8c18da160b9e0a73c5c5e2eb25ad2831cc6f9.1732095360.git.xiaopei01@kylinos.cn>
 <20241120120506.077d3388@bootlin.com>
Content-Language: en-US
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <20241120120506.077d3388@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



=E5=9C=A8 2024/11/20 19:05, Herve Codina =E5=86=99=E9=81=93:
> Hi Pei,
>=20
> On Wed, 20 Nov 2024 17:38:20 +0800
> Pei Xiao <xiaopei01@kylinos.cn> wrote:
>=20
>> platform_get_irq() may failed,but ret still equals to 0,
>> will cacuse qmc_probe() return 0 but fail.
>>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/r/202411051350.KNy6ZIWA-lkp@intel.com/
>> Fixes: 3178d58e0b97 ("soc: fsl: cpm1: Add support for QMC")
>> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
>> ---
>>   drivers/soc/fsl/qe/qmc.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
>> index 19cc581b06d0..a78768cd6007 100644
>> --- a/drivers/soc/fsl/qe/qmc.c
>> +++ b/drivers/soc/fsl/qe/qmc.c
>> @@ -2004,8 +2004,10 @@ static int qmc_probe(struct platform_device *pd=
ev)
>>  =20
>>   	/* Set the irq handler */
>>   	irq =3D platform_get_irq(pdev, 0);
>> -	if (irq < 0)
>> +	if (irq < 0) {
>> +		ret =3D -EINVAL;
>>   		goto err_exit_xcc;
>> +	}
>>   	ret =3D devm_request_irq(qmc->dev, irq, qmc_irq_handler, 0, "qmc", =
qmc);
>>   	if (ret < 0)
>>   		goto err_exit_xcc;
>=20
> I already send a fix:
> https://lore.kernel.org/all/20241105145623.401528-1-herve.codina@bootli=
n.com/
>=20

ok, I'm so sorry for send repeated patch.

Tnanks!
Pei.
> And it is available in the following PR done by Christophe:
> https://lore.kernel.org/all/c3c4961b-fe2a-4fcc-a7a1-f8b5352e09a2@csgrou=
p.eu/
>=20
> Best regards,
> Herv=C3=A9

