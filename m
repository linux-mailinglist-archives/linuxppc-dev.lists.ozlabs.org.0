Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9863C4BB20E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 07:29:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0MH71DLSz3cbG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 17:29:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0MGh6T9sz3bSs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 17:29:00 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A3FF967373; Fri, 18 Feb 2022 07:28:52 +0100 (CET)
Date: Fri, 18 Feb 2022 07:28:51 +0100
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2 05/18] x86: remove __range_not_ok()
Message-ID: <20220218062851.GC22576@lst.de>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-6-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216131332.1489939-6-arnd@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
 ardb@kernel.org, Christoph Hellwig <hch@infradead.org>, mingo@redhat.com,
 geert@linux-m68k.org, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, arnd@arndb.de, hca@linux.ibm.com,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, viro@zeniv.linux.org.uk, shorne@gmail.com,
 monstr@monstr.eu, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 nickhu@andestech.com, jcmvbkbc@gmail.com, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, dinguyen@kernel.org, ebiederm@xmission.com,
 richard@nod.at, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, davem@davemloft.net,
 green.hu@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 16, 2022 at 02:13:19PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The __range_not_ok() helper is an x86 (and sparc64) specific interface
> that does roughly the same thing as __access_ok(), but with different
> calling conventions.
> 
> Change this to use the normal interface in order for consistency as we
> clean up all access_ok() implementations.
> 
> This changes the limit from TASK_SIZE to TASK_SIZE_MAX, which Al points
> out is the right thing do do here anyway.
> 
> The callers have to use __access_ok() instead of the normal access_ok()
> though, because on x86 that contains a WARN_ON_IN_IRQ() check that cannot
> be used inside of NMI context while tracing.
> 
> Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Link: https://lore.kernel.org/lkml/YgsUKcXGR7r4nINj@zeniv-ca.linux.org.uk/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/x86/events/core.c         |  2 +-
>  arch/x86/include/asm/uaccess.h | 10 ++++++----
>  arch/x86/kernel/dumpstack.c    |  2 +-
>  arch/x86/kernel/stacktrace.c   |  2 +-
>  arch/x86/lib/usercopy.c        |  2 +-
>  5 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
> index e686c5e0537b..eef816fc216d 100644
> --- a/arch/x86/events/core.c
> +++ b/arch/x86/events/core.c
> @@ -2794,7 +2794,7 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
>  static inline int
>  valid_user_frame(const void __user *fp, unsigned long size)
>  {
> -	return (__range_not_ok(fp, size, TASK_SIZE) == 0);
> +	return __access_ok(fp, size);
>  }

valid_user_frame just need to go away and the following __get_user calls
replaced with normal get_user ones.

> diff --git a/arch/x86/kernel/dumpstack.c b/arch/x86/kernel/dumpstack.c
> index 53de044e5654..da534fb7b5c6 100644
> --- a/arch/x86/kernel/dumpstack.c
> +++ b/arch/x86/kernel/dumpstack.c
> @@ -85,7 +85,7 @@ static int copy_code(struct pt_regs *regs, u8 *buf, unsigned long src,
>  	 * Make sure userspace isn't trying to trick us into dumping kernel
>  	 * memory by pointing the userspace instruction pointer at it.
>  	 */
> -	if (__chk_range_not_ok(src, nbytes, TASK_SIZE_MAX))
> +	if (!__access_ok((void __user *)src, nbytes))
>  		return -EINVAL;

This one is not needed at all as copy_from_user_nmi already checks the
access range.

> diff --git a/arch/x86/kernel/stacktrace.c b/arch/x86/kernel/stacktrace.c
> index 15b058eefc4e..ee117fcf46ed 100644
> --- a/arch/x86/kernel/stacktrace.c
> +++ b/arch/x86/kernel/stacktrace.c
> @@ -90,7 +90,7 @@ copy_stack_frame(const struct stack_frame_user __user *fp,
>  {
>  	int ret;
>  
> -	if (__range_not_ok(fp, sizeof(*frame), TASK_SIZE))
> +	if (!__access_ok(fp, sizeof(*frame)))
>  		return 0;

Just switch the __get_user calls below to get_user instead.
