Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC4289985C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:46:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YP4ftqRb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9sXt3wVJz3w9w
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:46:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YP4ftqRb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sKT6w1Zz3vZk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:36:45 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6ecf8ebff50so774071b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306203; x=1712911003; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQbx6UjediBeLlNcsWNM4lfZY/zhVIKWn4tLrrWPArY=;
        b=YP4ftqRbyk0kAkygEIJHiLRXBoQfkE/fQLSW4zu+vqCof2BIEuAyRXxM8+j0/l0VKx
         /UBKYX63AkV8ATVp+DzWvJD/IIsQobKBXlSg9tAgcUzREkyszpx7Ug2scs04aV1bJw2E
         lC2WBMRRQs+O0nHjGyLW+U0qVR7wsjLDzS5MEq9InMUc8cBSYzg2b3Dl/wLPz+je9E9F
         vtfQAdif/zFe7BdRiSfBwTj7TlzYMtzANDfDg6qEbZPJ5Oyod6dNeLMvuBsx7X3Lfned
         5/LzshK4NRl+bSz6MJtcdren3e6H5+qr2dbvZXub6ibagRYdXXVBCjDOMH/GMeeGJ9to
         f/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306203; x=1712911003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQbx6UjediBeLlNcsWNM4lfZY/zhVIKWn4tLrrWPArY=;
        b=U6jAiyOFMUZgKpxS4egAlWKDUGm0Pvu1wxkptPVLaHwwqjwP9W29M5Lm95F2oiIfNa
         IMXem1XxpRrfqrku1M05vVXJAmoJLWIaKgd5LrV/RcKaLs1aUVd6lRlUB0CTrvhbz4jf
         Gw7G50u2cxqhdjEo91p276FyuuT2yaRtR8mIg9npUtURS5p5MWIoxbc1859zkrCqiDt3
         uIf1gd8wIrM7YjLFt0mJYFciWmOkvKj59lUGCE8F2gXydLvjbPwj86SYyJ3cx8Sr0Crf
         mlnPUVlBTcnFGu2CUn2TBTMrBs5zYvzENnDaAYClZHSMdZO1M9/7YGNUNIF+YhbQRMjb
         Rx7w==
X-Forwarded-Encrypted: i=1; AJvYcCXtsIuo+XBtJTlQsCnHcD/YWIbtm6sVwA1A4IniFUuPmdxGeIPpJclpcPCumVogJAdnwP43u+yTcJ8e8bWTyXgqgk4g5Um/dixpaDY0ZQ==
X-Gm-Message-State: AOJu0Yxz+MoruIqUVLWWX6XTQyltSCwDaRqbN7+4rlb2t6qE3MyrI2HH
	vUjFKbKXwz3hVIsAyFZncrkwHOt+FrA9kcoJ1IXjnjF6gNdNJFJp
X-Google-Smtp-Source: AGHT+IFcw/uR74oa6sH/n17w8+m0KhHI45Aisa+Loe+RbZgjSwZ1p0b28ZKqppC36g1aKz8WPNG6rg==
X-Received: by 2002:a05:6a20:9154:b0:1a7:23ae:4421 with SMTP id x20-20020a056a20915400b001a723ae4421mr2401241pzc.24.1712306203180;
        Fri, 05 Apr 2024 01:36:43 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:36:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 14/35] scripts: allow machine option to be specified in unittests.cfg
Date: Fri,  5 Apr 2024 18:35:15 +1000
Message-ID: <20240405083539.374995-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405083539.374995-1-npiggin@gmail.com>
References: <20240405083539.374995-1-npiggin@gmail.com>
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

This allows different machines with different requirements to be
supported by run_tests.sh, similarly to how different accelerators
are handled.

Acked-by: Thomas Huth <thuth@redhat.com>
Acked-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 docs/unittests.txt   |  6 ++++++
 scripts/common.bash  |  8 ++++++--
 scripts/runtime.bash | 16 ++++++++++++----
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/docs/unittests.txt b/docs/unittests.txt
index 53e02077c..5b184723c 100644
--- a/docs/unittests.txt
+++ b/docs/unittests.txt
@@ -42,6 +42,12 @@ For <arch>/ directories that support multiple architectures, this restricts
 the test to the specified arch. By default, the test will run on any
 architecture.
 
+machine
+-------
+For those architectures that support multiple machine types, this allows
+machine-specific tests to be created. By default, the test will run on
+any machine type.
+
 smp
 ---
 smp = <number>
diff --git a/scripts/common.bash b/scripts/common.bash
index b9413d683..ee1dd8659 100644
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
index 255e756f2..a66940ead 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -30,7 +30,7 @@ premature_failure()
 get_cmdline()
 {
     local kernel=$1
-    echo "TESTNAME=$testname TIMEOUT=$timeout ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $opts"
+    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $opts"
 }
 
 skip_nodefault()
@@ -78,9 +78,10 @@ function run()
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
@@ -114,6 +115,13 @@ function run()
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

