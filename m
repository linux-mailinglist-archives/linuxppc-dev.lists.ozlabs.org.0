Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB896481A92
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Dec 2021 08:59:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JPgdy5nHNz3cT4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Dec 2021 18:59:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.215.173;
 helo=mail-pg1-f173.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JNVc12Vnnz2xtv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Dec 2021 21:08:31 +1100 (AEDT)
Received: by mail-pg1-f173.google.com with SMTP id s1so14101957pga.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Dec 2021 02:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1LdjVJCupkO66VZRPSdtPXWlxTkxQlblL8anKkt6w1Y=;
 b=nP9K+XGoxVFxwBngYnSnJLt4FeJ88EV+MHGPwuyS6XGNO+PbdooYcxF0ACfsKoUeHI
 5Ncc74qx/jYttEK17LJP4HNTKaNbfb98K3QcY2uHtdnW21KVGP1FGx4tKAilJiPeWJew
 oI2gW3bLTbCZHoB7yewOUYzvNASSkLiyMsMkI6Ao2v2NIuTEBYCrMlUP+pK0Y0c9Vizp
 ynBVDV66zqHLRlFFzjFbPcxd1Thu6j6FS9Bg7dp/i5D7+CxuYckQ/F5mfEDwaN/TDVj0
 Sg2jA6yyF9vfDUD5jqxgEP/0GEhQlIE93pyMznET7j5qy733oBwUsX2MApf5F9u4ASat
 rvkQ==
X-Gm-Message-State: AOAM5334dO8jo7/GUAFCy+pZWttmvpU1F2Fk7jYPkvHcP1rwFYoBqHRQ
 o0flxKXk1yUVnKDwmSqyEvTqGzANDnVHcQ==
X-Google-Smtp-Source: ABdhPJxuLIWx3XoQYt2Pf60Pby+xytjL4qzWkcwwTXq6EjEKcA5K3CM0yLmj3pMX6fcvBk5YBDRB6w==
X-Received: by 2002:a05:6a00:2391:b0:4a2:cb64:2e43 with SMTP id
 f17-20020a056a00239100b004a2cb642e43mr21525537pfc.49.1640686107022; 
 Tue, 28 Dec 2021 02:08:27 -0800 (PST)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com.
 [209.85.214.178])
 by smtp.gmail.com with ESMTPSA id on2sm23238712pjb.19.2021.12.28.02.08.26
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 02:08:26 -0800 (PST)
Received: by mail-pl1-f178.google.com with SMTP id x15so13243294plg.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Dec 2021 02:08:26 -0800 (PST)
X-Received: by 2002:a05:6122:21a6:: with SMTP id
 j38mr6293010vkd.39.1640686096258; 
 Tue, 28 Dec 2021 02:08:16 -0800 (PST)
MIME-Version: 1.0
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
In-Reply-To: <20211227164317.4146918-3-schnelle@linux.ibm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Dec 2021 11:08:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
Message-ID: <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
Subject: Re: [RFC 02/32] Kconfig: introduce HAS_IOPORT option and select it as
 necessary
To: Niklas Schnelle <schnelle@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 30 Dec 2021 18:58:16 +1100
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-pci@vger.kernel.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 sparclinux@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
 linux-ia64@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Karol Gugala <kgugala@antmicro.com>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-parisc@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>, linux-xtensa@linux-xtensa.org,
 Albert Ou <aou@eecs.berkeley.edu>, Chris Zankel <chris@zankel.net>,
 Jeff Dike <jdike@addtoit.com>, John Garry <john.garry@huawei.com>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>, Michael Schmitz <schmitzmic@gmail.com>,
 Arnd Bergmann <arnd@kernel.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Niklas,

On Mon, Dec 27, 2021 at 5:44 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> We introduce a new HAS_IOPORT Kconfig option to gate support for
> I/O port access. In a future patch HAS_IOPORT=n will disable compilation
> of the I/O accessor functions inb()/outb() and friends on architectures
> which can not meaningfully support legacy I/O spaces. On these platforms
> inb()/outb() etc are currently just stubs in asm-generic/io.h which when
> called will cause a NULL pointer access which some compilers actually
> detect and warn about.
>
> The dependencies on HAS_IOPORT in drivers as well as ifdefs for
> HAS_IOPORT specific sections will be added in subsequent patches on
> a per subsystem basis. Then a final patch will ifdef the I/O access
> functions on HAS_IOPORT thus turning any use not gated by HAS_IOPORT
> into a compile-time warning.
>
> Link: https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

Thanks for your patch!

> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -16,6 +16,7 @@ config M68K
>         select GENERIC_CPU_DEVICES
>         select GENERIC_IOMAP
>         select GENERIC_IRQ_SHOW
> +       select HAS_IOPORT
>         select HAVE_AOUT if MMU
>         select HAVE_ASM_MODVERSIONS
>         select HAVE_DEBUG_BUGVERBOSE

This looks way too broad to me: most m68k platform do not have I/O
port access support.

My gut feeling says:

    select HAS_IOPORT if PCI || ISA

but that might miss some intricate details...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
