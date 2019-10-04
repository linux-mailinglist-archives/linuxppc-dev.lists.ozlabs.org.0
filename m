Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F13CB915
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 13:27:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46l6zd0W3XzDqf3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 21:27:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46l6x00YmczDqcn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 21:25:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RXKGx8X/1FKuOuVTe5a+zqWHCcREtJtzpf0mmOIuvz8=; b=ZnsQjPYPqZqfl38X4184WJZaF
 IYI0tUAi3WvtFfwDF0F7a/z/9DOD3bKMVBAWXGmHRNf7hNtFvXJvmis0Vx2M21gA7KXvL/dhCzCb/
 u5a5KdVT6IZKTbJ44Y1idOc//bRcOX9/SKd8UzoqsZkGsVLIY1NjnS2kkt+LesFbCQy0e0E+HXzMk
 EjbwXR2oPQO67RrgJR4a2azNCgtEzeN2UpIRClq45dXeObg7fRoZC+8hTQpdNmwXMmhSVkwSRczJv
 Sgtn+GLMpXxswWi2KXhjwrRntT6prFNu60S3ZLgFuy3kWbwoYAIc5BDl8xIJwPWMPOI5wQzyTOcWz
 YAkdtWSzA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGLhD-0000Hy-LH; Fri, 04 Oct 2019 11:24:27 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DD6E9305ED5;
 Fri,  4 Oct 2019 13:23:31 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 60366203E50D2; Fri,  4 Oct 2019 13:24:21 +0200 (CEST)
Date: Fri, 4 Oct 2019 13:24:21 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v5 01/11] asm-generic/pgtable: Adds generic functions to
 monitor lockless pgtable walks
Message-ID: <20191004112421.GB19463@hirez.programming.kicks-ass.net>
References: <20191003013325.2614-1-leonardo@linux.ibm.com>
 <20191003013325.2614-2-leonardo@linux.ibm.com>
 <20191003071145.GM4536@hirez.programming.kicks-ass.net>
 <20191003115141.GJ4581@hirez.programming.kicks-ass.net>
 <c127ee98-094b-d5c0-0a42-6d01c16a72d9@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c127ee98-094b-d5c0-0a42-6d01c16a72d9@nvidia.com>
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
 Leonardo Bras <leonardo@linux.ibm.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 Jann Horn <jannh@google.com>, Jesper Dangaard Brouer <brouer@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, kvm-ppc@vger.kernel.org,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Thomas Gleixner <tglx@linutronix.de>, Reza Arbab <arbab@linux.ibm.com>,
 Allison Randal <allison@lohutok.net>, Paul McKenney <Paul.McKenney@us.ibm.com>,
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

On Thu, Oct 03, 2019 at 01:40:38PM -0700, John Hubbard wrote:
> On 10/3/19 4:51 AM, Peter Zijlstra wrote:
> > On Thu, Oct 03, 2019 at 09:11:45AM +0200, Peter Zijlstra wrote:
> >> On Wed, Oct 02, 2019 at 10:33:15PM -0300, Leonardo Bras wrote:
> ...
> > 
> > I'm still really confused about this barrier. It just doesn't make
> > sense.
> > 
> > If an interrupt happens before the local_irq_disable()/save(), then it
> > will discard any and all speculation that would be in progress to handle
> > the exception.
> > 
> 
> Hi Peter,
> 
> So, would that imply that it's correct to apply approximately the following
> patch:
> 
> diff --git a/Documentation/memory-barriers.txt b/Documentation/memory-barriers.txt
> index 1adbb8a371c7..cf41eff37e24 100644
> --- a/Documentation/memory-barriers.txt
> +++ b/Documentation/memory-barriers.txt
> @@ -2099,9 +2099,9 @@ INTERRUPT DISABLING FUNCTIONS
>  -----------------------------
>  
>  Functions that disable interrupts (ACQUIRE equivalent) and enable interrupts
> -(RELEASE equivalent) will act as compiler barriers only.  So if memory or I/O
> -barriers are required in such a situation, they must be provided from some
> -other means.
> +(RELEASE equivalent) will act as full memory barriers. This is because, for
> +all supported CPU architectures, interrupt arrival causes all speculative
> +memory accesses to be discarded.
>  
> ?

No, you're misunderstanding. They imply nothing of the sort.
