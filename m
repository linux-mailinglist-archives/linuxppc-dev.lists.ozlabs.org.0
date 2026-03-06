Return-Path: <linuxppc-dev+bounces-17857-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNdXHUZjq2mmcgEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17857-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 07 Mar 2026 00:29:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DDC228AF6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 07 Mar 2026 00:29:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fSN0261rYz3cB3;
	Sat, 07 Mar 2026 10:29:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772839746;
	cv=none; b=YupvELnQpe+l63Qj7ZPsBAXE3nutQoIRRA+V+J+wSOyZTWRcL5LkvdJlrr2uRs9H1imb8wU8sQHaP29gvy4dRDhuPgIsovfbDUe4NyNKUEeTiTmBoUoMe98U2b0mRTpf3DtCLiNBf8vrVKPzuzsQgz8bH08tUUfsf5+3XmYWxu39w524pA4kH9K5a81FskVIfF9dyRfwY+/GR4S5YixOt50AndgbNv0n6nw8eMVBA4G0iefG3V5Da9Ea/ygfWApYwKjtq8FLMFo49SZMd5ad/TaPxefFdtuYoQrCbH+t3moAyZTa0kxsb9LA3v8yLr682B86aikDKTVYYzVG07m/0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772839746; c=relaxed/relaxed;
	bh=jmuJidMV1Wwe0qpdw07DaES1yYrCFjR7mRIMJgUWNXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THJ/rKiU+Y2cptqlO9rXmBdEhYHgri1UDSyaVhQgyjGLAiaKJKN0RDu+g1x4/UqiWolW8/eJEA4ES56S4PCVmp33zfUaU8dX2axxpYOuweFiAMqE2W/0+trgKhX3AKtqpI5f8n0XQOqetrWdZ2G0cEw1W18Q6bMktCzZAGi9GqxreLyc4DpWoMuvUOiN77sRHQ4EKqDG1CysGGyOFEoFQZhcoylScEt5F8D+1xu4x44xGZGIb4S3J/MFALcbFmac1EC/8kLx46yFShXMcrsH/yXhHDHpczdL3jjB7ol8iz3wkBX7qjUWDmJVB1ZaBENO5D+2smt9H8bBqCjiRbBr6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XAICvB62; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XAICvB62;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fSN010xfrz3c9l
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Mar 2026 10:29:03 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-82735a41920so3743979b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 15:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772839741; x=1773444541; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmuJidMV1Wwe0qpdw07DaES1yYrCFjR7mRIMJgUWNXw=;
        b=XAICvB62+KGP9ue7Ll7LppEnxdPN9TwryMA/qiFeMsQBwLxo/5MfGFBnoA91901vbo
         5Za8vi1hNUUbzOcPX83q6EtMThmW8y+RQNPZllSZKabj4r0Au5sXqVX9ob1pGD+Kz7Su
         OvX+evD3oMxgzON4ZAPau0ThcSsQXzv54raZVLZe4mi3g8QJOJniLu6wyJUGcg8eUut7
         1NrZ2y7JFFXqEPp1s5DvWrWF4094v5kLJD/+QGFinJmb/OquNzAEL7OseCMY4ndBXisF
         zgzwYv4UChDyAQH3cKYrN8HUrgWAj7MGrC/0lMiVLTSzhfbPXg/YWp96rg+1LPm4fCrA
         GPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839741; x=1773444541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jmuJidMV1Wwe0qpdw07DaES1yYrCFjR7mRIMJgUWNXw=;
        b=UleBWytVuN/xNDcgp5Fr5R2EzI2zyCHse85GNflr/yn+E1X8vVrf3Rc7J7Z1i5azlP
         V6i5GApE25d0AKu3onnVmo5RSHMq4YC1w6HGDLMb5eB4gP2vWvnFoV6e8j5ENITdE9Yo
         ZQCXq7XLnvtDpVYf7O96l24HtTZraXZqFzLjSNQtd0gZpKQ2GHzxyrtM6PdED1B9m1wp
         soEIACnOqYJm/eu487hiRJhFchdzCn9Vn2eaCwliP8gT4+76eq5OgxV3rQKKfL+mShaY
         tKUmuL0RcZcB3OOFG2Q5CRMX9lYwU2r7EJ33Y4Yal+gh4D5bY7QKy79KKGqRLpRnpCOw
         ebyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHG6Xhuen/4uQlJfecZqikLpYIKAY+N5YdZL5CE7fB7pzG1FWMl2LSKlKIq5piiAUHti6j2touvDTL7zc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxXSOTt9ozd0xcaixXu4iE8ey0yYPGCS/DTtRnY8ge7K7bG9zGw
	Tjgab7KHkCkQjr1bTBwkQCyBDgqtR+O0nen6hYOilZYGSvFo3FYUkmkH
