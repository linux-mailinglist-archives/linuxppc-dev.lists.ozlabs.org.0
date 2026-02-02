Return-Path: <linuxppc-dev+bounces-16506-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLkzGAhygGkw8QIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16506-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 10:44:40 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6F5CA3D7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 10:44:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4MCS2T9kz30BR;
	Mon, 02 Feb 2026 20:44:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1036" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770025476;
	cv=pass; b=Yu4+AYX9XjgWDfzxG8iP8cXL4FKlUbxGgVmRHw/VSJkbKVIl2dEw6cP8kk7YaFkRVJxV1xmd1R7sk+Wznpee4JWw4ndFj8HMcl6u5PiESRaDBrNKyBoyqUGhxx8Z+Wqrs6vz1KBBE6jUB99hLbEQ86C4N76zbmQzngdhaqggQRYVXVuwxvdc4J8gfy/R0VFxKKlbDj3c6m1d+l+mdVPdewE3xLqRrWYx0kYlDmR4KjGGSNWH9r7yl9rrHGwJRWqO0ifzTTELwL3/Py6ahkbf2IyERXeh/xpSpGx2WZX4p9sa+RcoXNk5dZx8ErdobS9kOZqcVu5FpAmjoebWs8oYVg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770025476; c=relaxed/relaxed;
	bh=TAF2UH/s9XOKetfcQpOwLtcTNJG8Fm6zI5indZbLJnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GfKwfwQeCqEy4pYMSuwGtT0naBaIKbcrt46UtExRhnuJVcBYDfh87fmn6Y7lU2o/6bQUkGhKRnsgsgWl0Yox6e0j2Y1u7rWnHLoEwwOaPKLrfQZpROaMOfSz6to3jyJxiCbUaZoXZkALJN0dNVyB2yKefMfXYo5lCbzy1WxnDqdqJELYASjbPl6Mf3L3hkZJPM/JnCJbeCZ9mH4bTcF0uNoisAP9MheCWmasVgzQNYXEDslrHJE9v9fj20ETU4O2rStKhJrWHmQB/R0k+11ZHbyXp5hvJIUQZoa4GytPnVyDg3mX55LuCdbMKbIjJoyMM+v5w9K7aj8R4ZpV5XQESg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZFTdeoY/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZFTdeoY/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4MCQ5jhrz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Feb 2026 20:44:33 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-34be2be4b7cso2154229a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Feb 2026 01:44:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770025470; cv=none;
        d=google.com; s=arc-20240605;
        b=k3v75JLtPlmZq3Q79XwTkuQxdGGsg4VlBUE0IV6s48wJODHRSJsA+6sOeAjHtP4f4o
         ZP12uFiYp+D44s91LNxCK9nqVYtGqTnwxkACHe9CPVibB38w/X5cSNyMcDcyq7nD1KIi
         Z5d0IkcY9ea3O5CmAWYNgbL2h0ViZ5fy8rECl9HpcQNwfJUX/3PE0uljCjOu08DGF6Jg
         eEB/L+uFJM4RdmQY4XnFq7CJ1rC089wFiDbh0PlqRzfHZkmIHwsGY6fnFt/f8eA7E09T
         uEl6aTIYuLezS45J2FP36ZIkHFQhBI3xhl1DsB/dIFqhUNDkL5QVHs/U7GTaPlusuKSZ
         /5SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TAF2UH/s9XOKetfcQpOwLtcTNJG8Fm6zI5indZbLJnA=;
        fh=HmnIIVVGi0ENG2GtGHGMW1OSsJxHBtdhA+9lnA/M1Ts=;
        b=T/cNvviC8byMahCbwpeQxtIThuyYvOYrFa5W+5651c1O6e7KlYRSubD7oOtz8Jrn/T
         Je52DWL/J0q4irrA144X6AxPetbvf3/m5brt6h7Zh/yYmtWTrwYPxno/CefEU+H/9fq2
         MSoH5+uHmlw2bKc72ywVBWZ4gdNEun152BpgX3uD2DrX3KHPECzMhDcsPl02uu6QeRRk
         Bb6rof4m6kAYMbKbe+is4wwcfzfCWEzbzOgT4Th0ctv05KAAQn9CkI8FwG6mKlzC34y6
         xnR1QPtcS8DcHqy2phGx4Kcp/mPkbY+pNjsxOSuLToydhcC8SXsYL24bwBcAUQ0IPEsp
         AAGA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770025470; x=1770630270; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAF2UH/s9XOKetfcQpOwLtcTNJG8Fm6zI5indZbLJnA=;
        b=ZFTdeoY/O5dbDS+MQ2uUo1TeCPSaDlcNg1tFlZEgnvgn5y/HwWdXmMgrRaTGQ0gnfu
         Beu3nS/1CZSfSsWyNNHJkqq9jd0Z1wxwVLLmChRlnGkoxIDr+HAwy9YMPwWNIP2D+2Zh
         TPJvd0lFbTJU92GtKan5LxnDO1HwCKK2hP2a0vBR4fnefK+ox84WD1y0XIpqGM0X7WNS
         2w4yaxr7Ujf+a4KCdvenfkZ89daP+On7zIxYGia0/HTBuW7XoeaOl9BIX3UmYu07LPn7
         zDbhpON6AtDLaOnNB16b//PyaS2dlog1UQmPKaEV5hcYas6Aexa78W28M/TIr7BvSGJe
         yEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770025470; x=1770630270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TAF2UH/s9XOKetfcQpOwLtcTNJG8Fm6zI5indZbLJnA=;
        b=S1YIoLh0k3m0buMC7ApF+FaDQF8ckyliSRsIasfeaPLCp4bSi/ebqnurpDFtknG2/U
         PfGjT1cGMjyRp+HrvqiyGul4hvjq8Hz82ZT4C5KaPB3j7vgeUgMx1eRZPffzVt78PC/b
         SjpKgPFMjEY3PtPNlhCx7HOtYpzK+pv+DKa3U4IkAIP56fHtZqIK5t6FoUlhLsKLaleL
         YiXW6G1Vwetq8rT6/Zdd0sqZmednPUMTWCls78PiXM8Tm9LWWjS9+ahoIKk+v8v4am/m
         VNPb+iB2Dn3tXpj3EofDH+Pp4ByTdTF9HLfSeko/v6xLluCdl6V+KyuKKm1YON8J6fv3
         R7uw==
