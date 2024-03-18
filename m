Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B2C87F0CC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 21:04:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=InxVHWpS;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=InxVHWpS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz5Rj40l3z3dXN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 07:04:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=InxVHWpS;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=InxVHWpS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz5R02gSDz3bnB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 07:04:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j5cONy39WPTChmBWXZo5a/mjWSs5JnDb/U3l3IKfJB0=;
	b=InxVHWpSgzQYn8fmIygDW65nFhl7yfRlR6+iXjYiqPdZwLTAw5iJKlzHhkGOjIg4Y0Q0oJ
	6EK+XpRRBMsJWfu+QeqIi5S6cBl4+p/vr7hi7FCOROAmBC1ytCQf9r+0Eu31sJcYrPQf3e
	EbcoFelezV5gzKFeOXvuEdT10b4QOjI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j5cONy39WPTChmBWXZo5a/mjWSs5JnDb/U3l3IKfJB0=;
	b=InxVHWpSgzQYn8fmIygDW65nFhl7yfRlR6+iXjYiqPdZwLTAw5iJKlzHhkGOjIg4Y0Q0oJ
	6EK+XpRRBMsJWfu+QeqIi5S6cBl4+p/vr7hi7FCOROAmBC1ytCQf9r+0Eu31sJcYrPQf3e
	EbcoFelezV5gzKFeOXvuEdT10b4QOjI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-LJYW-EldM420sPnNSvqY8A-1; Mon, 18 Mar 2024 16:04:07 -0400
X-MC-Unique: LJYW-EldM420sPnNSvqY8A-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-430d45c66acso2197621cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 13:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710792247; x=1711397047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5cONy39WPTChmBWXZo5a/mjWSs5JnDb/U3l3IKfJB0=;
        b=ckwDK17pKqWaaKz0y/TmxQIVViZyWk6VeYRuqEqQM4srDPlpkHGPmMoHt1n/Fink25
         SrYWcDblqIhV+F6joxqiU28oPK2c32UMnY5lD1usyuvD6Ufd9b0brNaTMXXXpy+zDY9n
         Wx6jHjq+WHEHFKYmNsVd8GYl9DBf/r1X2NQXnmHy7G4zLo1+iNHcz3H1PWpF00Xzx4cZ
         hB9CzRSc2IcmtdtWJ9YE5wY8/Vi2Cc2fnBKHd4VreY9sjJGjJP7rY5vANc7JZcSZnlgC
         E8MPsfA8nFI10Hyin8PwZhtHBR0e1vA3L93iFYeXWVybWqeqR5bNtN3X1WtwlF4Lw8K3
         m0NA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ8mlV/e+K/Unrhs6fbfgs88aNpYdGXa/YSwN9V5Ti4CcDYtZQ7ZU6ZToVW2Eto+Ga1L3ubYYo5iCF/WZ1iJs/E8yn+Z73UfRE4Ra21Q==
X-Gm-Message-State: AOJu0YxnnBPxPf/VA440QyLN7ZScle3p/Sn+rrOgP2MAYfCdxt6arXrJ
	vq2xpoNAAtWycYSY0ZNtqn6mY9fpQ4Ysyf/zhHVrzGng96PSVYq0uycdle21dB39zdQR0HY1mS4
	dVx3d6MM4ZE5rVmYzJWNQ2CFaUEED7gFKAmhU6KPo+iiEcN2gLHNVL6xZ4Egno9c=
X-Received: by 2002:ac8:7c98:0:b0:430:ace8:980c with SMTP id y24-20020ac87c98000000b00430ace8980cmr316487qtv.1.1710792246960;
        Mon, 18 Mar 2024 13:04:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo9BloGRl/c/yuy7ygQZyZX9tfR07zN6D3r4pfcwUlCUAvWyqq6nKAa5eHOp/ysbaQ7B4Kng==
X-Received: by 2002:ac8:7c98:0:b0:430:ace8:980c with SMTP id y24-20020ac87c98000000b00430ace8980cmr316449qtv.1.1710792246399;
        Mon, 18 Mar 2024 13:04:06 -0700 (PDT)
Received: from x1n.. ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hj10-20020a05622a620a00b0042ebbc1196fsm3484491qtb.87.2024.03.18.13.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:04:06 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 00/14] mm/treewide: Remove pXd_huge() API
Date: Mon, 18 Mar 2024 16:03:50 -0400
Message-ID: <20240318200404.448346-1-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
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
Cc: linux-arm-kernel@lists.infradead.org, Muchun Song <muchun.song@linux.dev>, x86@kernel.org, Matthew Wilcox <willy@infradead.org>, peterx@redhat.com, Jason Gunthorpe <jgg@nvidia.com>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

[based on akpm/mm-unstable commit b66d4391d8fe, March 18th]

v2:
- Add a patch to cleanup ARM's pmd_thp_or_huge [Christophe]
- Enhance commit message for PowerPC patch on hugepd [Christophe]

