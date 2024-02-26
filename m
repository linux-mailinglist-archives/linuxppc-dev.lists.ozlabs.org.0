Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FD9866EDE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 10:41:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IhYy3JI/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjwcV4B1Pz3vYn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 20:41:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IhYy3JI/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjwYT2FT8z3cS3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 20:39:09 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-299b55f2344so1856286a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 01:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708940347; x=1709545147; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uC/70SEJzTHOJH25vt3H9h8+D3sESjLNUn4k7CqK+9E=;
        b=IhYy3JI/QhJcq+aFlaPDy/jIRL1n73BrGzV83v1hBp7wytPBj6lCsb4c8sd8khyqff
         T25HT8fIilgpwSfQyIYRGGM77DHjPgPbc130jHC24/FkU2gMbbdWPfwWw7J3qWGZmWD4
         FN6j4aM+I7FQWzyeYufgAGlIWNQpprKJZ3ZmHUkHu5P2IDUnDICUm+zOW9IX8NCqoZ+p
         bYP8fPVGfKBsO0ttGzo524ffCesqPcZhZFy5p2munbqK2H4FtdLTGw9dLiUggzna9gQf
         vi+pHmxPv2DG3FvSpjToe9GQV9GDG09aQ9djdzgBuC0B1vfCWK9mXpEk6JGZR8bi1yB8
         x3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708940347; x=1709545147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uC/70SEJzTHOJH25vt3H9h8+D3sESjLNUn4k7CqK+9E=;
        b=BzyCDq8aQ+3CgWRRKQWAfxrf1f52In3mWKwf6sGC/ATnTB2MzvYhLdhsdKJg0ihVDD
         ysDKZRIn+vzWR1mmRSgLu1T0rIqm5xcPh0ZOrZuDWbFu0S59V0SEDEDryqx3krzuEUYb
         s7+C94t/O873GcdAHPQxgDzoyn/5MhGdnvUog3uGu8UkOE2OQhjLEDeh2/Op/uYD8j+I
         FRaoQWymXvMBDX4PAoBWlNShfSgJ+KHZS01hzC4RMJBuAG33YqOJ4DYihVmNDGvMknxz
         6+Z4YVaCQkKuKcOaAc+wwQEKW2qjKr+JnZLmgSr/FW3RJZuw7nTe3LhpSvaRPAe/3eKb
         iv9g==
X-Forwarded-Encrypted: i=1; AJvYcCWXUD5BcTNoUQ4UnMfQU81ioPvQazNE3OgBsD70hzKvK/9yrL+/xHV90SE7AuLes8fCdmSoOGYz5BfmFpbc0Qiky2Gg8oDz3/yK4BCTcw==
X-Gm-Message-State: AOJu0Yy4ci0vA2iGf//a59qezgUSCoTBdYXGseX0GzCA23ofZ1QUKvJu
	ARf45B+Wxs5zRZvFdt8y7YSFT/bMTMaRV/KkWxCVgnwfkjTzFRRV
X-Google-Smtp-Source: AGHT+IGVHjLqOx0JzfzvBlojtHENa9XElZf47hWf9jVMVAK+crqgExNKzAI0S0P3U/MhCCZoNTPxcg==
X-Received: by 2002:a17:90a:9bc5:b0:29a:be1a:ea40 with SMTP id b5-20020a17090a9bc500b0029abe1aea40mr1608384pjw.9.1708940346798;
        Mon, 26 Feb 2024 01:39:06 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id pa3-20020a17090b264300b0029929ec25fesm6036782pjb.27.2024.02.26.01.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 01:39:06 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 3/7] (arm|s390): Use migrate_skip in test cases
Date: Mon, 26 Feb 2024 19:38:28 +1000
Message-ID: <20240226093832.1468383-4-npiggin@gmail.com>
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

Have tests use the new migrate_skip command in skip paths, rather than
calling migrate_once to prevent harness reporting an error.

s390x/migration.c adds a new command that looks like it was missing
previously.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arm/gic.c              | 21 ++++++++++++---------
 s390x/migration-cmm.c  |  8 ++++----
 s390x/migration-skey.c |  4 +++-
 s390x/migration.c      |  1 +
 4 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/arm/gic.c b/arm/gic.c
index c950b0d15..bbf828f17 100644
--- a/arm/gic.c
+++ b/arm/gic.c
@@ -782,13 +782,15 @@ static void test_its_migration(void)
 	struct its_device *dev2, *dev7;
 	cpumask_t mask;
 
