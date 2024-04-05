Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE6C8998C3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 11:01:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jSwxFI6f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9stX4NKyz3w4y
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 20:01:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jSwxFI6f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sMG2RHmz3vfs
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:38:18 +1100 (AEDT)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3c4f23d23d9so1125146b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306296; x=1712911096; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08ZJSlQgPb2U1wJ1wtHQmw6+VW0gHONEQZpvI78Rx0A=;
        b=jSwxFI6fBeYZ2OG6WJ8+dxjzSvk6AfRCXsw+MMiGrF731KFq/2F6YoCpLJ1NydL/B/
         T7UMGDeSoOuUUcHR7R9TqiiGgZzwnbPBpFBMA5uaJek9WYVjd5GuvZCJeY+ZLLCDjWJ4
         wXFDJqCxbs1tel3Vh/9sBz9qaT8Cn93KZIRltgEUqfej97jSthtP0mR4XQ7mLMw3jcgV
         tPbSrE16lAakutqxFagvk4zkzDYMYV3KOswXlnpLErOx3a3XoJkmfldLGIfHo/raNAK2
         HAPpUDEbfZubtSG2UaQ9XZRfxaXnu5Pcd43BSk133+m52tv/Ukfb2BuPfrWJXvoqeOUm
         LSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306296; x=1712911096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08ZJSlQgPb2U1wJ1wtHQmw6+VW0gHONEQZpvI78Rx0A=;
        b=ba+HVROyY2f5yZYdr7DTEHfJO2RZkdQtDT26Bk5lA18Cc397AkNRn+RDGAro7iPKg4
         fHkf+0hZJHE/dnQAlZUwiyEjZh2adnnR2KFt+PYIV4/vCPSrVubshdfBKwWP2frsa9uA
         MA/lZFzXK4Z8giX2f9wR/vZd4N5AXFR29FeGF6nFHCUeVOGCq8Yg5zV+vUFCDovtfSy2
         9VJemg/31Cj0AqJC42CfP4RZIIC9F6q27dC+WwDA3rRwnRWZTH8wqx0JixnFrQF1mThD
         dnPTBhjF4pt7bLuHNBiiRaOv5eIGAP3vqVwdeTSGaS02PecI3lAgq1qtUoYoiv9nAMch
         l8VA==
X-Forwarded-Encrypted: i=1; AJvYcCV6YbPFiEjkkB5taQPPYbW88sQFfHEUHkgCBLj35FyJ6GbpqXkyAI/sh+q15DXTtKhPUSxHxNyOw2e4fyDyJ/xJCBoXu7bWGm3tHnnBkg==
X-Gm-Message-State: AOJu0Yy0HuLbsL1jRGWS6IVP0ggwp7ZeCa6Yj4uq9SsRCjAiEJwJ9gi2
	xesSRYZA9ChsLA+MZAklqPiKh2f0Q4S/dUeW7rDsL4EZ3TBR3XRn
X-Google-Smtp-Source: AGHT+IFcYX8of89RQmkZnvOZcAdSrslSQo+ySFnFFYsF1LPh5xNvi2PP8LfX0/lXzBcR/I+RMfni0A==
X-Received: by 2002:a05:6871:587:b0:22e:d0e3:925f with SMTP id u7-20020a056871058700b0022ed0e3925fmr904892oan.1.1712306296168;
        Fri, 05 Apr 2024 01:38:16 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:38:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 35/35] powerpc: gitlab CI update
Date: Fri,  5 Apr 2024 18:35:36 +1000
Message-ID: <20240405083539.374995-36-npiggin@gmail.com>
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

This adds testing for the powernv machine, and adds a gitlab-ci test
group instead of specifying all tests in .gitlab-ci.yml.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .gitlab-ci.yml        | 30 ++++++++----------------------
 powerpc/unittests.cfg | 14 ++++++++------
 2 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 60b3cdfd2..e3638b088 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -97,17 +97,10 @@ build-ppc64be:
  - cd build
  - ../configure --arch=ppc64 --endian=big --cross-prefix=powerpc64-linux-gnu-
  - make -j2
