Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D2786714E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:36:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RfOYw9tJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tjxr90MZvz3w2w
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:36:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RfOYw9tJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjxLl4tDrz3vf6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:14:55 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6e4f5e84abeso448768b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 02:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708942494; x=1709547294; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oiwxTGWU6IUJhXbPXi9jlCFl9jNsVOAORO/dFL4KH8=;
        b=RfOYw9tJb0DptRmbzzVxpCJQnWGkljy2ffr5Lu4B9oxBu8fLd2J5M2BWP0+rbfP7aZ
         KskvZirnw64vo2T1p35pMZ00ZdGEL/niscOrow+LoeZ6BiRTTgmR9rMBpl7gttElKO6w
         uNvMjLYdpzgDLFpaBwfhZKKnDoYoKhT8N+0819/WcoVXtx9bGO+6qYJ9tSBoG4ZTrrCG
         yWyYbNH1OVHgfCjOD7r6TQw+bENQAIDQNab7jJHUsr2M4/9IP7q/2p6csDoA5ASuLOkq
         6tqODE41j4hpmCAiB/ZTv1UoR7JrG5fw5ZkK44NVHRZlT/jsfShYCxUt4zVx7EF2oYfI
         xlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708942494; x=1709547294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8oiwxTGWU6IUJhXbPXi9jlCFl9jNsVOAORO/dFL4KH8=;
        b=Vm/WDL6xbKyguEt6NpbOuv6OjjiuTPBcwuX+vkhtz3gQr1v5+R+GNnxfcbN5LQcG/o
         8FjppMuN3ToyaSWq9b3chTnyhNpu8/16Ay8wLnLXCbQ9Ca+YYT1uhIuRniK9fjpO02rt
         RBG2cexrXLl8/d1G4P1/9tYzDrmhQmwYGNJY1F9HweJqkGT4fEuCIa6molWUtcNZbTUh
         X/twqXo8dMZ8x7NhWrLCke00hBRK9ay2Rf9zgzdG7Y03onOhsT9RoyXfNlMfZyWzPRw1
         fyH5t0egK0Ap8ZKm8Gg3mgVfoPOtJDVIn7UQFqxXiZ0OYCemPHc9CAPpR7QPP/i+zsWz
         YLtg==
X-Forwarded-Encrypted: i=1; AJvYcCW5jjlasdwWwCT3fdcFAM4gdprIqzYmyFDQPLl3wp7OjMQwfTQGsFEShI8a/eqCZ1AUhokLa0Ql3fk6Re+ZG5AgXmKAZwDS045bjrqVnw==
X-Gm-Message-State: AOJu0YwjT9XsQhEk7KNr7niKWvd4DOSnVml2aOCYUQbaM/Pk7AvcBzGL
	Qcdr4pbql1ToO32LMLsI//WH1Qh3akL3hF1TS4ujWQlOva46yJaX
X-Google-Smtp-Source: AGHT+IEdmNJCAyNnb0OHlETxiDPkAQRNZ6Rj92dODzdJv+fmEZif4N25wNv6OUOT4lP8rkt8ITdgiA==
X-Received: by 2002:a05:6a00:3c86:b0:6e1:3cdb:76f1 with SMTP id lm6-20020a056a003c8600b006e13cdb76f1mr9030138pfb.20.1708942493857;
        Mon, 26 Feb 2024 02:14:53 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id x24-20020aa784d8000000b006e463414493sm3626693pfn.105.2024.02.26.02.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:14:53 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 32/32] powerpc: gitlab CI update
Date: Mon, 26 Feb 2024 20:12:18 +1000
Message-ID: <20240226101218.1472843-33-npiggin@gmail.com>
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

This adds testing for the powernv machine, and adds a gitlab-ci test
group instead of specifying all tests in .gitlab-ci.yml.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .gitlab-ci.yml        | 16 ++++++----------
 powerpc/unittests.cfg | 15 ++++++++-------
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 61f196d5d..51a593021 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -69,11 +69,9 @@ build-ppc64be:
  - cd build
  - ../configure --arch=ppc64 --endian=big --cross-prefix=powerpc64-linux-gnu-
  - make -j2
- - ACCEL=tcg ./run_tests.sh
-     selftest-setup selftest-migration selftest-migration-skip spapr_hcall
-     rtas-get-time-of-day rtas-get-time-of-day-base rtas-set-time-of-day
-     emulator
-     | tee results.txt
+ - ACCEL=tcg MAX_SMP=8 ./run_tests.sh -g gitlab-ci | tee results.txt
+ - if grep -q FAIL results.txt ; then exit 1 ; fi
+ - ACCEL=tcg MAX_SMP=8 MACHINE=powernv ./run_tests.sh -g gitlab-ci | tee results.txt
  - if grep -q FAIL results.txt ; then exit 1 ; fi
 
 build-ppc64le:
@@ -82,11 +80,9 @@ build-ppc64le:
  - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
  - ./configure --arch=ppc64 --endian=little --cross-prefix=powerpc64-linux-gnu-
  - make -j2
- - ACCEL=tcg ./run_tests.sh
-     selftest-setup selftest-migration selftest-migration-skip spapr_hcall
-     rtas-get-time-of-day rtas-get-time-of-day-base rtas-set-time-of-day
-     emulator
-     | tee results.txt
+ - ACCEL=tcg MAX_SMP=8 ./run_tests.sh -g gitlab-ci | tee results.txt
+ - if grep -q FAIL results.txt ; then exit 1 ; fi
+ - ACCEL=tcg MAX_SMP=8 MACHINE=powernv ./run_tests.sh -g gitlab-ci | tee results.txt
  - if grep -q FAIL results.txt ; then exit 1 ; fi
 
 # build-riscv32:
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index e275f389b..21071a1a1 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -34,17 +34,17 @@
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
 
 [selftest-migration-skip]
 file = selftest-migration.elf
 machine = pseries
-groups = selftest migration
+groups = selftest migration gitlab-ci
 extra_params = -append "skip"
 
 # This fails due to a QEMU TCG bug so KVM-only until QEMU is fixed upstream
@@ -56,7 +56,7 @@ groups = migration
 
 [spapr_hcall]
 file = spapr_hcall.elf
-machine = pseries
+machine = pseries gitlab-ci
 
 [spapr_vpa]
 file = spapr_vpa.elf
@@ -67,24 +67,25 @@ file = rtas.elf
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

