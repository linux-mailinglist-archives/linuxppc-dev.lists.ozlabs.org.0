Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B11861609C9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 06:06:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LX5D4YMlzDqg4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 16:06:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 48LX2n1QDrzDqJP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2020 16:04:14 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 904FD1FB;
 Sun, 16 Feb 2020 21:04:11 -0800 (PST)
Received: from p8cg001049571a15.blr.arm.com (p8cg001049571a15.blr.arm.com
 [10.162.16.95])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B81EC3F703;
 Sun, 16 Feb 2020 21:04:08 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] mm/vma: Use available wrappers when possible
Date: Mon, 17 Feb 2020 10:33:48 +0530
Message-Id: <1581915833-21984-1-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
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
Cc: linux-arch@vger.kernel.org, linux-sh@vger.kernel.org,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mips@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Apart from adding a VMA flag readable name for trace purpose, this series
does some open encoding replacements with availabe VMA specific wrappers.
This skips VM_HUGETLB check in vma_migratable() as its already being done
with another patch (https://patchwork.kernel.org/patch/11347831/) which
is yet to be merged.

This series applies on 5.6-rc2. This has been build tested on multiple
platforms, though boot and runtime testing was limited to arm64 and x86.

Cc: linux-kernel@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-sh@vger.kernel.org
Cc: kvm-ppc@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-arch@vger.kernel.org
Cc: linux-mm@kvack.org

Anshuman Khandual (5):
  mm/vma: Add missing VMA flag readable name for VM_SYNC
  mm/vma: Make vma_is_accessible() available for general use
  mm/vma: Replace all remaining open encodings with is_vm_hugetlb_page()
  mm/vma: Replace all remaining open encodings with vma_set_anonymous()
  mm/vma: Replace all remaining open encodings with vma_is_anonymous()

 arch/csky/mm/fault.c              | 2 +-
 arch/m68k/mm/fault.c              | 2 +-
 arch/mips/mm/fault.c              | 2 +-
 arch/powerpc/kvm/e500_mmu_host.c  | 2 +-
 arch/powerpc/mm/fault.c           | 2 +-
 arch/sh/mm/fault.c                | 2 +-
 arch/x86/mm/fault.c               | 2 +-
 drivers/misc/mic/scif/scif_mmap.c | 2 +-
 fs/binfmt_elf.c                   | 2 +-
 include/asm-generic/tlb.h         | 2 +-
 include/linux/mm.h                | 5 +++++
 include/trace/events/mmflags.h    | 1 +
 kernel/events/core.c              | 3 ++-
 kernel/sched/fair.c               | 2 +-
 mm/gup.c                          | 5 +++--
 mm/memory.c                       | 5 -----
 mm/mempolicy.c                    | 3 +--
 17 files changed, 23 insertions(+), 21 deletions(-)

-- 
2.20.1

