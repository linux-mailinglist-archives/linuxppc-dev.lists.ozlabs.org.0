Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F48873C26
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 17:24:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tqd741PQpz3fQR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 03:24:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.179; helo=mail-il1-f179.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tqd6Z5y73z3cbl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 03:24:06 +1100 (AEDT)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-365bd66bea9so25320605ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Mar 2024 08:24:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709742242; x=1710347042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7JdIeS9zNSJ+HV+qdpk2QYV7GDhHiD75PCrvSyuiH4=;
        b=YCJxWfok7yuBzUkJukgktz71tfl/2/OVxZooVz5g5DCuT9UkBuv5Jv3OIpZGKNvyr8
         cnEW0EEpkEDyg79F5QoOGXQP7K22UZDu9IKMcEeXfPYlX4T6P5b8Gjt4TKCAsQLxxMkd
         NYa1g1sqvugjVli0GOe2ozUsHuC8QueRwIkCmHJAz/fCaFP9QJ+ac1KF/kKHliIUfbjD
         2Jp5xdwrRLBkgsBymz9RGcb7uQ5bKzng2DCqqVpt7EGscrglQky1MHBInvawCDYFPZTG
         K/2Up639b6lfFtnpLWBHLFtWV6MfVRl45kmHUThS15CqckRhbHYht0L+TrkY8BZfR6nD
         UKrw==
X-Forwarded-Encrypted: i=1; AJvYcCVWUvqG6o//JIESrkiW53N1wKM9Rx42wAo03hPepzn+GYgD7JxYyHaofCSFrD63elQJvKXvGs+rhYo/dsQYTpPv3GuDolksPsojyt5KAQ==
X-Gm-Message-State: AOJu0YxHstNQmZnIgYpMc7gtDo+aieti55jAO0ry7yGq0vUlslq3jpQ6
	N5yRo8vlhVLX7UPvF2CTc1jPq2cgXwv6wsPMEpD0PXl56fkaFlKr5NLTfm/5W1o=
X-Google-Smtp-Source: AGHT+IHRirkdkwvJMWMt0TzP125i5UM77eCOrvW/TQ2OFfSJUy7pupzBn6NEgqR/xN1bdnxzt9bklA==
X-Received: by 2002:a92:c54a:0:b0:363:f8c5:9d7b with SMTP id a10-20020a92c54a000000b00363f8c59d7bmr20421766ilj.9.1709742241717;
        Wed, 06 Mar 2024 08:24:01 -0800 (PST)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id r4-20020a92d444000000b00364b66eb5e3sm3764806ilm.24.2024.03.06.08.24.01
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 08:24:01 -0800 (PST)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7c864b742e5so79584639f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Mar 2024 08:24:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXMQ9ltu4IWlQX4gYsuRMd9bKsHpU8NuEwtT30ZbEcRwsDyi93xN7yYprkuACnk1S8XR1bLO0TlzUGhyzw9cELn+br8QzN4381Fspdy8Q==
X-Received: by 2002:a25:580b:0:b0:dcf:c7ef:e4e0 with SMTP id
 m11-20020a25580b000000b00dcfc7efe4e0mr11968959ybb.1.1709742220242; Wed, 06
 Mar 2024 08:23:40 -0800 (PST)
MIME-Version: 1.0
References: <20240306141453.3900574-1-arnd@kernel.org> <20240306141453.3900574-4-arnd@kernel.org>
In-Reply-To: <20240306141453.3900574-4-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Mar 2024 17:23:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5ut09=b+5Qti6CD17XOOmsm+VtfA7TKac7qHNOBC2-A@mail.gmail.com>
Message-ID: <CAMuHMdU5ut09=b+5Qti6CD17XOOmsm+VtfA7TKac7qHNOBC2-A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arch: define CONFIG_PAGE_SIZE_*KB on all architectures
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>, Stafford Horne <shorne@gmail.com>, Jan Kiszka <jan.kiszka@siemens.com>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-alpha@vger.kernel.org, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, Kieran Bingham <kbingham@kernel.org>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Andy L
 utomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Johannes Berg <johannes@sipsolutions.net>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 6, 2024 at 3:15=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Most architectures only support a single hardcoded page size. In order
> to ensure that each one of these sets the corresponding Kconfig symbols,
> change over the PAGE_SHIFT definition to the common one and allow
> only the hardware page size to be selected.
>
> Acked-by: Guo Ren <guoren@kernel.org>
> Acked-by: Heiko Carstens <hca@linux.ibm.com>
> Acked-by: Stafford Horne <shorne@gmail.com>
> Acked-by: Johannes Berg <johannes@sipsolutions.net>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> No changes from v1

>  arch/m68k/Kconfig                  | 3 +++
>  arch/m68k/Kconfig.cpu              | 2 ++
>  arch/m68k/include/asm/page.h       | 6 +-----

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
