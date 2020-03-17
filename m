Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75441187C01
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 10:28:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hSX561PQzDqZT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 20:28:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hSVb56C1zDqQX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 20:27:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48hSVZ5QCVz8tG8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 20:27:02 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48hSVZ5DNXz9sRY; Tue, 17 Mar 2020 20:27:02 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48hSVY6Yd6z9sRR
 for <linuxppc-dev@ozlabs.org>; Tue, 17 Mar 2020 20:27:00 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02H9LSaM045655
 for <linuxppc-dev@ozlabs.org>; Tue, 17 Mar 2020 05:26:57 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yrr6twrj5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 17 Mar 2020 05:26:56 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <bharata@linux.ibm.com>;
 Tue, 17 Mar 2020 09:26:33 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Mar 2020 09:26:29 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02H9QSvw58458344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Mar 2020 09:26:28 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95C2D5204E;
 Tue, 17 Mar 2020 09:26:28 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.32.136])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id B2FB252050;
 Tue, 17 Mar 2020 09:26:26 +0000 (GMT)
Date: Tue, 17 Mar 2020 14:56:24 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: linux-mm@kvack.org
Subject: Slub: Increased mem consumption on cpu,mem-less node powerpc guest
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-TM-AS-GCONF: 00
x-cbid: 20031709-0012-0000-0000-0000039273F3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031709-0013-0000-0000-000021CF5225
Message-Id: <20200317092624.GB22538@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-17_02:2020-03-12,
 2020-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
 phishscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=810 adultscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003170039
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
Reply-To: bharata@linux.ibm.com
Cc: Andrew Morton <akpm@linux-foundation.org>, aneesh.kumar@linux.ibm.com,
 Pekka Enberg <penberg@kernel.org>, linuxppc-dev@ozlabs.org,
 David Rientjes <rientjes@google.com>, Christoph Lameter <cl@linux.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

We are seeing an increased slab memory consumption on PowerPC guest
LPAR (on PowerVM) having an uncommon topology where one NUMA node has no
CPUs or any memory and the other node has all the CPUs and memory. Though
QEMU prevents such topologies for KVM guest, I hacked QEMU to allow such
topology to get some slab numbers. Here is the comparision of such
a KVM guest with a single node KVM guest with equal amount of CPUs and memory.

Case 1: 2 node NUMA, node0 empty
================================
# numactl -H
available: 2 nodes (0-1)
node 0 cpus:
node 0 size: 0 MB
node 0 free: 0 MB
node 1 cpus: 0 1 2 3 4 5 6 7
node 1 size: 16294 MB
node 1 free: 15453 MB
node distances:
node   0   1 
  0:  10  40 
  1:  40  10 

Case 2: Single node
===================
# numactl -H
available: 1 nodes (0)
node 0 cpus: 0 1 2 3 4 5 6 7
node 0 size: 16294 MB
node 0 free: 15675 MB
node distances:
node   0 
  0:  10 

Here is how the total slab memory consumptions compare right after boot:
# grep -i slab /proc/meminfo

Case 1: 442560 kB
Case 2: 195904 kB

Closer look at the individual slabs suggests that most of the increased
slab consumption in Case 1 can be attributed to kmalloc-N slabs. In
particular the following two caches account for most of the increase.

Case 1:
# ./slabinfo -S | grep -e kmalloc-1k -e kmalloc-512 
kmalloc-1k                2869    1024          101.5M    1549/1540/0   32 0  99   2 U
kmalloc-512               3302     512          100.2M    1530/1522/0   64 0  99   1 U

Case 2:
# ./slabinfo -S | grep -e kmalloc-1k -e kmalloc-512 
kmalloc-1k                2811    1024            6.1M        94/29/0   32 0  30  46 U
kmalloc-512               3207     512            3.5M        54/13/0   64 0  24  46 U

Here is the list of slub stats that significantly differ between two cases:

