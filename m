Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B58387F8FB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:10:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LKQvCwiJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPXy0L0Cz3w5b
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:10:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LKQvCwiJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235; helo=mail-oi1-x235.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPKT4w66z3vYT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 19:00:29 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3c38d4b670bso826664b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835227; x=1711440027; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0y0odnkHg56MP9cN9AQCJ0tr4xMulM+8pNx+P8ve/gI=;
        b=LKQvCwiJWHKA02GMEDD89YgU+W/MCUecYdj8DygVYNRzGtc+OdESpDvAm3S1MBZmkR
         E+/uKSnzhzpIni6R0hcD9SPTi3UQbE8SVmxuDfquON6hj3MbRUsDqbepGbYkXePC5C2i
         Dt6dKlCWGNCthlYWWAiJV0kkMuZJhdCq8IwEPdwmu3eg1haTh7HY3YIZHpW3RzaCG266
         Ar6gbegqNTNwtvZoBvF+pLRFIMJDgouqvhO+TcpniW8PM0JtrttfzchItTPO3d7Ci6ng
         9YQAdAPYeiJGP5DWzWW+jM/CvNjqMg+JUWYHu7RNZWqAEnjAvyHP06x1tFrwcdTA1p9H
         AI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835227; x=1711440027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0y0odnkHg56MP9cN9AQCJ0tr4xMulM+8pNx+P8ve/gI=;
        b=Jtw4a5f+ZNFnlHmJDhNG7WlUv4lWQSgCK97WngwmM7Y5Dy6xchSeN3wgA2/yEJBfLd
         x2diYZPWt3dbRc+MqRrn+yRZKGbAQzrxL/Ly2tsHru5J//mOmLNjmozv9BZZ3Wtvz7ft
         PcD62rOOp6tw4EDJAkjEuoh1QllNCmYrld83cJu3sLXgGkeZ94B4fI9M+xV9aMvOLYIC
         Wss9qTx+1P48B0C4nL45AdlKKDM1qiCkZL9coACjzYnb9wu04H/h27O5oXShqssmEwAx
         5N+brcStjuURVSvOnigptDgpYzKUV9u3r1dqu25StKedLmgyLpMQQXWBj6vhtPT4gdlo
         MtRw==
X-Forwarded-Encrypted: i=1; AJvYcCV3rT7ps3kZsCHRtLw24M7xjtxvKyC3272N6LJz17zU8JBuKI51rqXd2jY7ac2e1o6OecGJkmnf823h74wSqQ5tTphKNF4/lK34hNgmag==
X-Gm-Message-State: AOJu0YyOczs1JWPNvZOmJ0F5u51bqee+TRthvnNtqaaKq+e0bFRygs8k
	PU3E4IsOYv3SV7dPu3QEVslm2czF+r8uwu5uN0NpWK217HAulqww
X-Google-Smtp-Source: AGHT+IF9aDLZUPosgy6rpk16ZaqRepm+7B0h+dF+YDWbgQFj5DBzE5ABhTXmbPl0bJZP9AS+TMu9Gg==
X-Received: by 2002:a05:6808:f0a:b0:3c3:69a2:4248 with SMTP id m10-20020a0568080f0a00b003c369a24248mr16079802oiw.28.1710835226966;
        Tue, 19 Mar 2024 01:00:26 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.01.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:00:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 14/35] scripts: allow machine option to be specified in unittests.cfg
Date: Tue, 19 Mar 2024 17:59:05 +1000
Message-ID: <20240319075926.2422707-15-npiggin@gmail.com>
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
2.42.0

