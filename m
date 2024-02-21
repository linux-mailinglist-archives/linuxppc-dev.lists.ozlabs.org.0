Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D9385CEBC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 04:29:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cHOnRZxM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfhZq1rqrz3cb5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 14:29:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cHOnRZxM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfhZ237nfz2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 14:28:24 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1dc13fb0133so1087415ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 19:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708486101; x=1709090901; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ig+g0BUZSXifjVBy73OzZ9fIB5v/6NjxVeJ9J0qwojE=;
        b=cHOnRZxMig1N/Rncsgv2CBWW7lcGwsCb3leCZ8peJrREjrUdYyr4spi+XjwGimQo3g
         PCP9NuzfVXL1VwIsHzfbQ7Z+xnU28kIOr42EisGxjSPvQiiSvns1fbrAxU6ZyR25Cf7V
         XLLz4J6jY6mjn7TAxvPoMH1+8S/a5Ku6pwAeavHfju974WWsgiSxRTW2E1L3auqVlop5
         eLhjxIu/iTmkW8KlvJM//x+14vc9orfngyH/QmT6sXzC/KQSiMYbwqsOAyTC9/+NKPcL
         cmX1TswX7Za2xGYnVwcEv3oWfI0FFm78wzs68dBV2wb8gLJwFleeARbzTj5bvjvVuofQ
         py8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486101; x=1709090901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ig+g0BUZSXifjVBy73OzZ9fIB5v/6NjxVeJ9J0qwojE=;
        b=UNRI+V0GAXhvNo8IZBSoCazI6Zn8kzKiTaLzpkmbCJ+KxYneSMgq9hqMc+taJ1ezoE
         5nnybfpFQsD8P5eiicGv8/wXDnZ1kgUm2tc8h/f5fOyteNpcnm9eAVRYLQNqFPQNSeA5
         G5oyyIoXbs7ZLwaVN9INyhzw7pqOAjvtjOF/UxYPyLk52TzXCPbzoSLyO6ZlZTg3+EvQ
         fxZRZF1Mh7HtTuD96dI2ufPvz+2DpPkv8hC1oP+VOtxPfU+HBplL3l7A2f54YAnVqZJB
         /dG9CFTluCdd1Wg4AOzv/cbEoeaOnuWuOafArvc7o99/VY1yOOcT5GalfBfedz2TEkT5
         bNqg==
X-Forwarded-Encrypted: i=1; AJvYcCX6ajDBWJ9SvY3V9a6Jaa35hLMx1BgZq8BsKdx86gCIabggpzMZgtP6bwTdgQ97UNpIPmEkpjRvxa04+Dr430e8leTJSVtGyJi8GwrNgQ==
X-Gm-Message-State: AOJu0YxbrVVXf9Q2oCFVbOXSlr5gTk3ohT6xAvldNtuL3JFBM5BkgJvX
	4qZre9Rm2VrGQTC4oIf6BRvuWwQJN6mfsXxT4zRRTEdHfuUIvq4U
X-Google-Smtp-Source: AGHT+IENcbmlmxPUUYa5IPoB3qyzTiAzkVoX3rrNvUBxi29LRyMCLlj6+/WkLPi+Nhs8BmfBMPXIdQ==
X-Received: by 2002:a17:902:b902:b0:1d9:8ddf:5fa0 with SMTP id bf2-20020a170902b90200b001d98ddf5fa0mr14621025plb.62.1708486100817;
        Tue, 20 Feb 2024 19:28:20 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902b10700b001dc214f7353sm1246457plr.249.2024.02.20.19.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 19:28:20 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v5 0/8] Multi-migration support
Date: Wed, 21 Feb 2024 13:27:49 +1000
Message-ID: <20240221032757.454524-1-npiggin@gmail.com>
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

Now that strange arm64 hang is found to be QEMU bug, I'll repost.
Since arm64 requires Thomas's uart patch and it is worse affected
by the QEMU bug, I will just not build it on arm. The QEMU bug
still affects powerpc (and presumably s390x) but it's not causing
so much trouble for this test case.

I have another test case that can hit it reliably and doesn't
cause crashes but that takes some harness and common lib work so
I'll send that another time.

Since v4:
- Don't build selftest-migration on arm.
- Reduce selftest-migration iterations from 100 to 30 to make the
  test run faster (it's ~0.5s per migration).

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

 arm/sieve.c                  |   2 +-
 common/selftest-migration.c  |  29 ++++++
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
 15 files changed, 240 insertions(+), 108 deletions(-)
 create mode 100644 common/selftest-migration.c
 create mode 100644 common/sieve.c
 create mode 120000 powerpc/selftest-migration.c
 create mode 120000 s390x/selftest-migration.c
 mode change 100644 => 120000 x86/sieve.c

-- 
2.42.0

