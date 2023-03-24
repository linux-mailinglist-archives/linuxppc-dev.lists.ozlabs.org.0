Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6356C7757
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 06:28:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjW2H6xHtz3fcH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 16:28:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BFdj3KWz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BFdj3KWz;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjVwy3Sb3z3fR0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 16:23:30 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AD1E462952;
	Fri, 24 Mar 2023 05:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A2CC433A1;
	Fri, 24 Mar 2023 05:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679635407;
	bh=gU9WeuZrKKhjWnkXo6iMK8oK3OAW8JY6v5zyZrx1gFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BFdj3KWzf6zlwHRXi2kvBaCDK5IwWYveapciy+Fji7CcGbm732iPsb/YPjuvv9zIH
	 6i/jctZje1DXV7S3ZbrzoNueEf3rgMbP1vrj5lEVq/aRm4XrKWctECPRaTak7reTfU
	 X3bPUKdu2HQPSs5HJYswtyCMeFb3EDxzWvEKXLYUCFm77id4DyAMfHYE60U/qRW8li
	 9bHSq1dQRA9au494Ssx/8QcgyTFdNnBwStfwCPJOzY34mgMs4Dqp2sK3UmVVoJH6ft
	 QZQXJ6pXN41I6wxusj7EPI/Lgw6R8KopT9u+INsszNrq0btGsDgeht5cmNYtrImKK5
	 R+FtwuPNMfntA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 05/14] ia64: don't allow users to override ARCH_FORCE_MAX_ORDER
Date: Fri, 24 Mar 2023 08:22:24 +0300
Message-Id: <20230324052233.2654090-6-rppt@kernel.org>
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

It is enough to keep default values for base and huge pages without
letting users to override ARCH_FORCE_MAX_ORDER.

Drop the prompt to make the option unvisible in *config.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/ia64/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 0d2f41fa56ee..b61437cae162 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -202,8 +202,7 @@ config IA64_CYCLONE
 	  If you're unsure, answer N.
 
 config ARCH_FORCE_MAX_ORDER
-	int "MAX_ORDER (10 - 16)"  if !HUGETLB_PAGE
-	range 10 16  if !HUGETLB_PAGE
+	int
 	default "16" if HUGETLB_PAGE
 	default "10"
 
-- 
2.35.1

