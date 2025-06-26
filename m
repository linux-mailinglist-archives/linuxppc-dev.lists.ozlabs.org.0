Return-Path: <linuxppc-dev+bounces-9807-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACCEAE9CD7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 13:51:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bScTW2xGbz2xRw;
	Thu, 26 Jun 2025 21:51:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750938671;
	cv=none; b=VbHADTEm9aTHDc7FrRqEaD2i8/aOSSjWf0qDr1/oXBa5JRY2OJ1VOKxJeCrV9weUM1OgQQgXnDJeC0cCJV0pmsBz56zMHS9qvXp32KRHn/G8PHHR4ERHqygus6NiVQ2Kz9cSbnKcxiDP6bEFZwQvRJRUaT2VlNO12UyzNKLsGRjOLj2z6ZYLx5XLF8JJITBy6q+MquzcwMXKwfbCAihmJ1RxFWLV5XVMvokYOk9lc+L4MqJ3HIc22srgK+Ub0QfiN2cYKXTapf9MJDJqSba0dCUlIg5J+QigK5gVtozunfbQSqNkcfXvctVnDOz1y6DFawd3uez26Uotdqm2hrgLxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750938671; c=relaxed/relaxed;
	bh=VByTp1irzef3jI32T68vAhXexOmhT8VtQE5X+ojFIqE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mY0Iw/jcHa4kdjDcRfrijpCJlYLXbbKo8Zi0+A2a9ClWp7CntMwznlFIOQckAWUuNE7U0KdPD0V9ms185YvoD93Vsg4iBxObJUe9xQtVvdsr643kRl4eKz3KwdVmfIWT20GqrvMyXI9UdDtqsDxs6hHZMItqcZB08IzlUeu761DWbkjAWSLa+yr1NltRhbZeP94mYJ5ZL2lu2VQfeo8IFj+fPtb7jKAscgxsdZp9xqJTmWqwDv69imM9x6uTRdRSflamnWA9gT3fj1cBfKjQRPfVZnoDZf//1CrI5jcGPh7ClrtZjrGffPQlH/TujswtOLV4ldu3sFtpC5MMLMxNQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net; dkim=pass (2048-bit key; unprotected) header.d=arunraghavan.net header.i=@arunraghavan.net header.a=rsa-sha256 header.s=fm1 header.b=OMEnUxzX; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=hXNPh2Fa; dkim-atps=neutral; spf=pass (client-ip=202.12.124.147; helo=fout-b4-smtp.messagingengine.com; envelope-from=arun@arunraghavan.net; receiver=lists.ozlabs.org) smtp.mailfrom=arunraghavan.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arunraghavan.net header.i=@arunraghavan.net header.a=rsa-sha256 header.s=fm1 header.b=OMEnUxzX;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=hXNPh2Fa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arunraghavan.net (client-ip=202.12.124.147; helo=fout-b4-smtp.messagingengine.com; envelope-from=arun@arunraghavan.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 353 seconds by postgrey-1.37 at boromir; Thu, 26 Jun 2025 21:51:07 AEST
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bScTR4STqz2xJ1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 21:51:06 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id EC90C1D002A1;
	Thu, 26 Jun 2025 07:45:10 -0400 (EDT)
