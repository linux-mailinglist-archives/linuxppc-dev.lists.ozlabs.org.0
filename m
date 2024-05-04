Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF4B8BBB66
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 14:34:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ibDglOUS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWnDr0nvqz3fnD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 22:34:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ibDglOUS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWn6R4zqqz30WP
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 22:29:19 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6ee13f19e7eso479364b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 May 2024 05:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714825758; x=1715430558; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGMJSfkN2PfJHtxLiOclIw2fyyzbggN8HHskSwcg0zA=;
        b=ibDglOUS5wike1/kezZY+Mi1rSp+4SXIiT7fcRqZCQF8OwtpEMCufkyKq5UvpxOcue
         TyRF922DdpMe5GtSP2ksf8aEdjuQ0GkR7pJ20B4IIUGXJbOpv6YpJzIqprk2Dfr5I1Tq
         V5PQqzouZkrL2qTWniYjKwHyt8+RiIa9ae/b+Kc9D+8MX7O4jZVBWsa2ZJ/4Kb3bxpmM
         q/nRtizldbaE+hXHVsn7cCzjDUZ/SaeK7FM1aLXky/znA47iP8skM9rtUOP0shUsJlDG
         EMdoZpeUK8Yx/tCEZMWZYxt0HWcAqThlWKo8Qn5KCnN0MjjCD95L2ZznuVuh2qwSJdkx
         jduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825758; x=1715430558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGMJSfkN2PfJHtxLiOclIw2fyyzbggN8HHskSwcg0zA=;
        b=P9AvWb8lGviZzfFZYOOcll8Ax29BE3RkhlU/VmtxXZrFlMfcJioaB14EWcICy1qfdb
         svD/3FiDmpw8SdFOxkS8NEPtkuwMQIbG5+bDm3JechB4rJ0t4f+MlhWaYpWAjZViC+/y
         9FH5cFugeAT4J1hztcSy9tQS7iDdk43NltWc2AUGJGwB36WbNZS0H/b5mfiNPc79sJPs
         eCRwKafVdsN6Mf3ukpyji3StFkoCubYCHlIUnofLHAWuRMYHYQu+ettqnukaOLdcijoE
         YA3xsOoOq1uPfi5p0tkQKvdoej16reHu5Ivj7eO6BX+SKyY0FQPWdcaRCaQPxdPDng6N
         Z17Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdzFFaODdBRmPt5D6uyhQPrWvinRNwZBcGSf2ISKi8A6bJua3mU00J4ZatLfHfm2yo72vtN3vR8heC4zUg5Fy6Vujoz4HCFfd+YB2wpg==
X-Gm-Message-State: AOJu0YwguQlNiE7mHodQa8qdPJiE5pHNyAeg9kpWgZXgD9Ge1m/878MO
	THpoa6oB1K4IfubOBShlI7Y192KqqWJNXBJqvyE/3VDk0Np+dyqh
X-Google-Smtp-Source: AGHT+IF4Gwv3VCJ87TdHGNnmmkZNl82UF42Fzg7O1j26MYNkfF8j7hnGLUzlLI5XVds3TNEaAqZ0bg==
X-Received: by 2002:a05:6a00:4e4e:b0:6f4:5531:7ce4 with SMTP id gu14-20020a056a004e4e00b006f455317ce4mr2694549pfb.33.1714825757985;
        Sat, 04 May 2024 05:29:17 -0700 (PDT)
Received: from wheely.local0.net (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a000a9000b006f4473daa38sm3480068pfl.128.2024.05.04.05.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:29:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v9 07/31] scripts: allow machine option to be specified in unittests.cfg
Date: Sat,  4 May 2024 22:28:13 +1000
Message-ID: <20240504122841.1177683-8-npiggin@gmail.com>
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

This allows different machines with different requirements to be
supported by run_tests.sh, similarly to how different accelerators
are handled.

