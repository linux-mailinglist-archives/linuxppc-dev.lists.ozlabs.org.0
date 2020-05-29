Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F081E79E2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 11:54:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YKfL2TjvzDqWd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 19:54:18 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YKcn3tm9zDqSt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 19:52:54 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 36E5BAD89;
 Fri, 29 May 2020 09:52:51 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 940641E1289; Fri, 29 May 2020 11:52:50 +0200 (CEST)
Date: Fri, 29 May 2020 11:52:50 +0200
From: Jan Kara <jack@suse.cz>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 1/2] libnvdimm: Add prctl control for disabling
 synchronous fault support.
Message-ID: <20200529095250.GP14550@quack2.suse.cz>
References: <20200529054141.156384-1-aneesh.kumar@linux.ibm.com>
 <20200529093310.GL25173@kitsune.suse.cz>
 <6183cf4a-d134-99e5-936e-ef35f530c2ec@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6183cf4a-d134-99e5-936e-ef35f530c2ec@linux.ibm.com>
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
Cc: linux-nvdimm@lists.01.org, jack@suse.de, Jeff Moyer <jmoyer@redhat.com>,
 oohall@gmail.com, dan.j.williams@intel.com,
 Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Fri 29-05-20 15:07:31, Aneesh Kumar K.V wrote:
> Thanks Michal. I also missed Jeff in this email thread.

And I think you'll also need some of the sched maintainers for the prctl
bits...

> On 5/29/20 3:03 PM, Michal Suchánek wrote:
> > Adding Jan
> > 
> > On Fri, May 29, 2020 at 11:11:39AM +0530, Aneesh Kumar K.V wrote:
> > > With POWER10, architecture is adding new pmem flush and sync instructions.
> > > The kernel should prevent the usage of MAP_SYNC if applications are not using
> > > the new instructions on newer hardware.
> > > 
> > > This patch adds a prctl option MAP_SYNC_ENABLE that can be used to enable
> > > the usage of MAP_SYNC. The kernel config option is added to allow the user
> > > to control whether MAP_SYNC should be enabled by default or not.
> > > 
> > > Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
...
> > > diff --git a/kernel/fork.c b/kernel/fork.c
> > > index 8c700f881d92..d5a9a363e81e 100644
> > > --- a/kernel/fork.c
> > > +++ b/kernel/fork.c
> > > @@ -963,6 +963,12 @@ __cacheline_aligned_in_smp DEFINE_SPINLOCK(mmlist_lock);
> > >   static unsigned long default_dump_filter = MMF_DUMP_FILTER_DEFAULT;
> > > +#ifdef CONFIG_ARCH_MAP_SYNC_DISABLE
> > > +unsigned long default_map_sync_mask = MMF_DISABLE_MAP_SYNC_MASK;
> > > +#else
> > > +unsigned long default_map_sync_mask = 0;
> > > +#endif
> > > +

I'm not sure CONFIG is really the right approach here. For a distro that would
basically mean to disable MAP_SYNC for all PPC kernels unless application
explicitly uses the right prctl. Shouldn't we rather initialize
default_map_sync_mask on boot based on whether the CPU we run on requires
new flush instructions or not? Otherwise the patch looks sensible.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