X-Gm-Gg: ATEYQzy69V11E74JKiqHQs5dwPVrA5xzgEttU8WU1pH0NpxHRmoTBMU76wMBZGKZzuM
	EC2gxgSip8DGiu/7utfq2DixcS8vafHZdGjTl9Y1MmWL+h7SDJ64dJ1xgEPkl7y5OGEbshRRFEv
	cQa40jO9kcssIfKlPB9b4/dkaUVrWHPReZIjprvAK7zF28fQDfsbidGDHnMnCo0NMK5eTfb/xzi
	HWymIVEQwwe7MHYUzbkm0ixhfV+l+L/qOAEej05d8WBeg+Fg7+bWQdlt3U+QsfcycBC7it40ELf
	f5QMVVgfncZxznZ2vGbAjisJsfXcgvyHLSP4OkdbuabbcsKk0d2T0zDz1/OHqungRpJ6P01wG9S
	+dMYWd9aPc3no/2qBpWzMiHU0fVDVXiE/zvPT5nsQI84Q6QXcNZGPCPRCne8wFitl6qQQlvLpmQ
	MVoRROrD+7qr9TNs6yKU9TqPxFfNUM03M7DsKa
X-Received: by 2002:a05:6a00:9510:b0:829:8942:2c93 with SMTP id d2e1a72fcca58-829a2d86b43mr3749707b3a.9.1772839741072;
        Fri, 06 Mar 2026 15:29:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48d3621sm3213092b3a.62.2026.03.06.15.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:29:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 6 Mar 2026 15:28:59 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sre@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 10/14] watchdog: convert the Kconfig dependency on
 OF_GPIO to OF
Message-ID: <2c6ad0ca-fd72-4bf5-9180-f45c20e60d37@roeck-us.net>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
 <20260304-gpio-of-kconfig-v1-10-d597916e79e7@oss.qualcomm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-gpio-of-kconfig-v1-10-d597916e79e7@oss.qualcomm.com>
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 87DDC228AF6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-17857-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[46];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:abrodkin@synopsys.com,m:vgupta@kernel.org,m:oss@buserror.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:dvorkin@tibbo.com,m:wellslutw@gmail.com,m:lee@kernel.org,m:pavel@kernel.org,m:wim@linux-watchdog.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sre@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:netdev@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linu
 x-leds@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-pm@vger.kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,synopsys.com,buserror.net,linux.ibm.com,ellerman.id.au,gmail.com,lunn.ch,armlinux.org.uk,davemloft.net,google.com,redhat.com,linaro.org,baylibre.com,googlemail.com,tibbo.com,linux-watchdog.org,linuxfoundation.org,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,roeck-us.net:email]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 10:02:31AM +0100, Bartosz Golaszewski wrote:
> OF_GPIO is selected automatically on all OF systems. Any symbols it
> controls also provide stubs so there's really no reason to select it
> explicitly. We could simply remove the dependency but in order to avoid
> a new symbol popping up for everyone in make config - just convert it to
> requiring CONFIG_OF.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/watchdog/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index dc78729ba2a5d6e035ed3cbe5c2b631d11b76b20..ef200339a22a6f9c51a46c9c0b8466add74313e2 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -250,7 +250,7 @@ config DA9062_WATCHDOG
>  
>  config GPIO_WATCHDOG
>  	tristate "Watchdog device controlled through GPIO-line"
> -	depends on OF_GPIO
> +	depends on OF

AI feedback:

  Could this change inadvertently allow the driver to be selected when GPIOLIB
  is disabled?

  In drivers/gpio/Kconfig, OF_GPIO is defined inside the "if GPIOLIB" block,
  so it implicitly depends on GPIOLIB. By changing the dependency directly to
  OF, the GPIOLIB dependency is lost.

  If GPIOLIB is disabled, the driver will still compile because of the stubs
  in include/linux/gpio/consumer.h, but devm_gpiod_get() will unconditionally
  return -ENOSYS, causing the probe to fail. Since the driver's sole purpose
  is to control a watchdog via a GPIO line, should it be prevented from being
  configured without GPIOLIB by using something like:

	depends on OF && GPIOLIB

It has a point. Please update.

Thanks,
Guenter

>  	select WATCHDOG_CORE
>  	help
>  	  If you say yes here you get support for watchdog device

