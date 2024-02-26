Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D03E867083
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:19:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dEywhv/k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjxSW1D1wz3vh9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:19:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dEywhv/k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjxJn1FLKz3dh2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:13:12 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5dbf7b74402so2326196a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 02:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708942390; x=1709547190; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibxxwYww92kmlNy8I2FmvONCg7yA0hsHQ/uPKW/vpvM=;
        b=dEywhv/kAE32v2OM+F2fl7JVE97QfTIt2vLuqbWGtgjQfuKDLle1AehZxmoTZmIrQM
         QrmfaKObHkyza0p+j+cQGq1Cf2IwhVKHjWFv/ZKQbXza+JR4xlxDzXDTBFUJDQeQBeOa
         ujyolUmYGb9DpVc7vn8SpRzmh7OXcH2BqZfJXCJfk4g59GEqzIzC/f4ZtjWbQbHfFpQN
         ILafT6bjk4l05RPiAQjubtsmT6iFtH6Ioc0Q3pifZTZgKl/bh1gnbGFg0+8VPpvRg2jC
         MdI+RixP/r4SWxW82UpyU7PNoWzQABfTvngsPlQCrDCXJqqQEIpRka0+PTclBpGfgHKc
         cvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708942390; x=1709547190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibxxwYww92kmlNy8I2FmvONCg7yA0hsHQ/uPKW/vpvM=;
        b=OGDjAdyNH82ABto7NRnW+wuh16jcy7d+K5IXpWMoQTPCORCghGvOg/zsCzdkqaRZPG
         a4RSi+BFOv33U8R9xcJYm513JipE3RJPoWaXU1w32fhnY4k2MFo4ErzkOh4x1Q+6PfGS
         5fxJ1fWVsQzL4ROvti25yCwxdOFvtxJQRGRbkCjizDlljV3LvUTqVV6q89carJRCXIFh
         LxTJtjtBIxpVcImUaxbXQ2f9UYqBhHrSs9HsgHTZLC2//rs4ajZY793xwQnquPDi4L6W
         xX7Y38uM89awfO9wDA9bjamAoWQKb+Ndc/Tpek+STdJp/6esYFkwp6f62L/7JVZnsPjs
         kunQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVBFJ2euFPmq0syZYPpXA8YrjbiBz+inBQoOz2HbHyxKSgpIL10rfVIW40oTzBVpkL3Xhvut3Qzxll/6DVRTu9vfcyPzOO5U0/lg7AYg==
X-Gm-Message-State: AOJu0YyFlKdRmNh1ePuJvGtHmSpj4JfrDLyWnJxzcj8CGbokWbb85H6n
	un3xS1dBEQLwrTXJaLTxh5y7swEhTCpRsP3+olBCdOrFZ26MX6Zl
X-Google-Smtp-Source: AGHT+IFka2ncRxwgdU5+LqoyMrXm720L3nBJvm6PweGVGm1ggkLbMOftr1Jz9ko+3ETODmRo47wVeg==
X-Received: by 2002:a05:6a20:9d92:b0:1a0:ccf2:8f35 with SMTP id mu18-20020a056a209d9200b001a0ccf28f35mr5515837pzb.39.1708942390587;
        Mon, 26 Feb 2024 02:13:10 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id x24-20020aa784d8000000b006e463414493sm3626693pfn.105.2024.02.26.02.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:13:10 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 09/32] scripts: allow machine option to be specified in unittests.cfg
Date: Mon, 26 Feb 2024 20:11:55 +1000
Message-ID: <20240226101218.1472843-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240226101218.1472843-1-npiggin@gmail.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This allows different machines with different requirements to be
supported by run_tests.sh, similarly to how different accelerators
are handled.

Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/common.bash  |  8 ++++++--
 scripts/runtime.bash | 16 ++++++++++++----
 2 files changed, 18 insertions(+), 6 deletions(-)

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
index c73fb0240..8f9672d0d 100644
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

