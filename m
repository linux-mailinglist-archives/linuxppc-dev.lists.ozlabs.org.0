Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8CF3D72A5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 12:11:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYsy24TdGz3d82
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 20:11:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RDJBuszT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RDJBuszT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYsxZ20xbz3dB5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jul 2021 20:10:41 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16RA2k2V098542; Tue, 27 Jul 2021 06:10:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0FneoCyxhRqrFMZ3MQXiaE1Va1QNOBP2DJnVYreC6Rw=;
 b=RDJBuszTge/DIizr3C6PrIbcVB2FFCQjH8ZM3jTfb9/ovlZaRojdgnxKRlmz3/MvmTLd
 bjFeVU34saKjg61rGJNePJIwQUa72XEkqKXYzwam3fT2S3ihKqePBPqXpVZoMSIpldOC
 jKIrxwZ66v6mGQYrd6jpolof/PmX+jsPsrRpg9jOV3RlTWSyp6onZ0blKZ1lCDxf7+8S
 YQlpysp2YGq0HIIF7qs3JEdOr7r5yupjE/DKB3qS/1TzQ5nTYRGqPlyqESKHAFAltBQF
 GnYPe3Iqq+18RMHOJETD0Qb2jsV7TmUv2k4Hdvc09tFDggy0U7wBagRZj1WXUT53in36 LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a2fas9xem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 06:10:35 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16RA3PG0100687;
 Tue, 27 Jul 2021 06:10:05 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a2fas9vk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 06:10:05 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16RA3aZX004247;
 Tue, 27 Jul 2021 10:04:39 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 3a235m4j76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 10:04:39 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16RA3cO033882514
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Jul 2021 10:03:38 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E06816E058;
 Tue, 27 Jul 2021 10:03:37 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2AE96E050;
 Tue, 27 Jul 2021 10:03:34 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.74.145])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 27 Jul 2021 10:03:34 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v6 4/6] powerpc/pseries: Add a helper for form1 cpu distance
Date: Tue, 27 Jul 2021 15:33:09 +0530
Message-Id: <20210727100311.310969-5-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727100311.310969-1-aneesh.kumar@linux.ibm.com>
References: <20210727100311.310969-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mWnnEJag5mn2lFU45kXBtXaLE2bpCkD5
X-Proofpoint-ORIG-GUID: dIxj3_YJbgMN8dxQkz-w1jGucsz0AS_Y
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-27_06:2021-07-27,
 2021-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107270058
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
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This helper is only used with the dispatch trace log collection.
A later patch will add Form2 affinity support and this change helps
in keeping that simpler. Also add a comment explaining we don't expect
the code to be called with FORM0

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/topology.h   |  4 ++--
 arch/powerpc/mm/numa.c                | 10 +++++++++-
 arch/powerpc/platforms/pseries/lpar.c |  4 ++--
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index a6425a70c37b..a4712ecad3e9 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -36,7 +36,7 @@ static inline int pcibus_to_node(struct pci_bus *bus)
 				 cpu_all_mask :				\
 				 cpumask_of_node(pcibus_to_node(bus)))
 
-extern int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc);
+int cpu_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc);
 extern int __node_distance(int, int);
 #define node_distance(a, b) __node_distance(a, b)
 
@@ -84,7 +84,7 @@ static inline void sysfs_remove_device_from_node(struct device *dev,
 
 static inline void update_numa_cpu_lookup_table(unsigned int cpu, int node) {}
 
-static inline int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
+static inline int cpu_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
 {
 	return 0;
 }
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index c695faf67d68..a244398a7766 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -166,7 +166,7 @@ static void unmap_cpu_from_node(unsigned long cpu)
 }
 #endif /* CONFIG_HOTPLUG_CPU || CONFIG_PPC_SPLPAR */
 
-int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
+static int __cpu_form1_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
 {
 	int dist = 0;
 
@@ -182,6 +182,14 @@ int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
 	return dist;
 }
 
+int cpu_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
+{
+	/* We should not get called with FORM0 */
+	VM_WARN_ON(affinity_form == FORM0_AFFINITY);
+
+	return __cpu_form1_relative_distance(cpu1_assoc, cpu2_assoc);
+}
+
 /* must hold reference to node during call */
 static const __be32 *of_get_associativity(struct device_node *dev)
 {
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index dab356e3ff87..afefbdfe768d 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -261,7 +261,7 @@ static int cpu_relative_dispatch_distance(int last_disp_cpu, int cur_disp_cpu)
 	if (!last_disp_cpu_assoc || !cur_disp_cpu_assoc)
 		return -EIO;
 
-	return cpu_distance(last_disp_cpu_assoc, cur_disp_cpu_assoc);
+	return cpu_relative_distance(last_disp_cpu_assoc, cur_disp_cpu_assoc);
 }
 
 static int cpu_home_node_dispatch_distance(int disp_cpu)
@@ -281,7 +281,7 @@ static int cpu_home_node_dispatch_distance(int disp_cpu)
 	if (!disp_cpu_assoc || !vcpu_assoc)
 		return -EIO;
 
-	return cpu_distance(disp_cpu_assoc, vcpu_assoc);
+	return cpu_relative_distance(disp_cpu_assoc, vcpu_assoc);
 }
 
 static void update_vcpu_disp_stat(int disp_cpu)
-- 
2.31.1

