Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2482C87F8D7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:04:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JttvvOL+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPQK6GF2z3vjW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:04:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JttvvOL+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPJw08qQz3dVf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 18:59:59 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6e6b5432439so5041061b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 00:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835197; x=1711439997; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYcSW/ibSMj6iVuV1sk8Zdj3J66OqbMWoQwMjKPP3FU=;
        b=JttvvOL+eZ3qV0KeCDKs9PbUIDHAN/6np/7xupwGnfqmAs6SaQigA26aMlrXZJN67x
         bOrCHXGoWh+tMACfOINNl6C8dmG9E1QST8h8FDcnEZRtEiFgCK+UkLhHYMVUsqpSTi1/
         v4dqupVbbckcMvTGmRhhYRBXPEnCPl3H0+H/1Y9JKC9LAz4i7U/Q1HTnYEGRC43UCgGX
         EtidFC2vKAE5SLEusc1jgJmTX6Wvb7iJgZ+O4yrhxUU/Y8i5GfHN+K2Hs7S8XtxgvMdE
         Y3r8EsZ4s5LErO37CdFdjYLNgz/U7Dlqe8j6iIcUmdEB/wMDM8mVkVeAg8ppVRIGU2cr
         C8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835197; x=1711439997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYcSW/ibSMj6iVuV1sk8Zdj3J66OqbMWoQwMjKPP3FU=;
        b=uqbvLeCZww1IFk199OkzcRO80V7flWzJFz25lx7SuoSgay+Kv2XXmVd6jYHvgrsl7+
         +TcClhS6VGQohYCbXUw4K8vLUnF39TeXyeYY0Nr+P4UvGp6Ckzai08yzixwPUPbg/i92
         ByNAALqzFp9hzxJTfpul0XPsF/bFJOyA7A8p1OeVailM5jiygEdYwabQNnzG6UAnYBI/
         rOwWCXoQT2ZeKSFayECuAD3oUpg29Fw1AxMRMebPUnn93WWwok7BFAHF5HL/3O7CxqJc
         lSsKEgmgv/gFgFRlc4TlBN8+JCvt5TwWkbJKH9UjyQjkXyIngSmRjEbfQorEk6rTHu5d
         d7RA==
X-Forwarded-Encrypted: i=1; AJvYcCVQPl48BiyVXoS/W6bKhZ67dcEJ07YVzQ+SIMRVeUUx4S+NE0ruiRbBgiK8n/zHV3/5Bci5ExSKJ4xpCMU5o1Vd53oc1VfOxFN2PHZOYA==
X-Gm-Message-State: AOJu0YxuZ7LdnLOE2vZSrO4iswwF1Ixo9nFl6XkL+DlsTZUmYpsvk6Gs
	3hceMzw4o6wETQ98H+6fuf7i5nYQI8ikD1K/10w50deK3XZlAWOy
X-Google-Smtp-Source: AGHT+IFMGBRGfTdm1Xi8PAhIoZeRYeQWIYa6zNRyD2io/DMVYPLb1oYyq/AdJHPXtgA/PjJTjuJEng==
X-Received: by 2002:a05:6a00:2309:b0:6e6:bb2b:882c with SMTP id h9-20020a056a00230900b006e6bb2b882cmr16430185pfh.13.1710835197183;
        Tue, 19 Mar 2024 00:59:57 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.00.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 00:59:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 06/35] gitlab-ci: Run migration selftest on s390x and powerpc
Date: Tue, 19 Mar 2024 17:58:57 +1000
Message-ID: <20240319075926.2422707-7-npiggin@gmail.com>
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

The migration harness is complicated and easy to break so CI will
be helpful.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .gitlab-ci.yml      | 18 +++++++++++-------
 s390x/unittests.cfg |  8 ++++++++
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ff34b1f50..bd34da04f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -92,26 +92,28 @@ build-arm:
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
+     selftest-setup selftest-migration selftest-migration-skip spapr_hcall
+     rtas-get-time-of-day rtas-get-time-of-day-base rtas-set-time-of-day
+     emulator
      | tee results.txt
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
+     selftest-setup selftest-migration selftest-migration-skip spapr_hcall
+     rtas-get-time-of-day rtas-get-time-of-day-base rtas-set-time-of-day
+     emulator
      | tee results.txt
  - if grep -q FAIL results.txt ; then exit 1 ; fi
 
@@ -135,7 +137,7 @@ build-riscv64:
 build-s390x:
  extends: .outoftree_template
  script:
- - dnf install -y qemu-system-s390x gcc-s390x-linux-gnu
+ - dnf install -y qemu-system-s390x gcc-s390x-linux-gnu nmap-ncat
  - mkdir build
  - cd build
  - ../configure --arch=s390x --cross-prefix=s390x-linux-gnu-
@@ -161,6 +163,8 @@ build-s390x:
       sclp-1g
       sclp-3g
       selftest-setup
+      selftest-migration-kvm
+      selftest-migration-skip
       sieve
       smp
       stsi
diff --git a/s390x/unittests.cfg b/s390x/unittests.cfg
index 49e3e4608..b79b99416 100644
--- a/s390x/unittests.cfg
+++ b/s390x/unittests.cfg
@@ -31,6 +31,14 @@ groups = selftest migration
 # https://lore.kernel.org/qemu-devel/20240219061731.232570-1-npiggin@gmail.com/
 accel = kvm
 
+[selftest-migration-kvm]
+file = selftest-migration.elf
+groups = nodefault
+accel = kvm
+# This is a special test for gitlab-ci that can must not use TCG until the
+# TCG migration fix has made its way into CI environment's QEMU.
+# https://lore.kernel.org/qemu-devel/20240219061731.232570-1-npiggin@gmail.com/
+
 [selftest-migration-skip]
 file = selftest-migration.elf
 groups = selftest migration
-- 
2.42.0

