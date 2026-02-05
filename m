Return-Path: <linuxppc-dev+bounces-16608-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FjhNiQChGk+wwMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16608-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 03:36:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C42EE019
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 03:36:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f61Ys2h4Jz2yFb;
	Thu, 05 Feb 2026 13:36:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::531" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770258977;
	cv=pass; b=Rvduq4umxWsyDkoXZB9adWq0miRHEynR7ILS3eUMz78CA0SIZtSwJtLMW8sJdEHBYadIENBsKKmwtay5OYELn8kkk/pgfazkvbAcJy8fsIAAY3vY+js8rJ0fx5viyjAi3v4gL8ePpZDpTbu7EV5CaMvxrY45kHo0b3vi5vpLLC/T9j0vQxIy8+iHH3B8EUpblPSrIuqHmzoBdZ2CEqUNBTOzsY5tDl3Ik/pkUvxTLg8t9CJ9fizUml9lRpjQV+aTzeDnnCEkEOYKFrkT1rQiUQ+8Bv0/IHfNDCRhl7V1G1ZTfzzRkyLmbVkYXhlNakZgGn+b7mChyxD7oTjx/uL2eQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770258977; c=relaxed/relaxed;
	bh=HjF1oe/j6F+p4WP4e0eq4iSGoPJ70DW7/iIuXSYvlGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BwjLCJxqy6zqWRseS5Np4nRobaFc8p/PdlnUTuTmmyp0uNl82iBFl3T+Ph5WTkwFcfR7s/HNzRDWnSS3zhQDyU18O5YNvl5u2OdODZszpRceHrEqCBVL/4qtX4wD+er9zFEch4eHzRIzVUzc9nSjZRFf4jttD6IYvnLcGChsJXR4+B9eqel3YfsfbIKW/b8YDUXnWlKYD7qZDcGo1PTWW2PNxR5IzS0anw0zSEE7puEJ6LhTH9hy8JOh0vs2pHedG3ZryhaiXLq4kxM+JWlismrVPuzCEIZsr7+gqaqCdzXxXoa/4IiaIEwFK9qLPocuAEnJ69N+SnLfXDnEBVf7yw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J4/AEIOj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J4/AEIOj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f61Yr1mGVz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 13:36:15 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c6c444e89bcso104623a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 18:36:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770258974; cv=none;
        d=google.com; s=arc-20240605;
        b=lbXgdOjx+i8HH69jr7PGo4TgCYGa3r2J0j+Nx6gHdhGarYE0gfoLgjwd+OHBgrs5As
         pEajh50k5gmiZGRd+OVK9+xKQw5GH2/JDLIyNjICainmHycWChRZv9R1SPPX6An/RY7R
         sTqK1J6Zn7T98wC/Up8DomOZklvq+BzHOcFS0nJgk4iUjepmotNOWJIce5l6hJa37w5r
         jxk69DbODV3XLqUxeeUHbJKD7XKk7YB6JhsQp5Mi+ceSnSHMsIvbwkYGNa+CxahwkUS6
         cfY1p/yquco1tu/KtraDlVPFkRP2J2qzOuTPQODCwXD5JLvyf1yhgNs31OLtkjPHepOa
         W70A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HjF1oe/j6F+p4WP4e0eq4iSGoPJ70DW7/iIuXSYvlGc=;
        fh=dHFb0iRFdn7plL2GwOf/a9G1IgCip6DLrPtxhb0aa4U=;
        b=UWHKFCrCBlmh7OlMJPsOcPenaiFzlkU66YxWYXrLJxZD0MGX29Os7oWjJmmzxK927a
         uFNSnBfir1UrC3kZz43vOTC7KrXkm/R7dnRZm+lS0N32dODRumlkZL6UAMu/ESSN8wvf
         ky52EOyuxdoJ8lh4rMILSJnEe9sS5gQX2nJAgDdUPjq+f7JmRR7Cig5WL8qJVmjSh/JB
         0PxQ0huD9IDwoloNXY3RKnHrE+gmXBzeHu9WRN7ifHC8JhBFRjRM0aDB+w+XxAEztM33
         hKa8cFVGTZyhsKMU/sZtR2WXhDvy+eqpmQQDYBRORRzjBaAdkb55JfZMnxhDrYUdAfxC
         KJwg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770258974; x=1770863774; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjF1oe/j6F+p4WP4e0eq4iSGoPJ70DW7/iIuXSYvlGc=;
        b=J4/AEIOjU3UYiUJO+4jOy6Sk/NNrvUCtONrnlr/VeS+W1hIHif/VjImF1nlld9An48
         cMsBTX6FyehukyZp+W6rwQ+P9bySIE/jSD9NAUZOokdfAt9yEeN/MIU28eiFrxhNKhHc
         7SOk/y7QTyZHvUV3nj9YYZ7DKVEa/bo/gHnysAC4T0+QB9ldOM2tLNxuHdGLUiA8pq9d
         iwwyW6znT940VO2DlCAJ5qcUeQz8rdMeSe5S5V22orvtxnsMqXe10lnTpcNle/lYvnyK
         9X7msX1xda3vwSD8uHkhp4KVPuYjM4Rgg33xxK/Dzgagzd316BAJ6lUeyiidtuS/gAUS
         WyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770258974; x=1770863774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HjF1oe/j6F+p4WP4e0eq4iSGoPJ70DW7/iIuXSYvlGc=;
        b=Iv0IRQ0REHwZDk8rp/N12xkHPLypew8Q/Bq6aDR2Ca+vOAWhzIfRMeHdNwgY6WiiiC
         R10AtaWwDs69X+SclS8XziRAni5kjgJ9sVMEmTqY9293n+L5F3WoRmZEoMWsAdxYfJ3z
         rLUPI8SNgpRMyoYq4OW4zsvk5FFaQl6Tc4DmewR1hwLlYi+oRdkhmWvbqRxlwTuiafr2
         cXrmU+WTX9x2STNiaRgl0V5VfffVeYt6w65M0Uerc4hsGqeTlog3T2n36sXvoWJudfnK
         g3jlqEzKs/1aDJb5fbC6eHVgF/z1qUKIpxRCdHs+6/tfqLInvmbAGlQmiouKc/Ulo45J
         Hm3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDVrtABIjnaw3pifWFJE9OFtzzHEy3Ecqr9HoEOBn8aC5vel9gXbHJk3BdudF7NVSmZJ7kQOqNL2AoN3w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzkGDWiJAK9ylLrJQqrTXIcSaqps6f/EPWJB533uvT26AVZZk5K
	iweJRVZyFuGuvxw1pMSfJjG25o0xCcYCzqmMZe6cbZT8HXerif2orTGNfEx05wRBjpguYEhwcmv
	g0KQu9EPIQ8havblhAdj34xrSGCiieIY=
