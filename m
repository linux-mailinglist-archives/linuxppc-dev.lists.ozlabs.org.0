Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A026F8D70
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 May 2023 03:19:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCqTH46ZSz3fL6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 May 2023 11:19:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lw/5Q7+A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lw/5Q7+A;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCqSN4K6dz3bpn
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 May 2023 11:18:26 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1aaef97652fso16705265ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 May 2023 18:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683335903; x=1685927903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I3mByX97QrMgoU8Uta7VOC5M1C8ay0+5WBO2HWSRWaU=;
        b=lw/5Q7+Aczzf+VaUwfb2H5ePYi/uEF7yW1H7Ia9TMvYctdmYqCKZqybDDqZ8/A9mnR
         sxiabTdKxFMqF2xQzgmeszy05md0wKlamX8eFPKfIfvaI/OwlPImlpMURxEEaK7wJzc0
         CCahAcx6c5NywYqxOU3Iky51S7qLZENNyPIiES+Qd+XHz/XREsyRle8C1tLoBqPtPJXS
         Bz9Wb57YPHiHrHoBwAYrozlBBzG5plaFKCOdJlvbDU5Q1OUnk4CDWMxeqvY82ZvTTYzu
         1p+03eh3dc+c88semAiS8SKXveWidpdq8LAAoP3Put4ToyBvuyBnHqsDAKAJB5bIlybC
         MlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683335903; x=1685927903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I3mByX97QrMgoU8Uta7VOC5M1C8ay0+5WBO2HWSRWaU=;
        b=RHwwD8UfwQiSI8W919w68Y/Z9RIcmG1qyIbrFj853sk9ZYSm++c5UROj7vc6cmwmNE
         ITLNe2h20/5nrc/6E2Zv/8tq58phwD6FPFv0/OqR3RErNlQNOIEYIoA06DpW6IsczXME
         gDBsNKc6YoVI+jpZtJBUg3OfkynV5lDrrJrhJFWHZLLo1Sui7lvUZ2JDGwN0uJ0dSgXe
         PWGYwL06Qg7CE1DHVJ4uf/BtBa8xm7bwX2KxJq1rdEzEVCJZPDfswNvxDAkAQx9h2g6A
         w0+LzdlIYypTCuR/Iy/j1ZDilp8o859f1c8Y6NhH8iNZczORNS2nIirDo0A81UgbKGnc
         6dgA==
X-Gm-Message-State: AC+VfDymYWoRyrMkYLXkl9OTIaWRbaIHcpEYW2Syo0lFG7uswbTxo7ZU
	9Zo/7YN35gKsD4Y2OHybyUqzMy8AfX8=
X-Google-Smtp-Source: ACHHUZ7Lw86+SPnbDleeiUJj84IaSs/25dyu6mgNNajjxZ6UlAWVDy7qfrd7uE8s0NHoA9Ez13d6Vw==
X-Received: by 2002:a17:902:b685:b0:1aa:f46a:380a with SMTP id c5-20020a170902b68500b001aaf46a380amr2764573pls.26.1683335903007;
        Fri, 05 May 2023 18:18:23 -0700 (PDT)
Received: from wheely.local0.net (58-6-235-78.tpgi.com.au. [58.6.235.78])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902854500b001ab2b415cadsm2329680plo.84.2023.05.05.18.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 18:18:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64: Use -mprofile-kernel for big endian ELFv2 kernels
Date: Sat,  6 May 2023 11:18:14 +1000
Message-Id: <20230506011814.8766-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-mprofile-kernel is an optimised calling convention for mcount that
Linux  has only implemented with the ELFv2 ABI, so it was disabled for
big endian kernels. However it does work with ELFv2 big endian, so let's
allow that if the compiler supports it.

Cc: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Christophe had the good idea that we could use -mprofile-kernel for
ELFv2 BE. Unfortunately can't remove -pg due to lack of -mprofile-kernel
in clang, but this gives BE the nicer ftrace code with GCC at least.
Function tracer works for me with a BE kernel.

Thanks,
Nick

 arch/powerpc/Kconfig                            | 6 ++++--
 arch/powerpc/tools/gcc-check-mprofile-kernel.sh | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index a64bfd9b8a1d..bd2ee7af1342 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -547,8 +547,10 @@ config LD_HEAD_STUB_CATCH
 	  If unsure, say "N".
 
 config MPROFILE_KERNEL
-	depends on PPC64 && CPU_LITTLE_ENDIAN && FUNCTION_TRACER
-	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -I$(srctree)/include -D__KERNEL__)
+	depends on PPC64 && FUNCTION_TRACER
+	depends on CPU_LITTLE_ENDIAN || PPC64_BIG_ENDIAN_ELF_ABI_V2
+	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -mlittle-endian) if CPU_LITTLE_ENDIAN
+	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -mbig-endian) if CPU_BIG_ENDIAN
 
 config HOTPLUG_CPU
 	bool "Support for enabling/disabling CPUs"
diff --git a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
index 137f3376ac2b..e78c599251ff 100755
--- a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
+++ b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
@@ -14,13 +14,13 @@ set -o pipefail
 # Test whether the compile option -mprofile-kernel exists and generates
 # profiling code (ie. a call to _mcount()).
 echo "int func() { return 0; }" | \
-    $* -m64 -mlittle-endian -S -x c -O2 -p -mprofile-kernel - -o - \
+    $* -m64 -S -x c -O2 -p -mprofile-kernel - -o - \
     2> /dev/null | grep -q "_mcount"
 
 # Test whether the notrace attribute correctly suppresses calls to _mcount().
 
 echo -e "#include <linux/compiler.h>\nnotrace int func() { return 0; }" | \
-    $* -m64 -mlittle-endian -S -x c -O2 -p -mprofile-kernel - -o - \
+    $* -m64 -S -x c -O2 -p -mprofile-kernel - -o - \
     2> /dev/null | grep -q "_mcount" && \
     exit 1
 
-- 
2.40.1

