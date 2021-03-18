Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F74340EC3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 21:03:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1dHb2hZ8z3c1K
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 07:03:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=stgolabs.net (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=dave@stgolabs.net; receiver=<UNKNOWN>)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1dHF0cG2z3bnX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 07:02:46 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1FE62ACA8;
 Thu, 18 Mar 2021 20:02:43 +0000 (UTC)
Date: Thu, 18 Mar 2021 13:02:33 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 3/3] powerpc/qspinlock: Use generic smp_cond_load_relaxed
Message-ID: <20210318200233.zov3wbugbgbj4f73@offworld>
References: <20210309015950.27688-1-dave@stgolabs.net>
 <20210309015950.27688-4-dave@stgolabs.net>
 <1615870473.h7h4jetmjb.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1615870473.h7h4jetmjb.astroid@bobo.none>
User-Agent: NeoMutt/20201120
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
Cc: will@kernel.org, Davidlohr Bueso <dbueso@suse.de>, peterz@infradead.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, paulus@samba.org,
 longman@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 16 Mar 2021, Nicholas Piggin wrote:

>One request, could you add a comment in place that references
>smp_cond_load_relaxed() so this commit can be found again if
>someone looks at it? Something like this
>
>/*
> * smp_cond_load_relaxed was found to have performance problems if
> * implemented with spin_begin()/spin_end().
> */

Sure, let me see where I can fit that in and send out a v2.

Similarly, but unrelated to this patch, is there any chance we could
remove the whole spin_until_cond() machinery and make it specific to
powerpc? This was introduced in 2017 and doesn't really have any users
outside of powerpc, except for these:

drivers/firmware/arm_scmi/driver.c:             spin_until_cond(scmi_xfer_done_no_timeout(cinfo, xfer, stop));
drivers/firmware/arm_scmi/shmem.c:      spin_until_cond(ioread32(&shmem->channel_status) &
drivers/net/ethernet/xilinx/ll_temac_main.c:    spin_until_cond(hard_acs_rdy_or_timeout(lp, timeout));

... which afaict only the xilinx one can actually build on powerpc.
Regardless, these could be converted to smp_cond_load_relaxed(), being
the more standard way to do optimized busy-waiting, caring more about
the family of barriers than ad-hoc SMT priorities. Of course, I have
no way of testing any of these changes.

>I wonder if it should have a Fixes: tag to the original commit as
>well.

I'm not sure either. I've actually been informed recently of other
workloads that benefit from the revert on large Power9 boxes. So I'll
go ahead and add it.

>
>Otherwise,
>
>Acked-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Davidlohr
