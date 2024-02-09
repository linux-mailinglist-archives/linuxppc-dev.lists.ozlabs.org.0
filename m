Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8F084F089
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 08:02:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TmDAnhcy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWPtn0xfXz3cY0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 18:02:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TmDAnhcy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWPt000kTz2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 18:01:59 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d7393de183so4741445ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Feb 2024 23:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707462114; x=1708066914; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZI6d9cux97L7dUT4TQMpq+dvoK2aI/bTyxDjBMmG0M=;
        b=TmDAnhcyJjNC7WlUTa8ibtY4ktTfodkk0/wXp4Qty7lZjWQ9PrtRWvN7X8duSGQDQf
         nVXI7FN/g1oD84NS1Q+mINNZNHidCn2C3KnnqBlgAj8lDBxIzoIrWzIi6sOfr9gPu4TF
         27cl2h+kDZgwtSWn6Vjtn4e/3vHbvKTvq1n2v5WdW76/Vc3+5KNLlk7U+/t5X4uWzYfc
         AllCkJveFa5SXsmOds+N6SkRv2ISIS3XOgIqMVmJyrRB6H5lhMnmke0S/RQLV4NerAkJ
         GhU0s0Oga1vgYMtpBGvITizmQEfvpAzVBdY3+J5ZfbS8q+Sl/kJe7PnjU0DOMLqnOxUV
         h43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707462114; x=1708066914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZI6d9cux97L7dUT4TQMpq+dvoK2aI/bTyxDjBMmG0M=;
        b=S1/I6laLjqo248BSNiiz0Xpg0w8r7DVMKTN4XN8NB/xkaxx7o9Ihy7wN95dZSitbxI
         RPT44kPbEWIi/eVl6ktBXUXRjQUtn6musMlFey8SS/GdPGisPpOXgdVOyOZ1VdhYxT4p
         Zia5laGLRvqqvj3e+XhWrufmOwYwPBolLuNGBK0ZZPFe0yL+pdlGvGXkjq8nS8qTeThh
         0/p2NuGcDNsvgRshJ89guSOjO52uX3wtho8RpSQ12nDgOuHDPk/TVwiA0Si116nUymdb
         NzgiNPj25H/taVGT19FOwFAKeGhQNRT+RGYcdPcPB42QVJ7/FU0/TOrnoHK1cVJ71CcA
         pN0Q==
X-Gm-Message-State: AOJu0Ywz2PMYNiomZh0ShcdIzD/800nRIrQ6i5KO+TcsjJnQXRTUkA2n
	qr0GGP7U2VXvVDAhXRrQ+aM0zW1oq6PcdKw37ZwAiUHZZotuOQ/I
X-Google-Smtp-Source: AGHT+IHZRJNVGE1nRp4CsG243g7N5RxTDUHurXHV9jgjH8FEhvyBctWgR3dk3ZSZYU5s1toRaGxOVQ==
X-Received: by 2002:a17:902:6503:b0:1d9:a609:dd96 with SMTP id b3-20020a170902650300b001d9a609dd96mr591187plk.41.1707462114175;
        Thu, 08 Feb 2024 23:01:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWeYPIvgSE2lAHsViOQ/LpTx47391Fz3bpGJ589w2egJPbjUjq85ZVYSEyRf6FY+QZ9VfxhQy7NlooFf3bg10JLQ9VCFNlzq+3YvXyU5KDDMHyaV9JY5oDbQ81EJsRCNqSRRhiqJjD0KqRKrpJefva/gBYT4U91Kb/XVK/pwNjW/PPokJ/rCp0OtV2BJGSFZEqwHj6Wb3rAHNXuXwd/TOlUfFgsV0wA2Ji2Vllh6jtx0TYw7Pt9PtDeoTjnQi0jBwGBb4ig7ICoKVddJdour7JIcNSx1s+6g4fztyQUXdpEm/xpYrahxb8lzH7qxQdrWHia7kG/rB4+r4iqgMSq6z0G/qmM3pLc+lmnI8bgkxaiQnCnt3y/0vq0PO6YUEXUzjdmOBzckaCxeLC72BWLaSOowU8btDpixf0GqlKmHXyIWAGqWzwvlQpq6wqIYPETCQyc9jK6yj0/uhG6J3+nPU0SkKhET9JfWPvHZIuHGxLTHwhiOKj5Jw5uTT+wN/tC1udxD3Wp+w/mk45v2ekyfkDatVvRH+p28o/ehHOB7Kv7OQxROZjamJS1
Received: from wheely.local0.net ([1.146.102.26])
        by smtp.gmail.com with ESMTPSA id r10-20020a170903410a00b001d7284b9461sm839285pld.128.2024.02.08.23.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 23:01:53 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v3 0/8] Multi-migration support
Date: Fri,  9 Feb 2024 17:01:33 +1000
Message-ID: <20240209070141.421569-1-npiggin@gmail.com>
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

I did look into doing a better job at handling timeouts in places
where the migration script can hang (the timeout command only kills
the qemu process, but there are other places the bash script itself
can still timeout). There are ways it might be possible (along the
lines of starting ( sleep N ; kill ) subshell in the backround), but
it's very tricky to handle all the details. Existing script has
timeout issues already, so this series doesn't add a fundamentally
new type of problem here.

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
 lib/migrate.c                |  20 +++-
 lib/migrate.h                |   2 +
 powerpc/Makefile.common      |   1 +
 powerpc/selftest-migration.c |   1 +
 powerpc/unittests.cfg        |   4 +
 riscv/sieve.c                |   2 +-
 s390x/Makefile               |   1 +
 s390x/selftest-migration.c   |   1 +
 s390x/sieve.c                |   2 +-
 s390x/unittests.cfg          |   4 +
 scripts/arch-run.bash        | 182 ++++++++++++++++++++++++++---------
 x86/sieve.c                  |  52 +---------
 18 files changed, 261 insertions(+), 106 deletions(-)
 create mode 120000 arm/selftest-migration.c
 create mode 100644 common/selftest-migration.c
 create mode 100644 common/sieve.c
 create mode 120000 powerpc/selftest-migration.c
 create mode 120000 s390x/selftest-migration.c
 mode change 100644 => 120000 x86/sieve.c

-- 
2.42.0

