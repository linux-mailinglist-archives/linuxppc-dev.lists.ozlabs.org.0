Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 026B984F224
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 10:17:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K95CzqFN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWStX6TXjz3vjG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 20:17:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K95CzqFN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWSml6DsRz3clT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 20:12:39 +1100 (AEDT)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3bbbc6e51d0so402792b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Feb 2024 01:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707469957; x=1708074757; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AksW/xWOBo9VmX/69t4hhS8qRPramQT9Z7Ypigl0WA=;
        b=K95CzqFNLt0qEjhnVqUGTz0O8fezplxcuLQw7cBYgQealtQXCcFHWRVbyZ/Vq2zMyI
         Es41OqMZAyV9gPJUzr7BFIkeSfB+oZwg7XgSTrm++4Bv5A+7LMHG1WoRA+sJF/0fKmZ7
         9EVvssm5CLSZbW4fxFvqTr5gy5LPK6VCnFn4/3sM778B4N9N3QkR/MNg2EsHHuDJCN4o
         Ck5qXfnvnPbAdnScXPjkErBXurPePRcv1ukpmcO47iJYGJv2WokPHVT3tIK+A/dTAUSd
         th5pwAwS2bg0ueRruTNsUJFryeIy1RkJq09HxeHXNO3+bI/7M9TZzMOgx41V31IosgAZ
         H9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707469957; x=1708074757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+AksW/xWOBo9VmX/69t4hhS8qRPramQT9Z7Ypigl0WA=;
        b=Y6pV0IQK7FYj47feIguuXWmVGVBIgq85kZO6psR3uLu3AtBXlkMTqCIuqMcZbb5ZTJ
         TYDxbm5tjTD0iw0rAFNyZgZQoYOzrHXkejr1qdwR0/yrZQ9BL2u5+57qwAuJB5WLNd7D
         HdEcgo3EVD8ztpsQvf6XQWAt1t3EJ9vxc5PpNYNi5ityOPu5BcLeB3iiC+58UO4XVTJa
         rHaCKZ+l3Ki9wTeRCiRQpzF9Nr4Ec1/rMLfDHbuAjf0AAeJtKvo0D56wsO6owf4hh364
         E4+XYvmZAosgSDQpsk0ZCIVmUO2taECVAJRnTN1iPHsKHoBIU03xpfMRruNXCV/FhNRO
         7SRw==
X-Gm-Message-State: AOJu0Yz6gmK9juiZTzxv0cSkIArN9ZFtdhYfdey/VGmDsdcoaq+lQ6l8
	FPURWVnFgHDVmXe1WtGy6zEOnJ9RphWy+3YRMrSJy7SY4oIDS5TO
X-Google-Smtp-Source: AGHT+IEIHO/U6QjmJfygHFclXfxV0lUCeX5heQt+eUUVJ/hovB7xrXAgLx955AGicKrmFgk9n+BoKA==
X-Received: by 2002:a05:6808:2817:b0:3be:cdbd:5dd7 with SMTP id et23-20020a056808281700b003becdbd5dd7mr1020153oib.22.1707469956625;
        Fri, 09 Feb 2024 01:12:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVs4qVmLOg72KKuZcMy0BE7Ki258JyQKnchF94kWsJQhod9hUbwO0sAGfTmMkyPrrASwCq0D7tUe5yFIAgzO0TOZ3vHCBifsKHRhuln+uNTcU+E45AxYikhLN7WqNQA6kX0nJ1Mbk27Y3aPc8w0m3399xZKJKl4XgbLyCLXV6jdDt1jpJ1QrPjWfyx7OqDsM6kaSBg0zg6uHz/XNevzHcASmYePg5PlIFEqNew4wpWP4qHByjifIlUvbHfyZuHQdH8bcMLApowIbtbCpx9aSZ+2XpUdMAK3R/0FOQDsioy1JOYXZ8uQWSP5cJsmKg2QeSOfnxGt0iLNh0TcbTptf/op/dJkSilKsNT+sTB7czY0E+VkAViH4lfRfms072VbOoZ+zZXmVSsj0FCbqa7W7fO04f0u4e3GXuVizAvcjV/vKj3EMfWKOYbqKYB4z7wgxtwuqc1PrAMTIBhE09BejP9g6tlkYJzaPnRlSfJ5KHqlbElD0nn7ErsWzL+IhYYP3BHs6vh1wM+5kKO9rzOxxxnaqzwvTSJ1ZDtr4fqczCevhxa41nBzhKqi
Received: from wheely.local0.net ([118.208.150.76])
        by smtp.gmail.com with ESMTPSA id cb1-20020a056a02070100b005c1ce3c960bsm1101742pgb.50.2024.02.09.01.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 01:12:36 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v4 7/8] Add common/ directory for architecture-independent tests
Date: Fri,  9 Feb 2024 19:11:33 +1000
Message-ID: <20240209091134.600228-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240209091134.600228-1-npiggin@gmail.com>
References: <20240209091134.600228-1-npiggin@gmail.com>
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

Reviewed-by: Thomas Huth <thuth@redhat.com>
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

