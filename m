Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 542DCC48CC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 09:51:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jpGw4Y23zDqWr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 17:51:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jpDx5WYqzDqWL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 17:49:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46jpDx2zcGz8sx3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 17:49:21 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46jpDx2cRfz9sPq; Wed,  2 Oct 2019 17:49:21 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=hegdevasant@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46jpDw5gHDz9sPh
 for <linuxppc-dev@ozlabs.org>; Wed,  2 Oct 2019 17:49:20 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x927kvGr133636
 for <linuxppc-dev@ozlabs.org>; Wed, 2 Oct 2019 03:49:17 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vc71r3y1p-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 02 Oct 2019 03:49:16 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hegdevasant@linux.vnet.ibm.com>;
 Wed, 2 Oct 2019 08:49:15 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 2 Oct 2019 08:49:11 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x927nBmd60424320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Oct 2019 07:49:11 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3D69A405F;
 Wed,  2 Oct 2019 07:49:10 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4340A4054;
 Wed,  2 Oct 2019 07:49:08 +0000 (GMT)
Received: from hegdevasant.in.ibm.com (unknown [9.85.95.247])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Oct 2019 07:49:08 +0000 (GMT)
From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/powernv/prd: Validate whether address to be mapped is
 part of system RAM
Date: Wed,  2 Oct 2019 13:18:56 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19100207-0012-0000-0000-000003534236
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100207-0013-0000-0000-0000218E4447
Message-Id: <20191002074856.15014-1-hegdevasant@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-02_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=926 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910020073
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
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
 Jeremy Kerr <jk@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add check to validate whether requested page is part of system RAM
or not before mmap() and error out if its not part of system RAM.

cat /proc/iomem:
-----------------
00000000-27ffffffff : System RAM
2800000000-2fffffffff : namespace0.0
200000000000-2027ffffffff : System RAM
202800000000-202fffffffff : namespace1.0
6000000000000-6003fbfffffff : pciex@600c3c0000000
6004000000000-6007f7fffffff : pciex@600c3c0100000
....
....

Sample dmesg output with this fix:
----------------------------------
[  160.371911] opal-prd: mmap: Requested page is not part of system RAM (addr : 0x0000202ffcfc0000, size : 0x0000000000570000)
[  160.665366] opal-prd: mmap: Requested page is not part of system RAM (addr : 0x0000202ffcfc0000, size : 0x0000000000570000)
[  160.914627] opal-prd: mmap: Requested page is not part of system RAM (addr : 0x0000202ffcfc0000, size : 0x0000000000570000)
[  161.165253] opal-prd: mmap: Requested page is not part of system RAM (addr : 0x0000202ffcfc0000, size : 0x0000000000570000)
[  161.414604] opal-prd: mmap: Requested page is not part of system RAM (addr : 0x0000202ffcfc0000, size : 0x0000000000570000)

CC: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
CC: Jeremy Kerr <jk@ozlabs.org>
CC: Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/powernv/opal-prd.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/opal-prd.c b/arch/powerpc/platforms/powernv/opal-prd.c
index 45f4223a790f..0f88752302a2 100644
--- a/arch/powerpc/platforms/powernv/opal-prd.c
+++ b/arch/powerpc/platforms/powernv/opal-prd.c
@@ -3,7 +3,7 @@
  * OPAL Runtime Diagnostics interface driver
  * Supported on POWERNV platform
  *
- * Copyright IBM Corporation 2015
+ * Copyright IBM Corporation 2015-2019
  */
 
 #define pr_fmt(fmt) "opal-prd: " fmt
@@ -47,6 +47,20 @@ static bool opal_prd_range_is_valid(uint64_t addr, uint64_t size)
 	if (addr + size < addr)
 		return false;
 
+	/*
+	 * Check if region is in system RAM and error out if the address
+	 * belongs to special devices like NVDIMM. phys_mem_access_prot()
+	 * routine will change ATT bits to non cachable if page is not in
+	 * RAM, causing HBRT to not fetch and execute in the mapped memory
+	 * and fail. Page permissions can be left at default since all
+	 * firmware component should be in system RAM only.
+	 */
+	if (!page_is_ram(addr >> PAGE_SHIFT)) {
+		pr_warn("mmap: Requested page is not part of system RAM "
+			"(addr : 0x%016llx, size : 0x%016llx)\n", addr, size);
+		return false;
+	}
+
 	parent = of_find_node_by_path("/reserved-memory");
 	if (!parent)
 		return false;
-- 
2.21.0