v1: https://lore.kernel.org/r/20240313214719.253873-1-peterx@redhat.com

In previous work [1], we removed the pXd_large() API, which is arch
specific.  This patchset further removes the hugetlb pXd_huge() API.

Hugetlb was never special on creating huge mappings when compared with
other huge mappings.  Having a standalone API just to detect such pgtable
entries is more or less redundant, especially after the pXd_leaf() API set
is introduced with/without CONFIG_HUGETLB_PAGE.

When looking at this problem, a few issues are also exposed that we don't
have a clear definition of the *_huge() variance API.  This patchset
started by cleaning these issues first, then replace all *_huge() users to
use *_leaf(), then drop all *_huge() code.

On x86/sparc, swap entries will be reported "true" in pXd_huge(), while for
all the rest archs they're reported "false" instead.  This part is done in
patch 1-5, in which I suspect patch 1 can be seen as a bug fix, but I'll
leave that to hmm experts to decide.

Besides, there are three archs (arm, arm64, powerpc) that have slightly
different definitions between the *_huge() v.s. *_leaf() variances.  I
tackled them separately so that it'll be easier for arch experts to chim in
when necessary.  This part is done in patch 6-9.

The final patches 10-14 do the rest on the final removal, since *_leaf()
will be the ultimate API in the future, and we seem to have quite some
confusions on how *_huge() APIs can be defined, provide a rich comment for
*_leaf() API set to define them properly to avoid future misuse, and
hopefully that'll also help new archs to start support huge mappings and
avoid traps (like either swap entries, or PROT_NONE entry checks).

The whole series is lightly tested on x86 and arm64.

[1] https://lore.kernel.org/r/20240305043750.93762-1-peterx@redhat.com

Peter Xu (14):
  mm/hmm: Process pud swap entry without pud_huge()
  mm/gup: Cache p4d in follow_p4d_mask()
  mm/gup: Check p4d presence before going on
  mm/x86: Change pXd_huge() behavior to exclude swap entries
  mm/sparc: Change pXd_huge() behavior to exclude swap entries
  mm/arm: Use macros to define pmd/pud helpers
  mm/arm: Redefine pmd_huge() with pmd_leaf()
  mm/arm64: Merge pXd_huge() and pXd_leaf() definitions
  mm/powerpc: Redefine pXd_huge() with pXd_leaf()
  mm/gup: Merge pXd huge mapping checks
  mm/treewide: Replace pXd_huge() with pXd_leaf()
  mm/treewide: Remove pXd_huge()
  mm/arm: Remove pmd_thp_or_huge()
  mm: Document pXd_leaf() API

 arch/arm/include/asm/pgtable-2level.h         |  5 ++-
 arch/arm/include/asm/pgtable-3level-hwdef.h   |  1 +
 arch/arm/include/asm/pgtable-3level.h         |  5 ++-
 arch/arm/lib/uaccess_with_memcpy.c            |  4 +--
 arch/arm/mm/Makefile                          |  1 -
 arch/arm/mm/hugetlbpage.c                     | 34 -------------------
 arch/arm64/include/asm/pgtable.h              |  6 ++--
 arch/arm64/mm/hugetlbpage.c                   | 18 ++--------
 arch/loongarch/mm/hugetlbpage.c               | 12 +------
 arch/mips/include/asm/pgtable-32.h            |  2 +-
 arch/mips/include/asm/pgtable-64.h            |  2 +-
 arch/mips/mm/hugetlbpage.c                    | 10 ------
 arch/mips/mm/tlb-r4k.c                        |  2 +-
 arch/parisc/mm/hugetlbpage.c                  | 11 ------
 .../include/asm/book3s/64/pgtable-4k.h        | 20 -----------
 .../include/asm/book3s/64/pgtable-64k.h       | 25 --------------
 arch/powerpc/include/asm/book3s/64/pgtable.h  | 27 +++++++--------
 arch/powerpc/include/asm/nohash/pgtable.h     | 10 ------
 arch/powerpc/mm/pgtable_64.c                  |  6 ++--
 arch/riscv/mm/hugetlbpage.c                   | 10 ------
 arch/s390/mm/hugetlbpage.c                    | 10 ------
 arch/sh/mm/hugetlbpage.c                      | 10 ------
 arch/sparc/mm/hugetlbpage.c                   | 12 -------
 arch/x86/mm/hugetlbpage.c                     | 26 --------------
 arch/x86/mm/pgtable.c                         |  4 +--
 include/linux/hugetlb.h                       | 24 -------------
 include/linux/pgtable.h                       | 24 ++++++++++---
 mm/gup.c                                      | 24 ++++++-------
 mm/hmm.c                                      |  9 ++---
 mm/memory.c                                   |  2 +-
 30 files changed, 68 insertions(+), 288 deletions(-)
 delete mode 100644 arch/arm/mm/hugetlbpage.c

-- 
2.44.0