Received: from phl-imap-04 ([10.202.2.82])
  by phl-compute-05.internal (MEProxy); Thu, 26 Jun 2025 07:45:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	arunraghavan.net; h=cc:cc:content-transfer-encoding:content-type
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm1; t=1750938310; x=1751024710; bh=VByTp1irzef3jI32T68vA
	hXexOmhT8VtQE5X+ojFIqE=; b=OMEnUxzX1G/tJSWD8QXlUXGR3DmA7Q0YMHXnr
	cTY+XtgLtH6s9u729hyPRT0wLhHoOwMs05l3wO3tLUrtAxfPU7i+W8uf99apWVrW
	8pLH63Tn+fZImM8Gu+0QwldT+S00iMyTFVlKcrg4FqKWlQFnBqmI7JrnzKESy6sk
	c/Jlzg7t7a8q/wcAlAG/83YHvRnQwCMLiFVPLBWc5lCtK8rljYH/wkK6jk39NMoL
	eM/0iqC2E5ItzOm1S6zs+eSSXbJeix2ZblnFfn4rJ9Cf5mN9sg4vqWFGr9oujnQD
	NWGyTs+W7clHzYrS6knlOSZOEiUV7QYxKdYybN8IjL+Be71PQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1750938310; x=
	1751024710; bh=VByTp1irzef3jI32T68vAhXexOmhT8VtQE5X+ojFIqE=; b=h
	XNPh2Fab3iNJrp+pLerySAXh4l7hgl48Vo/hNCB6qkPE3mg2SWeQF8C+gJIx+ysu
	k1S3Nd9bJuJ/zkcw0txXDZdi/gQhIJO3Sy8sjHAwGqJMBBwGyaItfGnbtWHvIe5D
	twYqCjgvp09yWRYR3lu8lblI0E0iTxTy15zcx9YHdE8cZ381XwsIKgUxNv1ghTqU
	J3SXfcZbgtHjnbjklGO0yn6Be4yML+MdahzE52KsXb6vn5CQKsQsCQi0BW1p2F8l
	EyBXzhL48j1yy806jkDQlCKZPjD1sC7/QeRjPmsDYeTv65mWeWCy7SaeyBcGJKQG
	CcXmFTc50hzSSZQVovgoQ==
X-ME-Sender: <xms:xjJdaGTt2pxDjy23LtxD9qgQs9_bJQwhI4hfWHzgTw0DA7A0dfGGUg>
    <xme:xjJdaLwHpVLWDepK9kfwAWlTm8kYPNimBXALgMushnIUP2aO-KIk7a_hN_NNXe1XE
    zh3y2vjrjAaKIdFog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddtlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    foggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhunhcutfgr
    ghhhrghvrghnfdcuoegrrhhunhesrghruhhnrhgrghhhrghvrghnrdhnvghtqeenucggtf
    frrghtthgvrhhnpeevkeehvdetudfhlefhkeffvdeihfegffdvffdtheekvefhuddugfei
    gedtiefgleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrrhhunhesrghruhhnrhgrghhhrghvrghnrdhnvghtpdhnsggprhgtphhtthhopedu
    fedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghruhhnsegrshihmhhpthhoth
    hitgdrihhopdhrtghpthhtohepgihiuhgsohdrlhgvvgesghhmrghilhdrtghomhdprhgt
    phhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehlghhirh
    gufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitgholhgvohhtshhukhgr
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhhvghnghhjihhurdifrghnghesghhmrg
    hilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpd
    hrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgii
X-ME-Proxy: <xmx:xjJdaD2L55Uwspt-3d0NxdQX12EvRJxls5ZMAF7Fhvb-1n9DtsuEiw>
    <xmx:xjJdaCCDzmHUpyz5JJPAiunxsMAMVIx-Rr3S-ONjfJXB-SwQO1AjOQ>
    <xmx:xjJdaPhYgAy0W9rHeF-xXJBJpvZK9RwQsIbDSVPQ20FJdydhfK-wyg>
    <xmx:xjJdaOpNGzj4X2j9eyE3hiC9skuFrsOHGeQ3izgkcKkVkWNfr2cbgQ>
    <xmx:xjJdaNwhQ0oi2tDExWOrdMeHF87XOyC4wMYYoD6gB9BPQmNGnBpOAqON>
Feedback-ID: i42c0435e:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 362A3B6006B; Thu, 26 Jun 2025 07:45:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
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
X-ThreadId: Tbce6b10f0faf42d7
Date: Thu, 26 Jun 2025 07:44:48 -0400
From: "Arun Raghavan" <arun@arunraghavan.net>
To: "Shengjiu Wang" <shengjiu.wang@gmail.com>
Cc: "Xiubo Li" <Xiubo.Lee@gmail.com>, "Fabio Estevam" <festevam@gmail.com>,
 "Nicolin Chen" <nicoleotsuka@gmail.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Pieterjan Camerlynck" <p.camerlynck@televic.com>,
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, "Arun Raghavan" <arun@asymptotic.io>
Message-Id: <a189942a-39e8-4241-9301-844fb39a0f14@app.fastmail.com>
In-Reply-To: 
 <CAA+D8AN=K_ERUtc+mOW9Lm_B4wZT_qS5xg6RA2fDwrm9MTaCbw@mail.gmail.com>
