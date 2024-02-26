Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F6B866F00
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 10:44:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eMZj3iXC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tjwgq53NHz3dC0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 20:44:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eMZj3iXC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjwYy55SBz3cPk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 20:39:34 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-299ea1f1989so1256157a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 01:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708940372; x=1709545172; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4C3sdt0JsWbryl8xk4OG1WbSXlpSqNkR+NKIJMu9X/I=;
        b=eMZj3iXCH0M757jZZ41LoC1UXK6PO60Jf86YctYJfUXTlYerbVXTbHftwlKtble9Le
         Lkas467eUZv+PL57t8l/w4DKe0ef0AbcYSTr2qX+PVVzTdGpQIJrm7y72eH3xkmNzvqt
         8Vu81PPR6SfF+ZAb/td5dhpFGODRV/A7xTHJ+6gjuA/l4EEhA91UBfFeIifr8yKPc/T1
         v+PBqIuGNIm1s4hNfwIVfu0x6uTvxmM1CIpL6LNOL83e0gmF/epi2fXZjRzC4Q94Fnc4
         j5P45tDdNqF5MCAru4ESsAfRyEzGrY6CtJTMhWguTf6wsL+PP1cANWuQ0dnKdAaNpb+/
         cLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708940372; x=1709545172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4C3sdt0JsWbryl8xk4OG1WbSXlpSqNkR+NKIJMu9X/I=;
        b=aijD9HZzWr4TcmPYpvL2IjSXAPnum3fk6hwG6Z2rA9weZUj0TtDP9/xaoA4HbuVFD0
         LfUjdbzCxG9qSbbUoFbjcBP7Xb2h7Q0qskwldCODy2K9YlMF8jmgVswZnzxq6cKIppsZ
         73BU+fAhPfSLwWxG88bqzPoWMSEUH6HQVTlJPmuivZ1L3nqN/MqU8vug8vBYAxTmdBpt
         aSkhSR8BN15XvEoOP4yXZwhTNyHUD5PDQnetDYi6qp/HTEGE0B81bkIu7FUWDnlqeDO1
         VUSOKPdwFm14uurTn9WFjRB92Nze784gYvAffDKp/POkOEjpMICE8dGyy2tIz7/h98i3
         Lv/A==
X-Forwarded-Encrypted: i=1; AJvYcCXGohsAFq8OrQOZ6c89psMO7mAqlM+XJjzGme6FzDTEA7Sh2CsUYwm4/IjrArJxLWgfXOpv0ukt+0wAmEIGw2eA+3tkmqyJrtO/4a2Yvw==
X-Gm-Message-State: AOJu0Yzhncd+3gQU9/aowCsRc0UOE1zX9nIZgIga8Sj+aCHwhPoRORPM
	o5+3Z3uvYQaqfy5qvJ6Dv90P0KLZhaYZmND+6iY/ZGlWilxjBVJk
X-Google-Smtp-Source: AGHT+IFXLyYXdyP2UAckhzh+BDfRTP5s86iCzOS+vBsDRJEkc8Q8vEMkpMw7UMDXxznIh8HlHNlNaA==
X-Received: by 2002:a17:90a:db03:b0:29a:59a7:951d with SMTP id g3-20020a17090adb0300b0029a59a7951dmr3903944pjv.5.1708940372072;
        Mon, 26 Feb 2024 01:39:32 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id pa3-20020a17090b264300b0029929ec25fesm6036782pjb.27.2024.02.26.01.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 01:39:31 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 7/7] common: add memory dirtying vs migration test
Date: Mon, 26 Feb 2024 19:38:32 +1000
Message-ID: <20240226093832.1468383-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240226093832.1468383-1-npiggin@gmail.com>
References: <20240226093832.1468383-1-npiggin@gmail.com>
MIME-Version: 1.0
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This test stores to a bunch of pages and verifies previous stores,
while being continually migrated. This can fail due to a QEMU TCG
physical memory dirty bitmap bug.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 common/memory-verify.c  | 48 +++++++++++++++++++++++++++++++++++++++++
 powerpc/Makefile.common |  1 +
 powerpc/memory-verify.c |  1 +
 powerpc/unittests.cfg   |  7 ++++++
 s390x/Makefile          |  1 +
 s390x/memory-verify.c   |  1 +
 s390x/unittests.cfg     |  6 ++++++
 7 files changed, 65 insertions(+)
 create mode 100644 common/memory-verify.c
 create mode 120000 powerpc/memory-verify.c
 create mode 120000 s390x/memory-verify.c

