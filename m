Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4F290B65B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 18:31:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=dKb65ekr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2wP00XZCz3fwL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 02:31:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=dKb65ekr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2wNH2DS2z3ftq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 02:30:20 +1000 (AEST)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6fc36865561so996490a34.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 09:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718641812; x=1719246612; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4CGIueJgo3FyF0lUSOsJIiD5YkmHOWg5+dfrNt3KDo=;
        b=dKb65ekrYh3X+PmA2Vh7VhWeZ15HjMoq452VCvJ4RZ6WPoNE3rzZK2RE/6YNtyDkAx
         1PPIMoE22gOllDke0pV0xqwpHhH3WHBINRQAzakoh3B7UHFKwRUXpuC0R27GcOPWu+UL
         z0ZeaAnzGZDRx+jz4oyUiT8/4d4wSxFcCtXFjRQR5CdNYprmkOJ3pFnpA5hIupEjg9H9
         jh/NnHLxT5T9ts2xs97dJV4EwUjmT9nl0frj2ao4HNFw61nTL9hj2Vf9bHrM0BGaQrOR
         gx41vgiVihix2OIm7h4wQ7jRc6qQIf4AGSOdE7PD5SL+cUaeNoQ6qWW5ajvNNw3XD/C4
         di7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718641812; x=1719246612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4CGIueJgo3FyF0lUSOsJIiD5YkmHOWg5+dfrNt3KDo=;
        b=WIrRFbTXsDlC4fEdVRFJiBeYy57XAdkataZrZV96sfWMjHObtNCcSjh9B6DMFKswnA
         9GGjx2Kocls2/XAmPGX1rR+6AgJE0Yzzmd7JDe4vDM8dbzii/NUXObqXw1Zp/ywIdd6o
         6m72xwVZ45NozCNr8E1k1CEfIA4ZXRbDNADD0b2Ak0DNjyQsV/52WZAw3z3lwxZR6hOu
         Gbmvryb9OtT2OIYJbU37jgjAraT38O/RjuzJiCM+YkCYsR0RuomeE3a+7b8Wmek/dA/B
         qrnAxJlRgr6pCsZBmF27dmAK64P42tY1AoCKdOMBJhUOeG5XSGLGosygdey39Ey90ki6
         KIjg==
X-Forwarded-Encrypted: i=1; AJvYcCUvMiOWZiUTbJLJVs7wOT2HTRmFu5tyAoBJJC9gmIvflwmF+kUTTNsdlaO564h8cv7e/gISG14/BwTQEG7ewlSaWwFc2V132lfW1kWB1A==
X-Gm-Message-State: AOJu0YzMb6zQlM6HkiGvDwJrT502JNwKYp9/hf4N+S25oLbW06xhRSns
	Y0qbgUpuFLn3nfXPcHooJ/ySpojKRpwci2hhueRSFMsUHOhSCjBCG7qNCBbETB6v7yeHalu7owm
	SUvsYz9brUZObywA18R6GrcNMbvxJO14+D+bu2w==
X-Google-Smtp-Source: AGHT+IHjzvlrr838N1DpEkEeLzzIsELYsb2zHrhaAqxCRJTNhyRbdCIQiZBSmvhFuWqlSzeRBTrPNi1jOBSJAcQmjjA=
X-Received: by 2002:a9d:62ca:0:b0:6fd:5445:c6cc with SMTP id
 46e09a7af769-6fd5445c914mr6508564a34.23.1718641811875; Mon, 17 Jun 2024
 09:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com> <20240614163500.386747-2-piotr.wojtaszczyk@timesys.com>
 <83cbf43e-c927-449f-8b7e-5c8d3ee8cece@kernel.org> <CAG+cZ06EeXUDiLsDXkz+6EHqJwpvv2MWwfpvB8AYw0=ZhUkTfQ@mail.gmail.com>
 <83a45f7c-d90b-44d3-b57e-9dad21045e27@kernel.org> <CAG+cZ06kzikieaD_JCBybwWk8XKZQjJxa34Cg4QHxrxpT+j0eA@mail.gmail.com>
 <2fe7ba36-05b9-42c7-8726-ea891cfc7afc@kernel.org>
In-Reply-To: <2fe7ba36-05b9-42c7-8726-ea891cfc7afc@kernel.org>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Mon, 17 Jun 2024 18:30:00 +0200
Message-ID: <CAG+cZ06XNV=ZZ8Ag00kaz1xWitXDN-yezUoc7M9JwQ5MUu7hTA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, "J.M.B. Downing" <jonathan.downing@nautel.com>, Vladimir Zapolskiy <vz@mleia.com>, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>, Chancel Liu <chancel.liu@nxp.com>, linux-sound@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 17, 2024 at 5:48=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 17/06/2024 16:04, Piotr Wojtaszczyk wrote:
> >>
> >>> It's used by snd_soc_dai_init_dma_data() in [PATCH v3 4/4] to give th=
e
> >>> dmaengine a
> >>> hint which dma config to use. The LPC32xx doesn't have yet a dmamux d=
river like
> >>
> >> and if I change driver platform data to foo and bar, does the DTS work=
? No.
> >
> > They shouldn't change the same way as expected dma-names shouldn't chan=
ge.
> > Lots of drivers expect the dma-names to be "rx", "tx"
> >
> >>
> >>> lpc18xx-dmamux.c therefore it still uses platform data entries for
> >>> pl08x dma channels
> >>> and 'SND_DMAENGINE_PCM_FLAG_NO_DT | SND_DMAENGINE_PCM_FLAG_COMPAT'
> >>> flags in the devm_snd_dmaengine_pcm_register().
> >>> Typically instead of this platform data you would use regular 'dma'
> >>> and 'dma-names' if it had
> >>> proper dmamux driver like lpc18xx-dmamux.c
> >>
> >> Exactly. Use these.
> >
> > Then I need to write a lpc32xx dma mux driver, device tree binding for
> > it and adjust the
> > LPC32xx I2S driver for it. Is this a hard requirement to accept this
> > patch set for the
> > legacy LPC32xx SoC?
>
> I do not see at all analogy with dma-names. dma-names are used ONLY by
> the consumer to pick up proper property "dmas" from DT. They are not
> passed to DMA code. They are not used to configure DMA provider at all.
>
> You parse string from DT and pass it further as DMA filtering code. This
> is abuse of hardware description for programming your driver and their
> dependencies.
>
> Why you cannot hard-code them?
>
> Sorry, to be clear: NAK

That's fine, clear answers are always good.
I considered to hardcode this as it was in the first version of the patch s=
et
but LPC32XX has two I2S interfaces which use different DMA signals
and mux settings and I really didn't want to pick the virtual DMA channel
name based on hardcoded I2S node name therefore I thought having a DT
property to select proper dma channel is a better solution.

--=20
Piotr Wojtaszczyk
Timesys
