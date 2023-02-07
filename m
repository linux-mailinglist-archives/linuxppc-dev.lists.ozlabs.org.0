Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC4668E53A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 02:05:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBMHF2X0Zz3cgs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 12:05:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GuPF+8Gj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=dmitry.torokhov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GuPF+8Gj;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBGYS0xMBz2yNs
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 08:32:10 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id u9so12819652plf.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Feb 2023 13:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cTC6wNmhItyMEElEpGFXa8WJ3XfORro4b70rdsps6o0=;
        b=GuPF+8GjCJo3Bv/FSUkP7V624DONZsgKRAdIrvRl2YyIiW7XhBxcLRwW8Dbo0WHo4/
         gWeBXiyd23u0JU/wn+dRPdA5GR3Arl6vuCtBwP4eLMHcMJntKln0jv/gQTivZoVGNy+L
         x1nk4o6lG7MxEj41ozS4hZTUa5kSmxJlczPFlhIY0Bev07KN3nsbYPWxgw04YqgRHXgM
         H1SJ9hnQNC6ymPwNiVfY2mJd0IFIMBAoGPlSP60M4+yIi6PNbW/2sgS38IoIq7PcwoUg
         h8Z1h5rI9akxItHMnNGQXqodMNTJCgkbn2Kl7ltL4NcRryTi+Ef6iT52cHPCW2iMqAVh
         7OFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTC6wNmhItyMEElEpGFXa8WJ3XfORro4b70rdsps6o0=;
        b=6G5xLiGVRM1I6XGg6CLJ7hx6HzauF64XLXYtImm1emTTmycoJtLr31EjzxWrYTjbNr
         Lq7H8LN5sDms8KZSOGlDCn+o40/DQIRYUb4XlIREyUDDVMnmef34ua9Gq7Jg5So42z3f
         FJxifIqTL8BiC9o2KghzSxp3x364qm8NpNDAzdGVOCn+W9IS7XQjDd11+8cKeZkP8HOZ
         HBNlWdxcv3GHX48CCXHtSP1JU6qb9x8ZWpY61FG9OAVt+A7fMiV4qBAj7d686GcLFE6V
         tWz5tR4ZZ5JniBI6E8Bjs/im9JK24czX9qEfeYboqa4FojZY7PubaS1w+f+fnt+z6zfi
         T27Q==
X-Gm-Message-State: AO0yUKVQTZLrCYAdtc+fUM3XJG6DzyI2+SoRSdLi4ecNl+I1mov24nkj
	Z4fv0tJqhfXEcjauUCQk4dQ=
X-Google-Smtp-Source: AK7set8S733/lSzocO4PhiGH97JuaxlIu1uyBJfIu/+7WmPOF35HnmMyyKLJccnN1cXH8ZQnKFrByA==
X-Received: by 2002:a17:903:244f:b0:199:30a6:3756 with SMTP id l15-20020a170903244f00b0019930a63756mr3394795pls.18.1675805527758;
        Tue, 07 Feb 2023 13:32:07 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:c930:81ab:3aec:b9cb])
        by smtp.gmail.com with ESMTPSA id k5-20020a170902760500b00192d3e7eb8fsm9333284pll.252.2023.02.07.13.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 13:32:06 -0800 (PST)
Date: Tue, 7 Feb 2023 13:32:01 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 04/12] gpiolib: remove gpio_set_debounce
Message-ID: <Y+LDUTfKgHEJHNXB@google.com>
References: <20230207142952.51844-1-andriy.shevchenko@linux.intel.com>
 <20230207142952.51844-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230207142952.51844-5-andriy.shevchenko@linux.intel.com>
X-Mailman-Approved-At: Wed, 08 Feb 2023 12:03:35 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexander Aring <alex.aring@gmail.com>, Rich Felker <dalias@libc.org>, Devarsh Thakkar <devarsht@ti.com>, linux-doc@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Eric Dumazet <edumazet@google.com>, Lee Jones <lee@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Li Yang <leoyang.li@nxp.com>, Frank Rowand <frowand.list@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Qiang Zhao <qiang.zhao@nxp.com>, linux-arch@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-sh@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, SHA-cyfmac-dev-list@infineon.com, Geert Uytterhoeven <geert@linux-m68k.org>, Alex Shi <alexs@kernel.org>, linux-input@vger.kernel.
 org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Arend van Spriel <aspriel@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Hante Meuleman <hante.meuleman@broadcom.com>, linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Yanteng Si <siyanteng@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Franky Lin <franky.lin@broadcom.com>, brcm80211-dev-list.pdl@broadcom.com, Keerthy <j-keerthy@ti.com>, Mun Yew Tham <mun.yew.tham@intel.com>, Hu Haowen <src.res@email.cn>, linux-wpan@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, Jonathan Corbet <corbet@lwn.net>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Krzyszto
 f Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linuxppc-dev@lists.ozlabs.org, Gregory Clement <gregory.clement@bootlin.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 07, 2023 at 04:29:44PM +0200, Andy Shevchenko wrote:
> @@ -1010,14 +1009,21 @@ static int ads7846_setup_pendown(struct spi_device *spi,
>  		}
>  
>  		ts->gpio_pendown = pdata->gpio_pendown;
> -
> -		if (pdata->gpio_pendown_debounce)
> -			gpio_set_debounce(pdata->gpio_pendown,
> -					  pdata->gpio_pendown_debounce);

Can we please change only this to:

			gpiod_set_debounce(gpio_to_desc(pdata->gpio_pendown),
					   pdata->gpio_pendown_debounce);

and not change anything else (i.e. drop the changes below)?

>  	} else {
> -		dev_err(&spi->dev, "no get_pendown_state nor gpio_pendown?\n");
> -		return -EINVAL;
> +		struct gpio_desc *desc;
> +
> +		desc = devm_gpiod_get(&spi->dev, "pendown", GPIOD_IN);
> +		if (IS_ERR(desc)) {
> +			dev_err(&spi->dev, "no get_pendown_state nor gpio_pendown?\n");
> +			return PTR_ERR(desc);
> +		}
> +		gpiod_set_consumer_name(desc, "ads7846_pendown");
> +
> +		ts->gpio_pendown = desc_to_gpio(desc);
>  	}
> +	if (pdata->gpio_pendown_debounce)
> +		gpiod_set_debounce(gpio_to_desc(ts->gpio_pendown),
> +				   pdata->gpio_pendown_debounce);
>  
>  	return 0;

Thanks.

-- 
Dmitry
