Return-Path: <linuxppc-dev+bounces-6143-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F40BCA336A6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2025 05:10:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YthY51nSwz301B;
	Thu, 13 Feb 2025 15:10:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739419817;
	cv=none; b=ggb2Md4ZX4Ny4HwG57N9vncsqVAuT+O+oYi0y06nHBK9H+3OA1FzxjBorzIoKd9h2Yqp/cEyAHwQF0NNU1g3DTjKkQSqfue8Fv6sH/d0gL1UsnOAswf2JiTg5n42N04YSKrHxEvDfKSgp02JnPwBA3OOcElI2ufjqjSVFqDjxsNEw8Sae+Z7buPWRPzVz63035QuLEEizspY7j/ZtVBFgMnkiXFBsbdlNNZs1j+2Qzt225Bpse5hg5OYRQ0uTGkcCMnMvGhPqZV0RM8QgPVnnD0+zmZ7ZF57gdhJT2Z+NE1hOSm2nvcjwblh1ce/IwE5ZTXlyuPC+Bc5+SkmTrLmbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739419817; c=relaxed/relaxed;
	bh=JkebGBUX3YbsxixjF57mQR6LUUPlhWtIE+eGC/K5U2c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OwvqFI2etxoatCZvZXu1oCarvTINegsmO87B5fFr7VjFrVuxYlb6qLrfM14UiD1/D9kDNGP8AkCajfe8z++SkBetzcDrl7LpKYfz4qmVPe0/tArH72k/Ja6qR+PuZZY80QR50X4HX3rcizarVb0U2aNsF1NMROfu6No+ZjAIbF6UuNeEjL5Px+VDREmSqr9ccZN+snMWfFkAVe7c5QT0AIYHtrHsLJqqskN6wq9o6S57ej6eRxl2EYYMlt+G9KJAdtpON1JO6jABDm36aFs7FRL4FnbPgDd6C3eHmJbiD29RJHL5tK20YLZX1KScvEB8IHWisawDYr49JYQsdndr9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YthY41kzqz2xmk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 15:10:14 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8488D1756;
	Wed, 12 Feb 2025 20:10:03 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.16.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E87813F58B;
	Wed, 12 Feb 2025 20:09:38 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: steven.price@arm.com,
	christophe.leroy@csgroup.eu,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: [PATCH 0/4] mm: Rework generic PTDUMP configs
Date: Thu, 13 Feb 2025 09:39:30 +0530
Message-Id: <20250213040934.3245750-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
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
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The series reworks generic PTDUMP configs before eventually renaming them
after some basic clean ups first. This is derived after splitting changes
from the following patch.

https://lore.kernel.org/all/20250205050039.1506377-1-anshuman.khandual@arm.com/

This series applies on v6.14-rc2 and has been tested on arm64. Although it
also builds on other platforms as well.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org

Anshuman Khandual (4):
  configs: Drop GENERIC_PTDUMP from debug.config
  mm: Make DEBUG_WX depdendent on GENERIC_PTDUMP
  mm: Make GENERIC_PTDUMP dependent on MMU
  mm: Rename GENERIC_PTDUMP and PTDUMP_CORE

 Documentation/arch/arm64/ptdump.rst       |  4 ++--
 arch/arm64/Kconfig                        |  2 +-
 arch/arm64/include/asm/ptdump.h           |  4 ++--
 arch/arm64/kvm/Kconfig                    |  4 ++--
 arch/arm64/mm/Makefile                    |  2 +-
 arch/powerpc/Kconfig                      |  2 +-
 arch/powerpc/configs/mpc885_ads_defconfig |  2 +-
 arch/powerpc/mm/Makefile                  |  2 +-
 arch/riscv/Kconfig                        |  2 +-
 arch/riscv/mm/Makefile                    |  2 +-
 arch/s390/Kconfig                         |  2 +-
 arch/s390/mm/Makefile                     |  2 +-
 arch/x86/Kconfig                          |  2 +-
 arch/x86/Kconfig.debug                    |  2 +-
 arch/x86/mm/Makefile                      |  2 +-
 kernel/configs/debug.config               |  1 -
 mm/Kconfig.debug                          | 12 +++++++-----
 mm/Makefile                               |  2 +-
 18 files changed, 26 insertions(+), 25 deletions(-)

-- 
2.25.1


