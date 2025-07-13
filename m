Return-Path: <linuxppc-dev+bounces-10229-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2AFB0304E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jul 2025 10:49:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfzfM1vgQz30Vs;
	Sun, 13 Jul 2025 18:49:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752396587;
	cv=none; b=GACotpt7q1Q3GAW+Bw/JeR9IHqG3eaynRiMD6B1ywro2tQC3CfROqnDzNJhaZ8paL6xDwoM8xFuwwWjg7GfFmo+JtNreC0P+OYyC8IapvLnIHM9nPDlwDifEAGQWdYvTG9SSfc+YqSpZcICoptVuAKoibeuSNl17o4QpK0VRCtKtE1a3DIHkUAfxnjO2yUDb/sQM6KzX6EZnu9Sdx0kLVMxphlLVlfFb9OB8WMPYx1fHztNgHb8qwi56i9PnZokAyJdzwA+zzJlKtGdZPKrLPnPsHT5qqsgE5YmiJmDTMPBbomiBCUigJlaV6t2ghR2IpG9ZiZU0/7rTH9aq1C6P7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752396587; c=relaxed/relaxed;
	bh=i68FJiG6+f1ETXgbeYCotuF64Qw8JxOf1zX940i2cSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LDC2AkJpKuxcPEDKX/cYpL96uZhNnuIWFUQqbMLSfcxNw2aR+cQZuCFUz6yo85i5zZY8QzKR7cfq5g+QjJp/m6d3zPuvBdaf6Jg7bsaGRiu+vnH9NJn6kHx0Ap9wg7dWFSZBYQ9tXJEUAyAn/ICsvDI6jsyu9wRGny0uTPSSsa5PBr8K3lMg+JWwONSIQdOj/Nptad/NOW0cmlsuJhipSqM3+KYxjrpgPo+CSZQHWZlKuQCzVgGZOub3/A2wy85iG1Y5eAdra6hfWToHyLnxSfak6Thtt6G6oJaSvJMTr8M//OZZSuKyO3ASsVhInv12VPlx60OZS9j7UQ0jVyegWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=2roLbd4B; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=2roLbd4B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bfzfJ3rJrz30MY
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 18:49:43 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-556fd896c99so2864618e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 01:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752396578; x=1753001378; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i68FJiG6+f1ETXgbeYCotuF64Qw8JxOf1zX940i2cSU=;
        b=2roLbd4BMTjG8hJ3PThTdFCkgYs0Qd2uDM5pE6y8CX9tQOYFf91ZGPBN4iY1FAQ9hr
         4tenqipc8rMga/tayaOpVs3+Ls45BB17MbxQP76a5oybPgUare2oc3bqfZ4yAbY6Mr0a
         mQH7R7FAvBLxjaUdtLQQr48ILSJF8kJa+beiCEF9R10Lc+hMD54lbIOEyF9j9RkL3mNB
         zFPyfMmd167RM2ihA3mpk1PV043Ho4MRYTzAc8vMRGYaGE9f1qPJ/WiNBGllyraLS6IB
         jPFb69RI4lVocLL20oFKRRVyHJSfYc/rTv4WDtSPsb0gThPFQjCbQicdMqHVYqNS35ur
         ZvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752396578; x=1753001378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i68FJiG6+f1ETXgbeYCotuF64Qw8JxOf1zX940i2cSU=;
        b=Y7d9Heih5+ZDPfC6XqvadZPbWQvF0Zk36Wn5XAQ9HS7R5WKaKzjt/JurZOcm9ax4kj
         Vgn/aFVxqO9V9v7188jgh9KaxZlbx2Te9xtdTU7bP09mixmgBXFOJrTUYOp1md3BZnyG
         mo7x1md8U4+1jG+6r4g4Hs8H/p7usgSVfdWNdlb5W6mHfqoVE6epHjzz/VwawK4lOcXb
         Z1pJsTV0wAxu782Z5sIi/TJJivB14QlZYcwG3zhDZuwDxw/nJtDu7rwJxebf7jSxJpoa
         rOS3QFpz/TL3FXEtqYyqHwmVD2Isk5iRJTdceHeVLMMp9BF9QOhF8Vs2ZtltuDr7Ko2J
         DkUQ==
