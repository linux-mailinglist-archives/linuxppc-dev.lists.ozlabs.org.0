Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BC88BBB4F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 14:31:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DgZ0+Ooy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWn8X71mJz3ck4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 22:31:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DgZ0+Ooy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWn6568xNz30Kd
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 22:29:01 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6f45f1179c3so179796b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 May 2024 05:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714825739; x=1715430539; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRZJRuRRFLhuP09XIFiRVicmhI/6wcE/f1lbmYTsJ8g=;
        b=DgZ0+OoyTccoanFFr1ye6PAbuiQzrBXapu/SuwnwtZ+j1XJfNRSjX3xXCDSJoBkdvL
         ci6pCUy6aF4hFiw0OOOlkM7LK0y97TCIZa/74c9HpXrPTTcTvehuN/Ot0GNNfsNIA1Ji
         Jn0VLHwxK9itogLRkZpQEgNkA/AwSOmp1b9PZQzrR+pJG+eZFcLv+gsR/K11u6OU5f4V
         oHwgEDPGxmLJFSoUx0npD3tOcLReMUO4sfqvAmxj+I+vbxAkh+/1EleLxD/smjBbY/bZ
         VwiVSpCLsFG0kgGreRGbZcHqxHEXzEYuumVGE49ruw+ZLOKX+er0tK1jEPhjcKdXa3il
         Ry3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825739; x=1715430539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRZJRuRRFLhuP09XIFiRVicmhI/6wcE/f1lbmYTsJ8g=;
        b=lo92ryBzzjlu83VFiELu9WrPZvQUAw4wE3MOqc3EYd9kz23iujtpRktulkAPs9pjlP
         7vO5+rQysdBwnkjRjpxWeOjITd2Qj6dcHWJpCVBX+ALwAw7xvFaNjX169PasP4APGLF1
         +uZG3eTt1+mIjK4OdIE+JJczhJ+c8w4aQJkn23xUobqQEkn5P0swfUR8V5MFG4h5BdeA
         +Yw0Vaj5G0qyzu/V7mtAuGW6zzAj1ZkR2wspwFLfzchJ3dsknCRf2/OZt/DRHCDEE+7s
         WCTpWsbWh2/EwMTndtKRdFE3T4l7QbixyqL97+vu+oLUW1+oLhLUvqCTZY95qBQNgfVq
         66cA==
X-Forwarded-Encrypted: i=1; AJvYcCV2TExqOZe8kRApiJQeLUz8tzgvSEA5SYxEOYtCz4h1cebDIPmT57Z/OpXn42L9QNBwRxcTkf8mKuOzcLz/iVk4gu1OM+iQCThLHToIGA==
X-Gm-Message-State: AOJu0YxIwjQ7+pIp606uGp7xq6AiKppNY59BJLWkg+TK0cvIIZGu7iY5
	iHTfEkNUNSNRyN5ltB82xZyqda0tpepd2Ejd3sp1ucd6W2td5Es1
X-Google-Smtp-Source: AGHT+IFTNbNHpMpZNjRXGh0JKa5s+AXqP40FKU9v2kc69wA5Y0uIM7vdJmn5XaSEQllotSM8lvtZ3g==
X-Received: by 2002:a05:6a00:2da6:b0:6ed:e1c:1034 with SMTP id fb38-20020a056a002da600b006ed0e1c1034mr5646333pfb.34.1714825739079;
        Sat, 04 May 2024 05:28:59 -0700 (PDT)
Received: from wheely.local0.net (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a000a9000b006f4473daa38sm3480068pfl.128.2024.05.04.05.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:28:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v9 02/31] report: Add known failure reporting option
Date: Sat,  4 May 2024 22:28:08 +1000
Message-ID: <20240504122841.1177683-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504122841.1177683-1-npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are times we would like to test a function that is known to fail
in some conditions due to a bug in implementation (QEMU, KVM, or even
hardware). It would be nice to count these as known failures and not
report a summary failure.

xfail is not the same thing, xfail means failure is required and a pass
causes the test to fail. So add kfail for known failures.

Mark the failing ppc64 h_cede_tm and spapr_vpa tests as kfail.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/libcflat.h |  2 ++
 lib/report.c   | 33 +++++++++++++++++++++++++--------
 2 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/lib/libcflat.h b/lib/libcflat.h
