Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF532152C2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 08:41:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0bZf1DyvzDqjl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 16:41:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0bXz61t1zDqbc
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 16:40:19 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0666VOxM102852; Mon, 6 Jul 2020 02:40:13 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 322nxwysb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 02:40:13 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0666FGa5015484;
 Mon, 6 Jul 2020 06:40:11 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 322hd7s05j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 06:40:11 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0666e87K55246962
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jul 2020 06:40:08 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE38C4C046;
 Mon,  6 Jul 2020 06:40:07 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 552074C04A;
 Mon,  6 Jul 2020 06:40:06 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.102.3.252])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jul 2020 06:40:06 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/numa: Restrict possible nodes based on platform
Date: Mon,  6 Jul 2020 12:10:02 +0530
Message-Id: <20200706064002.14848-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-06_03:2020-07-06,
 2020-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 suspectscore=2
 clxscore=1011 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007060049
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Bharata B Rao <bharata@linux.ibm.com>
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
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/mm/numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 9fcf2d195830..3d55cef1a2dc 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -897,7 +897,7 @@ static void __init find_possible_nodes(void)
 		return;
 
 	if (of_property_read_u32_index(rtas,
-				"ibm,max-associativity-domains",
+				"ibm,current-associativity-domains",
 				min_common_depth, &numnodes))
 		goto out;
 
-- 
2.18.2

