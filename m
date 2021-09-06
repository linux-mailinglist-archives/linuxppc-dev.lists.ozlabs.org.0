Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C43401CEE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 16:23:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H39cR17nnz2ynB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Sep 2021 00:23:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gPDFVvcg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=gPDFVvcg; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H39bn3Q0vz2yHW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Sep 2021 00:23:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1630938178;
 bh=a1ig8YTFMn8o0S8xZRd6vor5m3Cp6vgqt+R8f3Aaqr8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=gPDFVvcgFKVCtnnFcqifi3/U7sQu2oKLjlWmQLo9QKNWq1U2MACHRnqyFWKrnad56
 uL+i5BVZJzimDdNdOdWWL97qyY3vQEru4eOyRsCgGll1qxWgWbklqZekpDGcAGKuCf
 7DC9/fmleSs/J6PLf3UKelktEfEUDK/VqMn/+w368Z5+i7rKCZizeZ9JNKFm1pNAA5
 h4LY2z9lptO/oPnnmWr1502XTFsZvG+pEmckwN3k0Ifrq04O0itioFFI4oF6PBSbWI
 occtjlLIAW9X8Cbc98/3bwK1W8QWf6J3uswp0ONhi5bpMTYeu0fzaFaimB7DadN/5M
 jHul5fcpFPOCA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H39bX6gcYz9sW4;
 Tue,  7 Sep 2021 00:22:48 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Weizhao Ouyang <o451686892@gmail.com>, Steven Rostedt
 <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH v2] ftrace: Cleanup ftrace_dyn_arch_init()
In-Reply-To: <20210906111626.1259867-1-o451686892@gmail.com>
References: <20210906111626.1259867-1-o451686892@gmail.com>
Date: Tue, 07 Sep 2021 00:22:46 +1000
Message-ID: <87v93dn5qh.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Weizhao Ouyang <o451686892@gmail.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Nick Hu <nickhu@andestech.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Weizhao Ouyang <o451686892@gmail.com> writes:
> Most of ARCHs use empty ftrace_dyn_arch_init(), introduce a weak common
> ftrace_dyn_arch_init() to cleanup them.
>
> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
> Acked-by: Heiko Carstens <hca@linux.ibm.com> (s390)
>
> ---
>
> Changes in v2:
> -- correct CONFIG_DYNAMIC_FTRACE on PowerPC
> -- add Acked-by tag

> diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
> index debe8c4f7062..d59f67c0225f 100644
> --- a/arch/powerpc/include/asm/ftrace.h
> +++ b/arch/powerpc/include/asm/ftrace.h
> @@ -61,6 +61,10 @@ struct dyn_arch_ftrace {
>  };
>  #endif /* __ASSEMBLY__ */
>  
> +#ifdef CONFIG_DYNAMIC_FTRACE
> +int __init ftrace_dyn_arch_init(void);
> +#endif /* CONFIG_DYNAMIC_FTRACE */
> +
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
>  #define ARCH_SUPPORTS_FTRACE_OPS 1
>  #endif

That breaks the build for powerpc:

  /linux/arch/powerpc/include/asm/ftrace.h: Assembler messages:
  /linux/arch/powerpc/include/asm/ftrace.h:65: Error: unrecognized opcode: `int'
  make[4]: *** [/linux/scripts/Makefile.build:352: arch/powerpc/kernel/trace/ftrace_64.o] Error 1
  make[3]: *** [/linux/scripts/Makefile.build:514: arch/powerpc/kernel/trace] Error 2
  make[2]: *** [/linux/scripts/Makefile.build:514: arch/powerpc/kernel] Error 2
  make[1]: *** [/linux/Makefile:1861: arch/powerpc] Error 2
  make[1]: *** Waiting for unfinished jobs....

It needs to be inside an #ifndef __ASSEMBLY__ section.

cheers
