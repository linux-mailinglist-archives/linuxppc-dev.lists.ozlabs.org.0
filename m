Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D668C1C66
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 04:28:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cYskUsT2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VbCV02NZGz3cVD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 12:28:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cYskUsT2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VbCTH54VGz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 12:27:30 +1000 (AEST)
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-7d9c2096c29so72461439f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2024 19:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715308046; x=1715912846; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJIg9+M0Tl5oWYiRO4lX+sJC4I6tROA3nCXlHyRlexU=;
        b=cYskUsT2gxClVxrYI75uwViRr6qaFbIl00juuWhYGDmzWAblObiN69TKlu0RUaAIsE
         SWwwZRi7CcTQFmCgEirjOpMa3Fvfai1oyuSi2e/ESkJD9sR+g5DXC8o2dvgHIj6X3JUi
         CtxMW/RUSaNXuJg2JVTZzB1Fpaji88QksRDjpncYolmIMdoG41mQziYM84dStc1lyrrf
         UDtogQiu64st7RbcCeCPExI3f+Lu9i7VQSTadwixNbwuVwFMAug+fYmOA6vXjpcbNsSg
         I+8BKduTXSQlOe2ZAvO5woEyfxYGUoL+qUU7G53WCoGfe1MTVFiND69lMD9m+nuOcFuq
         heGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715308046; x=1715912846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJIg9+M0Tl5oWYiRO4lX+sJC4I6tROA3nCXlHyRlexU=;
        b=cZqvRomvbQ66HdfwVQnCgmSZyLYF+C2xvGwNTa0jp7EDsSw7CKEafk4nkL4M1nRqtF
         1LtaRroQVnVYTBx4evY4swoOv8O6kKXg9tQV1R0jZvmG0xkJyCJySdt/7zqFffT7VdcY
         GHrSGmTurTJcP0Ni9Ghj4pfS2gwP+DsCjnlDlg1dRZwtLkGx826SMbuQmbwWtGFHperB
         OiTInq+9+pK+tpt423ap1xUa5kOjmH900UZ2ZvxdbwqGXfCNKm/dAc2rDUe1Raqvilbd
         bdniB9ydKcc5LWUCh+mL5ZQr4ls3wA46m9UtAINaV+A2KVApyzpS90NV2vteATKtQzT+
         UzPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCRMw5ZGWyEXq1PkqSn7i3qJMnmVd4OmS2GBDx0le7CinYmeULJ/eeEz6MTBqZIxYfer+AMXATuI57R886cxQQvUehwpBUodWoLl2T7Q==
X-Gm-Message-State: AOJu0Yyr4kCEFIa6C9uSCIDEN1dUoxf3vnsMCB4LxFtUtqYE/FufEKNz
	iw6BZDa0+29BPXbZ43kv1Kszx/us49cKRvF1oy0vzXN8Mx3sl8VguhM+NyLHZMWPcXDpG51QTgy
	OEM5F0lxygsrVeREGDrueQIbPZGY=
X-Google-Smtp-Source: AGHT+IHBDYC2n71XP7WOuLCEc5J/fR/L9KPq4RQs/MbDRpyTSl0Iy+I8EcqM5V65ejYgeqpob2OgmskIn0fzTVIGW24=
X-Received: by 2002:a05:6e02:1387:b0:36a:3f20:8cb with SMTP id
 e9e14a558f8ab-36cc14ae0dbmr18245525ab.18.1715308046371; Thu, 09 May 2024
 19:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <1715223460-32662-1-git-send-email-shengjiu.wang@nxp.com>
 <1715223460-32662-3-git-send-email-shengjiu.wang@nxp.com> <20240509-repurpose-dumping-156b57c25960@spud>
In-Reply-To: <20240509-repurpose-dumping-156b57c25960@spud>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 10 May 2024 10:27:15 +0800
Message-ID: <CAA+D8AOkDbj_QsF9VescuAfFjKcB8FnOXqwjXVrrBM1Ck4ut4Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: fsl,xcvr: Add two PLL clock sources
To: Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org, linux-sound@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 10, 2024 at 1:14=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, May 09, 2024 at 10:57:38AM +0800, Shengjiu Wang wrote:
> > Add two PLL clock sources, they are the parent clocks of the root clock
> > one is for 8kHz series rates, named as 'pll8k', another one is for
> > 11kHz series rates, named as 'pll11k'. They are optional clocks,
> > if there are such clocks, then the driver can switch between them to
> > support more accurate sample rates.
> >
> > As 'pll8k' and 'pll11k' are optional, then add 'minItems: 4' for
> > clocks and clock-names properties.
>
> Despite the detail given here in the commit message, the series this is
> appearing in and one of the driver patches makes me a bit "suspicious"
> of this patch. Are these newly added clocks available on all devices, or
> just on the imx95, or?

These newly added clocks are only available for the imx95 XCVR.

Best regards
Shengjiu Wang
>
> Thanks,
> Conor.
>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/sound/fsl,xcvr.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Do=
cumentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > index 1c74a32def09..c4660faed404 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > @@ -50,6 +50,9 @@ properties:
> >        - description: PHY clock
> >        - description: SPBA clock
> >        - description: PLL clock
> > +      - description: PLL clock source for 8kHz series
> > +      - description: PLL clock source for 11kHz series
> > +    minItems: 4
> >
> >    clock-names:
> >      items:
> > @@ -57,6 +60,9 @@ properties:
> >        - const: phy
> >        - const: spba
> >        - const: pll_ipg
> > +      - const: pll8k
> > +      - const: pll11k
> > +    minItems: 4
> >
> >    dmas:
> >      items:
> > --
> > 2.34.1
> >
