Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 881A36C6397
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 10:30:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj0Rx3BSwz3fSt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 20:30:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=opvYt+M6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=opvYt+M6;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj0J602BXz3cjT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 20:23:17 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A8779B82021;
	Thu, 23 Mar 2023 09:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6048AC4339E;
	Thu, 23 Mar 2023 09:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679563394;
	bh=jzZSH15gj6TUOIsTCrO5L+I5me/Mb74Nnyc5QzApf2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=opvYt+M6nVWy83Z/VnNrEAxA7GcoGHzEz8QYyBOSThR1uJN44T0NbsszAVqRkmb9A
	 SFPedINEgAbnyJ/AKydoamZjo3WlyOV/lqEJmXHsxX31FbqFPcrUSqmaQWw7/Lavv0
	 pPumm6jkzkBxu2g5cEsCaVlcJS4bENKkkFc8Cz2Wz6eQKaxqTYIhIRxBQoMF2g89v5
	 DZ2t+8xW5kCcFwoLehAHXimJZXVI3kEvMEYcvGsn+KOl1TSwgvlKsnJ9ypkWw+7GOc
	 VfD+ftLkOkIQYp64EjA4dBOMp2fQX797VTwRK697fAL4dXiohtz60VzvDWHmWbnAxZ
	 3F3FrUCphxRGg==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 08/14] nios2: drop ranges for definition of ARCH_FORCE_MAX_ORDER
Date: Thu, 23 Mar 2023 11:21:50 +0200
Message-Id: <20230323092156.2545741-9-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230323092156.2545741-1-rppt@kernel.org>
References: <20230323092156.2545741-1-rppt@kernel.org>
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

nios2 defines range for ARCH_FORCE_MAX_ORDER allowing MAX_ORDER
up to 19, which implies maximal contiguous allocation size of 2^19
pages or 2GiB.

Drop bogus definition of ranges for ARCH_FORCE_MAX_ORDER and leave it a
simple integer with sensible default.

Users that *really* need to change the value of ARCH_FORCE_MAX_ORDER
will be able to do so but they won't be mislead by the bogus ranges.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/nios2/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig
index fcaa6bbda3fc..e5936417d3cd 100644
--- a/arch/nios2/Kconfig
+++ b/arch/nios2/Kconfig
@@ -46,7 +46,6 @@ source "kernel/Kconfig.hz"
 
 config ARCH_FORCE_MAX_ORDER
 	int "Order of maximal physically contiguous allocations"
-	range 8 19
 	default "10"
 	help
 	  The kernel page allocator limits the size of maximal physically
-- 
2.35.1

