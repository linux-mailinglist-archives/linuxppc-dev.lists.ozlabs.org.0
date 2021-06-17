Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 183643ABD82
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 22:34:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5Yh14sRwz3dH5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:34:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AxgyB2jb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AxgyB2jb; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5YgZ6DPBz3c3G
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 06:34:18 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HK2pv3171540; Thu, 17 Jun 2021 16:34:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=swEyw4DJmNQrLlffPpL2Gwg44+eLccD7B1qAut+xO1E=;
 b=AxgyB2jbwYD0svrsPCj0GbUiBr7lVwkS63yRvmkUKaVWp16jp8Y3UeiCy7N8sbbzJZGo
 XfJTUcszv3R63GQu86TN//6JyUr/ImVO2wUftJYl2jVQGjgRQ4ZDXblp5BIeLEIghtzI
 3N4R6cSnfneWrM7zEzkvG249ztfe9O952hyDWtIBbQ3iDIMEAY9Oy18KKW6KHpfAuzAg
 HHq4bPOBPXrsC+Iwz68Cp7ftXe9jWnK2WXM7yjo0oduvgNq0lnqfV532yuCIYPau8nsH
 lqcG9g0zF1BsIYgYqPuzbf8yjLY+VoIDeVE+rLe1doIm0RGIxNJSsyUPDYoIFpYnovnV dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3988xqrn8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 16:34:10 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HKI2MB076916;
 Thu, 17 Jun 2021 16:34:10 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3988xqrn83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 16:34:10 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HKI7Le004056;
 Thu, 17 Jun 2021 20:34:09 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 394mja3w7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 20:34:09 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HKY8ue25493944
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 20:34:08 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD5DFBE054;
 Thu, 17 Jun 2021 20:34:08 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0318CBE053;
 Thu, 17 Jun 2021 20:34:07 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.180.39])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 20:34:06 +0000 (GMT)
Message-ID: <b4b8c594c27ee4aa6be9dc6dc4ee7331571cbbe8.camel@linux.ibm.com>
Subject: [PATCH v6 08/17] powerpc/pseries/vas: Define VAS/NXGZIP hcalls and
 structs
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Thu, 17 Jun 2021 13:34:05 -0700
In-Reply-To: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
References: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cbX0RZoi8FYPP_C3yA90K24uZ6j7X5Uo
X-Proofpoint-ORIG-GUID: 5mwI-ucM3xqFZxG8BpxPDRyn-J8HH6jA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_16:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170122
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This patch adds hcalls and other definitions. Also define structs
that are used in VAS implementation on PowerVM.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Acked-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/hvcall.h    |   7 ++
 arch/powerpc/include/asm/vas.h       |  30 +++++++
 arch/powerpc/platforms/pseries/vas.h | 125 +++++++++++++++++++++++++++
 3 files changed, 162 insertions(+)
 create mode 100644 arch/powerpc/platforms/pseries/vas.h

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index e3b29eda8074..7c3418d1b5e9 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -294,6 +294,13 @@
 #define H_RESIZE_HPT_COMMIT	0x370
 #define H_REGISTER_PROC_TBL	0x37C
 #define H_SIGNAL_SYS_RESET	0x380
+#define H_ALLOCATE_VAS_WINDOW	0x388
+#define H_MODIFY_VAS_WINDOW	0x38C
+#define H_DEALLOCATE_VAS_WINDOW	0x390
+#define H_QUERY_VAS_WINDOW	0x394
+#define H_QUERY_VAS_CAPABILITIES	0x398
+#define H_QUERY_NX_CAPABILITIES	0x39C
+#define H_GET_NX_FAULT		0x3A0
 #define H_INT_GET_SOURCE_INFO   0x3A8
 #define H_INT_SET_SOURCE_CONFIG 0x3AC
 #define H_INT_GET_SOURCE_CONFIG 0x3B0
diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index 14ad7982874c..99570c33058f 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -160,6 +160,7 @@ struct vas_tx_win_attr {
 	bool rx_win_ord_mode;
 };
 
