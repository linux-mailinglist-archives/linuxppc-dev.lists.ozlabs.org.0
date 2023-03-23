Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6B26C6387
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 10:27:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj0Ny5C0fz3fY5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 20:27:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vRT1J299;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vRT1J299;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj0Hg2vBxz3f4w
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 20:22:55 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 10BE1B82023;
	Thu, 23 Mar 2023 09:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0E1C433AE;
	Thu, 23 Mar 2023 09:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679563371;
	bh=Taw/mVGmMzfFA4/zjWlz+sOR+xqfdhkwF0DQ85nhoys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vRT1J299K8QpI00sxZv59CyczO6p0SWP1wcHAQk8mghcdKjhLznndromKwnUtlkrM
	 SRWyev3rVk+6CoxTsdqVockaQN2ib+Nl4FHOvmR+E/SjJe1acNEz6Z4GFuyF6GLjfd
	 NuLmQu+LCOGDTIOxUdJKu3y2Kol4WBMAdYu5dp+Zj49J79N9Gzs8fUFCVhMdAWtkR8
	 Ee5XTvH/Aq3cY4DQROJ2COFMOABNcorPOEkkywcg034jyqoHf/3OREMiGZ7q6+/cP7
	 pO8gCgPnpv6P2h41m6iFg7ve1OatfexcxvMd110cY4RS/B3xhHDbjx1NZErU4piC14
	 QCF+7aV9m+NqQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 05/14] ia64: don't allow users to override ARCH_FORCE_MAX_ORDER
Date: Thu, 23 Mar 2023 11:21:47 +0200
Message-Id: <20230323092156.2545741-6-rppt@kernel.org>
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

It is enough to keep default values for base and huge pages without
letting users to override ARCH_FORCE_MAX_ORDER.

Drop the prompt to make the option unvisible in *config.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
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

