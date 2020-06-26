Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 765C920AF9F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 12:22:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tXy72nvMzDqVs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 20:22:39 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tXvW4HwSzDqXq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 20:20:23 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F3E42B581;
 Fri, 26 Jun 2020 10:20:17 +0000 (UTC)
Date: Fri, 26 Jun 2020 12:20:16 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH v2 3/5] libnvdimm/nvdimm/flush: Allow architecture to
 override the flush barrier
Message-ID: <20200626102016.GP21462@kitsune.suse.cz>
References: <CAPcyv4g+oE305Q5bYWkNBKFifB9c0TZo6+hqFQnqiFqU5QFrhQ@mail.gmail.com>
 <87d070f2vs.fsf@linux.ibm.com>
 <CAPcyv4jZhYXEmYGzqGPjPtq9ZWJNtQyszN0V0Xcv0qtByK_KCw@mail.gmail.com>
 <x49o8qh9wu5.fsf@segfault.boston.devel.redhat.com>
 <ba91c061-41ef-5c54-8e9b-7b22e44577cd@linux.ibm.com>
 <CAPcyv4iG9GC42s5DaWWegH=Mi7XHgJoUghgOM9qMRrCg4wuMig@mail.gmail.com>
 <alpine.LRH.2.02.2005211442290.22894@file01.intranet.prod.int.rdu2.redhat.com>
 <20200522093127.GY25173@kitsune.suse.cz>
 <23e57565-be2a-a45c-f4d4-d8eca7262dea@linux.ibm.com>
 <alpine.LRH.2.02.2005220845200.17488@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LRH.2.02.2005220845200.17488@file01.intranet.prod.int.rdu2.redhat.com>
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

On Fri, May 22, 2020 at 09:01:17AM -0400, Mikulas Patocka wrote:
> 
> 
> On Fri, 22 May 2020, Aneesh Kumar K.V wrote:
> 
> > On 5/22/20 3:01 PM, Michal Suchánek wrote:
> > > On Thu, May 21, 2020 at 02:52:30PM -0400, Mikulas Patocka wrote:
> > > > 
> > > > 
> > > > On Thu, 21 May 2020, Dan Williams wrote:
> > > > 
> > > > > On Thu, May 21, 2020 at 10:03 AM Aneesh Kumar K.V
> > > > > <aneesh.kumar@linux.ibm.com> wrote:
> > > > > > 
> > > > > > > Moving on to the patch itself--Aneesh, have you audited other
> > > > > > > persistent
> > > > > > > memory users in the kernel?  For example, drivers/md/dm-writecache.c
> > > > > > > does
> > > > > > > this:
> > > > > > > 
> > > > > > > static void writecache_commit_flushed(struct dm_writecache *wc, bool
> > > > > > > wait_for_ios)
> > > > > > > {
> > > > > > >        if (WC_MODE_PMEM(wc))
> > > > > > >                wmb(); <==========
> > > > > > >           else
> > > > > > >                   ssd_commit_flushed(wc, wait_for_ios);
> > > > > > > }
> > > > > > > 
> > > > > > > I believe you'll need to make modifications there.
> > > > > > > 
> > > > > > 
> > > > > > Correct. Thanks for catching that.
> > > > > > 
> > > > > > 
> > > > > > I don't understand dm much, wondering how this will work with
> > > > > > non-synchronous DAX device?
> > > > > 
> > > > > That's a good point. DM-writecache needs to be cognizant of things
> > > > > like virtio-pmem that violate the rule that persisent memory writes
> > > > > can be flushed by CPU functions rather than calling back into the
> > > > > driver. It seems we need to always make the flush case a dax_operation
> > > > > callback to account for this.
> > > > 
> > > > dm-writecache is normally sitting on the top of dm-linear, so it would
> > > > need to pass the wmb() call through the dm core and dm-linear target ...
> > > > that would slow it down ... I remember that you already did it this way
> > > > some times ago and then removed it.
> > > > 
> > > > What's the exact problem with POWER? Could the POWER system have two types
> > > > of persistent memory that need two different ways of flushing?
> > > 
> > > As far as I understand the discussion so far
> > > 
> > >   - on POWER $oldhardware uses $oldinstruction to ensure pmem consistency
> > >   - on POWER $newhardware uses $newinstruction to ensure pmem consistency
> > >     (compatible with $oldinstruction on $oldhardware)
> > 
> > Correct.
> > 
> > >   - on some platforms instead of barrier instruction a callback into the
> > >     driver is issued to ensure consistency 
> > 
> > This is virtio-pmem only at this point IIUC.
> > 
> > -aneesh
> 
> And does the virtio-pmem driver track which pages are dirty? Or does it 
> need to specify the range of pages to flush in the flush function?
> 
> > > None of this is reflected by the dm driver.
> 
> We could make a new dax method:
> void *(dax_get_flush_function)(void);
> 
> This would return a pointer to "wmb()" on x86 and something else on Power.
> 
> The method "dax_get_flush_function" would be called only once when 
> initializing the writecache driver (because the call would be slow because 
> it would have to go through the DM stack) and then, the returned function 
> would be called each time we need write ordering. The returned function 
> would do just "sfence; ret".

Hello,

as far as I understand the code virtio_pmem has a fush function defined
which indeed can make use of the region properties, such as memory
range. If such function exists you need quivalent of sync() - call into
the device in question. If it does not calling arch_pmem_flush_barrier()
instead of wmb() should suffice.

I am not aware of an interface to determine if the flush function exists
for a particular region.

Thanks

Michal
