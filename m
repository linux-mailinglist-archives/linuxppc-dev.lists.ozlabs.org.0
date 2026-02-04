Return-Path: <linuxppc-dev+bounces-16564-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJ6PG/ujgmlpXAMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16564-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 02:42:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D41E4E07E9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 02:42:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5NPy27jCz3bTf;
	Wed, 04 Feb 2026 12:42:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1033" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770169334;
	cv=pass; b=RQYmtJkaKbu7GkKm9Bvxg4BoS5QLAFcsQ5EIuTuJo9F1jv4Iz/L7bvnwgv6LinHn0UKt5UXHFCbitCgfduPAjIph3Dgpg6Zd54kE4I1WDBfx8k1ynjUAEwJcHVC117+gxpo0Za6mJA/gKxTeYdHAopb6xMwj87Mct9Rqzx+BUyMQNiEetf6Cb8X23zVDLYV5moayIIq5Zrqw4+EOQzk9CvHDY34NWOgtQMLYT9VLD9cxD327Pk9/M1HRaFWWIP667kGtirecdJVv5fPqE+Lb67iuwBeC8GYPMWQqFB6MsIrgRcUqojhGrFMN5zx2ZLeLmWrbd+oG9ysy90ZAMREz8g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770169334; c=relaxed/relaxed;
	bh=otKMp5rfnNzFq7n/nTMXUM2adMPBqwrYoSOvEkMyM3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cQoOtku9y3JgNfjaUaQibuNRchMDVA0mHPLHWN00nUQpbjE3E8DnZy0QxVABVHjrCb0ftO+FCLaioTcejuRoorw/SckKkTV3vgOzWjeVoT/k9mW4hdmwOa3HMb68TgegPfKqD6HzxR6D9KUsLwLKIDYHlP0xTuRB96OJ7mha9wdBJOdndsEisVcDiFnsVTqZkiaROOapHZgK6Ttf8o+0ILpsFbv+ol8SiRXg6YqD23agc60zQQnDujobQja55jE2P87Hpt6b0Gb9eI62iUvLQWRwgc1hMNtPpm2cJ3+JeOosmkI1hatTiFJxccR7ZaNtFYXm531eCnH/bBQ6p/SHew==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TaqRicb3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TaqRicb3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5NPx2FYnz30Sv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 12:42:12 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3530715386cso4667229a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Feb 2026 17:42:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770169330; cv=none;
        d=google.com; s=arc-20240605;
        b=dozW3TytcDWrEKJtg5NEHK/F5gygtfb+6Gg/jd0N3B23Fc3pI+LpW91Z9AIdUsZ58G
         +E2WnpJOegcZuTCv56IXOgiFWr/C4jOvh27/G7mmCJE3uMJK1UWr39mb6ijNElaUx7wG
         g8ICg0v4HKZYwa+66wPosysZX5fMA3im3dvG4Sdk9k4BZYVriFWklRy25EXEw6n4suKX
         RI8swCmTSZQWaXJfuRSRx3r5dHrTToyzobEnnDQTZd+a+fnM/e8i4GxsMYyY3XpSLvUW
         Sr/7o0JMnCse80pQnqekk6p4+ujNFm2d5K9DtE3SnFRHYWPLpANCanwyhNe2vrcy5rk0
         iAMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=otKMp5rfnNzFq7n/nTMXUM2adMPBqwrYoSOvEkMyM3M=;
        fh=B/quyaWWxrMB0NB7TeYuD6kuZTXnWiEgz4KCZZ0jTbc=;
        b=UlGzgY/fuzVmhwRXTtnlTMT6/jg4VdNyylm19eGKoein2mWVtDPl2RQXQZHW25Qy9W
         qgP+2nbbd9IVikGv9MNPidfcg7nlDJNDiHM+3t1SymuYKFpmuZ25TbIzTzUtWwXAaZV3
         Vf0SIML2AVYB6fCfYvhnRcjw++tUkKgfoufFf9iUv/s24tdl/bakisyNUZ5cCZv3E6Wa
         RSPzV7fPzZa5g+C7gVilL0U7GPC1mbjrm52FA4oRHBTNC7F4iQQMVFeEDonqJypffZfL
         tUAbkk2s9u6Q336GqM/UUE4CJA+y+XLYrF0cz6o0PGr5d+hZ5kQQ74yv6Yskz9MEKMi3
         s05Q==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770169330; x=1770774130; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otKMp5rfnNzFq7n/nTMXUM2adMPBqwrYoSOvEkMyM3M=;
        b=TaqRicb3PIItg85po/tWQEFdRZR8PYT0eOdOLzEFPx6HSBIc3SzQdn5phus5AGscyV
         zyuATWY13L3hFh0adw/AUMfKR4Uo+Xc9JokxvxxIHyuPBOF8rF1fYoKsWNeO+c0aLP5Z
         LoYDaGPlGNoLWZPzFrg4oko5SBPlzgxj+KNuXTFY+S4xM46vOws7pgImGY6ClA1qE4ZK
         fRF+Q9sWjMcG9ec3EHJdveldE0ZfYS7fncVvcEuiP7Ca5DMDjsl425yrpcA2VK7z5V5P
         VOBB9vDHhD9PGcFm+9gzZJ1/bTXudHl+zmUegaHms8xAphCissDvDjthbWICjSBbz7+8
         tLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770169330; x=1770774130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=otKMp5rfnNzFq7n/nTMXUM2adMPBqwrYoSOvEkMyM3M=;
        b=qZaRoINVGAuWxmeJm4TP5v69si/ztUIJoYeIX6jz8NKAvA1IAu5SeOXKL8+4eKt3pm
         2NUxYwUOPnygBJ1hzYvu5SrQi+YYEqh1eKH22PqbeL2vh+Qi/mtlZhcvWO/Rm/ppzJLJ
         ITcplo6fSwuq8uY2SbVCTBGIuornIWNsao5ilU/y8llx8zcqFGAblykGOco/MYAFq32S
         KTuuWKkcn7Pp9noIpvvaHlP8JDAvfT7Zh3LSVztvW0e4czSbsc0u8bYpQ5WPntoEdvNv
         6br30Pztu9yotxyfAZc7KPA/OrDL0mwmqghpUWx4FGIhSpuYxXGnYGQWIITizJ44E5CE
         zE5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCg6I8PlYJCRnMNziiNGcIcMEpCBs07sEDQNZxC5ZIzQSIwS3R1QJxs7d7G67mHT7A9J9uIkO2QpbNM08=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw6e9y1dU3h/4A3DRMEfq8JLOYmfsd1sySzV5+3ebw0qjSy2JTT
	lKpIDdpJr/RdWEggcH2rbGvB5Goj/sz+x5JX9rcTFsS+V+7By5ZMvL3XfRR83KqLKSV7aeqDGlx
	soPloGmEyLZG99bnln9VjFFHsjLFjLQk=
