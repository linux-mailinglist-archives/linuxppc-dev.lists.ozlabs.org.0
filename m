Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5B01BF13D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 09:21:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CRcz2Hv5zDrKW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 17:21:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CRZ73551zDrCm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 17:18:39 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03U721bb087920; Thu, 30 Apr 2020 03:18:28 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30me474bvn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 03:18:28 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03U7AIWg001869;
 Thu, 30 Apr 2020 07:18:26 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 30mcu5af33-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 07:18:25 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03U7IN5349086470
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Apr 2020 07:18:23 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F9CB52051;
 Thu, 30 Apr 2020 07:18:23 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 8974252050;
 Thu, 30 Apr 2020 07:18:21 +0000 (GMT)
Date: Thu, 30 Apr 2020 12:48:20 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v2 3/3] mm/page_alloc: Keep memoryless cpuless node 0
 offline
Message-ID: <20200430071820.GF19958@linux.vnet.ibm.com>
References: <20200428093836.27190-1-srikar@linux.vnet.ibm.com>
 <20200428093836.27190-4-srikar@linux.vnet.ibm.com>
 <20200428165912.ca1eadefbac56d740e6e8fd1@linux-foundation.org>
 <20200429014145.GD19958@linux.vnet.ibm.com>
 <20200429122211.GD28637@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200429122211.GD28637@dhcp22.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_01:2020-04-30,
 2020-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004300052
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, Mel Gorman <mgorman@suse.de>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michal Hocko <mhocko@kernel.org> [2020-04-29 14:22:11]:

> On Wed 29-04-20 07:11:45, Srikar Dronamraju wrote:
> > > > 
> > > > By marking, N_ONLINE as NODE_MASK_NONE, lets stop assuming that Node 0 is
> > > > always online.
> > > > 
> > > > ...
> > > >
> > > > --- a/mm/page_alloc.c
> > > > +++ b/mm/page_alloc.c
> > > > @@ -116,8 +116,10 @@ EXPORT_SYMBOL(latent_entropy);
> > > >   */
> > > >  nodemask_t node_states[NR_NODE_STATES] __read_mostly = {
> > > >  	[N_POSSIBLE] = NODE_MASK_ALL,
> > > > +#ifdef CONFIG_NUMA
> > > > +	[N_ONLINE] = NODE_MASK_NONE,
> > > > +#else
> > > >  	[N_ONLINE] = { { [0] = 1UL } },
> > > > -#ifndef CONFIG_NUMA
> > > >  	[N_NORMAL_MEMORY] = { { [0] = 1UL } },
> > > >  #ifdef CONFIG_HIGHMEM
> > > >  	[N_HIGH_MEMORY] = { { [0] = 1UL } },
> > > 
> > > So on all other NUMA machines, when does node 0 get marked online?
> > > 
> > > This change means that for some time during boot, such machines will
> > > now be running with node 0 marked as offline.  What are the
> > > implications of this?  Will something break?
> > 
> > Till the nodes are detected, marking Node 0 as online tends to be redundant.
> > Because the system doesn't know if its a NUMA or a non-NUMA system.
> > Once we detect the nodes, we online them immediately. Hence I don't see any
> > side-effects or negative implications of this change.
> > 
> > However if I am missing anything, please do let me know.
> > 
> > >From my part, I have tested this on
> > 1. Non-NUMA Single node but CPUs and memory coming from zero node.
> > 2. Non-NUMA Single node but CPUs and memory coming from non-zero node.
> > 3. NUMA Multi node but with CPUs and memory from node 0.
> > 4. NUMA Multi node but with no CPUs and memory from node 0.
> 
> Have you tested on something else than ppc? Each arch does the NUMA
> setup separately and this is a big mess. E.g. x86 marks even memory less
> nodes (see init_memory_less_node) as online.
> 

while I have predominantly tested on ppc, I did test on X86 with CONFIG_NUMA
enabled/disabled on both single node and multi node machines.
However, I dont have a cpuless/memoryless x86 system.

> Honestly I have hard time to evaluate the effect of this patch. It makes
> some sense to assume all nodes offline before they get online but this
> is a land mine territory.
> 
> I am also not sure what kind of problem this is going to address. You
> have mentioned numa balancing without many details.

1. On a machine with just one node with node number not being 0,
the current setup will end up showing 2 online nodes. And when there are
more than one online nodes, numa_balancing gets enabled.

Without patch
$ grep numa /proc/vmstat
numa_hit 95179
numa_miss 0
numa_foreign 0
numa_interleave 3764
numa_local 95179
numa_other 0
numa_pte_updates 1206973                 <----------
numa_huge_pte_updates 4654                 <----------
numa_hint_faults 19560                 <----------
numa_hint_faults_local 19560                 <----------
numa_pages_migrated 0


With patch
$ grep numa /proc/vmstat 
numa_hit 322338756
numa_miss 0
numa_foreign 0
numa_interleave 3790
numa_local 322338756
numa_other 0
numa_pte_updates 0                 <----------
numa_huge_pte_updates 0                 <----------
numa_hint_faults 0                 <----------
numa_hint_faults_local 0                 <----------
numa_pages_migrated 0

So we have a redundant page hinting numa faults which we can avoid.

2. Few people have complained about existence of this dummy node when
parsing lscpu and numactl o/p. They somehow start to think that the tools
are reporting incorrectly or the kernel is not able to recognize resources
connected to the node.

-- 
Thanks and Regards
Srikar Dronamraju
