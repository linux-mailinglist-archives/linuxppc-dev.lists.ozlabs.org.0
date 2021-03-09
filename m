Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA54833209A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 09:33:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvpPh5FlTz3cTX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 19:33:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DvpPM5rlTz2xb1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 19:32:53 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32FEED6E;
 Tue,  9 Mar 2021 00:32:49 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.66.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BCE853F71B;
 Tue,  9 Mar 2021 00:32:44 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Subject: [PATCH 0/6] mm: some config cleanups
Date: Tue,  9 Mar 2021 14:03:04 +0530
Message-Id: <1615278790-18053-1-git-send-email-anshuman.khandual@arm.com>
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
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-sh@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series contains config cleanup patches which reduces code duplication
across platforms and also improves maintainability. There is no functional
change intended with this series. This has been boot tested on arm64 but
only build tested on some other platforms.

This applies on 5.12-rc2

Cc: x86@kernel.org
Cc: linux-ia64@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-sh@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org

Anshuman Khandual (6):
  mm: Generalize ARCH_HAS_CACHE_LINE_SIZE
  mm: Generalize SYS_SUPPORTS_HUGETLBFS (rename as ARCH_SUPPORTS_HUGETLBFS)
  mm: Generalize ARCH_ENABLE_MEMORY_[HOTPLUG|HOTREMOVE]
  mm: Drop redundant ARCH_ENABLE_[HUGEPAGE|THP]_MIGRATION
  mm: Drop redundant ARCH_ENABLE_SPLIT_PMD_PTLOCK
  mm: Drop redundant HAVE_ARCH_TRANSPARENT_HUGEPAGE

 arch/arc/Kconfig                       |  9 ++------
 arch/arm/Kconfig                       | 10 ++-------
 arch/arm64/Kconfig                     | 30 ++++++--------------------
 arch/ia64/Kconfig                      |  8 ++-----
 arch/mips/Kconfig                      |  6 +-----
 arch/parisc/Kconfig                    |  5 +----
 arch/powerpc/Kconfig                   | 11 ++--------
 arch/powerpc/platforms/Kconfig.cputype | 16 +++++---------
 arch/riscv/Kconfig                     |  5 +----
 arch/s390/Kconfig                      | 12 +++--------
 arch/sh/Kconfig                        |  7 +++---
 arch/sh/mm/Kconfig                     |  8 -------
 arch/x86/Kconfig                       | 29 ++++++-------------------
 fs/Kconfig                             |  5 ++++-
 mm/Kconfig                             |  9 ++++++++
 15 files changed, 48 insertions(+), 122 deletions(-)

-- 
2.20.1