X-Gm-Gg: AZuq6aIcYBcOsYaxzp8DilrgQ9E98gI3HUpbtL1GfO9Qdo0Qxrh2iS8HLq/F2ao3c1F
	fja9eeLTz9wnGaVcdO2Go4HC1xuJv88X0Ux1Dn0SpVDDr5vq56X3ZcBdy9horoWDZ3GQJPYqgnk
	jVtpGMDdFNoDKaZBSml8C7gJgDApIAvsVId3zeSPrth/pFo023cOlX3LRvHxIDyJWLxc3/KwrDW
	vc7jEttcQm/c7wdw0/ns2/avy7QtxAEPYAt3RHkIETSjN27SI0glf30KDRKOL9JgaFoeek=
X-Received: by 2002:a17:90b:4b8c:b0:352:d168:fc4 with SMTP id
 98e67ed59e1d1-35487207d86mr997612a91.32.1770169330154; Tue, 03 Feb 2026
 17:42:10 -0800 (PST)
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
References: <20260203031345.3850533-1-shengjiu.wang@nxp.com>
 <20260203031345.3850533-3-shengjiu.wang@nxp.com> <aYI2KZE8/MGQ633A@lizhi-Precision-Tower-5810>
In-Reply-To: <aYI2KZE8/MGQ633A@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 4 Feb 2026 09:41:55 +0800
X-Gm-Features: AZwV_QiSHr0nHk0_0QYvmlQjWNW7hjgw-cP6U7VY4GcjLXalrmxQByJgfsR4Ri0
Message-ID: <CAA+D8APXwucOLhhnZF7ASPufWyQs4tbxtR46UFdpm=4wRyHOyA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] ASoC: fsl_asrc_m2m: Add option to start ASRC
 before DMA device for M2M
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16564-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[shengjiuwang@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Frank.li@nxp.com,m:shengjiu.wang@nxp.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiuwang@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,mail.gmail.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: D41E4E07E9
X-Rspamd-Action: no action

On Wed, Feb 4, 2026 at 1:53=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Feb 03, 2026 at 11:13:43AM +0800, Shengjiu Wang wrote:
> > There is a limitation on i.MX952 that dma request is not cleared at the
> > end of conversion with dma slave mode. Which causes sample is dropped
> > from the input fifo on the second time if dma is triggered before the
> > client device and EDMA may copy wrong data from output fifo as the outp=
ut
> > fifo is not ready in the beginning.
> >
> > The solution is to trigger asrc before dma on i.MX952, and add delay to
> > wait output data is generated then start the EDMA for output, otherwise
> > the m2m function has noise issues.
> >
> > So add an option to start ASRC first for M2M before ASRC is enabled on
> > i.MX952.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_asrc.c        | 23 +++++++++++++++++++++++
> >  sound/soc/fsl/fsl_asrc.h        |  4 ++++
> >  sound/soc/fsl/fsl_asrc_common.h |  4 ++++
> >  sound/soc/fsl/fsl_asrc_m2m.c    |  8 +++++++-
> >  4 files changed, 38 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > index 92fb16f7be45..b6d4f1e09e2e 100644
> > --- a/sound/soc/fsl/fsl_asrc.c
> > +++ b/sound/soc/fsl/fsl_asrc.c
> > @@ -1078,6 +1078,27 @@ static unsigned int fsl_asrc_get_output_fifo_siz=
e(struct fsl_asrc_pair *pair)
> >       return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
> >  }
> >
> > +static bool fsl_asrc_m2m_output_ready(struct fsl_asrc_pair *pair)
> > +{
> > +     struct fsl_asrc *asrc =3D pair->asrc;
> > +     enum asrc_pair_index index =3D pair->index;
> > +     int retry =3D 1000;
> > +     u32 val;
> > +     int ret;
> > +
> > +     /* Check output fifo status if it exceeds the watermark. */
> > +     ret =3D regmap_read_poll_timeout(asrc->regmap, REG_ASRFST(index),=
 val,
> > +                                    (ASRFSTi_OUTPUT_FIFO_FILL(val) >=
=3D ASRC_M2M_OUTPUTFIFO_WML) ||
> > +                                    (--retry =3D=3D 0), 0, USEC_PER_SE=
C);
>
> are sure need "retry"? there are timeout, which should be equal to 'retry=
'.

Yes, "retry" is what I want, timeout is not what I expected.

Best regards
Shengjiu Wang

>
> Frank
> > +
> > +     if (ret || !retry) {
> > +             pair_warn("output is not ready\n");
> > +             return false;
> > +     }
> > +
> > +     return true;
> > +}
> > +
> >  static int fsl_asrc_m2m_prepare(struct fsl_asrc_pair *pair)
> >  {
> >       struct fsl_asrc_pair_priv *pair_priv =3D pair->private;
> > @@ -1275,6 +1296,7 @@ static int fsl_asrc_probe(struct platform_device =
*pdev)
> >
> >       asrc_priv->soc =3D of_device_get_match_data(&pdev->dev);
> >       asrc->use_edma =3D asrc_priv->soc->use_edma;
> > +     asrc->start_before_dma =3D asrc_priv->soc->start_before_dma;
> >       asrc->get_dma_channel =3D fsl_asrc_get_dma_channel;
> >       asrc->request_pair =3D fsl_asrc_request_pair;
> >       asrc->release_pair =3D fsl_asrc_release_pair;
> > @@ -1289,6 +1311,7 @@ static int fsl_asrc_probe(struct platform_device =
*pdev)
> >       asrc->m2m_get_maxburst =3D fsl_asrc_m2m_get_maxburst;
> >       asrc->m2m_pair_resume =3D fsl_asrc_m2m_pair_resume;
> >       asrc->m2m_get_cap =3D fsl_asrc_m2m_get_cap;
> > +     asrc->m2m_output_ready =3D fsl_asrc_m2m_output_ready;
> >
> >       if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
> >               asrc_priv->clk_map[IN] =3D input_clk_map_imx35;
> > diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
> > index 1c492eb237f5..60b6865ca952 100644
> > --- a/sound/soc/fsl/fsl_asrc.h
> > +++ b/sound/soc/fsl/fsl_asrc.h
> > @@ -257,6 +257,8 @@
> >  #define ASRFSTi_OUTPUT_FIFO_WIDTH    7
> >  #define ASRFSTi_OUTPUT_FIFO_SHIFT    12
> >  #define ASRFSTi_OUTPUT_FIFO_MASK     (((1 << ASRFSTi_OUTPUT_FIFO_WIDTH=
) - 1) << ASRFSTi_OUTPUT_FIFO_SHIFT)
> > +#define ASRFSTi_OUTPUT_FIFO_FILL(v)  \
> > +     (((v) & ASRFSTi_OUTPUT_FIFO_MASK) >> ASRFSTi_OUTPUT_FIFO_SHIFT)
> >  #define ASRFSTi_IAEi_SHIFT           11
> >  #define ASRFSTi_IAEi_MASK            (1 << ASRFSTi_IAEi_SHIFT)
> >  #define ASRFSTi_IAEi                 (1 << ASRFSTi_IAEi_SHIFT)
> > @@ -432,10 +434,12 @@ struct dma_block {
> >   *
> >   * @use_edma: using edma as dma device or not
> >   * @channel_bits: width of ASRCNCR register for each pair
> > + * @start_before_dma: start asrc before dma
> >   */
> >  struct fsl_asrc_soc_data {
> >       bool use_edma;
> >       unsigned int channel_bits;
> > +     bool start_before_dma;
> >  };
> >
> >  /**
> > diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_c=
ommon.h
> > index 0cd595b0f629..c8a1a2b5915d 100644
> > --- a/sound/soc/fsl/fsl_asrc_common.h
> > +++ b/sound/soc/fsl/fsl_asrc_common.h
> > @@ -107,6 +107,7 @@ struct fsl_asrc_pair {
> >   * @asrc_rate: default sample rate for ASoC Back-Ends
> >   * @asrc_format: default sample format for ASoC Back-Ends
> >   * @use_edma: edma is used
> > + * @start_before_dma: start asrc before dma
> >   * @get_dma_channel: function pointer
> >   * @request_pair: function pointer
> >   * @release_pair: function pointer
> > @@ -116,6 +117,7 @@ struct fsl_asrc_pair {
> >   * @m2m_start: function pointer
> >   * @m2m_unprepare: function pointer
> >   * @m2m_stop: function pointer
> > + * @m2m_output_ready: function pointer, check output fifo ready or not
> >   * @m2m_calc_out_len: function pointer
> >   * @m2m_get_maxburst: function pointer
> >   * @m2m_pair_suspend: function pointer
> > @@ -143,6 +145,7 @@ struct fsl_asrc {
> >       int asrc_rate;
> >       snd_pcm_format_t asrc_format;
> >       bool use_edma;
> > +     bool start_before_dma;
> >
> >       struct dma_chan *(*get_dma_channel)(struct fsl_asrc_pair *pair, b=
ool dir);
> >       int (*request_pair)(int channels, struct fsl_asrc_pair *pair);
> > @@ -154,6 +157,7 @@ struct fsl_asrc {
> >       int (*m2m_start)(struct fsl_asrc_pair *pair);
> >       int (*m2m_unprepare)(struct fsl_asrc_pair *pair);
> >       int (*m2m_stop)(struct fsl_asrc_pair *pair);
> > +     bool (*m2m_output_ready)(struct fsl_asrc_pair *pair);
> >
> >       int (*m2m_calc_out_len)(struct fsl_asrc_pair *pair, int input_buf=
fer_length);
> >       int (*m2m_get_maxburst)(u8 dir, struct fsl_asrc_pair *pair);
> > diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.=
c
> > index f46881f71e43..77999526dd9e 100644
> > --- a/sound/soc/fsl/fsl_asrc_m2m.c
> > +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> > @@ -253,15 +253,21 @@ static int asrc_m2m_device_run(struct fsl_asrc_pa=
ir *pair, struct snd_compr_task
> >       reinit_completion(&pair->complete[IN]);
> >       reinit_completion(&pair->complete[OUT]);
> >
> > +     if (asrc->start_before_dma)
> > +             asrc->m2m_start(pair);
> > +
> >       /* Submit DMA request */
> >       dmaengine_submit(pair->desc[IN]);
> >       dma_async_issue_pending(pair->desc[IN]->chan);
> >       if (out_dma_len > 0) {
> > +             if (asrc->start_before_dma && asrc->m2m_output_ready)
> > +                     asrc->m2m_output_ready(pair);
> >               dmaengine_submit(pair->desc[OUT]);
> >               dma_async_issue_pending(pair->desc[OUT]->chan);
> >       }
> >
> > -     asrc->m2m_start(pair);
> > +     if (!asrc->start_before_dma)
> > +             asrc->m2m_start(pair);
> >
> >       if (!wait_for_completion_interruptible_timeout(&pair->complete[IN=
], 10 * HZ)) {
> >               dev_err(dev, "out DMA task timeout\n");
> > --
> > 2.34.1
> >

