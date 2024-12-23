Return-Path: <linuxppc-dev+bounces-4430-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED63E9FAC1B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 10:43:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGtPB2w3Xz2yjV;
	Mon, 23 Dec 2024 20:43:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734946990;
	cv=none; b=l4woBq1TBsGyHjEpJYkYf96VNSLyHzH7dHffcxAxT9p4hTxosh8JZMLsYT6LZmSVngJppCihUSf1gBaMt6UD0q4HjadW+k8/IeBkgV3pynWXEbZctd73J6TFjpRr0V31TiDWLmEvi1nqSNZkKfb9+AEGjslAQysci3Gp2cWo0sjJatNA42eCCFwq7+XA3u0YVEOHzJIp9mD06I8Gr+nYgZzAaNP0Wr8bdM13/97ygu9NsevPdPNA16cK3YQuqyqT48W0mTj9zRATFh4ONVu0oKy+DIsRGBQVKuc+k2OW4Ev8zssyfcGoiem20ODF7wj44zSdnbjIXRRFI24QHCQyZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734946990; c=relaxed/relaxed;
	bh=hW6jy85GFxw1rlbhA2IQSgcMmC6SEwxIAu1eEJQsQ+g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i8mPv02rEluDEngpWX3OhB18bNbOjd2Xm8h+E1kB9BfzGktzT5YdpIgZgjEkWO0UdpIRdk+3ijr/NeLcWYzBU7vxw2uJIs7+l/fjss0TjO2SNkPexEQPfoCf5uFZMUFr47bIzXN497Q4tUUBwsvkvgazKzVZRIhw/U2iHkT4U6K6lOhcr8z6X2LqPI/8BY6uxnFLdDswNu95wpXf5YOrY4L748fX01KR1H7wnTp+fEKWIsXI46xrRUv4Uz+dYX3d9qzKx/ACeVm9i1dnRcdJbnM7a9Jbdcq7lXlGwqyAwTKAIg2Bx5TFMw+xpnteUT5zhutZBc0VmSwzsi9NedO2bg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Ho8Yl9H8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Ho8Yl9H8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGtP82Tjqz2xbN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 20:43:07 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-728ea1573c0so3236462b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 01:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734946983; x=1735551783; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hW6jy85GFxw1rlbhA2IQSgcMmC6SEwxIAu1eEJQsQ+g=;
        b=Ho8Yl9H8WnyGA3MTfrCqchiLPlnmS/jiTrG8DdcrVxu2ztz/8ZWHXK6VeZ9H+rmjVv
         NqZvyVjvRUNtNNfxydSsQKmJNIIXp+uPsZNj251t5xxsWreDmZQdR9jIPcP75KaDrilv
         rEw27u6BokHKClu8Ya7ji9yQcBpjBLHTV39AvRsO0mZXkVXSCPr/I07OiW9p8EuMBe+i
         SPrsM6CJU9jGiGd8bjNQnygfhwquzSSatS1mpMyJVuquws+GPXTIzz/M+DA/QKPMb6vT
         Yd74sxDEWmL/mksfzsOwLr0cCjhSKY/XdpVuLMJYNKKUnyHyiE7wqHz/PASXkJsgSkkR
         MqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734946983; x=1735551783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hW6jy85GFxw1rlbhA2IQSgcMmC6SEwxIAu1eEJQsQ+g=;
        b=UOUFo4wR2qj90tKGPc4rMjDVoyPPvQaDvmdgUnr1Ip0ZbbvP1H6dN8VlVVf3lS8P8L
         swJ/S+1g+3MtJjovfB6Fjs8nAiC/cTkwxFGMzrfw6xh5T5os3npbCdd49OuV4WUX3qOI
         AdPnAu9MU4KyoQ79xi/4QWBBGCgQoSLmWWV6G9JB6b1hnfSkHQfYvrShxmjw8quZ6oRA
         egutPgWWSH4JspQX2QSyYWRsHtVD9n9RXttVNfv+QSsvcKW1JWgNelMv5hgZKC8tkAwE
         TIS6hYZGFyUK+Qb2CO6C4ofwUfzLR89iS7QMMnw4B7E8eUvqRS7xpCrUlmjiu7tWRaMX
         /eyA==
X-Forwarded-Encrypted: i=1; AJvYcCU2F79EjFhYdYvnYR7cV5LYEHZ60Af/I0OZj1AeLmtBaQF5Jk3OfsnP+nw5zEiZs74prCA4UngqQ7PBGUA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxbb6m+umhLXqxDrIvZbOeiC5GrM2X/VNHspScz+Q6xxFaCHr0D
	WezOgMl/y0DZIQtmAIsJImMGSTbZ6Y+2ek4c5PzpVGHo4xha1Cv37csi0lmGI0M=
