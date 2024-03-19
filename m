Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 427FB87F9A2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:25:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JC73S4c9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPtj6WL4z3wPn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:25:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JC73S4c9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPMJ486gz3vgG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 19:02:04 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6e6ee9e3cffso3171443b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835323; x=1711440123; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qexXpkpnrPosSamG4rwhfxX05W0nrjIaC9l6HzJDgrY=;
        b=JC73S4c9futZDemDmz1NN56JmDHAqoRK8vHIC6O8qJJ1BHK8lJLJnzjakKhKr5b+WC
         M7Ge7WhAwoBn85fGZbRpv5HBEZjgUuipWuezNzdzIvD62xj1DfroOCARbMw0eZ/sUhUC
         D11j8Vi8c6SSi3U/FHFDlTkX3c+IKPGuPPZ60w51PnTq+J/KGQzzWRMtYT5yv97KRXlW
         yZTNsL8uwnZod7E23PSo9pMpWr2TPEMI84ZKHX9Pxfvee7Ja5VjvmUCNt2bnX/9L7qXy
         9zjLxLXqQMv0rsHV5qOmAtrdpZCgYl01QXdByqqoapaMilAWXjXvgAvFxC3KGt9G0LTn
         Hplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835323; x=1711440123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qexXpkpnrPosSamG4rwhfxX05W0nrjIaC9l6HzJDgrY=;
        b=VdCKcd72gdej6xzyo6j3zWB9HDRgfJCV+lghOFA7TT58p5ZevsADestGIKeVD4lU9V
         frrT9Q3/ABt9+kcSaeuZRDNLNu8EGYrosqviCPavlmwookRDSV1o3m53nyciPTGjOBg2
         fN+I97sn4kAjU+Bo9YdOUPSzO2NMKlz67du4gbFx0QKbX8E9n1VveUKsEUK6CqQcY8kG
         MgvOs/wUjLp/Iz2VGh+X3zvmngkpN6P+ABqMzcfr6rPCtakKE7P3Vui+Truc/aNQu+dn
         PM2e9EC0RgOS6ekTvo6s5s/U4b957BNYddOqOqPq1myHndFZfOV3WHb9pe5bQDSp38EU
         zEGw==
X-Forwarded-Encrypted: i=1; AJvYcCVpFgNq5TzGERV/vdlOYD8ao9sLOxL/++ltDLIxb/tz9Ys7EL/+OqSEvZCfxP9DtK7jh7VdIXV90ZPWQLQDQvk3Viz9YX1Bh0nlkIxecQ==
X-Gm-Message-State: AOJu0YyicDllIIrB0tDP5PtytKJ8NfD31AlB/6VeMJSqMPzJ5d5tSxVi
	tctW0oX0XqZXExB9Z/tRJB26ZwUuBIazHvLz90iTg5bWh5jNefGg
X-Google-Smtp-Source: AGHT+IHs8YWGPGhmUNPd0Btq9HERv+NAaHotqwxHbqd2DVNc7XUkljS2Bi/D/KDM1wOxpVIcJpG6LA==
X-Received: by 2002:a05:6a00:1a89:b0:6e6:c256:9d49 with SMTP id e9-20020a056a001a8900b006e6c2569d49mr2457020pfv.0.1710835322806;
        Tue, 19 Mar 2024 01:02:02 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.01.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:02:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 35/35] powerpc: gitlab CI update
Date: Tue, 19 Mar 2024 17:59:26 +1000
Message-ID: <20240319075926.2422707-36-npiggin@gmail.com>
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

This adds testing for the powernv machine, and adds a gitlab-ci test
group instead of specifying all tests in .gitlab-ci.yml.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .gitlab-ci.yml        | 20 ++++++++------------
 powerpc/unittests.cfg | 14 ++++++++------
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index bd34da04f..e3638b088 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -97,12 +97,10 @@ build-ppc64be:
  - cd build
  - ../configure --arch=ppc64 --endian=big --cross-prefix=powerpc64-linux-gnu-
  - make -j2
- - ACCEL=tcg ./run_tests.sh
-     selftest-setup selftest-migration selftest-migration-skip spapr_hcall
-     rtas-get-time-of-day rtas-get-time-of-day-base rtas-set-time-of-day
-     emulator
-     | tee results.txt
- - if grep -q FAIL results.txt ; then exit 1 ; fi
+ - ACCEL=tcg MAX_SMP=8 ./run_tests.sh -g gitlab-ci | tee results.txt
+ - grep -q PASS results.txt && ! grep -q FAIL results.txt
+ - ACCEL=tcg MAX_SMP=8 MACHINE=powernv ./run_tests.sh -g gitlab-ci | tee results.txt
+ - grep -q PASS results.txt && ! grep -q FAIL results.txt
 
 build-ppc64le:
  extends: .intree_template
@@ -110,12 +108,10 @@ build-ppc64le:
  - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
  - ./configure --arch=ppc64 --endian=little --cross-prefix=powerpc64-linux-gnu-
  - make -j2
- - ACCEL=tcg ./run_tests.sh
-     selftest-setup selftest-migration selftest-migration-skip spapr_hcall
-     rtas-get-time-of-day rtas-get-time-of-day-base rtas-set-time-of-day
-     emulator
-     | tee results.txt
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
2.42.0

