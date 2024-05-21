Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 707058CA6A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 05:11:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fX8m3HcC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VjzlC04sZz3vyT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 13:03:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fX8m3HcC;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VjzkV5Tjyz3vZW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 13:02:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1716260545;
	bh=aZ8eL+an0k4EGUGhJYQuS679Qpvr/5jI+zIpE3s7TKM=;
	h=From:To:Cc:Subject:Date:From;
	b=fX8m3HcCBadlJFZVLLv4f/oG6DuCW581DUDftxw/5iZbT/ZzaUnPDTes22hq3B5RF
	 kDdM+FmBEsPArKY05nywjsUhfd3BK5b9i0YU13cFmyyX0NUkJtWFGZFNTod00s1ct5
	 bvBHu+zNrr346znIlfplZq97wjUN/CwpafLsnoSriZtDKoTQXQtUuPVULM8IXbHCG5
	 ZXQFn3eW4uo+tvYyGH0on3q4gJ1mPmkguAWI6ueKfJyEqOJfQnOyNs0gLtk5XeF0LV
	 p3PqmBEF901A/zVNYTK/unMIvL4NBhK4XGUf7jJOPu74AOR6OlQnyBDQd0BIqjQ4Vd
	 CkisghALVDOmw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VjzkS71Ghz4wc3;
	Tue, 21 May 2024 13:02:24 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linux-kselftest@vger.kernel.org>,
	<skhan@linuxfoundation.org>
Subject: [PATCH] selftests/mm: Fix build warnings on ppc64
Date: Tue, 21 May 2024 13:02:19 +1000
Message-ID: <20240521030219.57439-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix warnings like:

  In file included from uffd-unit-tests.c:8:
  uffd-unit-tests.c: In function ‘uffd_poison_handle_fault’:
  uffd-common.h:45:33: warning: format ‘%llu’ expects argument of type
  ‘long long unsigned int’, but argument 3 has type ‘__u64’ {aka ‘long
  unsigned int’} [-Wformat=]

By switching to unsigned long long for u64 for ppc64 builds.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/mm/gup_test.c    | 1 +
 tools/testing/selftests/mm/uffd-common.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tools/testing/selftests/mm/gup_test.c b/tools/testing/selftests/mm/gup_test.c
index bd335cf9bc0e..bdeaac67ff9a 100644
--- a/tools/testing/selftests/mm/gup_test.c
+++ b/tools/testing/selftests/mm/gup_test.c
@@ -1,3 +1,4 @@
+#define __SANE_USERSPACE_TYPES__ // Use ll64
 #include <fcntl.h>
 #include <errno.h>
 #include <stdio.h>
diff --git a/tools/testing/selftests/mm/uffd-common.h b/tools/testing/selftests/mm/uffd-common.h
index cc5629c3d2aa..a70ae10b5f62 100644
--- a/tools/testing/selftests/mm/uffd-common.h
+++ b/tools/testing/selftests/mm/uffd-common.h
@@ -8,6 +8,7 @@
 #define __UFFD_COMMON_H__
 
 #define _GNU_SOURCE
+#define __SANE_USERSPACE_TYPES__ // Use ll64
 #include <stdio.h>
 #include <errno.h>
 #include <unistd.h>
-- 
2.45.1

