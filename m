Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C91731E723
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 08:57:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dh6Wf2LJ0z3cJ4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 18:57:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TKJDEV3Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TKJDEV3Z; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dh6WD5Wk2z30Kw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 18:57:26 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id z32so777300qtd.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Feb 2021 23:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bg6ZSnruXgfVD4jOeLrAxIfhO0SIr3QdWxHbt31ZHm0=;
 b=TKJDEV3ZCzXyQLPo4690LhuK/JxxBLbOYIkTDeL9v/WmrZ48dcpJnUb1Ovx1uQE0hy
 LPtmgBNuzWw9zeoKLHom34zDiNUYZKD0RVU4j3HYBlkCv3gLyhSlLwfvEKT1P8uoOwcy
 ig25aPPybc0vdT1XjIiLbIxPrSC+43ktVqvC9ZzUJoRSCQ7cqUJ/RolVrhAJ+bkg3R9R
 6koZyw9QHe/TPDGAZzI+tUgkwylUpm2MJNW0oAoWnrLitCxvwFx0S1H0nfXE8lmI80ti
 0JhtKKrErv6pK1MZnit70/fgA8ULuIfSQamLqFHQ5Zx/lfn/GRQrc0xQdpcyGnTsHANh
 hDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bg6ZSnruXgfVD4jOeLrAxIfhO0SIr3QdWxHbt31ZHm0=;
 b=R0MCyzghqaBD/xUGWOAQJUXYR08I7D5eE4m6OFg0N5nmJ/IQ1TmTh08rQnEYt8H6aI
 27fqUkDG2KboayALoBEnUPVcvO6D8D2LMcu1lITl1ubvNZh9DOCAVhNsmfK+K0mjfSa+
 4Fz6O2+5gYm8Jo/yx1Drje/gzJYXy0/qP8rKi3KJ6p9/pxEajgS+sgmeUd59y/sxYBRs
 h/IkqIk46hCZvT798Sw9QD0ooOoNu0/XiemIY1Escy6XqRalX/NF5z2rngO18mTw28Hq
 I7eQlXokkeaZIfe9f//hWoV/Vx/dtjShr5RFzO4Wydl+w9osT6G6uo/BXZygsPilxFjo
 Eo1A==
X-Gm-Message-State: AOAM532i3zGi13tohwLYTBnwG3DQhQRA/uQeDXjD6Am/dDUMrgFc5kq1
 OUvpVCyeyuwXc722+zIfu2zSyypXucyoBhVEIYI=
X-Google-Smtp-Source: ABdhPJwKbxgkU1n6Xn85QkkRx6zEyLGBxhFrkTp3vrGLKMttYXJc3yhMLn21PwynsFE8wZfmeCgV0p192sI9a5vlXCE=
X-Received: by 2002:ac8:7c98:: with SMTP id y24mr3007479qtv.292.1613635043036; 
 Wed, 17 Feb 2021 23:57:23 -0800 (PST)
MIME-Version: 1.0
References: <1612693435-31418-1-git-send-email-shengjiu.wang@nxp.com>
 <1612693435-31418-3-git-send-email-shengjiu.wang@nxp.com>
 <20210208115112.GD8645@sirena.org.uk>
 <CAA+D8AMRGRRk6FzdiqaHAP1=dPJngNgmdGmU59vrroXA9BMyXw@mail.gmail.com>
 <20210209222953.GF4916@sirena.org.uk>
 <CAA+D8AN=SDMLhuNbstzHL_H2p_L6cr+oCXbauNB0gGs2BW5tmA@mail.gmail.com>
 <20210210153808.GB4748@sirena.org.uk>
In-Reply-To: <20210210153808.GB4748@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 18 Feb 2021 15:57:11 +0800
Message-ID: <CAA+D8ANdqd2W6xvwFuuk=YqUGCfuXCFzwO7tkhuGwzPRgA_A4g@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] ASoC: fsl_rpmsg: Add CPU DAI driver for audio base
 on rpmsg
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 10, 2021 at 11:39 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Feb 10, 2021 at 02:35:29PM +0800, Shengjiu Wang wrote:
> > On Wed, Feb 10, 2021 at 6:30 AM Mark Brown <broonie@kernel.org> wrote:
>
> > > Like I say I'd actually recommend moving this control to DAPM.
>
> > I may understand your point, you suggest to use the .set_bias_level
> > interface. But in my case I need to enable the clock in earlier stage
> > and keep the clock on when system go to suspend.
>
> The device can be kept alive over system suspend if that's needed, or
> possibly it sounds like runtime PM is a better fit?  There's callbacks
> in the core to keep the device runtime PM enabled while it's open which
> is probably about the time range you're looking for.

Before enabling the clock, I need to reparent the clock according to
the sample rate,  Maybe the hw_params is the right place to do
these things.

Can I add a flag:
"rpmsg->mclk_streams & BIT(substream->stream)"
for avoiding multiple calls of hw_params function before enabling
clock?