diff --git a/common/memory-verify.c b/common/memory-verify.c
new file mode 100644
index 000000000..7c4ec087b
--- /dev/null
+++ b/common/memory-verify.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Simple memory verification test, used to exercise dirty memory migration.
+ *
+ */
+#include <libcflat.h>
+#include <migrate.h>
+#include <alloc.h>
+#include <asm/page.h>
+#include <asm/time.h>
+
+#define NR_PAGES 32
+
+int main(int argc, char **argv)
+{
+	void *mem = malloc(NR_PAGES*PAGE_SIZE);
+	bool success = true;
+	uint64_t ms;
+	long i;
+
+	report_prefix_push("memory");
+
+	memset(mem, 0, NR_PAGES*PAGE_SIZE);
+
+	migrate_begin_continuous();
+	ms = get_clock_ms();
+	i = 0;
+	do {
+		int j;
+
+		for (j = 0; j < NR_PAGES*PAGE_SIZE; j += PAGE_SIZE) {
+			if (*(volatile long *)(mem + j) != i) {
+				success = false;
+				goto out;
+			}
+			*(volatile long *)(mem + j) = i + 1;
+		}
+		i++;
+	} while (get_clock_ms() - ms < 5000);
+out:
+	migrate_end_continuous();
+
+	report(success, "memory verification stress test");
+
+	report_prefix_pop();
+
+	return report_summary();
+}
diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index da4a7bbb8..1e181da69 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -7,6 +7,7 @@
 tests-common = \
 	$(TEST_DIR)/selftest.elf \
 	$(TEST_DIR)/selftest-migration.elf \
+	$(TEST_DIR)/memory-verify.elf \
 	$(TEST_DIR)/spapr_hcall.elf \
 	$(TEST_DIR)/rtas.elf \
 	$(TEST_DIR)/emulator.elf \
diff --git a/powerpc/memory-verify.c b/powerpc/memory-verify.c
new file mode 120000
index 000000000..5985c730f
--- /dev/null
+++ b/powerpc/memory-verify.c
@@ -0,0 +1 @@
+../common/memory-verify.c
\ No newline at end of file
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index 89abf2095..fadd8dde6 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -46,6 +46,13 @@ machine = pseries
 groups = selftest migration
 extra_params = -append "skip"
 
+# This fails due to a QEMU TCG bug so KVM-only until QEMU is fixed upstream
+[migration-memory]
+file = memory-verify.elf
+accel = kvm
+machine = pseries
+groups = migration
+
 [spapr_hcall]
 file = spapr_hcall.elf
 
diff --git a/s390x/Makefile b/s390x/Makefile
index 344d46d68..ddc0969f3 100644
--- a/s390x/Makefile
+++ b/s390x/Makefile
@@ -1,5 +1,6 @@
 tests = $(TEST_DIR)/selftest.elf
 tests += $(TEST_DIR)/selftest-migration.elf
+tests += $(TEST_DIR)/memory-verify.elf
 tests += $(TEST_DIR)/intercept.elf
 tests += $(TEST_DIR)/emulator.elf
 tests += $(TEST_DIR)/sieve.elf
diff --git a/s390x/memory-verify.c b/s390x/memory-verify.c
new file mode 120000
index 000000000..5985c730f
--- /dev/null
+++ b/s390x/memory-verify.c
@@ -0,0 +1 @@
+../common/memory-verify.c
\ No newline at end of file
diff --git a/s390x/unittests.cfg b/s390x/unittests.cfg
index f613602d3..a88fe9e79 100644
--- a/s390x/unittests.cfg
+++ b/s390x/unittests.cfg
@@ -33,6 +33,12 @@ file = selftest-migration.elf
 groups = selftest migration
 extra_params = -append "skip"
 
+# This fails due to a QEMU TCG bug so KVM-only until QEMU is fixed upstream
+[migration-memory]
+file = memory-verify.elf
+accel = kvm
+groups = migration
+
 [intercept]
 file = intercept.elf
 
-- 
2.42.0

