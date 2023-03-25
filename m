Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CED6C8B9B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 07:16:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pk83r2R7Zz3ffy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 17:16:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MD4Y3Lr7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MD4Y3Lr7;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pk7vt5HmPz3cB8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 17:09:46 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5FBB7B82700;
	Sat, 25 Mar 2023 06:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59301C4339E;
	Sat, 25 Mar 2023 06:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679724583;
	bh=6bSLgS5oWLO2ugXNNWLZtVgkIZ/dfclb6HuVi9dltgc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MD4Y3Lr7O5i8W0DL1L83CZ+dmHRSmxfBpKFlVGb0DgT9OaiD36B+h63z9ihug64Xt
	 +uP4BzJ6AZWugpLieIFtYGCbtxzw6ZyatiYC4fWW8CAwzL6pWjqqSsvcgnDMLYgF6v
	 bPTpe3w1jgxF/xWLjlp6N73kl8sA9ufAw/OujMewVUttw3NIUjxzVegUw0ZCpPTgeo
	 dKGv3LdM/EWzWYizCRfo+ODa9zq16J/BHrrkQPhBaeJ+cBdCf6CVhJZgWpETJHlt73
	 JWniOl/sAFMPuxry0QF1ZPtE0u23Wo0ckgfV3aFLg85tLaYbIGx5vI+JUWBvFc1ZsT
	 7Gx2p7TiWqDKA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 08/14] nios2: drop ranges for definition of ARCH_FORCE_MAX_ORDER
Date: Sat, 25 Mar 2023 09:08:22 +0300
Message-Id: <20230325060828.2662773-9-rppt@kernel.org>
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

nios2 defines range for ARCH_FORCE_MAX_ORDER allowing MAX_ORDER
up to 19, which implies maximal contiguous allocation size of 2^19
pages or 2GiB.

Drop bogus definition of ranges for ARCH_FORCE_MAX_ORDER and leave it a
simple integer with sensible default.

Users that *really* need to change the value of ARCH_FORCE_MAX_ORDER
will be able to do so but they won't be mislead by the bogus ranges.

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Zi Yan <ziy@nvidia.com>
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

