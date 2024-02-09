Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8931F84F0A3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 08:07:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S3U5sgKz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWQ0j3GYKz3vkG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 18:07:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S3U5sgKz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWPv44LXBz3cRY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 18:02:56 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d8da50bffaso3300895ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Feb 2024 23:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707462175; x=1708066975; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVEm/pYZkdeEDIy5KjMBW2u/cmIIhledzwTk6k6esVw=;
        b=S3U5sgKz3Z0AI/rscNCLaKek6JsiZdrAfd4rv4UuY6fJFya2iPKdnj7lFePXnjMFOQ
         ITlSBwJIRA2Ne4cE9z4ArkidhHnQiDs1Y8mW1Urr+PcJRoZ4rv0y+CMbtEEwXelqCDyy
         tePRjtAY8qRF+4UMG5pOUfdEW7VhIQB84xP1yCfUrRuZ1Z3Gcq/qh77PLDFk6uc2+28D
         0oSg4M3nghgWPuMuzCPxEiK2O7A8FaXmvMeuRQmPiPWPU5Eh/ii6MOFtN9TDy1lcg0ra
         3VUr8YJiCyd9r8gi68jnjTnAyBKZO9q2g3v+fzQKm+cy45En5E0ZiRp3Apr54kd73HkS
         0lIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707462175; x=1708066975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVEm/pYZkdeEDIy5KjMBW2u/cmIIhledzwTk6k6esVw=;
        b=bynFVpFb5ULCFpzMsKXKf8mb0NJ4wm8ZPOfhG88bRV3piHxFty0NUqqqmYKggn3ezF
         ApC/joUuDi+Rlk9ZE+xiVAObsoaMV0u7iU3XAgGoduo8o4O8Pe82Iamspj7QK2bfrz8W
         ZJzvz+PTJrXyvGZVc3jYW7neUJV41sGiS3heaFsiQ39IzAutppanjkzvOtvLbLqyNwZT
         EwVCpQ842x3pY8eH4uM8+0JbNQz4fXuc4i+RJS/JMJNWXAQX7yPXMBceoodWnD+rvT/m
         VG3QUHTywbZfdYPn1LFW5bnrkRk5TBeorloJL10aQG7oNRclvwolQikXKMfLMpRnHjOx
         S7zg==
X-Forwarded-Encrypted: i=1; AJvYcCVWZGF6/7Sd4WwtzXgd78jDeJsJffQL/moYO3l9qN52xr9XI5ofFSAJxG9d+4YSIHelPDeIxxzFNox0P83eRz35A1+TnYxSphhSFG9z0Q==
X-Gm-Message-State: AOJu0YxPz3veWagN21Lfa5WNXl4ynOl8xiN+8/5JJi2DgavOpXqc96hs
	hOluQ/fxXaB6aBOt2q7dO4+34NlXT2j1Pg1vtmc4mIzeQkrfOt3R
X-Google-Smtp-Source: AGHT+IEQnwNqYZV7NMmdpTLfryCzZT99JVrOcx1KoOE4uHx45cY4W8kkhKefaUBVdiD8mo8fym4z7Q==
X-Received: by 2002:a17:902:fe0c:b0:1d9:7e40:6c2b with SMTP id g12-20020a170902fe0c00b001d97e406c2bmr719014plj.32.1707462174901;
        Thu, 08 Feb 2024 23:02:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVX4sftCfg4C1MSLp4Dd5cmlgcIFACd8suRXWy8FwyF/WhEh7XciVerXpPJy64oDODvV3AucCySya4eOUXdlcnXqW+f/Id3bqxOHfAkc+qYtY0JcJ0r9GRjOgjodKtFXzX2/2iNQDiL0P3bRbv0/FF8hTGhuR9RNSD9qHJ82fJ2SCmMmWU8UyOSROZG7EQWwQy0iT6waqxES1rsQOsaN0OtZh5CRa8kOqdx0M+hXPlx5UZPr4TSN3t3eiVb2EpVEXPtk1aAsNwP4jCOVqu6NBIojn5EWj3VU8oYvzq6Caotl3E5FoGRoxPWZA351D+KCGvV+iSyRuf5PPLAQUxJEmbCPTsaDqSIzscWMulQwIeMokUgpeubCaxA/5DZUEOhZKNUt7QYuKqidmO66aa+vVj0ylBNnLiouvSSLSVExjuBvKlaM/P/LrbzkNvcWllv4FCLaVJYzveyqGyuO6HZKGT5kLYI+rWXwPH822UknKvlMB5sXYgG90c+9zXk2cHUVIcdzl2g4VtKtRKhJoJSIzVseqGfETA72fyXW1hZoxqSk8Ix3QS7RI1x
Received: from wheely.local0.net ([1.146.102.26])
        by smtp.gmail.com with ESMTPSA id r10-20020a170903410a00b001d7284b9461sm839285pld.128.2024.02.08.23.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 23:02:54 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v3 7/8] Add common/ directory for architecture-independent tests
