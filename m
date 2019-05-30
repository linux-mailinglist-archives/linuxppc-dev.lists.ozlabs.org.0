Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 112DA2FAAE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 13:08:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45F4Yn4dZRzDqZF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 21:07:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="KW9gnXpS"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45F4XW0LBnzDqTl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 21:06:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XWSZAD9Y6uBVo7L5n2t8Ehyy7C5gbqMnRx8yZh9FlDg=; b=KW9gnXpShROlZkddwXNzmFYlO
 fmIqAbGM2SAjmXl9zY3TDwFtQnfiDLggLdshi5XIGPQxS3N2b9fI8eNDGA5CdBld4QgdGWer5Q9Ir
 58plIdYsqK7CE2ULlzaf6e3ndrG50anFfSpiL1RUGymu0dFCqQYpDTA9rKtBgtDQFojobJPChdzfh
 MzHtjhsFqDNt+GjziZ1c5QrQMMbip4vZ+Zfak6M+Hs4u1QJVcpRPLOPMswU88cCWHQw/XIU3x1t9u
 QHvDrd9yzlNEjQ5Cs6u2sQB4QLtEFYrUHNmUW7XL7WXMfwfRqZkB5YqUhHS/1U//ulgnX74EIJ6o3
 ZQ2g4WdDw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hWItL-0006m3-ND; Thu, 30 May 2019 11:06:39 +0000
Date: Thu, 30 May 2019 04:06:39 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [RFC] mm: Generalize notify_page_fault()
Message-ID: <20190530110639.GC23461@bombadil.infradead.org>
References: <1559195713-6956-1-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559195713-6956-1-git-send-email-anshuman.khandual@arm.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Russell King <linux@armlinux.org.uk>, Fenghua Yu <fenghua.yu@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrey Konovalov <andreyknvl@google.com>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 30, 2019 at 11:25:13AM +0530, Anshuman Khandual wrote:
> Similar notify_page_fault() definitions are being used by architectures
> duplicating much of the same code. This attempts to unify them into a
> single implementation, generalize it and then move it to a common place.
> kprobes_built_in() can detect CONFIG_KPROBES, hence notify_page_fault()
> must not be wrapped again within CONFIG_KPROBES. Trap number argument can

This is a funny quirk of the English language.  "must not" means "is not
allowed to be", not "does not have to be".

> @@ -141,6 +142,19 @@ static int __init init_zero_pfn(void)
>  core_initcall(init_zero_pfn);
>  
>  
> +int __kprobes notify_page_fault(struct pt_regs *regs, unsigned int trap)
> +{
> +	int ret = 0;
> +
> +	if (kprobes_built_in() && !user_mode(regs)) {
> +		preempt_disable();
> +		if (kprobe_running() && kprobe_fault_handler(regs, trap))
> +			ret = 1;
> +		preempt_enable();
> +	}
> +	return ret;
> +}
> +
>  #if defined(SPLIT_RSS_COUNTING)

Comparing this to the canonical implementation (ie x86), it looks similar.

static nokprobe_inline int kprobes_fault(struct pt_regs *regs)
{
        if (!kprobes_built_in())
                return 0;
        if (user_mode(regs))
                return 0;
        /*
         * To be potentially processing a kprobe fault and to be allowed to call
         * kprobe_running(), we have to be non-preemptible.
         */
        if (preemptible())
                return 0;
        if (!kprobe_running())
                return 0;
        return kprobe_fault_handler(regs, X86_TRAP_PF);
}

The two handle preemption differently.  Why is x86 wrong and this one
correct?
