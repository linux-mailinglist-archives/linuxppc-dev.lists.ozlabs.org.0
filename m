Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 919D4216E65
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 16:10:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1PV62LVmzDqcF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 00:10:38 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1PQ046kqzDqFZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 00:07:04 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 067E3BN5085475; Tue, 7 Jul 2020 10:06:58 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 324hfr0hmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 10:06:55 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 067E4pJw019886;
 Tue, 7 Jul 2020 14:06:53 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 322hd81sb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 14:06:53 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 067E6ofj42532984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Jul 2020 14:06:50 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DDCA52057;
 Tue,  7 Jul 2020 14:06:50 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.102.0.236])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id DBC3652054;
 Tue,  7 Jul 2020 14:06:48 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2] powerpc/numa: Restrict possible nodes based on platform
Date: Tue,  7 Jul 2020 19:36:44 +0530
Message-Id: <20200707140644.7241-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-07_08:2020-07-07,
 2020-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 clxscore=1015 cotscore=-2147483648 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007070105
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Bharata B Rao <bharata@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As per PAPR, there are 2 device tree property
ibm,max-associativity-domains (which defines the maximum number of
domains that the firmware i.e PowerVM can support) and
ibm,current-associativity-domains (which defines the maximum number of
domains that the platform can support). Value of
ibm,max-associativity-domains property is always greater than or equal
to ibm,current-associativity-domains property.

Powerpc currently uses ibm,max-associativity-domains  property while
setting the possible number of nodes. This is currently set at 32.
However the possible number of nodes for a platform may be significantly
less. Hence set the possible number of nodes based on
ibm,current-associativity-domains property.

$ lsprop /proc/device-tree/rtas/ibm,*associ*-domains
/proc/device-tree/rtas/ibm,current-associativity-domains
		 00000005 00000001 00000002 00000002 00000002 00000010
/proc/device-tree/rtas/ibm,max-associativity-domains
		 00000005 00000001 00000008 00000020 00000020 00000100

$ cat /sys/devices/system/node/possible ##Before patch
0-31

$ cat /sys/devices/system/node/possible ##After patch
0-1

Note the maximum nodes this platform can support is only 2 but the
possible nodes is set to 32.

This is important because lot of kernel and user space code allocate
structures for all possible nodes leading to a lot of memory that is
allocated but not used.

I ran a simple experiment to create and destroy 100 memory cgroups on
boot on a 8 node machine (Power8 Alpine).

Before patch
free -k at boot
              total        used        free      shared  buff/cache   available
Mem:      523498176     4106816   518820608       22272      570752   516606720
Swap:       4194240           0     4194240

free -k after creating 100 memory cgroups
              total        used        free      shared  buff/cache   available
Mem:      523498176     4628416   518246464       22336      623296   516058688
Swap:       4194240           0     4194240

free -k after destroying 100 memory cgroups
              total        used        free      shared  buff/cache   available
Mem:      523498176     4697408   518173760       22400      627008   515987904
Swap:       4194240           0     4194240

After patch
free -k at boot
              total        used        free      shared  buff/cache   available
Mem:      523498176     3969472   518933888       22272      594816   516731776
Swap:       4194240           0     4194240

free -k after creating 100 memory cgroups
              total        used        free      shared  buff/cache   available
Mem:      523498176     4181888   518676096       22208      640192   516496448
Swap:       4194240           0     4194240

free -k after destroying 100 memory cgroups
              total        used        free      shared  buff/cache   available
Mem:      523498176     4232320   518619904       22272      645952   516443264
Swap:       4194240           0     4194240

Observations:
Fixed kernel takes 137344 kb (4106816-3969472) less to boot.
Fixed kernel takes 309184 kb (4628416-4181888-137344) less to create 100 memcgs.

Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Anton Blanchard <anton@ozlabs.org>
Cc: Bharata B Rao <bharata@linux.ibm.com>
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
v1: https://lore.kernel.org/linuxppc-dev/20200706064002.14848-1-srikar@linux.vnet.ibm.com/t/#u
Changelog v1->v2:
Fallback to ibm,max-associativity-domains if ibm,current-associativity
is not available. Suggested by Tyrel Datwyler.

 arch/powerpc/mm/numa.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 9fcf2d195830..fc7b0505bdd8 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -896,10 +896,19 @@ static void __init find_possible_nodes(void)
 	if (!rtas)
 		return;
 
-	if (of_property_read_u32_index(rtas,
-				"ibm,max-associativity-domains",
+	if (of_property_read_u32_index(rtas, "ibm,current-associativity-domains",
+				min_common_depth, &numnodes)) {
+		/*
+		 * ibm,current-associativity-domains is a fairly recent
+		 * property. If it doesn't exist, then fallback on
+		 * ibm,max-associativity-domains. Current denotes what the
+		 * platform can support compared to max which denotes what the
+		 * Hypervisor can support.
+		 */
+		if (of_property_read_u32_index(rtas, "ibm,max-associativity-domains",
 				min_common_depth, &numnodes))
-		goto out;
+			goto out;
+	}
 
 	for (i = 0; i < numnodes; i++) {
 		if (!node_possible(i))
-- 
2.18.2

