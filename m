Return-Path: <linuxppc-dev+bounces-4518-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2D09FE416
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2024 10:08:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YM9JH6KY7z2ykf;
	Mon, 30 Dec 2024 20:08:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735549727;
	cv=none; b=GfLzJjWaaB3tlfRD3tLJji+3/t2BR+jVe3iwbBZdBsreIqMXR9VPqBS+VAdn20X8V/S8n+m78ImONfmXpvAB2nxxTzDBUe58dfgeQrcxqxMcZLig0nAzbswdIHkpVb9fpJ14twv/e+yhsdejw1JK1WVEcU4wadiDmfRSCXmAxcArUVMdZCmmu5PdvZ4sbwHCZBYeMwuS1DFMxOEia7N7St7ze0RHi70wLYLts0WXsm56osOIXziFtfz/K9yo8/LsM/EvjZDEvPzOxBKoPpinwTVpp2x81Ruru1uZms3awpYz1Kdp5S1PHPr9uUEdyCkuXE1fNQZPFpHau9T4qpU62A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735549727; c=relaxed/relaxed;
	bh=KCS148NFM6neePcbo7P2q7bn6Gnf3WOST+giN1oaVZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C1eXfz3fkjxzBIUX+xHN6Vo8CCF4LBh7ttvVeFs6qjFdjqtWM92RNk+yg9jc2TOQQ4QwbWDvg/FDH/DPc2dwTeDIabnZ71cMaRUSI7oTUkN2c/2PgzIzQDphAh0s7Tye0oXyyFd1+m+mdIgQOH66IYLrKohtekD/xoqGWnd89Z1xYDrb6dlgm6dcH36zghj0DYehcTl5WyHTDyM1dBmRLYLtPnKL/mEGn++/5juPEMObm056vRvCbb5KMmtd8ESoyJEZvUqO7bxX594kUboNSpcKexgl3m8mGVVqIUX0MIJN3yNsjmn1yz3r79fO8F9mIfW0+QOztXFECDAfR6sZpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=T9QDEe8h; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=T9QDEe8h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YM9JG1SPVz2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 20:08:43 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21a1e6fd923so58834435ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 01:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549720; x=1736154520; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KCS148NFM6neePcbo7P2q7bn6Gnf3WOST+giN1oaVZ4=;
        b=T9QDEe8hadXMx3XdG/ecIqFg9IkNGPKoqvPzbBT4yCRd/1zF7MVXz5LP/FqFH8Gorx
         wingK2X3J+AD/6yBF8XfJZJD1cUXP7hzNc21GPGMUCWBqicvSRQGPY5TGncLjobQHhF2
         1k7gg91w2sX8tnG58D5KpwqbD5hxPdKX4SK4CwzGVEZRiC4OB4/EGms+/Owd42X/vVAS
         M59UBWhpDuCmkxPR41vI6RxLEKAjvuBHf9JW/vlIUGqD5qbHFHhpbiDh/hrnAOPXSnnL
         ZzISSa/ZmRksVc2GcYH69QGiGjujnOZPDsINt4m+ONxUi4YWWkqvrDi8XbkM3tJwlkCc
         FpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549720; x=1736154520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCS148NFM6neePcbo7P2q7bn6Gnf3WOST+giN1oaVZ4=;
        b=XFupG6aWqN16k/9def33B1EYQXEfplJR4oA/P1BGcMXTU3uQ2o0Ak481dUpmdz+H/2
         wQYWlDuUmbl/Fjldrs7mKxXfbstJuixhepTONaQC9CHUmeCmF4TDzevH7huEzPPIzVry
         cktPRANwvWUNFB8wvtd0PTsaOfTOoCh2LCkq/DCAUk0Icu0pWUbpBWbF8F92AWniFQ6S
         nKo2Ik6t2YRCfggMpYrgsfzEmC/JZajQlUDatNluL0tW30ZPf2/uv0jI6PqG5UxiAYUT
         dZH0EQbKJdbeabhsB8oIccy3NUUXsIWhPr/+X/Vs+3eQ8sM45ExvMdYiDyWMIJfqu436
         29Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVgDrO6kJS9YJqQWOmtcomY+xsKIpXS+EqqBApCytMLONXEHf7PXyU5PzrcJYWz1XzN5SMelZPDm/L81ug=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyA2t77knCYOoS7ACoPXCRG0zIV4COh/LqKq5v9wHeOuCxtz/jG
	Nu7eUuxi0c/pyQy7OqOUMnNntXrBUbpmu0JTw7B0YxRtfDNpu6Rp3Q4sSKUi7Wc=
