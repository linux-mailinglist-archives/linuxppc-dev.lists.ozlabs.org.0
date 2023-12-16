Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C783D815992
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 14:49:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z4gh62xd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsnWy2SSTz3vnN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 00:49:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z4gh62xd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnP14Xrtz3c2C
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:43:49 +1100 (AEDT)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6d9f7af8918so1443799a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734227; x=1703339027; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSpSWzn4652t77dC2if+1ZPCUxLXIz50XDP/r03Pb+U=;
        b=Z4gh62xdoq7zR5P0jN2o0qjafTTM93tk2eQ0Irdz1JVEC1LJRcprzDAQ/WOMySehWQ
         RyeDZ3Yyvqjd265dUmMcvk8oOXzNjKuvbAvtO4S4ANG+H0trpNiCbCkknp6qtGLl3Z+f
         4UZYN3CI9jBFCEVk4Ds7mWGlU7bcqhXKsdOt36rJFs5g63oTvybvF5seSVvEz7TpKvIi
         hJITLs8dLGqcFUTbcOYIzar1HFBPwINqLQlUbVmJ+tRXY6vocfuxEtuzj69NpZDxdzr9
         BE13svFVeW/4CsC+G2yTC3ogQqera2fYVZBhuUOgHOvEEWd3mayl1Mb4TLbeqTsNlVu4
         0eQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734227; x=1703339027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSpSWzn4652t77dC2if+1ZPCUxLXIz50XDP/r03Pb+U=;
        b=Kxc3wBMVgK/zfvnjrWkuCZDFLunnQ+fMGfTPt+AbA5Kicm2pFSIE8+Yl4sbD7ih1n4
         Xk8zAjeycNtMR5MkXKq3w8SfgtETbfOlHgp5bmI4JjsxKy+UpLIcsWm+nVzWRVdsQ250
         WrftPJFNyAKjoAJwPOgkZ8t2s+BiBXeV3PSF86h75GlUmygOVQFQbxcNDT1VxBNFjJ2R
         TIuq9mZ5C9LMFQaZ2aENthOe1FXV9MTr8H5s2rVUMuzX4bCWedkKTdOSioLhmq5jR/vw
         n5s1knwVNGHRqNvmg0wNfeJl95Py9O5cBOW7O4bv68RwiJc/seiypyA/0iqqo7GpcQTP
         OA5Q==
X-Gm-Message-State: AOJu0YyjW4BtBUTTObPQ1XJWyLn76NpVZoOTNe3q0ViwgsTGur6slRML
	X8LSuuKUZaQKm6NRZE1Wu1tiDvIKlBs=
X-Google-Smtp-Source: AGHT+IEXgq5oEUwnAtybLyjE6VtQ/SWrDJLNuWsTXXJoIvXOVDAykBdwexRdEdtoITO0ovmL8mYCTg==
X-Received: by 2002:a05:6808:3c89:b0:3b8:94c0:87fb with SMTP id gs9-20020a0568083c8900b003b894c087fbmr17350871oib.9.1702734226763;
        Sat, 16 Dec 2023 05:43:46 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:43:46 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 07/29] powerpc: Add a migration stress tester
Date: Sat, 16 Dec 2023 23:42:34 +1000
Message-ID: <20231216134257.1743345-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231216134257.1743345-1-npiggin@gmail.com>
References: <20231216134257.1743345-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This performs 1000 migrations a tight loop to flush out simple issues
in the multiple-migration code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/Makefile.common |  1 +
 powerpc/migrate.c       | 64 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 powerpc/migrate.c

diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index f8f47490..a7af225b 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -5,6 +5,7 @@
 #
 
 tests-common = \
+	$(TEST_DIR)/migrate.elf \
 	$(TEST_DIR)/selftest.elf \
 	$(TEST_DIR)/spapr_hcall.elf \
 	$(TEST_DIR)/rtas.elf \
diff --git a/powerpc/migrate.c b/powerpc/migrate.c
new file mode 100644
index 00000000..a9f98c9f
--- /dev/null
+++ b/powerpc/migrate.c
@@ -0,0 +1,64 @@
+/*
+ * Stress Test Migration
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.
+ */
+#include <libcflat.h>
+#include <util.h>
+#include <migrate.h>
+#include <alloc.h>
+#include <asm/handlers.h>
+#include <devicetree.h>
+#include <asm/hcall.h>
+#include <asm/processor.h>
+#include <asm/barrier.h>
+
+static bool do_migrate = false;
+
+static void test_migration(int argc, char **argv)
+{
+	int i;
+
+	for (i = 0; i < 1000; i++) {
+		if (do_migrate)
+			migrate();
+	}
+}
+
+struct {
+	const char *name;
+	void (*func)(int argc, char **argv);
+} hctests[] = {
+	{ "migration", test_migration },
+	{ NULL, NULL }
+};
+
+int main(int argc, char **argv)
+{
+	bool all;
+	int i;
+
+	all = argc == 1 || !strcmp(argv[1], "all");
+
+	for (i = 1; i < argc; i++) {
+		if (!strcmp(argv[i], "-w")) {
+			do_migrate = true;
+			if (!all && argc == 2)
+				all = true;
+		}
+	}
+
+	report_prefix_push("migration");
+
+	for (i = 0; hctests[i].name != NULL; i++) {
+		if (all || strcmp(argv[1], hctests[i].name) == 0) {
+			report_prefix_push(hctests[i].name);
+			hctests[i].func(argc, argv);
+			report_prefix_pop();
+		}
+	}
+
+	report_prefix_pop();
+
+	return report_summary();
+}
-- 
2.42.0