X-Gm-Gg: ASbGncsSO62fPvk4f4KJ5SNKPsU6MrUwYEEsiEOR9lmIVZhb2DSyiaFNYZQa6bnLM6q
	PRUcPw9Z8Fh/XDf5ELQxeOY7vApk5d7oD5Yz2Hf8A38PZil73JsAn9MXvmaueIRP1alWNjZp1dL
	VDtt0RoiWq9kgUgUQK+6LwrVY5vXXFPwpMPZMMr+qWryfjxw54otruV2+DznD9nmaBWG2lmrjsJ
	g2HBYmWL6ynvjFLAwnnvhLurfEbAPV2f5cx9jbT45CJZLffcl1Ubo41f21nJsUA8Lw0L9FmIQM/
	wFTOyEuQmFxcf8t204QObg==
X-Google-Smtp-Source: AGHT+IFRta8/SfQvcBY4OAtIB9mripqs4z6X28qqGG6H0nQGOiKq9bgrNZS2epuvDdaQMCTGZ3ooIw==
X-Received: by 2002:a05:6a21:4986:b0:1e1:b1bb:87a0 with SMTP id adf61e73a8af0-1e606dfe60fmr3973055637.34.1734946982984;
        Mon, 23 Dec 2024 01:43:02 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:43:02 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
Subject: [PATCH v3 00/17] move pagetable_*_dtor() to __tlb_remove_table()
Date: Mon, 23 Dec 2024 17:40:46 +0800
Message-Id: <cover.1734945104.git.zhengqi.arch@bytedance.com>
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

Qi Zheng (15):
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
  mm: pgtable: remove tlb_remove_page_ptdesc()
  mm: pgtable: remove tlb_remove_ptdesc()
  mm: pgtable: introduce generic pagetable_dtor_free()

 Documentation/mm/split_page_table_lock.rst |  4 +-
 arch/arm/include/asm/tlb.h                 | 18 +-----
 arch/arm64/include/asm/pgalloc.h           | 18 ------
 arch/arm64/include/asm/tlb.h               | 31 ++++-----
 arch/csky/include/asm/pgalloc.h            |  4 +-
 arch/hexagon/include/asm/pgalloc.h         |  4 +-
 arch/loongarch/include/asm/pgalloc.h       |  4 +-
 arch/m68k/include/asm/mcf_pgalloc.h        |  4 +-
 arch/m68k/include/asm/sun3_pgalloc.h       |  4 +-
 arch/m68k/mm/motorola.c                    |  2 +-
 arch/mips/include/asm/pgalloc.h            |  4 +-
 arch/nios2/include/asm/pgalloc.h           |  4 +-
 arch/openrisc/include/asm/pgalloc.h        |  4 +-
 arch/powerpc/include/asm/tlb.h             |  1 +
 arch/powerpc/mm/book3s64/mmu_context.c     |  2 +-
 arch/powerpc/mm/book3s64/pgtable.c         |  2 +-
 arch/powerpc/mm/pgtable-frag.c             |  4 +-
 arch/riscv/include/asm/pgalloc.h           | 75 ++++++----------------
 arch/riscv/include/asm/tlb.h               | 18 ------
 arch/riscv/mm/init.c                       |  4 +-
 arch/s390/include/asm/pgalloc.h            | 31 ++++++---
 arch/s390/include/asm/tlb.h                | 43 ++++++-------
 arch/s390/mm/pgalloc.c                     | 31 ++-------
 arch/sh/include/asm/pgalloc.h              |  4 +-
 arch/sparc/include/asm/tlb_32.h            |  1 +
 arch/sparc/include/asm/tlb_64.h            |  1 +
 arch/sparc/mm/init_64.c                    |  2 +-
 arch/sparc/mm/srmmu.c                      |  2 +-
 arch/um/include/asm/pgalloc.h              | 12 ++--
 arch/x86/include/asm/pgalloc.h             | 18 ------
 arch/x86/include/asm/tlb.h                 | 33 ----------
 arch/x86/kernel/paravirt.c                 |  1 +
 arch/x86/mm/pgtable.c                      | 13 ++--
 include/asm-generic/pgalloc.h              | 60 +++++++++++++----
 include/asm-generic/tlb.h                  | 23 +++----
 include/linux/mm.h                         | 52 ++++++---------
 include/linux/mm_types.h                   |  9 +--
 mm/memory.c                                | 23 ++-----
 mm/mmu_gather.c                            | 19 +++++-
 39 files changed, 228 insertions(+), 361 deletions(-)

-- 
2.20.1


