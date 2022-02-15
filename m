Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB134B6A4E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 12:07:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jydbl5p6fz3cYH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 22:07:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JydbK1qhnz2yQH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 22:07:23 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D50F51424;
 Tue, 15 Feb 2022 03:07:22 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.89.144])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D4923F718;
 Tue, 15 Feb 2022 03:07:16 -0800 (PST)
Date: Tue, 15 Feb 2022 11:07:12 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 08/14] arm64: simplify access_ok()
Message-ID: <YguJYMxJsNj9L4Ee@FVFF77S0Q05N>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-9-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220214163452.1568807-9-arnd@kernel.org>
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 peterz@infradead.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 guoren@kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, will@kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
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

On Mon, Feb 14, 2022 at 05:34:46PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> arm64 has an inline asm implementation of access_ok() that is derived from
> the 32-bit arm version and optimized for the case that both the limit and
> the size are variable. With set_fs() gone, the limit is always constant,
> and the size usually is as well, so just using the default implementation
> reduces the check into a comparison against a constant that can be
> scheduled by the compiler.
> 
> On a defconfig build, this saves over 28KB of .text.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I had a play around with this and a number of alternative options that had
previously been discussed (e.g. using uint128_t for the check to allow the
compiler to use the carry flag), and:

* Any sequences which we significantly simpler involved an ABI change (e.g. not
  checking tags for tasks not using the relaxed tag ABI), or didn't interact
  well with the uaccess pointer masking we do for speculation hardening.

* For all constant-size cases, this was joint-best for codegen.

* For variable-size cases the difference between options (which did not change
  ABI or break pointer masking) fell in the noise and really depended on what
  you were optimizing for.

This patch itself is clear, I believe the logic is sound and does not result in
a behavioural change, so for this as-is:

Acked-by: Mark Rutland <mark.rutland@arm.com>

As on other replies, I think that if we want to make further changes to this,
we should do that as follow-ups, since there are a number of subtleties in this
area w.r.t. tag management and speculation with potential ABI implications.

Thanks,
Mark.

> ---
>  arch/arm64/include/asm/uaccess.h | 28 +++++-----------------------
>  1 file changed, 5 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
> index 357f7bd9c981..e8dce0cc5eaa 100644
> --- a/arch/arm64/include/asm/uaccess.h
> +++ b/arch/arm64/include/asm/uaccess.h
> @@ -26,6 +26,8 @@
>  #include <asm/memory.h>
>  #include <asm/extable.h>
>  
> +static inline int __access_ok(const void __user *ptr, unsigned long size);
> +
>  /*
>   * Test whether a block of memory is a valid user space address.
>   * Returns 1 if the range is valid, 0 otherwise.
> @@ -33,10 +35,8 @@
>   * This is equivalent to the following test:
>   * (u65)addr + (u65)size <= (u65)TASK_SIZE_MAX
>   */
> -static inline unsigned long __access_ok(const void __user *addr, unsigned long size)
> +static inline int access_ok(const void __user *addr, unsigned long size)
>  {
> -	unsigned long ret, limit = TASK_SIZE_MAX - 1;
> -
>  	/*
>  	 * Asynchronous I/O running in a kernel thread does not have the
>  	 * TIF_TAGGED_ADDR flag of the process owning the mm, so always untag
> @@ -46,27 +46,9 @@ static inline unsigned long __access_ok(const void __user *addr, unsigned long s
>  	    (current->flags & PF_KTHREAD || test_thread_flag(TIF_TAGGED_ADDR)))
>  		addr = untagged_addr(addr);
>  
> -	__chk_user_ptr(addr);
> -	asm volatile(
> -	// A + B <= C + 1 for all A,B,C, in four easy steps:
> -	// 1: X = A + B; X' = X % 2^64
> -	"	adds	%0, %3, %2\n"
> -	// 2: Set C = 0 if X > 2^64, to guarantee X' > C in step 4
> -	"	csel	%1, xzr, %1, hi\n"
> -	// 3: Set X' = ~0 if X >= 2^64. For X == 2^64, this decrements X'
> -	//    to compensate for the carry flag being set in step 4. For
> -	//    X > 2^64, X' merely has to remain nonzero, which it does.
> -	"	csinv	%0, %0, xzr, cc\n"
> -	// 4: For X < 2^64, this gives us X' - C - 1 <= 0, where the -1
> -	//    comes from the carry in being clear. Otherwise, we are
> -	//    testing X' - C == 0, subject to the previous adjustments.
> -	"	sbcs	xzr, %0, %1\n"
> -	"	cset	%0, ls\n"
> -	: "=&r" (ret), "+r" (limit) : "Ir" (size), "0" (addr) : "cc");
> -
> -	return ret;
> +	return likely(__access_ok(addr, size));
>  }
> -#define __access_ok __access_ok
> +#define access_ok access_ok
>  
>  #include <asm-generic/access_ok.h>
>  
> -- 
> 2.29.2
> 
