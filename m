Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3D18C1C84
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 04:39:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Vr2sGVis;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VbCkw3GKKz3cZB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 12:39:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Vr2sGVis;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VbCkD29hzz30WP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 12:38:43 +1000 (AEST)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-36c926b3fc7so6330535ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2024 19:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715308721; x=1715913521; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+FQEvC344Cq4qFk7Z5iGhz/jJmHyyWFQPf8LCbmeGM=;
        b=Vr2sGVisv+3nyEDHYhnbwNKDgg7XJTErXirQnsYM5JPtN9re1ayzfnGqRKPHmgmw/6
         pvUT5scUYD2U/hsD+79fJ/hphPyCEZag8wBmqhwJjv+2q8I115jyjmY84FdafpqJP2vM
         QBiA9sjRBq2amRqG3PNshR/5ElgI5dgUszCZo0sWHrKIT/TfK1F37HGejk9sjvH6AywS
         qqZDclSjKO2Dp++r9wp3MQzVqVLEnDNVZwWRxMNLZFA83/2mB/gMiHPVLpaCV6oUaZDZ
         RI1susIoomm4V10yVG+GuclBPVJplOZ13Cen/mKdxxIOQ5w2JwK4JFh8LKpo8wh5rMKB
         OyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715308721; x=1715913521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+FQEvC344Cq4qFk7Z5iGhz/jJmHyyWFQPf8LCbmeGM=;
        b=u6Sv3Ngn4aJyGQhf/6VohV/CFEfZgofVOsr7At5owQ0cStCqQ83wvKS+ilHLiNCJ13
         toc7i7Woqjrp5G1XwNOYdcKmJ81xO+gcxVy4ykKVcG5mfOtfIHAWrJRVfqbQYyI8H2UK
         e3H60YpqgTMI51ixiXAsTEk+yHPPMS2CYIiAGEwNwdERY0KpOuANkywCKq64JeVexf4b
         SKzKkTuhu4ZKd0epesnELcZ3O8GKSQ22XO3cmKr6D47jKNtkCfnKxgGVpIsf5IVGrd/o
         fWmoxkmdmqfzubsPYWkLBvSbxijpoFZf5KipdDrRdQPtblISuIIDIwfmsgnyyB9+h7lF
         gZoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMQUtffQncqAAhn1sswHfy5m8SiPeRop3eFOWkQv2vSDq262p+A9nIxrY1ydI7SGI9jJ31LcXoeebY51ZkbRfmVffR5AUMLFx4YTuYaA==
X-Gm-Message-State: AOJu0YwwpBJ0Yj+J7hzUKJTLfyMl11Gt7zDIuMGEiM/Nm0IiNH6NYBWj
	6XF6e6jzp44zyYzz8Du0dgp9HMBOZ4iYgHGVbrT+/dJFNWAwZxukFNcDeOGCL4cmpkOtVJMq6rY
	GgNbiWWXCV4bRh5aNv+pjI/WDSvs=
X-Google-Smtp-Source: AGHT+IFA5hOZHgUdtXLvvH+1m+oDwQZM9Yg+0AcRzMwCh6Ow6b69t1K2O1QS7dF85eTT8GVCCff9RckTga5FTH0HhIE=
X-Received: by 2002:a05:6e02:12ce:b0:36a:2a57:9393 with SMTP id
 e9e14a558f8ab-36cc144b65dmr16566235ab.3.1715308721696; Thu, 09 May 2024
 19:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <1715223460-32662-1-git-send-email-shengjiu.wang@nxp.com>
 <1715223460-32662-3-git-send-email-shengjiu.wang@nxp.com> <20240509-repurpose-dumping-156b57c25960@spud>
 <CAA+D8AOkDbj_QsF9VescuAfFjKcB8FnOXqwjXVrrBM1Ck4ut4Q@mail.gmail.com>
In-Reply-To: <CAA+D8AOkDbj_QsF9VescuAfFjKcB8FnOXqwjXVrrBM1Ck4ut4Q@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 10 May 2024 10:38:30 +0800
Message-ID: <CAA+D8AOQtwHTLsQcqh_LCvVP5CWXqiHc3-at8jv3B-kA8ORR_w@mail.gmail.com>
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

On Fri, May 10, 2024 at 10:27=E2=80=AFAM Shengjiu Wang <shengjiu.wang@gmail=
.com> wrote:
>
> On Fri, May 10, 2024 at 1:14=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Thu, May 09, 2024 at 10:57:38AM +0800, Shengjiu Wang wrote:
> > > Add two PLL clock sources, they are the parent clocks of the root clo=
ck
> > > one is for 8kHz series rates, named as 'pll8k', another one is for
> > > 11kHz series rates, named as 'pll11k'. They are optional clocks,
> > > if there are such clocks, then the driver can switch between them to
> > > support more accurate sample rates.
> > >
> > > As 'pll8k' and 'pll11k' are optional, then add 'minItems: 4' for
> > > clocks and clock-names properties.
> >
> > Despite the detail given here in the commit message, the series this is
> > appearing in and one of the driver patches makes me a bit "suspicious"
> > of this patch. Are these newly added clocks available on all devices, o=
r
> > just on the imx95, or?
>
> These newly added clocks are only available for the imx95 XCVR.
>

Looks like I should merge patch1 & 2 together, patch 3 & 3 together. right?

Best regards
Shengjiu Wang

> Best regards
> Shengjiu Wang
> >
> > Thanks,
> > Conor.
> >
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/sound/fsl,xcvr.yaml | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/=
Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > > index 1c74a32def09..c4660faed404 100644
> > > --- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > > +++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > > @@ -50,6 +50,9 @@ properties:
> > >        - description: PHY clock
> > >        - description: SPBA clock
> > >        - description: PLL clock
> > > +      - description: PLL clock source for 8kHz series
> > > +      - description: PLL clock source for 11kHz series
> > > +    minItems: 4
> > >
> > >    clock-names:
> > >      items:
> > > @@ -57,6 +60,9 @@ properties:
> > >        - const: phy
> > >        - const: spba
> > >        - const: pll_ipg
> > > +      - const: pll8k
> > > +      - const: pll11k
> > > +    minItems: 4
> > >
> > >    dmas:
> > >      items:
> > > --
> > > 2.34.1
> > >