X-Forwarded-Encrypted: i=1; AJvYcCWDAfCzS1bf3pKOg2ezAzoRWSBXtZ2DcZ9/Qa8ofpSKIF7mk2Hydz7mEh0xKxrRS4C5P2q6+B5CVhkr/GQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxkSUs6LF6jtVzCjX+x50l1bnleidK13XB/ps7LspjOPD6r06AX
	WidM1+1+Ivu+vCrr0gF3WvihbsLDOCOUjR/CtgfkiV9xyumiLqcwVw3RGyw/sYAk5l2IFFsLuqJ
	vbOr3EyV6fLCQ+imfbt6LpttO68DgGOE=
X-Gm-Gg: AZuq6aLEsfG5ADGH9shYOL9Q9Y08x4XCvlwR3YWVowsQkwH9eOZdUeHdNNilMZ2qbxm
	2peXodxgqb/Z+oTyKyO9kp6otPqETNlsg1UhuKpV7whEH0Agc5xVCpmZTaBEHpLRKp1s40gbKuL
	Otqb+O+fZ+WOA0Rvu7NbwjAPMnHNJXaGSy5FX+nV+ktPDj10QveZWlIIl6saSmQ/e0VM7KuDnW9
	0rx1FhWL8r2qEzHF7Ls+IwR2bmN5gbQ1sdkLcjtPbJrqjB4km935CbcKz3RYSrwWFNK4QvFgDm1
	knhepQ==
X-Received: by 2002:a17:90a:e704:b0:340:f7d6:dc70 with SMTP id
 98e67ed59e1d1-3543b32db3cmr10551164a91.13.1770025470178; Mon, 02 Feb 2026
 01:44:30 -0800 (PST)
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
References: <20260130054330.3462544-1-shengjiu.wang@nxp.com>
 <20260130054330.3462544-4-shengjiu.wang@nxp.com> <aXzDlScEXfmUys32@lizhi-Precision-Tower-5810>
