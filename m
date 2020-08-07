Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AA223E7C6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 09:19:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNGvk2HRrzDqw9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 17:19:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=a/CYaZUT; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNGsw475kzDqnr
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 17:18:11 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id w9so628861qts.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Aug 2020 00:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BjBgjmOHw57678g0o5hgG5E9h3ORFUrabBo5u11RIkM=;
 b=a/CYaZUTnaXHYxqHoecfCwYEelSne77o/fgIVbDNgujdYRVXwWmuaYBlO1L60+Q7wi
 VAV9GzcIaEiwrsQqXgQ3CbqbZwpM7Rm67s3wC/vPd0V1vU10vpdIVlwFdQSGnXWT9iFL
 FrBz/EmG2SzhpE4MAtfAGijqdjnGgI7x9BkGB8b9wkvXFAs3sWZfS3cuNBWuUjeF144e
 WqmS/sjKnHERyHXHj1D4ub7NJFhZrZzLmQcpm9CfbG1MfC82t2ZP2lvZExDnEwQGDZ6T
 C7y9vnBi+pglIAzfJqty3goo1Mshzlovbmb77WUsXZEshGSm43rphjfMNd8HoqJuCBZC
 OelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BjBgjmOHw57678g0o5hgG5E9h3ORFUrabBo5u11RIkM=;
 b=kIym1y6arteKayK1p2AUzFxzPRA3KSb0xV4T5M5xLL+ZLEe5npzxZoorCJUWUgCLw9
 aUqqOv1mBtYrTI30gDiZm87npdMEJDT/s5ilJe5LKoSa9MyJmdYlVB9PfOUdUHyBgskm
 auhv7JFqypuXDaw6zNtaUCz9Dr+Y4FaA/SCFrjtisDjYmVZc0xf+1//ulOQQ0YfC9l3Z
 CbIBW13QhY+YDXANNoiG77gqjzVHGC8Hpog7PmWeBzZNVoHA6ZuiI4iU5lxZ2vT5d1k/
 A6J5HhIUiHQNnbSG0T5jOHV+yreCRsSgmOuJIRK6Ma1zx0F7N/V1RIzr4m6wx7O1r0CI
 yXdA==
X-Gm-Message-State: AOAM532WvjjtArGBWCajsqi4avGs9Hx+fC2vG6d/ZA9rLPAnYRAFaNIL
 bC0S7JYgzMgXncVZPbrDJnRWy0RlwER3I+F/2HY=
X-Google-Smtp-Source: ABdhPJwH6rQ4Xtx8TIDeCErClcwMqaVFrhF6ev68LM4jAENVmB3yaTIBDChUTbXFpgYfNjU12TzCBsz0qDFzNQ4T+OM=
X-Received: by 2002:ac8:450c:: with SMTP id q12mr12563634qtn.292.1596784688131; 
 Fri, 07 Aug 2020 00:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <1596699585-27429-1-git-send-email-shengjiu.wang@nxp.com>
 <20200806123721.GC6442@sirena.org.uk>
In-Reply-To: <20200806123721.GC6442@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 7 Aug 2020 15:17:57 +0800
Message-ID: <CAA+D8AOqaEEGuVp_vaSf6XAyjjCd=azj2qgKkqagvrtBNr9Mqw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Get "extal" clock rate by
 clk_get_rate
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 6, 2020 at 8:39 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Aug 06, 2020 at 03:39:45PM +0800, Shengjiu Wang wrote:
>
> >       } else if (of_node_name_eq(cpu_np, "esai")) {
> > +             struct clk *esai_clk = clk_get(&cpu_pdev->dev, "extal");
> > +
> > +             if (!IS_ERR(esai_clk)) {
> > +                     priv->cpu_priv.sysclk_freq[TX] = clk_get_rate(esai_clk);
> > +                     priv->cpu_priv.sysclk_freq[RX] = clk_get_rate(esai_clk);
> > +                     clk_put(esai_clk);
> > +             }
>
> This should handle probe deferral.  Also if this clock is in use
> shouldn't we be enabling it?  It looks like it's intended to be a
> crystal so it's probably forced on all the time but sometimes there's
> power control for crystals, or perhaps someone might do something
> unusual with the hardware.

Ok, will add handler for probe deferral.

This clock is not a crystal, "extal" clock is for cpu dai, it is from
soc internal PLL. which is enabled by cpu dai, here is just to
get the clock rate.

best regards
wang shengjiu
