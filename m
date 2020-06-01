Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 437121EA137
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 11:52:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49b9Sd3pV2zDqG6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 19:52:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=jack@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49b9R419CrzDqD5
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jun 2020 19:50:55 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1B2F5AC96;
 Mon,  1 Jun 2020 09:50:52 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 9BEC31E0948; Mon,  1 Jun 2020 11:50:49 +0200 (CEST)
Date: Mon, 1 Jun 2020 11:50:49 +0200
From: Jan Kara <jack@suse.cz>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [RFC PATCH 1/2] libnvdimm: Add prctl control for disabling
 synchronous fault support.
Message-ID: <20200601095049.GB3960@quack2.suse.cz>
References: <20200529054141.156384-1-aneesh.kumar@linux.ibm.com>
 <20200529093310.GL25173@kitsune.suse.cz>
 <6183cf4a-d134-99e5-936e-ef35f530c2ec@linux.ibm.com>
 <20200529095250.GP14550@quack2.suse.cz>
 <7e8ee9e3-4d4d-e4b9-913b-1c2448adc62a@linux.ibm.com>
 <CAPcyv4jrss3dFcCOar3JTFnuN0_pgFNtBPiJzUdKxtiax6pPgQ@mail.gmail.com>
 <7f163562-e7e3-7668-7415-c40e57c32582@linux.ibm.com>
 <CAPcyv4i7k7t8is_6FKAWbWsGHVO0kvj-OqqqJTzw=VS7xtZVvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPcyv4i7k7t8is_6FKAWbWsGHVO0kvj-OqqqJTzw=VS7xtZVvQ@mail.gmail.com>
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
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, jack@suse.de,
 Jeff Moyer <jmoyer@redhat.com>, Oliver O'Halloran <oohall@gmail.com>,
 Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat 30-05-20 09:35:19, Dan Williams wrote:
