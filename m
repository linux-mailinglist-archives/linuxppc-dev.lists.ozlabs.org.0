Return-Path: <linuxppc-dev+bounces-17260-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHAQCBMwoGmLgAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17260-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 12:35:47 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2798D1A525B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 12:35:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM8Wt6QzLz3bll;
	Thu, 26 Feb 2026 22:35:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.178
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772105706;
	cv=none; b=Z0Sh4C8f38EAcwuocsBcOvIQgdGCLsy+bVZWl+Jj5Hi3jlufqF+3uJ8977TWjESibecGwtAlFZ/7157Es7AHdeiTYZsl4jxPhDgvX9eHJH/Qm7+wBNp+YIx2dwocoiWoLT7A3iGBSlFSgZcdN+om8M0nbjtMDJETSyNpfWm7lNTbQB2kKAR8iIEKAjKbLLaaVRObpoVp5QGJXeSmmOk603O0UrGOFSwsebby+w3Ixq6BC9xXXe7U6VFu2NItNAAJSimBe+mYRF+4X4zqYC00kVspTsayTGWobgjz3AU3my1QtSgpHmUiESiECEW0P8l2cJkhHXfxIPGkq2B+2oq2rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772105706; c=relaxed/relaxed;
	bh=3EBMW5df/kqjxALvGCac5LeXwtQNaqEvULHNZHX+1lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hTtuiZb7PkfN/rP4j06FB+rha/N3921Vm+epu+GZqB3sLM7lWR1aWF9bTM17HTUWOlyK+XkX11LFTEcn1UTSzHy+jHDriMBZH/+z+9cCzKUfAJ2N4e9KZHHej4jTKGZaPvJzY626lgxKQuTjR8Yh0lSb+FlqzS4nJ8/t44j1Uo+aDRY+FOGceezyJqOsMl2yd1+CNHQrQTicPbs4tFnJcOy45LmRGNsCEU1Gg+ZIcfBGXryvTQ+xjmuSFcHRaSGKLnDrNggbEZqRSZF/nuV6QJRbMoK2UJNQ60g66YqRwAb/fBaKQXKIrKuveGC9VZ/M9qapuSlaZOM+t/NAmM5JBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ec17NRLq; dkim-atps=neutral; spf=pass (client-ip=95.215.58.178; helo=out-178.mta1.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ec17NRLq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.178; helo=out-178.mta1.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org)
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM8Wt1MWcz3bkL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 22:35:05 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772105686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3EBMW5df/kqjxALvGCac5LeXwtQNaqEvULHNZHX+1lo=;
	b=Ec17NRLqZdkNOCfYyhxyJmbLXJ3hDN99fyOVr8S7gzesBylU0G5qLKGmWd2mUsNPo4QbCO
	0P46bXf4Y7YpPawzBDCHsB8JH5ZskGMhbudmRHaDZgLl4BF2ofVHpfjC5JFLtZFT9+SWee
	iFTIlNIY6EmRvwy8JGlhh+lWFExdBSw=
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
	willy@infradead.org,
	linux-mm@kvack.org
Cc: fvdl@google.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	Liam.Howlett@oracle.com,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	linux-s390@vger.kernel.org,
	Usama Arif <usama.arif@linux.dev>