X-Gm-Gg: ASbGnctZGocSKBjE5JuJ9gF56g/tyYoLdK37KoYveixntMHEd84AMz6JrrYTvfASNpy
	PbXwx+XhsVqTfaote5uvMglT/Myqe3Ji46O4pExvNV6wljp/kmOv5oFl0TXGKTNCQE+ixlH/g9f
	dqdNLzLxynf6r+HFX4zvXx3qHx1zTcrkUUL78Z+y7GA+2RKWwowLlASXDnUc2d1nUGsu8YHXmlx
	9dTc5L0zoAjEjM1gcI26stBdVnjrxi6M8RqR18soqcljWo8shtB4DcGFKiRc4zFQPvaRnMcq7sx
	LFk9bJ90gLd2Po1VgdHIRg==
X-Google-Smtp-Source: AGHT+IHgLmMaWHwHgL0oRHIhYJ2vWpvY6ebuDt6AqrGAyIjEWzK95W7/7i/VdRxGUDUWQcC+IVrQ/g==
X-Received: by 2002:a05:6a00:e06:b0:725:9dc7:4f8b with SMTP id d2e1a72fcca58-72abde30cc7mr45836853b3a.15.1735549719834;
        Mon, 30 Dec 2024 01:08:39 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:08:39 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v4 00/15] move pagetable_*_dtor() to __tlb_remove_table()
Date: Mon, 30 Dec 2024 17:07:35 +0800
Message-Id: <cover.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Changes in v4:
 - remove [PATCH v3 15/17] and [PATCH v3 16/17] (Mike Rapoport)
   (the tlb_remove_page_ptdesc() and tlb_remove_ptdesc() are intermediate
    products of the project: https://kernelnewbies.org/MatthewWilcox/Memdescs,
    so keep them)
 - collect Acked-by

Changes in v3:
 - take patch #5 and #6 from Kevin Brodsky's patch series below.
   Link: https://lore.kernel.org/lkml/20241219164425.2277022-1-kevin.brodsky@arm.com/
 - separate the statistics part from [PATCH v2 02/15] as [PATCH v3 04/17], and
   replace the rest part with Kevin Brodsky's patch #6
   (Alexander Gordeev and Kevin Brodsky)
 - change the commit message of [PATCH v2 10/15] and [PATCH v2 11/15]
   (Alexander Gordeev)
 - fix the bug introduced by [PATCH v2 11/15]
   (Peter Zijlstra)
 - rebase onto the next-20241220

Changes in v2:
 - add [PATCH v2 13|14|15/15] (suggested by Peter Zijlstra)
 - add Originally-bys and Suggested-bys
 - rebase onto the next-20241218

Hi all,

As proposed [1] by Peter Zijlstra below, this patch series aims to move
pagetable_*_dtor() into __tlb_remove_table(). This will cleanup pagetable_*_dtor()
a bit and more gracefully fix the UAF issue [2] reported by syzbot.

```
Notably:

 - s390 pud isn't calling the existing pagetable_pud_[cd]tor()
 - none of the p4d things have pagetable_p4d_[cd]tor() (x86,arm64,s390,riscv)
   and they have inconsistent accounting
 - while much of the _ctor calls are in generic code, many of the _dtor
   calls are in arch code for hysterial raisins, this could easily be
   fixed
 - if we fix ptlock_free() to handle NULL, then all the _dtor()
   functions can use it, and we can observe they're all identical
   and can be folded

after all that cleanup, you can move the _dtor from *_free_tlb() into
tlb_remove_table() -- which for the above case, would then have it
called from __tlb_remove_table_free().
```

And hi Andrew, I developed the code based on the latest linux-next, so I reverted
the "mm: pgtable: make ptlock be freed by RCU" first. Once the review of this
patch series is completed, the "mm: pgtable: make ptlock be freed by RCU" can be
dropped directly from mm tree, and this revert patch will not be needed.

