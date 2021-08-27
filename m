Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B5C3FA01C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 21:46:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx9Fs482Yz3bjX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 05:46:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx9FS1rpcz2yYl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 05:46:19 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10089"; a="281735251"
X-IronPort-AV: E=Sophos;i="5.84,357,1620716400"; d="scan'208";a="281735251"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2021 12:45:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,357,1620716400"; d="scan'208";a="465548314"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga007.jf.intel.com with ESMTP; 27 Aug 2021 12:45:12 -0700
Date: Fri, 27 Aug 2021 12:45:03 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH v4 6/6] sched/fair: Consider SMT in ASYM_PACKING load
 balance
Message-ID: <20210827194503.GB14720@ranerica-svr.sc.intel.com>
References: <20210810144145.18776-1-ricardo.neri-calderon@linux.intel.com>
 <20210810144145.18776-7-ricardo.neri-calderon@linux.intel.com>
 <CAKfTPtArtmhLG5QYR6TzKevDrEuiQu2HJxm_C3pe549XdGU-1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtArtmhLG5QYR6TzKevDrEuiQu2HJxm_C3pe549XdGU-1g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Aubrey Li <aubrey.li@linux.intel.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Ricardo Neri <ricardo.neri@intel.com>, Ben Segall <bsegall@google.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Ingo Molnar <mingo@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Len Brown <len.brown@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Aubrey Li <aubrey.li@intel.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Tim Chen <tim.c.chen@linux.intel.com>, Quentin Perret <qperret@google.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 27, 2021 at 12:13:42PM +0200, Vincent Guittot wrote:
> On Tue, 10 Aug 2021 at 16:41, Ricardo Neri
> <ricardo.neri-calderon@linux.intel.com> wrote:
> > @@ -9540,6 +9629,12 @@ static struct rq *find_busiest_queue(struct lb_env *env,
> >                     nr_running == 1)
> >                         continue;
> >
> > +               /* Make sure we only pull tasks from a CPU of lower priority */
> > +               if ((env->sd->flags & SD_ASYM_PACKING) &&
> > +                   sched_asym_prefer(i, env->dst_cpu) &&
> > +                   nr_running == 1)
> > +                       continue;
> 
> This really looks similar to the test above for SD_ASYM_CPUCAPACITY.
> More generally speaking SD_ASYM_PACKING and SD_ASYM_CPUCAPACITY share
> a lot of common policy and I wonder if at some point we could not
> merge their behavior in LB

I would like to confirm with you that you are not expecting this merge
as part of this series, right?

Thanks and BR,
Ricardo