X-Gm-Gg: AZuq6aJc7iowboJCl8eMOszu0N7dxYaaJ54+esX8DO+zerXo7JC4skwOs/Z+6Fqu14K
	zA8iDuZrJvDbPWmyDVOYzbIDwbtqdlZGjfaDpHngFBjB0wB7KwDb/EUwXX0TJey50GguT4lzF0A
	eorsSDY2WiFdqcbenaCfcRTDfVdrX4yjsi/yW79DwNAD9VEU+SICElh+Ht1cwT9rM/4LuujxdCE
	0TZmLPewq4GlAXRU1zapcKtFgypJGKYaq6mgd2XGowwjzsYpp/BgY56zSj6waVox45n9TEhy+t/
	VxmUtQ==
X-Received: by 2002:a17:90b:3884:b0:340:4abf:391d with SMTP id
 98e67ed59e1d1-35487125d82mr4318915a91.16.1770258973498; Wed, 04 Feb 2026
 18:36:13 -0800 (PST)
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
 <CAA+D8APXwucOLhhnZF7ASPufWyQs4tbxtR46UFdpm=4wRyHOyA@mail.gmail.com> <aYN0CQbRwyYJDlJn@lizhi-Precision-Tower-5810>
In-Reply-To: <aYN0CQbRwyYJDlJn@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 5 Feb 2026 10:36:01 +0800
X-Gm-Features: AZwV_QgTCuKmUaXOlpjmbiCTEgTaxxVjxr1vFqJ32-N2ro_Vxt5AFFdiFJtKCnI
Message-ID: <CAA+D8AN_xej-DWHbWKMCwgZVVcW9N2mHrK=4GUyoRiGLXBAoTw@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16608-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,mail.gmail.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: E9C42EE019
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 12:30=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Feb 04, 2026 at 09:41:55AM +0800, Shengjiu Wang wrote:
> > On Wed, Feb 4, 2026 at 1:53=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrot=
e:
> > >
> > > On Tue, Feb 03, 2026 at 11:13:43AM +0800, Shengjiu Wang wrote:
> > > > There is a limitation on i.MX952 that dma request is not cleared at=
 the
> > > > end of conversion with dma slave mode. Which causes sample is dropp=
ed
> > > > from the input fifo on the second time if dma is triggered before t=
he
> > > > client device and EDMA may copy wrong data from output fifo as the =
output
> > > > fifo is not ready in the beginning.
> > > >
> > > > The solution is to trigger asrc before dma on i.MX952, and add dela=
y to
> > > > wait output data is generated then start the EDMA for output, other=
wise
> > > > the m2m function has noise issues.
> > > >
> > > > So add an option to start ASRC first for M2M before ASRC is enabled=
 on
