Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F151DE31C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 11:33:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49T1W52hqpzDr0D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 19:33:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49T1TP518kzDqwt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 19:31:34 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CA067B22A;
 Fri, 22 May 2020 09:31:31 +0000 (UTC)
Date: Fri, 22 May 2020 11:31:27 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH v2 3/5] libnvdimm/nvdimm/flush: Allow architecture to
 override the flush barrier
Message-ID: <20200522093127.GY25173@kitsune.suse.cz>
References: <20200513034705.172983-3-aneesh.kumar@linux.ibm.com>
 <CAPcyv4iAdrdMiSzVr1UL9Naya+Rq70WVuKqCCNFHe1C4n+E6Tw@mail.gmail.com>
 <87v9kspk3x.fsf@linux.ibm.com>
 <CAPcyv4g+oE305Q5bYWkNBKFifB9c0TZo6+hqFQnqiFqU5QFrhQ@mail.gmail.com>
 <87d070f2vs.fsf@linux.ibm.com>
 <CAPcyv4jZhYXEmYGzqGPjPtq9ZWJNtQyszN0V0Xcv0qtByK_KCw@mail.gmail.com>
 <x49o8qh9wu5.fsf@segfault.boston.devel.redhat.com>
 <ba91c061-41ef-5c54-8e9b-7b22e44577cd@linux.ibm.com>
 <CAPcyv4iG9GC42s5DaWWegH=Mi7XHgJoUghgOM9qMRrCg4wuMig@mail.gmail.com>
 <alpine.LRH.2.02.2005211442290.22894@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.2005211442290.22894@file01.intranet.prod.int.rdu2.redhat.com>
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
Cc: Jan Kara <jack@suse.cz>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Jeff Moyer <jmoyer@redhat.com>, alistair@popple.id.au,
 Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 21, 2020 at 02:52:30PM -0400, Mikulas Patocka wrote:
> 
> 
> On Thu, 21 May 2020, Dan Williams wrote:
> 
> > On Thu, May 21, 2020 at 10:03 AM Aneesh Kumar K.V
> > <aneesh.kumar@linux.ibm.com> wrote:
> > >
> > > > Moving on to the patch itself--Aneesh, have you audited other persistent
> > > > memory users in the kernel?  For example, drivers/md/dm-writecache.c does
> > > > this:
> > > >
> > > > static void writecache_commit_flushed(struct dm_writecache *wc, bool wait_for_ios)
> > > > {
> > > >       if (WC_MODE_PMEM(wc))
> > > >               wmb(); <==========
> > > >          else
> > > >                  ssd_commit_flushed(wc, wait_for_ios);
> > > > }
> > > >
> > > > I believe you'll need to make modifications there.
> > > >
> > >
> > > Correct. Thanks for catching that.
> > >
> > >
> > > I don't understand dm much, wondering how this will work with
> > > non-synchronous DAX device?
> > 
> > That's a good point. DM-writecache needs to be cognizant of things
> > like virtio-pmem that violate the rule that persisent memory writes
> > can be flushed by CPU functions rather than calling back into the
> > driver. It seems we need to always make the flush case a dax_operation
> > callback to account for this.
> 
> dm-writecache is normally sitting on the top of dm-linear, so it would 
> need to pass the wmb() call through the dm core and dm-linear target ... 
> that would slow it down ... I remember that you already did it this way 
> some times ago and then removed it.
> 
> What's the exact problem with POWER? Could the POWER system have two types 
> of persistent memory that need two different ways of flushing?

As far as I understand the discussion so far

 - on POWER $oldhardware uses $oldinstruction to ensure pmem consistency
 - on POWER $newhardware uses $newinstruction to ensure pmem consistency
   (compatible with $oldinstruction on $oldhardware)
 - on some platforms instead of barrier instruction a callback into the
   driver is issued to ensure consistency

None of this is reflected by the dm driver.

Thanks

Michal
