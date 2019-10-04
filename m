Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26732CB924
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 13:32:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46l74z6GNZzDqdx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 21:32:03 +1000 (AEST)
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
 header.b="nwkEEfEL"; dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46l72G34vzzDqDt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 21:29:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jWelrCDVOAXy8hN8VjR1adB6IyXBOt3/QtmJ/voDmTs=; b=nwkEEfEL12BnVaYLSfPhd2e2Ln
 hB4i1gugq22rSMg1LCnlbu6Qno1BBRHFOYKFvZyD3L4tBd0085H+yAZ4MYaDWZ+eP9oY3o3MNjJjq
 BEhzcevGCSW20rEaS/5saCafPoGFWaV5v3eJouN5tEsfE5BvsGSyxBqt1fERyo/REimJh4LSRmyaD
 agnFLXltPj3p7qKpQ+/CtvR16C+KLJoJbaK2jrMk+LNGNWsTUGeC9qRmcCVlFJEUgAYK8Ay+xtxiS
 yUMpUi4BK+2/uOCdWIDdObYgY4555aqt6UZIbyTTrJBxLdCN8KfntKpA4qSjahlZ1BSiE8ZrmsiCl
 lZ0ESvGw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGLlP-0005rP-Ht; Fri, 04 Oct 2019 11:28:47 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DE8643013A4;
 Fri,  4 Oct 2019 13:27:54 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 7BFF0203E50D2; Fri,  4 Oct 2019 13:28:44 +0200 (CEST)
Date: Fri, 4 Oct 2019 13:28:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Leonardo Bras <leonardo@linux.ibm.com>
Subject: Re: [PATCH v5 01/11] asm-generic/pgtable: Adds generic functions to
 monitor lockless pgtable walks
Message-ID: <20191004112844.GC19463@hirez.programming.kicks-ass.net>
References: <20191003013325.2614-1-leonardo@linux.ibm.com>
 <20191003013325.2614-2-leonardo@linux.ibm.com>
 <20191003071145.GM4536@hirez.programming.kicks-ass.net>
 <20191003115141.GJ4581@hirez.programming.kicks-ass.net>
 <c46ba8cec981ad28383bb7b23161fb83ccda4a60.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c46ba8cec981ad28383bb7b23161fb83ccda4a60.camel@linux.ibm.com>
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
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 "Dmitry V. Levin" <ldv@altlinux.org>, Keith Busch <keith.busch@intel.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Christoph Lameter <cl@linux.com>, Ira Weiny <ira.weiny@intel.com>,
 Ingo Molnar <mingo@kernel.org>, Elena Reshetova <elena.reshetova@intel.com>,
 linux-arch@vger.kernel.org, Santosh Sivaraj <santosh@fossix.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Allison Randal <allison@lohutok.net>,
 Jesper Dangaard Brouer <brouer@redhat.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 John Hubbard <jhubbard@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, kvm-ppc@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Reza Arbab <arbab@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Roman Gushchin <guro@fb.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 03, 2019 at 06:24:07PM -0300, Leonardo Bras wrote:
> Hello Peter, thanks for the feedback!
>=20
> On Thu, 2019-10-03 at 13:51 +0200, Peter Zijlstra wrote:
> > On Thu, Oct 03, 2019 at 09:11:45AM +0200, Peter Zijlstra wrote:
> > > On Wed, Oct 02, 2019 at 10:33:15PM -0300, Leonardo Bras wrote:
> > > > diff --git a/include/asm-generic/pgtable.h b/include/asm-generic/pg=
table.h
> > > > index 818691846c90..3043ea9812d5 100644
> > > > --- a/include/asm-generic/pgtable.h
> > > > +++ b/include/asm-generic/pgtable.h
> > > > @@ -1171,6 +1171,64 @@ static inline bool arch_has_pfn_modify_check=
(void)
> > > >  #endif
> > > >  #endif
> > > > =20
> > > > +#ifndef __HAVE_ARCH_LOCKLESS_PGTBL_WALK_CONTROL
> > > > +static inline unsigned long begin_lockless_pgtbl_walk(struct mm_st=
ruct *mm)
> > > > +{
> > > > +	unsigned long irq_mask;
> > > > +
> > > > +	if (IS_ENABLED(CONFIG_LOCKLESS_PAGE_TABLE_WALK_TRACKING))
> > > > +		atomic_inc(&mm->lockless_pgtbl_walkers);
> > >=20
> > > This will not work for file backed THP. Also, this is a fairly serious
> > > contention point all on its own.
> >=20
> > Kiryl says we have tmpfs-thp, this would be broken vs that, as would
> > your (PowerPC) use of mm_cpumask() for that IPI.
>=20
> Could you please explain it?
> I mean, why this breaks tmpfs-thp?
> Also, why mm_cpumask() is also broken?

Because shared pages are not bound by a mm; or does it not share the thp
state between mappings?

> > And I still think all that wrong, you really shouldn't need to wait on
> > munmap().
>=20
> That is something I need to better understand. I mean, before coming
> with this patch, I thought exactly this: not serialize when on munmap.=20
>=20
> But on the way I was convinced it would not work on munmap. I need to
> recall why, and if it was false to assume this, re-think the whole
> solution.

And once you (re)figure it out, please write it down. It is a crucial
bit of the puzzle and needs to be part of the Changelogs.
