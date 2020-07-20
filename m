Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60778225CEF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 12:52:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9JTj701FzDqfd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 20:52:41 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9JS93HPyzDqcL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 20:51:21 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AE332B7B3;
 Mon, 20 Jul 2020 10:51:23 +0000 (UTC)
Date: Mon, 20 Jul 2020 12:51:16 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH] powerpc/fault: kernel can extend a user process's stack
Message-ID: <20200720105116.GO32107@kitsune.suse.cz>
References: <20191211014337.28128-1-dja@axtens.net>
 <20191211072806.GI3986@kitsune.suse.cz>
 <8736drciem.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8736drciem.fsf@dja-thinkpad.axtens.net>
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
Cc: Tom Lane <tgl@sss.pgh.pa.us>, linuxppc-dev@lists.ozlabs.org,
 Daniel Black <daniel@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Wed, Dec 11, 2019 at 08:37:21PM +1100, Daniel Axtens wrote:
> > Fixes: 14cf11af6cf6 ("powerpc: Merge enough to start building in
> > arch/powerpc.")
> 
> Wow, that's pretty ancient! I'm also not sure it's right - in that same
> patch, arch/ppc64/mm/fault.c contains:
> 
> ^1da177e4c3f4 (Linus Torvalds         2005-04-16 15:20:36 -0700 213)            if (address + 2048 < uregs->gpr[1]
> ^1da177e4c3f4 (Linus Torvalds         2005-04-16 15:20:36 -0700 214)                && (!user_mode(regs) || !store_updates_sp(regs)))
> ^1da177e4c3f4 (Linus Torvalds         2005-04-16 15:20:36 -0700 215)                    goto bad_area;
> 
> Which is the same as the new arch/powerpc/mm/fault.c code:
> 
> 14cf11af6cf60 (Paul Mackerras 2005-09-26 16:04:21 +1000 234)            if (address + 2048 < uregs->gpr[1]
> 14cf11af6cf60 (Paul Mackerras 2005-09-26 16:04:21 +1000 235)                && (!user_mode(regs) || !store_updates_sp(regs)))
> 14cf11af6cf60 (Paul Mackerras 2005-09-26 16:04:21 +1000 236)                    goto bad_area;
> 
> So either they're both right or they're both wrong, either way I'm not
> sure how this patch is to blame.

Is there any progress on resolving this?

I did not notice any followup patch nor this one being merged/refuted.

Thanks

Michal

> 
> I guess we should also cc stable@...
> 
> Regards,
> Daniel
> 
> >> Reported-by: Tom Lane <tgl@sss.pgh.pa.us>
> >> Cc: Daniel Black <daniel@linux.ibm.com>
> >> Signed-off-by: Daniel Axtens <dja@axtens.net>
> >> ---
> >>  arch/powerpc/mm/fault.c | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >> 
> >> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> >> index b5047f9b5dec..00183731ea22 100644
> >> --- a/arch/powerpc/mm/fault.c
> >> +++ b/arch/powerpc/mm/fault.c
> >> @@ -287,7 +287,17 @@ static bool bad_stack_expansion(struct pt_regs *regs, unsigned long address,
> >>  			if (!res)
> >>  				return !store_updates_sp(inst);
> >>  			*must_retry = true;
> >> +		} else if ((flags & FAULT_FLAG_WRITE) &&
> >> +			   !(flags & FAULT_FLAG_USER)) {
> >> +			/*
> >> +			 * the kernel can also attempt to write beyond the end
> >> +			 * of a process's stack - for example setting up a
> >> +			 * signal frame. We assume this is valid, subject to
> >> +			 * the checks in expand_stack() later.
> >> +			 */
> >> +			return false;
> >>  		}
> >> +
> >>  		return true;
> >>  	}
> >>  	return false;
> >> -- 
> >> 2.20.1
> >> 
