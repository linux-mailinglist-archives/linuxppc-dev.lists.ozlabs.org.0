Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B190487B3D0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 22:48:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FI57p4S+;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FI57p4S+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tw40435Zfz3vZX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 08:48:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FI57p4S+;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FI57p4S+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tw3yT02YWz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 08:47:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710366444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cvg3h+nHFQQ2z0yoilgh/3E5YQAg693jLTvjOOpWcMg=;
	b=FI57p4S+EUcPi+r1+QxwPl0qovIAantYoBd76JKd9wff2BDeBE1QK85NxHnYzA8IJiin5G
	DOaGBjfWifd7hjEwFNDUDpp9rMPUkT8pn9KGRRkOHv24Ic9tyDg8SAUoKJEVO6EdbiYYI6
	vbqNIvIvCpIvbUEhT9Fin9vShdYtHZI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710366444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cvg3h+nHFQQ2z0yoilgh/3E5YQAg693jLTvjOOpWcMg=;
	b=FI57p4S+EUcPi+r1+QxwPl0qovIAantYoBd76JKd9wff2BDeBE1QK85NxHnYzA8IJiin5G
	DOaGBjfWifd7hjEwFNDUDpp9rMPUkT8pn9KGRRkOHv24Ic9tyDg8SAUoKJEVO6EdbiYYI6
	vbqNIvIvCpIvbUEhT9Fin9vShdYtHZI=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-MvY3vfAqOMyw-ojnCgCsLQ-1; Wed, 13 Mar 2024 17:47:22 -0400
X-MC-Unique: MvY3vfAqOMyw-ojnCgCsLQ-1
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-474c751e9baso10126137.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 14:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710366442; x=1710971242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cvg3h+nHFQQ2z0yoilgh/3E5YQAg693jLTvjOOpWcMg=;
        b=VMefxRi13QcpXa1GsFNC0Ubl5xV0HIQCAwh418uzniI0XnSDDCjxRDO9+S7QYHMR2Q
         uf/PYdxEVa9TFYzq1sDIO7J5ivupKmAtK5iotkvjKL9xZt0lVEsjBBJgttgJllJAl37r
         Ioq2cPJ0r8tj8irTWBOJ903F7jzYp6ip+WgEcqj30ege45wcBoClCpEj7yNYP4pvQgc+
         f8cJvNMa/zH///hc1bS7irSZLu+C2UCiBv+Vla1rpPhg5lMaDnQDP45PTzh+u5C3jDVm
         P0VO3mTM1/OdfXJS04ajtBEuBN01tsqLY/c1EsOHZZEzzdnv/wESHVt4oLw5q+K0Dztb
         qG8g==
X-Forwarded-Encrypted: i=1; AJvYcCXlpvXlpSKi9xB6o1AidT38CtGT7dalRztqXdJb+DaAFCnkCZy0WOUGPsZyzjlD2w1J5OhFSYT8SABmPBEcUaJtdVYJsy/bkwts+J/moQ==
X-Gm-Message-State: AOJu0Yzq4gLf2BFKTagnkKEK3F8LEpcBYwArfssvCG9dtH7dYN56BaxO
	pHM5aVm0r2FMspteht/2HbEUcxborEXXLJQXClUWOhLc1SQ/0qBDDhjetAF1WbgqczRW+Iarrtm
	UH+xBD/pM99LHHt/ebxpV+kDFlZYQtzqaa8VWzJ1dEcgdsy+hQihGZZ9Igv4lvrU=
X-Received: by 2002:a67:fc48:0:b0:474:d24b:f5cc with SMTP id p8-20020a67fc48000000b00474d24bf5ccmr185182vsq.2.1710366442030;
        Wed, 13 Mar 2024 14:47:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExtUpFAsO3j//nWUMiYrfkHfIQvS7XHG2BBi3o5gYAsKI/7+sGpzOvwSA+TSYy8KtxKUURKw==
X-Received: by 2002:a67:fc48:0:b0:474:d24b:f5cc with SMTP id p8-20020a67fc48000000b00474d24bf5ccmr185164vsq.2.1710366441588;
        Wed, 13 Mar 2024 14:47:21 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id dv10-20020ad44eea000000b0069111c5cdd4sm60114qvb.100.2024.03.13.14.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 14:47:21 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 00/13] mm/treewide: Remove pXd_huge() API
Date: Wed, 13 Mar 2024 17:47:06 -0400
Message-ID: <20240313214719.253873-1-peterx@redhat.com>
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
Cc: Muchun Song <muchun.song@linux.dev>, Jason Gunthorpe <jgg@nvidia.com>, x86@kernel.org, peterx@redhat.com, Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@kernel.org>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

[based on akpm/mm-unstable latest commit 9af2e4c429b5]

v1:
- Rebase, remove RFC tag
- Fixed powerpc patch build issue, enhancing commit message [Michael]
- Optimize patch 1 & 3 on "none || !present" check [Jason]

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

The final patches 10-13 do the rest on the final removal, since *_leaf()
will be the ultimate API in the future, and we seem to have quite some
confusions on how *_huge() APIs can be defined, provide a rich comment for
*_leaf() API set to define them properly to avoid future misuse, and
hopefully that'll also help new archs to start support huge mappings and
avoid traps (like either swap entries, or PROT_NONE entry checks).

The whole series is only lightly tested on x86, while as usual I don't have
the capability to test all archs that it touches.

[1] https://lore.kernel.org/r/20240305043750.93762-1-peterx@redhat.com

Peter Xu (13):
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
  mm: Document pXd_leaf() API

 arch/arm/include/asm/pgtable-2level.h         |  4 +--
 arch/arm/include/asm/pgtable-3level-hwdef.h   |  1 +
 arch/arm/include/asm/pgtable-3level.h         |  6 ++--
 arch/arm/mm/Makefile                          |  1 -
 arch/arm/mm/hugetlbpage.c                     | 34 -------------------
 arch/arm64/include/asm/pgtable.h              |  6 +++-
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
 29 files changed, 68 insertions(+), 284 deletions(-)
 delete mode 100644 arch/arm/mm/hugetlbpage.c

-- 
2.44.0