X-Gm-Message-State: AOJu0Yylptf1jBWbepTblE7efJo1OJ0m2ScNVSJwDGOec7hVKYYOPj/S
	ww84flqVKyaW2G/NyJDqje9hNs9hvx4ZGLMh89AgeqAQ6JZVv/ZlbZ/n1+mCFirb29Qb/pHSOQY
	xLzV2bltWkDNtVVTwyTOxNkiTNVLQ1s8Ge2OIg0J68A==
X-Gm-Gg: ASbGncvIJ5v8rIO6La56M/4rqaZWCfl+6zio3y/aAfeh81g+r7ZCu/3ZnqbhOnxeIP7
	Zi4XHfTrKpNvsMuz7Md6zwKSqlQpOx4ibCU05skx03BwuktC8ZGL1O0M/FaYHBvTajG71GrEA3P
	rwsm2aoFOaW3W3d8q0nBZZ14tYizIGBMKKjih4hWggiUxomFZ8N5EnwBMc3s4a16KXvjn4PUWOZ
	n+tj9MX3Zj4eb6Zo7snVNZz0iwNCi7A8FjYJy/gMyeSRTcM4Q==
X-Google-Smtp-Source: AGHT+IHSVlR3f84ykKc18xLN16yOuI1UBS+R1HGXkNcrI5d6VuncH7GOy5up7ZkTvuUg5ocaceSyWG2pJHHAQMTtfQA=
X-Received: by 2002:a05:6512:6cd:b0:553:2355:1f26 with SMTP id
 2adb3069b0e04-55a0463d16fmr3003378e87.50.1752396578149; Sun, 13 Jul 2025
 01:49:38 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org> <20250610-gpiochip-set-rv-soc-v1-1-1a0c36c9deed@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-soc-v1-1-1a0c36c9deed@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 13 Jul 2025 10:49:27 +0200
X-Gm-Features: Ac12FXyhZJT7lfbn0I6DoUYvpi_8wvzLxArloCSn9kbjMpsbWPmC7MSTvAUWCwE
Message-ID: <CAMRc=Mc1UyWgWwUFVGw=1EVJb1u4MQYUKcguiQedmbxTK6pY1w@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: fsl: qe: use new GPIO line value setter callbacks
To: Qiang Zhao <qiang.zhao@nxp.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jun 10, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/soc/fsl/qe/gpio.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
> index 3ef24ba0245b75471ffa10f579bb744c0c3b7e43..5391cce4e6efe6d120db7fdf7=
509dc5eb840f344 100644
> --- a/drivers/soc/fsl/qe/gpio.c
> +++ b/drivers/soc/fsl/qe/gpio.c
> @@ -57,7 +57,7 @@ static int qe_gpio_get(struct gpio_chip *gc, unsigned i=
nt gpio)
>         return !!(ioread32be(&regs->cpdata) & pin_mask);
>  }
>
> -static void qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val=
)
> +static int qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>  {
>         struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
>         struct qe_gpio_chip *qe_gc =3D gpiochip_get_data(gc);
> @@ -75,6 +75,8 @@ static void qe_gpio_set(struct gpio_chip *gc, unsigned =
int gpio, int val)
>         iowrite32be(qe_gc->cpdata, &regs->cpdata);
>
>         spin_unlock_irqrestore(&qe_gc->lock, flags);
> +
> +       return 0;
>  }
>
>  static void qe_gpio_set_multiple(struct gpio_chip *gc,
> @@ -317,7 +319,7 @@ static int __init qe_add_gpiochips(void)
>                 gc->direction_input =3D qe_gpio_dir_in;
>                 gc->direction_output =3D qe_gpio_dir_out;
>                 gc->get =3D qe_gpio_get;
> -               gc->set =3D qe_gpio_set;
> +               gc->set_rv =3D qe_gpio_set;
>                 gc->set_multiple =3D qe_gpio_set_multiple;
>
>                 ret =3D of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
>
> --
> 2.48.1
>

Christophe: let me reping you here as there's no reason for this
relatively trivial patch to miss the upcoming merge window. Do you
have any objections to me queueing it via the GPIO tree?

Bartosz