Date: Fri,  9 Feb 2024 17:01:40 +1000
Message-ID: <20240209070141.421569-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240209070141.421569-1-npiggin@gmail.com>
References: <20240209070141.421569-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

x86/sieve.c is used by s390x, arm, and riscv via symbolic link. Make a
new directory common/ for architecture-independent tests and move
sieve.c here.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arm/sieve.c    |  2 +-
 common/sieve.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++
 riscv/sieve.c  |  2 +-
 s390x/sieve.c  |  2 +-
 x86/sieve.c    | 52 +-------------------------------------------------
 5 files changed, 55 insertions(+), 54 deletions(-)
 create mode 100644 common/sieve.c
 mode change 100644 => 120000 x86/sieve.c

diff --git a/arm/sieve.c b/arm/sieve.c
index 8f14a5c3..fe299f30 120000
--- a/arm/sieve.c
+++ b/arm/sieve.c
@@ -1 +1 @@
-../x86/sieve.c
\ No newline at end of file
+../common/sieve.c
\ No newline at end of file
diff --git a/common/sieve.c b/common/sieve.c
new file mode 100644
index 00000000..8150f2d9
--- /dev/null
+++ b/common/sieve.c
@@ -0,0 +1,51 @@
+#include "alloc.h"
+#include "libcflat.h"
+
+static int sieve(char* data, int size)
+{
+    int i, j, r = 0;
+
+    for (i = 0; i < size; ++i)
+	data[i] = 1;
+
+    data[0] = data[1] = 0;
+
+    for (i = 2; i < size; ++i)
+	if (data[i]) {
+	    ++r;
+	    for (j = i*2; j < size; j += i)
+		data[j] = 0;
+	}
+    return r;
+}
+
+static void test_sieve(const char *msg, char *data, int size)
+{
+    int r;
+
+    printf("%s:", msg);
+    r = sieve(data, size);
+    printf("%d out of %d\n", r, size);
+}
+
+#define STATIC_SIZE 1000000
+#define VSIZE 100000000
+char static_data[STATIC_SIZE];
+
+int main(void)
+{
+    void *v;
+    int i;
+
+    printf("starting sieve\n");
+    test_sieve("static", static_data, STATIC_SIZE);
+    setup_vm();
+    test_sieve("mapped", static_data, STATIC_SIZE);
+    for (i = 0; i < 3; ++i) {
+	v = malloc(VSIZE);
+	test_sieve("virtual", v, VSIZE);
+	free(v);
+    }
+
+    return 0;
+}
diff --git a/riscv/sieve.c b/riscv/sieve.c
index 8f14a5c3..fe299f30 120000
--- a/riscv/sieve.c
+++ b/riscv/sieve.c
@@ -1 +1 @@
-../x86/sieve.c
\ No newline at end of file
+../common/sieve.c
\ No newline at end of file
diff --git a/s390x/sieve.c b/s390x/sieve.c
index 8f14a5c3..fe299f30 120000
--- a/s390x/sieve.c
+++ b/s390x/sieve.c
@@ -1 +1 @@
-../x86/sieve.c
\ No newline at end of file
+../common/sieve.c
\ No newline at end of file
diff --git a/x86/sieve.c b/x86/sieve.c
deleted file mode 100644
index 8150f2d9..00000000
--- a/x86/sieve.c
+++ /dev/null
@@ -1,51 +0,0 @@
-#include "alloc.h"
-#include "libcflat.h"
-
-static int sieve(char* data, int size)
-{
-    int i, j, r = 0;
-
-    for (i = 0; i < size; ++i)
-	data[i] = 1;
-
-    data[0] = data[1] = 0;
-
-    for (i = 2; i < size; ++i)
-	if (data[i]) {
-	    ++r;
-	    for (j = i*2; j < size; j += i)
-		data[j] = 0;
-	}
-    return r;
-}
-
-static void test_sieve(const char *msg, char *data, int size)
-{
-    int r;
-
-    printf("%s:", msg);
-    r = sieve(data, size);
-    printf("%d out of %d\n", r, size);
-}
-
-#define STATIC_SIZE 1000000
-#define VSIZE 100000000
-char static_data[STATIC_SIZE];
-
-int main(void)
-{
-    void *v;
-    int i;
-
-    printf("starting sieve\n");
-    test_sieve("static", static_data, STATIC_SIZE);
-    setup_vm();
-    test_sieve("mapped", static_data, STATIC_SIZE);
-    for (i = 0; i < 3; ++i) {
-	v = malloc(VSIZE);
-	test_sieve("virtual", v, VSIZE);
-	free(v);
-    }
-
-    return 0;
-}
diff --git a/x86/sieve.c b/x86/sieve.c
new file mode 120000
index 00000000..fe299f30
--- /dev/null
+++ b/x86/sieve.c
@@ -0,0 +1 @@
+../common/sieve.c
\ No newline at end of file
-- 
2.42.0

