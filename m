Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CD22B8B06
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 06:30:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cc7Yh3cj1zDqg8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 16:30:32 +1100 (AEDT)
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
 header.s=20161025 header.b=qZF2Ygao; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cc7Wh1ycjzDqZb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 16:28:47 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id m65so3523076qte.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 21:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b7W8v88zLtr+ka2IPAyj56iTGAS8nCyLHMM+2VUflmo=;
 b=qZF2YgaoXYq0nmLnEFZikoLEWobBAv2ePC78d840jV8fVBGlhwa9cPS53PSvu/xHNN
 Xqqpc5mi8jp/wBM58SIMpqTJjRowXWQPf1GLHXRWf4LAJ8Wn7XPDBtYy4Jtvpq/Rz6bm
 LU7/yZrTjFBu93tCO84TwEFiJfha687R8ecfczX9rbZ7ab9QupindBJgfn3i7+J2iTwm
 mP7Y6rwWR3nITm+rmgWXkK/KQbnhB2YhDhCCSdxV67U9QgxzAiPzMZJMuSjmoLQfeGg/
 ADv0cjpR4/VioRFC0SMi0XyDlJ+oDitPmwv1+8wjgCRdXVcuMp5oMd81S6jCQPQeSf6k
 8UdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b7W8v88zLtr+ka2IPAyj56iTGAS8nCyLHMM+2VUflmo=;
 b=TDUS3wpKRZQtDY+pSnPvNVQzmjoZ0sPJ03atSlLeEioxXIsbK9agWKwT+TMCqFkOLg
 mou21RqzdlkdiZm0yf6Xi3Pw8svkFheVYcjWjVzAMHA7Krjb46n8Q4wcdlqOD4d9iUhG
 sVFxT1RzppAoSHzC8rlrGqtzK3ZLWIcdLtn5l2iZtkq6AhaO7JDOk8Bm5eR/TE96BX5p
 TxUUIgfG4Y4+uVuyuwzZTAUzSk6qxTWbGczuvxf/Q6qJzLDGDkt0LfRksydRdQPYqb3g
 SLbKKAizeNTOKZ1Ixg5XhkxbPypD+9WkREDAQB/Y8UYjwtXwa26hnFibCPTAEcDRE8Na
 8EYg==
X-Gm-Message-State: AOAM532YiES2ZjTsobQaQoputj+ikiLkxOl5KN1rJt03GqCMtDfRoi/5
 AYK8f0bfsmcfoAmnG6oGYCi64Hngx7BQ4WFFV0w=
X-Google-Smtp-Source: ABdhPJyP01zyLRekqz3HSZ/yOdRNlpFC3KuuNZYSluSSNckhGFZkRWKxMffUcBHvJTq4iZbFHpbs1CpAK1V2ccLnnRo=
X-Received: by 2002:ac8:5806:: with SMTP id g6mr9224533qtg.292.1605763723217; 
 Wed, 18 Nov 2020 21:28:43 -0800 (PST)
MIME-Version: 1.0
References: <1605752956-17397-1-git-send-email-shengjiu.wang@nxp.com>
 <20201119050120.GA7124@Asurada-Nvidia>
In-Reply-To: <20201119050120.GA7124@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 19 Nov 2020 13:28:32 +0800
Message-ID: <CAA+D8AOuaeZCnvY0h2stzkiMnNCe7zvK_D4M2irT7y7NC+iZFg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Correct the clock source for mclk0
To: Nicolin Chen <nicoleotsuka@gmail.com>
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
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 19, 2020 at 1:02 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Thu, Nov 19, 2020 at 10:29:16AM +0800, Shengjiu Wang wrote:
> > On VF610, mclk0 = bus_clk;
> > On i.MX6SX/6UL/6ULL/7D, mclk0 = mclk1;
> > On i.MX7ULP, mclk0 = bus_clk;
> > On i.MX8QM/8QXP, mclk0 = bus_clk;
> > On i.MX8MQ/8MN/8MM/8MP, mclk0 = bus_clk;
> >
> > So add variable mclk0_mclk1_match in fsl_sai_soc_data To
>
> Not in favor of "mclk0_mclk1_match" as it doesn't sound explicit
> to me. Instead, "mclk0_is_bus_clk" or "mclk0_is_mclk1" might be
> better. Or in case that you foresee some other implementation:
>
> enum {
>         MCLK0_IS_BUS_CLK,
>         MCLK0_IS_MCLK1,
> };
>
> static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
> +       .mclk0_alias = MCLK0_IS_BUS_CLK,
> };

No problem.

But I just find this patch doesn't consider the mqs case.
MCLK0 can't be used for mqs, it needs MCLK1, even
the MCLK0 is same as MCLK1,  MCLK1 need to be
selected for mqs case.

Is there a decent way for this case?

best regards
wang shengjiu
