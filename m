Return-Path: <linuxppc-dev+bounces-8533-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACFEAB4F9B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 May 2025 11:23:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxWHq15psz2xd4;
	Tue, 13 May 2025 19:23:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747128231;
	cv=none; b=RujFQmRpxQWC+QeF5k6IXmr/IKVWtM9sjCwrN4zes6dDQxly4CUWLQrPf8rjLyZrMB1B4hbfw6MFrLTHK80yFBS5AkqIKnNRO+A6Lhdk+iyFlrneFy5utjjgqcFqcA/T+yN2/69hdPOyh4Ak51h3ApfYX8J75fRmnos9Qkuey1Ci4i57pLHVjbx7oMi2p1gcNthJfxN+I2Ao3N9bLiu7kZ3NxZbakvmvpSVApBYcbkBc8hkp32QqSfzKfNWEAevtfMuSnxbbrWnCASZsenCavqj/OKKOOl9bMZLMUmLsn3NJLmx5oidptFJHww4WnZFPWj5zTFkW0V6dR1HQTy1h3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747128231; c=relaxed/relaxed;
	bh=U0JysBy8eKyfRaxM8+abK0KKxGJq0+6TwjxqMraY8ao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5mtgGsCINM3V1bCutzusZ4Ool2EvpqiNa4sMQ2JG4rgmXM4NJO+EccV43+8Ahi5hst0oQf4KjBDjORuHJU4tfyAlRfvkSGJ5BxBOYahPEWZkNBRBVwv52wlw0auszsTZYGXDHHKu/Vbz9+0wc1BkApCYzbM56WCX7E4wq0mZXc4O7XHEbk1O5K0UYtlTm99dM8kDJ3oZwuKKFInQG4NHBAcYMbEOKVTZ00PPpyICIwGi/fHw2MLzGadJ4Mob3LyekW7TuaFxQ6frW6zdgppszF1cirHQ1hT8kJQ83RV9/iqHOqzcEjPH4qihxK/h8qA/jx/fe7FjO+e2KoGspsB5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=U2hrNKbN; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=U2hrNKbN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxWHn6WcBz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 19:23:48 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-326c1f3655eso41399291fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 02:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747128224; x=1747733024; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0JysBy8eKyfRaxM8+abK0KKxGJq0+6TwjxqMraY8ao=;
        b=U2hrNKbNCU12M9t3AOrlvcRCwIdp9jdJYVyi6zSZHMKEcMIcv4F9Z0shoadvfDP0hv
         MQ7LjF2t9UFz1ONk9enjaq0UK08c3iYjWDVWOtcxgCYPkTJPzWlbAkXJ/SswfnBgGTiO
         VpWACVvnZGtqBcZ8RtvjyPQzw1hQM5MMdctXZtqXsu8/UbEfVZuFOtJiyD5Ntlths4E9
         pqxanhEQyGh5ccEwMBGFA2EII+rwhALRu2P50xpDclM2oaybxzZPCx3lqTd4kUkU/Imj
         CS6j7nrq7vTZWPbo8gBKEOQY83dNwKayE/YJ3e1snU5Juewl4Nu0yNH6VS/0/509lakh
         Bg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747128224; x=1747733024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0JysBy8eKyfRaxM8+abK0KKxGJq0+6TwjxqMraY8ao=;
        b=FikNAIUy7HJvTFS79YP5vspSaYQzbU70zEYPkp6DQ4Up8Ou1vQuz/aAIMILdt2rv+c
         DlkUHy6zG9XaTA/MA9wSw73olDMbo6fvMvrEKD+s2dz4QiD+aGxdCDkd7JII6OrEHvLW
         /dUJ2I7jIYUtkp0HoL9LT1zHjeBvFkLkOLj1jNQLFcys0XWZEk4tunEcA/WPOk5uhi8y
         9OsIpeb3y9AU9eAA8F91ZaxudjL7ZSxiS0uRi8fyC1YLuM0cnNTPeD55yg56qr2ZVSlU
         /yRugq5X8zhBC2kXjb8ws8AgNdwojTJbOr9prhrtU8JT8MGHJnRRyX9mENS6sMqP5yVI
         BXpg==
X-Forwarded-Encrypted: i=1; AJvYcCU3ucxp8J6Q8z4iQiSKxUC3ujSLba+iiVnAk+UTKrseLPeE2JhVf5Urdezpr9LN9QtQG/yHd4b8ffKfeJc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YytOoSo7HdVEqOurwW/SOk9bS4ao16yN7wvj7u0Jfz+6WDBluwa
	CYGSElvi5YCDBbexUmpHOWMVjxYYqQtS2L40cKlF+ytsqE4ZxscsUI33orPJw5zTaBtnN37nI1R
	AZ8TpzefiFPZlyil9Oct8jfddCvicDOAqkgEgpA==
X-Gm-Gg: ASbGncs45Xl1oSxU3LVTh89YexyLKCBlgG0Z5sLSzrbn5SpDe9uRP5SXhfevAeo046U
	EeaYWQ6bTtPrgenBaZ/5nAOp7qLrx5AtUSFOE8edzLoDs1igtEey7gXQ10Vh231MYy/soc9xT++
	EgNwqXqiFrFlZfWHoMKSpqQHKsY9nG7NQodkvKmwQk6Rk=
X-Google-Smtp-Source: AGHT+IE9sGnGDBaDyOnYm93k9UkhcaHZ8PfclbuY4E3mgnB6Q8BTRsZWrBuS2rmfUo74klAfDLhA1ZQzmF+YltCFggc=
X-Received: by 2002:a2e:ad10:0:b0:30d:895d:2fa5 with SMTP id
 38308e7fff4ca-326c457bbb7mr53536871fa.14.1747128224539; Tue, 13 May 2025
 02:23:44 -0700 (PDT)
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
References: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
In-Reply-To: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:23:33 +0200
X-Gm-Features: AX0GCFt9vVmetkirZ6Xw9vmZM_a30I_l4q58kXaT1ovnCBgyKNlng_Y20L--BQ4
Message-ID: <CACRpkdZjGNxjhgC4X+e4GsMpc8qphFkHAdSvmXg-ttrVJgN-UQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] powerpc: convert board-file GPIO chips to using
 new value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, May 2, 2025 at 10:59=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all powerpc board-file level controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

