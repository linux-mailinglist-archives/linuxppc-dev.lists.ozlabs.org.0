Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24415176DBE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 05:01:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WjxK1KJbzDqg8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 15:01:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oRT8HZ4B; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WjvQ2F5xzDqKT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 14:59:45 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id i14so1791674qtv.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 19:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fvgiEL+QVxL1O0iuln0ifrtO9JeYp774TkUNa+6Pqoo=;
 b=oRT8HZ4B32/7utrig5nxukRcBp2kXL+RB7l6+X9X21Z/lE1ng0lir/2XnCN4MCNCL/
 JCs+4EUTPXdEdohoncGhgZqyiZqG5StxthdVvUsRlip4ttwbFnATHlA+0ivVzJ98ojAQ
 etVMYVwNN7kp/A+P/eYeqexBN4sWYR0yfSxguyzTQG1EhWJdw4iRlCK7sIud2Lthti89
 Zuo/HkGECwJlpBAV4fXexo/XYscKNWFwieSqQ49/DIMqu7XmrjH3AMeI6QVVDMguhKKz
 71NuaFosTdSaKOq6pav7EEC9eGWRitBjA0RGj7UMjPCGezvoauU4Wy4VAvwjAe5K/rs2
 NUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fvgiEL+QVxL1O0iuln0ifrtO9JeYp774TkUNa+6Pqoo=;
 b=TfKNwLRYuFUsia+wdEp2BqfhkLzDWi6zdrnoqy6zDXcvqZ5E+VE8E0IWShy/lKTU8j
 mcM9kID/CuLq+E5TkGQToUJSvm18uqjoNucWAzihsqep8c2tfayxgV7P4qPPI0M92QI7
 rJVOgTsVKMvWyFPqRo6FcSNb0ut0a+rYgx/WJBBX9O29BgDK8zf4XjvdQDv1/sJu5MMB
 scVV61kPDIyTh+yKQ8u6uGv/ObEwGJzIBhzZwXQHhj14m9GlusDW5IoRww9jfX0ISS/C
 7i8jTmtCm/xWgvFgTsxFto5g8sRlnDopW6neb/kMZogHtj/RO91nWtQ2kw+/QkwJrXuo
 QO/Q==
X-Gm-Message-State: ANhLgQ3hM7+vtS8AA/SgCofg5czZIcjsEnZKsslXrjBqRVt86z17rlPQ
 1a3TYD6WyzsRH9ZCINBPzFplTQoOZE2W2joUgtE=
X-Google-Smtp-Source: ADFU+vv2FItiQhj89T5uuRfiab6WkfDHcosumKkrglL71peu+YE/jk0AhS8fXeo7PG4qPrc7PTpI+QkNhWhZ/+gdSNI=
X-Received: by 2002:ac8:518a:: with SMTP id c10mr2808979qtn.360.1583207982044; 
 Mon, 02 Mar 2020 19:59:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1583039752.git.shengjiu.wang@nxp.com>
 <872c2e1082de6348318e14ccd31884d62355c282.1583039752.git.shengjiu.wang@nxp.com>
 <20200303014133.GA24596@bogus>
In-Reply-To: <20200303014133.GA24596@bogus>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 3 Mar 2020 11:59:30 +0800
Message-ID: <CAA+D8ANgECaz=tRtRwNP=jMXBD0XciAE0HUYROH8uuo03iDejg@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] ASoC: dt-bindings: fsl_asrc: Change asrc-width to
 asrc-format
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, shawnguo@kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-imx@nxp.com, kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

On Tue, Mar 3, 2020 at 9:43 AM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Mar 01, 2020 at 01:24:12PM +0800, Shengjiu Wang wrote:
> > asrc_format is more inteligent, which is align with the alsa
> > definition snd_pcm_format_t, we don't need to convert it to
> > format in driver, and it can distinguish S24_LE & S24_3LE.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > index cb9a25165503..0cbb86c026d5 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > +++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > @@ -38,7 +38,9 @@ Required properties:
> >
> >     - fsl,asrc-rate   : Defines a mutual sample rate used by DPCM Back Ends.
> >
> > -   - fsl,asrc-width  : Defines a mutual sample width used by DPCM Back Ends.
> > +   - fsl,asrc-format : Defines a mutual sample format used by DPCM Back
> > +                       Ends. The value is one of SNDRV_PCM_FORMAT_XX in
> > +                       "include/uapi/sound/asound.h"
>
> You can't just change properties. They are an ABI.

I have updated all the things related with this ABI in this patch series.
What else should I do?

Best regards
Wang Shengjiu
