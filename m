Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 716311ECB76
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 10:27:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cMVL31vQzDqXP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 18:27:54 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cMSn0jPHzDqQd
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 18:26:32 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 66866ACED;
 Wed,  3 Jun 2020 08:26:32 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 7A0A01E1281; Wed,  3 Jun 2020 10:26:28 +0200 (CEST)
Date: Wed, 3 Jun 2020 10:26:28 +0200
From: Jan Kara <jack@suse.cz>
To: "Williams, Dan J" <dan.j.williams@intel.com>
Subject: Re: [RFC PATCH 1/2] libnvdimm: Add prctl control for disabling
 synchronous fault support.
Message-ID: <20200603082628.GE19165@quack2.suse.cz>
References: <20200529054141.156384-1-aneesh.kumar@linux.ibm.com>
 <20200529093310.GL25173@kitsune.suse.cz>
 <6183cf4a-d134-99e5-936e-ef35f530c2ec@linux.ibm.com>
 <20200529095250.GP14550@quack2.suse.cz>
 <7e8ee9e3-4d4d-e4b9-913b-1c2448adc62a@linux.ibm.com>
 <CAPcyv4jrss3dFcCOar3JTFnuN0_pgFNtBPiJzUdKxtiax6pPgQ@mail.gmail.com>
 <7f163562-e7e3-7668-7415-c40e57c32582@linux.ibm.com>
 <CAPcyv4i7k7t8is_6FKAWbWsGHVO0kvj-OqqqJTzw=VS7xtZVvQ@mail.gmail.com>
 <20200601095049.GB3960@quack2.suse.cz>
 <BN6PR11MB41328EB6F894DB391DC09DAEC68B0@BN6PR11MB4132.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN6PR11MB41328EB6F894DB391DC09DAEC68B0@BN6PR11MB4132.namprd11.prod.outlook.com>
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
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, "jack@suse.de" <jack@suse.de>,
 Jeff Moyer <jmoyer@redhat.com>, Oliver O'Halloran <oohall@gmail.com>,
 Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 02-06-20 17:59:08, Williams, Dan J wrote:
> [ forgive formatting, a series of unfortunate events has me using Outlook for the moment ]
> 
> > From: Jan Kara <jack@suse.cz>
> > > > > These flags are device properties that affect the kernel and
> > > > > userspace's handling of persistence.
> > > > >
> > > >
> > > > That will not handle the scenario with multiple applications using
> > > > the same fsdax mount point where one is updated to use the new
> > > > instruction and the other is not.
> > >
> > > Right, it needs to be a global setting / flag day to switch from one
> > > regime to another. Per-process control is a recipe for disaster.
> > 
> > First I'd like to mention that hopefully the concern is mostly theoretical since
> > as Aneesh wrote above, real persistent memory never shipped for PPC and
> > so there are very few apps (if any) using the old way to ensure cache
> > flushing.
> > 
> > But I'd like to understand why do you think per-process control is a recipe for
> > disaster? Because from my POV the sysfs interface you propose is actually
> > difficult to use in practice. As a distributor, you have hard time picking the
> > default because you have a choice between picking safe option which is
> > going to confuse users because of failing MAP_SYNC and unsafe option
> > where everyone will be happy until someone looses data because of some
> > ancient application using wrong instructions to persist data. Poor experience
> > for users in either way. And when distro defaults to "safe option", then the
> > burden is on the sysadmin to toggle the switch but how is he supposed to
> > decide when that is safe? First he has to understand what the problem
> > actually is, then he has to audit all the applications using pmem whether they
> > use the new instruction - which is IMO a lot of effort if you have a couple of
> > applications and practically infeasible if you have more of them.
> > So IMO the burden should be *on the application* to declare that it is aware
> > of the new instructions to flush pmem on the platform and only to such
> > application the kernel should give the trust to use MAP_SYNC mappings.
> 
> The "disaster" in my mind is this need to globally change the ABI for
> persistence semantics for all of Linux because one CPU wants a do over.
> What does a generic "MAP_SYNC_ENABLE" knob even mean to the existing
> deployed base of persistent memory applications? Yes, sysfs is awkward,
> but it's trying to provide some relief without imposing unexplainable
> semantics on everyone else. I think a comprehensive (overengineered)
> solution would involve not introducing another "I know what I'm doing"
> flag to the interface, but maybe requiring applications to call a pmem
> sync API in something like a vsyscall. Or, also overengineered, some
> binary translation / interpretation to actively detect and kill
> applications that deploy the old instructions. Something horrid like on
> first write fault to a MAP_SYNC try to look ahead in the binary for the
> correct sync sequence and kill the application otherwise. That would at
> least provide some enforcement and safety without requiring other
> architectures to consider what MAP_SYNC_ENABLE means to them.

Thanks for explanation. So I absolutely agree that other architectures (and
even older versions of POWER architecture) must not be influenced by the new
tunable. That's why I wrote in my reply to Aneesh that I'd be for checking
during mmap(2) with MAP_SYNC, whether we are in a situation where new PPC
flush instructions are required and *only in that case* decide based on the
prctl value whether MAP_SYNC should be allowed or not.

Whether this solution is overengineering or not depends on how you think
it's likely there will be applications trying to use old flush instructions
with MAP_SYNC on POWER10 platforms...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