index 700f43527..ae3c2c6d0 100644
--- a/lib/libcflat.h
+++ b/lib/libcflat.h
@@ -100,6 +100,8 @@ extern void report(bool pass, const char *msg_fmt, ...)
 		__attribute__((format(printf, 2, 3), nonnull(2)));
 extern void report_xfail(bool xfail, bool pass, const char *msg_fmt, ...)
 		__attribute__((format(printf, 3, 4), nonnull(3)));
+extern void report_kfail(bool kfail, bool pass, const char *msg_fmt, ...)
+		__attribute__((format(printf, 3, 4), nonnull(3)));
 extern void report_abort(const char *msg_fmt, ...)
 					__attribute__((format(printf, 1, 2)))
 					__attribute__((noreturn));
diff --git a/lib/report.c b/lib/report.c
index 8e9bff5b8..7f3c4f059 100644
--- a/lib/report.c
+++ b/lib/report.c
@@ -13,7 +13,7 @@
 #include "libcflat.h"
 #include "asm/spinlock.h"
 
-static unsigned int tests, failures, xfailures, skipped;
+static unsigned int tests, failures, xfailures, kfailures, skipped;
 static char prefixes[256];
 static struct spinlock lock;
 
@@ -81,11 +81,12 @@ void report_prefix_pop(void)
 }
 
 static void va_report(const char *msg_fmt,
-		bool pass, bool xfail, bool skip, va_list va)
+		bool pass, bool xfail, bool kfail, bool skip, va_list va)
 {
 	const char *prefix = skip ? "SKIP"
 				  : xfail ? (pass ? "XPASS" : "XFAIL")
-					  : (pass ? "PASS"  : "FAIL");
+				          : kfail ? (pass ? "PASS" : "KFAIL")
+					          : (pass ? "PASS"  : "FAIL");
 
 	spin_lock(&lock);
 
@@ -98,6 +99,8 @@ static void va_report(const char *msg_fmt,
 		skipped++;
 	else if (xfail && !pass)
 		xfailures++;
+	else if (kfail && !pass)
+		kfailures++;
 	else if (xfail || !pass)
 		failures++;
 
@@ -108,7 +111,7 @@ void report(bool pass, const char *msg_fmt, ...)
 {
 	va_list va;
 	va_start(va, msg_fmt);
-	va_report(msg_fmt, pass, false, false, va);
+	va_report(msg_fmt, pass, false, false, false, va);
 	va_end(va);
 }
 
@@ -117,7 +120,7 @@ void report_pass(const char *msg_fmt, ...)
 	va_list va;
 
 	va_start(va, msg_fmt);
-	va_report(msg_fmt, true, false, false, va);
+	va_report(msg_fmt, true, false, false, false, va);
 	va_end(va);
 }
 
@@ -126,7 +129,7 @@ void report_fail(const char *msg_fmt, ...)
 	va_list va;
 
 	va_start(va, msg_fmt);
-	va_report(msg_fmt, false, false, false, va);
+	va_report(msg_fmt, false, false, false, false, va);
 	va_end(va);
 }
 
@@ -134,7 +137,19 @@ void report_xfail(bool xfail, bool pass, const char *msg_fmt, ...)
 {
 	va_list va;
 	va_start(va, msg_fmt);
-	va_report(msg_fmt, pass, xfail, false, va);
+	va_report(msg_fmt, pass, xfail, false, false, va);
+	va_end(va);
+}
+
+/*
+ * kfail is known failure. If kfail is true then test will succeed
+ * regardless of pass.
+ */
+void report_kfail(bool kfail, bool pass, const char *msg_fmt, ...)
+{
+	va_list va;
+	va_start(va, msg_fmt);
+	va_report(msg_fmt, pass, false, kfail, false, va);
 	va_end(va);
 }
 
@@ -142,7 +157,7 @@ void report_skip(const char *msg_fmt, ...)
 {
 	va_list va;
 	va_start(va, msg_fmt);
-	va_report(msg_fmt, false, false, true, va);
+	va_report(msg_fmt, false, false, false, true, va);
 	va_end(va);
 }
 
@@ -168,6 +183,8 @@ int report_summary(void)
 	printf("SUMMARY: %d tests", tests);
 	if (failures)
 		printf(", %d unexpected failures", failures);
+	if (kfailures)
+		printf(", %d known failures", kfailures);
 	if (xfailures)
 		printf(", %d expected failures", xfailures);
 	if (skipped)
-- 
2.43.0

