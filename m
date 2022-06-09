Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EF4546523
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 13:10:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKJCM503jz3cdx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 21:10:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=AGRuyJpQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=AGRuyJpQ;
	dkim-atps=neutral
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJbsr2y48z30Qt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 17:52:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3xoIRA2BBvzVO0XOc/JU1zTILnsefWyOV49Y7IJ3FLY=; b=AGRuyJpQp9QMikHh/33qL0JsHV
	U+WVKRpKqJjJvGyaFDokMlWsSCM9no5evqxr8XfHexEuz39eb12W7RP7lrous4XASMRUkOLz5VouH
	wLOvqEp2LZsitkUiAmo4QZ4OqBM+FawBjbkxe3L4iSs+u4EoDbAZTWfm7hCu0mzKN+/zIyvki4As7
	StixFRJyaOTciQhpHuJ8zWO31vomCg9cRzQQEama2CztMyJ+0N8odAUMXxupDZVXJ2vDzPMCIz1fo
	q5Sz7FLf2dgFeqPVWUX5WWIQ+PRyBjxQp0aakORxRQrSWetvEE8P/oPwTCIquE+kqksSrLBnCbWei
	uIwhbQZg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:32800)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1nzCtn-0005fb-B8; Thu, 09 Jun 2022 08:48:11 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1nzCtG-0002ae-KM; Thu, 09 Jun 2022 08:47:38 +0100
Date: Thu, 9 Jun 2022 08:47:38 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jarkko Sakkinen <jarkko@profian.com>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Message-ID: <YqGlmpbx8HTrWmpF@shell.armlinux.org.uk>
References: <20220608000014.3054333-1-jarkko@profian.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608000014.3054333-1-jarkko@profian.com>
X-Mailman-Approved-At: Fri, 10 Jun 2022 21:09:20 +1000
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
Cc: Dan Li <ashimida@linux.alibaba.com>, Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>, Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Javier Martinez Canillas <javierm@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Guenter Roeck <linux@roeck-us.net>, =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>, Michael Roth <michael.roth@amd.com>, Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Andrey Konovalov <andreyknvl@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Wu Caize <zepan@sipeed.com>, Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Luis Machado <luis.machado@linaro.org>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Da
 ve Hansen <dave.hansen@linux.intel.com>, Joey Gouly <joey.gouly@arm.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Song Liu <song@kernel.org>, linux-s390@vger.kernel.org, Ilya Leoshkevich <iii@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Helge Deller <deller@gmx.de>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Sven Schnelle <svens@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>, Vasily Gorbik <gor@linux.ibm.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Dave Anglin <dave.anglin@bell.net>, linux-arm-kernel@lists.infradead.org, Daniel Axtens <dja@axtens.net>, Nicolas Pitre <nico@fluxnic.net>, Jarkko Sakkinen <jarkko@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, Emil Renner Berthing <kernel@esmil.dk>, Jordan Niethe <jniethe5@gmail.com>, Atish Patra <atishp@atishpatra.org>, Alexei Starovoi
 tov <ast@kernel.org>, Will Deacon <will@kernel.org>, 

Masahiro Yamada <masahiroy@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Alexander Egorenkov <egorenar@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Nathaniel McCallum <nathaniel@profian.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Tobias Huschle <huschle@linux.ibm.com>, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Tiezhu Yang <yangtiezhu@loongson.cn>, Miroslav Benes <mbenes@suse.cz>, Chen Zhongjin <chenzhongjin@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, linux-riscv@lists.infradead.org, Ing
 o Molnar <mingo@redhat.com>, Aaron Tomlin <atomlin@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Liao Chang <liaochang1@huawei.com>, Paul Walmsley <paul.walmsley@sifive.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Thomas Richter <tmricht@linux.ibm.com>, linux-mips@vger.kernel.org, Changbin Du <changbin.du@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 08, 2022 at 02:59:27AM +0300, Jarkko Sakkinen wrote:
> diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
> index 553866751e1a..d2bb954cd54f 100644
> --- a/arch/arm/kernel/Makefile
> +++ b/arch/arm/kernel/Makefile
> @@ -44,6 +44,11 @@ obj-$(CONFIG_CPU_IDLE)		+= cpuidle.o
>  obj-$(CONFIG_ISA_DMA_API)	+= dma.o
>  obj-$(CONFIG_FIQ)		+= fiq.o fiqasm.o
>  obj-$(CONFIG_MODULES)		+= armksyms.o module.o
> +ifeq ($(CONFIG_MODULES),y)
> +obj-y				+= module_alloc.o
> +else
> +obj-$(CONFIG_KPROBES)		+= module_alloc.o
> +endif

Doesn't:

obj-$(CONFIG_MODULES)		+= module_alloc.o
obj-$(CONFIG_KPROBES)		+= module_alloc.o

work just as well? The kbuild modules.rst documentation says:

        The order of files in $(obj-y) is significant.  Duplicates in
        the lists are allowed: the first instance will be linked into
        built-in.a and succeeding instances will be ignored.

so you should be fine... or the documentation is wrong!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
