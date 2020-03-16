Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8B61872E1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 19:58:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48h5Df0XhpzDqHx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 05:58:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=rzinsly@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48h46L2qySzDqSp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 05:08:06 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02GI5qnr078739; Mon, 16 Mar 2020 14:07:53 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yrt3472n4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Mar 2020 14:07:53 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02GI4geP003117;
 Mon, 16 Mar 2020 18:07:53 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03wdc.us.ibm.com with ESMTP id 2yrpw61x9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Mar 2020 18:07:53 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02GI7qwk47841748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Mar 2020 18:07:52 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DB73AE064;
 Mon, 16 Mar 2020 18:07:52 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C350FAE05C;
 Mon, 16 Mar 2020 18:07:51 +0000 (GMT)
Received: from localhost (unknown [9.85.153.64])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 16 Mar 2020 18:07:51 +0000 (GMT)
From: Raphael Moreira Zinsly <rzinsly@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org
Subject: [PATCH 2/5] selftests/powerpc: Add header files for NX
 compresion/decompression
Date: Mon, 16 Mar 2020 15:07:11 -0300
Message-Id: <20200316180714.18631-3-rzinsly@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200316180714.18631-1-rzinsly@linux.ibm.com>
References: <20200316180714.18631-1-rzinsly@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-16_08:2020-03-12,
 2020-03-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 mlxscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003160078
X-Mailman-Approved-At: Tue, 17 Mar 2020 05:51:00 +1100
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
Cc: Raphael Moreira Zinsly <rzinsly@linux.ibm.com>, haren@linux.ibm.com,
 herbert@gondor.apana.org.au, abali@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add files to be able to compress and decompress files using the
powerpc NX-GZIP engine.

Signed-off-by: Bulent Abali <abali@us.ibm.com>
Signed-off-by: Raphael Moreira Zinsly <rzinsly@linux.ibm.com>
---
 .../powerpc/nx-gzip/inc/copy-paste.h          |  54 ++
 .../selftests/powerpc/nx-gzip/inc/nx_dbg.h    |  95 +++
 .../selftests/powerpc/nx-gzip/inc/nxu.h       | 644 ++++++++++++++++++
 3 files changed, 793 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/inc/copy-paste.h
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/inc/nx_dbg.h
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/inc/nxu.h

