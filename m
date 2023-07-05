Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC517490E3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 00:16:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=FTtjRrEg;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=kPkHZ58R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxDXh0JTgz3dCD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 08:16:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=FTtjRrEg;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=kPkHZ58R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx2zx0pfkz2ygr
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 01:06:20 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 6CB115C013C;
	Wed,  5 Jul 2023 11:06:16 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 05 Jul 2023 11:06:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1688569576; x=1688655976; bh=xA
	WlrtmWIGFsGqKku/ln8wTfTlYDAGy8buXk/3wv9RE=; b=FTtjRrEg80eMcp7J+7
	3pwJsRjPZHaHP4zHSl9PNr0RPHqzpOkF2+29rVqbkseVJbIp0wxkTnB92nkIGYII
	eNt5hEQ1yp7VGmfJCvtDCyerq+AkGIH19p4Y1+zMWVCvKeJiFYetMKd6e65NDhUD
	YfvWM+t7WRsIVrwBQr5Kf53UY5FkDK2exygAQh2vQU8e1mcA33m48MC/I071t89U
	Odq7kVORGEuaSyg8QGgRRqEq+V9b1wJvgL9cBFtk/haMesDly/9DkqtmKlj3uzrb
	FY9mztVl5tNyQ0k2553B9aCI2R+0utNnGgi60M9TtYo+SMe+nyQUw5lugJCqjqnz
	qRaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688569576; x=1688655976; bh=xAWlrtmWIGFsG
	qKku/ln8wTfTlYDAGy8buXk/3wv9RE=; b=kPkHZ58RBmAts6EgoaOIgxUfDxh68
	jJQ0LGXwTg7TWkIjLnIeM4EBuXQ9I0L63V9b4S4+yPc8OUnzhFOv1RjSkUZUamVc
	jRqzdcxVDGiJV5kJnU3BsdnAeecB9JOOPyQoKgSz+rskkjzucVjn4Ax4rSIUm1bG
	B1R8J15zSESE+SvUAHE6p6eQDud0/SqRctjV+GIVwhyDdAsy/i+JTaGqsGg/pUFQ
	BNACpXhn8Qp2o2+XKbj3/h/pF0KjHxkYJWCoc9XRzZxoK9FnxxWsqp/uTuBQ97bf
	H/gSGbxNmwJGMflid0MLss9DjZrf8KdckV7tKlBnRCqRmxuVxy2T2An2Q==
X-ME-Sender: <xms:5YalZJPpaMUzPHAimjWcbAx7HperBaO6JlGIglBCAcuPmFdvoqk2VQ>
    <xme:5YalZL-h_2SDnXLiyS2ShPNmFKTtye72KfuTbNTcPL09hfuW0nhlfxQCwaU82B3oi
    MP5675VKThZC7XsTi4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudejgdeflecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:5YalZITQnWG-ZIaBGLa1VB8tvlgw2vIFa8hEd_KcH1mxy-VpS9s-Bg>
    <xmx:5YalZFvMG1DlqLA_-gW9wEQFU-uGok5Yj62sqkVCl_UdGqcWQVOgUQ>
    <xmx:5YalZBeJl5848TssZZCgIiqasgPjqMiGGtp9mr1zvEmANZyl5iVgoQ>
    <xmx:6IalZEAzqVrcN4WDkk0NgBpcSLDC4PKWtDRDvZa84pD24H367l-2Jw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id BFA19B6008D; Wed,  5 Jul 2023 11:06:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <09f70de6-9409-4fa4-b9ea-831078d914e7@app.fastmail.com>
In-Reply-To: <20230705142004.3605799-4-eric.devolder@oracle.com>
References: <20230705142004.3605799-1-eric.devolder@oracle.com>
 <20230705142004.3605799-4-eric.devolder@oracle.com>