References: <20250625130648.201331-1-arun@arunraghavan.net>
 <20250625235757.68058-3-arun@arunraghavan.net>
 <CAA+D8AN=K_ERUtc+mOW9Lm_B4wZT_qS5xg6RA2fDwrm9MTaCbw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl_sai: Force a software reset when starting in consumer
 mode
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 26 Jun 2025, at 2:55 AM, Shengjiu Wang wrote:
> On Thu, Jun 26, 2025 at 7:58=E2=80=AFAM Arun Raghavan <arun@arunraghav=
an.net> wrote:
>>
>> From: Arun Raghavan <arun@asymptotic.io>
>>
>> In a setup with an external clock provider, when running the receiver
>> (arecord) and triggering an xrun with xrun_injection, we see a channel
>> swap/offset. This happens sometimes when running only the receiver, b=
ut
>> occurs reliably if a transmitter (aplay) is also concurrently running.
>>
>> The theory is that SAI seems to lose track of frame sync during the
>> trigger stop -> trigger start cycle that occurs during an xrun. Doing
>> just a FIFO reset in this case does not suffice, and only a software
>> reset seems to get it back on track.
>>
>> Signed-off-by: Arun Raghavan <arun@asymptotic.io>
>> Reported-by: Pieterjan Camerlynck <p.camerlynck@televic.com>
>> ---
>>
>> v2:
>> - Address build warning from kernel test robot
>>
>>  sound/soc/fsl/fsl_sai.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
>> index af1a168d35e3..d158352c7640 100644
>> --- a/sound/soc/fsl/fsl_sai.c
>> +++ b/sound/soc/fsl/fsl_sai.c
>> @@ -841,6 +841,18 @@ static int fsl_sai_trigger(struct snd_pcm_substr=
eam *substream, int cmd,
>>         case SNDRV_PCM_TRIGGER_START:
>>         case SNDRV_PCM_TRIGGER_RESUME:
>>         case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> +               /*
>> +                * Force a software reset if we are not the clock pro=
vider, as we
>> +                * might have lost frame sync during xrun recovery.
>> +                */
>> +               if (sai->is_consumer_mode[tx]) {
>> +                       regmap_update_bits(sai->regmap,
>> +                                       FSL_SAI_xCSR(tx, ofs), FSL_SA=
I_CSR_SR,
>> +                                       FSL_SAI_CSR_SR);
>> +                       regmap_update_bits(sai->regmap,
>> +                                       FSL_SAI_xCSR(tx, ofs), FSL_SA=
I_CSR_SR,
>> +                                       0);
>> +               }
>
> Which platform are you using?  and please add chip info in your commit
> message.

It's an imx8mm. I'll add that to the commit message.

> This change can be moved to fsl_sai_config_disable(). that is:
>
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -798,18 +798,16 @@ static void fsl_sai_config_disable(struct
> fsl_sai *sai, int dir)
>                            FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
>
>         /*
> -        * For sai master mode, after several open/close sai,
> +        * For sai master/slave mode, after several open/close sai,
>          * there will be no frame clock, and can't recover
>          * anymore. Add software reset to fix this issue.
>          * This is a hardware bug, and will be fix in the
>          * next sai version.
>          */
> -       if (!sai->is_consumer_mode[tx]) {
> -               /* Software Reset */
> -               regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs),
> FSL_SAI_CSR_SR);
> -               /* Clear SR bit to finish the reset */
> -               regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
> -       }
> +       /* Software Reset */
> +       regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_S=
R);
> +       /* Clear SR bit to finish the reset */
> +       regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
>  }
>
> Could you please try the above change to also work for your case?

Ah, I should've spotted that! Yes, doing it this way works just fine. Up=
dated patch incoming.

Thank you,
Arun

