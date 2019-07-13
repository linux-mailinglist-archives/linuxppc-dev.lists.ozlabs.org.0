Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C292B678D5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 08:25:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45m0CT63VvzDqdD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 16:25:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lzgs54B0zDqv9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 16:01:29 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6D5w7nM100673; Sat, 13 Jul 2019 02:01:24 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tq9m9r2um-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 13 Jul 2019 02:01:23 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x6D5wtYx101629;
 Sat, 13 Jul 2019 02:01:23 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tq9m9r2u8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 13 Jul 2019 02:01:23 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x6D608rm007644;
 Sat, 13 Jul 2019 06:01:22 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 2tq6x60t7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 13 Jul 2019 06:01:22 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6D61KWK52494680
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2019 06:01:20 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C983EC6059;
 Sat, 13 Jul 2019 06:01:20 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5C94C6055;
 Sat, 13 Jul 2019 06:01:17 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.135.203])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 13 Jul 2019 06:01:17 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 12/13] powerpc/pseries/svm: Force SWIOTLB for secure guests
Date: Sat, 13 Jul 2019 03:00:22 -0300
Message-Id: <20190713060023.8479-13-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190713060023.8479-1-bauerman@linux.ibm.com>
References: <20190713060023.8479-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-13_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907130070
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
Cc: Anshuman Khandual <anshuman.linux@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Mike Anderson <andmike@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Christoph Hellwig <hch@lst.de>, Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Anshuman Khandual <khandual@linux.vnet.ibm.com>

SWIOTLB checks range of incoming CPU addresses to be bounced and sees if
the device can access it through its DMA window without requiring bouncing.
In such cases it just chooses to skip bouncing. But for cases like secure
guests on powerpc platform all addresses need to be bounced into the shared
pool of memory because the host cannot access it otherwise. Hence the need
to do the bouncing is not related to device's DMA window and use of bounce
buffers is forced by setting swiotlb_force.

Also, connect the shared memory conversion functions into the
ARCH_HAS_MEM_ENCRYPT hooks and call swiotlb_update_mem_attributes() to
convert SWIOTLB's memory pool to shared memory.

Signed-off-by: Anshuman Khandual <khandual@linux.vnet.ibm.com>
[ bauerman: Use ARCH_HAS_MEM_ENCRYPT hooks to share swiotlb memory pool. ]
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 arch/powerpc/include/asm/mem_encrypt.h | 26 +++++++++++++++
 arch/powerpc/platforms/pseries/Kconfig |  3 ++
 arch/powerpc/platforms/pseries/svm.c   | 45 ++++++++++++++++++++++++++
 3 files changed, 74 insertions(+)

diff --git a/arch/powerpc/include/asm/mem_encrypt.h b/arch/powerpc/include/asm/mem_encrypt.h
new file mode 100644
index 000000000000..d8d5a7fcf298
--- /dev/null
+++ b/arch/powerpc/include/asm/mem_encrypt.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * SVM helper functions
+ *
+ * Copyright 2019 IBM Corporation
+ */
+
+#ifndef _ASM_POWERPC_MEM_ENCRYPT_H
+#define _ASM_POWERPC_MEM_ENCRYPT_H
+
+#include <asm/svm.h>
+
+static inline bool mem_encrypt_active(void)
+{
+	return is_secure_guest();
+}
+
+static inline bool force_dma_unencrypted(struct device *dev)
+{
+	return is_secure_guest();
+}
+
+int set_memory_encrypted(unsigned long addr, int numpages);
+int set_memory_decrypted(unsigned long addr, int numpages);
+
+#endif /* _ASM_POWERPC_MEM_ENCRYPT_H */
diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index d09deb05bb66..9e35cddddf73 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -149,6 +149,9 @@ config PAPR_SCM
 config PPC_SVM
 	bool "Secure virtual machine (SVM) support for POWER"
 	depends on PPC_PSERIES
+	select SWIOTLB
+	select ARCH_HAS_MEM_ENCRYPT
+	select ARCH_HAS_FORCE_DMA_UNENCRYPTED
 	help
 	 There are certain POWER platforms which support secure guests using
 	 the Protected Execution Facility, with the help of an Ultravisor
diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index c508196f7c83..618622d636d5 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -7,8 +7,53 @@
  */
 
 #include <linux/mm.h>
+#include <asm/machdep.h>
+#include <asm/svm.h>
+#include <asm/swiotlb.h>
 #include <asm/ultravisor.h>
 
+static int __init init_svm(void)
+{
+	if (!is_secure_guest())
+		return 0;
+
+	/* Don't release the SWIOTLB buffer. */
+	ppc_swiotlb_enable = 1;
+
+	/*
+	 * Since the guest memory is inaccessible to the host, devices always
+	 * need to use the SWIOTLB buffer for DMA even if dma_capable() says
+	 * otherwise.
+	 */
+	swiotlb_force = SWIOTLB_FORCE;
+
+	/* Share the SWIOTLB buffer with the host. */
+	swiotlb_update_mem_attributes();
+
+	return 0;
+}
+machine_early_initcall(pseries, init_svm);
+
+int set_memory_encrypted(unsigned long addr, int numpages)
+{
+	if (!PAGE_ALIGNED(addr))
+		return -EINVAL;
+
+	uv_unshare_page(PHYS_PFN(__pa(addr)), numpages);
+
+	return 0;
+}
+
+int set_memory_decrypted(unsigned long addr, int numpages)
+{
+	if (!PAGE_ALIGNED(addr))
+		return -EINVAL;
+
+	uv_share_page(PHYS_PFN(__pa(addr)), numpages);
+
+	return 0;
+}
+
 /* There's one dispatch log per CPU. */
 #define NR_DTL_PAGE (DISPATCH_LOG_BYTES * CONFIG_NR_CPUS / PAGE_SIZE)
 
