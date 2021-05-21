Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB19A38C33C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 11:34:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmhKB6sSYz3cKb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 19:34:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bK1GX4s6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bK1GX4s6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmhJl2Nflz307J
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 19:34:31 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L9YFEZ068137; Fri, 21 May 2021 05:34:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=bxU7jU0sXFw9HzMEI2wnJtlZFIcoUTMyJCxC0PYzCyo=;
 b=bK1GX4s6KU7HGwxPp0w0H1uM5R4RXNOfru765bN+tNN0EzwL+Glv4GI7xqA0B6mq5app
 N/9y0GfjJBeY/0EqPHqOzj6UeNnt4TJjd6dKbTOv3STCsVoUqwdno70e81PKjSlEHYrz
 GUju03bysxhrruHGd2uDJzlFFJca3ozocHEF+jeaQ3goK2BqOrHSGa2mhz/pXWb7/71A
 dONVGqIzmyZ/uBHks1VF7BYNbTiFvhU1lMxAZvDWRdo+UNdiTNurgZ1WVeV1fa3AdsYU
 5eKtyt4LP8mYBEL+hnc+8U0G9+NVL4BL3VXg2WURsXWUXAcDe/kdnEsDrhgJyKU6GNT1 Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38p7pkvm0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 05:34:26 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14L9YPYH068821;
 Fri, 21 May 2021 05:34:25 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38p7pkvm0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 05:34:25 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14L9YLAM030842;
 Fri, 21 May 2021 09:34:24 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 38j5x9xk23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 09:34:24 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14L9Y3ZA28836212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 09:34:04 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB8D7C6055;
 Fri, 21 May 2021 09:34:03 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63963C6057;
 Fri, 21 May 2021 09:34:02 +0000 (GMT)
Received: from sig-9-65-94-165.ibm.com (unknown [9.65.94.165])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 09:34:02 +0000 (GMT)
Message-ID: <4d1a19311883c2ac6620633721ecc81d753f26c8.camel@linux.ibm.com>
Subject: [PATCH v4 07/16] powerpc/pseries/vas: Define VAS/NXGZIP HCALLs and
 structs
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Fri, 21 May 2021 02:34:00 -0700
In-Reply-To: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bRvIwvwxFe1q-Ctm46xx6PZnJS7IUJQf
X-Proofpoint-ORIG-GUID: Q6HcqgBO0Uwi2FMavEp2-OTEVeq_qq6A
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210061
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


This patch adds HCALLs and other definitions. Also define structs
that are used in VAS implementation on powerVM.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/asm/hvcall.h    |   7 ++
 arch/powerpc/include/asm/vas.h       |  32 ++++++++
 arch/powerpc/platforms/pseries/vas.h | 110 +++++++++++++++++++++++++++
 3 files changed, 149 insertions(+)
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
index 49bfb5be896d..371f62d99174 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -181,6 +181,7 @@ struct vas_tx_win_attr {
 	bool rx_win_ord_mode;
 };
 
+#ifdef CONFIG_PPC_POWERNV
 /*
  * Helper to map a chip id to VAS id.
  * For POWER9, this is a 1:1 mapping. In the future this maybe a 1:N
@@ -248,6 +249,37 @@ void vas_win_paste_addr(struct vas_window *window, u64 *addr,
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
+#define VAS_DESCR_LEN		8
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
+	char	name[VAS_DESCR_LEN + 1];
+	u64     descriptor;
+	u64     feat_type;
+};
+
+#endif
 
 /*
  * Register / unregister coprocessor type to VAS API which will be exported
diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platforms/pseries/vas.h
new file mode 100644
index 000000000000..033667921d36
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/vas.h
@@ -0,0 +1,110 @@
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
+#define	VAS_MOD_WIN_CLOSE	PPC_BIT(0)
+#define	VAS_MOD_WIN_JOBS_KILL	PPC_BIT(1)
+#define	VAS_MOD_WIN_DR		PPC_BIT(3)
+#define	VAS_MOD_WIN_PR		PPC_BIT(4)
+#define	VAS_MOD_WIN_SF		PPC_BIT(5)
+#define	VAS_MOD_WIN_TA		PPC_BIT(6)
+#define	VAS_MOD_WIN_FLAGS	(VAS_MOD_WIN_JOBS_KILL | VAS_MOD_WIN_DR | \
+				VAS_MOD_WIN_PR | VAS_MOD_WIN_SF)
+
+#define	VAS_WIN_ACTIVE		0x0
+#define	VAS_WIN_CLOSED		0x1
+#define	VAS_WIN_INACTIVE	0x2	/* Inactive due to HW failure */
+/* Process of being modified, deallocated, or quiesced */
+#define	VAS_WIN_MOD_IN_PROCESS	0x3
+
+#define	VAS_COPY_PASTE_USER_MODE	0x00000001
+#define	VAS_COP_OP_USER_MODE		0x00000010
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
+struct hv_vas_ct_caps {
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
+struct vas_ct_caps {
+	char		name[VAS_DESCR_LEN + 1];
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
+	struct vas_ct_caps caps;
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
+#endif /* _VAS_H */
-- 
2.18.2