+#ifdef CONFIG_PPC_POWERNV
 /*
  * Helper to map a chip id to VAS id.
  * For POWER9, this is a 1:1 mapping. In the future this maybe a 1:N
@@ -225,6 +226,35 @@ int vas_paste_crb(struct vas_window *win, int offset, bool re);
 int vas_register_api_powernv(struct module *mod, enum vas_cop_type cop_type,
 			     const char *name);
 void vas_unregister_api_powernv(void);
+#endif
+
+#ifdef CONFIG_PPC_PSERIES
+
+/* VAS Capabilities */
+#define VAS_GZIP_QOS_FEAT	0x1
+#define VAS_GZIP_DEF_FEAT	0x2
+#define VAS_GZIP_QOS_FEAT_BIT	PPC_BIT(VAS_GZIP_QOS_FEAT) /* Bit 1 */
+#define VAS_GZIP_DEF_FEAT_BIT	PPC_BIT(VAS_GZIP_DEF_FEAT) /* Bit 2 */
+
+/* NX Capabilities */
+#define VAS_NX_GZIP_FEAT	0x1
+#define VAS_NX_GZIP_FEAT_BIT	PPC_BIT(VAS_NX_GZIP_FEAT) /* Bit 1 */
+
+/*
+ * These structs are used to retrieve overall VAS capabilities that
+ * the hypervisor provides.
+ */
+struct hv_vas_all_caps {
+	__be64  descriptor;
+	__be64  feat_type;
+} __packed __aligned(0x1000);
+
+struct vas_all_caps {
+	u64     descriptor;
+	u64     feat_type;
+};
+
+#endif
 
 /*
  * Register / unregister coprocessor type to VAS API which will be exported
diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platforms/pseries/vas.h
new file mode 100644
index 000000000000..4ecb3fcabd10
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/vas.h
@@ -0,0 +1,125 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright 2020-21 IBM Corp.
+ */
+
+#ifndef _VAS_H
+#define _VAS_H
+#include <asm/vas.h>
+#include <linux/mutex.h>
+#include <linux/stringify.h>
+
+/*
+ * VAS window modify flags
+ */
+#define VAS_MOD_WIN_CLOSE	PPC_BIT(0)
+#define VAS_MOD_WIN_JOBS_KILL	PPC_BIT(1)
+#define VAS_MOD_WIN_DR		PPC_BIT(3)
+#define VAS_MOD_WIN_PR		PPC_BIT(4)
+#define VAS_MOD_WIN_SF		PPC_BIT(5)
+#define VAS_MOD_WIN_TA		PPC_BIT(6)
+#define VAS_MOD_WIN_FLAGS	(VAS_MOD_WIN_JOBS_KILL | VAS_MOD_WIN_DR | \
+				VAS_MOD_WIN_PR | VAS_MOD_WIN_SF)
+
+#define VAS_WIN_ACTIVE		0x0
+#define VAS_WIN_CLOSED		0x1
+#define VAS_WIN_INACTIVE	0x2	/* Inactive due to HW failure */
+/* Process of being modified, deallocated, or quiesced */
+#define VAS_WIN_MOD_IN_PROCESS	0x3
+
+#define VAS_COPY_PASTE_USER_MODE	0x00000001
+#define VAS_COP_OP_USER_MODE		0x00000010
+
+/*
+ * Co-processor feature - GZIP QoS windows or GZIP default windows
+ */
+enum vas_cop_feat_type {
+	VAS_GZIP_QOS_FEAT_TYPE,
+	VAS_GZIP_DEF_FEAT_TYPE,
+	VAS_MAX_FEAT_TYPE,
+};
+
+/*
+ * Use to get feature specific capabilities from the
+ * hypervisor.
+ */
+struct hv_vas_cop_feat_caps {
+	__be64	descriptor;
+	u8	win_type;		/* Default or QoS type */
+	u8	user_mode;
+	__be16	max_lpar_creds;
+	__be16	max_win_creds;
+	union {
+		__be16	reserved;
+		__be16	def_lpar_creds; /* Used for default capabilities */
+	};
+	__be16	target_lpar_creds;
+} __packed __aligned(0x1000);
+
+/*
+ * Feature specific (QoS or default) capabilities.
+ */
+struct vas_cop_feat_caps {
+	u64		descriptor;
+	u8		win_type;	/* Default or QoS type */
+	u8		user_mode;	/* User mode copy/paste or COP HCALL */
+	u16		max_lpar_creds;	/* Max credits available in LPAR */
+	/* Max credits can be assigned per window */
+	u16		max_win_creds;
+	union {
+		u16	reserved;	/* Used for QoS credit type */
+		u16	def_lpar_creds; /* Used for default credit type */
+	};
+	/* Total LPAR available credits. Can be different from max LPAR */
+	/* credits due to DLPAR operation */
+	atomic_t	target_lpar_creds;
+	atomic_t	used_lpar_creds; /* Used credits so far */
+	u16		avail_lpar_creds; /* Remaining available credits */
+};
+
+/*
+ * Feature (QoS or Default) specific to store capabilities and
+ * the list of open windows.
+ */
+struct vas_caps {
+	struct vas_cop_feat_caps caps;
+	struct list_head list;	/* List of open windows */
+};
+
+/*
+ * To get window information from the hypervisor.
+ */
+struct hv_vas_win_lpar {
+	__be16	version;
+	u8	win_type;
+	u8	status;
+	__be16	credits;	/* No of credits assigned to this window */
+	__be16	reserved;
+	__be32	pid;		/* LPAR Process ID */
+	__be32	tid;		/* LPAR Thread ID */
+	__be64	win_addr;	/* Paste address */
+	__be32	interrupt;	/* Interrupt when NX request completes */
+	__be32	fault;		/* Interrupt when NX sees fault */
+	/* Associativity Domain Identifiers as returned in */
+	/* H_HOME_NODE_ASSOCIATIVITY */
+	__be64	domain[6];
+	__be64	win_util;	/* Number of bytes processed */
+} __packed __aligned(0x1000);
+
+struct pseries_vas_window {
+	struct vas_window vas_win;
+	u64 win_addr;		/* Physical paste address */
+	u8 win_type;		/* QoS or Default window */
+	u32 complete_irq;	/* Completion interrupt */
+	u32 fault_irq;		/* Fault interrupt */
+	u64 domain[6];		/* Associativity domain Ids */
+				/* this window is allocated */
+	u64 util;
+
+	/* List of windows opened which is used for LPM */
+	struct list_head win_list;
+	u64 flags;
+	char *name;
+	int fault_virq;
+};
+#endif /* _VAS_H */
-- 
2.18.2


