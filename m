Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A31EB84F206
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 10:12:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZyV0ofBd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWSmb3Q4Yz3cVd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 20:12:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZyV0ofBd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWSlp1KLVz3btX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 20:11:48 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3be6df6bc9bso429909b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Feb 2024 01:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707469905; x=1708074705; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+vVti2Abh8xz/VGQndlLuUefZ1rrTqLcNRInLl4jaCU=;
        b=ZyV0ofBdYdcJVJyk2HvT4jQAtAbcEEj1v5LgorQz0v8FgzbLNUZFbhclCD7foFmGEK
         3RtTCI07QYHNUjSdpsI66Uf2EoIxUH67pj4QgG7i0sG8g/TnADc9DHmkI6m8Bv6GrDci
         nMjT90jRkkl9MFLP8qJ6h6XPcjGiRX87F2gXMZcVMn3QGRLsbwfuTmFvsU90R1IDKnkG
         s5MsC6XiKqG4bDnJ51CVqvITKYuOZX4fUzLevffRQv8nIhn2/dSs6Uk5g4+H1MkwgMWy
         f16FOQARHV49sJHngilrkBL5z9DhJk2pAfLFpo+4xBK5v3yNlm9TVqGbFyuToZVzWdeb
         bzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707469905; x=1708074705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vVti2Abh8xz/VGQndlLuUefZ1rrTqLcNRInLl4jaCU=;
        b=Olp4P6REmTN8GJohygyDuPi5FNZRQPih09eEY3i9H5qbj/+qLyNL6Uyt2mJLB/y87t
         BRBUgzv68fh3H7fn2sIbwwrLlbs1D20+r1NoT96W7jEdd/VzkUlG9GuGzkO5EVDJReYI
         8UBYao+o0tTbsbOEB5T/NxM8+TvRgX5/jwLQSGJfOgRoH+l1wsIRf+rT5P8QYCDht5J8
         KKbBTZgJdZOWk3CXT6hSsdypJ6K3arrrlBEVb6cQwwhG9xuuDQKZY7V+wOSoDrUKZQdb
         3XJtRUNi5i6ruCFexyXS70wOK8EvEEO+XKHeKjbkLSHAs8pE3mRXkTdiPZwtBP4M1CF8
         C4zw==
X-Gm-Message-State: AOJu0YzXLNb4iqf6kPuiL1PmOdQarlO8mVLL5YscHQvugCrQBdmckwng
	SK9PfnVwZGBdyF+ZriZvs7NpLrW3m1fI2dNw0mRWkI7Taqp5fcOt
X-Google-Smtp-Source: AGHT+IG3zdJLlpnr4YMGnHBARjjI3k3jmK+vigqyhy9cel3bnwJ5WgU4GP+yPUZ/oLlX1seRUem1Dw==
X-Received: by 2002:a05:6358:d381:b0:179:272e:54e9 with SMTP id mp1-20020a056358d38100b00179272e54e9mr987022rwb.30.1707469905629;
        Fri, 09 Feb 2024 01:11:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0PhkvLsxF+pFGpKPmBboiEOLww3D4Trh2Gnp8VhERt9RNQ+97flnppsx2wejpSO65vpdv3Kz/QekBz56jxf9FM2zOpoU5glNWmU+dHZHfjMM0wlGpxuSbH7HC4cQl0adtxvkosWDhxvIpC1Ez47nwO3G2bzjlVV7rao9m3dv73deWpUcOO8P+oFeW1BZOHt8jnAiUjaI1WQkiXQEez7QX8A+5eseqHuIlJQFpRMj530lUtXdGv5gO/Pwrq/ujaHwX/SCp/L+WgPcb6bmC8F48wD8SgSFQRK6o7i2hN8ANZHCU2NnTf9+9r+1PV8meIp1RVCMdgT+shuhLmzkqXGvWQE5jFiVvQx0NZ1gvyczsTIvSdCsLLnGYB/TJ33N0WYKA+Ay/rRmS9rWN7QmnDK0gatGkS0vEK2xtYymb9s1/mY8vCDxyJiiA/03cywPsAfejpyCNUWw8kZ28mnEyU4QXOmA4CYFY/frvo3IEoarAPLGyZ5XJ/uY2M0lxLKRjZTvsa8iUJLhEUOInj0UIZLTAJEZ9zEGa3nzxNIlggEV4CKbdqTWPXczh
Received: from wheely.local0.net ([118.208.150.76])
        by smtp.gmail.com with ESMTPSA id cb1-20020a056a02070100b005c1ce3c960bsm1101742pgb.50.2024.02.09.01.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 01:11:45 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v4 0/8] Multi-migration support
Date: Fri,  9 Feb 2024 19:11:26 +1000
Message-ID: <20240209091134.600228-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks for the detailed reviews. Hopefully this is the last one...

Since v3:
- Addressed Thomas's review comments:
- Patch 2 initrd cleanup unset the old variable in the correct place.
- Patch 4 multi migration removed the extra wait for "Now migrate the
  VM" message, and updated comments around it.
- Patch 6 fix typo and whitespace in quiet migration support.
- Patch 8 fix typo and whitespace in migration selftest.

Since v2:
- Rebase on riscv port and auxvinfo fix was merged.
- Clean up initrd cleanup moves more commands into the new cleanup
  function from the trap handler comands (suggested by Thomas).
- "arch-run: Clean up temporary files properly" patch is now renamed
  to "arch-run: Fix TRAP handler..."
- Fix TRAP handler patch has redone changelog to be more precise about
  the problem and including recipe to recreate it.
- Fix TRAP handler patch reworked slightly to remove the theoretical
  race rather than just adding a comment about it.
- Patch 3 was missing a couple of fixes that leaked into patch 4,
  those are moved into patch 3.

Thanks,
Nick

Nicholas Piggin (8):
  arch-run: Fix TRAP handler recursion to remove temporary files
    properly
  arch-run: Clean up initrd cleanup
  migration: use a more robust way to wait for background job
  migration: Support multiple migrations
  arch-run: rename migration variables
  migration: Add quiet migration support
  Add common/ directory for architecture-independent tests
  migration: add a migration selftest

 arm/Makefile.common          |   1 +
 arm/selftest-migration.c     |   1 +
 arm/sieve.c                  |   2 +-
 arm/unittests.cfg            |   6 ++
 common/selftest-migration.c  |  34 +++++++
 common/sieve.c               |  51 ++++++++++
 lib/migrate.c                |  19 +++-
 lib/migrate.h                |   2 +
 powerpc/Makefile.common      |   1 +
 powerpc/selftest-migration.c |   1 +
 powerpc/unittests.cfg        |   4 +
 riscv/sieve.c                |   2 +-
 s390x/Makefile               |   1 +
 s390x/selftest-migration.c   |   1 +
 s390x/sieve.c                |   2 +-
 s390x/unittests.cfg          |   4 +
 scripts/arch-run.bash        | 177 +++++++++++++++++++++++++----------
 x86/sieve.c                  |  52 +---------
 18 files changed, 253 insertions(+), 108 deletions(-)
 create mode 120000 arm/selftest-migration.c
 create mode 100644 common/selftest-migration.c
 create mode 100644 common/sieve.c
 create mode 120000 powerpc/selftest-migration.c
 create mode 120000 s390x/selftest-migration.c
 mode change 100644 => 120000 x86/sieve.c

-- 
2.42.0

