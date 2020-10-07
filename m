Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0B0285E82
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 13:56:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5t8Y6HfYzDqDy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 22:56:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ntTXYzPx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5t0H0YbmzDqGt
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 22:49:02 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097BXQn7058658; Wed, 7 Oct 2020 07:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tYOrjq/VczdCaOfVEk5ncm7ItWPGLeb0oA8rOnQCx0E=;
 b=ntTXYzPxmdugAJ6j+DoangSJkDsyJUuOVoSVUxOtOL8W2UJDCOdHR7VuM+8gXNwI3+0R
 2IR2Chxc/UjRXnqEkeU/ksuD5Hx53FsbwHO3n08A70sccgjbucFG8POp5zQswhoaBD2l
 dwhApIjUXiyqIBdcSmy/oTSyFXodbya+oiEAKtixud4gBFwKQtMv5Uw2ig7eT9VkTUw3
 moNZcd+kmhFhavqwS78YIa31EdlRtcP/Y8wzLcLyuX+d5mOmYt3CcQvklRJyXcKrqorc
 hD3J48DSnNu3o2J2jPBOebmKYe+xa0KGM5FsNCvX1uLrO6P+6uDJlU9hM2PxKaqwBY3s yQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341csj8req-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 07:48:57 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 097BlSG0000486;
 Wed, 7 Oct 2020 11:48:56 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 33xgx9pdd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 11:48:56 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 097Bmtea48627984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Oct 2020 11:48:55 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA468AC05B;
 Wed,  7 Oct 2020 11:48:55 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDA2EAC05F;
 Wed,  7 Oct 2020 11:48:53 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.77.206.190])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  7 Oct 2020 11:48:53 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 2/4] powerpc/memhotplug: Make lmb size 64bit
Date: Wed,  7 Oct 2020 17:18:34 +0530
Message-Id: <20201007114836.282468-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201007114836.282468-1-aneesh.kumar@linux.ibm.com>
References: <20201007114836.282468-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-07_08:2020-10-06,
 2020-10-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010070075
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
Cc: nathanl@linux.ibm.com, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Similar to commit 89c140bbaeee ("pseries: Fix 64 bit logical memory block panic")
make sure different variables tracking lmb_size are updated to be 64 bit.

This was found by code audit.

Cc: stable@vger.kernel.org
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 .../platforms/pseries/hotplug-memory.c        | 43 +++++++++++++------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 0ea976d1cac4..843db91e39aa 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -277,7 +277,7 @@ static int dlpar_offline_lmb(struct drmem_lmb *lmb)
 	return dlpar_change_lmb_state(lmb, false);
 }
 
-static int pseries_remove_memblock(unsigned long base, unsigned int memblock_size)
+static int pseries_remove_memblock(unsigned long base, unsigned long memblock_size)
 {
 	unsigned long block_sz, start_pfn;
 	int sections_per_block;
@@ -308,10 +308,11 @@ static int pseries_remove_memblock(unsigned long base, unsigned int memblock_siz
 
 static int pseries_remove_mem_node(struct device_node *np)
 {
-	const __be32 *regs;
+	const __be32 *prop;
 	unsigned long base;
-	unsigned int lmb_size;
+	unsigned long lmb_size;
 	int ret = -EINVAL;
+	int addr_cells, size_cells;
 
 	/*
 	 * Check to see if we are actually removing memory
@@ -322,12 +323,19 @@ static int pseries_remove_mem_node(struct device_node *np)
 	/*
 	 * Find the base address and size of the memblock
 	 */
-	regs = of_get_property(np, "reg", NULL);
-	if (!regs)
+	prop = of_get_property(np, "reg", NULL);
+	if (!prop)
 		return ret;
 
-	base = be64_to_cpu(*(unsigned long *)regs);
-	lmb_size = be32_to_cpu(regs[3]);
+	addr_cells = of_n_addr_cells(np);
+	size_cells = of_n_size_cells(np);
+
+	/*
+	 * "reg" property represents (addr,size) tuple.
+	 */
+	base = of_read_number(prop, addr_cells);
+	prop += addr_cells;
+	lmb_size = of_read_number(prop, size_cells);
 
 	pseries_remove_memblock(base, lmb_size);
 	return 0;
@@ -564,7 +572,7 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 
 #else
 static inline int pseries_remove_memblock(unsigned long base,
-					  unsigned int memblock_size)
+					  unsigned long memblock_size)
 {
 	return -EOPNOTSUPP;
 }
@@ -886,10 +894,11 @@ int dlpar_memory(struct pseries_hp_errorlog *hp_elog)
 
 static int pseries_add_mem_node(struct device_node *np)
 {
-	const __be32 *regs;
+	const __be32 *prop;
 	unsigned long base;
-	unsigned int lmb_size;
+	unsigned long lmb_size;
 	int ret = -EINVAL;
+	int addr_cells, size_cells;
 
 	/*
 	 * Check to see if we are actually adding memory
@@ -900,12 +909,18 @@ static int pseries_add_mem_node(struct device_node *np)
 	/*
 	 * Find the base and size of the memblock
 	 */
-	regs = of_get_property(np, "reg", NULL);
-	if (!regs)
+	prop = of_get_property(np, "reg", NULL);
+	if (!prop)
 		return ret;
 
-	base = be64_to_cpu(*(unsigned long *)regs);
-	lmb_size = be32_to_cpu(regs[3]);
+	addr_cells = of_n_addr_cells(np);
+	size_cells = of_n_size_cells(np);
+	/*
+	 * "reg" property represents (addr,size) tuple.
+	 */
+	base = of_read_number(prop, addr_cells);
+	prop += addr_cells;
+	lmb_size = of_read_number(prop, size_cells);
 
 	/*
 	 * Update memory region to represent the memory add
-- 
2.26.2

