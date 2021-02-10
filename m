Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20162315F91
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 07:37:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Db96s5gkHzDsmD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 17:37:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::829;
 helo=mail-qt1-x829.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=U3TeKQmh; dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Db94h5Y44zDsjV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 17:35:44 +1100 (AEDT)
Received: by mail-qt1-x829.google.com with SMTP id c5so850645qth.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Feb 2021 22:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OXavdBpvyb1Dd4oqB+h0ECTg4yI3fOv5ICocqflKLWs=;
 b=U3TeKQmh4y3CaWmZxGHT2aKYLXNMmaTMhX74o7qey2Zqpli88QlRz1Xs6iuoUXdHpp
 vrDeFbsUwEWi9FKGrl/Vq8lyG/053P0M7F+3caw1kPcsncgM7m+SOqRxTLW369Uj/FFq
 A9qAxPNoHSKxxAxQ4h6PCTAT6kKIn8aoSohjxh7M15EiZ2Qlcez9KGqofJ+nPPNs1QUx
 9wUhYhnS7JNDZoy+WNsipI0nlpIZKUnH+4QuClQMepS8wOkv61BhtZ57FjpYx+xCISVn
 TLP+LLYgiCtBirVf4LfoqCjegiT3D+R7lUdUz6OYnOoczhRPL11mVNSvXNcSxevXYVoh
 +NYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OXavdBpvyb1Dd4oqB+h0ECTg4yI3fOv5ICocqflKLWs=;
 b=r/JQ/vh0rUNzfgscBL1qOy1b/FlSdFOyA3JOUOMZEDJnaEHQwqBGyvXLWofJwveFHY
 /1RToUdFpeZzLobgHa9m3uQTHhKONPS0rNBmqDvgXwI1ZGCUPOQXbkPPE2YLhfE2M1Wf
 o99NXA9qrJYmacNn/eciA2Z2mGteeDrtKW2KRtTclrwP6ndSJ3KPndhsayXWLtLEt7jv
 XZqje6uvlOx84xfZ/DVM1QP5NQSjF107frakKiBV21VyvJCHoziOBWy0++rS3sdhyUe8
 EgI9dAZPjI3sj2Hrl7WaIja9GI4PC/3T3/gTN++QRr+KPskE6KbEnsJO1p2mk+cK8Cfu
 dzwg==
X-Gm-Message-State: AOAM530CfnBJOIXqXTUQ55OiD9GuvQan66CrDr1mrnrXLUiu5Z2bNjub
 2xJp2/JScC6kkmH+5Rd/0vuFswfXgqb8oeM0UMI=
X-Google-Smtp-Source: ABdhPJxAa/ZPqVfua2S148lPQM0vsrXWY7jYa5ufize6XE/GEpwPCHJc4pF60zzqGbSqwjyqF2HO1qXRtmfQ24UTEcw=
X-Received: by 2002:ac8:6f06:: with SMTP id g6mr1460808qtv.360.1612938940598; 
 Tue, 09 Feb 2021 22:35:40 -0800 (PST)
MIME-Version: 1.0
References: <1612693435-31418-1-git-send-email-shengjiu.wang@nxp.com>
 <1612693435-31418-3-git-send-email-shengjiu.wang@nxp.com>
 <20210208115112.GD8645@sirena.org.uk>
 <CAA+D8AMRGRRk6FzdiqaHAP1=dPJngNgmdGmU59vrroXA9BMyXw@mail.gmail.com>
 <20210209222953.GF4916@sirena.org.uk>
In-Reply-To: <20210209222953.GF4916@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 10 Feb 2021 14:35:29 +0800
Message-ID: <CAA+D8AN=SDMLhuNbstzHL_H2p_L6cr+oCXbauNB0gGs2BW5tmA@mail.gmail.com>
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

On Wed, Feb 10, 2021 at 6:30 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Feb 09, 2021 at 05:16:16PM +0800, Shengjiu Wang wrote:
> > On Mon, Feb 8, 2021 at 7:53 PM Mark Brown <broonie@kernel.org> wrote:
>
> > > hw_params() can be called multiple times and there's no need for it to
> > > be balanced with hw_free(), I'd move this to a different callback (DAPM
> > > should work well).
>
> > Which callback should I use? Is there an example?
>
> Like I say I'd actually recommend moving this control to DAPM.

I may understand your point, you suggest to use the .set_bias_level
interface. But in my case I need to enable the clock in earlier stage
and keep the clock on when system go to suspend.

I am not sure .set_bias_level can met my requirement. we start
the Chinese new year holiday now, so currently I can't do test for this
recommendation.

Maybe we can keep current implementation, can we?
Later after I do the test, I can submit another patch for it.

Best regards
Wang Shengjiu
