Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0E79545E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 04:27:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CF6k65ZQzDqw3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 12:26:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CDr36q7WzDqkW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 12:14:11 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7K2D5Ux081073
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 22:14:09 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ug2uu1ted-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 22:14:08 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Tue, 20 Aug 2019 03:14:07 +0100
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 20 Aug 2019 03:14:04 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7K2E3si43122980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 02:14:03 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10A7FC605B;
 Tue, 20 Aug 2019 02:14:03 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F2D0C6055;
 Tue, 20 Aug 2019 02:14:00 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.220.248])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 20 Aug 2019 02:13:59 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 05/16] powerpc/pseries/svm: Add helpers for UV_SHARE_PAGE
 and UV_UNSHARE_PAGE
Date: Mon, 19 Aug 2019 23:13:15 -0300
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820021326.6884-1-bauerman@linux.ibm.com>
References: <20190820021326.6884-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19082002-0004-0000-0000-000015370FF1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011621; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01249321; UDB=6.00659504; IPR=6.01030858; 
 MB=3.00028240; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-20 02:14:07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082002-0005-0000-0000-00008CF1A29A
Message-Id: <20190820021326.6884-6-bauerman@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=663 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200018
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
 Christoph Hellwig <hch@lst.de>, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ram Pai <linuxram@us.ibm.com>

These functions are used when the guest wants to grant the hypervisor
access to certain pages.

Signed-off-by: Ram Pai <linuxram@us.ibm.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 arch/powerpc/include/asm/ultravisor-api.h |  2 ++
 arch/powerpc/include/asm/ultravisor.h     | 24 +++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/powerpc/include/asm/ultravisor-api.h b/arch/powerpc/include/asm/ultravisor-api.h
index d3503d1f447e..142b0576b89f 100644
--- a/arch/powerpc/include/asm/ultravisor-api.h
+++ b/arch/powerpc/include/asm/ultravisor-api.h
@@ -22,5 +22,7 @@
 
 /* opcodes */
 #define UV_ESM				0xF110
+#define UV_SHARE_PAGE			0xF130
+#define UV_UNSHARE_PAGE			0xF134
 
 #endif /* _ASM_POWERPC_ULTRAVISOR_API_H */
diff --git a/arch/powerpc/include/asm/ultravisor.h b/arch/powerpc/include/asm/ultravisor.h
new file mode 100644
index 000000000000..a930aec8c1e3
--- /dev/null
+++ b/arch/powerpc/include/asm/ultravisor.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Ultravisor definitions
+ *
+ * Copyright 2019, IBM Corporation.
+ *
+ */
+#ifndef _ASM_POWERPC_ULTRAVISOR_H
+#define _ASM_POWERPC_ULTRAVISOR_H
+
+#include <asm/asm-prototypes.h>
+#include <asm/ultravisor-api.h>
+
+static inline int uv_share_page(u64 pfn, u64 npages)
+{
+	return ucall_norets(UV_SHARE_PAGE, pfn, npages);
+}
+
+static inline int uv_unshare_page(u64 pfn, u64 npages)
+{
+	return ucall_norets(UV_UNSHARE_PAGE, pfn, npages);
+}
+
+#endif	/* _ASM_POWERPC_ULTRAVISOR_H */