Date: Wed, 05 Jul 2023 17:05:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Eric DeVolder" <eric.devolder@oracle.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Helge Deller" <deller@gmx.de>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org
Subject: Re: [PATCH v4 03/13] arm/kexec: refactor for kernel/Kconfig.kexec
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 06 Jul 2023 08:04:02 +1000
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
Cc: Peter Zijlstra <peterz@infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Zhen Lei <thunder.leizhen@huawei.com>, "H. Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, Ard Biesheuvel <ardb@kernel.org>, tsi@tuyoix.net, Alexander Gordeev <agordeev@linux.ibm.com>, "Paul E. McKenney" <paulmck@kernel.org>, Baoquan He <bhe@redhat.com>, Masahiro Yamada <masahiroy@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, Juerg Haefliger <juerg.haefliger@canonical.com>, borntraeger@linux.ibm.com, Frederic Weisbecker <frederic@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, gor@linux.ibm.com, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Xin Li <xin3.li@intel.com>, Nicholas Piggin <npiggin@gmail.com>, Russell King <rmk+kernel@armlinu
 x.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Zi Yan <ziy@nvidia.com>, hbathini@linux.ibm.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Nick Desaulniers <ndesaulniers@google.com>, sourabhjain@linux.ibm.com, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 5, 2023, at 16:19, Eric DeVolder wrote:
> The kexec and crash kernel options are provided in the common
> kernel/Kconfig.kexec. Utilize the common options and provide
> the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
> equivalent set of KEXEC and CRASH options.
>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

> +config ARCH_SUPPORTS_KEXEC
> +	def_bool (!SMP || PM_SLEEP_SMP) && MMU
> 
>  config ATAGS_PROC
>  	bool "Export atags in procfs"
> @@ -1668,17 +1656,8 @@ config ATAGS_PROC
>  	  Should the atags used to boot the kernel be exported in an "atags"
>  	  file in procfs. Useful with kexec.
> 
> -config CRASH_DUMP
> -	bool "Build kdump crash kernel (EXPERIMENTAL)"
> -	help
> -	  Generate crash dump after being started by kexec. This should
> -	  be normally only set in special crash dump kernels which are
> -	  loaded in the main kernel with kexec-tools into a specially
> -	  reserved region and then later executed after a crash by
> -	  kdump/kexec. The crash dump kernel must be compiled to a
> -	  memory address not used by the main kernel
> -
> -	  For more details see Documentation/admin-guide/kdump/kdump.rst
> +config ARCH_SUPPORTS_CRASH_DUMP
> +	def_bool y
> 

I see this is now in linux-next, and it caused a few randconfig
build issues, these never happened in the past:

* The #ifdef CONFIG_KEXEC check in arch/arm/include/asm/kexec.h
  needs to be changed to CONFIG_KEXEC_CORE:

include/linux/kexec.h:41:2: error: #error KEXEC_SOURCE_MEMORY_LIMIT not defined

  same thing on m68k

* ARCH_SUPPORTS_CRASH_DUMP needs the same dependency as ARCH_SUPPORTS_KEXEC,
  otherwise we seem to run into an obscure assembler error building the kdump
  core on architectures that do not support kdump:

  /tmp/ccpYl6w9.s:1546: Error: selected processor does not support requested special purpose register -- `mrs r2,cpsr'

* Most architectures build machine_kexec.o only when KEXEC is enabled,
  this also needs to be changed to KEXEC_CORE:

--- a/arch/arm/kernel/Makefile
+++ b/arch/arm/kernel/Makefile
@@ -59,7 +59,7 @@ obj-$(CONFIG_FUNCTION_TRACER) += entry-ftrace.o
 obj-$(CONFIG_DYNAMIC_FTRACE)   += ftrace.o insn.o patch.o
 obj-$(CONFIG_FUNCTION_GRAPH_TRACER)    += ftrace.o insn.o patch.o
 obj-$(CONFIG_JUMP_LABEL)       += jump_label.o insn.o patch.o
-obj-$(CONFIG_KEXEC)            += machine_kexec.o relocate_kernel.o
+obj-$(CONFIG_KEXEC_CORE)       += machine_kexec.o relocate_kernel.o
 # Main staffs in KPROBES are in arch/arm/probes/ .
 obj-$(CONFIG_KPROBES)          += patch.o insn.o
 obj-$(CONFIG_OABI_COMPAT)      += sys_oabi-compat.o


   Arnd
