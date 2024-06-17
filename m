Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AD590A9A9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 11:34:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=nTLFvDMl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2l8f1yw7z3fpk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 19:34:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=nTLFvDMl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2607:f8b0:4864:20::f2e; helo=mail-qv1-xf2e.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2l7x1Wgwz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 19:34:00 +1000 (AEST)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6b0745efaeeso22243646d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 02:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718616838; x=1719221638; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dwjk23maxDbhwXR6knY3QoiO7g9DUPuAbXWMaxi9WAo=;
        b=nTLFvDMlD5nkviB+TK1dJLDFGmRuFUmuiRf2QoJdiZxsVkyY82vwEJCIsNORpsicZN
         4hVvmLFdl9rUEmLGwUYTuMt/3qSWLGFKdz3tNMmhfciKilhcKTrvvKch48d5AFC76eDi
         xuwOfVNvGh1bLnsPFx5RdP2O1CLC1O0p0raX3c3vVYMQklQlNrb3qXTpJc+xkoPM0THJ
         fCXqxI9T49vv7PRI5nHT8Z10bugVhrQppAPv0cRZjTXuMon+L4IGJcAOR1jlnZv2JfWt
         45i+NS8WCWvmHFbF+dGL2L0uQc+fGqvIGQOAvuv664glOe2gLsX0IwPefWwrmtb5hTLn
         fQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718616838; x=1719221638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dwjk23maxDbhwXR6knY3QoiO7g9DUPuAbXWMaxi9WAo=;
        b=Dwo16nYMEcT/EXwsFbzhX/zMID/sEf8JW1+Edns4iraD7pqV6EdX+L8hOKQUzO5XTU
         7GdadqIPyycdkrs59Cp/AibYYNvEcvyE/7JVVtpgLKC+xbav8IzapDBx4MVKh8cqSCau
         xRs2Xc212ODZapv/BgpVE6MDZ6O/OjAdNh83prVF5n4e0F0EgynzKUN5dY5STKkzvdz/
         QDEMtyYv4HcBbot5pcNjXEKNuyR7Vj1zwao48zL0ezVaa2ITpbgZxb1+rBknluaN9xWl
         7q4WPyjMRZctXaqfh9sPrwNOXEi0qdguIvNDzhmQqPzv4zkK9o3ezk/fzVkTSJZ9T3K3
         z4FA==
X-Forwarded-Encrypted: i=1; AJvYcCVky9oxz/iyS7NvAUdwWCYGkN+gHUHfgOFQu2gmF64VAcWJCTFo3LXbJGqZaBbhOduXwklS9217+eTPU5t+taZ9X/oCcgqHxxvOGiqXCA==
X-Gm-Message-State: AOJu0YxIrieXyBAjKTkURiGT/7dCUh3/KEPn6HCsEnNgqxgK7CRXPA6J
	5HysrcIYtRwvMBx/sSKayT42gwljYEF0rC5RZENKwj2Mu/3wjxKNYLF9GjOJw8UfsX/x3wwk+3z
	UK/ImhK5ZFVS7hdHMql4Tw8++cFIKtw2MffEKwQ==
X-Google-Smtp-Source: AGHT+IEAX5KtNwSxz024jCUDuTs+t2XcQ1Uu/1Qu8JcsorpEu10yK9me2YfmiTGJCyrzuk8/c2n+Pk4pb6M+8oQC+gs=
X-Received: by 2002:a0c:fbc2:0:b0:6b2:9c0d:4849 with SMTP id
 6a1803df08f44-6b2afb7bb5cmr87920016d6.0.1718616838197; Mon, 17 Jun 2024
 02:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com> <20240614163500.386747-2-piotr.wojtaszczyk@timesys.com>
 <83cbf43e-c927-449f-8b7e-5c8d3ee8cece@kernel.org>
In-Reply-To: <83cbf43e-c927-449f-8b7e-5c8d3ee8cece@kernel.org>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Mon, 17 Jun 2024 11:33:47 +0200
Message-ID: <CAG+cZ06EeXUDiLsDXkz+6EHqJwpvv2MWwfpvB8AYw0=ZhUkTfQ@mail.gmail.com>
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

On Sat, Jun 15, 2024 at 12:01=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets.

I'm sorry about that, it won't happen again.

> > +  dma-vc-names:
>
> Missing vendor prefix... but I don't really get what's the point of this
> property.

Is "nxp,lpc3xxx-dma-vc-names" acceptable?

>
> > +    $ref: /schemas/types.yaml#/definitions/string-array
> > +    description: |
> > +      names of virtual pl08x dma channels for tx and rx
> > +      directions in this order.
> > +    minItems: 2
> > +    maxItems: 2
>
> What part of hardware or board configuration this represents?
>
> It wasn't here and nothing in changelog explained it.

That's information which DMA signal and mux setting an I2S interface uses.
It's a name (bus_id field) of platform data entry from phy3250.c in
[PATCH v3 3/4].
It's used by snd_soc_dai_init_dma_data() in [PATCH v3 4/4] to give the
dmaengine a
hint which dma config to use. The LPC32xx doesn't have yet a dmamux driver =
like
lpc18xx-dmamux.c therefore it still uses platform data entries for
pl08x dma channels
and 'SND_DMAENGINE_PCM_FLAG_NO_DT | SND_DMAENGINE_PCM_FLAG_COMPAT'
flags in the devm_snd_dmaengine_pcm_register().
Typically instead of this platform data you would use regular 'dma'
and 'dma-names' if it had
proper dmamux driver like lpc18xx-dmamux.c

>
> Drop.
>
>
> > +
> > +  "#sound-dai-cells":
> > +    const: 0
> > +

The "dai-common.yam" doesn't declare a default value for this so
isn't it required? It's declared in others yaml files like:
Documentation/devicetree/bindings/sound/qcom,q6apm.yaml


--
Piotr Wojtaszczyk
Timesys
