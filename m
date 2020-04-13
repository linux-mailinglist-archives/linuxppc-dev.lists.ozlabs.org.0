Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EE61A696D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 18:08:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491D7p4dwszDqNs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 02:08:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=rzinsly@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491CxL0Q34zDqL4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 01:59:49 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03DFXt2A066240; Mon, 13 Apr 2020 11:59:39 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30b6tuvu73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Apr 2020 11:59:38 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03DFuV4n027349;
 Mon, 13 Apr 2020 15:59:38 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 30b5h69ehm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Apr 2020 15:59:38 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03DFxc5u52560170
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Apr 2020 15:59:38 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E96E2AC05B;
 Mon, 13 Apr 2020 15:59:37 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8984AAC059;
 Mon, 13 Apr 2020 15:59:37 +0000 (GMT)
Received: from localhost (unknown [9.85.151.130])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 13 Apr 2020 15:59:37 +0000 (GMT)
From: Raphael Moreira Zinsly <rzinsly@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org, dja@axtens.net
Subject: [PATCH V3 1/5] selftests/powerpc: Add header files for GZIP engine
 test
Date: Mon, 13 Apr 2020 12:59:12 -0300
Message-Id: <20200413155916.16900-2-rzinsly@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200413155916.16900-1-rzinsly@linux.ibm.com>
References: <20200413155916.16900-1-rzinsly@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-13_07:2020-04-13,
 2020-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004130116
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
Cc: abali@us.ibm.com, haren@linux.ibm.com, herbert@gondor.apana.org.au,
 rzinsly@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add files to access the powerpc NX-GZIP engine in user space.

Signed-off-by: Bulent Abali <abali@us.ibm.com>
Signed-off-by: Raphael Moreira Zinsly <rzinsly@linux.ibm.com>
---
 .../selftests/powerpc/nx-gzip/inc/crb.h       | 159 ++++++++++++++++++
 .../selftests/powerpc/nx-gzip/inc/nx-gzip.h   |  27 +++
 .../powerpc/nx-gzip/inc/nx-helpers.h          |  54 ++++++
 .../selftests/powerpc/nx-gzip/inc/nx.h        |  38 +++++
 4 files changed, 278 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/inc/crb.h
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/inc/nx-gzip.h
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/inc/nx-helpers.h
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/inc/nx.h

