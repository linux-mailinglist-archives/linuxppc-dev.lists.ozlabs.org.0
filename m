Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5E8399849
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 04:55:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwVrV3vWyz3086
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 12:55:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lAu355Dg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c;
 helo=mail-qv1-xf2c.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lAu355Dg; dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwVr21dDYz2yj1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 12:55:12 +1000 (AEST)
Received: by mail-qv1-xf2c.google.com with SMTP id x2so1858759qvo.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jun 2021 19:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L3qETxpua5Szzx3IugrqwdN2RVBVS+htIlKHHGHgjcE=;
 b=lAu355Dg9iol96NUognh3Z9XUcRdsebrjJDTLIdA0MB3bNopNWwQxCdRUYRX5sAb/Y
 cGUf0l8eVRCedzkRA6AGkEjrkmrHlWSm7nvbhYMMLu9iMNPphZ5SZ/a+Bpa5bo1aiYEo
 dIE2o8o3V3yvHP9fvL9p26aKPWF1n1rF1uiUk/ohboF9EEsQGAsVDBlQW58TXUp3RdAv
 Fvk6VaayMCGK4kT7U63ylfbABmr93wlLZ8IEFKsunB8FgRlvW0igaOt4Ss15ZGYruu2R
 oc0Y44YuKWQTykQrCrMj0huXHvbxsxHM3HDo28txiTevaaW241YRYpyfEsHTd6HFCrO+
 puLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L3qETxpua5Szzx3IugrqwdN2RVBVS+htIlKHHGHgjcE=;
 b=cJW78+Yla5EbwbvUXzFoYX+wHMJGg89uN/Lf6Wud6CykfJr8B0L6I7xOCNYP8F9lMk
 vtcARNcUfdE6FBPgCTCZJWAozNf3ussKcuSlV0sBb7XI957T2M6qLmlCj0jPI3yqd4ur
 4Ts9stpFZom2lx425OW/ikc12+lVIwD93Xp9dqSXsaOMTxF2tnbSWu++kx9atREiN9WJ
 8Kpcvt9W+5bnN2E0idoS1k9NINO+IJXiRub6lLitOWqeB4YKztreZ0AMk7J7v0Cg1GuL
 hoIJi/21OFgJ8dt8k7toveW2GclO7sJgI/D1HKbfcPNCZH6UsNKeqWHBVmB146ETS+hw
 gBdw==
X-Gm-Message-State: AOAM531/t0/e2VNi2NeFb5+CN+NWm8CfGGxd94dxjQXBS2z6YQ3mKOJ7
 xxKwjrIZCrYFTP/frZvjQB1wqTamyyRcWdDGzfc=
X-Google-Smtp-Source: ABdhPJxezezpVM5btuESQMr8sQAiEXZQElm22pIaMrpGjdBnAbnRFJ9jW78E4wHzQhgfJltscBSnDG0cUu3iIS9EoZk=
X-Received: by 2002:a0c:dc92:: with SMTP id n18mr8866816qvk.8.1622688907466;
 Wed, 02 Jun 2021 19:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <1622616132-10391-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5An-v0mLAvjofiWLc4ufJiE4EzG1b4NDwToPSvgODrHjQ@mail.gmail.com>
In-Reply-To: <CAOMZO5An-v0mLAvjofiWLc4ufJiE4EzG1b4NDwToPSvgODrHjQ@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 3 Jun 2021 10:54:56 +0800
Message-ID: <CAA+D8AMYmy=NdQU+9gTwa_7j23kmxgU1Xj-pkzuHPCNX649iYQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: change dev_err to dev_dbg for defer
 probe
To: Fabio Estevam <festevam@gmail.com>
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 2, 2021 at 11:45 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Shengjiu,
>
> On Wed, Jun 2, 2021 at 3:59 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> >
> > Don't need to print error message for defer probe
> ...
> >         if (!fsl_asoc_card_is_ac97(priv) && !codec_dev) {
> > -               dev_err(&pdev->dev, "failed to find codec device\n");
> > +               dev_dbg(&pdev->dev, "failed to find codec device\n");
>
> You may consider using dev_err_probe() here, which fits exactly this purpose.

ok, let me update it.

best regards
wang shengjiu
