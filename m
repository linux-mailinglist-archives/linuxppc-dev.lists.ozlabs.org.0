Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9CD62B841
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 11:29:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBzn05Qy4z3cGv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 21:29:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RMgI3ENp;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RMgI3ENp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RMgI3ENp;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RMgI3ENp;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBzlF70J6z3cGk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 21:27:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668594471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GX1A4FEx/LE5NKT2fU0VhMZiNOmIzFjwXIrq7S69i44=;
	b=RMgI3ENptFBYwynUnVGYVsZ0gCtnjf6kpwOaSv5jlk1P1b9mz2ruCPimgMQj8L9YjZcn6T
	Xyet3ZYuYTzEJXHPjIoe9S2+yaw99Zmdd9CJ8ncFFXsOgsCNJFL8T1syTJ62RKnA2Zq9Qh
	ogZdyriA+9w1qdir7qbisF+CP7WZLV8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668594471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GX1A4FEx/LE5NKT2fU0VhMZiNOmIzFjwXIrq7S69i44=;
	b=RMgI3ENptFBYwynUnVGYVsZ0gCtnjf6kpwOaSv5jlk1P1b9mz2ruCPimgMQj8L9YjZcn6T
	Xyet3ZYuYTzEJXHPjIoe9S2+yaw99Zmdd9CJ8ncFFXsOgsCNJFL8T1syTJ62RKnA2Zq9Qh
	ogZdyriA+9w1qdir7qbisF+CP7WZLV8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-e8D79onzO9-Dj-jIrITFeA-1; Wed, 16 Nov 2022 05:27:45 -0500
X-MC-Unique: e8D79onzO9-Dj-jIrITFeA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76CF7185A792;
	Wed, 16 Nov 2022 10:27:38 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 761C02024CC8;
	Wed, 16 Nov 2022 10:27:31 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable v1 02/20] selftests/vm: cow: basic COW tests for non-anonymous pages
Date: Wed, 16 Nov 2022 11:26:41 +0100
Message-Id: <20221116102659.70287-3-david@redhat.com>
In-Reply-To: <20221116102659.70287-1-david@redhat.com>
References: <20221116102659.70287-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: linux-ia64@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Hildenbrand <david@redhat.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>, linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Oded Gabbay <ogabbay@kernel.org>
 , linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Lucas Stach <l.stach@pengutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's add basic tests for COW with non-anonymous pages in private
mappings: write access should properly trigger COW and result in the
private changes not being visible through other page mappings.

Especially, add tests for:
* Zeropage
* Huge zeropage
* Ordinary pagecache pages via memfd and tmpfile()
* Hugetlb pages via memfd

Fortunately, all tests pass.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 tools/testing/selftests/vm/cow.c | 338 ++++++++++++++++++++++++++++++-
 1 file changed, 337 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vm/cow.c b/tools/testing/selftests/vm/cow.c
index d202bfd63585..fb07bd44529c 100644
--- a/tools/testing/selftests/vm/cow.c
+++ b/tools/testing/selftests/vm/cow.c
@@ -19,6 +19,7 @@
 #include <sys/mman.h>
 #include <sys/ioctl.h>
 #include <sys/wait.h>
+#include <linux/memfd.h>
 
 #include "local_config.h"
 #ifdef LOCAL_CONFIG_HAVE_LIBURING
@@ -35,6 +36,7 @@ static size_t thpsize;
 static int nr_hugetlbsizes;
 static size_t hugetlbsizes[10];
 static int gup_fd;
+static bool has_huge_zeropage;
 
 static void detect_thpsize(void)
 {
@@ -64,6 +66,31 @@ static void detect_thpsize(void)
 	close(fd);
 }
 
