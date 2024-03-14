Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 282BD87BB56
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 11:34:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mvqU35Ow;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwNzW6d7Tz3vYh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 21:34:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mvqU35Ow;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwNyn71XXz3brl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 21:33:53 +1100 (AEDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a450bedffdfso84418266b.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710412426; x=1711017226; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jue9nUfRRiSlNQWu5LcHhmk+uFTWQIyCfZh4ap/Abso=;
        b=mvqU35OwfVjWXQR+A+ZxI/X+g4iJjpTXUYLJCJ1Zy9gCxttX0Hc1KKfpftuJ/2e5Ek
         4tk0z7aSS6i8/AUl1J48F4QDti/ZdxVwrcr4+j/n25MfITsccUFlAGXRe3lGOEDz32vN
         ZELST0Ezbpq8Kk3dl8xbYRHkdZP3E6AfP77dx5Qmj4GojwM2SfVU0/TgAF9kNIWAQ2nU
         wsoprhbAiHlfaG2oOcJ/CO63o9DOS51sv1X/uYta+jeNXjL1dgLMSvdiCXe1MJgbILxp
         wlJqvxw1E+w2gs/IpIL8z4wm4NWby9qt1Sn3l5G4byhEJpTgj4RJ54PRvilP8ylqYnmJ
         z/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710412426; x=1711017226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jue9nUfRRiSlNQWu5LcHhmk+uFTWQIyCfZh4ap/Abso=;
        b=POtYO/RqhOpR15XgjW0RFtv2GlZ5/F5KR2kPpzxlBTXoBsnyqHVmxI3RplPbWFoLej
         KkllczFaLRcUKc8JkpF/r31ZD6UiEedz0mpiGDmXR8EmrnslRwVWdNEepKpBtJctItLH
         n/XEEm7qDUwwVZdnix+tAK64y4ASi21haehcS/OeTwy4x1/8GoSJAR1vOjxeJVNWG+C7
         IeLzJBooybu/aoUnmXt3EubwEGwNRQ+TNKVXbvlRK7MmAQQtA5m8KfzYq9vBQ8UW0rRt
         /SjDtaYwlSNsTUhcysfKcs/YCU6nXVnUpDWL8/3TpTrZ9A3hpVF/6t7mqrg54RWTmcXf
         TvCg==
X-Forwarded-Encrypted: i=1; AJvYcCX9Stb51pkyLkOB674nS2KK6z6RUGjW8G3FtYqJnrTiuIK7FI4A9q0a32HZySXOYVoJEZvBJwIyB2tXlUQJMWnS6UvW5WyvrL7MtRqVSw==
X-Gm-Message-State: AOJu0YxqbR0J3JViZROEcaZvqE14zyi3yDGBL/SmuGddvFUdDWmSS8Jw
	cDbHWN+9rLKgkjTIZR3YzmU7OrAgPq5ru3unXFgI5fYCqfLlBLZ1o/2YoaRRvpsGsIsLNmj9ec5
	DcjRPrk9oQPT24Urm0Jyv0vz6v1w=
X-Google-Smtp-Source: AGHT+IH8HWWnhtzc44YalKwroFKYB1nvrYJZ4DjNqdGPigNqIr2X3HYd15E33bbNFvnnosUzFyxAXDmeUagTjt+Dz5g=
X-Received: by 2002:a17:906:3752:b0:a44:8fa9:d36f with SMTP id
 e18-20020a170906375200b00a448fa9d36fmr927863ejc.41.1710412426337; Thu, 14 Mar
 2024 03:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240314084531.1935545-1-gnstark@salutedevices.com> <20240314084531.1935545-2-gnstark@salutedevices.com>
In-Reply-To: <20240314084531.1935545-2-gnstark@salutedevices.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Mar 2024 12:33:09 +0200
Message-ID: <CAHp75VeHsSvs5eUC2eUTCLJLKNcoPShXoH3fmA0J4GUQTMV1LA@mail.gmail.com>
Subject: Re: [PATCH v6 1/9] locking/mutex: introduce devm_mutex_init
To: George Stark <gnstark@salutedevices.com>
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
Cc: kabel@kernel.org, linuxppc-dev@lists.ozlabs.org, vadimp@nvidia.com, mazziesaccount@gmail.com, peterz@infradead.org, boqun.feng@gmail.com, lee@kernel.org, kernel@salutedevices.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, marek.behun@nic.cz, hdegoede@redhat.com, mingo@redhat.com, pavel@ucw.cz, longman@redhat.com, nikitos.tr@gmail.com, will@kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 14, 2024 at 10:46=E2=80=AFAM George Stark <gnstark@salutedevice=
s.com> wrote:
>
> Using of devm API leads to a certain order of releasing resources.
> So all dependent resources which are not devm-wrapped should be deleted
> with respect to devm-release order. Mutex is one of such objects that
> often is bound to other resources and has no own devm wrapping.
> Since mutex_destroy() actually does nothing in non-debug builds
> frequently calling mutex_destroy() is just ignored which is safe for now
> but wrong formally and can lead to a problem if mutex_destroy() will be
> extended so introduce devm_mutex_init()

Missing period at the end.

....

> Suggested by-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Needs properly spelled tag.

...

> +static inline int __devm_mutex_init(struct device *dev, struct mutex *lo=
ck)
> +{
> +       /*
> +        * When CONFIG_DEBUG_MUTEXES is off mutex_destroy is just a nop s=
o

mutex_destroy()

> +        * no really need to register it in devm subsystem.

in the devm

> +        */
> +       return 0;
> +}

...

> @@ -19,6 +19,7 @@
>  #include <linux/kallsyms.h>
>  #include <linux/interrupt.h>
>  #include <linux/debug_locks.h>
> +#include <linux/device.h>

Without seeing much context can't say if there is a better (more
ordered) place to squeeze a new header to. Please, check.

...

After addressing the above comments
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko
