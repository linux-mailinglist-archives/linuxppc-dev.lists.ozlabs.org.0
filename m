Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4DB33F4E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 08:55:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J2kM66MYzDqQg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 16:55:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="HARn4yCl"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J2hp6LsSzDqQ9
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 16:54:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o0/x+1oKv0SZnOXYtDRUsgML6+umJV3GQkxVLH8VplA=; b=HARn4yClLyKIcGgcTwTDD+jMd
 1ef7NULcX2Ny2MFe3bZpZHb30cLWSrPWc+xLr8ShYTmRRwEt49WdLKzvXVE7+BLps/iqR4Kkhg4+D
 Jv5IlCPj9JeZ/4Zj90FKMkkfDVWaeU3eqEvefbikGR7rzaj7QViz1N46SKGNWu7zI4W3PoR20bU0u
 bPCRXeOfyT/1kv9ZkyME/bMQcBf1vGP9Zo0EO4Dgrn0hnw+ygmh+mzIgTUlc9k3aSnSRuQDc5mgfz
 1Hk0TIi/arJ70lLgpQO+eOM7NwXLFKSxYHf4sA/TaUDXS1/nqt5n66d+x7GKHDaCKsR0BqTZraZkJ
 0Wa5VbknA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hY3Ke-0001TW-0y; Tue, 04 Jun 2019 06:54:04 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 9627520761B5F; Tue,  4 Jun 2019 08:54:01 +0200 (CEST)
Date: Tue, 4 Jun 2019 08:54:01 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [RFC V2] mm: Generalize notify_page_fault()
Message-ID: <20190604065401.GE3402@hirez.programming.kicks-ass.net>
References: <1559630046-12940-1-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559630046-12940-1-git-send-email-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrey Konovalov <andreyknvl@google.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 04, 2019 at 12:04:06PM +0530, Anshuman Khandual wrote:
> diff --git a/mm/memory.c b/mm/memory.c
> index ddf20bd..b6bae8f 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -52,6 +52,7 @@
>  #include <linux/pagemap.h>
>  #include <linux/memremap.h>
>  #include <linux/ksm.h>
> +#include <linux/kprobes.h>
>  #include <linux/rmap.h>
>  #include <linux/export.h>
>  #include <linux/delayacct.h>
> @@ -141,6 +142,21 @@ static int __init init_zero_pfn(void)
>  core_initcall(init_zero_pfn);
>  
>  
> +int __kprobes notify_page_fault(struct pt_regs *regs, unsigned int trap)
> +{
> +	int ret = 0;
> +
> +	/*
> +	 * To be potentially processing a kprobe fault and to be allowed
> +	 * to call kprobe_running(), we have to be non-preemptible.
> +	 */
> +	if (kprobes_built_in() && !preemptible() && !user_mode(regs)) {
> +		if (kprobe_running() && kprobe_fault_handler(regs, trap))
> +			ret = 1;
> +	}
> +	return ret;
> +}

That thing should be called kprobe_page_fault() or something,
notify_page_fault() is a horribly crap name for this function.
