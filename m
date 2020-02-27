Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F831710CE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 07:00:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ShqN0zdDzDqtl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 17:00:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 48ShkM39RQzDqsN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 16:56:25 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FFDE30E;
 Wed, 26 Feb 2020 21:56:22 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.1.119])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D0CC53F73B;
 Wed, 26 Feb 2020 21:56:18 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Subject: [PATCH V2 0/3] mm/vma: some more minor changes
Date: Thu, 27 Feb 2020 11:26:02 +0530
Message-Id: <1582782965-3274-1-git-send-email-anshuman.khandual@arm.com>
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
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 vbabka@suse.cz
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The motivation here is to consolidate VMA flags and helpers in generic
memory header and reduce code duplication when ever applicable. If there
are other possible similar instances which might be missing here, please
do let me me know. I will be happy to incorporate them.

This series is based on v5.6-rc3. This series has been build tested on
multiple platforms but boot tested only on arm64 and x86.

Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: x86@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org

Changes in V2:

- Moved VM_NO_KHUGEPAGED after VM_SPECIAL with a comment per Vlastimil
- Renamed is_vma_temporary_stack() as vma_is_temporary_stack() per Vlastimil

Changes in V1: (https://patchwork.kernel.org/cover/11405177/)

Anshuman Khandual (3):
  mm/vma: Move VM_NO_KHUGEPAGED into generic header
  mm/vma: Make vma_is_foreign() available for general use
  mm/vma: Make is_vma_temporary_stack() available for general use

 arch/powerpc/mm/book3s64/pkeys.c   | 12 ------------
 arch/x86/include/asm/mmu_context.h | 15 ---------------
 include/linux/huge_mm.h            |  4 +---
 include/linux/mm.h                 | 29 ++++++++++++++++++++++++++++-
 mm/khugepaged.c                    |  4 +---
 mm/mremap.c                        |  2 +-
 mm/rmap.c                          | 16 +---------------
 7 files changed, 32 insertions(+), 50 deletions(-)

-- 
2.20.1