In-Reply-To: <aXzDlScEXfmUys32@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 2 Feb 2026 17:44:16 +0800
X-Gm-Features: AZwV_QgU5fRT0_5Q6bzl-9D65zjMNMGvATERP1AuFCLfH7W34TynL2XUXVAiodw
Message-ID: <CAA+D8ANrW0N7Sjbat_LN3d8UbcuN-=DOKjfF0XncgqqM62rCMg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] ASoC: fsl_asrc_m2m: Start ASRC before DMA device
 for M2M
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
	TAGGED_FROM(0.00)[bounces-16506-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: DA6F5CA3D7
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 10:43=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Jan 30, 2026 at 01:43:29PM +0800, Shengjiu Wang wrote:
> > There is a limitation on i.MX952 that dma request is not cleared at the
> > end of conversion with dma slave mode. Which causes sample is dropped
> > from the input fifo on the second time if dma is triggered before the
> > client device and EDMA may copy wrong data from output fifo as the outp=
ut
> > fifo is not ready in the beginning.
> >
> > So need to trigger asrc before dma on i.MX952, and add delay to wait
> > output data is generated then start the EDMA for output, otherwise the
> > m2m function has noise issues.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_asrc.c        | 25 +++++++++++++++++++++++++
> >  sound/soc/fsl/fsl_asrc.h        |  2 ++
> >  sound/soc/fsl/fsl_asrc_common.h |  4 ++++
> >  sound/soc/fsl/fsl_asrc_m2m.c    | 29 +++++++++++++++++++++--------
> >  4 files changed, 52 insertions(+), 8 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > index 5846a2b1f73c..2374577c13f9 100644
> > --- a/sound/soc/fsl/fsl_asrc.c
> > +++ b/sound/soc/fsl/fsl_asrc.c
> > @@ -1084,6 +1084,28 @@ static unsigned int fsl_asrc_get_output_fifo_siz=
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
> > +
> > +     /* Check output fifo status if it exceeds the watermark. */
> > +     do {
> > +             regmap_read(asrc->regmap, REG_ASRFST(index), &val);
> > +             val &=3D ASRFSTi_OUTPUT_FIFO_MASK;
> > +             val =3D val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
> > +     } while (val < ASRC_M2M_OUTPUTFIFO_WML && --retry);
>
> use regmap_read_poll_timeout()

Ok, will update it.

>
> > +
> > +     if (!retry) {
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
> > @@ -1281,6 +1303,7 @@ static int fsl_asrc_probe(struct platform_device =
*pdev)
> >
> >       asrc_priv->soc =3D of_device_get_match_data(&pdev->dev);
> >       asrc->use_edma =3D asrc_priv->soc->use_edma;
> > +     asrc->start_before_dma =3D asrc_priv->soc->start_before_dma;
> >       asrc->get_dma_channel =3D fsl_asrc_get_dma_channel;
> >       asrc->request_pair =3D fsl_asrc_request_pair;
> >       asrc->release_pair =3D fsl_asrc_release_pair;
> > @@ -1295,6 +1318,7 @@ static int fsl_asrc_probe(struct platform_device =
*pdev)
> >       asrc->m2m_get_maxburst =3D fsl_asrc_m2m_get_maxburst;
> >       asrc->m2m_pair_resume =3D fsl_asrc_m2m_pair_resume;
> >       asrc->m2m_get_cap =3D fsl_asrc_m2m_get_cap;
> > +     asrc->m2m_output_ready =3D fsl_asrc_m2m_output_ready;
> >
> >       if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
> >               asrc_priv->clk_map[IN] =3D input_clk_map_imx35;
> > @@ -1565,6 +1589,7 @@ static const struct fsl_asrc_soc_data fsl_asrc_im=
x8qxp_data =3D {
> >  static const struct fsl_asrc_soc_data fsl_asrc_imx952_data =3D {
> >       .use_edma =3D true,
> >       .channel_bits =3D 4,
> > +     .start_before_dma =3D true,
> >  };
> >
> >  static const struct of_device_id fsl_asrc_ids[] =3D {
> > diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
> > index 2f67b085de24..1be93148a879 100644
> > --- a/sound/soc/fsl/fsl_asrc.h
> > +++ b/sound/soc/fsl/fsl_asrc.h
> > @@ -446,10 +446,12 @@ struct dma_block {
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
> > index f46881f71e43..296e13a16490 100644
> > --- a/sound/soc/fsl/fsl_asrc_m2m.c
> > +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> > @@ -253,15 +253,28 @@ static int asrc_m2m_device_run(struct fsl_asrc_pa=
ir *pair, struct snd_compr_task
> >       reinit_completion(&pair->complete[IN]);
> >       reinit_completion(&pair->complete[OUT]);
> >
> > -     /* Submit DMA request */
> > -     dmaengine_submit(pair->desc[IN]);
> > -     dma_async_issue_pending(pair->desc[IN]->chan);
> > -     if (out_dma_len > 0) {
> > -             dmaengine_submit(pair->desc[OUT]);
> > -             dma_async_issue_pending(pair->desc[OUT]->chan);
> > -     }
> > +     if (asrc->start_before_dma) {
> > +             asrc->m2m_start(pair);
> > +             /* Submit DMA request */
> > +             dmaengine_submit(pair->desc[IN]);
> > +             dma_async_issue_pending(pair->desc[IN]->chan);
> > +             if (out_dma_len > 0) {
> > +                     if (asrc->m2m_output_ready)
> > +                             asrc->m2m_output_ready(pair);
> > +                     dmaengine_submit(pair->desc[OUT]);
> > +                     dma_async_issue_pending(pair->desc[OUT]->chan);
> > +             }
> > +     } else {
> > +             /* Submit DMA request */
> > +             dmaengine_submit(pair->desc[IN]);
> > +             dma_async_issue_pending(pair->desc[IN]->chan);
> > +             if (out_dma_len > 0) {
> > +                     dmaengine_submit(pair->desc[OUT]);
> > +                     dma_async_issue_pending(pair->desc[OUT]->chan);
> > +             }
> >
> > -     asrc->m2m_start(pair);
> > +             asrc->m2m_start(pair);
> > +     }
>
> if really like start_before_dma, move common part no change
>
>         if (start_before_dma)
>                 asrc->m2m_start(pair);
>
>         ....
>
>         if (!start_before_dma)
>                 asrc->m2m_start(pair);

Ok, will update it.

best regards
Shengjiu Wang
>
> Frank
> >
> >       if (!wait_for_completion_interruptible_timeout(&pair->complete[IN=
], 10 * HZ)) {
> >               dev_err(dev, "out DMA task timeout\n");
> > --
> > 2.34.1
> >

