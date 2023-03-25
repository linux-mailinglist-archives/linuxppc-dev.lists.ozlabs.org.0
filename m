Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8DB6C8B96
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 07:12:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pk7yk2HxPz3cL0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 17:12:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rirI1LE3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rirI1LE3;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pk7vB6v0kz3fT5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 17:09:10 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 54EA260A08;
	Sat, 25 Mar 2023 06:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870B1C433D2;
	Sat, 25 Mar 2023 06:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679724547;
	bh=qNh6nhkYIBdXaRuLL5GYGOpZBsiUYM9+UhineGTjJPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rirI1LE3IL192S0yKzg6Y9hCPNuKuJBa8/FnRMwHG+5iLbDwTy50fX949R6Y63xTF
	 UXgqPugUFhJmfiXPsf80n0rIx2hpYxXgF013LBy9/cuaPPknS52iQCHlE9I/eNqysy
	 YA5VqoQdNZbXputm2MtEunhOqdux1Kh0R1JI/PpfdvIMBpHcnD+7de9og02ue3WXm9
	 0M/AXHZ0+Vav4cfU8cZirL/pvPdBPSCqFqtvhnml0w4rkC9tX34dsfUjcp9G6nULZG
	 oBPlI/jXvQ4LSznp1Wy4B+lgG4MPAphGjzPzbxy93VbPRvoljM+BMe3yd5jHEvzR4E
	 ThQp2TwEZDftA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 03/14] arm64: reword ARCH_FORCE_MAX_ORDER prompt and help text
Date: Sat, 25 Mar 2023 09:08:17 +0300
Message-Id: <20230325060828.2662773-4-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230325060828.2662773-1-rppt@kernel.org>
References: <20230325060828.2662773-1-rppt@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Zi Yan <ziy@nvidia.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

The prompt and help text of ARCH_FORCE_MAX_ORDER are not even close to
describe this configuration option.

Update both to actually describe what this option does.

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/arm64/Kconfig | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7324032af859..cc11cdcf5a00 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1487,24 +1487,24 @@ config XEN
 # 16K |       27          |      14      |       13        |         11         |
 # 64K |       29          |      16      |       13        |         13         |
 config ARCH_FORCE_MAX_ORDER
-	int "Maximum zone order" if EXPERT && (ARM64_4K_PAGES || ARM64_16K_PAGES)
+	int "Order of maximal physically contiguous allocations" if EXPERT && (ARM64_4K_PAGES || ARM64_16K_PAGES)
 	default "13" if ARM64_64K_PAGES
 	default "11" if ARM64_16K_PAGES
 	default "10"
 	help
-	  The kernel memory allocator divides physically contiguous memory
-	  blocks into "zones", where each zone is a power of two number of
-	  pages.  This option selects the largest power of two that the kernel
-	  keeps in the memory allocator.  If you need to allocate very large
-	  blocks of physically contiguous memory, then you may need to
-	  increase this value.
+	  The kernel page allocator limits the size of maximal physically
+	  contiguous allocations. The limit is called MAX_ORDER and it
+	  defines the maximal power of two of number of pages that can be
+	  allocated as a single contiguous block. This option allows
+	  overriding the default setting when ability to allocate very
+	  large blocks of physically contiguous memory is required.
 
-	  We make sure that we can allocate up to a HugePage size for each configuration.
-	  Hence we have :
-		MAX_ORDER = PMD_SHIFT - PAGE_SHIFT  => PAGE_SHIFT - 3
+	  The maximal size of allocation cannot exceed the size of the
+	  section, so the value of MAX_ORDER should satisfy
 
-	  However for 4K, we choose a higher default value, 10 as opposed to 9, giving us
-	  4M allocations matching the default size used by generic code.
+	    MAX_ORDER + PAGE_SHIFT <= SECTION_SIZE_BITS
+
+	  Don't change if unsure.
 
 config UNMAP_KERNEL_AT_EL0
 	bool "Unmap kernel when running in userspace (aka \"KAISER\")" if EXPERT
-- 
2.35.1