Acked-by: Thomas Huth <thuth@redhat.com>
Acked-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 docs/unittests.txt   |  7 +++++++
 scripts/common.bash  |  8 ++++++--
 scripts/runtime.bash | 16 ++++++++++++----
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/docs/unittests.txt b/docs/unittests.txt
index 7cf2c55ad..6449efd78 100644
--- a/docs/unittests.txt
+++ b/docs/unittests.txt
@@ -42,6 +42,13 @@ For <arch>/ directories that support multiple architectures, this restricts
 the test to the specified arch. By default, the test will run on any
 architecture.
 
+machine
+-------
+For those architectures that support multiple machine types, this restricts
+the test to the specified machine. By default, the test will run on
+any machine type. (Note, the machine can be specified with the MACHINE=
+environment variable, and defaults to the architecture's default.)
+
 smp
 ---
 smp = <number>
diff --git a/scripts/common.bash b/scripts/common.bash
index 5e9ad53e2..3aa557c8c 100644
--- a/scripts/common.bash
+++ b/scripts/common.bash
@@ -10,6 +10,7 @@ function for_each_unittest()
 	local opts
 	local groups
 	local arch
+	local machine
 	local check
 	local accel
 	local timeout
@@ -21,7 +22,7 @@ function for_each_unittest()
 		if [[ "$line" =~ ^\[(.*)\]$ ]]; then
 			rematch=${BASH_REMATCH[1]}
 			if [ -n "${testname}" ]; then
-				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$check" "$accel" "$timeout"
+				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
 			fi
 			testname=$rematch
 			smp=1
@@ -29,6 +30,7 @@ function for_each_unittest()
 			opts=""
 			groups=""
 			arch=""
+			machine=""
 			check=""
 			accel=""
 			timeout=""
@@ -58,6 +60,8 @@ function for_each_unittest()
 			groups=${BASH_REMATCH[1]}
 		elif [[ $line =~ ^arch\ *=\ *(.*)$ ]]; then
 			arch=${BASH_REMATCH[1]}
+		elif [[ $line =~ ^machine\ *=\ *(.*)$ ]]; then
+			machine=${BASH_REMATCH[1]}
 		elif [[ $line =~ ^check\ *=\ *(.*)$ ]]; then
 			check=${BASH_REMATCH[1]}
 		elif [[ $line =~ ^accel\ *=\ *(.*)$ ]]; then
@@ -67,7 +71,7 @@ function for_each_unittest()
 		fi
 	done
 	if [ -n "${testname}" ]; then
-		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$check" "$accel" "$timeout"
+		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
 	fi
 	exec {fd}<&-
 }
diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 177b62166..0c96d6ea2 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -32,7 +32,7 @@ premature_failure()
 get_cmdline()
 {
     local kernel=$1
-    echo "TESTNAME=$testname TIMEOUT=$timeout ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $opts"
+    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $opts"
 }
 
 skip_nodefault()
@@ -80,9 +80,10 @@ function run()
     local kernel="$4"
     local opts="$5"
     local arch="$6"
-    local check="${CHECK:-$7}"
-    local accel="$8"
-    local timeout="${9:-$TIMEOUT}" # unittests.cfg overrides the default
+    local machine="$7"
+    local check="${CHECK:-$8}"
+    local accel="$9"
+    local timeout="${10:-$TIMEOUT}" # unittests.cfg overrides the default
 
     if [ "${CONFIG_EFI}" == "y" ]; then
         kernel=${kernel/%.flat/.efi}
@@ -116,6 +117,13 @@ function run()
         return 2
     fi
 
+    if [ -n "$machine" ] && [ -n "$MACHINE" ] && [ "$machine" != "$MACHINE" ]; then
+        print_result "SKIP" $testname "" "$machine only"
+        return 2
+    elif [ -n "$MACHINE" ]; then
+        machine="$MACHINE"
+    fi
+
     if [ -n "$accel" ] && [ -n "$ACCEL" ] && [ "$accel" != "$ACCEL" ]; then
         print_result "SKIP" $testname "" "$accel only, but ACCEL=$ACCEL"
         return 2
-- 
2.43.0

