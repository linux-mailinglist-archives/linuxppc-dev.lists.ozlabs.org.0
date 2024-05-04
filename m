Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A488BBBA0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 14:52:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BqxSKNKz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWncl348Lz86xR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 22:52:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BqxSKNKz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWn8H45zTz3cg1
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 22:30:55 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6f30f69a958so410902b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 May 2024 05:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714825854; x=1715430654; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8yFjHHWiVn05YU2Lfr80oawzBMI5TmP8UkXksKXrkY=;
        b=BqxSKNKzmn7zoEQWwDbRzbT4BvYXYDwa0De4H2gGbmTKnWUVzswOKil4LhOSrp0gZY
         8ObpX9QCDEvcgl72dFwlisTibOpl14x5iT4LHE5qEVGtllvuzbwHh0QwZOotl9SlJCau
         5P4V5bAQZz0rHVMp3Kn0vWUntZot3ot8RZVY5E7lT3GppvQF5deNQtMrVeo1+8XyBVW5
         ngOxPzrBy7nLwe/IwqwMO+ljOhcInuEgebMxdojNuLnd7biHr/Ip8KoBrviyaplhQ13k
         6LJebza3mc9QllQmpHKNpJHZw5FQuNpwIYrLSNpa3Ja135O9zlho2n6yhBWdZBPl1fdD
         TqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825854; x=1715430654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8yFjHHWiVn05YU2Lfr80oawzBMI5TmP8UkXksKXrkY=;
        b=N6nV+Un1xsAcSFeuCGM7+GQElqUVd0YQk9B2AIm+oQqV1OVHjqpRhM+Gl9gL1jdoai
         cDfT1EFE1VBoL2iF9Oe2+06/o0Cqt3Up8PzdcUmbLeDYmbCBHnpeCFd/3tJU+V8dnvVv
         8+PD687r2goG18APc3Lz6zZJeSn8mbLm/BvRR4yuI62huc1oaiC6LfW2QnigObBqcHEv
         g43VkLGjOenSTNrtZn11sDRI3FNTYd8+TSEVUtJ8gZ13dN0UOX+OA+H5z+9Rbz0sQfBr
         SoQ3/cCZ87X5FHPARJSsHaWHVPQrHsqmIUGL6VRtB8UKsqYAWUFHTtwhSvkhnHVMPLeM
         LzTA==
X-Forwarded-Encrypted: i=1; AJvYcCWi+AQH8DqUWwDtXpI4P3uLQ1PO+g/iSa6iaIhapbm/qWrPscztfazFdivMcCV9U2O7IdlqKBLVnS+K1BkoaJ4SaFPEW4p+vdVcZZqppA==
X-Gm-Message-State: AOJu0YynVzzMon8DNjUhMgXtdWKie9S1nhEVtt9putgHCEpC51Pd1j/e
	H3mDfmuqQVdmDpQHDg9X1XQ4XK0DFG9fqAzqgFVy4e0UX+InfwV+
X-Google-Smtp-Source: AGHT+IFK1UoGsUuy1jTGZj15GLUUMj86a05csarOb+o+flJ9cXlyK08mpPMTmyD9G8IPIczuf3KW8g==
X-Received: by 2002:a05:6a20:f3af:b0:1ac:423b:7c7a with SMTP id qr47-20020a056a20f3af00b001ac423b7c7amr5094243pzb.21.1714825853935;
        Sat, 04 May 2024 05:30:53 -0700 (PDT)
Received: from wheely.local0.net (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a000a9000b006f4473daa38sm3480068pfl.128.2024.05.04.05.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:30:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v9 31/31] powerpc: gitlab CI update
Date: Sat,  4 May 2024 22:28:37 +1000
Message-ID: <20240504122841.1177683-32-npiggin@gmail.com>
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

This adds testing for the powernv machine, and adds a gitlab-ci test
group instead of specifying all tests in .gitlab-ci.yml, and adds a
few new tests (smp, atomics) that are known to work in CI.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .gitlab-ci.yml        | 30 ++++++++----------------------
 powerpc/unittests.cfg | 32 ++++++++++++++++++++++++++------
 2 files changed, 34 insertions(+), 28 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 23bb69e24..31a2a4e34 100644
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
index d767f5d68..6fae688a8 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -16,17 +16,25 @@
 file = selftest.elf
 smp = 2
 extra_params = -m 1g -append 'setup smp=2 mem=1024'
-groups = selftest
+groups = selftest gitlab-ci
 
 [selftest-migration]
 file = selftest-migration.elf
 machine = pseries
 groups = selftest migration
 
+# QEMU 7.0 (Fedora 37) in gitlab CI has known migration bugs in TCG, so
+# make a kvm-only version for CI
+[selftest-migration-ci]
+file = selftest-migration.elf
+machine = pseries
+groups = nodefault selftest migration gitlab-ci
+accel = kvm
+
 [selftest-migration-skip]
 file = selftest-migration.elf
 machine = pseries
-groups = selftest migration
+groups = selftest migration gitlab-ci
 extra_params = -append "skip"
 
 [migration-memory]
@@ -37,6 +45,7 @@ groups = migration
 [spapr_hcall]
 file = spapr_hcall.elf
 machine = pseries
+groups = gitlab-ci
 
 [spapr_vpa]
 file = spapr_vpa.elf
@@ -47,38 +56,43 @@ file = rtas.elf
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
 
+# QEMU 7.0 (Fedora 37) in gitlab CI fails this
 [interrupts]
 file = interrupts.elf
 
+# QEMU 7.0 (Fedora 37) in gitlab CI fails this
 [mmu]
 file = mmu.elf
 smp = $MAX_SMP
 
+# QEMU 7.0 (Fedora 37) in gitlab CI fails this
 [pmu]
 file = pmu.elf
 
 [smp]
 file = smp.elf
 smp = 2
+groups = gitlab-ci
 
 [smp-smt]
 file = smp.elf
@@ -92,16 +106,19 @@ accel = tcg,thread=single
 
 [atomics]
 file = atomics.elf
+groups = gitlab-ci
 
 [atomics-migration]
 file = atomics.elf
 machine = pseries
 extra_params = -append "migration -m"
-groups = migration
+groups = migration gitlab-ci
 
+# QEMU 7.0 (Fedora 37) in gitlab CI fails this
 [timebase]
 file = timebase.elf
 
+# QEMU 7.0 (Fedora 37) in gitlab CI fails this
 [timebase-icount]
 file = timebase.elf
 accel = tcg
@@ -115,14 +132,17 @@ smp = 2,threads=2
 extra_params = -machine cap-htm=on -append "h_cede_tm"
 groups = h_cede_tm
 
+# QEMU 7.0 (Fedora 37) in gitlab CI fails this
 [sprs]
 file = sprs.elf
 
+# QEMU 7.0 (Fedora 37) in gitlab CI fails this
 [sprs-migration]
 file = sprs.elf
 machine = pseries
 extra_params = -append '-w'
 groups = migration
 
+# Too costly to run in CI
 [sieve]
 file = sieve.elf
-- 
2.43.0

