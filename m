Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7011CAE74
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 15:11:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JW113pyXzDqLR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 23:11:01 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JVrc1VkYzDr4h
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 23:03:43 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 048D3L47119211; Fri, 8 May 2020 09:03:29 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30vtt3v0q2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 May 2020 09:03:26 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 048D04Lm007962;
 Fri, 8 May 2020 13:03:09 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 30s0g5dgcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 May 2020 13:03:09 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 048D37uh65470550
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 May 2020 13:03:07 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1775B5204F;
 Fri,  8 May 2020 13:03:07 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 10B7852051;
 Fri,  8 May 2020 13:03:04 +0000 (GMT)
Date: Fri, 8 May 2020 18:33:04 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v2 3/3] mm/page_alloc: Keep memoryless cpuless node 0
 offline
Message-ID: <20200508130304.GA1961@linux.vnet.ibm.com>
References: <20200428093836.27190-1-srikar@linux.vnet.ibm.com>
 <20200428093836.27190-4-srikar@linux.vnet.ibm.com>
 <20200428165912.ca1eadefbac56d740e6e8fd1@linux-foundation.org>
 <20200429014145.GD19958@linux.vnet.ibm.com>
 <20200429122211.GD28637@dhcp22.suse.cz>
 <20200430071820.GF19958@linux.vnet.ibm.com>
 <20200504093712.GL22838@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200504093712.GL22838@dhcp22.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-08_12:2020-05-07,
 2020-05-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=2 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005080116
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

* Michal Hocko <mhocko@kernel.org> [2020-05-04 11:37:12]:

> > > 
> > > Have you tested on something else than ppc? Each arch does the NUMA
> > > setup separately and this is a big mess. E.g. x86 marks even memory less
> > > nodes (see init_memory_less_node) as online.
> > > 
> > 
> > while I have predominantly tested on ppc, I did test on X86 with CONFIG_NUMA
> > enabled/disabled on both single node and multi node machines.
> > However, I dont have a cpuless/memoryless x86 system.
> 
> This should be able to emulate inside kvm, I believe.
> 

I did try but somehow not able to get cpuless / memoryless node in a x86 kvm
guest.

Also I am unable to see how to enable HAVE_MEMORYLESS_NODES on x86 system.
# git grep -w HAVE_MEMORYLESS_NODES | cat
arch/ia64/Kconfig:config HAVE_MEMORYLESS_NODES
arch/powerpc/Kconfig:config HAVE_MEMORYLESS_NODES
#
I forced enabled but it got disabled while kernel build.
May be I am missing something.

> > 
> > So we have a redundant page hinting numa faults which we can avoid.
> 
> interesting. Does this lead to any observable differences? Btw. it would
> be really great to describe how the online state influences the numa
> balancing.
> 

If numa_balancing is enabled, it has a check to see if the number of online
nodes is 1. If its one, it disables numa_balancing, else the numa_balancing
stays as is. In this case, the actual node (node nr > 0) and
node 0 were marked online without the patch.

Here are 2 sample numa programs.

numa01.sh is a set of 2 process each running threads as many as number of cpus;
each thread doing 50 loops on 3GB process shared memory operations.

numa02.sh is a single process with threads as many as number of cpus;
each thread doing 800 loops on 32MB thread local memory operations.

Testcase         Time:  Min      Max      Avg      StdDev
./numa01.sh      Real:  149.62   149.66   149.64   0.02
./numa01.sh      Sys:   3.21     3.71     3.46     0.25
./numa01.sh      User:  4755.13  4758.15  4756.64  1.51
./numa02.sh      Real:  24.98    25.02    25.00    0.02
./numa02.sh      Sys:   0.51     0.59     0.55     0.04
./numa02.sh      User:  790.28   790.88   790.58   0.30

Testcase         Time:  Min      Max      Avg      StdDev  %Change
./numa01.sh      Real:  149.44   149.46   149.45   0.01    0.127133%
./numa01.sh      Sys:   0.71     0.89     0.80     0.09    332.5%
./numa01.sh      User:  4754.19  4754.48  4754.33  0.15    0.0485873%
./numa02.sh      Real:  24.97    24.98    24.98    0.00    0.0800641%
./numa02.sh      Sys:   0.26     0.41     0.33     0.08    66.6667%
./numa02.sh      User:  789.75   790.28   790.01   0.27    0.072151%

numa01.sh
param                   no_patch    with_patch  %Change
-----                   ----------  ----------  -------
numa_hint_faults        1131164     0           -100%
numa_hint_faults_local  1131164     0           -100%
numa_hit                213696      214244      0.256439%
numa_local              213696      214244      0.256439%
numa_pte_updates        1131294     0           -100%
pgfault                 1380845     241424      -82.5162%
pgmajfault              75          60          -20%

numa02.sh
param                   no_patch    with_patch  %Change
-----                   ----------  ----------  -------
numa_hint_faults        111878      0           -100%
numa_hint_faults_local  111878      0           -100%
numa_hit                41854       43220       3.26373%
numa_local              41854       43220       3.26373%
numa_pte_updates        113926      0           -100%
pgfault                 163662      51210       -68.7099%
pgmajfault              56          52          -7.14286%

Observations:
The real time and user time actually doesn't change much. However the system
time changes to some extent. The reason being the number of numa hinting
faults. With the patch we are not seeing the numa hinting faults.

> > 2. Few people have complained about existence of this dummy node when
> > parsing lscpu and numactl o/p. They somehow start to think that the tools
> > are reporting incorrectly or the kernel is not able to recognize resources
> > connected to the node.
> 
> Please be more specific.

Taking the below example of numactl
available: 2 nodes (0,7)
node 0 cpus:
node 0 size: 0 MB
node 0 free: 0 MB
node 7 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
node 7 size: 16238 MB
node 7 free: 15449 MB
node distances:
node   0   7 
  0:  10  20 
  7:  20  10 

We know node 0 can be special, but users may not feel the same.

When users parse numactl/lscpu or /sys directory; they find there are 2
online nodes. They find none of the resources for a node(node 0) are
available but still online. However they find other nodes (nodes 1-6) with
don't have resources but not online. So they tend to think the kernel has
been unable to online some of the resources or the resources have gone bad.
Please do note that on hypervisors like PowerVM, the admins don't have
control over which nodes the resources are allocated.

-- 
Thanks and Regards
Srikar Dronamraju