Subject: [RFC v2 17/21] selftests/mm: add THP PMD split test infrastructure
Date: Thu, 26 Feb 2026 03:23:46 -0800
Message-ID: <20260226113233.3987674-18-usama.arif@linux.dev>
In-Reply-To: <20260226113233.3987674-1-usama.arif@linux.dev>
References: <20260226113233.3987674-1-usama.arif@linux.dev>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17260-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[usama.arif@linux.dev,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:willy@infradead.org,m:linux-mm@kvack.org,m:fvdl@google.com,m:hannes@cmpxchg.org,m:riel@surriel.com,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baohua@kernel.org,m:dev.jain@arm.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:Liam.Howlett@oracle.com,m:ryan.roberts@arm.com,m:vbabka@kernel.org,m:lance.yang@linux.dev,m:linux-kernel@vger.kernel.org,m:kernel-team@meta.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:usama.arif@linux.dev,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[usama.arif@linux.dev,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim,linux.dev:email]
X-Rspamd-Queue-Id: 2798D1A525B
X-Rspamd-Action: no action

Add test infrastructure for verifying THP PMD split behavior with lazy
PTE allocation. This includes:

- Test fixture with PMD-aligned memory allocation
- Helper functions for reading vmstat counters
- log_and_check_pmd_split() macro for logging counters and checking
  if thp_split_pmd has incremented and thp_split_pmd_failed hasn't.
- THP allocation helper with verification

Also add a test to check if partial unmap of a THP splits the PMD.
This exercises zap_pmd_range part of split.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 tools/testing/selftests/mm/Makefile           |   1 +
 .../testing/selftests/mm/thp_pmd_split_test.c | 149 ++++++++++++++++++
 2 files changed, 150 insertions(+)
 create mode 100644 tools/testing/selftests/mm/thp_pmd_split_test.c

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 7a5de4e9bf520..e80551e76013a 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -95,6 +95,7 @@ TEST_GEN_FILES += uffd-stress
 TEST_GEN_FILES += uffd-unit-tests
 TEST_GEN_FILES += uffd-wp-mremap
 TEST_GEN_FILES += split_huge_page_test
+TEST_GEN_FILES += thp_pmd_split_test
 TEST_GEN_FILES += ksm_tests
 TEST_GEN_FILES += ksm_functional_tests
 TEST_GEN_FILES += mdwe_test
diff --git a/tools/testing/selftests/mm/thp_pmd_split_test.c b/tools/testing/selftests/mm/thp_pmd_split_test.c
new file mode 100644
index 0000000000000..0f54ac04760d5
--- /dev/null
+++ b/tools/testing/selftests/mm/thp_pmd_split_test.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Tests various kernel code paths that handle THP PMD splitting.
+ *
+ * Prerequisites:
+ * - THP enabled (always or madvise mode):
+ *   echo always > /sys/kernel/mm/transparent_hugepage/enabled
+ *   or
+ *   echo madvise > /sys/kernel/mm/transparent_hugepage/enabled
+ */
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/mman.h>
+#include <sys/wait.h>
+#include <fcntl.h>
+#include <errno.h>
+#include <stdint.h>
+
+#include "kselftest_harness.h"
+#include "thp_settings.h"
+#include "vm_util.h"
+
+/* Read vmstat counter */
+static unsigned long read_vmstat(const char *name)
+{
+	FILE *fp;
+	char line[256];
+	unsigned long value = 0;
+
+	fp = fopen("/proc/vmstat", "r");
+	if (!fp)
+		return 0;
+
+	while (fgets(line, sizeof(line), fp)) {
+		if (strncmp(line, name, strlen(name)) == 0 &&
+		    line[strlen(name)] == ' ') {
+			sscanf(line + strlen(name), " %lu", &value);
+			break;
+		}
+	}
+	fclose(fp);
+	return value;
+}
+
+/*
+ * Log vmstat counters for split_pmd_after/split_pmd_failed_after,
+ * check if split_pmd_after is greater than before and split_pmd_failed_after
+ * hasn't incremented.
+ */
+static void log_and_check_pmd_split(struct __test_metadata *const _metadata,
+	unsigned long split_pmd_before, unsigned long split_pmd_failed_before)
+{
+	unsigned long split_pmd_after = read_vmstat("thp_split_pmd");
+	unsigned long split_pmd_failed_after = read_vmstat("thp_split_pmd_failed");
+
+	TH_LOG("thp_split_pmd: %lu -> %lu", \
+	       split_pmd_before, split_pmd_after);
+	TH_LOG("thp_split_pmd_failed: %lu -> %lu", \
+	       split_pmd_failed_before, split_pmd_failed_after);
+	ASSERT_GT(split_pmd_after, split_pmd_before);
+	ASSERT_EQ(split_pmd_failed_after, split_pmd_failed_before);
+}
+
+/* Allocate a THP at the given aligned address */
+static int allocate_thp(void *aligned, size_t pmdsize)
+{
+	int ret;
+
+	ret = madvise(aligned, pmdsize, MADV_HUGEPAGE);
+	if (ret)
+		return -1;
+
+	/* Touch all pages to allocate the THP */
+	memset(aligned, 0xAA, pmdsize);
+
+	/* Verify we got a THP */
+	if (!check_huge_anon(aligned, 1, pmdsize))
+		return -1;
+
+	return 0;
+}
+
+FIXTURE(thp_pmd_split)
+{
+	void *mem;		/* Base mmap allocation */
+	void *aligned;		/* PMD-aligned pointer within mem */
+	size_t pmdsize;		/* PMD size from sysfs */
+	size_t pagesize;	/* Base page size */
+	size_t mmap_size;	/* Total mmap size for alignment */
+	unsigned long split_pmd_before;
+	unsigned long split_pmd_failed_before;
+};
+
+FIXTURE_SETUP(thp_pmd_split)
+{
+	if (!thp_available())
+		SKIP(return, "THP not available");
+
+	self->pmdsize = read_pmd_pagesize();
+	if (!self->pmdsize)
+		SKIP(return, "Unable to read PMD size");
+
+	self->pagesize = getpagesize();
+	self->mmap_size = 4 * self->pmdsize;
+
+	self->split_pmd_before = read_vmstat("thp_split_pmd");
+	self->split_pmd_failed_before = read_vmstat("thp_split_pmd_failed");
+
+	self->mem = mmap(NULL, self->mmap_size, PROT_READ | PROT_WRITE,
+			 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(self->mem, MAP_FAILED);
+
+	/* Align to PMD boundary */
+	self->aligned = (void *)(((unsigned long)self->mem + self->pmdsize - 1) &
+				 ~(self->pmdsize - 1));
+}
+
+FIXTURE_TEARDOWN(thp_pmd_split)
+{
+	if (self->mem && self->mem != MAP_FAILED)
+		munmap(self->mem, self->mmap_size);
+}
+
+/*
+ * Partial munmap on THP (zap_pmd_range)
+ *
+ * Tests that partial munmap of a THP correctly splits the PMD.
+ * This exercises zap_pmd_range part of split.
+ */
+TEST_F(thp_pmd_split, partial_munmap)
+{
+	int ret;
+
+	ret = allocate_thp(self->aligned, self->pmdsize);
+	if (ret)
+		SKIP(return, "Failed to allocate THP");
+
+	ret = munmap((char *)self->aligned + self->pagesize, self->pagesize);
+	ASSERT_EQ(ret, 0);
+
+	log_and_check_pmd_split(_metadata, self->split_pmd_before,
+		self->split_pmd_failed_before);
+}
+
+TEST_HARNESS_MAIN
-- 
2.47.3