diff --git a/tools/testing/selftests/powerpc/nx-gzip/inc/crb.h b/tools/testing/selftests/powerpc/nx-gzip/inc/crb.h
new file mode 100644
index 000000000000..9056e3dc1831
--- /dev/null
+++ b/tools/testing/selftests/powerpc/nx-gzip/inc/crb.h
@@ -0,0 +1,159 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __CRB_H
+#define __CRB_H
+#include <linux/types.h>
+#include "nx.h"
+
+typedef unsigned char u8;
+typedef unsigned int u32;
+typedef unsigned long long u64;
+
+/* CCW 842 CI/FC masks
+ * NX P8 workbook, section 4.3.1, figure 4-6
+ * "CI/FC Boundary by NX CT type"
+ */
+#define CCW_CI_842              (0x00003ff8)
+#define CCW_FC_842              (0x00000007)
+
+/* Chapter 6.5.8 Coprocessor-Completion Block (CCB) */
+
+#define CCB_VALUE		(0x3fffffffffffffff)
+#define CCB_ADDRESS		(0xfffffffffffffff8)
+#define CCB_CM			(0x0000000000000007)
+#define CCB_CM0			(0x0000000000000004)
+#define CCB_CM12		(0x0000000000000003)
+
+#define CCB_CM0_ALL_COMPLETIONS	(0x0)
+#define CCB_CM0_LAST_IN_CHAIN	(0x4)
+#define CCB_CM12_STORE		(0x0)
+#define CCB_CM12_INTERRUPT	(0x1)
+
+#define CCB_SIZE		(0x10)
+#define CCB_ALIGN		CCB_SIZE
+
+struct coprocessor_completion_block {
+	__be64 value;
+	__be64 address;
+} __aligned(CCB_ALIGN);
+
+
+/* Chapter 6.5.7 Coprocessor-Status Block (CSB) */
+
+#define CSB_V			(0x80)
+#define CSB_F			(0x04)
+#define CSB_CH			(0x03)
+#define CSB_CE_INCOMPLETE	(0x80)
+#define CSB_CE_TERMINATION	(0x40)
+#define CSB_CE_TPBC		(0x20)
+
+#define CSB_CC_SUCCESS		(0)
+#define CSB_CC_INVALID_ALIGN	(1)
+#define CSB_CC_OPERAND_OVERLAP	(2)
+#define CSB_CC_DATA_LENGTH	(3)
+#define CSB_CC_TRANSLATION	(5)
+#define CSB_CC_PROTECTION	(6)
+#define CSB_CC_RD_EXTERNAL	(7)
+#define CSB_CC_INVALID_OPERAND	(8)
+#define CSB_CC_PRIVILEGE	(9)
+#define CSB_CC_INTERNAL		(10)
+#define CSB_CC_WR_EXTERNAL	(12)
+#define CSB_CC_NOSPC		(13)
+#define CSB_CC_EXCESSIVE_DDE	(14)
+#define CSB_CC_WR_TRANSLATION	(15)
+#define CSB_CC_WR_PROTECTION	(16)
+#define CSB_CC_UNKNOWN_CODE	(17)
+#define CSB_CC_ABORT		(18)
+#define CSB_CC_TRANSPORT	(20)
+#define CSB_CC_SEGMENTED_DDL	(31)
+#define CSB_CC_PROGRESS_POINT	(32)
+#define CSB_CC_DDE_OVERFLOW	(33)
+#define CSB_CC_SESSION		(34)
+#define CSB_CC_PROVISION	(36)
+#define CSB_CC_CHAIN		(37)
+#define CSB_CC_SEQUENCE		(38)
+#define CSB_CC_HW		(39)
+
+#define CSB_SIZE		(0x10)
+#define CSB_ALIGN		CSB_SIZE
+
+struct coprocessor_status_block {
+	u8 flags;
+	u8 cs;
+	u8 cc;
+	u8 ce;
+	__be32 count;
+	__be64 address;
+} __aligned(CSB_ALIGN);
+
+
+/* Chapter 6.5.10 Data-Descriptor List (DDL)
+ * each list contains one or more Data-Descriptor Entries (DDE)
+ */
+
+#define DDE_P			(0x8000)
+
+#define DDE_SIZE		(0x10)
+#define DDE_ALIGN		DDE_SIZE
+
+struct data_descriptor_entry {
+	__be16 flags;
+	u8 count;
+	u8 index;
+	__be32 length;
+	__be64 address;
+} __aligned(DDE_ALIGN);
+
+
+/* Chapter 6.5.2 Coprocessor-Request Block (CRB) */
+
+#define CRB_SIZE		(0x80)
+#define CRB_ALIGN		(0x100) /* Errata: requires 256 alignment */
+
+
+/* Coprocessor Status Block field
+ *   ADDRESS	address of CSB
+ *   C		CCB is valid
+ *   AT		0 = addrs are virtual, 1 = addrs are phys
+ *   M		enable perf monitor
+ */
+#define CRB_CSB_ADDRESS		(0xfffffffffffffff0)
+#define CRB_CSB_C		(0x0000000000000008)
+#define CRB_CSB_AT		(0x0000000000000002)
+#define CRB_CSB_M		(0x0000000000000001)
+
+struct coprocessor_request_block {
+	__be32 ccw;
+	__be32 flags;
+	__be64 csb_addr;
+
+	struct data_descriptor_entry source;
+	struct data_descriptor_entry target;
+
+	struct coprocessor_completion_block ccb;
+
+	u8 reserved[48];
+
+	struct coprocessor_status_block csb;
+} __aligned(CRB_ALIGN);
+
+#define crb_csb_addr(c)         __be64_to_cpu(c->csb_addr)
+#define crb_nx_fault_addr(c)    __be64_to_cpu(c->stamp.nx.fault_storage_addr)
+#define crb_nx_flags(c)         c->stamp.nx.flags
+#define crb_nx_fault_status(c)  c->stamp.nx.fault_status
+#define crb_nx_pswid(c)		c->stamp.nx.pswid
+
+
+/* RFC02167 Initiate Coprocessor Instructions document
+ * Chapter 8.2.1.1.1 RS
+ * Chapter 8.2.3 Coprocessor Directive
+ * Chapter 8.2.4 Execution
+ *
+ * The CCW must be converted to BE before passing to icswx()
+ */
+
+#define CCW_PS                  (0xff000000)
+#define CCW_CT                  (0x00ff0000)
+#define CCW_CD                  (0x0000ffff)
+#define CCW_CL                  (0x0000c000)
+
+#endif
diff --git a/tools/testing/selftests/powerpc/nx-gzip/inc/nx-gzip.h b/tools/testing/selftests/powerpc/nx-gzip/inc/nx-gzip.h
new file mode 100644
index 000000000000..75482c45574d
--- /dev/null
+++ b/tools/testing/selftests/powerpc/nx-gzip/inc/nx-gzip.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright 2020 IBM Corp.
+ *
+ */
+
+#ifndef _UAPI_MISC_VAS_H
+#define _UAPI_MISC_VAS_H
+
+#include <asm/ioctl.h>
+
+#define VAS_FLAGS_PIN_WINDOW	0x1
+#define VAS_FLAGS_HIGH_PRI	0x2
+
+#define VAS_FTW_SETUP		_IOW('v', 1, struct vas_gzip_setup_attr)
+#define VAS_842_TX_WIN_OPEN	_IOW('v', 2, struct vas_gzip_setup_attr)
+#define VAS_GZIP_TX_WIN_OPEN	_IOW('v', 0x20, struct vas_gzip_setup_attr)
+
+struct vas_gzip_setup_attr {
+	int32_t		version;
+	int16_t		vas_id;
+	int16_t		reserved1;
+	int64_t		flags;
+	int64_t		reserved2[6];
+};
+
+#endif /* _UAPI_MISC_VAS_H */
diff --git a/tools/testing/selftests/powerpc/nx-gzip/inc/nx-helpers.h b/tools/testing/selftests/powerpc/nx-gzip/inc/nx-helpers.h
new file mode 100644
index 000000000000..e0d68914c941
--- /dev/null
+++ b/tools/testing/selftests/powerpc/nx-gzip/inc/nx-helpers.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#include <sys/time.h>
+#include <asm/byteorder.h>
+#include <stdint.h>
+#include <stdbool.h>
+#include "crb.h"
+
+#define cpu_to_be32		__cpu_to_be32
+#define cpu_to_be64		__cpu_to_be64
+#define be32_to_cpu		__be32_to_cpu
+#define be64_to_cpu		__be64_to_cpu
+
+/*
+ * Several helpers/macros below were copied from the tree
+ * (kernel.h, nx-842.h, nx-ftw.h, asm-compat.h etc)
+ */
+
+/* from kernel.h */
+#define IS_ALIGNED(x, a)	(((x) & ((typeof(x))(a) - 1)) == 0)
+#define __round_mask(x, y)	((__typeof__(x))((y)-1))
+#define round_up(x, y)		((((x)-1) | __round_mask(x, y))+1)
+#define round_down(x, y)	((x) & ~__round_mask(x, y))
+
+#define min_t(t, x, y)	((x) < (y) ? (x) : (y))
+/*
+ * Get/Set bit fields. (from nx-842.h)
+ */
+#define GET_FIELD(m, v)         (((v) & (m)) >> MASK_LSH(m))
+#define MASK_LSH(m)             (__builtin_ffsl(m) - 1)
+#define SET_FIELD(m, v, val)    \
+		(((v) & ~(m)) | ((((typeof(v))(val)) << MASK_LSH(m)) & (m)))
+
+/* From asm-compat.h */
+#define __stringify_in_c(...)	#__VA_ARGS__
+#define stringify_in_c(...)	__stringify_in_c(__VA_ARGS__) " "
+
+#define	pr_debug
+#define	pr_debug_ratelimited	printf
+#define	pr_err			printf
+#define	pr_err_ratelimited	printf
+
+#define WARN_ON_ONCE(x)		do {if (x) \
+				printf("WARNING: %s:%d\n", __func__, __LINE__)\
+				} while (0)
+
+extern void dump_buffer(char *msg, char *buf, int len);
+extern void *alloc_aligned_mem(int len, int align, char *msg);
+extern void get_payload(char *buf, int len);
+extern void time_add(struct timeval *in, int seconds, struct timeval *out);
+
+extern bool time_after(struct timeval *a, struct timeval *b);
+extern long time_delta(struct timeval *a, struct timeval *b);
+extern void dump_dde(struct data_descriptor_entry *dde, char *msg);
+extern void copy_paste_crb_data(struct coprocessor_request_block *crb);
diff --git a/tools/testing/selftests/powerpc/nx-gzip/inc/nx.h b/tools/testing/selftests/powerpc/nx-gzip/inc/nx.h
new file mode 100644
index 000000000000..1ae8348b59d6
--- /dev/null
+++ b/tools/testing/selftests/powerpc/nx-gzip/inc/nx.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright 2020 IBM Corp.
+ *
+ */
+#ifndef _NX_H
+#define _NX_H
+
+#include <stdbool.h>
+
+#define	NX_FUNC_COMP_842	1
+#define NX_FUNC_COMP_GZIP	2
+
+#ifndef __aligned
+#define __aligned(x)	__attribute__((aligned(x)))
+#endif
+
+struct nx842_func_args {
+	bool use_crc;
+	bool decompress;		/* true decompress; false compress */
+	bool move_data;
+	int timeout;			/* seconds */
+};
+
+struct nxbuf_t {
+	int len;
+	char *buf;
+};
+
+/* @function should be EFT (aka 842), GZIP etc */
+extern void *nx_function_begin(int function, int pri);
+
+extern int nx_function(void *handle, struct nxbuf_t *in, struct nxbuf_t *out,
+			void *arg);
+
+extern int nx_function_end(void *handle);
+
+#endif	/* _NX_H */
-- 
2.21.0

