Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEFB2456FE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Aug 2020 11:12:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BTrzB24TPzDqTL
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Aug 2020 19:12:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WLvoIRIz; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BTrw02KYBzDqNT
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Aug 2020 19:09:19 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id o5so6612317pgb.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Aug 2020 02:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nrJg5dHzARiyIgQKcQeBmx5MsP72TzRX4UN4jKQ0FKU=;
 b=WLvoIRIzkAfofpEParlRFy972z69/RbpgtcgqW5BIqiYhP/rvrHlxmqvSHGCq6cXxh
 KWCKFOBQJNHewsjEkigYGaGoIeRmGo36LpOp6988mQpaJulfeI8Kn7aWXEALzOk2YgNe
 YzrnK6UeGwiFiMy7u81dbGKyMq3cgKctsyCaY1QzU1VztYbPgmoJwOz6mYd2rCkNdExZ
 C3kQKTj/iP7gJoam9/wSfc31fblhQsD+6XCPRM7fzCiEHYeEN6WkS3e2P1o7Gagyteey
 61w+j3zr6jrdEKg29APNHXKmxMAIX0OP6IM5cVYB5usU2he5EXr8z3W2k7V4CFuRAOtM
 Fz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nrJg5dHzARiyIgQKcQeBmx5MsP72TzRX4UN4jKQ0FKU=;
 b=d30QBs0xG8Rg7kBsaAATPsQEfzuNCTiVQvfSTbDRdzGjtvrJREGUdvQsAcg2WEoA6z
 Djx0b0q4Wkvfz/zDBTRO/K7ClaDmM8FsPzlYkyC+QHIq1NSOvaDEhE8OVY7eGr5hmddG
 Tii0aOdNDyFbXxX8PAhwkr30+X4LLnneOlU9HWfXcFm38rp5X+lixP0a7eaiaeOdSsET
 aycS/cb9cRu66Eg9X2wfmy+FdBP+mJ1s0fxBQdaPEtWwg4NdmOjoXwwZsw2wJ8pzAYmL
 eANqGh7IMESy8Pbq3yWASWM7C7gtBpxik5qbHwaiqOYJJlPD/ybTiDbAYIpEfIsfrfp2
 lBtQ==
X-Gm-Message-State: AOAM533wG+OK7+xOPInyY/A7sr2Q6viR83iajPuFHBP4EMFPTRcslMGc
 wX4JOaTjHKze6OHLZXeZemk=
X-Google-Smtp-Source: ABdhPJyzIFpwRi/Ye1hyQXChNaeuAzQ4Swk/DOVybSf+u7iXsUyYbQPKNoluotDUjitLamCitTCoeQ==
X-Received: by 2002:a63:cc49:: with SMTP id q9mr6397442pgi.390.1597568956323; 
 Sun, 16 Aug 2020 02:09:16 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-193-175.tpgi.com.au.
 [193.116.193.175])
 by smtp.gmail.com with ESMTPSA id o19sm12768369pjs.8.2020.08.16.02.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2020 02:09:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org
Subject: [PATCH v4 0/8] huge vmalloc mappings
Date: Sun, 16 Aug 2020 19:08:56 +1000
Message-Id: <20200816090904.83947-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: linux-arch@vger.kernel.org, Zefan Li <lizefan@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's try again.

Thanks,
Nick

Since v3:
- Fixed an off-by-one bug in a loop
- Fix !CONFIG_HAVE_ARCH_HUGE_VMAP build fail
- Hopefully this time fix the arm64 vmap stack bug, thanks Jonathan
  Cameron for debugging the cause of this (hopefully).

Since v2:
- Rebased on vmalloc cleanups, split series into simpler pieces.
- Fixed several compile errors and warnings
- Keep the page array and accounting in small page units because
  struct vm_struct is an interface (this should fix x86 vmap stack debug
  assert). [Thanks Zefan]

Nicholas Piggin (8):
  mm/vmalloc: fix vmalloc_to_page for huge vmap mappings
  mm: apply_to_pte_range warn and fail if a large pte is encountered
  mm/vmalloc: rename vmap_*_range vmap_pages_*_range
  lib/ioremap: rename ioremap_*_range to vmap_*_range
  mm: HUGE_VMAP arch support cleanup
  mm: Move vmap_range from lib/ioremap.c to mm/vmalloc.c
  mm/vmalloc: add vmap_range_noflush variant
  mm/vmalloc: Hugepage vmalloc mappings

 .../admin-guide/kernel-parameters.txt         |   2 +
 arch/arm64/mm/mmu.c                           |  12 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  10 +-
 arch/x86/mm/ioremap.c                         |  12 +-
 include/linux/io.h                            |   9 -
 include/linux/vmalloc.h                       |  13 +
 init/main.c                                   |   1 -
 mm/ioremap.c                                  | 231 +--------
 mm/memory.c                                   |  60 ++-
 mm/vmalloc.c                                  | 445 +++++++++++++++---
 10 files changed, 461 insertions(+), 334 deletions(-)

-- 
2.23.0

