Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E11A89981E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:40:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KBkunkEW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9sQH32nYz3f0P
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:40:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KBkunkEW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sJw15lcz3vYk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:36:15 +1100 (AEDT)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3bbc649c275so1005467b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306173; x=1712910973; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WioYVqWKFUM6/8tb6Tl776O5r9iFZjAojguUi5vO6u4=;
        b=KBkunkEWYHGWD5ZJcSiTrVrdWVPsJ6zequSdz3tlllBZ3U+uFKnTdHXl5wRwPcnwMP
         JPIEVbn/75nXaseYQVFAybi/yHwks+y35bGFH8xgmciRpyUMSZz9wGcT1knUV1NMMmVg
         YuBT0jft1FJgUwYokMfclaFcGje5Hsp2Vbi9VXDT1hOLti1Q+FZhcWyHNDGQbDVQP9JR
         fCpkcMQcvtoHgvlqk886tblceNtVHe+ve0DU9JPD4Prt4IwRUSyjE2W6hU+eRereMMfY
         /ZDfTZIq51r7ooQVLI7l7GRVB0FZtGrz8fB++XOH/+xH5dZPdOauHAAektwqgIZ28nnL
         D+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306173; x=1712910973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WioYVqWKFUM6/8tb6Tl776O5r9iFZjAojguUi5vO6u4=;
        b=KKcuZJpf40g2Yh6a1pNEyynxAFgSOlqdn1M88ZOSM6sO/uURsYo+83ZDmZxSK5x0HQ
         vIfM5xY6tTDliSSOS1epQGGBSjs5pKn/YA+6EbB+WMCie16eBUTu1r/hlJV6HCq+PNBF
         NFENbZdQtpxhycWW7nIncYB2TkhKrHnbWRkvI0kulIjBPEjXDQm4WMNikoT443R40Phh
         eVwQqMkNSuWpoJT2wx0+9E40mEZnMb0zMYZHXZyvv2PofnVOdlaDszPviR4Qkpx0EGco
         b7PIt8sAXHO82AUoU12zHpQVhnZ4afolkpNAaCHdnV4FoVJ3zgW2n760asWlSIL9mffW
         N2IA==
X-Forwarded-Encrypted: i=1; AJvYcCUZVJPLiQsioePKt9rAlWfUfMU6r17Zvi9oxEgkUCH3QVPJiA8yz5UGQdg/q1MYlegUsZq/u75BwK3MGZTWeXi6FTRh7FraNUhMP9BXsw==
X-Gm-Message-State: AOJu0YwiZnkJU5/O317bfZUZBE/ATnkZ3UbamaY/II42m5hOU/hxcCoy
	yxKruFonvGxs7KiduDR7lv/gqSwgWl1w7GV8Im5wrtWai+5GlgVI
X-Google-Smtp-Source: AGHT+IEbIySGPa8yUWT1eqjog7KLPOJaWv//O2NLyD7J5C6wz86BZyGO+6gukW1PPTGHk8LbBoWwGA==
X-Received: by 2002:a05:6808:2390:b0:3c2:277e:65c2 with SMTP id bp16-20020a056808239000b003c2277e65c2mr863370oib.41.1712306173114;
        Fri, 05 Apr 2024 01:36:13 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:36:12 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 06/35] gitlab-ci: Run migration selftest on s390x and powerpc
Date: Fri,  5 Apr 2024 18:35:07 +1000
Message-ID: <20240405083539.374995-7-npiggin@gmail.com>
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

The migration harness is complicated and easy to break so CI will
be helpful.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .gitlab-ci.yml      | 32 +++++++++++++++++++++++---------
 s390x/unittests.cfg |  8 ++++++++
 2 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ff34b1f50..60b3cdfd2 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -92,27 +92,39 @@ build-arm:
 build-ppc64be:
  extends: .outoftree_template
  script:
- - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu
+ - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
  - mkdir build
  - cd build
  - ../configure --arch=ppc64 --endian=big --cross-prefix=powerpc64-linux-gnu-
  - make -j2
  - ACCEL=tcg ./run_tests.sh
-     selftest-setup spapr_hcall rtas-get-time-of-day rtas-get-time-of-day-base
-     rtas-set-time-of-day emulator
-     | tee results.txt
+      selftest-setup
+      selftest-migration
+      selftest-migration-skip
+      spapr_hcall
+      rtas-get-time-of-day
+      rtas-get-time-of-day-base
+      rtas-set-time-of-day
+      emulator
+      | tee results.txt
  - if grep -q FAIL results.txt ; then exit 1 ; fi
 
 build-ppc64le:
  extends: .intree_template
  script:
- - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu
+ - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
  - ./configure --arch=ppc64 --endian=little --cross-prefix=powerpc64-linux-gnu-
  - make -j2
  - ACCEL=tcg ./run_tests.sh
-     selftest-setup spapr_hcall rtas-get-time-of-day rtas-get-time-of-day-base
-     rtas-set-time-of-day emulator
-     | tee results.txt
+      selftest-setup
+      selftest-migration
+      selftest-migration-skip
+      spapr_hcall
+      rtas-get-time-of-day
+      rtas-get-time-of-day-base
+      rtas-set-time-of-day
+      emulator
+      | tee results.txt
  - if grep -q FAIL results.txt ; then exit 1 ; fi
 
 # build-riscv32:
@@ -135,7 +147,7 @@ build-riscv64:
 build-s390x:
  extends: .outoftree_template
  script:
- - dnf install -y qemu-system-s390x gcc-s390x-linux-gnu
+ - dnf install -y qemu-system-s390x gcc-s390x-linux-gnu nmap-ncat
  - mkdir build
  - cd build
  - ../configure --arch=s390x --cross-prefix=s390x-linux-gnu-
@@ -161,6 +173,8 @@ build-s390x:
       sclp-1g
       sclp-3g
       selftest-setup
+      selftest-migration-kvm
+      selftest-migration-skip
       sieve
       smp
       stsi
diff --git a/s390x/unittests.cfg b/s390x/unittests.cfg
index 49e3e4608..faa0ce0eb 100644
--- a/s390x/unittests.cfg
+++ b/s390x/unittests.cfg
@@ -31,6 +31,14 @@ groups = selftest migration
 # https://lore.kernel.org/qemu-devel/20240219061731.232570-1-npiggin@gmail.com/
 accel = kvm
 
+[selftest-migration-kvm]
+file = selftest-migration.elf
+groups = nodefault
+accel = kvm
+# This is a special test for gitlab-ci that must not use TCG until the
+# TCG migration fix has made its way into CI environment's QEMU.
+# https://lore.kernel.org/qemu-devel/20240219061731.232570-1-npiggin@gmail.com/
+
 [selftest-migration-skip]
 file = selftest-migration.elf
 groups = selftest migration
-- 
2.43.0

