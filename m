Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0AC621B37
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 18:54:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6G2Z48RWz3fCd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 04:54:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gcDU6Wa+;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gcDU6Wa+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gcDU6Wa+;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gcDU6Wa+;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6Ft76TCZz3dvg
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 04:47:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667929645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+1JWVYgtBAzl6u/DxnVU6Shc+eGWdb6J3WOY1PrwuZE=;
	b=gcDU6Wa+U1YmdfF2s6QY+Pnw4az1fT8ZOkJSdPux53+msp6Qkp8CTjMHNBXXePbqTWx7kG
	jf6kxIQPEjmLrPqX1U4ykzKoVt77GQJnt22ow/vAtHgrphpqDPxnu5IpxZYVwVXzzFeX86
	HbGwKuql7J4t4h9Jqdg8E0oTbEvAwEM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667929645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+1JWVYgtBAzl6u/DxnVU6Shc+eGWdb6J3WOY1PrwuZE=;
	b=gcDU6Wa+U1YmdfF2s6QY+Pnw4az1fT8ZOkJSdPux53+msp6Qkp8CTjMHNBXXePbqTWx7kG
	jf6kxIQPEjmLrPqX1U4ykzKoVt77GQJnt22ow/vAtHgrphpqDPxnu5IpxZYVwVXzzFeX86
	HbGwKuql7J4t4h9Jqdg8E0oTbEvAwEM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-GbgeR0vgNcevksVlSb55qA-1; Tue, 08 Nov 2022 12:47:23 -0500
X-MC-Unique: GbgeR0vgNcevksVlSb55qA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7EF5882826;
	Tue,  8 Nov 2022 17:47:22 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.194.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 45C74C15BB5;
	Tue,  8 Nov 2022 17:47:19 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] selftests/vm: anon_cow: add mprotect() optimization tests
Date: Tue,  8 Nov 2022 18:46:52 +0100
Message-Id: <20221108174652.198904-8-david@redhat.com>
In-Reply-To: <20221108174652.198904-1-david@redhat.com>
References: <20221108174652.198904-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Anshuman Khandual <anshuman.khandual@arm.com>, Dave Chinner <david@fromorbit.com>, Mel Gorman <mgorman@techsingularity.net>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Hugh Dickins <hughd@google.com>, Nadav Amit <namit@vmware.com>, Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's extend the test to cover the possible mprotect() optimization when
removing write-protection. mprotect() must not allow write-access to a
COW-shared page by accident.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 tools/testing/selftests/vm/anon_cow.c | 49 +++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/vm/anon_cow.c b/tools/testing/selftests/vm/anon_cow.c
index 705bd0b3db11..bbb251eb5025 100644
--- a/tools/testing/selftests/vm/anon_cow.c
+++ b/tools/testing/selftests/vm/anon_cow.c
@@ -190,7 +190,8 @@ static int child_vmsplice_memcmp_fn(char *mem, size_t size,
 
 typedef int (*child_fn)(char *mem, size_t size, struct comm_pipes *comm_pipes);
 
-static void do_test_cow_in_parent(char *mem, size_t size, child_fn fn)
+static void do_test_cow_in_parent(char *mem, size_t size, bool do_mprotect,
+				  child_fn fn)
 {
 	struct comm_pipes comm_pipes;
 	char buf;
@@ -212,6 +213,22 @@ static void do_test_cow_in_parent(char *mem, size_t size, child_fn fn)
 
 	while (read(comm_pipes.child_ready[0], &buf, 1) != 1)
 		;
+
+	if (do_mprotect) {
+		/*
+		 * mprotect() optimizations might try avoiding
+		 * write-faults by directly mapping pages writable.
+		 */
+		ret = mprotect(mem, size, PROT_READ);
+		ret |= mprotect(mem, size, PROT_READ|PROT_WRITE);
+		if (ret) {
+			ksft_test_result_fail("mprotect() failed\n");
+			write(comm_pipes.parent_ready[1], "0", 1);
+			wait(&ret);
+			goto close_comm_pipes;
+		}
+	}
+
 	/* Modify the page. */
 	memset(mem, 0xff, size);
 	write(comm_pipes.parent_ready[1], "0", 1);
@@ -229,12 +246,22 @@ static void do_test_cow_in_parent(char *mem, size_t size, child_fn fn)
 
 static void test_cow_in_parent(char *mem, size_t size)
 {
-	do_test_cow_in_parent(mem, size, child_memcmp_fn);
+	do_test_cow_in_parent(mem, size, false, child_memcmp_fn);
+}
+
+static void test_cow_in_parent_mprotect(char *mem, size_t size)
+{
+	do_test_cow_in_parent(mem, size, true, child_memcmp_fn);
 }
 
 static void test_vmsplice_in_child(char *mem, size_t size)
 {
-	do_test_cow_in_parent(mem, size, child_vmsplice_memcmp_fn);
+	do_test_cow_in_parent(mem, size, false, child_vmsplice_memcmp_fn);
+}
+
+static void test_vmsplice_in_child_mprotect(char *mem, size_t size)
+{
+	do_test_cow_in_parent(mem, size, true, child_vmsplice_memcmp_fn);
 }
 
 static void do_test_vmsplice_in_parent(char *mem, size_t size,
@@ -969,6 +996,14 @@ static const struct test_case test_cases[] = {
 		"Basic COW after fork()",
 		test_cow_in_parent,
 	},
+	/*
+	 * Basic test, but do an additional mprotect(PROT_READ)+
+	 * mprotect(PROT_READ|PROT_WRITE) in the parent before write access.
+	 */
+	{
+		"Basic COW after fork() with mprotect() optimization",
+		test_cow_in_parent_mprotect,
+	},
 	/*
 	 * vmsplice() [R/O GUP] + unmap in the child; modify in the parent. If
 	 * we miss to break COW, the child observes modifications by the parent.
@@ -978,6 +1013,14 @@ static const struct test_case test_cases[] = {
 		"vmsplice() + unmap in child",
 		test_vmsplice_in_child
 	},
+	/*
+	 * vmsplice() test, but do an additional mprotect(PROT_READ)+
+	 * mprotect(PROT_READ|PROT_WRITE) in the parent before write access.
+	 */
+	{
+		"vmsplice() + unmap in child with mprotect() optimization",
+		test_vmsplice_in_child_mprotect
+	},
 	/*
 	 * vmsplice() [R/O GUP] in parent before fork(), unmap in parent after
 	 * fork(); modify in the child. If we miss to break COW, the parent
-- 
2.38.1