This series is based on next-20241220. And I tested this patch series on x86 and
only cross-compiled it on arm, arm64, powerpc, riscv, s390 and sparc.

Comments and suggestions are welcome!

Thanks,
Qi

[1]. https://lore.kernel.org/all/20241211133433.GC12500@noisy.programming.kicks-ass.net/
[2]. https://lore.kernel.org/all/67548279.050a0220.a30f1.015b.GAE@google.com/

Kevin Brodsky (2):
  riscv: mm: Skip pgtable level check in {pud,p4d}_alloc_one
  asm-generic: pgalloc: Provide generic p4d_{alloc_one,free}

Qi Zheng (13):
  Revert "mm: pgtable: make ptlock be freed by RCU"
  mm: pgtable: add statistics for P4D level page table
  arm64: pgtable: use mmu gather to free p4d level page table
  s390: pgtable: add statistics for PUD and P4D level page table
  mm: pgtable: introduce pagetable_dtor()
  arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
  arm64: pgtable: move pagetable_dtor() to __tlb_remove_table()
  riscv: pgtable: move pagetable_dtor() to __tlb_remove_table()
  x86: pgtable: move pagetable_dtor() to __tlb_remove_table()
  s390: pgtable: also move pagetable_dtor() of PxD to
    __tlb_remove_table()
  mm: pgtable: introduce generic __tlb_remove_table()
  mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
  mm: pgtable: introduce generic pagetable_dtor_free()

 Documentation/mm/split_page_table_lock.rst |  4 +-
 arch/arm/include/asm/tlb.h                 | 10 ----
 arch/arm64/include/asm/pgalloc.h           | 18 ------
 arch/arm64/include/asm/tlb.h               | 21 ++++---
 arch/csky/include/asm/pgalloc.h            |  2 +-
 arch/hexagon/include/asm/pgalloc.h         |  2 +-
 arch/loongarch/include/asm/pgalloc.h       |  2 +-
 arch/m68k/include/asm/mcf_pgalloc.h        |  4 +-
 arch/m68k/include/asm/sun3_pgalloc.h       |  2 +-
 arch/m68k/mm/motorola.c                    |  2 +-
 arch/mips/include/asm/pgalloc.h            |  2 +-
 arch/nios2/include/asm/pgalloc.h           |  2 +-
 arch/openrisc/include/asm/pgalloc.h        |  2 +-
 arch/powerpc/include/asm/tlb.h             |  1 +
 arch/powerpc/mm/book3s64/mmu_context.c     |  2 +-
 arch/powerpc/mm/book3s64/pgtable.c         |  2 +-
 arch/powerpc/mm/pgtable-frag.c             |  4 +-
 arch/riscv/include/asm/pgalloc.h           | 69 +++++-----------------
 arch/riscv/include/asm/tlb.h               | 18 ------
 arch/riscv/mm/init.c                       |  4 +-
 arch/s390/include/asm/pgalloc.h            | 31 +++++++---
 arch/s390/include/asm/tlb.h                | 43 +++++++-------
 arch/s390/mm/pgalloc.c                     | 23 +-------
 arch/sh/include/asm/pgalloc.h              |  2 +-
 arch/sparc/include/asm/tlb_32.h            |  1 +
 arch/sparc/include/asm/tlb_64.h            |  1 +
 arch/sparc/mm/init_64.c                    |  2 +-
 arch/sparc/mm/srmmu.c                      |  2 +-
 arch/um/include/asm/pgalloc.h              |  6 +-
 arch/x86/include/asm/pgalloc.h             | 18 ------
 arch/x86/include/asm/tlb.h                 | 33 -----------
 arch/x86/kernel/paravirt.c                 |  1 +
 arch/x86/mm/pgtable.c                      | 13 ++--
 include/asm-generic/pgalloc.h              | 55 +++++++++++++++--
 include/asm-generic/tlb.h                  | 14 ++++-
 include/linux/mm.h                         | 50 ++++++----------
 include/linux/mm_types.h                   |  9 +--
 mm/memory.c                                | 23 +++-----
 mm/mmu_gather.c                            | 20 ++++++-
 39 files changed, 211 insertions(+), 309 deletions(-)

-- 
2.20.1