> On Sat, May 30, 2020 at 12:18 AM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
> >
> > On 5/30/20 12:52 AM, Dan Williams wrote:
> > > On Fri, May 29, 2020 at 3:55 AM Aneesh Kumar K.V
> > > <aneesh.kumar@linux.ibm.com> wrote:
> > >>
> > >> On 5/29/20 3:22 PM, Jan Kara wrote:
> > >>> Hi!
> > >>>
> > >>> On Fri 29-05-20 15:07:31, Aneesh Kumar K.V wrote:
> > >>>> Thanks Michal. I also missed Jeff in this email thread.
> > >>>
> > >>> And I think you'll also need some of the sched maintainers for the prctl
> > >>> bits...
> > >>>
> > >>>> On 5/29/20 3:03 PM, Michal Suchánek wrote:
> > >>>>> Adding Jan
> > >>>>>
> > >>>>> On Fri, May 29, 2020 at 11:11:39AM +0530, Aneesh Kumar K.V wrote:
> > >>>>>> With POWER10, architecture is adding new pmem flush and sync instructions.
> > >>>>>> The kernel should prevent the usage of MAP_SYNC if applications are not using
> > >>>>>> the new instructions on newer hardware.
> > >>>>>>
> > >>>>>> This patch adds a prctl option MAP_SYNC_ENABLE that can be used to enable
> > >>>>>> the usage of MAP_SYNC. The kernel config option is added to allow the user
> > >>>>>> to control whether MAP_SYNC should be enabled by default or not.
> > >>>>>>
> > >>>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> > >>> ...
> > >>>>>> diff --git a/kernel/fork.c b/kernel/fork.c
> > >>>>>> index 8c700f881d92..d5a9a363e81e 100644
> > >>>>>> --- a/kernel/fork.c
> > >>>>>> +++ b/kernel/fork.c
> > >>>>>> @@ -963,6 +963,12 @@ __cacheline_aligned_in_smp DEFINE_SPINLOCK(mmlist_lock);
> > >>>>>>     static unsigned long default_dump_filter = MMF_DUMP_FILTER_DEFAULT;
> > >>>>>> +#ifdef CONFIG_ARCH_MAP_SYNC_DISABLE
> > >>>>>> +unsigned long default_map_sync_mask = MMF_DISABLE_MAP_SYNC_MASK;
> > >>>>>> +#else
> > >>>>>> +unsigned long default_map_sync_mask = 0;
> > >>>>>> +#endif
> > >>>>>> +
> > >>>
> > >>> I'm not sure CONFIG is really the right approach here. For a distro that would
> > >>> basically mean to disable MAP_SYNC for all PPC kernels unless application
> > >>> explicitly uses the right prctl. Shouldn't we rather initialize
> > >>> default_map_sync_mask on boot based on whether the CPU we run on requires
> > >>> new flush instructions or not? Otherwise the patch looks sensible.
> > >>>
> > >>
> > >> yes that is correct. We ideally want to deny MAP_SYNC only w.r.t
> > >> POWER10. But on a virtualized platform there is no easy way to detect
> > >> that. We could ideally hook this into the nvdimm driver where we look at
> > >> the new compat string ibm,persistent-memory-v2 and then disable MAP_SYNC
> > >> if we find a device with the specific value.
> > >>
> > >> BTW with the recent changes I posted for the nvdimm driver, older kernel
> > >> won't initialize persistent memory device on newer hardware. Newer
> > >> hardware will present the device to OS with a different device tree
> > >> compat string.
> > >>
> > >> My expectation  w.r.t this patch was, Distro would want to  mark
> > >> CONFIG_ARCH_MAP_SYNC_DISABLE=n based on the different application
> > >> certification.  Otherwise application will have to end up calling the
> > >> prctl(MMF_DISABLE_MAP_SYNC, 0) any way. If that is the case, should this
> > >> be dependent on P10?
> > >>
> > >> With that I am wondering should we even have this patch? Can we expect
> > >> userspace get updated to use new instruction?.
> > >>
> > >> With ppc64 we never had a real persistent memory device available for
> > >> end user to try. The available persistent memory stack was using vPMEM
> > >> which was presented as a volatile memory region for which there is no
> > >> need to use any of the flush instructions. We could safely assume that
> > >> as we get applications certified/verified for working with pmem device
> > >> on ppc64, they would all be using the new instructions?
> > >
> > > I think prctl is the wrong interface for this. I was thinking a sysfs
> > > interface along the same lines as /sys/block/pmemX/dax/write_cache.
> > > That attribute is toggling DAXDEV_WRITE_CACHE for the determination of
> > > whether the platform or the kernel needs to handle cache flushing
> > > relative to power loss. A similar attribute can be established for
> > > DAXDEV_SYNC, it would simply default to off based on a configuration
> > > time policy, but be dynamically changeable at runtime via sysfs.
> > >
> > > These flags are device properties that affect the kernel and
> > > userspace's handling of persistence.
> > >
> >
> > That will not handle the scenario with multiple applications using the
> > same fsdax mount point where one is updated to use the new instruction
> > and the other is not.
> 
> Right, it needs to be a global setting / flag day to switch from one
> regime to another. Per-process control is a recipe for disaster.

First I'd like to mention that hopefully the concern is mostly theoretical
since as Aneesh wrote above, real persistent memory never shipped for PPC
and so there are very few apps (if any) using the old way to ensure cache
flushing.

But I'd like to understand why do you think per-process control is a recipe
for disaster? Because from my POV the sysfs interface you propose is actually
difficult to use in practice. As a distributor, you have hard time picking
the default because you have a choice between picking safe option which is
going to confuse users because of failing MAP_SYNC and unsafe option where
everyone will be happy until someone looses data because of some ancient
application using wrong instructions to persist data. Poor experience for
users in either way. And when distro defaults to "safe option", then the
burden is on the sysadmin to toggle the switch but how is he supposed to
decide when that is safe? First he has to understand what the problem
actually is, then he has to audit all the applications using pmem whether
they use the new instruction - which is IMO a lot of effort if you have a
couple of applications and practically infeasible if you have more of them.
So IMO the burden should be *on the application* to declare that it is
aware of the new instructions to flush pmem on the platform and only to
such application the kernel should give the trust to use MAP_SYNC mappings.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
