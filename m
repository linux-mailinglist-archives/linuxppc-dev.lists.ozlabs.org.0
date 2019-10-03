Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2354BC9905
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 09:33:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kPqY3B4czDqXs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 17:32:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="B4wbOH9N"; dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kPnT1p0czDqXb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2019 17:31:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QsQ0pKc29g6AJUvIf8oghBRQ3LKFY4Dh/HxyizW2xtQ=; b=B4wbOH9NB4/QQQ0XP2JE6ZJpc
 qBm4NYJ2bhIkYOjtu7lY6JQ3ei2MG79dTQ2TN7IEetm8Mj3gD3Ee0ulG2Y6i0k9yinZRnJFAozQMO
 AGDj86EdrEp4RrwAPMPswc3+7gPnJJf/0HnuzS7Dp97ZUqU2VsZYULFj3wKz9czO9jBR389ob2QDP
 DK201mUK82fZqlSIItfgJQGVDTtvENKjL71ga8eA8p4/CxTEy/XCDEvcqrlfxCNutmDWq9JUxfsRL
 39o62euiLHa5KcWthoaLFVxoJTkgkw7dglH6kiAv+qOw8jV6S7KZ6l9A7Px/OqO6Bab0ME4q67/wg
 HsmVpl0pg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFvYj-0003dq-Rg; Thu, 03 Oct 2019 07:29:58 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B9AE4301A79;
 Thu,  3 Oct 2019 09:29:03 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id CC90020FF8D3E; Thu,  3 Oct 2019 09:29:52 +0200 (CEST)
Date: Thu, 3 Oct 2019 09:29:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Leonardo Bras <leonardo@linux.ibm.com>
Subject: Re: [PATCH v5 00/11] Introduces new count-based method for tracking
 lockless pagetable walks
Message-ID: <20191003072952.GN4536@hirez.programming.kicks-ass.net>
References: <20191003013325.2614-1-leonardo@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191003013325.2614-1-leonardo@linux.ibm.com>
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
Cc: Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>,
 "Dmitry V. Levin" <ldv@altlinux.org>, Keith Busch <keith.busch@intel.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Christoph Lameter <cl@linux.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Santosh Sivaraj <santosh@fossix.org>, Davidlohr Bueso <dave@stgolabs.net>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Andrea Arcangeli <aarcange@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 John Hubbard <jhubbard@nvidia.com>, Jesper Dangaard Brouer <brouer@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, kvm-ppc@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Reza Arbab <arbab@linux.ibm.com>,
 Allison Randal <allison@lohutok.net>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Roman Gushchin <guro@fb.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 02, 2019 at 10:33:14PM -0300, Leonardo Bras wrote:
> If a process (qemu) with a lot of CPUs (128) try to munmap() a large
> chunk of memory (496GB) mapped with THP, it takes an average of 275
> seconds, which can cause a lot of problems to the load (in qemu case,
> the guest will lock for this time).
> 
> Trying to find the source of this bug, I found out most of this time is
> spent on serialize_against_pte_lookup(). This function will take a lot
> of time in smp_call_function_many() if there is more than a couple CPUs
> running the user process. Since it has to happen to all THP mapped, it
> will take a very long time for large amounts of memory.
> 
> By the docs, serialize_against_pte_lookup() is needed in order to avoid
> pmd_t to pte_t casting inside find_current_mm_pte(), or any lockless
> pagetable walk, to happen concurrently with THP splitting/collapsing.
> 
> It does so by calling a do_nothing() on each CPU in mm->cpu_bitmap[],
> after interrupts are re-enabled.
> Since, interrupts are (usually) disabled during lockless pagetable
> walk, and serialize_against_pte_lookup will only return after
> interrupts are enabled, it is protected.

This is something entirely specific to Power, you shouldn't be touching
generic code at all.

Also, I'm not sure I understand things properly.

So serialize_against_pte_lookup() wants to wait for all currently
out-standing __find_linux_pte() instances (which are very similar to
gup_fast).

It seems to want to do this before flushing the THP TLB for some reason;
why? Should not THP observe the normal page table freeing rules which
includes a RCU-like grace period like this already.

Why is THP special here? This doesn't seem adequately explained.

Also, specifically to munmap(), this seems entirely superfluous,
munmap() uses the normal page-table freeing code and should be entirely
fine without additional waiting.

Furthermore, Power never accurately tracks mm_cpumask(), so using that
makes the whole thing more expensive than it needs to be. Also, I
suppose that is buggered vs file backed THP.
