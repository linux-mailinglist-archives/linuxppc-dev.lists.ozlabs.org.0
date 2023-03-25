Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB45D6C8BA1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 07:18:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pk85q581hz3fqg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 17:18:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dlZIqcoy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dlZIqcoy;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pk7w76Bxyz3fS9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 17:09:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 30E7260A4E;
	Sat, 25 Mar 2023 06:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2DCC433AC;
	Sat, 25 Mar 2023 06:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679724597;
	bh=o3v/f0seGdAieP7M24caD3rUrneRSNKMDfhKZvhr+c4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dlZIqcoyznkL1BKobFMvbQv37dL3Y5n/pYQmixa6V5wHpLEZoZh7mKIP/w+WaDln3
	 7F9U/KGc4cypsnTvMy9oSSfrgGALo8ZRsy0CCO2wxsn95KZUH66WMSYPrH+A1vRo8P
	 m5DIfRaoJFsfaXsZDqqnvVk3vN8n6JycwxsVP5EnCJ1i3wogM96inqe6yhZ2OVDVv9
	 F03Fni6dt1PZR+WBmmBLf0bzz/xS7McoVuWqshVPeq2wPkPrNFx8Ge1eAY26HJlYt7
	 OejyqoLf5fINt0J1L8kMmt6aLbRSB4HCcXQtM1HnqsNGL1FZ8n1jBcAfRC50m+1miH
	 orub55FmXGAyA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 10/14] powerpc: drop ranges for definition of ARCH_FORCE_MAX_ORDER
Date: Sat, 25 Mar 2023 09:08:24 +0300
Message-Id: <20230325060828.2662773-11-rppt@kernel.org>
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

PowerPC defines ranges for ARCH_FORCE_MAX_ORDER some of which are
insanely allowing MAX_ORDER up to 63, which implies maximal contiguous
allocation size of 2^63 pages.

Drop bogus definitions of ranges for ARCH_FORCE_MAX_ORDER and leave it a
simple integer with sensible defaults.

Users that *really* need to change the value of ARCH_FORCE_MAX_ORDER
will be able to do so but they won't be mislead by the bogus ranges.

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/powerpc/Kconfig | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c0095bf795ca..419be4a71004 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -897,17 +897,11 @@ config DATA_SHIFT
 
 config ARCH_FORCE_MAX_ORDER
 	int "Order of maximal physically contiguous allocations"
-	range 7 8 if PPC64 && PPC_64K_PAGES
 	default "8" if PPC64 && PPC_64K_PAGES
-	range 12 12 if PPC64 && !PPC_64K_PAGES
 	default "12" if PPC64 && !PPC_64K_PAGES
-	range 8 63 if PPC32 && PPC_16K_PAGES
 	default "8" if PPC32 && PPC_16K_PAGES
-	range 6 63 if PPC32 && PPC_64K_PAGES
 	default "6" if PPC32 && PPC_64K_PAGES
-	range 4 63 if PPC32 && PPC_256K_PAGES
 	default "4" if PPC32 && PPC_256K_PAGES
-	range 10 63
 	default "10"
 	help
 	  The kernel page allocator limits the size of maximal physically
-- 
2.35.1

