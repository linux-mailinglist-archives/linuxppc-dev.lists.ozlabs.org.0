Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E0987F8D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:04:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fllXKGbQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPPX557Bz3vnh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:04:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fllXKGbQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPJv0Yx7z3dVf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 18:59:58 +1100 (AEDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-221ffba5c8bso3924942fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 00:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835190; x=1711439990; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10lGgDqnsMt0XwfaOryIvipVXVv9JLsYtLmwhCPRr0M=;
        b=fllXKGbQ594R0HxuJWQyEYdprVLtEwBu/mnlnmuyFW8fGVatxkH/Zy4Q3C7bKbs1lQ
         xN2nMzHrJU12efyxEIObYFa4Qhy+AyAdwG8QEdUUoU0Ro8hkse6sA1ZB7S/HHKWFoKIW
         U+tGNOXtZlwjOEm73KsvhtVdFajSAuYZV9hOPnT+xg4RMzsWoZsmmL1Id0DfVrUQJ1/B
         Fjcrbfl3xSWJ8YEwR2Jycz7h8B8KrNID6ba4tsah+V8/3j/G+48LVguE8M0KciXYweCx
         0sdVNGU3mH9hY1JLzX9aT3rOQqIPRTT5NnKNhXajIftqwC38avGvva24/t2eO/lS7UOt
         JbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835190; x=1711439990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10lGgDqnsMt0XwfaOryIvipVXVv9JLsYtLmwhCPRr0M=;
        b=SQDPMaJM65M32RegudE24r5mz273GpqK5RlrUAqrYl6P2LbzwtAL/zptgwRsKt5OGm
         0S6OqHWudi4W5cvZ7ttV1kVb637rzIkhUmX1DVDY1r6XOvzoyNZIW9nnvoB0Pe8U6NSw
         DAHiQeNx+X/tROOyhLNX+VroU84GbZ+O9F6hNdEQDU/bUJouds0JInoF7FqyEC1ezWcC
         hIq+j1KPqspTiZyW3gOrYIANgN6UD/N5cGu5x8+P7V+3FifrjK+u3oYDwR8T4Q7JtmBE
         HWgVEJEUMRNhoGaTjxjRW4dHRvO7/Uzaw3LH69MZBzeDPowb8Xiz8HGCfegZcFiAh8nL
         URkA==
X-Forwarded-Encrypted: i=1; AJvYcCXy82EZY+LtNLkiRiZ7czn9eHgux+X0klalqklKviWBMsHaEtjSNv/zCW7UoLRnvK528pDKfnoK98xlkUwSqhcquc2qNQwOK6jK+VN7lQ==
X-Gm-Message-State: AOJu0Yzz8uM5Q3YrluZRy5KY29iBWq+GxB9pIW6VSUNco7VoQLHk8++w
	gYT1nsThm1PFEyI7+2qFKwEWM6UIK8AGna4r/IrlkQC9FYjOJQ7E
X-Google-Smtp-Source: AGHT+IEHA5cS3U9V0i0I4RyX7h8FZvucKUvdH1mBrotXbjx1EaX70J8HT3P3/TbrepxQrYOrIZQcZg==
X-Received: by 2002:a05:6871:7411:b0:21f:d4ee:ae01 with SMTP id nw17-20020a056871741100b0021fd4eeae01mr15154634oac.18.1710835190083;
        Tue, 19 Mar 2024 00:59:50 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.00.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 00:59:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 04/35] (arm|s390): Use migrate_skip in test cases
Date: Tue, 19 Mar 2024 17:58:55 +1000
Message-ID: <20240319075926.2422707-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240319075926.2422707-1-npiggin@gmail.com>
References: <20240319075926.2422707-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Have tests use the new migrate_skip command in skip paths, rather than
calling migrate_once to prevent harness reporting an error.

s390x/migration.c adds a new command that looks like it was missing
previously.

Reviewed-by: Thomas Huth <thuth@redhat.com>
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

