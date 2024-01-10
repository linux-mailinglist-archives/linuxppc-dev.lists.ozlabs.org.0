Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDE182A416
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 23:42:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T9N9N0C8fz3d8x
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 09:42:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.222.175; helo=mail-qk1-f175.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T920b354Cz2xQG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jan 2024 20:03:57 +1100 (AEDT)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7831386ee01so376239985a.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jan 2024 01:03:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704877435; x=1705482235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2Qk0JS/X/M+iSFJkteLpcJbyzGhmpZqpSZNg5QY+TE=;
        b=poBRlHA7XXZxPh7r4RUF8eyucglVGGzDX/LdauGvhyKMrQM2Go3J1e872eS8q+IJRU
         AeTC/PYsqbFQJ9wnXmCCYxiMbRVYDoxeVzw76GtdA/d6F97XZlcQlAYwJwwQQbelGENy
         gWbG+eOhZBdmImbHsE01/IbqeD34aYtTYMJ5yWHj+5oKMSpwEoXhaze4cOIi/RIhD4Ht
         VOzUD4Ax/pBOWpP6iRzs3LZVzRP/R6wiN/2goSZwi3nvKfJT9Qu46vJAZDOeE3sYOk4G
         cbi2gxq7beo84HW8Ez4LKjH+Kxt1IBdONCP5GLZ3ckV+FlA5kceGsb2HLAS3Ped39wCH
         IztQ==
X-Gm-Message-State: AOJu0Yz63tpimzwOC8b5cKYQsiyv+kdfROhwyFgFtlH8erZ3RusTqjJd
	nYiQtrkLVBOpWsrIx1RXfgyFHf+/ZtfGeHSD
X-Google-Smtp-Source: AGHT+IHHdiHuXtClo3HVNi7QNFKAxnVGz8ICqbFjdD5+1f65MSLFBksZbXL/7cIypQkt7lL8wnRZ4w==
X-Received: by 2002:a05:620a:2850:b0:783:3976:e17a with SMTP id h16-20020a05620a285000b007833976e17amr183123qkp.52.1704877435295;
        Wed, 10 Jan 2024 01:03:55 -0800 (PST)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id b25-20020a05620a089900b00781587ab3dfsm1456634qka.74.2024.01.10.01.03.54
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 01:03:54 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-42989016014so23211901cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jan 2024 01:03:54 -0800 (PST)
X-Received: by 2002:a81:9843:0:b0:5fa:7e0a:b133 with SMTP id
 p64-20020a819843000000b005fa7e0ab133mr127729ywg.79.1704877413506; Wed, 10 Jan
 2024 01:03:33 -0800 (PST)
MIME-Version: 1.0
References: <20231108125843.3806765-1-arnd@kernel.org> <20231108125843.3806765-9-arnd@kernel.org>
In-Reply-To: <20231108125843.3806765-9-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Jan 2024 10:03:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV8uFKntiMfwwmnFpd4Dcx8vJDwS6r1iBLtkh40N71dbw@mail.gmail.com>
Message-ID: <CAMuHMdV8uFKntiMfwwmnFpd4Dcx8vJDwS6r1iBLtkh40N71dbw@mail.gmail.com>
Subject: Re: [PATCH 08/22] [v2] arch: consolidate arch_irq_work_raise prototypes
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 11 Jan 2024 09:41:33 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Juri Lelli <juri.lelli@redhat.com>, linux-fbdev@vger.kernel.org, x86@kernel.org, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, netdev@vger.kernel.org, Guo Ren <guoren@kernel.org>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Helge Deller <deller@gmx.de>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Vincent Guittot <vincent.guittot@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Greg Ungerer <gerg@linux-m68k.org>, linux-bcachefs@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
 Vineet Gupta <vgupta@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org, linux-csky@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Timur Tabi <timur@kernel.org>, Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartma
 n <gregkh@linuxfoundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-alpha@vger.kernel.org, linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 8, 2023 at 2:01=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The prototype was hidden in an #ifdef on x86, which causes a warning:
>
> kernel/irq_work.c:72:13: error: no previous prototype for 'arch_irq_work_=
raise' [-Werror=3Dmissing-prototypes]

This issue is now present upstream.

> Some architectures have a working prototype, while others don't.
> Fix this by providing it in only one place that is always visible.
>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Alexander Gordeev <agordeev@linux.ibm.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
