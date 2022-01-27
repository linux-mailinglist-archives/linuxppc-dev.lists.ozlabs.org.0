Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 674E949DB5B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 08:23:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JksWq1vkrz3ckF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 18:23:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tXg4b+wB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tXg4b+wB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JksSx1Xd1z306f
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 18:21:05 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20R5a8dK026059; 
 Thu, 27 Jan 2022 07:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=IE7rIz2yiNXqAx8d1eYveCgHBiyI0neKQdvJCN2OTaA=;
 b=tXg4b+wBfQhrd4D2yMQGWgcqrnBOrzElp0yAu3QdCjEZnfje0sYAX07vBbQP5mJ0WoqK
 OTy9O48VFMVXRCw4JoXHXhgvF/KQgjUglfv3OKTxeJTGn0rJBeABEBfM8v2CDW6VoA0A
 SmEAw2tiQzQRUwhKTW3jrDnrqqd5EnvTJC4UNkzXMEpWR6Ly2I6z7llV1XMvlfVPpZjX
 Xet+S731BN4kwAo1N6qHBQed57n8ypXsOCJmlOQaZ5c529YftZ/r9KM3CHCDOYqtZhqF
 1QP8ayP2bTBW9Df7yaremjwVqSC98K5vRJi1poKHZeWrG5bfG5a91GS2cLT96EWGyF+X jA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dumkutrw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:01 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20R783Hw016013;
 Thu, 27 Jan 2022 07:20:59 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3dr9j9mn3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:20:58 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20R7Ktid42271164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 07:20:55 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9857742045;
 Thu, 27 Jan 2022 07:20:55 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C85C4203F;
 Thu, 27 Jan 2022 07:20:53 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.106.251])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jan 2022 07:20:53 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 03/20] selftest/powerpc/pmu: Add macros to parse event codes
Date: Thu, 27 Jan 2022 12:49:55 +0530
Message-Id: <20220127072012.662451-4-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127072012.662451-1-kjain@linux.ibm.com>
References: <20220127072012.662451-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J-a2JgT0uS4jhUEts7eSNEX34SYJ_jMR
X-Proofpoint-ORIG-GUID: J-a2JgT0uS4jhUEts7eSNEX34SYJ_jMR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_01,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270036
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
Cc: atrajeev@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com,
 maddy@linux.vnet.ibm.com, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Madhavan Srinivasan <maddy@linux.ibm.com>

Each platform has raw event encoding format which specifies
the bit positions for different fields. The fields from event
code gets translated into performance monitoring mode control
register (MMCRx) settings. Patch add macros to extract individual
fields from the event code.

Patch adds function for sanity checks, since testcases currently
are only supported in power9 and power10.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 .../powerpc/pmu/sampling_tests/misc.c         | 227 ++++++++++++++++++
 .../powerpc/pmu/sampling_tests/misc.h         |  50 ++++
 2 files changed, 277 insertions(+)

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
index 4779b107f43b..fcd139c95971 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright 2022, Athira Rajeev, IBM Corp.
+ * Copyright 2022, Madhavan Srinivasan, IBM Corp.
  */
 
 #include <unistd.h>
@@ -16,6 +17,232 @@
 
 #define PAGE_SIZE               sysconf(_SC_PAGESIZE)
 
