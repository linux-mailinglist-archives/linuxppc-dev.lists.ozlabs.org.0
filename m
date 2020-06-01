Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F401EA19A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 12:11:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49b9tB0xXYzDqQj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 20:10:58 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49b9rT2ct5zDqQY
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jun 2020 20:09:29 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 86A91AF7A;
 Mon,  1 Jun 2020 10:09:27 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 567D31E0948; Mon,  1 Jun 2020 12:09:25 +0200 (CEST)
Date: Mon, 1 Jun 2020 12:09:25 +0200
From: Jan Kara <jack@suse.cz>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 1/2] libnvdimm: Add prctl control for disabling
 synchronous fault support.
Message-ID: <20200601100925.GC3960@quack2.suse.cz>
References: <20200529054141.156384-1-aneesh.kumar@linux.ibm.com>
 <20200529093310.GL25173@kitsune.suse.cz>
 <6183cf4a-d134-99e5-936e-ef35f530c2ec@linux.ibm.com>
 <20200529095250.GP14550@quack2.suse.cz>
 <7e8ee9e3-4d4d-e4b9-913b-1c2448adc62a@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e8ee9e3-4d4d-e4b9-913b-1c2448adc62a@linux.ibm.com>
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
Cc: Jan Kara <jack@suse.cz>, linux-nvdimm@lists.01.org, jack@suse.de,
 Jeff Moyer <jmoyer@redhat.com>, oohall@gmail.com, dan.j.williams@intel.com,
 Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri 29-05-20 16:25:35, Aneesh Kumar K.V wrote:
> On 5/29/20 3:22 PM, Jan Kara wrote:
> > On Fri 29-05-20 15:07:31, Aneesh Kumar K.V wrote:
> > > Thanks Michal. I also missed Jeff in this email thread.
> > 
> > And I think you'll also need some of the sched maintainers for the prctl
> > bits...
> > 
> > > On 5/29/20 3:03 PM, Michal Suchánek wrote:
> > > > Adding Jan
> > > > 
> > > > On Fri, May 29, 2020 at 11:11:39AM +0530, Aneesh Kumar K.V wrote:
> > > > > With POWER10, architecture is adding new pmem flush and sync instructions.
> > > > > The kernel should prevent the usage of MAP_SYNC if applications are not using
> > > > > the new instructions on newer hardware.
> > > > > 
> > > > > This patch adds a prctl option MAP_SYNC_ENABLE that can be used to enable
> > > > > the usage of MAP_SYNC. The kernel config option is added to allow the user
> > > > > to control whether MAP_SYNC should be enabled by default or not.
> > > > > 
> > > > > Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> > ...
> > > > > diff --git a/kernel/fork.c b/kernel/fork.c
> > > > > index 8c700f881d92..d5a9a363e81e 100644
> > > > > --- a/kernel/fork.c
> > > > > +++ b/kernel/fork.c
> > > > > @@ -963,6 +963,12 @@ __cacheline_aligned_in_smp DEFINE_SPINLOCK(mmlist_lock);
> > > > >    static unsigned long default_dump_filter = MMF_DUMP_FILTER_DEFAULT;
> > > > > +#ifdef CONFIG_ARCH_MAP_SYNC_DISABLE
> > > > > +unsigned long default_map_sync_mask = MMF_DISABLE_MAP_SYNC_MASK;
> > > > > +#else
> > > > > +unsigned long default_map_sync_mask = 0;
> > > > > +#endif
> > > > > +
> > 
> > I'm not sure CONFIG is really the right approach here. For a distro that would
> > basically mean to disable MAP_SYNC for all PPC kernels unless application
> > explicitly uses the right prctl. Shouldn't we rather initialize
> > default_map_sync_mask on boot based on whether the CPU we run on requires
> > new flush instructions or not? Otherwise the patch looks sensible.
> > 
> 
> yes that is correct. We ideally want to deny MAP_SYNC only w.r.t POWER10.
> But on a virtualized platform there is no easy way to detect that. We could
> ideally hook this into the nvdimm driver where we look at the new compat
> string ibm,persistent-memory-v2 and then disable MAP_SYNC
> if we find a device with the specific value.

Hum, couldn't we set some flag for nvdimm devices with
"ibm,persistent-memory-v2" property and then check it during mmap(2) time
and when the device has this propery and the mmap(2) caller doesn't have
the prctl set, we'd disallow MAP_SYNC? That should make things mostly
seamless, shouldn't it? Only apps that want to use MAP_SYNC on these
devices would need to use prctl(MMF_DISABLE_MAP_SYNC, 0) but then these
applications need to be aware of new instructions so this isn't that much
additional burden...

> With that I am wondering should we even have this patch? Can we expect
> userspace get updated to use new instruction?.
> 
> With ppc64 we never had a real persistent memory device available for end
> user to try. The available persistent memory stack was using vPMEM which was
> presented as a volatile memory region for which there is no need to use any
> of the flush instructions. We could safely assume that as we get
> applications certified/verified for working with pmem device on ppc64, they
> would all be using the new instructions?

This is a bit of a gamble... I don't have too much trust in certification /
verification because only the "big players" may do powerfail testing
throughout enough that they'd uncover these problems. So the question
really is: How many apps are out there using MAP_SYNC on ppc64? Hopefully
not many given the HW didn't ship yet as you wrote but I have no real clue.
Similarly there's a question: How many app writers will read manual for
older ppc64 architecture and write apps that won't work reliably on
POWER10? Again, I have no idea.

So the prctl would be IMHO a nice safety belt but I'm not 100% certain it
will be needed...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
