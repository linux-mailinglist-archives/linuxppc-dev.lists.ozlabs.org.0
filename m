Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CD4749D7C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 15:24:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=E7s/Y1ty;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qxcgz2f2pz3c9r
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 23:24:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=E7s/Y1ty;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qxcdc0qdSz3cM4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 23:22:27 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-682ae5d4184so146482b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 06:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688649744; x=1691241744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+D+QKK+V9y/nBwFyOGwDPW6/JU+V8a2ffx9sQ1ifyI=;
        b=E7s/Y1ty/VDpvP5mnN9k487LRb7Hk9ZnjhLCuopgu77+FR0Sj7RjoF7VVwK9F+XhtU
         luETDyvizGQdrKnIui4DnmxetSyME8aO+UybjP2VJFOB0mC2dlMr/x0MKPHBmG7R2Hwe
         fFH9oBBOAoSdOHSLNgqzwwTVGY3xOl+8JaoIn0Cr+kWvmOa2hMDYqLsUJLw3hq0QNTAN
         ZkkzgIzRrqSBmfEOaKIXoWwNEUBUI9nfmW8XyY7rsELySVd5pkoIDYQWxrjWRdMnhZoS
         isob8hZQSGU91B30eC/raUtaaKbMlCBwT5LXLzhQto/gVkqrsWS2xiPGlsF33Psqtf4u
         pRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688649744; x=1691241744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+D+QKK+V9y/nBwFyOGwDPW6/JU+V8a2ffx9sQ1ifyI=;
        b=F9d6dRPLKc4D8x2I2N/BKEVxcPj8J/qAgojMzDnnKdDClq/oPb5W4fyrOy6m6i20TO
         Oiec34CIknrvs60JxX885hbqZ31JGbIazPAkALC6ssTzKguV/MgMwZPeCQdtZQyjv8x+
         iiIELfs2c8ar5ZC/goiMBF8R3gkZYrcais0oLa9baaDcIKaS9a1KOHl2+AUM9/gHxefo
         2xAieD191ro7jZIozOB6Ohk9xPTRSsGeQ5huTc/jfpkrOP7HMDkL6wIP+Vx4XL2qVrF9
         9uDqfUKKHh0Sk3zY0VbGBzu+bwhmNzGg3IxwbnHqR94y+E75ngGrvPoFnOXwpltrpNND
         qhVQ==
X-Gm-Message-State: ABy/qLb/ByVWaG637r91s2vV+DEwTNIytrSv6Dg58qS3rRX2cw0+22Sr
	wWZQEgE6pgxM5vZ8j4/IGXVWsyLxpzAHKX7FaSA=
X-Google-Smtp-Source: APBJJlFCKu7vaNfYYwvzzuc2kPB8Td6VMbpcT9KZ8a0UyW1X9PGMU8ri8DNniH1sa/11VCC1WLJc0mpnsXXsJuT0Id8=
X-Received: by 2002:aa7:8815:0:b0:67f:7403:1fe8 with SMTP id
 c21-20020aa78815000000b0067f74031fe8mr2110292pfo.3.1688649743851; Thu, 06 Jul
 2023 06:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5DtpoH0dLDX3=Sv4UUpX_=66VEZPsJUWQNnYviApfMLKQ@mail.gmail.com>
 <20230706084706.bzwsbi3zisx5m5rl@fatal.se> <CAOMZO5CCdaodWQrHUQgMizoES=jfEtw-sNJZG-DJMpRD8tZW9g@mail.gmail.com>
 <CAA+D8ANAg7bs0A35c7Af3_-5sLaqvT1RoKfCbzYi=z=t_q9LUw@mail.gmail.com>
 <CAOMZO5BtrKwrMwrjVDbYn3ivt2uV9rzbSDxd8qfiYjOBMvKBgg@mail.gmail.com> <20230706123401.kctossjho26bry7e@fatal.se>
In-Reply-To: <20230706123401.kctossjho26bry7e@fatal.se>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 6 Jul 2023 10:22:12 -0300
Message-ID: <CAOMZO5AFjS+aGjHTYCvPO86ypXfcFnuKmU2qHZNTyDSQPxRHjQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
To: Andreas Henriksson <andreas@fatal.se>
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Hans_S=C3=B6derlund?= <hans.soderlund@realbit.se>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andreas,

On Thu, Jul 6, 2023 at 9:34=E2=80=AFAM Andreas Henriksson <andreas@fatal.se=
> wrote:

> I think your initial review comment was spot on Fabio. There probably
> needs to be a(n imx8mm) specific flag that says when this workaround
> should be applied and gate the code in bclk function on that.
> Atleast that's the only thing I can think of if my interpretation of the
> problem for imx8mm is correct.

Yes, deciding whether MCLK_EN should act as a clock gate based on
the number of SAI registers seems fragile to me.

I have sent a proposal as RFC. Please give it a try if you have a chance.

I would like Shengjiu to confirm if imx8mn and imx93 should also
behave like imx8mm in this aspect.

Cheers
