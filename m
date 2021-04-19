Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 644DD363B54
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 08:15:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNxPk24qXz3btT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 16:15:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o9pKviH8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=o9pKviH8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNxPB2F6zz30Cw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 16:14:53 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13J62fQp106653; Mon, 19 Apr 2021 02:14:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=xkMdzWE54EfwUtKVXS/TXmVllMjccCELL3fNxFxcf8g=;
 b=o9pKviH808TkXJ17qpHlug/vxLpp2Fbw7172mJhdK0lED0TUNF5O2JEv+uqhXIVQhas1
 mEWLBr2rkHpO+PXVyNz+23oOzKWO3t2PXlE5iK2R162T+3lB1TfQHR/MvxzvFV8EuEfr
 Fs2e86Jp7UCzmoYFnRFtu3+YDW3OxnE9xkHqAF3/ePaozZ/gg+/0tw5drOxdZL3Owqy/
 fOetAYh9DOutNk0q3NacYWDbGFs0s2kR9gwU/lWu38kricER4lqGNPwj+jZEZlFQdMlN
 C1kNdAej/Ug5Q0kwDDJjCsh97kMVHi0kOsQB0edMikEEShZiH7B4cMBbWZpdf46D+IOj KQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 380cnxwvvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 02:14:42 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13J637WF108408;
 Mon, 19 Apr 2021 02:14:42 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 380cnxwvvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 02:14:41 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13J692q4009923;
 Mon, 19 Apr 2021 06:14:40 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 37yqa8fswf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 06:14:40 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13J6EdAt37421406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Apr 2021 06:14:39 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B02B76E04C;
 Mon, 19 Apr 2021 06:14:39 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AE3C6E050;
 Mon, 19 Apr 2021 06:14:38 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.77.203.69])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 19 Apr 2021 06:14:38 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 01BF12E2EAB; Mon, 19 Apr 2021 11:44:28 +0530 (IST)
Date: Mon, 19 Apr 2021 11:44:28 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Mel Gorman <mgorman@techsingularity.net>
Subject: Re: [RFC/PATCH] powerpc/smp: Add SD_SHARE_PKG_RESOURCES flag to MC
 sched-domain
Message-ID: <20210419061428.GA24456@in.ibm.com>
References: <1617341874-1205-1-git-send-email-ego@linux.vnet.ibm.com>
 <20210412062436.GB2633526@linux.vnet.ibm.com>
 <20210412093722.GS3697@techsingularity.net>
 <871rbfom04.mognet@arm.com>
 <20210412104819.GT3697@techsingularity.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412104819.GT3697@techsingularity.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AlW94Q4h-J0CO_TPTLG9dqDlm62lEXVJ
X-Proofpoint-ORIG-GUID: Z5iYiWVV2IYnHQw6B5pz0_4JEqpBuppn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-19_02:2021-04-16,
 2021-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 mlxlogscore=726 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104190041
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
Reply-To: ego@linux.vnet.ibm.com
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Rik van Riel <riel@surriel.com>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Parth Shah <parth@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Mel,

On Mon, Apr 12, 2021 at 11:48:19AM +0100, Mel Gorman wrote:
> On Mon, Apr 12, 2021 at 11:06:19AM +0100, Valentin Schneider wrote:
> > On 12/04/21 10:37, Mel Gorman wrote:
> > > On Mon, Apr 12, 2021 at 11:54:36AM +0530, Srikar Dronamraju wrote:
> > >> * Gautham R. Shenoy <ego@linux.vnet.ibm.com> [2021-04-02 11:07:54]:
> > >>
> > >> >
> > >> > To remedy this, this patch proposes that the LLC be moved to the MC
> > >> > level which is a group of cores in one half of the chip.
> > >> >
> > >> >       SMT (SMT4) --> MC (Hemisphere)[LLC] --> DIE
> > >> >
> > >>
> > >> I think marking Hemisphere as a LLC in a P10 scenario is a good idea.
> > >>
> > >> > While there is no cache being shared at this level, this is still the
> > >> > level where some amount of cache-snooping takes place and it is
> > >> > relatively faster to access the data from the caches of the cores
> > >> > within this domain. With this change, we no longer see regressions on
> > >> > P10 for applications which require single threaded performance.
> > >>
> > >> Peter, Valentin, Vincent, Mel, etal
> > >>
> > >> On architectures where we have multiple levels of cache access latencies
> > >> within a DIE, (For example: one within the current LLC or SMT core and the
> > >> other at MC or Hemisphere, and finally across hemispheres), do you have any
> > >> suggestions on how we could handle the same in the core scheduler?
> > >>
> > >
> > > Minimally I think it would be worth detecting when there are multiple
> > > LLCs per node and detecting that in generic code as a static branch. In
> > > select_idle_cpu, consider taking two passes -- first on the LLC domain
> > > and if no idle CPU is found then taking a second pass if the search depth
> > > allows within the node with the LLC CPUs masked out.
> > 
> > I think that's actually a decent approach. Tying SD_SHARE_PKG_RESOURCES to
> > something other than pure cache topology in a generic manner is tough (as
> > it relies on murky, ill-defined hardware fabric properties).
> > 
> 
> Agreed. The LLC->node scan idea has been on my TODO list to try for
> a while.

If you have any patches for these, I will be happy to test them on
POWER10. Though, on POWER10, there will be an additional sd between
the LLC and the DIE domain. 




> 
> > Last I tried thinking about that, I stopped at having a core-to-core
> > latency matrix, building domains off of that, and having some knob
> > specifying the highest distance value below which we'd set
> > SD_SHARE_PKG_RESOURCES. There's a few things I 'hate' about that; for one
> > it makes cpus_share_cache() somewhat questionable.
> > 
> 
> And I thought about something like this too but worried it might get
> complex, particularly on chiplets where we do not necessarily have
> hardware info on latency depending on how it's wired up. It also might
> lead to excessive cpumask manipulation in a fast path if we have to
> traverse multiple distances with search cost exceeding gains from latency
> reduction. Hence -- keeping it simple with two level only, LLC then node
> within the allowed search depth and see what that gets us. It might be
> "good enough" in most cases and would be a basis for comparison against
> complex approaches.


> 
> At minimum, I expect IBM can evaluate the POWER10 aspect and I can run
> an evaluation on Zen generations.


> 
> -- 
> Mel Gorman
> SUSE Labs