diff --git a/tools/testing/selftests/powerpc/nx-gzip/inc/copy-paste.h b/tools/testing/selftests/powerpc/nx-gzip/inc/copy-paste.h
new file mode 100644
index 000000000000..107139b6c7df
--- /dev/null
+++ b/tools/testing/selftests/powerpc/nx-gzip/inc/copy-paste.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include "nx-helpers.h"
+
+/*
+ * Macros taken from arch/powerpc/include/asm/ppc-opcode.h and other
+ * header files.
+ */
+#define ___PPC_RA(a)    (((a) & 0x1f) << 16)
+#define ___PPC_RB(b)    (((b) & 0x1f) << 11)
+
+#define PPC_INST_COPY                   0x7c20060c
+#define PPC_INST_PASTE                  0x7c20070d
+
+#define PPC_COPY(a, b)          stringify_in_c(.long PPC_INST_COPY | \
+						___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_PASTE(a, b)         stringify_in_c(.long PPC_INST_PASTE | \
+						___PPC_RA(a) | ___PPC_RB(b))
+#define CR0_SHIFT	28
+#define CR0_MASK	0xF
+/*
+ * Copy/paste instructions:
+ *
+ *	copy RA,RB
+ *		Copy contents of address (RA) + effective_address(RB)
+ *		to internal copy-buffer.
+ *
+ *	paste RA,RB
+ *		Paste contents of internal copy-buffer to the address
+ *		(RA) + effective_address(RB)
+ */
+static inline int vas_copy(void *crb, int offset)
+{
+	asm volatile(PPC_COPY(%0, %1)";"
+		:
+		: "b" (offset), "b" (crb)
+		: "memory");
+
+	return 0;
+}
+
+static inline int vas_paste(void *paste_address, int offset)
+{
+	u32 cr;
+
+	cr = 0;
+	asm volatile(PPC_PASTE(%1, %2)";"
+		"mfocrf %0, 0x80;"
+		: "=r" (cr)
+		: "b" (offset), "b" (paste_address)
+		: "memory", "cr0");
+
+	return (cr >> CR0_SHIFT) & CR0_MASK;
+}
diff --git a/tools/testing/selftests/powerpc/nx-gzip/inc/nx_dbg.h b/tools/testing/selftests/powerpc/nx-gzip/inc/nx_dbg.h
new file mode 100644
index 000000000000..f2c0eee2317e
--- /dev/null
+++ b/tools/testing/selftests/powerpc/nx-gzip/inc/nx_dbg.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright 2020 IBM Corporation
+ *
+ */
+
+#ifndef _NXU_DBG_H_
+#define _NXU_DBG_H_
+
+#include <sys/file.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <time.h>
+#include <pthread.h>
+
+extern FILE * nx_gzip_log;
+extern int nx_gzip_trace;
+extern unsigned int nx_gzip_inflate_impl;
+extern unsigned int nx_gzip_deflate_impl;
+extern unsigned int nx_gzip_inflate_flags;
+extern unsigned int nx_gzip_deflate_flags;
+
+extern int nx_dbg;
+pthread_mutex_t mutex_log;
+
+#define nx_gzip_trace_enabled()       (nx_gzip_trace & 0x1)
+#define nx_gzip_hw_trace_enabled()    (nx_gzip_trace & 0x2)
+#define nx_gzip_sw_trace_enabled()    (nx_gzip_trace & 0x4)
+#define nx_gzip_gather_statistics()   (nx_gzip_trace & 0x8)
+#define nx_gzip_per_stream_stat()     (nx_gzip_trace & 0x10)
+
+#define prt(fmt, ...) do { \
+	pthread_mutex_lock(&mutex_log);					\
+	flock(nx_gzip_log->_fileno, LOCK_EX);				\
+	time_t t; struct tm *m; time(&t); m = localtime(&t);		\
+	fprintf(nx_gzip_log, "[%04d/%02d/%02d %02d:%02d:%02d] "		\
+		"pid %d: " fmt,	\
+		(int)m->tm_year + 1900, (int)m->tm_mon+1, (int)m->tm_mday, \
+		(int)m->tm_hour, (int)m->tm_min, (int)m->tm_sec,	\
+		(int)getpid(), ## __VA_ARGS__);				\
+	fflush(nx_gzip_log);						\
+	flock(nx_gzip_log->_fileno, LOCK_UN);				\
+	pthread_mutex_unlock(&mutex_log);				\
+} while (0)
+
+/* Use in case of an error */
+#define prt_err(fmt, ...) do { if (nx_dbg >= 0) {			\
+	prt("%s:%u: Error: "fmt,					\
+		__FILE__, __LINE__, ## __VA_ARGS__);			\
+}} while (0)
+
+/* Use in case of an warning */
+#define prt_warn(fmt, ...) do {	if (nx_dbg >= 1) {			\
+	prt("%s:%u: Warning: "fmt,					\
+		__FILE__, __LINE__, ## __VA_ARGS__);			\
+}} while (0)
+
+/* Informational printouts */
+#define prt_info(fmt, ...) do {	if (nx_dbg >= 2) {			\
+	prt("Info: "fmt, ## __VA_ARGS__);				\
+}} while (0)
+
+/* Trace zlib wrapper code */
+#define prt_trace(fmt, ...) do { if (nx_gzip_trace_enabled()) {		\
+	prt("### "fmt, ## __VA_ARGS__);					\
+}} while (0)
+
+/* Trace statistics */
+#define prt_stat(fmt, ...) do {	if (nx_gzip_gather_statistics()) {	\
+	prt("### "fmt, ## __VA_ARGS__);					\
+}} while (0)
+
+/* Trace zlib hardware implementation */
+#define hw_trace(fmt, ...) do {						\
+		if (nx_gzip_hw_trace_enabled())				\
+			fprintf(nx_gzip_log, "hhh " fmt, ## __VA_ARGS__); \
+	} while (0)
+
+/* Trace zlib software implementation */
+#define sw_trace(fmt, ...) do {						\
+		if (nx_gzip_sw_trace_enabled())				\
+			fprintf(nx_gzip_log, "sss " fmt, ## __VA_ARGS__); \
+	} while (0)
+
+
+/**
+ * str_to_num - Convert string into number and copy with endings like
+ *              KiB for kilobyte
+ *              MiB for megabyte
+ *              GiB for gigabyte
+ */
+uint64_t str_to_num(char *str);
+void nx_lib_debug(int onoff);
+
+#endif	/* _NXU_DBG_H_ */
diff --git a/tools/testing/selftests/powerpc/nx-gzip/inc/nxu.h b/tools/testing/selftests/powerpc/nx-gzip/inc/nxu.h
new file mode 100644
index 000000000000..faa95ffc162a
--- /dev/null
+++ b/tools/testing/selftests/powerpc/nx-gzip/inc/nxu.h
@@ -0,0 +1,644 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Hardware interface of the NX-GZIP compression accelerator
+ *
+ * Copyright (C) IBM Corporation, 2020
+ *
+ * Author: Bulent Abali <abali@us.ibm.com>
+ *
+ */
+
+#ifndef _NXU_H
+#define _NXU_H
+
+#include <stdint.h>
+#include <endian.h>
+
+/* deflate */
+#define LLSZ   286
+#define DSZ    30
+
+/* nx */
+#define DHTSZ  18
+#define DHT_MAXSZ 288
+#define MAX_DDE_COUNT 256
+
+/* util */
+#ifdef NXDBG
+#define NXPRT(X) do { X; } while (0)
+#else
+#define NXPRT(X) do { ; } while (0)
+#endif
+
+#ifdef NXTIMER
+#include <sys/platform/ppc.h>
+#define NX_CLK(X)      do { X; } while (0)
+#define nx_get_time()  __ppc_get_timebase()
+#define nx_get_freq()  __ppc_get_timebase_freq()
+#else
+#define NX_CLK(X)      do { ; } while (0)
+#define nx_get_time()  (-1)
+#define nx_get_freq()  (-1)
+#endif
+
+/*
+ * Definitions of acronyms used here. See
+ * P9 NX Gzip Accelerator User's Manual for details
+ *
+ * adler/crc: 32 bit checksums appended to stream tail
+ * ce:       completion extension
+ * cpb:      coprocessor parameter block (metadata)
+ * crb:      coprocessor request block (command)
+ * csb:      coprocessor status block (status)
+ * dht:      dynamic huffman table
+ * dde:      data descriptor element (address, length)
+ * ddl:      list of ddes
+ * dh/fh:    dynamic and fixed huffman types
+ * fc:       coprocessor function code
+ * histlen:  history/dictionary length
+ * history:  sliding window of up to 32KB of data
+ * lzcount:  Deflate LZ symbol counts
+ * rembytecnt: remaining byte count
+ * sfbt:     source final block type; last block's type during decomp
+ * spbc:     source processed byte count
+ * subc:     source unprocessed bit count
+ * tebc:     target ending bit count; valid bits in the last byte
+ * tpbc:     target processed byte count
+ * vas:      virtual accelerator switch; the user mode interface
+ */
+
+typedef union {
+    uint32_t word[4];
+    uint64_t dword[2];
+} nx_qw_t __attribute__((aligned (16)));
+
+/*
+ * Note: NX registers with fewer than 32 bits are declared by
+ * convention as uint32_t variables in unions. If *_offset and *_mask
+ * are defined for a variable, then use get_ put_ macros to
+ * conveniently access the register fields for endian conversions.
+ */
+
+typedef struct {
+    /* Data Descriptor Element, Section 6.4 */
+    union {
+	uint32_t dde_count;
+	/* When dde_count == 0 ddead is a pointer to a data buffer;
+	 * ddebc is the buffer length bytes.
+	 * When dde_count > 0 dde is an indirect dde; ddead is a pointer
+	 * to a contiguous list of direct ddes; ddebc is the total length
+	 * of all data pointed to by the list of direct ddes.
+	 * Note that only one level of indirection is permitted.
+	 * See Section 6.4 of the user manual for additional details
+	 */
+    };
+    uint32_t ddebc; /* dde byte count */
+    uint64_t ddead; /* dde address */
+} nx_dde_t __attribute__((aligned (16)));
+
+typedef struct {
+    /* Coprocessor Status Block, Section 6.6  */
+    union {
+	uint32_t csb_v;
+	/* Valid bit. v must be set to 0 by the program
+	 * before submitting the coprocessor command.
+	 * Software can poll for the v bit
+	 */
+
+	uint32_t csb_f;
+	/* 16B CSB size. Written to 0 by DMA when it writes the CPB */
+
+	uint32_t csb_cs;
+	/* cs completion sequence; unused */
+
+	uint32_t csb_cc;
+	/* cc completion code; cc != 0 exception occurred */
+
+	uint32_t csb_ce;
+	/* ce completion extension */
+
+    };
+    uint32_t tpbc;
+    /* target processed byte count TPBC */
+
+    uint64_t fsaddr;
+    /* Section 6.12.1 CSB NonZero error summary.  FSA Failing storage
+     * address.  Address where error occurred. When available, written
+     * to A field of CSB
+     */
+} nx_csb_t __attribute__((aligned (16)));
+
+typedef struct {
+    /* Coprocessor Completion Block, Section 6.7 */
+
+    uint32_t reserved[3];
+    union {
+	/* When crb.c==0 (no ccb defined) it is reserved;
+	 * When crb.c==1 (ccb defined) it is cm
+	 */
+
+	uint32_t ccb_cm;
+	/* Signal interrupt of crb.c==1 and cm==1 */
+
+	uint32_t word;
+	/* generic access to the 32bit word */
+    };
+} nx_ccb_t __attribute__((aligned (16)));
+
+typedef struct {
+    /*
+     * CRB operand of the paste coprocessor instruction is stamped
+     * in quadword 4 with the information shown here as its written
+     * in to the receive FIFO of the coprocessor
+     */
+
+    union {
+	uint32_t vas_buf_num;
+	/* Verification only vas buffer number which correlates to
+	 * the low order bits of the atag in the paste command
+	 */
+
+	uint32_t send_wc_id;
+	/* Pointer to Send Window Context that provides for NX address
+	 * translation information, such as MSR and LPCR bits, job completion
+	 * interrupt RA, PSWID, and job utilization counter.
+	 */
+
+    };
+    union {
+	uint32_t recv_wc_id;
+	/* Pointer to Receive Window Context. NX uses this to return
+	 * credits to a Receive FIFO as entries are dequeued.
+	 */
+
+    };
+    uint32_t reserved2;
+    union {
+	uint32_t vas_invalid;
+	/* Invalid bit. If this bit is 1 the CRB is discarded by
+	 * NX upon fetching from the receive FIFO. If this bit is 0
+	 * the CRB is processed normally. The bit is stamped to 0
+	 * by VAS and may be written to 1 by hypervisor while
+	 * the CRB is in the receive FIFO (in memory).
+	 */
+
+    };
+} vas_stamped_crb_t;
+
+typedef struct {
+    /*
+     * A CRB that has a translation fault is stamped by NX in quadword 4
+     * and pasted to the Fault Send Window in VAS.
+     */
+    uint64_t fsa;
+    union {
+	uint32_t nxsf_t;
+	uint32_t nxsf_fs;
+    };
+    uint32_t pswid;
+} nx_stamped_fault_crb_t;
+
+typedef union {
+    vas_stamped_crb_t      vas;
+    nx_stamped_fault_crb_t nx;
+} stamped_crb_t;
+
+typedef struct {
+    /*
+     * Coprocessor Parameter Block In/Out are used to pass metadata
+     * to/from accelerator.  Tables 6.5 and 6.6 of the user manual.
+     */
+
+    /* CPBInput */
+
+    struct {
+	union {
+	    nx_qw_t qw0;
+	    struct {
+		uint32_t in_adler;            /* bits 0:31    */
+		uint32_t in_crc;              /* bits 32:63   */
+		union {
+		    uint32_t in_histlen;      /* bits 64:75   */
+		    uint32_t in_subc;         /* bits 93:95   */
+		};
+		union {
+		    uint32_t in_sfbt;         /* bits 108:111 */
+		    uint32_t in_rembytecnt;   /* bits 112:127 */
+		    uint32_t in_dhtlen;       /* bits 116:127 */
+		};
+	    };
+	};
+	union {
+	    nx_qw_t  in_dht[DHTSZ];           /* qw[1:18]     */
+	    char     in_dht_char[DHT_MAXSZ];  /* byte access  */
+	};
+	nx_qw_t  reserved[5];                 /* qw[19:23]    */
+    };
+
+    /* CPBOutput */
+
+    volatile struct {
+	union {
+	    nx_qw_t qw24;
+	    struct {
+		uint32_t out_adler;           /* bits 0:31  qw[24]   */
+		uint32_t out_crc;             /* bits 32:63 qw[24]   */
+		union {
+		    uint32_t out_tebc;        /* bits 77:79 qw[24]   */
+		    uint32_t out_subc;        /* bits 80:95 qw[24]   */
+		};
+		union {
+		    uint32_t out_sfbt;        /* bits 108:111 qw[24] */
+		    uint32_t out_rembytecnt;  /* bits 112:127 qw[24] */
+		    uint32_t out_dhtlen;      /* bits 116:127 qw[24] */
+		};
+	    };
+	};
+	union {
+	    nx_qw_t  qw25[79];              /* qw[25:103] */
+	    /* qw[25] compress no lzcounts or wrap */
+	    uint32_t out_spbc_comp_wrap;
+	    uint32_t out_spbc_wrap;         /* qw[25] wrap */
+	    uint32_t out_spbc_comp;         /* qw[25] compress no lzcounts */
+	    uint32_t out_lzcount[LLSZ+DSZ]; /* 286 LL and 30 D symbol counts */
+	    struct {
+		nx_qw_t  out_dht[DHTSZ];    /* qw[25:42] */
+		uint32_t out_spbc_decomp;   /* qw[43] decompress */
+	    };
+	};
+	/* qw[104] compress with lzcounts */
+	uint32_t out_spbc_comp_with_count;
+    };
+} nx_gzip_cpb_t  __attribute__((aligned (128)));
+
+typedef struct {
+    union {                   /* byte[0:3]   */
+	uint32_t gzip_fc;     /* bits[24-31] */
+    };
+    uint32_t reserved1;       /* byte[4:7]   */
+    union {
+	uint64_t csb_address; /* byte[8:15]  */
+	struct {
+	    uint32_t reserved2;
+	    union {
+		uint32_t crb_c;
+		/* c==0 no ccb defined */
+
+		uint32_t crb_at;
+		/* at==0 address type is ignored;
+		 * all addrs effective assumed.
+		 */
+
+	    };
+	};
+    };
+    nx_dde_t source_dde;           /* byte[16:31] */
+    nx_dde_t target_dde;           /* byte[32:47] */
+    volatile nx_ccb_t ccb;         /* byte[48:63] */
+    volatile union {
+	/* byte[64:239] shift csb by 128 bytes out of the crb; csb was in crb
+	 * earlier; JReilly says csb written with partial inject.
+	 */
+	nx_qw_t reserved64[11];
+	stamped_crb_t stamp;       /* byte[64:79] */
+    };
+    volatile nx_csb_t csb;
+} nx_gzip_crb_t __attribute__((aligned (128)));
+
+
+typedef struct {
+    nx_gzip_crb_t crb;
+    nx_gzip_cpb_t cpb;
+} nx_gzip_crb_cpb_t __attribute__((aligned (2048)));
+
+
+/*
+ * NX hardware convention has the msb bit on the left numbered 0.
+ * The defines below has *_offset defined as the right most bit
+ * position of a field.  x of size_mask(x) is the field width in bits.
+ */
+
+#define size_mask(x)          ((1U<<(x))-1)
+
+/*
+ * Offsets and Widths within the containing 32 bits of the various NX
+ * gzip hardware registers.  Use the getnn/putnn macros to access
+ * these regs
+ */
+
+#define dde_count_mask        size_mask(8)
+#define dde_count_offset      23
+
+/* CSB */
+
+#define csb_v_mask            size_mask(1)
+#define csb_v_offset          0
+#define csb_f_mask            size_mask(1)
+#define csb_f_offset          6
+#define csb_cs_mask           size_mask(8)
+#define csb_cs_offset         15
+#define csb_cc_mask           size_mask(8)
+#define csb_cc_offset         23
+#define csb_ce_mask           size_mask(8)
+#define csb_ce_offset         31
+
+/* CCB */
+
+#define ccb_cm_mask           size_mask(3)
+#define ccb_cm_offset         31
+
+/* VAS stamped CRB fields */
+
+#define vas_buf_num_mask      size_mask(6)
+#define vas_buf_num_offset    5
+#define send_wc_id_mask       size_mask(16)
+#define send_wc_id_offset     31
+#define recv_wc_id_mask       size_mask(16)
+#define recv_wc_id_offset     31
+#define vas_invalid_mask      size_mask(1)
+#define vas_invalid_offset    31
+
+/* NX stamped fault CRB fields */
+
+#define nxsf_t_mask           size_mask(1)
+#define nxsf_t_offset         23
+#define nxsf_fs_mask          size_mask(8)
+#define nxsf_fs_offset        31
+
+/* CPB input */
+
+#define in_histlen_mask       size_mask(12)
+#define in_histlen_offset     11
+#define in_dhtlen_mask        size_mask(12)
+#define in_dhtlen_offset      31
+#define in_subc_mask          size_mask(3)
+#define in_subc_offset        31
+#define in_sfbt_mask          size_mask(4)
+#define in_sfbt_offset        15
+#define in_rembytecnt_mask    size_mask(16)
+#define in_rembytecnt_offset  31
+
+/* CPB output */
+
+#define out_tebc_mask         size_mask(3)
+#define out_tebc_offset       15
+#define out_subc_mask         size_mask(16)
+#define out_subc_offset       31
+#define out_sfbt_mask         size_mask(4)
+#define out_sfbt_offset       15
+#define out_rembytecnt_mask   size_mask(16)
+#define out_rembytecnt_offset 31
+#define out_dhtlen_mask       size_mask(12)
+#define out_dhtlen_offset     31
+
+/* CRB */
+
+#define gzip_fc_mask          size_mask(8)
+#define gzip_fc_offset        31
+#define crb_c_mask            size_mask(1)
+#define crb_c_offset          28
+#define crb_at_mask           size_mask(1)
+#define crb_at_offset         30
+#define csb_address_mask      ~(15UL) /* mask off bottom 4b */
+
+/*
+ * Access macros for the registers.  Do not access registers directly
+ * because of the endian conversion.  P9 processor may run either as
+ * Little or Big endian. However the NX coprocessor regs are always
+ * big endian.
+ * Use the 32 and 64b macros to access respective
+ * register sizes.
+ * Use nn forms for the register fields shorter than 32 bits.
+ */
+
+#define getnn(ST, REG)      ((be32toh(ST.REG) >> (31-REG##_offset)) \
+				 & REG##_mask)
+#define getpnn(ST, REG)     ((be32toh((ST)->REG) >> (31-REG##_offset)) \
+				 & REG##_mask)
+#define get32(ST, REG)      (be32toh(ST.REG))
+#define getp32(ST, REG)     (be32toh((ST)->REG))
+#define get64(ST, REG)      (be64toh(ST.REG))
+#define getp64(ST, REG)     (be64toh((ST)->REG))
+
+#define unget32(ST, REG)    (get32(ST, REG) & ~((REG##_mask) \
+				<< (31-REG##_offset)))
+/* get 32bits less the REG field */
+
+#define ungetp32(ST, REG)   (getp32(ST, REG) & ~((REG##_mask) \
+				<< (31-REG##_offset)))
+/* get 32bits less the REG field */
+
+#define clear_regs(ST)      do { memset((void *)(&(ST)), 0, sizeof(ST)); \
+				} while (0)
+#define clear_dde(ST)       do { ST.dde_count = ST.ddebc = 0; ST.ddead = 0; \
+				} while (0)
+#define clearp_dde(ST)      do { (ST)->dde_count = (ST)->ddebc = 0; \
+				 (ST)->ddead = 0; \
+				} while (0)
+#define clear_struct(ST)    do { memset((void *)(&(ST)), 0, sizeof(ST)); \
+				} while (0)
+
+#define putnn(ST, REG, X)   do { ST.REG = htobe32(unget32(ST, REG) | (((X) \
+				 & REG##_mask) << (31-REG##_offset))); \
+				} while (0)
+#define putpnn(ST, REG, X)  do { (ST)->REG = htobe32(ungetp32(ST, REG) \
+				| (((X) & REG##_mask) << (31-REG##_offset))); \
+				} while (0)
+
+#define put32(ST, REG, X)   do { ST.REG = htobe32(X); } while (0)
+#define putp32(ST, REG, X)  do { (ST)->REG = htobe32(X); } while (0)
+#define put64(ST, REG, X)   do { ST.REG = htobe64(X); } while (0)
+#define putp64(ST, REG, X)  do { (ST)->REG = htobe64(X); } while (0)
+
+/*
+ * Completion extension ce(0) ce(1) ce(2).  Bits ce(3-7)
+ * unused.  Section 6.6 Figure 6.7.
+ */
+
+#define get_csb_ce(ST) ((uint32_t)getnn(ST, csb_ce))
+#define get_csb_ce_ms3b(ST) (get_csb_ce(ST) >> 5)
+#define put_csb_ce_ms3b(ST, X) do { putnn(ST, csb_ce, ((uint32_t)(X) << 5)); \
+				   } while (0)
+
+#define CSB_CE_PARTIAL         0x4
+#define CSB_CE_TERMINATE       0x2
+#define CSB_CE_TPBC_VALID      0x1
+
+#define csb_ce_termination(X)         (!!((X) & CSB_CE_TERMINATE))
+/* termination, output buffers may be modified, SPBC/TPBC invalid Fig.6-7 */
+
+#define csb_ce_check_completion(X)    (!csb_ce_termination(X))
+/* if not terminated then check full or partial completion */
+
+#define csb_ce_partial_completion(X)  (!!((X) & CSB_CE_PARTIAL))
+#define csb_ce_full_completion(X)     (!csb_ce_partial_completion(X))
+#define csb_ce_tpbc_valid(X)          (!!((X) & CSB_CE_TPBC_VALID))
+/* TPBC indicates successfully stored data count */
+
+#define csb_ce_default_err(X)         csb_ce_termination(X)
+/* most error CEs have CE(0)=0 and CE(1)=1 */
+
+#define csb_ce_cc3_partial(X)         csb_ce_partial_completion(X)
+/* some CC=3 are partially completed, Table 6-8 */
+
+#define csb_ce_cc64(X)                ((X)&(CSB_CE_PARTIAL \
+					| CSB_CE_TERMINATE) == 0)
+/* Compression: when TPBC>SPBC then CC=64 Table 6-8; target didn't
+ * compress smaller than source.
+ */
+
+/* Decompress SFBT combinations Tables 5-3, 6-4, 6-6 */
+
+#define SFBT_BFINAL 0x1
+#define SFBT_LIT    0x4
+#define SFBT_FHT    0x5
+#define SFBT_DHT    0x6
+#define SFBT_HDR    0x7
+
+/*
+ * NX gzip function codes. Table 6.2.
+ * Bits 0:4 are the FC. Bit 5 is used by the DMA controller to
+ * select one of the two Byte Count Limits.
+ */
+
+#define GZIP_FC_LIMIT_MASK                               0x01
+#define GZIP_FC_COMPRESS_FHT                             0x00
+#define GZIP_FC_COMPRESS_DHT                             0x02
+#define GZIP_FC_COMPRESS_FHT_COUNT                       0x04
+#define GZIP_FC_COMPRESS_DHT_COUNT                       0x06
+#define GZIP_FC_COMPRESS_RESUME_FHT                      0x08
+#define GZIP_FC_COMPRESS_RESUME_DHT                      0x0a
+#define GZIP_FC_COMPRESS_RESUME_FHT_COUNT                0x0c
+#define GZIP_FC_COMPRESS_RESUME_DHT_COUNT                0x0e
+#define GZIP_FC_DECOMPRESS                               0x10
+#define GZIP_FC_DECOMPRESS_SINGLE_BLK_N_SUSPEND          0x12
+#define GZIP_FC_DECOMPRESS_RESUME                        0x14
+#define GZIP_FC_DECOMPRESS_RESUME_SINGLE_BLK_N_SUSPEND   0x16
+#define GZIP_FC_WRAP                                     0x1e
+
+#define fc_is_compress(fc)  (((fc) & 0x10) == 0)
+#define fc_has_count(fc)    (fc_is_compress(fc) && (((fc) & 0x4) != 0))
+
+/* CSB.CC Error codes */
+
+#define ERR_NX_OK             0
+#define ERR_NX_ALIGNMENT      1
+#define ERR_NX_OPOVERLAP      2
+#define ERR_NX_DATA_LENGTH    3
+#define ERR_NX_TRANSLATION    5
+#define ERR_NX_PROTECTION     6
+#define ERR_NX_EXTERNAL_UE7   7
+#define ERR_NX_INVALID_OP     8
+#define ERR_NX_PRIVILEGE      9
+#define ERR_NX_INTERNAL_UE   10
+#define ERR_NX_EXTERN_UE_WR  12
+#define ERR_NX_TARGET_SPACE  13
+#define ERR_NX_EXCESSIVE_DDE 14
+#define ERR_NX_TRANSL_WR     15
+#define ERR_NX_PROTECT_WR    16
+#define ERR_NX_SUBFUNCTION   17
+#define ERR_NX_FUNC_ABORT    18
+#define ERR_NX_BYTE_MAX      19
+#define ERR_NX_CORRUPT_CRB   20
+#define ERR_NX_INVALID_CRB   21
+#define ERR_NX_INVALID_DDE   30
+#define ERR_NX_SEGMENTED_DDL 31
+#define ERR_NX_DDE_OVERFLOW  33
+#define ERR_NX_TPBC_GT_SPBC  64
+#define ERR_NX_MISSING_CODE  66
+#define ERR_NX_INVALID_DIST  67
+#define ERR_NX_INVALID_DHT   68
+#define ERR_NX_EXTERNAL_UE90 90
+#define ERR_NX_WDOG_TIMER   224
+#define ERR_NX_AT_FAULT     250
+#define ERR_NX_INTR_SERVER  252
+#define ERR_NX_UE253        253
+#define ERR_NX_NO_HW        254
+#define ERR_NX_HUNG_OP      255
+#define ERR_NX_END          256
+
+/* initial values for non-resume operations */
+#define INIT_CRC   0  /* crc32(0L, Z_NULL, 0) */
+#define INIT_ADLER 1  /* adler32(0L, Z_NULL, 0)  adler is initalized to 1 */
+
+/* prototypes */
+#ifdef NX_JOB_CALLBACK
+int nxu_run_job(nx_gzip_crb_cpb_t *c, void *handle,
+		int (*callback)(const void *));
+#else
+int nxu_run_job(nx_gzip_crb_cpb_t *c, void *handle);
+#endif
+
+
+/* caller supplies a print buffer 4*sizeof(crb) */
+
+char *nx_crb_str(nx_gzip_crb_t *crb, char *prbuf);
+char *nx_cpb_str(nx_gzip_cpb_t *cpb, char *prbuf);
+char *nx_prt_hex(void *cp, int sz, char *prbuf);
+char *nx_lzcount_str(nx_gzip_cpb_t *cpb, char *prbuf);
+char *nx_strerror(int e);
+
+#ifdef NX_SIM
+#include <stdio.h>
+int nx_sim_init(void *ctx);
+int nx_sim_end(void *ctx);
+int nxu_run_sim_job(nx_gzip_crb_cpb_t *c, void *ctx);
+#endif /* NX_SIM */
+
+/* Deflate stream manipulation */
+
+#define set_final_bit(x) do { x |= (unsigned char)1; } while (0)
+#define clr_final_bit(x) do { x &= ~(unsigned char)1; } while (0)
+
+#define append_empty_fh_blk(p, b) do { *(p) = (2 | (1&(b))); *((p)+1) = 0; \
+				    } while (0)
+/* append 10 bits 0000001b 00...... ;
+ * assumes appending starts on a byte boundary; b is the final bit.
+ */
+
+
+#ifdef NX_842
+
+/* 842 Engine */
+
+typedef struct {
+    union {                   /* byte[0:3]   */
+	uint32_t eft_fc;      /* bits[29-31] */
+    };
+    uint32_t reserved1;       /* byte[4:7]   */
+    union {
+	uint64_t csb_address; /* byte[8:15]  */
+	struct {
+	    uint32_t reserved2;
+	    union {
+		uint32_t crb_c;
+		/* c==0 no ccb defined */
+
+		uint32_t crb_at;
+		/* at==0 address type is ignored;
+		   all addrs effective assumed */
+
+	    };
+	};
+    };
+    nx_dde_t source_dde;           /* byte[16:31] */
+    nx_dde_t target_dde;           /* byte[32:47] */
+    nx_ccb_t ccb;                  /* byte[48:63] */
+    union {
+	nx_qw_t reserved64[3];     /* byte[64:96] */
+    };
+    nx_csb_t csb;
+} nx_eft_crb_t __attribute__((aligned (128)));
+
+/* 842 CRB */
+
+#define EFT_FC_MASK                 size_mask(3)
+#define EFT_FC_OFFSET               31
+#define EFT_FC_COMPRESS             0x0
+#define EFT_FC_COMPRESS_WITH_CRC    0x1
+#define EFT_FC_DECOMPRESS           0x2
+#define EFT_FC_DECOMPRESS_WITH_CRC  0x3
+#define EFT_FC_BLK_DATA_MOVE        0x4
+#endif /* NX_842 */
+
+#endif /* _NXU_H */
-- 
2.21.0