+/* Storage for platform version */
+int pvr, pvr_dd;
+u64 platform_extended_mask;
+int pSeries;
+
+/* Mask and Shift for Event code fields */
+int ev_mask_pmcxsel, ev_shift_pmcxsel;		//pmcxsel field
+int ev_mask_marked, ev_shift_marked;		//marked filed
+int ev_mask_comb, ev_shift_comb;		//combine field
+int ev_mask_unit, ev_shift_unit;		//unit field
+int ev_mask_pmc, ev_shift_pmc;			//pmc field
+int ev_mask_cache, ev_shift_cache;		//Cache sel field
+int ev_mask_sample, ev_shift_sample;		//Random sampling field
+int ev_mask_thd_sel, ev_shift_thd_sel;		//thresh_sel field
+int ev_mask_thd_start, ev_shift_thd_start;	//thresh_start field
+int ev_mask_thd_stop, ev_shift_thd_stop;	//thresh_stop field
+int ev_mask_thd_cmp, ev_shift_thd_cmp;		//thresh cmp field
+int ev_mask_sm, ev_shift_sm;			//SDAR mode field
+int ev_mask_rsq, ev_shift_rsq;			//radix scope qual field
+int ev_mask_l2l3, ev_shift_l2l3;		//l2l3 sel field
+int ev_mask_mmcr3_src, ev_shift_mmcr3_src;	//mmcr3 field
+
+static void init_ev_encodes(void)
+{
+	ev_mask_pmcxsel = 0xff;
+	ev_shift_pmcxsel = 0;
+	ev_mask_marked = 1;
+	ev_shift_marked = 8;
+	ev_mask_unit = 0xf;
+	ev_shift_unit = 12;
+	ev_mask_pmc = 0xf;
+	ev_shift_pmc = 16;
+	ev_mask_sample	= 0x1f;
+	ev_shift_sample = 24;
+	ev_mask_thd_sel = 0x7;
+	ev_shift_thd_sel = 29;
+	ev_mask_thd_start = 0xf;
+	ev_shift_thd_start = 36;
+	ev_mask_thd_stop = 0xf;
+	ev_shift_thd_stop = 32;
+
+	switch (pvr) {
+	case POWER10:
+		ev_mask_rsq = 1;
+		ev_shift_rsq = 9;
+		ev_mask_comb = 3;
+		ev_shift_comb = 10;
+		ev_mask_cache = 3;
+		ev_shift_cache = 20;
+		ev_mask_sm = 0x3;
+		ev_shift_sm = 22;
+		ev_mask_l2l3 = 0x1f;
+		ev_shift_l2l3 = 40;
+		ev_mask_mmcr3_src = 0x7fff;
+		ev_shift_mmcr3_src = 45;
+		break;
+	case POWER9:
+		ev_mask_comb = 3;
+		ev_shift_comb = 10;
+		ev_mask_cache = 0xf;
+		ev_shift_cache = 20;
+		ev_mask_thd_cmp = 0x3ff;
+		ev_shift_thd_cmp = 40;
+		ev_mask_sm = 0x3;
+		ev_shift_sm = 50;
+		break;
+	default:
+		FAIL_IF_EXIT(1);
+	}
+}
+
+static int __get_pvr(int flg)
+{
+	FILE *fd;
+	char *buf = NULL, *search_string = "revision", tmp[4];
+	size_t len = 0;
+	int ret = -1;
+
+	fd = fopen("/proc/cpuinfo", "r");
+	if (!fd)
+		return -1;
+
+	/* get to the line that matters */
+	while (getline(&buf, &len, fd) > 0) {
+		ret = strncmp(buf, search_string, strlen(search_string));
+		if (!ret)
+			break;
+	}
+
+	switch (flg) {
+	case 1: /* get processor version number */
+		/* seek to pvr hex values within the line */
+		while (*buf++ != '(')
+			; /* nothing to run */
+		buf += 5;
+		strncpy(tmp, buf, 3);
+
+		fclose(fd);
+		return strtol(tmp, NULL, 16);
+
+	case 2: /* get processor major revision number */
+		/* seek to pvr hex values within the line */
+		while (*buf++ != ':')
+			; /* nothing to run */
+		strncpy(tmp, buf, 3);
+
+		fclose(fd);
+		return (int)strtof(tmp, NULL);
+	default:
+		return -1;
+	}
+}
+
+static int init_platform(void)
+{
+	FILE *fd;
+	char *buf = NULL, *search_string = "pSeries", *sim = "Mambo", *ptr;
+	size_t len = 0;
+
+	fd = fopen("/proc/cpuinfo", "r");
+	if (!fd)
+		return -1;
+
+	/* check for sim (like mambo) */
+	while (getline(&buf, &len, fd) > 0) {
+		ptr = strstr(buf, sim);
+		if (ptr)
+			return -1;
+	}
+
+	fseek(fd, 0, SEEK_SET);
+
+	/* get to the line that matters */
+	while (getline(&buf, &len, fd) > 0) {
+		ptr = strstr(buf, search_string);
+		if (ptr) {
+			pSeries = 1;
+			break;
+		}
+	}
+
+	fclose(fd);
+	return 0;
+}
+
+static int get_ver(void)
+{
+	return __get_pvr(1);
+}
+
+static int get_rev_maj(void)
+{
+	return __get_pvr(2);
+}
+
+/* Return the extended regs mask value */
+static u64 perf_get_platform_reg_mask(void)
+{
+	if (have_hwcap2(PPC_FEATURE2_ARCH_3_1))
+		return PERF_POWER10_MASK;
+	if (have_hwcap2(PPC_FEATURE2_ARCH_3_00))
+		return PERF_POWER9_MASK;
+
+	return -1;
+}
+
+int check_extended_regs_support(void)
+{
+	int fd;
+	struct event event;
+
+	event_init(&event, 0x1001e);
+
+	event.attr.type = 4;
+	event.attr.sample_period = 1;
+	event.attr.disabled = 1;
+	event.attr.sample_type = PERF_SAMPLE_REGS_INTR;
+	event.attr.sample_regs_intr = platform_extended_mask;
+
+	fd = event_open(&event);
+	if (fd != -1)
+		return 0;
+
+	return -1;
+}
+
+int check_pvr_for_sampling_tests(void)
+{
+	pvr = get_ver();
+	/* Exit if it fails to fetch pvr */
+	if (pvr < 0) {
+		printf("%s: Failed to fetch pvr\n", __func__);
+		FAIL_IF_EXIT(1);
+	}
+
+	platform_extended_mask = perf_get_platform_reg_mask();
+
+	/*
+	 * Check for supported platforms
+	 * for sampling test
+	 */
+	if ((pvr != POWER10) && (pvr != POWER9))
+		goto out;
+
+	/*
+	 * Check PMU driver registered by looking for
+	 * PPC_FEATURE2_EBB bit in AT_HWCAP2
+	 */
+	if (!have_hwcap2(PPC_FEATURE2_EBB))
+		goto out;
+
+	/* check if platform supports extended regs */
+	if (check_extended_regs_support())
+		goto out;
+
+	pvr_dd = get_rev_maj();
+
+	if (init_platform())
+		goto out;
+
+	init_ev_encodes();
+	return 0;
+out:
+	printf("%s: Sampling tests un-supported\n", __func__);
+	return -1;
+}
 /*
  * Allocate mmap buffer of "mmap_pages" number of
  * pages.
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
index 291f9adba817..8526c15d4c90 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
@@ -1,9 +1,59 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Copyright 2022, Athira Rajeev, IBM Corp.
+ * Copyright 2022, Madhavan Srinivasan, IBM Corp.
  */
 
 #include "../event.h"
 
