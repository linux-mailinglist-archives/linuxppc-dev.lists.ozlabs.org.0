Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6478E17CB7F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 04:27:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Z8zq0HT2zDr5R
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 14:27:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.194;
 helo=mail-qk1-f194.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=V6CTG2Bc; dkim-atps=neutral
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Z8yN1q6xzDqys
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 14:25:47 +1100 (AEDT)
Received: by mail-qk1-f194.google.com with SMTP id u124so4287149qkh.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2020 19:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xx47FJX+QZbsjpJJ8x5FoZzQPuJdzEkyLKKPH7vo5sk=;
 b=V6CTG2BcTle4ax3VW2GMHUYNQikRPHCX4W8GrQB30I7oTu+yciihautJPRVRVjQ/Fc
 4kw1eamGfYWI+0JA2+f4WTC0j66nFLcnd99j+u/JabWCi3MKzZqlGYpUGHSL2uG7mtIF
 BfhUwv1spkZ3ujZfrr3fUBm8ngmoJQzhDuiHuJu/QP0GKueGBjshtLXt46XuOmZgKx/k
 JuhzFIkghSF56z6430kkDS6XYJ9RA+oqlafgd4aUUnS5t52RLf0rttvgMrL1JBERiRYX
 RpwRRbLrCwoL2EWUcYPnjqPBEq6rHC9UTbskZJ/gSdsjmpVPKgwIbE0mfl05KL3hJagt
 G8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xx47FJX+QZbsjpJJ8x5FoZzQPuJdzEkyLKKPH7vo5sk=;
 b=gvbkViBJOn9tdISJZ1HTuTx1V1yDi3UkT765u27SyH23vLyZGwsHwe5EyW98zMPXf+
 +2yvBZvsw41p8MyANrKjx5x/iWDytMnLO//M78NqGyKFZOdUlylNqc5x3wGZ3xF3u+rG
 EqYJ0moCI6zlrQdVpXWqFgwc0KLusXz4Y6T7qz26AelT0W2EF8uN1rNRDpX9wjloGJit
 cnAkViovYcQYxgroCAHyHV1Kld2LNki56Fb/dSL27Cf1IVSSGkPqU10fvtlL0lmbe8EX
 FFxxGC7DWBkjzfsQcC8h+iJIM4FqVeq+eZAPje5sGCmwPqwD/fPZrs/UCUsd2eKani66
 Dcyw==
X-Gm-Message-State: ANhLgQ3jMAH3xNvAw4xXZyWE2BGrWsM+7OfR8cKrfThYFUEs7JJjrFoM
 /BvIVHX9BMlFcE3Ix3kFFLwuNBtgZ+xwkDqNBok=
X-Google-Smtp-Source: ADFU+vsrgn/I7/3yq0U87aezc5EPcL/v/ioSyi8uCEcZqO8JoZIjCstooShLZGMYvgHn2vn/uc1R6Au9Gus47NWljDo=
X-Received: by 2002:a37:a50d:: with SMTP id o13mr5736750qke.37.1583551482955; 
 Fri, 06 Mar 2020 19:24:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1583039752.git.shengjiu.wang@nxp.com>
 <872c2e1082de6348318e14ccd31884d62355c282.1583039752.git.shengjiu.wang@nxp.com>
 <20200303014133.GA24596@bogus>
 <CAA+D8ANgECaz=tRtRwNP=jMXBD0XciAE0HUYROH8uuo03iDejg@mail.gmail.com>
 <20200303124739.GE3866@sirena.org.uk>
In-Reply-To: <20200303124739.GE3866@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sat, 7 Mar 2020 11:24:32 +0800
Message-ID: <CAA+D8AMkmHZoZ7Oa0_OGfgRAC+H-117e1bNJgzyiWGTueyxDzg@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] ASoC: dt-bindings: fsl_asrc: Change asrc-width to
 asrc-format
To: Mark Brown <broonie@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Timur Tabi <timur@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, shawnguo@kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, linux-imx@nxp.com,
 kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

On Tue, Mar 3, 2020 at 8:47 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Mar 03, 2020 at 11:59:30AM +0800, Shengjiu Wang wrote:
> > On Tue, Mar 3, 2020 at 9:43 AM Rob Herring <robh@kernel.org> wrote:
>
> > > > -   - fsl,asrc-width  : Defines a mutual sample width used by DPCM Back Ends.
> > > > +   - fsl,asrc-format : Defines a mutual sample format used by DPCM Back
> > > > +                       Ends. The value is one of SNDRV_PCM_FORMAT_XX in
> > > > +                       "include/uapi/sound/asound.h"
>
> > > You can't just change properties. They are an ABI.
>
> > I have updated all the things related with this ABI in this patch series.
> > What else should I do?
>
> Like Nicolin says you should continue to support the old stuff.  The
> kernel should work with people's out of tree DTs too so simply updating
> everything in the tree isn't enough.

Thanks for review, I will update patch in next version.

best regards
wang shengjiu
