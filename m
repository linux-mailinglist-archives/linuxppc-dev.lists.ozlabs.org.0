Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B98A6866EC9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 10:39:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jDW92R9V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjwYx3y2Bz3dTG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 20:39:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jDW92R9V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjwY93NPCz2xPd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 20:38:51 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5cfd95130c6so1569245a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 01:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708940327; x=1709545127; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E3G/NyHHNl3Usb0b+rbhE6Rkccfmxj4qh+DyqPiks1E=;
        b=jDW92R9V/XtgdC7qM2d77TXYLa7qn+Wlq6mVywqxAyIhYaeUyoWty/hMxvYlJT0a1O
         xMzxcVJNj8QLElTIQubAwh3NPcoMvJHtlNcQJJMCPR+bjx62ztK/dhqFU+ZQw2s6lDa8
         zr738/8kNeDp1LRKCd//6ZXMKCtVx7OONWXqvaGwn2if4hOWO3k2EN5Xc7WXxr41MG8t
         rCxcFHj2TGzjcXPHDFDVCvdkpMSxJ3dL15hgD1cviLR2FSYd0kTMbLltRXUjOt+Z0S04
         ve9C8ZLOn1s6rblSBgH9uBhGdyV8GcPc5daf6XFXt1fyIsK7DtdnKp6xtW9WngEK/XEI
         wNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708940327; x=1709545127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3G/NyHHNl3Usb0b+rbhE6Rkccfmxj4qh+DyqPiks1E=;
        b=uTpm+6WeQK+a5dS6Th2tiGL4hK5mLDSgXgWG1+vz7ToFqSczGrGv5B6yqbmvPS3lsg
         VP+T+Ecxpj1Qy9evP0YXlM6nlnF5jZbLfs6L0YTReT0tSCrnqydivxAy2QaGP/3MLG0j
         eOJNTiT8GSkruOCmhwZBV/bz+pWvPyMZvDe740y2KgmjgXQyQ3wORoDYtcZD9m5eiSCc
         TWlywcJKbfUE++NjPYZdkSDoc3gPjf54cYvk+H3lsB3aNqTVqqWSbhF56GtvHJl8LJ08
         cl3g7O+6Ix0jiTio7N1XuZVNLBeFJkiOcgeUzVV5roDA7OsIojM/SEIs4ax+jC/zWhV4
         W0Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXfG5zCmWAzFDP9BqxDhyj2LVlWmcYSkDUwAKq7Keyp4Yx3IRsC+wZENWX0/UuIsY328/SElb6cROAMcLmeRJdlFgbcg0oZOTViVAXlgQ==
X-Gm-Message-State: AOJu0YxdSdhxgQH9ctgNGBEdwhdU9amxTNuFTJtIeDxm0gwMRM99iVXl
	qppxxn8iGUAim5iKlFzv4b4c6KFntSuYtT3j1/m9XARb/AU5voiO
X-Google-Smtp-Source: AGHT+IGMwqjc4MYINbePOp82r8OWn0Ybag/WhoYmigaBPWKyvko3+xObzrZwGy7/pnjt3jaEplP3kA==
X-Received: by 2002:a17:90b:4f47:b0:29a:cbde:7607 with SMTP id pj7-20020a17090b4f4700b0029acbde7607mr950982pjb.21.1708940326863;
        Mon, 26 Feb 2024 01:38:46 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id pa3-20020a17090b264300b0029929ec25fesm6036782pjb.27.2024.02.26.01.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 01:38:46 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 0/7] more migration enhancements and tests
Date: Mon, 26 Feb 2024 19:38:25 +1000
Message-ID: <20240226093832.1468383-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series applies on top of the multi-migration patches and just
has assorted things I've been collecting.

- New migrate_skip() command that tidies up the wart of using
  migrate_once() to skip migration.
- New "continuous migration" mode where the harness just
  migrates the test contually while it is running.
- Put some migration tests in gitlab CI for powerpc and s390.
- Add a test case that can reproduce the QEMU TCG dirty bitmap
  migration bug.

Nicholas Piggin (7):
  arch-run: Keep infifo open
  migration: Add a migrate_skip command
  (arm|s390): Use migrate_skip in test cases
  powerpc: add asm/time.h header with delay and get_clock_us/ms
  arch-run: Add a "continuous" migration option for tests
  gitlab-ci: Run migration selftest on s390x and powerpc
  common: add memory dirtying vs migration test

 .gitlab-ci.yml              |  18 ++++---
 arm/gic.c                   |  21 ++++----
 common/memory-verify.c      |  48 +++++++++++++++++
 common/selftest-migration.c |  26 ++++++---
 lib/migrate.c               |  37 ++++++++++++-
 lib/migrate.h               |   5 ++
 lib/powerpc/asm/processor.h |  21 --------
 lib/powerpc/asm/time.h      |  30 +++++++++++
 lib/powerpc/processor.c     |  11 ++++
 lib/powerpc/smp.c           |   1 +
 lib/ppc64/asm/time.h        |   1 +
 powerpc/Makefile.common     |   1 +
 powerpc/memory-verify.c     |   1 +
 powerpc/spapr_vpa.c         |   1 +
 powerpc/sprs.c              |   1 +
 powerpc/tm.c                |   1 +
 powerpc/unittests.cfg       |  13 +++++
 s390x/Makefile              |   1 +
 s390x/memory-verify.c       |   1 +
 s390x/migration-cmm.c       |   8 +--
 s390x/migration-skey.c      |   4 +-
 s390x/migration.c           |   1 +
 s390x/unittests.cfg         |  11 ++++
 scripts/arch-run.bash       | 104 +++++++++++++++++++++++++++++-------
 24 files changed, 299 insertions(+), 68 deletions(-)
 create mode 100644 common/memory-verify.c
 create mode 100644 lib/powerpc/asm/time.h
 create mode 100644 lib/ppc64/asm/time.h
 create mode 120000 powerpc/memory-verify.c
 create mode 120000 s390x/memory-verify.c

-- 
2.42.0