> > > > i.MX952.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > >  sound/soc/fsl/fsl_asrc.c        | 23 +++++++++++++++++++++++
> > > >  sound/soc/fsl/fsl_asrc.h        |  4 ++++
> > > >  sound/soc/fsl/fsl_asrc_common.h |  4 ++++
> > > >  sound/soc/fsl/fsl_asrc_m2m.c    |  8 +++++++-
> > > >  4 files changed, 38 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > > > index 92fb16f7be45..b6d4f1e09e2e 100644
> > > > --- a/sound/soc/fsl/fsl_asrc.c
> > > > +++ b/sound/soc/fsl/fsl_asrc.c
> > > > @@ -1078,6 +1078,27 @@ static unsigned int fsl_asrc_get_output_fifo=
_size(struct fsl_asrc_pair *pair)
> > > >       return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
> > > >  }
> > > >
> > > > +static bool fsl_asrc_m2m_output_ready(struct fsl_asrc_pair *pair)
> > > > +{
> > > > +     struct fsl_asrc *asrc =3D pair->asrc;
> > > > +     enum asrc_pair_index index =3D pair->index;
> > > > +     int retry =3D 1000;
> > > > +     u32 val;
> > > > +     int ret;
> > > > +
> > > > +     /* Check output fifo status if it exceeds the watermark. */
> > > > +     ret =3D regmap_read_poll_timeout(asrc->regmap, REG_ASRFST(ind=
ex), val,
> > > > +                                    (ASRFSTi_OUTPUT_FIFO_FILL(val)=
 >=3D ASRC_M2M_OUTPUTFIFO_WML) ||
> > > > +                                    (--retry =3D=3D 0), 0, USEC_PE=
R_SEC);
> > >
> > > are sure need "retry"? there are timeout, which should be equal to 'r=
etry'.
> >
> > Yes, "retry" is what I want, timeout is not what I expected.
>
> Okay, but it will be strange. you polling a register, you suppose it will
> be finished below 1000 IO read, which is certain time in SoC, for example
> 1ms. Compare to timeout us value, 1000 is hard to understand why you choo=
se
> this value.

It can be removed by reducing the timeout time.
will update in the next version.

best regards
Shengjiu Wang

>
> Frank
> >
> > Best regards
> > Shengjiu Wang
> >
> > >
> > > Frank
> > > > +
> > > > +     if (ret || !retry) {
> > > > +             pair_warn("output is not ready\n");
> > > > +             return false;
> > > > +     }
> > > > +
> > > > +     return true;
> > > > +}
> > > > +
> > > >  static int fsl_asrc_m2m_prepare(struct fsl_asrc_pair *pair)
> > > >  {
> > > >       struct fsl_asrc_pair_priv *pair_priv =3D pair->private;
> > > > @@ -1275,6 +1296,7 @@ static int fsl_asrc_probe(struct platform_dev=
ice *pdev)
> > > >
> > > >       asrc_priv->soc =3D of_device_get_match_data(&pdev->dev);
> > > >       asrc->use_edma =3D asrc_priv->soc->use_edma;
> > > > +     asrc->start_before_dma =3D asrc_priv->soc->start_before_dma;
> > > >       asrc->get_dma_channel =3D fsl_asrc_get_dma_channel;
> > > >       asrc->request_pair =3D fsl_asrc_request_pair;
> > > >       asrc->release_pair =3D fsl_asrc_release_pair;
> > > > @@ -1289,6 +1311,7 @@ static int fsl_asrc_probe(struct platform_dev=
ice *pdev)
> > > >       asrc->m2m_get_maxburst =3D fsl_asrc_m2m_get_maxburst;
> > > >       asrc->m2m_pair_resume =3D fsl_asrc_m2m_pair_resume;
> > > >       asrc->m2m_get_cap =3D fsl_asrc_m2m_get_cap;
> > > > +     asrc->m2m_output_ready =3D fsl_asrc_m2m_output_ready;
> > > >
> > > >       if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
> > > >               asrc_priv->clk_map[IN] =3D input_clk_map_imx35;
> > > > diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
> > > > index 1c492eb237f5..60b6865ca952 100644
> > > > --- a/sound/soc/fsl/fsl_asrc.h
> > > > +++ b/sound/soc/fsl/fsl_asrc.h
> > > > @@ -257,6 +257,8 @@
> > > >  #define ASRFSTi_OUTPUT_FIFO_WIDTH    7
> > > >  #define ASRFSTi_OUTPUT_FIFO_SHIFT    12
> > > >  #define ASRFSTi_OUTPUT_FIFO_MASK     (((1 << ASRFSTi_OUTPUT_FIFO_W=
IDTH) - 1) << ASRFSTi_OUTPUT_FIFO_SHIFT)
> > > > +#define ASRFSTi_OUTPUT_FIFO_FILL(v)  \
> > > > +     (((v) & ASRFSTi_OUTPUT_FIFO_MASK) >> ASRFSTi_OUTPUT_FIFO_SHIF=
T)
> > > >  #define ASRFSTi_IAEi_SHIFT           11
> > > >  #define ASRFSTi_IAEi_MASK            (1 << ASRFSTi_IAEi_SHIFT)
> > > >  #define ASRFSTi_IAEi                 (1 << ASRFSTi_IAEi_SHIFT)
> > > > @@ -432,10 +434,12 @@ struct dma_block {
> > > >   *
> > > >   * @use_edma: using edma as dma device or not
> > > >   * @channel_bits: width of ASRCNCR register for each pair
> > > > + * @start_before_dma: start asrc before dma
> > > >   */
> > > >  struct fsl_asrc_soc_data {
> > > >       bool use_edma;
> > > >       unsigned int channel_bits;
> > > > +     bool start_before_dma;
> > > >  };
> > > >
> > > >  /**
> > > > diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_as=
rc_common.h
> > > > index 0cd595b0f629..c8a1a2b5915d 100644
> > > > --- a/sound/soc/fsl/fsl_asrc_common.h
> > > > +++ b/sound/soc/fsl/fsl_asrc_common.h
> > > > @@ -107,6 +107,7 @@ struct fsl_asrc_pair {
> > > >   * @asrc_rate: default sample rate for ASoC Back-Ends
> > > >   * @asrc_format: default sample format for ASoC Back-Ends
> > > >   * @use_edma: edma is used
> > > > + * @start_before_dma: start asrc before dma
> > > >   * @get_dma_channel: function pointer
> > > >   * @request_pair: function pointer
> > > >   * @release_pair: function pointer
> > > > @@ -116,6 +117,7 @@ struct fsl_asrc_pair {
> > > >   * @m2m_start: function pointer
> > > >   * @m2m_unprepare: function pointer
> > > >   * @m2m_stop: function pointer
> > > > + * @m2m_output_ready: function pointer, check output fifo ready or=
 not
> > > >   * @m2m_calc_out_len: function pointer
> > > >   * @m2m_get_maxburst: function pointer
> > > >   * @m2m_pair_suspend: function pointer
> > > > @@ -143,6 +145,7 @@ struct fsl_asrc {
> > > >       int asrc_rate;
> > > >       snd_pcm_format_t asrc_format;
> > > >       bool use_edma;
> > > > +     bool start_before_dma;
> > > >
> > > >       struct dma_chan *(*get_dma_channel)(struct fsl_asrc_pair *pai=
r, bool dir);
> > > >       int (*request_pair)(int channels, struct fsl_asrc_pair *pair)=
;
> > > > @@ -154,6 +157,7 @@ struct fsl_asrc {
> > > >       int (*m2m_start)(struct fsl_asrc_pair *pair);
> > > >       int (*m2m_unprepare)(struct fsl_asrc_pair *pair);
> > > >       int (*m2m_stop)(struct fsl_asrc_pair *pair);
> > > > +     bool (*m2m_output_ready)(struct fsl_asrc_pair *pair);
> > > >
> > > >       int (*m2m_calc_out_len)(struct fsl_asrc_pair *pair, int input=
_buffer_length);
> > > >       int (*m2m_get_maxburst)(u8 dir, struct fsl_asrc_pair *pair);
> > > > diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_=
m2m.c
> > > > index f46881f71e43..77999526dd9e 100644
> > > > --- a/sound/soc/fsl/fsl_asrc_m2m.c
> > > > +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> > > > @@ -253,15 +253,21 @@ static int asrc_m2m_device_run(struct fsl_asr=
c_pair *pair, struct snd_compr_task
> > > >       reinit_completion(&pair->complete[IN]);
> > > >       reinit_completion(&pair->complete[OUT]);
> > > >
> > > > +     if (asrc->start_before_dma)
> > > > +             asrc->m2m_start(pair);
> > > > +
> > > >       /* Submit DMA request */
> > > >       dmaengine_submit(pair->desc[IN]);
> > > >       dma_async_issue_pending(pair->desc[IN]->chan);
> > > >       if (out_dma_len > 0) {
> > > > +             if (asrc->start_before_dma && asrc->m2m_output_ready)
> > > > +                     asrc->m2m_output_ready(pair);
> > > >               dmaengine_submit(pair->desc[OUT]);
> > > >               dma_async_issue_pending(pair->desc[OUT]->chan);
> > > >       }
> > > >
> > > > -     asrc->m2m_start(pair);
> > > > +     if (!asrc->start_before_dma)
> > > > +             asrc->m2m_start(pair);
> > > >
> > > >       if (!wait_for_completion_interruptible_timeout(&pair->complet=
e[IN], 10 * HZ)) {
> > > >               dev_err(dev, "out DMA task timeout\n");
> > > > --
> > > > 2.34.1
> > > >

