Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B2735B3E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 13:24:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JmfV5Q2FzDqfS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 21:24:50 +1000 (AEST)
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
 header.b="ZxNl0qOQ"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Jmd53m9yzDqWF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 21:23:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sVN3EHsvpO4JEKTL1zRRHRBKbHxUnSg7DWieN951vaQ=; b=ZxNl0qOQMb2nfXeNThDfWARnO
 IjMcoH4MbKtQUU/nYGjzXO/SzWGoG4bwvM6cBsqxqnboCmwXwdmrZT6ztabNtnUgigfRmXDx8fQga
 0rKqTEt4/6uc2AluHwNMT79+xCxIagqOb/We+wKGSyrnU5U0zj89HIUQ91CjDb3ocZFKE34NA73Xt
 ht21jsc6XZzCEdyBsoxDu/s7ytcLxb6tZ+TqSKkA+jPRHteOcwa78zZTOL6egPiRNwQtvKPfLFnxB
 43TAXA7rZyGVZ8LyRQz4qMmoOohTstIupqEoWtffXXODQJqZlI73n1KFz6tSlAtnVI5oGHg9JPstG
 ajfQGCbTw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hYU0u-0005Bg-TM; Wed, 05 Jun 2019 11:23:28 +0000
Date: Wed, 5 Jun 2019 04:23:28 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [RFC V2] mm: Generalize notify_page_fault()
Message-ID: <20190605112328.GB2025@bombadil.infradead.org>
References: <1559630046-12940-1-git-send-email-anshuman.khandual@arm.com>
 <87sgsomg91.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sgsomg91.fsf@concordia.ellerman.id.au>
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
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ingo Molnar <mingo@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 05, 2019 at 09:19:22PM +1000, Michael Ellerman wrote:
> Anshuman Khandual <anshuman.khandual@arm.com> writes:
> > Similar notify_page_fault() definitions are being used by architectures
> > duplicating much of the same code. This attempts to unify them into a
> > single implementation, generalize it and then move it to a common place.
> > kprobes_built_in() can detect CONFIG_KPROBES, hence notify_page_fault()
> > need not be wrapped again within CONFIG_KPROBES. Trap number argument can
> > now contain upto an 'unsigned int' accommodating all possible platforms.
> ...
> 
> You've changed several of the architectures from something like above,
> where it disables preemption around the call into the below:
> 
> 
> Which skips everything if we're preemptible. Is that an equivalent
> change? If so can you please explain why in more detail.

See the discussion in v1 of this patch, which you were cc'd on.

I agree the description here completely fails to mention why the change.
It should mention commit a980c0ef9f6d8c.

> Also why not have it return bool?
> 
> cheers
> 