Case 1:
------
alloc_from_partial 6333 C0=1506 C1=525 C2=774 C3=478 C4=413 C5=1036 C6=698 C7=903
alloc_slab 3350 C0=757 C1=336 C2=120 C3=72 C4=120 C5=912 C6=600 C7=433
alloc_slowpath 9792 C0=2329 C1=861 C2=916 C3=571 C4=533 C5=1948 C6=1298 C7=1336
cmpxchg_double_fail 31 C1=3 C2=2 C3=7 C4=3 C5=4 C6=2 C7=10
deactivate_full 38 C0=14 C1=2 C2=13 C5=3 C6=2 C7=4
deactivate_remote_frees 1 C7=1
deactivate_to_head 10092 C0=2654 C1=859 C2=903 C3=571 C4=533 C5=1945 C6=1296 C7=1331
deactivate_to_tail 1 C7=1
free_add_partial 29 C0=7 C2=1 C3=5 C4=3 C5=6 C6=2 C7=5
free_frozen 32 C0=4 C1=3 C2=4 C3=3 C4=7 C5=3 C6=7 C7=1
free_remove_partial 1799 C0=408 C1=47 C2=54 C4=231 C5=752 C6=110 C7=197
free_slab 1799 C0=408 C1=47 C2=54 C4=231 C5=752 C6=110 C7=197
free_slowpath 7415 C0=2014 C1=486 C2=433 C3=525 C4=814 C5=1707 C6=586 C7=850
objects 2875 N1=2875
objects_partial 2587 N1=2587
partial 1542 N1=1542
slabs 1551 N1=1551
total_objects 49632 N1=49632

# cat alloc_calls (truncated)
   1952 alloc_fair_sched_group+0x114/0x240 age=147813/152837/153714 pid=1-1074 cpus=0-2,5-7 nodes=1

# cat free_calls (truncated) 
   2671 <not-available> age=4295094831 pid=0 cpus=0 nodes=1
      2 free_fair_sched_group+0xa0/0x120 age=156576/156850/157125 pid=0 cpus=0,5 nodes=1

Case 1:
------
alloc_from_partial 9231 C0=435 C1=2349 C2=2386 C3=1807 C4=882 C5=367 C6=559 C7=446
alloc_slab 114 C0=12 C1=41 C2=28 C3=15 C4=9 C5=1 C6=1 C7=7
alloc_slowpath 9415 C0=448 C1=2390 C2=2414 C3=1891 C4=891 C5=368 C6=560 C7=453
cmpxchg_double_fail 22 C0=1 C1=1 C3=3 C4=8 C5=1 C6=5 C7=3
deactivate_full 512 C0=13 C1=143 C2=147 C3=147 C4=22 C5=10 C6=6 C7=24
deactivate_remote_frees 1 C4=1
deactivate_to_head 9099 C0=437 C1=2247 C2=2267 C3=1937 C4=870 C5=358 C6=554 C7=429
deactivate_to_tail 1 C4=1
free_add_partial 447 C0=21 C1=140 C2=164 C3=60 C4=22 C5=16 C6=14 C7=10
free_frozen 22 C0=3 C2=3 C3=2 C4=1 C5=6 C6=6 C7=1
free_remove_partial 20 C1=5 C2=5 C4=3 C6=7
free_slab 20 C1=5 C2=5 C4=3 C6=7
free_slowpath 6953 C0=194 C1=2123 C2=1729 C3=850 C4=466 C5=725 C6=520 C7=346
objects 2812 N0=2812
objects_partial 733 N0=733
partial 29 N0=29
slabs 94 N0=94
total_objects 3008 N0=3008

# cat alloc_calls (truncated)
   1952 alloc_fair_sched_group+0x114/0x240 age=43957/46225/46802 pid=1-1059 cpus=1-5,7

# cat free_calls (truncated) 
   1516 <not-available> age=4294987281 pid=0 cpus=0
    647 free_fair_sched_group+0xa0/0x120 age=48798/49142/49628 pid=0-954 cpus=1-2

We see a significant difference in the number of partial slabs and
the resulting total_objects between the two cases. I was trying to
see if this has got to do anything with the way the node value is
arrived at in difference slub routines. Haven't yet understood slub
code to say anything conclusively, but the following hack in the slub
code completely reduces the increased slab consumption for Case1 and
makes it very similar to Case2

diff --git a/mm/slub.c b/mm/slub.c
index 17dc00e33115..888e4d245444 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1971,10 +1971,8 @@ static void *get_partial(struct kmem_cache *s, gfp_t flags, int node,
 	void *object;
 	int searchnode = node;
 
-	if (node == NUMA_NO_NODE)
+	if (node == NUMA_NO_NODE || !node_present_pages(node))
 		searchnode = numa_mem_id();
-	else if (!node_present_pages(node))
-		searchnode = node_to_mem_node(node);
 
 	object = get_partial_node(s, get_node(s, searchnode), c, flags);
 	if (object || node != NUMA_NO_NODE)

Regards,
Bharata.

