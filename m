Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6594145902B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 15:25:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyV1F1YTpz3bYW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 01:25:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ZV4YU+sU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amarulasolutions.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=michael@amarulasolutions.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ZV4YU+sU; 
 dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyV0X5lCCz2xBY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:24:58 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id g28so15454896pgg.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 06:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YnxeGymcCEbfmTiuZXDKf3tgkMXvkQvRUy5uTOBjZyQ=;
 b=ZV4YU+sUroW88Mme81TaD5ulHL5j6+arntSxDBIGSMkagUNi+Z+vYqeQeJPjZeTfRJ
 epUxzyLTLrOCNL026yHaMOUxDY5f8JuZEsfsV163LokQokZXnDskBqZMT1qRY0TNPDNj
 Pe8/YWGeDgZOK5SK+Dm96Ygve5v8P2/Kowrhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YnxeGymcCEbfmTiuZXDKf3tgkMXvkQvRUy5uTOBjZyQ=;
 b=EIPSv9uQyIv3Dlgs0yUowlkSKniVoz6xk99lZqqkCTGtotIcuSQ46zRy2TWWF9/Iac
 Nf/XALdikMZZzxVGfyYCDeeD22WiULZb/Xf1FAv0uNgiyi32Pn/ZxMW1u/8Lfoes1LNG
 s7tU86WFJTWZlDpuNJa5dUO1sALeEofM95P00g0TbObJPjfUpzZL9Jbt9gH1uNFpds7m
 iKzQvf4xg911bC1x8c23BNoblyPHF71Ljdi7gH5caGZVzqhUak515Xsw+xZisX+CiYnW
 yGqUvsHoKtm8ZVxcE45z95GtswC9t7O6Okw7zGPtND+KXUNlQ7nzU8He/MxqU5dblE/s
 frbg==
X-Gm-Message-State: AOAM532vyheye9ke96VlX/BBRtRRShuScVGtHNeznuNJ+9iVwmABRJv2
 /J9L4Lp94qPc6IIOXHtIBfYcNqqFDtoAhBy+AVu0Cw==
X-Google-Smtp-Source: ABdhPJwwnqKrt1uvX/kQIgmqdkM5eb/Z+4p3ejfkShcIYuNGlTkwcMUE82oN+F/w6i8Rc08gaFoGx+bildiyDfDae+w=
X-Received: by 2002:a63:6c49:: with SMTP id h70mr34108131pgc.368.1637591094319; 
 Mon, 22 Nov 2021 06:24:54 -0800 (PST)
MIME-Version: 1.0
References: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
 <20211119153248.419802-3-ariel.dalessandro@collabora.com>
 <YZunmnHqemZRJ6JK@sirena.org.uk>
In-Reply-To: <YZunmnHqemZRJ6JK@sirena.org.uk>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 22 Nov 2021 15:24:42 +0100
Message-ID: <CAOf5uwnrUdF4fOVGvp8GmuUL6SpsyjPq46WBP7hcY7bYbw7RHA@mail.gmail.com>
Subject: Re: [RFC patch 2/5] ASoC: tlv320aic31xx: Add support for pll_r
 coefficient
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
Cc: bkylerussell@gmail.com, lgirdwood@gmail.com,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 kuninori.morimoto.gx@renesas.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com, perex@perex.cz,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mark

On Mon, Nov 22, 2021 at 3:22 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Nov 19, 2021 at 12:32:45PM -0300, Ariel D'Alessandro wrote:
> > When the clock used by the codec is BCLK, the operation parameters need
> > to be calculated from input sample rate and format. Low frequency rates
> > required different r multipliers, in order to achieve a higher PLL
> > output frequency.
> >
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>
> Did Michael write this code (in which case there should be a From: from
> him) or did he work on the code with you?  The signoffs are a little
> confusing.

It's fine. We are working together

Michael
