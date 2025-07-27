Return-Path: <linuxppc-dev+bounces-10416-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA8DB1309E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Jul 2025 18:30:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bqnCX59lGz30W9;
	Mon, 28 Jul 2025 02:30:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753633832;
	cv=none; b=iAoJrmlCNUtAFWOD8lvrBPryoiPEhud1PrNE8vkNrinhU32Q6GoeSYeqgwRJYfSVXZj12F6k4tO3B9YD617p052DGuIZheLHMhfHE8nb/z/qaFH3OT4THnn2OThvrTVG+swR9B/VDaALKTo6JDbExdhFWml6UCUMnkBYr9dU7zIQDZNvFmBy9l/CNxqbhhoIFdp5CNRuySrOISqFCXI91jBZ1cm75/wTNAlZL8MtqWEFa/mYFctY/qOccA5zmIfgzwPkedeFXTM3VPTvk2HW/ZpcYb72d9hO2dtMrWKp01SVfLQMEsvfQby8XuBCFbiCaUCOdYWABqWQ7BGlsdWi0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753633832; c=relaxed/relaxed;
	bh=nWvRmgF1O9iN3qF32r262RxuZuzmPLyZtASjmnOz2P8=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=DCEYE1YiWkyLXkviAK8hPGZJpd5HvBabh/PWbV7jxRo9y2F5vN2JdEzKqrDlzYeMYCjS2/2NPHqFbtZGHIrY5RSPSqE4B2r7KN0NciXmleTOwmS5GC8WoCYd9IkwvGCrtiAwkrlfdMtAzorvX2LYbJNG5SFOaXeuZpfMwPZ72pJtVFkntT/ncdtdPGcEcYmktXOcLvx5qr7Fi+L1ejC5m2x960fnwGzh/smcOU35Y8+p5LiKJBJRP9dHYIcInsST6a/ItEnvrEPiwSmYdP4Y81un8gVKulsck99J1tczUwFqhLSCUls1aqa2XoD9noJl123rCle/Tqz6YZrOO9zbqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=tY5OWATB; dkim-atps=neutral; spf=pass (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=tY5OWATB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 317 seconds by postgrey-1.37 at boromir; Mon, 28 Jul 2025 02:30:30 AEST
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bqnCV0GnCz2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jul 2025 02:30:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1753633825; x=1754238625; i=markus.elfring@web.de;
	bh=nWvRmgF1O9iN3qF32r262RxuZuzmPLyZtASjmnOz2P8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tY5OWATBsxajj4GYs23W009wYWSfYmZ9bgri7NDUKv0w/Ji8EPh5lXWBSt7AK6OM
	 j0lDMgZeyvdm44lZvn1owtg1/FtQdxrGQfjc/MmB6ea1JxfeGKUVQ17rCqn1ipf/I
	 opVkU7egq5oJ/V7n0Os4fg+pO4qoW8VYXpAXjLZXaR44KsngOVIdV8HUylxcUGihh
	 CzH3326sS3o252gNyC81RwiRk9C8oTkCLjtPwjJHSg84zi2hRdxwa7/k8Vc3Uuk6A
	 S//Vy5JjrGk3zcVkm0FhmmAhjzSWoIWSLElElk1k9AW6cJcssZAG6Ci3HmW3pPq3k
	 k2hi7hZwMQiXjbMOxw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.1]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MIc7N-1usSmY3FP3-004KLx; Sun, 27
 Jul 2025 18:24:55 +0200
Message-ID: <b107c2a6-bb56-4b15-bf0f-d9eca8163aa1@web.de>
Date: Sun, 27 Jul 2025 18:24:54 +0200
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
To: Salah Triki <salah.triki@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <aIH4t9Ekj8hn7EEk@pc>
Subject: Re: [PATCH] bus: fsl-mc: Check return value of
 platform_get_resource()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <aIH4t9Ekj8hn7EEk@pc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:94FTvMI+ksk/TrFczzDS89VeEXLm/i2dwJ11YOJ4RrEHwOsdIjI
 DbKmAxYpy7Il+w3Ybv0hm4RX0cBB5cV57+uTdrdydQTD8NELmz/uYiwqY3xCvP5TOSYAeQr
 dZDxp7eeiaILhbrkfG0CTieC+qB4R7QmD4Mjmuj0og0GqiDy9+tSyHc6KzphWxg+87N6pHp
 WZLpVLi+yjwRkOE1tOazw==
UI-OutboundReport: notjunk:1;M01:P0:0u/hAMW37OY=;jyNp9AexOM8ae2i3m+N5EVPLEaL
 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
 HT9LwjhFn
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> platform_get_resource() returns NULL in case of failure, so check its
> return value and propagate the error in order to prevent NULL pointer
> dereference.

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.16-rc7#n145


=E2=80=A6
> +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> @@ -1105,6 +1105,10 @@ static int fsl_mc_bus_probe(struct platform_devic=
e *pdev)
>  	 * Get physical address of MC portal for the root DPRC:
>  	 */
>  	plat_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +
> +	if (!plat_res)
> +		return -ENODEV;
=E2=80=A6

I suggest to omit a blank line before the if statement.

Regards,
Markus

