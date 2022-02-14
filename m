Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF1D4B588D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 18:34:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyBD64tc2z3cW5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 04:34:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=ftp.linux.org.uk (client-ip=2607:5300:60:148a::1;
 helo=zeniv-ca.linux.org.uk; envelope-from=viro@ftp.linux.org.uk;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1019 seconds by postgrey-1.36 at boromir;
 Tue, 15 Feb 2022 04:33:50 AEDT
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
 [IPv6:2607:5300:60:148a::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyBCf1NHrz3bYq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 04:33:50 +1100 (AEDT)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nJewf-001kzp-JJ; Mon, 14 Feb 2022 17:15:25 +0000
Date: Mon, 14 Feb 2022 17:15:25 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 07/14] uaccess: generalize access_ok()
Message-ID: <YgqOLZbFK7/B2HJT@zeniv-ca.linux.org.uk>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-8-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220214163452.1568807-8-arnd@kernel.org>
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, guoren@kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 will@kernel.org, Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, deller@gmx.de,
 x86@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org,
 ardb@kernel.org, mingo@redhat.com, geert@linux-m68k.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 arnd@arndb.de, hca@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 green.hu@gmail.com, shorne@gmail.com, linux-arm-kernel@lists.infradead.org,
 monstr@monstr.eu, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 nickhu@andestech.com, jcmvbkbc@gmail.com, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, dinguyen@kernel.org, ebiederm@xmission.com,
 richard@nod.at, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 14, 2022 at 05:34:45PM +0100, Arnd Bergmann wrote:

> diff --git a/arch/csky/kernel/signal.c b/arch/csky/kernel/signal.c
> index c7b763d2f526..8867ddf3e6c7 100644
> --- a/arch/csky/kernel/signal.c
> +++ b/arch/csky/kernel/signal.c
> @@ -136,7 +136,7 @@ static inline void __user *get_sigframe(struct ksignal *ksig,
>  static int
>  setup_rt_frame(struct ksignal *ksig, sigset_t *set, struct pt_regs *regs)
>  {
> -	struct rt_sigframe *frame;
> +	struct rt_sigframe __user *frame;
>  	int err = 0;
>  
>  	frame = get_sigframe(ksig, regs, sizeof(*frame));

Minor nit: might make sense to separate annotations (here, on nios2, etc.) from the rest...

This, OTOH,

> diff --git a/arch/sparc/include/asm/uaccess_64.h b/arch/sparc/include/asm/uaccess_64.h
> index 5c12fb46bc61..000bac67cf31 100644
> --- a/arch/sparc/include/asm/uaccess_64.h
> +++ b/arch/sparc/include/asm/uaccess_64.h
...
> -static inline bool __chk_range_not_ok(unsigned long addr, unsigned long size, unsigned long limit)
> -{
> -	if (__builtin_constant_p(size))
> -		return addr > limit - size;
> -
> -	addr += size;
> -	if (addr < size)
> -		return true;
> -
> -	return addr > limit;
> -}
> -
> -#define __range_not_ok(addr, size, limit)                               \
> -({                                                                      \
> -	__chk_user_ptr(addr);                                           \
> -	__chk_range_not_ok((unsigned long __force)(addr), size, limit); \
> -})
> -
> -static inline int __access_ok(const void __user * addr, unsigned long size)
> -{
> -	return 1;
> -}
> -
> -static inline int access_ok(const void __user * addr, unsigned long size)
> -{
> -	return 1;
> -}
> +#define __range_not_ok(addr, size, limit) (!__access_ok(addr, size))

is really wrong.  For sparc64, access_ok() should always be true.
This __range_not_ok() thing is used *only* for valid_user_frame() in
arch/sparc/kernel/perf_event.c - it's not a part of normal access_ok()
there.

sparc64 has separate address spaces for kernel and for userland; access_ok()
had never been useful there.  
