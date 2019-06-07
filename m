Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6800738F25
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 17:33:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45L64942fmzDqx5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2019 01:33:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="eGVfNun4"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45L61m41vVzDqHV
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2019 01:31:07 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45L61d14g1zB09ZC;
 Fri,  7 Jun 2019 17:31:01 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=eGVfNun4; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id x89FBxEH0k-2; Fri,  7 Jun 2019 17:31:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45L61c6w95z9vDcN;
 Fri,  7 Jun 2019 17:31:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1559921461; bh=VmfDdFiLX51Z+4KXelOTCLHxqnwbZKmMb30NnGggSrg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=eGVfNun43ICAVfa8ZTRLt9LZB+Sw+rVDTnJQrQQzRDQR1yqPQrK5CRYJQxf8p+Ipa
 R1OpmRuRWrOPBIlhZSprzwJ/3NLXR8zDak3Nj1wnhzpk5JfCcrrPY7EoJV7dnEmkz3
 YFKZL+PWpjANAl87vTbWY/TcYYwKl4VV2B3J7fwk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 831ED8B8BE;
 Fri,  7 Jun 2019 17:31:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id s9MhfGu4umRg; Fri,  7 Jun 2019 17:31:02 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0A6BD8B8BA;
 Fri,  7 Jun 2019 17:31:02 +0200 (CEST)
Subject: Re: [RFC V3] mm: Generalize and rename notify_page_fault() as
 kprobe_page_fault()
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <1559903655-5609-1-git-send-email-anshuman.khandual@arm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <ec764ff4-f68a-fce5-ac1e-a4664e1123c7@c-s.fr>
Date: Fri, 7 Jun 2019 17:31:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1559903655-5609-1-git-send-email-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Will Deacon <will.deacon@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrey Konovalov <andreyknvl@google.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/06/2019 à 12:34, Anshuman Khandual a écrit :
> Very similar definitions for notify_page_fault() are being used by multiple
> architectures duplicating much of the same code. This attempts to unify all
> of them into a generic implementation, rename it as kprobe_page_fault() and
> then move it to a common header.
> 
> kprobes_built_in() can detect CONFIG_KPROBES, hence new kprobe_page_fault()
> need not be wrapped again within CONFIG_KPROBES. Trap number argument can
> now contain upto an 'unsigned int' accommodating all possible platforms.
> 
> kprobe_page_fault() goes the x86 way while dealing with preemption context.
> As explained in these following commits the invoking context in itself must
> be non-preemptible for kprobes processing context irrespective of whether
> kprobe_running() or perhaps smp_processor_id() is safe or not. It does not
> make much sense to continue when original context is preemptible. Instead
> just bail out earlier.
> 
> commit a980c0ef9f6d
> ("x86/kprobes: Refactor kprobes_fault() like kprobe_exceptions_notify()")
> 
> commit b506a9d08bae ("x86: code clarification patch to Kprobes arch code")
> 
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-ia64@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: x86@kernel.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Andrey Konovalov <andreyknvl@google.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Fenghua Yu <fenghua.yu@intel.com>
> Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> 
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> Testing:
> 
> - Build and boot tested on arm64 and x86
> - Build tested on some other archs (arm, sparc64, alpha, powerpc etc)
> 
> Changes in RFC V3:
> 
> - Updated the commit message with an explaination for new preemption behaviour
> - Moved notify_page_fault() to kprobes.h with 'static nokprobe_inline' per Matthew
> - Changed notify_page_fault() return type from int to bool per Michael Ellerman
> - Renamed notify_page_fault() as kprobe_page_fault() per Peterz
> 
> Changes in RFC V2: (https://patchwork.kernel.org/patch/10974221/)
> 
> - Changed generic notify_page_fault() per Mathew Wilcox
> - Changed x86 to use new generic notify_page_fault()
> - s/must not/need not/ in commit message per Matthew Wilcox
> 
> Changes in RFC V1: (https://patchwork.kernel.org/patch/10968273/)
> 
>   arch/arm/mm/fault.c      | 24 +-----------------------
>   arch/arm64/mm/fault.c    | 24 +-----------------------
>   arch/ia64/mm/fault.c     | 24 +-----------------------
>   arch/powerpc/mm/fault.c  | 23 ++---------------------
>   arch/s390/mm/fault.c     | 16 +---------------
>   arch/sh/mm/fault.c       | 18 ++----------------
>   arch/sparc/mm/fault_64.c | 16 +---------------
>   arch/x86/mm/fault.c      | 21 ++-------------------
>   include/linux/kprobes.h  | 16 ++++++++++++++++
>   9 files changed, 27 insertions(+), 155 deletions(-)
> 

[...]

> diff --git a/include/linux/kprobes.h b/include/linux/kprobes.h
> index 443d980..064dd15 100644
> --- a/include/linux/kprobes.h
> +++ b/include/linux/kprobes.h
> @@ -458,4 +458,20 @@ static inline bool is_kprobe_optinsn_slot(unsigned long addr)
>   }
>   #endif
>   
> +static nokprobe_inline bool kprobe_page_fault(struct pt_regs *regs,
> +					      unsigned int trap)
> +{
> +	int ret = 0;

ret is pointless.

> +
> +	/*
> +	 * To be potentially processing a kprobe fault and to be allowed
> +	 * to call kprobe_running(), we have to be non-preemptible.
> +	 */
> +	if (kprobes_built_in() && !preemptible() && !user_mode(regs)) {
> +		if (kprobe_running() && kprobe_fault_handler(regs, trap))

don't need an 'if A if B', can do 'if A && B'

> +			ret = 1;

can do 'return true;' directly here

> +	}
> +	return ret;

And 'return false' here.

Christophe

> +}
> +
>   #endif /* _LINUX_KPROBES_H */
> 
