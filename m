Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9734231979
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 08:22:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGk48523VzDqvV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 16:22:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGk216qbLzDqvV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 16:20:57 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06T62BJk021360; Wed, 29 Jul 2020 02:20:43 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jp1me30v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 02:20:42 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06T629Hs021130;
 Wed, 29 Jul 2020 02:20:42 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jp1me302-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 02:20:42 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06T69pK2007761;
 Wed, 29 Jul 2020 06:14:00 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 32gcpx4p8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 06:14:00 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06T6CXTA56754548
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jul 2020 06:12:33 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6FC4AE051;
 Wed, 29 Jul 2020 06:13:58 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EBF6AE04D;
 Wed, 29 Jul 2020 06:13:56 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 29 Jul 2020 06:13:56 +0000 (GMT)
Date: Wed, 29 Jul 2020 11:43:55 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH v4 09/10] Powerpc/smp: Create coregroup domain
Message-ID: <20200729061355.GA14603@linux.vnet.ibm.com>
References: <20200727053230.19753-1-srikar@linux.vnet.ibm.com>
 <20200727053230.19753-10-srikar@linux.vnet.ibm.com>
 <jhjr1sviswg.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <jhjr1sviswg.mognet@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-29_02:2020-07-28,
 2020-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007290038
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Oliver O'Halloran <oohall@gmail.com>,
 Jordan Niethe <jniethe5@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Valentin Schneider <valentin.schneider@arm.com> [2020-07-28 16:03:11]:

Hi Valentin,

Thanks for looking into the patches.

> On 27/07/20 06:32, Srikar Dronamraju wrote:
> > Add percpu coregroup maps and masks to create coregroup domain.
> > If a coregroup doesn't exist, the coregroup domain will be degenerated
> > in favour of SMT/CACHE domain.
> >
> 
> So there's at least one arm64 platform out there with the same "pairs of
> cores share L2" thing (Ampere eMAG), and that lives quite happily with the
> default scheduler topology (SMT/MC/DIE). Each pair of core gets its MC
> domain, and the whole system is covered by DIE.
> 
> Now arguably it's not a perfect representation; DIE doesn't have
> SD_SHARE_PKG_RESOURCES so the highest level sd_llc can point to is MC. That
> will impact all callsites using cpus_share_cache(): in the eMAG case, only
> pairs of cores will be seen as sharing cache, even though *all* cores share
> the same L3.
> 

Okay, Its good to know that we have a chip which is similar to P9 in
topology.

> I'm trying to paint a picture of what the P9 topology looks like (the one
> you showcase in your cover letter) to see if there are any similarities;
> from what I gather in [1], wikichips and your cover letter, with P9 you can
> have something like this in a single DIE (somewhat unsure about L3 setup;
> it looks to be distributed?)
> 
>      +---------------------------------------------------------------------+
>      |                                  L3                                 |
>      +---------------+-+---------------+-+---------------+-+---------------+
>      |       L2      | |       L2      | |       L2      | |       L2      |
>      +------+-+------+ +------+-+------+ +------+-+------+ +------+-+------+
>      |  L1  | |  L1  | |  L1  | |  L1  | |  L1  | |  L1  | |  L1  | |  L1  |
>      +------+ +------+ +------+ +------+ +------+ +------+ +------+ +------+
>      |4 CPUs| |4 CPUs| |4 CPUs| |4 CPUs| |4 CPUs| |4 CPUs| |4 CPUs| |4 CPUs|
>      +------+ +------+ +------+ +------+ +------+ +------+ +------+ +------+
> 
> Which would lead to (ignoring the whole SMT CPU numbering shenanigans)
> 
> NUMA     [                                                   ...
> DIE      [                                             ]
> MC       [         ] [         ] [         ] [         ]
> BIGCORE  [         ] [         ] [         ] [         ]
> SMT      [   ] [   ] [   ] [   ] [   ] [   ] [   ] [   ]
>          00-03 04-07 08-11 12-15 16-19 20-23 24-27 28-31  <other node here>
> 

What you have summed up is perfectly what a P9 topology looks like. I dont
think I could have explained it better than this.

> This however has MC == BIGCORE; what makes it you can have different spans
> for these two domains? If it's not too much to ask, I'd love to have a P9
> topology diagram.
> 
> [1]: 20200722081822.GG9290@linux.vnet.ibm.com

At this time the current topology would be good enough i.e BIGCORE would
always be equal to a MC. However in future we could have chips that can have
lesser/larger number of CPUs in llc than in a BIGCORE or we could have
granular or split L3 caches within a DIE. In such a case BIGCORE != MC.

Also in the current P9 itself, two neighbouring core-pairs form a quad.
Cache latency within a quad is better than a latency to a distant core-pair.
Cache latency within a core pair is way better than latency within a quad.
So if we have only 4 threads running on a DIE all of them accessing the same
cache-lines, then we could probably benefit if all the tasks were to run
within the quad aka MC/Coregroup.

I have found some benchmarks which are latency sensitive to benefit by
having a grouping a quad level (using kernel hacks and not backed by
firmware changes). Gautham also found similar results in his experiments
but he only used binding within the stock kernel.

I am not setting SD_SHARE_PKG_RESOURCES in MC/Coregroup sd_flags as in MC
domain need not be LLC domain for Power.

-- 
Thanks and Regards
Srikar Dronamraju
