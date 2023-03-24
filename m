Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F00DE6C776C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 06:35:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjWBN6B92z3fX0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 16:35:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OaMe0O8Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OaMe0O8Y;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjVy66xBnz3fRV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 16:24:30 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A553DB822EC;
	Fri, 24 Mar 2023 05:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE6FC433EF;
	Fri, 24 Mar 2023 05:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679635466;
	bh=1zRPyaaLaKChlaF3HiLNG8L4a1+H9YMBeM142XTaxBY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OaMe0O8Y/VqFyvv8P3AJ1JWfaNX6fUglLOJcj3uiMUNqxbjm8gr3zQzueLpQbru3k
	 epbhwOHrXR1omZCGUJ46MWgrzi5JVVVUMbEvFwbZBHTNJoP1R3O3Rt357nnca+/Y50
	 MazCC6m/TE6Wk5itsz2kNTymFFE6Ee7czzfdznGtRIDbRXKkKdT8k8Q69UUznV4zMY
	 kNNQO5IhLe22jyNOezzwMTCICskwDUKeXENIxmLxZ4yPWLQaCW5OKBlzmo+od0rKRh
	 WosyWZZ35ErgkBKSd9iQE6LbvHpmmzi5D05v0zIQAi4gdnhM3ArvsglzNbBv6+vb9z
	 9Y8re2b10Yv7w==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 13/14] sparc: reword ARCH_FORCE_MAX_ORDER prompt and help text
Date: Fri, 24 Mar 2023 08:22:32 +0300
Message-Id: <20230324052233.2654090-14-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230324052233.2654090-1-rppt@kernel.org>
References: <20230324052233.2654090-1-rppt@kernel.org>
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

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/sparc/Kconfig | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index e3242bf5a8df..959e43a1aaca 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -270,15 +270,17 @@ config ARCH_SPARSEMEM_DEFAULT
 	def_bool y if SPARC64
 
 config ARCH_FORCE_MAX_ORDER
-	int "Maximum zone order"
+	int "Order of maximal physically contiguous allocations"
 	default "12"
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
+
+	  Don't change if unsure.
 
 if SPARC64 || COMPILE_TEST
 source "kernel/power/Kconfig"
-- 
2.35.1

