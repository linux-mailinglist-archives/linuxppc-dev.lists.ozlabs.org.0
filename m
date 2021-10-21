Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BED43699C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 19:45:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZvyv1vQGz3cH1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 04:45:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UW4O9SzY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UW4O9SzY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZvy646Lnz2xtK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 04:45:01 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19LGmTRE018349; 
 Thu, 21 Oct 2021 13:44:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=i2ycDDjeiqTtM7Cev5EV+pE6ey4tIqV0iqNMEgrkmsI=;
 b=UW4O9SzYaCMRw+FRyYIh2QN5Rq1wfxCNMmDMaKdqYAekdDoatibcbl6/agnUsR3S7l76
 wHxleYkhPQZqcVanG5gMjNU224cbt6T49emG+ENyDwGMm4CmBiVOjkBxE16gD4tNIs1Q
 CvOs8cUwm5Uf8Onk99Er/RwZqlgcNs1l7zokOFnv0aPGFxvDUGMWheipqO4V+G14FsLn
 uEaAIOQIf5ZVzi6aonk5Ut2CdopJLXXJXhNSUmIt6tJL+a/sjCpWxFADotlnNwMrbxO9
 4KZDrEWmSeWd5f3BDa0npSdEs9/TAzMJ1/s+FNxZ7sAS/zW0D33kkvULvWtGiE7YSlZ7 yg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bu8kkpvwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 13:44:58 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19LHbbGo015258;
 Thu, 21 Oct 2021 17:44:57 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 3bqpcd4eye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 17:44:57 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19LHiuos41615864
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Oct 2021 17:44:56 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58D18AC065;
 Thu, 21 Oct 2021 17:44:56 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B7F7AC060;
 Thu, 21 Oct 2021 17:44:55 +0000 (GMT)
Received: from li-8b42f0cc-24d8-11b2-a85c-df7e17c2bac6.ibm.com.com (unknown
 [9.163.15.181]) by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 21 Oct 2021 17:44:55 +0000 (GMT)
From: Brian King <brking@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Enhance pmem DMA bypass handling
Date: Thu, 21 Oct 2021 12:44:49 -0500
Message-Id: <20211021174449.120875-1-brking@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dTs5-YIbb6KmA7N_C9uA7PLzh7FYaY9L
X-Proofpoint-GUID: dTs5-YIbb6KmA7N_C9uA7PLzh7FYaY9L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-21_04,2021-10-21_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1011 mlxlogscore=999 suspectscore=0 mlxscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110210087
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
Cc: aik@ozlabs.ru, Brian King <brking@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If ibm,pmemory is installed in the system, it can appear anywhere
in the address space. This patch enhances how we handle DMA for devices when
ibm,pmemory is present. In the case where we have enough DMA space to
direct map all of RAM, but not ibm,pmemory, we use direct DMA for
I/O to RAM and use the default window to dynamically map ibm,pmemory.
In the case where we only have a single DMA window, this won't work,
so if the window is not big enough to map the entire address range,
we cannot direct map.

Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 269f61d519c2..d9ae985d10a4 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1092,15 +1092,6 @@ static phys_addr_t ddw_memory_hotplug_max(void)
 	phys_addr_t max_addr = memory_hotplug_max();
 	struct device_node *memory;
 
-	/*
-	 * The "ibm,pmemory" can appear anywhere in the address space.
-	 * Assuming it is still backed by page structs, set the upper limit
-	 * for the huge DMA window as MAX_PHYSMEM_BITS.
-	 */
-	if (of_find_node_by_type(NULL, "ibm,pmemory"))
-		return (sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ?
-			(phys_addr_t) -1 : (1ULL << MAX_PHYSMEM_BITS);
-
 	for_each_node_by_type(memory, "memory") {
 		unsigned long start, size;
 		int n_mem_addr_cells, n_mem_size_cells, len;
@@ -1341,6 +1332,16 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	 */
 	len = max_ram_len;
 	if (pmem_present) {
+		if (default_win_removed) {
+			/*
+			 * If we only have one DMA window and have pmem present,
+			 * then we need to be able to map the entire address
+			 * range in order to be able to do direct DMA to RAM.
+			 */
+			len = order_base_2((sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ?
+					(phys_addr_t) -1 : (1ULL << MAX_PHYSMEM_BITS));
+		}
+
 		if (query.largest_available_block >=
 		    (1ULL << (MAX_PHYSMEM_BITS - page_shift)))
 			len = MAX_PHYSMEM_BITS;
-- 
2.27.0

