Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F377D62B85C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 11:30:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBzp06Tgxz3f4y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 21:30:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YxhFIMcF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aiinxogb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YxhFIMcF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aiinxogb;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBzlG5qm4z3cJ7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 21:27:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668594471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Pfa0qX/ZhOI50QqJ9JdOGuy2kwPxeAxaBCfxYoSW9g=;
	b=YxhFIMcF8TvwAmFNShltramy6vJV9PPa8VZibcl/xUldmdcnEyfW1iUJxmBI+4Vpg2FGCp
	SgD5qEJU0xwzt2co/UdM4uZCMOm4ajphQhr/UM8Lyivxd5lH2nwSipl0M3czM5Il0Ht0Jv
	TpqYWK7p86J3hBzK5V1HUDxymVJxBtU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668594472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Pfa0qX/ZhOI50QqJ9JdOGuy2kwPxeAxaBCfxYoSW9g=;
	b=aiinxogb2TQ8A/7AiusbzXckZ1P/hhx/6w/6k74oYT7FtcseX+lHSuBir1+pwk7qEVw/av
	oQ6Dkk+onnGmasIq3geYfhW7NU5owbswn76EnSgtTGF1bSI5RiNnUelNvXPF+hMVMTX+xA
	zA7XT/VWgLIYaFLD0nf7WQDdgnREWqc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-mUeJQgfvOUWRJd96rWHDcg-1; Wed, 16 Nov 2022 05:27:47 -0500
X-MC-Unique: mUeJQgfvOUWRJd96rWHDcg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 547AE86F13B;
	Wed, 16 Nov 2022 10:27:45 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C5D9B20290A6;
	Wed, 16 Nov 2022 10:27:38 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable v1 03/20] selftests/vm: cow: R/O long-term pinning reliability tests for non-anon pages
Date: Wed, 16 Nov 2022 11:26:42 +0100
Message-Id: <20221116102659.70287-4-david@redhat.com>
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

Let's test whether R/O long-term pinning is reliable for non-anonymous
memory: when R/O long-term pinning a page, the expectation is that we
break COW early before pinning, such that actual write access via the
page tables won't break COW later and end up replacing the R/O-pinned
page in the page table.

Consequently, R/O long-term pinning in private mappings would only target
exclusive anonymous pages.

For now, all tests fail:
	# [RUN] R/O longterm GUP pin ... with shared zeropage
	not ok 151 Longterm R/O pin is reliable
	# [RUN] R/O longterm GUP pin ... with memfd
	not ok 152 Longterm R/O pin is reliable
	# [RUN] R/O longterm GUP pin ... with tmpfile
	not ok 153 Longterm R/O pin is reliable
	# [RUN] R/O longterm GUP pin ... with huge zeropage
	not ok 154 Longterm R/O pin is reliable
	# [RUN] R/O longterm GUP pin ... with memfd hugetlb (2048 kB)
	not ok 155 Longterm R/O pin is reliable
	# [RUN] R/O longterm GUP pin ... with memfd hugetlb (1048576 kB)
	not ok 156 Longterm R/O pin is reliable
	# [RUN] R/O longterm GUP-fast pin ... with shared zeropage
	not ok 157 Longterm R/O pin is reliable
	# [RUN] R/O longterm GUP-fast pin ... with memfd
	not ok 158 Longterm R/O pin is reliable
	# [RUN] R/O longterm GUP-fast pin ... with tmpfile
	not ok 159 Longterm R/O pin is reliable
	# [RUN] R/O longterm GUP-fast pin ... with huge zeropage
	not ok 160 Longterm R/O pin is reliable
	# [RUN] R/O longterm GUP-fast pin ... with memfd hugetlb (2048 kB)
	not ok 161 Longterm R/O pin is reliable
	# [RUN] R/O longterm GUP-fast pin ... with memfd hugetlb (1048576 kB)
	not ok 162 Longterm R/O pin is reliable

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 tools/testing/selftests/vm/cow.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vm/cow.c b/tools/testing/selftests/vm/cow.c
index fb07bd44529c..73e05b52c49e 100644
--- a/tools/testing/selftests/vm/cow.c
+++ b/tools/testing/selftests/vm/cow.c
@@ -561,6 +561,7 @@ static void test_iouring_fork(char *mem, size_t size)
 #endif /* LOCAL_CONFIG_HAVE_LIBURING */
 
 enum ro_pin_test {
+	RO_PIN_TEST,
 	RO_PIN_TEST_SHARED,
 	RO_PIN_TEST_PREVIOUSLY_SHARED,
 	RO_PIN_TEST_RO_EXCLUSIVE,
@@ -593,6 +594,8 @@ static void do_test_ro_pin(char *mem, size_t size, enum ro_pin_test test,
 	}
 
 	switch (test) {
+	case RO_PIN_TEST:
+		break;
 	case RO_PIN_TEST_SHARED:
 	case RO_PIN_TEST_PREVIOUSLY_SHARED:
 		/*
@@ -1193,6 +1196,16 @@ static void test_cow(char *mem, const char *smem, size_t size)
 	free(old);
 }
 
+static void test_ro_pin(char *mem, const char *smem, size_t size)
+{
+	do_test_ro_pin(mem, size, RO_PIN_TEST, false);
+}
+
+static void test_ro_fast_pin(char *mem, const char *smem, size_t size)
+{
+	do_test_ro_pin(mem, size, RO_PIN_TEST, true);
+}
+
 static void run_with_zeropage(non_anon_test_fn fn, const char *desc)
 {
 	char *mem, *smem, tmp;
@@ -1433,7 +1446,7 @@ struct non_anon_test_case {
 };
 
 /*
- * Test cases that target any pages in private mappings that are non anonymous:
+ * Test cases that target any pages in private mappings that are not anonymous:
  * pages that may get shared via COW ndependent of fork(). This includes
  * the shared zeropage(s), pagecache pages, ...
  */
@@ -1446,6 +1459,19 @@ static const struct non_anon_test_case non_anon_test_cases[] = {
 		"Basic COW",
 		test_cow,
 	},
+	/*
+	 * Take a R/O longterm pin. When modifying the page via the page table,
+	 * the page content change must be visible via the pin.
+	 */
+	{
+		"R/O longterm GUP pin",
+		test_ro_pin,
+	},
+	/* Same as above, but using GUP-fast. */
+	{
+		"R/O longterm GUP-fast pin",
+		test_ro_fast_pin,
+	},
 };
 
 static void run_non_anon_test_case(struct non_anon_test_case const *test_case)
-- 
2.38.1

