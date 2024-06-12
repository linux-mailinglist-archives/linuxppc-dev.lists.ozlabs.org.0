Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A25E2904AF3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 07:34:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hhIOatpR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzZ4D0d8Wz3gGp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 15:34:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hhIOatpR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzYrF6j6tz3cgW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 15:24:29 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1f6f1677b26so4209775ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 22:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718169868; x=1718774668; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlQRgBFNQaoTa6dz8Jq/4j8RyKmazPn0sRYigP/0Fhw=;
        b=hhIOatpRVQs0IGzXrRPJ7x+kmnPMAisL3yWugAsqDBv8NC27vuDHlgk9hGAn10JKvG
         pC+hnbCPnZ8Grgot+8trjo7tlR8+qBhNseUpuD7wyBo5jlvMG0/DpCCX+w7OD21n15xu
         Vlp4IJMuiYob86xTopO1BYAwzVUoyt4K/Lglavwok3nfaMJ3vsx7QXtMD+4rHS3SvwtO
         RQqsy+d00Y+uy7/tN10jDwXy608eJODJXc+B2w3OU24WH+6EQ+PEKKelWXrkyOYiIrVY
         p9OWQVw8MDkf63xhiST4Hy3IkdJWiWP1EuFTTVvJ4R1cZW1u8cKeN4b8prpm3oryluAL
         jrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718169868; x=1718774668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TlQRgBFNQaoTa6dz8Jq/4j8RyKmazPn0sRYigP/0Fhw=;
        b=sP5rqH+s1qDkGiXO6lNNqvl9WPVmsCtpb9HXAzjOcPAyHMYDgjtFiReABRjm0ZoYct
         S++H+C6uYRw2oYoQjdVJNU1q3uGLot/qHIoaZt8OBkuNjR5UEVepE640gumL2XU7jsPb
         PNc1O8TOwu3N6HsAHUTXsBKRMTOCM3z0lgXeBE48qa+xYb103vfPrDxp751KQENHZYFx
         3HXZ1ctToF4yzgdQiojJmWSQ9tZeUMjh+xCr3qxyUhSu44AgSHfyKT3kQTeQLbRCGF8J
         RteMCAkv5APL4jq7mNbB7ftRTMabfDr+/qstr0qtg3wYp0ZefiyUSDTv8iPmG9ZH9qZo
         MpFw==
X-Forwarded-Encrypted: i=1; AJvYcCUipTK64Vwt2fBHcvlLU3Y+78mKEI1yGNFf15E9o/ncb3SOEzDcIQNu/xXL92mwn8jr8wIpjDiQTNDZFnAAT+whjNvzTaaGUo3QIqHRMA==
X-Gm-Message-State: AOJu0YwmbDg40QZp8sb2bw2ox5sTRuSHModg6YfzPKVe++g6O18XEIUN
	gQhBNc8tAKiFt2OoL01sAG14c2D4tEzdyRplu3MLBw4E4YMxoIf04UxG/g==
X-Google-Smtp-Source: AGHT+IEqLz5Dn4PKUTWY9xRYytx04I5xM9up7gD53spppmLeXqURYzOa8OHXdMBNI8YPHgpkyPGQjw==
X-Received: by 2002:a17:902:c404:b0:1f7:2185:d2d9 with SMTP id d9443c01a7336-1f728791b33mr72648115ad.5.1718169868000;
        Tue, 11 Jun 2024 22:24:28 -0700 (PDT)
Received: from wheely.local0.net (220-235-199-47.tpgi.com.au. [220.235.199.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd75f711sm112170705ad.11.2024.06.11.22.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:24:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v10 15/15] powerpc/gitlab-ci: Enable more tests with Fedora 40
Date: Wed, 12 Jun 2024 15:23:20 +1000
Message-ID: <20240612052322.218726-16-npiggin@gmail.com>
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

With Fedora 40 (QEMU 8.2), more tests can be enabled.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .gitlab-ci.yml        |  2 +-
 powerpc/unittests.cfg | 17 ++++++++---------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ffb3767ec..ee14330a3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -110,7 +110,7 @@ build-ppc64le:
  extends: .intree_template
  image: fedora:40
  script:
- - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
+ - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat jq
  - ./configure --arch=ppc64 --endian=little --cross-prefix=powerpc64-linux-gnu-
  - make -j2
  - ACCEL=tcg MAX_SMP=8 ./run_tests.sh -g gitlab-ci
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index 9e7df22f4..27092b185 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -28,7 +28,7 @@ file = selftest-migration.elf
 machine = pseries
 groups = selftest migration
 
-# QEMU 7.0 (Fedora 37) in gitlab CI has known migration bugs in TCG, so
+# QEMU 8.2 (Fedora 40) in gitlab CI has known migration bugs in TCG, so
 # make a kvm-only version for CI
 [selftest-migration-ci]
 file = selftest-migration.elf
@@ -81,18 +81,18 @@ groups = rtas gitlab-ci
 file = emulator.elf
 groups = gitlab-ci
 
-# QEMU 7.0 (Fedora 37) in gitlab CI fails this
+# QEMU 8.2 in Fedora 40 fails because it allows supervisor to change MSR[ME]
 [interrupts]
 file = interrupts.elf
 
-# QEMU 7.0 (Fedora 37) in gitlab CI fails this
 [mmu]
 file = mmu.elf
 smp = 2
+groups = gitlab-ci
 
-# QEMU 7.0 (Fedora 37) in gitlab CI fails this
 [pmu]
 file = pmu.elf
+groups = gitlab-ci
 
 [smp]
 file = smp.elf
@@ -120,15 +120,15 @@ machine = pseries
 extra_params = -append "migration -m"
 groups = migration gitlab-ci
 
-# QEMU 7.0 (Fedora 37) in gitlab CI fails this
 [timebase]
 file = timebase.elf
+groups = gitlab-ci
 
-# QEMU 7.0 (Fedora 37) in gitlab CI fails this
 [timebase-icount]
 file = timebase.elf
 accel = tcg
 extra_params = -icount shift=5
+groups = gitlab-ci
 
 [h_cede_tm]
 file = tm.elf
@@ -138,16 +138,15 @@ smp = 2,threads=2
 extra_params = -machine cap-htm=on -append "h_cede_tm"
 groups = h_cede_tm
 
-# QEMU 7.0 (Fedora 37) in gitlab CI fails this
 [sprs]
 file = sprs.elf
+groups = gitlab-ci
 
-# QEMU 7.0 (Fedora 37) in gitlab CI fails this
 [sprs-migration]
 file = sprs.elf
 machine = pseries
 extra_params = -append '-w'
-groups = migration
+groups = migration gitlab-ci
 
 # Too costly to run in CI
 [sieve]
-- 
2.45.1