+#define POWER10 0x80
+#define POWER9  0x4e
+#define PERF_POWER9_MASK        0x7f8ffffffffffff
+#define PERF_POWER10_MASK       0x7ffffffffffffff
+
+extern int ev_mask_pmcxsel, ev_shift_pmcxsel;
+extern int ev_mask_marked, ev_shift_marked;
+extern int ev_mask_comb, ev_shift_comb;
+extern int ev_mask_unit, ev_shift_unit;
+extern int ev_mask_pmc, ev_shift_pmc;
+extern int ev_mask_cache, ev_shift_cache;
+extern int ev_mask_sample, ev_shift_sample;
+extern int ev_mask_thd_sel, ev_shift_thd_sel;
+extern int ev_mask_thd_start, ev_shift_thd_start;
+extern int ev_mask_thd_stop, ev_shift_thd_stop;
+extern int ev_mask_thd_cmp, ev_shift_thd_cmp;
+extern int ev_mask_sm, ev_shift_sm;
+extern int ev_mask_rsq, ev_shift_rsq;
+extern int ev_mask_l2l3, ev_shift_l2l3;
+extern int ev_mask_mmcr3_src, ev_shift_mmcr3_src;
+extern int pvr, pvr_dd, pSeries;
+extern u64 platform_extended_mask;
+extern int check_pvr_for_sampling_tests(void);
+
+/*
+ * Event code field extraction macro.
+ * Raw event code is combination of multiple
+ * fields. Macro to extract individual fields
+ *
+ * x - Raw event code value
+ * y - Field to extract
+ */
+#define EV_CODE_EXTRACT(x, y)   \
+	((x >> ev_shift_##y) & ev_mask_##y)
+
+/*
+ * Event attribute extraction macro.
+ *
+ * x - struct event
+ * y - attribute field
+ */
+#define GET_ATTR_FIELD(x, y)	\
+	((x)->attr.y)
+
+static inline int is_pSeries(void)
+{
+	return pSeries;
+}
+
 void *event_sample_buf_mmap(int fd, int mmap_pages);
 void *__event_read_samples(void *sample_buff, size_t *size, u64 *sample_count);
-- 
2.27.0

