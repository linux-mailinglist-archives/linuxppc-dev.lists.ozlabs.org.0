Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 924B589FDA3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 19:03:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y09VKzG+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VF8KY2cHMz3vdS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 03:03:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y09VKzG+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VF8Jp0x0Xz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 03:02:32 +1000 (AEST)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3c5fea1bb42so376169b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 10:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712768548; x=1713373348; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMoPP11thXk4/7UbTWGCDNVZtlBCq9YfZi08dxGpwkM=;
        b=y09VKzG+ljFg4wpi1EW4d/+PpFeJRloeC32G5KnKOzUHDm0874lLGO0QWSjZ4NpsEx
         4XDUCxDu8yddtPSZB4XkMAlclBwH90JNfsa9GMq3T0DFQXYhdmThA2FEtbvOWclU+SgD
         jMqAkyybXR8MornWW0CvOEEJdhx33s0iV5amMTi+pa/7aEHLLHcAElx5gz1KhDVN5TsK
         yEi6aHg+zm5k7PlATZNmkLKTwYhBfbKCHpPJskAAATfPDjqxvo9d53oJCjZAd4Gwkxnq
         1ZO/Lj2ofmUhlA3+E8AUsN2qsIH4l795TELRrL6yaoexY+kZAqkmgQnsRokF4Y90ZEYY
         ogww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712768548; x=1713373348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMoPP11thXk4/7UbTWGCDNVZtlBCq9YfZi08dxGpwkM=;
        b=hq7zmoVgh4ZKvx+3r8Z2+Qd9ZebY78esRwtTo3rkkZRmbu+G+UOvMeSloyLLlbSsra
         4Ng25REbf6slQqiojvgS1WKOHuRrxZiHqHw9YRr10Osi+J9jzupQfLpO8IWbw4snLeY3
         PESeediT2PiR8SnBWzYeVhNkluzKpdhEpBEm9A/ul4eRAlrfQYmOFOGHK63FPRZzH1h2
         5lDB1q23SbAghO2zj5sMQtX+KN6EmElZzRjeY4H300qLg2kIzfDpDV+JgjFHP4Cz0TV3
         sRH6DnUF8VlWBzWd/EHCsuLqlCF9qEIkPDg72IEn+LzTSmGeyJjqBdY3eEFV+/JR9Ga9
         1kxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYmMvCgrt7quRmVJPeUYjQxcE/WqhtrRzYtxQqdnJUkKiclxQ3Twoci7OKLX7yPXsSj/ivw3NlqI4er3og8zhoIg59EU3SMfkEE09s2Q==
X-Gm-Message-State: AOJu0Yxg+sD0XUzmUxa9JAAp0CM8Og3dsNjQWwWRvN9I4gx0TVkvMo85
	N74wP32F1OHTGF2w/5yWWN+zE8xCKbRxdW0tnZra2i64MD+0kwzB5G8KA9+GtKePQ5as3LsWNvH
	TJ0xJUePSb4JhQYWWY8CqfgBtf0/KvWmSV1hzvg==
X-Google-Smtp-Source: AGHT+IFNF1nhZXvybXgcJEFh8M4RKpKSYief0sXA9TsDfyic6FFts1F5HiYeJTzbEnw67nBhXnq5gM9nLeSrRUK3LkY=
X-Received: by 2002:a05:6808:20a3:b0:3c5:f831:5f33 with SMTP id
 s35-20020a05680820a300b003c5f8315f33mr3792446oiw.16.1712768548028; Wed, 10
 Apr 2024 10:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240410153212.127477-1-adrian.hunter@intel.com>
In-Reply-To: <20240410153212.127477-1-adrian.hunter@intel.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 10 Apr 2024 22:32:16 +0530
Message-ID: <CA+G9fYsZcOv+tE09K20b7G=4s9D=HxAYwMV_zx0oWa1r2mqdrg@mail.gmail.com>
Subject: Re: [PATCH] bug: Fix no-return-statement warning with !CONFIG_BUG
To: Adrian Hunter <adrian.hunter@intel.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, John Stultz <jstultz@google.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 10 Apr 2024 at 21:02, Adrian Hunter <adrian.hunter@intel.com> wrote=
:
>
> BUG() does not return, and arch implementations of BUG() use unreachable(=
)
> or other non-returning code. However with !CONFIG_BUG, the default
> implementation is often used instead, and that does not do that. x86 alwa=
ys
> uses its own implementation, but powerpc with !CONFIG_BUG gives a build
> error:
>
>   kernel/time/timekeeping.c: In function =E2=80=98timekeeping_debug_get_n=
s=E2=80=99:
>   kernel/time/timekeeping.c:286:1: error: no return statement in function
>   returning non-void [-Werror=3Dreturn-type]
>
> Add unreachable() to default !CONFIG_BUG BUG() implementation.
>
> Fixes: e8e9d21a5df6 ("timekeeping: Refactor timekeeping helpers")
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes: https://lore.kernel.org/all/CA+G9fYvjdZCW=3D7ZGxS6A_3bysjQ56YF7S-=
+PNLQ_8a4DKh1Bhg@mail.gmail.com/
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>

This patch applied on top of today's Linux next-20240410 tag and
build test pass.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

> ---
>  include/asm-generic/bug.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

--
Linaro LKFT
https://lkft.linaro.org