+static void detect_huge_zeropage(void)
+{
+	int fd = open("/sys/kernel/mm/transparent_hugepage/use_zero_page",
+		      O_RDONLY);
+	size_t enabled = 0;
+	char buf[15];
+	int ret;
+
+	if (fd < 0)
+		return;
+
+	ret = pread(fd, buf, sizeof(buf), 0);
+	if (ret > 0 && ret < sizeof(buf)) {
+		buf[ret] = 0;
+
+		enabled = strtoul(buf, NULL, 10);
+		if (enabled == 1) {
+			has_huge_zeropage = true;
+			ksft_print_msg("[INFO] huge zeropage is enabled\n");
+		}
+	}
+
+	close(fd);
+}
+
 static void detect_hugetlbsizes(void)
 {
 	DIR *dir = opendir("/sys/kernel/mm/hugepages/");
@@ -1148,6 +1175,312 @@ static int tests_per_anon_test_case(void)
 	return tests;
 }
 
+typedef void (*non_anon_test_fn)(char *mem, const char *smem, size_t size);
+
+static void test_cow(char *mem, const char *smem, size_t size)
+{
+	char *old = malloc(size);
+
+	/* Backup the original content. */
+	memcpy(old, smem, size);
+
+	/* Modify the page. */
+	memset(mem, 0xff, size);
+
+	/* See if we still read the old values via the other mapping. */
+	ksft_test_result(!memcmp(smem, old, size),
+			 "Other mapping not modified\n");
+	free(old);
+}
+
+static void run_with_zeropage(non_anon_test_fn fn, const char *desc)
+{
+	char *mem, *smem, tmp;
+
+	ksft_print_msg("[RUN] %s ... with shared zeropage\n", desc);
+
+	mem = mmap(NULL, pagesize, PROT_READ | PROT_WRITE,
+		   MAP_PRIVATE | MAP_ANON, -1, 0);
+	if (mem == MAP_FAILED) {
+		ksft_test_result_fail("mmap() failed\n");
+		return;
+	}
+
+	smem = mmap(NULL, pagesize, PROT_READ, MAP_PRIVATE | MAP_ANON, -1, 0);
+	if (mem == MAP_FAILED) {
+		ksft_test_result_fail("mmap() failed\n");
+		goto munmap;
+	}
+
+	/* Read from the page to populate the shared zeropage. */
+	tmp = *mem + *smem;
+	asm volatile("" : "+r" (tmp));
+
+	fn(mem, smem, pagesize);
+munmap:
+	munmap(mem, pagesize);
+	if (smem != MAP_FAILED)
+		munmap(smem, pagesize);
+}
+
+static void run_with_huge_zeropage(non_anon_test_fn fn, const char *desc)
+{
+	char *mem, *smem, *mmap_mem, *mmap_smem, tmp;
+	size_t mmap_size;
+	int ret;
+
+	ksft_print_msg("[RUN] %s ... with huge zeropage\n", desc);
+
+	if (!has_huge_zeropage) {
+		ksft_test_result_skip("Huge zeropage not enabled\n");
+		return;
+	}
+
+	/* For alignment purposes, we need twice the thp size. */
+	mmap_size = 2 * thpsize;
+	mmap_mem = mmap(NULL, mmap_size, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (mmap_mem == MAP_FAILED) {
+		ksft_test_result_fail("mmap() failed\n");
+		return;
+	}
+	mmap_smem = mmap(NULL, mmap_size, PROT_READ,
+			 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (mmap_smem == MAP_FAILED) {
+		ksft_test_result_fail("mmap() failed\n");
+		goto munmap;
+	}
+
+	/* We need a THP-aligned memory area. */
+	mem = (char *)(((uintptr_t)mmap_mem + thpsize) & ~(thpsize - 1));
+	smem = (char *)(((uintptr_t)mmap_smem + thpsize) & ~(thpsize - 1));
+
+	ret = madvise(mem, thpsize, MADV_HUGEPAGE);
+	ret |= madvise(smem, thpsize, MADV_HUGEPAGE);
+	if (ret) {
+		ksft_test_result_fail("MADV_HUGEPAGE failed\n");
+		goto munmap;
+	}
+
+	/*
+	 * Read from the memory to populate the huge shared zeropage. Read from
+	 * the first sub-page and test if we get another sub-page populated
+	 * automatically.
+	 */
+	tmp = *mem + *smem;
+	asm volatile("" : "+r" (tmp));
+	if (!pagemap_is_populated(pagemap_fd, mem + pagesize) ||
+	    !pagemap_is_populated(pagemap_fd, smem + pagesize)) {
+		ksft_test_result_skip("Did not get THPs populated\n");
+		goto munmap;
+	}
+
+	fn(mem, smem, thpsize);
+munmap:
+	munmap(mmap_mem, mmap_size);
+	if (mmap_smem != MAP_FAILED)
+		munmap(mmap_smem, mmap_size);
+}
+
+static void run_with_memfd(non_anon_test_fn fn, const char *desc)
+{
+	char *mem, *smem, tmp;
+	int fd;
+
+	ksft_print_msg("[RUN] %s ... with memfd\n", desc);
+
+	fd = memfd_create("test", 0);
+	if (fd < 0) {
+		ksft_test_result_fail("memfd_create() failed\n");
+		return;
+	}
+
+	/* File consists of a single page filled with zeroes. */
+	if (fallocate(fd, 0, 0, pagesize)) {
+		ksft_test_result_fail("fallocate() failed\n");
+		goto close;
+	}
+
+	/* Create a private mapping of the memfd. */
+	mem = mmap(NULL, pagesize, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
+	if (mem == MAP_FAILED) {
+		ksft_test_result_fail("mmap() failed\n");
+		goto close;
+	}
+	smem = mmap(NULL, pagesize, PROT_READ, MAP_SHARED, fd, 0);
+	if (mem == MAP_FAILED) {
+		ksft_test_result_fail("mmap() failed\n");
+		goto munmap;
+	}
+
+	/* Fault the page in. */
+	tmp = *mem + *smem;
+	asm volatile("" : "+r" (tmp));
+
+	fn(mem, smem, pagesize);
+munmap:
+	munmap(mem, pagesize);
+	if (smem != MAP_FAILED)
+		munmap(smem, pagesize);
+close:
+	close(fd);
+}
+
+static void run_with_tmpfile(non_anon_test_fn fn, const char *desc)
+{
+	char *mem, *smem, tmp;
+	FILE *file;
+	int fd;
+
+	ksft_print_msg("[RUN] %s ... with tmpfile\n", desc);
+
+	file = tmpfile();
+	if (!file) {
+		ksft_test_result_fail("tmpfile() failed\n");
+		return;
+	}
+
+	fd = fileno(file);
+	if (fd < 0) {
+		ksft_test_result_skip("fileno() failed\n");
+		return;
+	}
+
+	/* File consists of a single page filled with zeroes. */
+	if (fallocate(fd, 0, 0, pagesize)) {
+		ksft_test_result_fail("fallocate() failed\n");
+		goto close;
+	}
+
+	/* Create a private mapping of the memfd. */
+	mem = mmap(NULL, pagesize, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
+	if (mem == MAP_FAILED) {
+		ksft_test_result_fail("mmap() failed\n");
+		goto close;
+	}
+	smem = mmap(NULL, pagesize, PROT_READ, MAP_SHARED, fd, 0);
+	if (mem == MAP_FAILED) {
+		ksft_test_result_fail("mmap() failed\n");
+		goto munmap;
+	}
+
+	/* Fault the page in. */
+	tmp = *mem + *smem;
+	asm volatile("" : "+r" (tmp));
+
+	fn(mem, smem, pagesize);
+munmap:
+	munmap(mem, pagesize);
+	if (smem != MAP_FAILED)
+		munmap(smem, pagesize);
+close:
+	fclose(file);
+}
+
+static void run_with_memfd_hugetlb(non_anon_test_fn fn, const char *desc,
+				   size_t hugetlbsize)
+{
+	int flags = MFD_HUGETLB;
+	char *mem, *smem, tmp;
+	int fd;
+
+	ksft_print_msg("[RUN] %s ... with memfd hugetlb (%zu kB)\n", desc,
+		       hugetlbsize / 1024);
+
+	flags |= __builtin_ctzll(hugetlbsize) << MFD_HUGE_SHIFT;
+
+	fd = memfd_create("test", flags);
+	if (fd < 0) {
+		ksft_test_result_skip("memfd_create() failed\n");
+		return;
+	}
+
+	/* File consists of a single page filled with zeroes. */
+	if (fallocate(fd, 0, 0, hugetlbsize)) {
+		ksft_test_result_skip("need more free huge pages\n");
+		goto close;
+	}
+
+	/* Create a private mapping of the memfd. */
+	mem = mmap(NULL, hugetlbsize, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd,
+		   0);
+	if (mem == MAP_FAILED) {
+		ksft_test_result_skip("need more free huge pages\n");
+		goto close;
+	}
+	smem = mmap(NULL, hugetlbsize, PROT_READ, MAP_SHARED, fd, 0);
+	if (mem == MAP_FAILED) {
+		ksft_test_result_fail("mmap() failed\n");
+		goto munmap;
+	}
+
+	/* Fault the page in. */
+	tmp = *mem + *smem;
+	asm volatile("" : "+r" (tmp));
+
+	fn(mem, smem, hugetlbsize);
+munmap:
+	munmap(mem, hugetlbsize);
+	if (mem != MAP_FAILED)
+		munmap(smem, hugetlbsize);
+close:
+	close(fd);
+}
+
+struct non_anon_test_case {
+	const char *desc;
+	non_anon_test_fn fn;
+};
+
+/*
+ * Test cases that target any pages in private mappings that are non anonymous:
+ * pages that may get shared via COW ndependent of fork(). This includes
+ * the shared zeropage(s), pagecache pages, ...
+ */
+static const struct non_anon_test_case non_anon_test_cases[] = {
+	/*
+	 * Basic COW test without any GUP. If we miss to break COW, changes are
+	 * visible via other private/shared mappings.
+	 */
+	{
+		"Basic COW",
+		test_cow,
+	},
+};
+
+static void run_non_anon_test_case(struct non_anon_test_case const *test_case)
+{
+	int i;
+
+	run_with_zeropage(test_case->fn, test_case->desc);
+	run_with_memfd(test_case->fn, test_case->desc);
+	run_with_tmpfile(test_case->fn, test_case->desc);
+	if (thpsize)
+		run_with_huge_zeropage(test_case->fn, test_case->desc);
+	for (i = 0; i < nr_hugetlbsizes; i++)
+		run_with_memfd_hugetlb(test_case->fn, test_case->desc,
+				       hugetlbsizes[i]);
+}
+
+static void run_non_anon_test_cases(void)
+{
+	int i;
+
+	ksft_print_msg("[RUN] Non-anonymous memory tests in private mappings\n");
+
+	for (i = 0; i < ARRAY_SIZE(non_anon_test_cases); i++)
+		run_non_anon_test_case(&non_anon_test_cases[i]);
+}
+
+static int tests_per_non_anon_test_case(void)
+{
+	int tests = 3 + nr_hugetlbsizes;
+
+	if (thpsize)
+		tests += 1;
+	return tests;
+}
+
 int main(int argc, char **argv)
 {
 	int err;
@@ -1155,9 +1488,11 @@ int main(int argc, char **argv)
 	pagesize = getpagesize();
 	detect_thpsize();
 	detect_hugetlbsizes();
+	detect_huge_zeropage();
 
 	ksft_print_header();
-	ksft_set_plan(ARRAY_SIZE(anon_test_cases) * tests_per_anon_test_case());
+	ksft_set_plan(ARRAY_SIZE(anon_test_cases) * tests_per_anon_test_case() +
+		      ARRAY_SIZE(non_anon_test_cases) * tests_per_non_anon_test_case());
 
 	gup_fd = open("/sys/kernel/debug/gup_test", O_RDWR);
 	pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
@@ -1165,6 +1500,7 @@ int main(int argc, char **argv)
 		ksft_exit_fail_msg("opening pagemap failed\n");
 
 	run_anon_test_cases();
+	run_non_anon_test_cases();
 
 	err = ksft_get_fail_cnt();
 	if (err)
-- 
2.38.1