-	if (its_setup1())
+	if (its_setup1()) {
+		migrate_skip();
 		return;
+	}
 
 	dev2 = its_get_device(2);
 	dev7 = its_get_device(7);
 
-	migrate_once();
+	migrate();
 
 	stats_reset();
 	cpumask_clear(&mask);
@@ -819,8 +821,10 @@ static void test_migrate_unmapped_collection(void)
 	int pe0 = 0;
 	u8 config;
 
-	if (its_setup1())
+	if (its_setup1()) {
+		migrate_skip();
 		return;
+	}
 
 	if (!errata(ERRATA_UNMAPPED_COLLECTIONS)) {
 		report_skip("Skipping test, as this test hangs without the fix. "
@@ -836,7 +840,7 @@ static void test_migrate_unmapped_collection(void)
 	its_send_mapti(dev2, 8192, 0, col);
 	gicv3_lpi_set_config(8192, LPI_PROP_DEFAULT);
 
-	migrate_once();
+	migrate();
 
 	/* on the destination, map the collection */
 	its_send_mapc(col, true);
@@ -875,8 +879,10 @@ static void test_its_pending_migration(void)
 	void *ptr;
 	int i;
 
-	if (its_prerequisites(4))
+	if (its_prerequisites(4)) {
+		migrate_skip();
 		return;
+	}
 
 	dev = its_create_device(2 /* dev id */, 8 /* nb_ites */);
 	its_send_mapd(dev, true);
@@ -923,7 +929,7 @@ static void test_its_pending_migration(void)
 	gicv3_lpi_rdist_enable(pe0);
 	gicv3_lpi_rdist_enable(pe1);
 
-	migrate_once();
+	migrate();
 
 	/* let's wait for the 256 LPIs to be handled */
 	mdelay(1000);
@@ -970,17 +976,14 @@ int main(int argc, char **argv)
 	} else if (!strcmp(argv[1], "its-migration")) {
 		report_prefix_push(argv[1]);
 		test_its_migration();
-		migrate_once();
 		report_prefix_pop();
 	} else if (!strcmp(argv[1], "its-pending-migration")) {
 		report_prefix_push(argv[1]);
 		test_its_pending_migration();
-		migrate_once();
 		report_prefix_pop();
 	} else if (!strcmp(argv[1], "its-migrate-unmapped-collection")) {
 		report_prefix_push(argv[1]);
 		test_migrate_unmapped_collection();
-		migrate_once();
 		report_prefix_pop();
 	} else if (strcmp(argv[1], "its-introspection") == 0) {
 		report_prefix_push(argv[1]);
diff --git a/s390x/migration-cmm.c b/s390x/migration-cmm.c
index 43673f18e..b4043a80e 100644
--- a/s390x/migration-cmm.c
+++ b/s390x/migration-cmm.c
@@ -55,12 +55,12 @@ int main(void)
 {
 	report_prefix_push("migration-cmm");
 
-	if (!check_essa_available())
+	if (!check_essa_available()) {
 		report_skip("ESSA is not available");
-	else
+		migrate_skip();
+	} else {
 		test_migration();
-
-	migrate_once();
+	}
 
 	report_prefix_pop();
 	return report_summary();
diff --git a/s390x/migration-skey.c b/s390x/migration-skey.c
index 8d6d8ecfe..1a196ae1e 100644
--- a/s390x/migration-skey.c
+++ b/s390x/migration-skey.c
@@ -169,6 +169,7 @@ static void test_skey_migration_parallel(void)
 
 	if (smp_query_num_cpus() == 1) {
 		report_skip("need at least 2 cpus for this test");
+		migrate_skip();
 		goto error;
 	}
 
@@ -233,6 +234,7 @@ int main(int argc, char **argv)
 
 	if (test_facility(169)) {
 		report_skip("storage key removal facility is active");
+		migrate_skip();
 		goto error;
 	}
 
@@ -247,11 +249,11 @@ int main(int argc, char **argv)
 		break;
 	default:
 		print_usage();
+		migrate_skip();
 		break;
 	}
 
 error:
-	migrate_once();
 	report_prefix_pop();
 	return report_summary();
 }
diff --git a/s390x/migration.c b/s390x/migration.c
index 269e272de..115afb731 100644
--- a/s390x/migration.c
+++ b/s390x/migration.c
@@ -164,6 +164,7 @@ int main(void)
 
 	if (smp_query_num_cpus() == 1) {
 		report_skip("need at least 2 cpus for this test");
+		migrate_skip();
 		goto done;
 	}
 
-- 
2.42.0

