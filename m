Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DED9F245C38
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 08:07:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVNqp75TbzDqLC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 16:07:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WdTCvXh9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVNdQ6VMTzDqRS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 15:58:34 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07H5XEfQ021062; Mon, 17 Aug 2020 01:58:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=0JyaojSeidFgW91+4LumV4mANqPiYUwOp/oCjQ1e5X4=;
 b=WdTCvXh9NVztTa7dfcoSd/Kfxy3mc/qrSvyoBpq3bqqt8811uYaQwb62HvI85/9IUq6f
 jk62G6mozd1biZds3cVmhMfBxspfFwlovXwwftmcvq1iS7gVB0vi8OiCLKcL6rjB0lpw
 OAT1Z0NP3epeb4zFg0AUWCFes1SUqxhzUev2Nj8PvGTtOykt6kic5vZOXdGmCWbM+wfa
 NhokrOFb+NmZyMxT6h46g8RW7eJdDIBdvkbv6UT/1KVFWkKxevpE2LKP3DRWeUcYj4EA
 rvEqGlVNF21ZCDUF/3pdmvTJFMhjDDSDXokaHyOy6VNzn36ROpfO1DSBs/xmrxgSggu2 tg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32y3ss21m4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 01:58:28 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07H5pnE6032707;
 Mon, 17 Aug 2020 05:53:09 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 32x6ygsv7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 05:53:09 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07H5r7S427918766
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Aug 2020 05:53:07 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E29B911C066;
 Mon, 17 Aug 2020 05:53:06 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B8B711C05E;
 Mon, 17 Aug 2020 05:53:04 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.85.121.222])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Aug 2020 05:53:03 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3] powerpc/numa: Restrict possible nodes based on platform
Date: Mon, 17 Aug 2020 11:22:57 +0530
Message-Id: <20200817055257.110873-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-17_01:2020-08-17,
 2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008170040
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

As per draft LoPAPR (Revision 2.9_pre7), section B.5.3 "Run Time Abstaction
Services (RTAS) Node at
https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200611.pdf,
there are 2 device tree property ibm,max-associativity-domains (which
defines the maximum number of domains that the firmware i.e PowerVM can
support) and ibm,current-associativity-domains (which defines the maximum
number of domains that the platform can support). Value of
ibm,max-associativity-domains property is always greater than or equal to
ibm,current-associativity-domains property. If the said property is not
available, use ibm,max-associativity-domain as fallback. In this yet to be
released LoPAPR, ibm,current-associativity-domains is mentioned in page 833
/ B.5.3 which is covered under under "Appendix B. System Binding" section

Currently Powerpc uses ibm,max-associativity-domains property while
setting the possible number of nodes. This is currently set at 32.
However the possible number of nodes for a platform may be significantly
less. Hence set the possible number of nodes based on
ibm,current-associativity-domains property.

Nathan Lynch had raised a valid concern that post LPM, a user could DLPAR
add processors and memory after LPM with "new" associativity properties.
https://lore.kernel.org/linuxppc-dev/871rljfet9.fsf@linux.ibm.com/t/#u

He also pointed out that ibm,max-associativity-domains has the same contents
on all currently available PowerVM systems, unlike
ibm,current-associativity-domains and hence may be better able to handle the
new numa associativity properties.

However with the recent commit dbce45628085 ("powerpc/numa: Limit possible
nodes to within num_possible_nodes"), all new numa  associativity properties
are capped to initially set nr_node_ids. Hence this commit should be safe
with any new dlpar add post LPM.

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
Changelog v2->v3:
v2: https://lore.kernel.org/linuxppc-dev/20200707140644.7241-1-srikar@linux.vnet.ibm.com/t/#u
Updated commit msg to mention LoPAPR reference section  and url details
					(Michael Ellerman)
Updated commit msg to discuss about possible new numa associativity properties.
					(Nathan Lynch)

Changelog v1->v2:
v1: https://lore.kernel.org/linuxppc-dev/20200706064002.14848-1-srikar@linux.vnet.ibm.com/t/#u
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

