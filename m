Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E81A868B21
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 09:46:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkWKk6gdnz3vc9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 19:46:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.44; helo=mail-ot1-f44.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkWKF6t4Mz3c1C
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 19:45:37 +1100 (AEDT)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6e497a1481cso639518a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 00:45:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709023534; x=1709628334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uzwNvfzqcMx0O3hVp46LgRJMNTPfRBstut9NEe744kY=;
        b=fCSLYaOgL86HUSKbSGnlhGuLfLa6qE0thN1FJ9ekkYwfFrOIzYTK2wYoUA/9tY0Ql1
         Vukn8ejbvp13sndyoZHFk5wx8cxU17g7t/5d/cRZq9hvMv7hQEY95GSIs3z4MWPIX/n2
         VN03uZx2c5v3GY+CI9d9RR7S09W66dQ6ogzLteeM7MDmDhv2iwAd+Ptb1HJYwLRAdBtG
         xazWw9qW9UwReF9M7xmccQCZEbm9TzRY0/l5bTIbcP5ZYrc3tlZQKmmRzWrljTUfnu7B
         Rhj+K9JhKkSpjBxdMpVgQqIPfnRNJ4jf1987FFyGcW9rqpsYDW9UYFoQ1/UT+Irxcdbw
         SUmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqLzUOu/yBzv0C57K3h30QtWr9Nwf21qUFELxcN4pCiRVP5J61Ao/8xjBdSdJdMyhaQuDS1JNnOjopTtGN1jUdEA0VpS28X4kBe2qn8A==
X-Gm-Message-State: AOJu0Yy1SlZ05LDws5m202t3ZglfIJpb1gg0hghEYli7g001rNw4pdEN
	zIEaOyoi3jZb3GAcea9iyzcvv1R14Hf+fxAVyAOeRoNNkH5wKKd3xeaUQ7xyQWkgBg==
X-Google-Smtp-Source: AGHT+IFfoBSlnjZRbAFJa/IsGJQlI0HeH6mgd1OnK6SpfodmXzF+gUnE5irYR3+phhb4nHiGM68Zog==
X-Received: by 2002:a9d:73c8:0:b0:6e2:e92e:4d6 with SMTP id m8-20020a9d73c8000000b006e2e92e04d6mr10663395otk.4.1709023533873;
        Tue, 27 Feb 2024 00:45:33 -0800 (PST)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com. [209.85.161.52])
        by smtp.gmail.com with ESMTPSA id j22-20020a056830015600b006e4878962ddsm1452444otp.12.2024.02.27.00.45.33
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 00:45:33 -0800 (PST)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5a058b9bd2dso1858532eaf.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 00:45:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0PPTgXi6MWxty+f8bN3u6YPgS0OIFd10+ULsOMwoBvbZsi4OHUfgO5vpW7E3ACQEmyXPZRKasjmVnGk0bGzCwB3ImmVKozxlhzUFAPA==
X-Received: by 2002:a25:84c7:0:b0:dc7:496e:42e1 with SMTP id
 x7-20020a2584c7000000b00dc7496e42e1mr1414712ybm.51.1709023513209; Tue, 27 Feb
 2024 00:45:13 -0800 (PST)
MIME-Version: 1.0
References: <20240226161414.2316610-1-arnd@kernel.org> <20240226161414.2316610-2-arnd@kernel.org>
In-Reply-To: <20240226161414.2316610-2-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 09:45:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVCWF50SO1TK5F5Q8sN08THKJ+F6gt9u5pD05gJUZ+E9w@mail.gmail.com>
Message-ID: <CAMuHMdVCWF50SO1TK5F5Q8sN08THKJ+F6gt9u5pD05gJUZ+E9w@mail.gmail.com>
Subject: Re: [PATCH 1/4] arch: consolidate existing CONFIG_PAGE_SIZE_*KB definitions
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>, Jan Kiszka <jan.kiszka@siemens.com>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-alpha@vger.kernel.org, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Kieran Bingham <kbingham@kernel.org>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik
 .fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

On Mon, Feb 26, 2024 at 5:14=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
> From: Arnd Bergmann <arnd@arndb.de>
>
> These four architectures define the same Kconfig symbols for configuring
> the page size. Move the logic into a common place where it can be shared
> with all other architectures.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> --- a/arch/Kconfig
> +++ b/arch/Kconfig

> +config PAGE_SIZE_4KB
> +       bool "4KB pages"

Now you got rid of the 4000-byte ("4kB") pages and friends, please
do not replace these by Kelvin-bytes, and use the official binary
prefixes =3D> "4 KiB".

> +       depends on HAVE_PAGE_SIZE_4KB

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
