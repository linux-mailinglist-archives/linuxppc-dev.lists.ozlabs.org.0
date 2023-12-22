Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1392181CAF6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 14:51:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NqkNEYCJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SxTHb5NJfz3cWY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Dec 2023 00:51:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NqkNEYCJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SxTGl0w7Yz2yDM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Dec 2023 00:51:09 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-28beb1d946fso1536499a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 05:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703253065; x=1703857865; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5zqMKf7KXgOHRYALYfO/qvFwWZkjocCEqNPPk9MJnuw=;
        b=NqkNEYCJsqzIG3SJTYJ2vgmp6JfwiJPfpl1FKDvWvv0na0z10l7uyh9L3Sa5ziLVku
         rovO/di6/f7jeAQr5nyftmZ8X+u4a8iavzeu7YOhBQDa1AoMFBiDUFclxlgrvouuNYtC
         hPiQzherTMapk1N2taovECOyli1RcxI9wVZB9+f7iY5wRXz3C4ZR4eTpYPwXPoZUN3Kk
         ZW2t4DIDGMXDWkF/2rtASXp3tFu0g3nSuXYjotLR+17HuIKeDyHM2PnckQA4jE+YgXMX
         MHvL5R3kX7XFOENofG9fD3miCYX3Hw3z7qYtkudafFO1j0IBMcJeO9m/tyXDFTxxut+t
         G6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703253065; x=1703857865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zqMKf7KXgOHRYALYfO/qvFwWZkjocCEqNPPk9MJnuw=;
        b=uQDFRvDfq//t1SKwAiwcYe8LVXT/yNWMyZny7KiktrpgbZLvF56nAOkYzIWGyQBFrU
         NsCVVsvFOYH5mNj9vGgJnJOH0k1RTS2DO6DJe9h1jrYXD5/QfTIzM+yiKTcNfjlXdyIQ
         FUZwsP0/GmABFGpUoKE3hYgJgjImKnavTZfhtjsiVyi6H2bScQImpNUA0JDT6azQrDMX
         XM+l1bQbEEucER8fuEy31NYRXana0L21ckXNmWBF7RV/COlVfJIwYXFbZyS+EcVouquz
         t7Sa95nPffsb2B3QfO7qHDs9OPZkDYpbTVc3Rq2//W0ianQ1Oe8VQuoL695K0cKjcijP
         b2LQ==
X-Gm-Message-State: AOJu0Yy+PRlgJzOkoTYE/6hXpYHO7lWICpmPwtizR+hCTyYg3Mur9lAX
	gXxhp6fTM1t+BleFFZZt9G0=
X-Google-Smtp-Source: AGHT+IFTvL7baOi+WA9A1CiGd4kDHO1A0hMH2POOXsGm8LsAosUoUwCP2mO+R1FoLFAExQXoGS9h7A==
X-Received: by 2002:a17:90a:ad84:b0:286:6cc1:3f03 with SMTP id s4-20020a17090aad8400b002866cc13f03mr1086130pjq.58.1703253065442;
        Fri, 22 Dec 2023 05:51:05 -0800 (PST)
Received: from wheely.local0.net ([203.220.145.68])
        by smtp.gmail.com with ESMTPSA id n12-20020a17090ac68c00b0028ae54d988esm3629280pjt.48.2023.12.22.05.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 05:51:04 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 0/9] Multi-migration support
Date: Fri, 22 Dec 2023 23:50:39 +1000
Message-ID: <20231222135048.1924672-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas suggested I should split this out of the powerpc series
because it is applicable to other archs as well and it's easier
for others to review like this.

Since the v5 series:
- Split out from powerpc changes
- Fixed another small race found when running migration tests
  on aarch64 (wait for destination machine to have qmp socket
  set up before issuing qmp commands to it).
- Added a directory for common tests, added the migration
  selftest to it, build it on arm and s390x as well.
- Add "quiet" migration support, use it in migration selftest.
- Cut down runtime for migration selftest so it is suitable for
  unit tests. Add it to unit tests.
- Fix a s390x make clean omission that bit me when testing
  it. This does not depend on the other patches.

Thanks,
Nick

Nicholas Piggin (9):
  s390x: clean lib/auxinfo.o
  arch-run: Clean up temporary files properly
  arch-run: Clean up initrd cleanup
  migration: use a more robust way to wait for background job
  migration: Support multiple migrations
  arch-run: rename migration variables
  migration: Add quiet migration support
  Add common/ directory for architecture-independent tests
  migration: add a migration selftest

 arm/Makefile.common         |   1 +
 arm/sieve.c                 |   2 +-
 arm/unittests.cfg           |   6 ++
 common/selftest-migration.c |  34 +++++++
 common/sieve.c              |  51 ++++++++++
 lib/migrate.c               |  20 +++-
 lib/migrate.h               |   2 +
 powerpc/Makefile.common     |   1 +
 powerpc/unittests.cfg       |   4 +
 s390x/Makefile              |   3 +-
 s390x/sieve.c               |   2 +-
 s390x/unittests.cfg         |   4 +
 scripts/arch-run.bash       | 181 ++++++++++++++++++++++++++----------
 x86/sieve.c                 |  52 +----------
 14 files changed, 258 insertions(+), 105 deletions(-)
 create mode 100644 common/selftest-migration.c
 create mode 100644 common/sieve.c
 mode change 100644 => 120000 x86/sieve.c

-- 
2.42.0

