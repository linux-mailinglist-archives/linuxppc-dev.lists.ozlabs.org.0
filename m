Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A24234032
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 09:38:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHzfh4wq7zDqbf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 17:38:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHzcT0Z4gzDqPf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 17:36:40 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06V7XFaA154943; Fri, 31 Jul 2020 03:36:26 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32mecy138u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 03:36:26 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06V7XxFc157001;
 Fri, 31 Jul 2020 03:36:26 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32mecy138d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 03:36:26 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06V7a2pI002176;
 Fri, 31 Jul 2020 07:36:24 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 32gcyd8ttm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 07:36:24 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06V7aOEc57672034
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jul 2020 07:36:24 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54970AE05F;
 Fri, 31 Jul 2020 07:36:24 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC9C5AE064;
 Fri, 31 Jul 2020 07:36:23 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.51.118])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 31 Jul 2020 07:36:23 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id C7B482E2FB9; Fri, 31 Jul 2020 13:06:18 +0530 (IST)
Date: Fri, 31 Jul 2020 13:06:18 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 09/10] Powerpc/smp: Create coregroup domain
Message-ID: <20200731073618.GA28399@in.ibm.com>
References: <20200727053230.19753-1-srikar@linux.vnet.ibm.com>
 <20200727053230.19753-10-srikar@linux.vnet.ibm.com>
 <jhjr1sviswg.mognet@arm.com>
 <20200729061355.GA14603@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729061355.GA14603@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_02:2020-07-31,
 2020-07-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007310054
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Oliver O'Halloran <oohall@gmail.com>, Jordan Niethe <jniethe5@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Srikar, Valentin,

On Wed, Jul 29, 2020 at 11:43:55AM +0530, Srikar Dronamraju wrote:
> * Valentin Schneider <valentin.schneider@arm.com> [2020-07-28 16:03:11]:
>

[..snip..]

> At this time the current topology would be good enough i.e BIGCORE would
> always be equal to a MC. However in future we could have chips that can have
> lesser/larger number of CPUs in llc than in a BIGCORE or we could have
> granular or split L3 caches within a DIE. In such a case BIGCORE != MC.
> 
> Also in the current P9 itself, two neighbouring core-pairs form a quad.
> Cache latency within a quad is better than a latency to a distant core-pair.
> Cache latency within a core pair is way better than latency within a quad.
> So if we have only 4 threads running on a DIE all of them accessing the same
> cache-lines, then we could probably benefit if all the tasks were to run
> within the quad aka MC/Coregroup.
> 
> I have found some benchmarks which are latency sensitive to benefit by
> having a grouping a quad level (using kernel hacks and not backed by
> firmware changes). Gautham also found similar results in his experiments
> but he only used binding within the stock kernel.
> 
> I am not setting SD_SHARE_PKG_RESOURCES in MC/Coregroup sd_flags as in MC
> domain need not be LLC domain for Power.

I am observing that SD_SHARE_PKG_RESOURCES at L2 provides the best
results for POWER9 in terms of cache-benefits during wakeup.  On a
POWER9 Boston machine, running a producer-consumer test case
(https://github.com/gautshen/misc/blob/master/producer_consumer/producer_consumer.c)

The test case creates two threads, one Producer and another
Consumer. Both work on a fairly large shared array of size 64M.  In an
interation the Producer performs stores to 1024 random locations and
wakes up the Consumer. In the Consumer's iteration, loads from those
exact 1024 locations.

We measure the number of Consumer iterations per second and the
average time for each Consumer iteration. The smaller the time, the
better it is.

The following results are when I pinned the Producer and Consumer to
different combinations of CPUs to cover Small core , Big-core,
Neighbouring Big-core, Far off core within the same chip, and across
chips. There is a also a case where they are not affined anywhere, and
we let the scheduler wake them up correctly.

We find the best results when the Producer and Consumer are within the
same L2 domain. These numbers are also close to the numbers that we
get when we let the Scheduler wake them up (where LLC is L2).

## Same Small core (4 threads: Shares L1, L2, L3, Frequency Domain)

Consumer affined to  CPU 3
Producer affined to  CPU 1
    4698 iterations, avg time: 20034 ns
    4951 iterations, avg time: 20012 ns
    4957 iterations, avg time: 19971 ns
    4968 iterations, avg time: 19985 ns
    4970 iterations, avg time: 19977 ns


## Same Big Core (8 threads: Shares L2, L3, Frequency Domain)

Consumer affined to  CPU 7
Producer affined to  CPU 1
    4580 iterations, avg time: 19403 ns
    4851 iterations, avg time: 19373 ns
    4849 iterations, avg time: 19394 ns
    4856 iterations, avg time: 19394 ns
    4867 iterations, avg time: 19353 ns

## Neighbouring Big-core (Faster data-snooping from L2. Shares L3, Frequency Domain)

Producer affined to  CPU 1
Consumer affined to  CPU 11
    4270 iterations, avg time: 24158 ns
    4491 iterations, avg time: 24157 ns
    4500 iterations, avg time: 24148 ns
    4516 iterations, avg time: 24164 ns
    4518 iterations, avg time: 24165 ns


## Any other Big-core from Same Chip (Shares L3)

Producer affined to  CPU 1
Consumer affined to  CPU 87
    4176 iterations, avg time: 27953 ns
    4417 iterations, avg time: 27925 ns
    4415 iterations, avg time: 27934 ns
    4417 iterations, avg time: 27983 ns
    4430 iterations, avg time: 27958 ns


## Different Chips (No cache-sharing)

Consumer affined to  CPU 175
Producer affined to  CPU 1
    3277 iterations, avg time: 50786 ns
    3063 iterations, avg time: 50732 ns
    2831 iterations, avg time: 50737 ns
    2859 iterations, avg time: 50688 ns
    2849 iterations, avg time: 50722 ns

## Without affining them (Let Scheduler wake-them up appropriately)
Consumer affined to  CPU 0-175
Producer affined to  CPU 0-175
    4821 iterations, avg time: 19412 ns
    4863 iterations, avg time: 19435 ns
    4855 iterations, avg time: 19381 ns
    4811 iterations, avg time: 19458 ns
    4892 iterations, avg time: 19429 ns


--
Thanks and Regards
gautham.
