Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E330A6C63AB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 10:33:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj0X359fNz3fdH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 20:33:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fSSowVKk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fSSowVKk;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj0Jh2yjJz3cdr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 20:23:48 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 188C5B8202D;
	Thu, 23 Mar 2023 09:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD746C4339C;
	Thu, 23 Mar 2023 09:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679563424;
	bh=99+9gRXuNZGZrnvJd+Y1nZy5usyv3NMBBGlXNWMVJhs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fSSowVKku6I+4khALqKcaWeFjf1TxQwq6N17YCC7lSQQq1PMKZNZXR6Amg8KHBCln
	 8D1+czeovKFYgk9ba7AwrEOWdx4T4TvSidUG4w0oEnP7Ux2idkiveTG5RuhNH001uj
	 ZH2wbqVR6pwA72IlRr0A0Vm+Px75ZhuzsapmFJ4MJUx20c6j0uj+d4nkaYltR2HdGP
	 LBmRDMYlYeROh4iX+5zaZEFyfMPZyDOym4GBzHOPHNe4Rg7MF0KLgYOBU/kY0U7tEp
	 2qhz4vjT8nOntJZetWtWrbF6J0wrO+fnxdSyIdjlEGw6E/HBeJt9B+RUXXoHM7dYWp
	 7S274GLZIA5Jg==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 12/14] sh: drop ranges for definition of ARCH_FORCE_MAX_ORDER
Date: Thu, 23 Mar 2023 11:21:54 +0200
Message-Id: <20230323092156.2545741-13-rppt@kernel.org>
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

sh defines insane ranges for ARCH_FORCE_MAX_ORDER allowing MAX_ORDER
up to 63, which implies maximal contiguous allocation size of 2^63
pages.

Drop bogus definitions of ranges for ARCH_FORCE_MAX_ORDER and leave it a
simple integer with sensible defaults.

Users that *really* need to change the value of ARCH_FORCE_MAX_ORDER
will be able to do so but they won't be mislead by the bogus ranges.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/sh/mm/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/sh/mm/Kconfig b/arch/sh/mm/Kconfig
index fb15ba1052ba..511c17aede4a 100644
--- a/arch/sh/mm/Kconfig
+++ b/arch/sh/mm/Kconfig
@@ -21,9 +21,7 @@ config PAGE_OFFSET
 config ARCH_FORCE_MAX_ORDER
 	int "Order of maximal physically contiguous allocations"
 	default "8" if PAGE_SIZE_16KB
-	range 6 63 if PAGE_SIZE_64KB
 	default "6" if PAGE_SIZE_64KB
-	range 10 63
 	default "13" if !MMU
 	default "10"
 	help
-- 
2.35.1