- - ACCEL=tcg ./run_tests.sh
-      selftest-setup
-      selftest-migration
-      selftest-migration-skip
-      spapr_hcall
-      rtas-get-time-of-day
-      rtas-get-time-of-day-base
-      rtas-set-time-of-day
-      emulator
-      | tee results.txt
- - if grep -q FAIL results.txt ; then exit 1 ; fi
+ - ACCEL=tcg MAX_SMP=8 ./run_tests.sh -g gitlab-ci | tee results.txt
+ - grep -q PASS results.txt && ! grep -q FAIL results.txt
+ - ACCEL=tcg MAX_SMP=8 MACHINE=powernv ./run_tests.sh -g gitlab-ci | tee results.txt
+ - grep -q PASS results.txt && ! grep -q FAIL results.txt
 
 build-ppc64le:
  extends: .intree_template
@@ -115,17 +108,10 @@ build-ppc64le:
  - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
  - ./configure --arch=ppc64 --endian=little --cross-prefix=powerpc64-linux-gnu-
  - make -j2
- - ACCEL=tcg ./run_tests.sh
-      selftest-setup
-      selftest-migration
-      selftest-migration-skip
-      spapr_hcall
-      rtas-get-time-of-day
-      rtas-get-time-of-day-base
-      rtas-set-time-of-day
-      emulator
-      | tee results.txt
- - if grep -q FAIL results.txt ; then exit 1 ; fi
+ - ACCEL=tcg MAX_SMP=8 ./run_tests.sh -g gitlab-ci | tee results.txt
+ - grep -q PASS results.txt && ! grep -q FAIL results.txt
+ - ACCEL=tcg MAX_SMP=8 MACHINE=powernv ./run_tests.sh -g gitlab-ci | tee results.txt
+ - grep -q PASS results.txt && ! grep -q FAIL results.txt
 
 # build-riscv32:
 # Fedora doesn't package a riscv32 compiler for QEMU. Oh, well.
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index 379aa166b..f6ddc4a7f 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -16,12 +16,12 @@
 file = selftest.elf
 smp = 2
 extra_params = -m 1g -append 'setup smp=2 mem=1024'
-groups = selftest
+groups = selftest gitlab-ci
 
 [selftest-migration]
 file = selftest-migration.elf
 machine = pseries
-groups = selftest migration
+groups = selftest migration gitlab-ci
 # TODO: Remove accel=kvm once the following TCG migration fix has been merged:
 # https://lore.kernel.org/qemu-devel/20240219061731.232570-1-npiggin@gmail.com/
 accel = kvm
@@ -29,7 +29,7 @@ accel = kvm
 [selftest-migration-skip]
 file = selftest-migration.elf
 machine = pseries
-groups = selftest migration
+groups = selftest migration gitlab-ci
 extra_params = -append "skip"
 
 # This fails due to a QEMU TCG bug so KVM-only until QEMU is fixed upstream
@@ -42,6 +42,7 @@ groups = migration
 [spapr_hcall]
 file = spapr_hcall.elf
 machine = pseries
+groups = gitlab-ci
 
 [spapr_vpa]
 file = spapr_vpa.elf
@@ -52,24 +53,25 @@ file = rtas.elf
 machine = pseries
 timeout = 5
 extra_params = -append "get-time-of-day date=$(date +%s)"
-groups = rtas
+groups = rtas gitlab-ci
 
 [rtas-get-time-of-day-base]
 file = rtas.elf
 machine = pseries
 timeout = 5
 extra_params = -rtc base="2006-06-17" -append "get-time-of-day date=$(date --date="2006-06-17 UTC" +%s)"
-groups = rtas
+groups = rtas gitlab-ci
 
 [rtas-set-time-of-day]
 file = rtas.elf
 machine = pseries
 extra_params = -append "set-time-of-day"
 timeout = 5
-groups = rtas
+groups = rtas gitlab-ci
 
 [emulator]
 file = emulator.elf
+groups = gitlab-ci
 
 [interrupts]
 file = interrupts.elf
-- 
2.43.0

