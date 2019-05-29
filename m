Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E94BB2E4E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2019 20:58:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Dg3C1ZbzzDqJN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 04:58:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com;
 envelope-from=alex.williamson@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Dg1Y5pF5zDqDb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 04:57:03 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3C55F30C1B92;
 Wed, 29 May 2019 18:56:41 +0000 (UTC)
Received: from x1.home (ovpn-116-22.phx2.redhat.com [10.3.116.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A9CF5C5DF;
 Wed, 29 May 2019 18:56:28 +0000 (UTC)
Date: Wed, 29 May 2019 12:56:27 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Daniel Jordan <daniel.m.jordan@oracle.com>
Subject: Re: [PATCH v2] mm: add account_locked_vm utility function
Message-ID: <20190529125627.0cb5b704@x1.home>
In-Reply-To: <20190528150424.tjbaiptpjhzg7y75@ca-dmjordan1.us.oracle.com>
References: <de375582-2c35-8e8a-4737-c816052a8e58@ozlabs.ru>
 <20190524175045.26897-1-daniel.m.jordan@oracle.com>
 <20190525145118.bfda2d75a14db05a001e49ad@linux-foundation.org>
 <20190528150424.tjbaiptpjhzg7y75@ca-dmjordan1.us.oracle.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 29 May 2019 18:57:01 +0000 (UTC)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Davidlohr Bueso <dave@stgolabs.net>,
 kvm@vger.kernel.org, Alan Tull <atull@kernel.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, linux-fpga@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, Moritz Fischer <mdf@kernel.org>,
 Steve Sistare <steven.sistare@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Lameter <cl@linux.com>, Wu Hao <hao.wu@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 May 2019 11:04:24 -0400
Daniel Jordan <daniel.m.jordan@oracle.com> wrote:

> On Sat, May 25, 2019 at 02:51:18PM -0700, Andrew Morton wrote:
> > On Fri, 24 May 2019 13:50:45 -0400 Daniel Jordan <daniel.m.jordan@oracle.com> wrote:
> >   
> > > locked_vm accounting is done roughly the same way in five places, so
> > > unify them in a helper.  Standardize the debug prints, which vary
> > > slightly, but include the helper's caller to disambiguate between
> > > callsites.
> > > 
> > > Error codes stay the same, so user-visible behavior does too.  The one
> > > exception is that the -EPERM case in tce_account_locked_vm is removed
> > > because Alexey has never seen it triggered.
> > > 
> > > ...
> > >
> > > --- a/include/linux/mm.h
> > > +++ b/include/linux/mm.h
> > > @@ -1564,6 +1564,25 @@ long get_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
> > >  int get_user_pages_fast(unsigned long start, int nr_pages,
> > >  			unsigned int gup_flags, struct page **pages);
> > >  
> > > +int __account_locked_vm(struct mm_struct *mm, unsigned long pages, bool inc,
> > > +			struct task_struct *task, bool bypass_rlim);
> > > +
> > > +static inline int account_locked_vm(struct mm_struct *mm, unsigned long pages,
> > > +				    bool inc)
> > > +{
> > > +	int ret;
> > > +
> > > +	if (pages == 0 || !mm)
> > > +		return 0;
> > > +
> > > +	down_write(&mm->mmap_sem);
> > > +	ret = __account_locked_vm(mm, pages, inc, current,
> > > +				  capable(CAP_IPC_LOCK));
> > > +	up_write(&mm->mmap_sem);
> > > +
> > > +	return ret;
> > > +}  
> > 
> > That's quite a mouthful for an inlined function.  How about uninlining
> > the whole thing and fiddling drivers/vfio/vfio_iommu_type1.c to suit. 
> > I wonder why it does down_write_killable and whether it really needs
> > to...  
> 
> Sure, I can uninline it.  vfio changelogs don't show a particular reason for
> _killable[1].  Maybe Alex has something to add.  Otherwise I'll respin without
> it since the simplification seems worth removing _killable.
> 
> [1] 0cfef2b7410b ("vfio/type1: Remove locked page accounting workqueue")

A userspace vfio driver maps DMA via an ioctl through this path, so I
believe I used killable here just to be friendly that it could be
interrupted and we could fall out with an errno if it were stuck here.
No harm, no foul, the user's mapping is aborted and unwound.  If we're
deadlocked or seriously contended on mmap_sem, maybe we're already in
trouble, but it seemed like a valid and low hanging use case for
killable.  Thanks,

Alex
