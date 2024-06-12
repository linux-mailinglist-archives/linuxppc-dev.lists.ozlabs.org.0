Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81439904AEB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 07:32:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ln9zg5+Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzZ172hpYz3vbV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 15:32:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ln9zg5+Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzYr00jfBz3fqV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 15:24:15 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1f692d6e990so60581355ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 22:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718169854; x=1718774654; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9L1xoCrCRrB/Q3jS6x86SGj+fZqpLObyaxaO3glOSo=;
        b=ln9zg5+QRoLKoQOx/+xDNPVB3tAxQOG5+lC/y25xlE96tmPavAmpmrNEVNVaMUKMSj
         K4Mc50ts0Q2iEIU4hB4thOtYgsTn+b/zIkaqMb2PJJe+fskA1QfBUAFJTWbrnPbVnnbM
         fUBGbUzaodWISW2RGi4WwYzsmsZnJbE1fOPkwp/CYhxXHNFhKFG9p8EVyUkMm/sPThZ1
         aDtpMgAylqMuFNM6iey6Z/vhN8HB4IXqb5IKzAzmeoGJ6m61hVGgh5+DfrTQdnav/LpH
         d6xQcODeqIRt9daf1LWaMFC6y4eCShr0ms7YEsRpB+2pE1SEIgWA/77yfPg7bT+u2+cL
         +cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718169854; x=1718774654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9L1xoCrCRrB/Q3jS6x86SGj+fZqpLObyaxaO3glOSo=;
        b=VVlA9w+Df5ammOisYmIEEu95JyLiEZWY0jEoPCJCQhXqew2vws1lhKQ07BccBXU8oU
         c+Z+Nw6U0MLgMmv2gwIg1tsKuY+vQ+QyKHFv8xhiaU2QIk70c4OjLH+OC1VtnJhaMywx
         qHeL30QAj7/9FbnX8oLcTLuhgG+iRlHgwV3+n8FZdBPYzhn6KdLt+vAJuDAGB7BpK8LQ
         Yk7G5MgZYBaRlmOzEaxFuq+EZ/cQmaqO6jLeIkzAjkU41tv28M1TmN7fwu0+JZHU+68A
         u2F3SalHX1SCQDMLEZL1p4xHYdLqVxBwp9kF3jZvt/DbTSuFYpC3NTAQscfVFhImnGjm
         CUIw==
X-Forwarded-Encrypted: i=1; AJvYcCW5T8P/snJUqRfpKatVkxnFgAlRdL5bzXrU3mIK3baQjvQ3vCTwUn4HMDFfud1nPEUshChfTtrkuN/l01NpJvSnRXtCHLaY64616injhA==
X-Gm-Message-State: AOJu0Yz6vesIXl0yUmdmX3zBgjU6C7knCy+DPmz4Zkdn+c3g4qlX1sND
	IHQ6211Mvdmaq7bHfk/8UDVez+ub3Fe3vP6t1rLp1ABbfBHAFwb0E+hqcQ==
X-Google-Smtp-Source: AGHT+IF8CsFWZGDaDZHuKFtw+srSJbMsiTXWPPYRhmdRUZYG4Gukwaaw6xFQ5qU3hAIn3lKjcBbrYg==
X-Received: by 2002:a17:902:eccc:b0:1f8:3c9e:3b92 with SMTP id d9443c01a7336-1f83c9e3cf9mr6771865ad.23.1718169854003;
        Tue, 11 Jun 2024 22:24:14 -0700 (PDT)
Received: from wheely.local0.net (220-235-199-47.tpgi.com.au. [220.235.199.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd75f711sm112170705ad.11.2024.06.11.22.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:24:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v10 11/15] powerpc: gitlab CI update
Date: Wed, 12 Jun 2024 15:23:16 +1000
Message-ID: <20240612052322.218726-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240612052322.218726-1-npiggin@gmail.com>
References: <20240612052322.218726-1-npiggin@gmail.com>
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

This adds testing for the powernv machine. To control overhead, ppc64be
is used to test powernv and 64k page size, ppc64le is used to test
pseries and 4k page size.

Change to using a gitlab-ci test group instead of specifying all
tests in .gitlab-ci.yml, and adds a few additional tests (smp, atomics)
that are known to work in CI.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .gitlab-ci.yml        | 32 ++++++++------------------------
 powerpc/unittests.cfg | 34 +++++++++++++++++++++++++++-------
 2 files changed, 35 insertions(+), 31 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0e4d6205f..b5fc0cb7d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -96,22 +96,14 @@ build-arm:
 build-ppc64be:
  extends: .outoftree_template
  script:
- - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
+ - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu
  - mkdir build
  - cd build
- - ../configure --arch=ppc64 --endian=big --cross-prefix=powerpc64-linux-gnu-
+ - ../configure --arch=ppc64 --endian=big --page-size=64k --cross-prefix=powerpc64-linux-gnu-
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
+ - ACCEL=tcg MAX_SMP=8 MACHINE=powernv ./run_tests.sh -g gitlab-ci
+   | tee results.txt
+ - grep -q PASS results.txt && ! grep -q FAIL results.txt
 
 build-ppc64le:
  extends: .intree_template
@@ -119,17 +111,9 @@ build-ppc64le:
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
+ - ACCEL=tcg MAX_SMP=8 ./run_tests.sh -g gitlab-ci
+   | tee results.txt
+ - grep -q PASS results.txt && ! grep -q FAIL results.txt
 
 # build-riscv32:
 # Fedora doesn't package a riscv32 compiler for QEMU. Oh, well.
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index 79a123e9f..89455b618 100644
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
 smp = 2
 
+# QEMU 7.0 (Fedora 37) in gitlab CI fails this
 [pmu]
 file = pmu.elf
 
 [smp]
 file = smp.elf
 smp = 2
+groups = gitlab-ci
 
 [smp-smt]
 file = smp.elf
@@ -90,19 +104,22 @@ file = smp.elf
 smp = 8,threads=4
 accel = tcg,thread=single
 
+# QEMU 7.0 (Fedora 37) in gitlab CI does not do well with SMP atomics
 [atomics]
 file = atomics.elf
-smp = 2
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
@@ -116,14 +133,17 @@ smp = 2,threads=2
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
2.45.1

