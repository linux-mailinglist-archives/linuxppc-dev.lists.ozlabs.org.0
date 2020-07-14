Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B83CE21E74F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 07:08:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5T6t25ZfzDqNQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 15:08:06 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5T4s5c3MzDqTZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 15:06:21 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06E53EDj039431; Tue, 14 Jul 2020 01:06:15 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3278qt4dtg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 01:06:15 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06E56DSf001169;
 Tue, 14 Jul 2020 05:06:13 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 327527hg1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 05:06:13 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06E568Mh31260742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jul 2020 05:06:08 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DF4D52054;
 Tue, 14 Jul 2020 05:06:08 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id AB27D52051;
 Tue, 14 Jul 2020 05:06:06 +0000 (GMT)
Date: Tue, 14 Jul 2020 10:36:06 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 00/11] Support for grouping cores
Message-ID: <20200714050606.GA26776@linux.vnet.ibm.com>
References: <20200714043624.5648-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200714043624.5648-1-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-13_17:2020-07-13,
 2020-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007140034
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
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Oliver OHalloran <oliveroh@au1.ibm.com>, Michael Neuling <mikey@linux.ibm.com>,
 Michael Ellerman <michaele@au1.ibm.com>, Anton Blanchard <anton@au1.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nick Piggin <npiggin@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Srikar Dronamraju <srikar@linux.vnet.ibm.com> [2020-07-14 10:06:13]:

> 
> On Power 9 (with device-tree enablement to show coregroups).
> -----------------------------------------------------------

With help of Gautham, I tried to kexec into a newer kernel with a modified
dtb. However when passing with the dtb option, kexec would get stuck.

Hence alternatively, I hardcoded some assumptions to test the same.
These hunks apply on top of all the patches.

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 8ec7ff05ae47..762aa573c313 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -56,6 +56,12 @@ static int n_mem_addr_cells, n_mem_size_cells;
 static int form1_affinity;
 
 #define MAX_DISTANCE_REF_POINTS 4
+/*
+ *  HAck2: On Power9, there are 12 SMT8 cores per chip.
+ *  Hard code this for now.
+ */
+#define CORES_PER_CHIP 12
+#define CORES_PER_COREGROUP (CORES_PER_CHIP / 2)
 static int distance_ref_points_depth;
 static const __be32 *distance_ref_points;
 static int distance_lookup_table[MAX_NUMNODES][MAX_DISTANCE_REF_POINTS];
@@ -326,6 +332,13 @@ static int __init find_min_common_depth(void)
 
 	if (form1_affinity) {
 		depth = of_read_number(distance_ref_points, 1);
+		/*
+		 * Hack: Hack: Hack:
+		 * For now only on Phyp machines.
+		 */
+		if (!firmware_has_feature(FW_FEATURE_OPAL))
+			depth--;
 	} else {
 		if (distance_ref_points_depth < 2) {
 			printk(KERN_WARNING "NUMA: "
@@ -1247,8 +1260,8 @@ int cpu_to_coregroup_id(int cpu)
 		goto out;
 
 	index = of_read_number(associativity, 1);
-	if ((index > min_common_depth + 1) && coregroup_enabled)
-		return of_read_number(&associativity[index - 1], 1);
+	if ((index > min_common_depth + 1) && coregroup_enabled && has_big_cores)
+		return of_read_number(&associativity[index], 1) / CORES_PER_COREGROUP;
 
 out:
 	return cpu_to_core_id(cpu);
-- 
Thanks and Regards
Srikar Dronamraju
