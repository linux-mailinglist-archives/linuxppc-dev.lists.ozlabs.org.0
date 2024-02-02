Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 047608468F0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 08:04:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d0iJZhXA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TR6GL6TgHz3vsM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 18:04:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d0iJZhXA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TR6810sV6z3dBv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Feb 2024 17:59:12 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d8dc0172d7so11882825ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Feb 2024 22:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706857150; x=1707461950; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2A8b0YOIg6lGChxKQRkSufzy4suZ23mRhNBzFJEEdSM=;
        b=d0iJZhXAmXcF9LhcI9QNgoQwH8vop9y8p6TnbgLuTcqXrB3CJch8WPVxTdaFi71MkR
         wsGb/Es5Bi3L6TzMDv7hF/0zEK9rLHEORkYhT0YHfQcDzHFgt8ahtUqky+9fb54B7J/K
         GSv4ZX9bnoCocFF9axGFsBCwRbuEFI0JahPCDpBTPxsyeknrjBLTE6DvCUqRkYBXPMfN
         fRFTsUjmlnlli8VF3DLFGL8H82A+aBrQUgMiciL6dg9KfecGGgvIfAZoJHs4e4u6/O72
         miBeigBnnOmB+3eWt2k40KewY1SAbHJaKvu7XlRyy9mNI1A+LbYlN9zF8GEx/ScDaaFC
         ji9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706857150; x=1707461950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2A8b0YOIg6lGChxKQRkSufzy4suZ23mRhNBzFJEEdSM=;
        b=eBX4qb89aOMbRibs9/+hhhQYK4rQGFZ5YEb39txYkta4UE6LbLMQUtKy2FQ+ObI0nI
         SkIxkElihq/kr/lP+5gAivUFF26LZElTDpzoOGJ3tUZrWESIW+0rQ4m0crp/WRqXw8Tb
         DhTAtYrO4rN2hGCjolxelK6beuVO1aBxPUK+EnC/KwwslCmprldWbMNCNDN0lVK4BCUV
         yqRk3ou/qeiLXmN0AihF3fV9i9PF+Z8GZvPibBigt8ZDxtMeit/se0Ry93vnNGQdcXtH
         z0t7CzM5c1L1+lvMNfJ4rKH/rj1QsVX26PPALHy063LVQaDc/EuTg1FEzmHs4f7mFDEl
         99zg==
X-Gm-Message-State: AOJu0YzqYTXXxf7yoySvrAjNY3RUySxUGP3Ye/CaUUyL4zcHpQSBM+tJ
	2VGRqthcziQG2cadP1yx9DxihPlbYLOqZKCMnL1Ucp8VrPL723ru
X-Google-Smtp-Source: AGHT+IEFt7kfJGu61jZUZZl3OY3s2dKrBdsO6NiQuZ9E3dIRck/n/RDkAL+FrMyrpMKk6m8nizxRPw==
X-Received: by 2002:a17:902:7c97:b0:1d8:fae3:2216 with SMTP id y23-20020a1709027c9700b001d8fae32216mr5679839pll.35.1706857150341;
        Thu, 01 Feb 2024 22:59:10 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUYncYvmvYyn1bIo4nQyp/+E/FnRz/SeAmt64eUXq2CiSJIqXGaPkB7FxwGpzIlNiEzEzB+LkGRAgVN2ozGXSgcLqCVtAOixnufvjh5CF4R7/qutE1ZgrgE8KPEDt4fEwlzL5vi4cWxKE2403WAfOQvf2qfTnsOZzjq6Bmn0UG5URuvkXMko5RrllOPDZ6rWDnfJe/g/oThk6+GyqcslLMVeLxnrFBw8vNdmX7qajZ8/TLHzwe4MC82JvQe07k0oMntr18YdbhE4iIh2XZVXmUOqvb/OUVvkCBThcjEti0ruRHPUECZ6k6xtj42LMpSwYOklQ9yQrKG5eg1EI/PkK11hDlHCljnGJcrbLlaaeWFCOQqUIS36VObLTPRw2jRtK0FVwVPAm9AWYvxfHOoGpAtpmnBkf8oFFpaUF//HU8VfpLXiNqo3RpxpdXdPQIsTmbOtlx+UbGTdVN/GI9VfcohRq7mEAffaqJs/ZAwZ5xRv1zdOrnEkFhJGpUJORVnhWanLA8LXQ7azRg=
Received: from wheely.local0.net ([1.146.53.155])
        by smtp.gmail.com with ESMTPSA id d18-20020a170903209200b001d948adc19fsm905734plc.46.2024.02.01.22.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 22:59:10 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v2 8/9] Add common/ directory for architecture-independent tests
Date: Fri,  2 Feb 2024 16:57:39 +1000
Message-ID: <20240202065740.68643-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240202065740.68643-1-npiggin@gmail.com>
References: <20240202065740.68643-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

x86/sieve.c is used by s390x and arm via symbolic link. Make a new
directory common/ for architecture-independent tests and move
sieve.c here.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arm/sieve.c    |  2 +-
 common/sieve.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++
 s390x/sieve.c  |  2 +-
 x86/sieve.c    | 52 +-------------------------------------------------
 4 files changed, 54 insertions(+), 53 deletions(-)
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

