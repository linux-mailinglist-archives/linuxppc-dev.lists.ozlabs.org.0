Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA03A6C8BA8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 07:21:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pk89146jxz3fnJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 17:21:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cQswqzYq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cQswqzYq;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pk7wY0nr3z3fVj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 17:10:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 68E7A60907;
	Sat, 25 Mar 2023 06:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34961C433D2;
	Sat, 25 Mar 2023 06:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679724618;
	bh=4Z2NWXBqkUcDOlecQgNIdEoHt3g4ySgJpa9xjP+8bWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cQswqzYqOHsod0pqf6YFh66X/QrCAVr2YAwri/xOv3fttReIoM0QmyS0CNc7O8lfw
	 iB9IiXk9UZF2X7g4y03lD7rt8tiPSQdbx5vzhgyUTdNKn7t6zEZLPPpuy8u+jYk1nB
	 hreHJFycD54YdiEhqQ0HBvllQcOEdNGWjMTQ5lqG4aqa8u1V5zh0ltg8TIX82CILYd
	 KQbZsSzZ3Xm5Sb7cQZr7wWsFV8B62+pKIVwZu8KuYKbvE4cZWx4VrFjgdd89Ru6LQi
	 UFM2jB+uXudse6JjEI6YlpzMkLOP6KzIGAnNOl9YGWIzctd70MNq5ZFVUi6oq06Lts
	 mKW75qDo8MgkQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 13/14] sparc: reword ARCH_FORCE_MAX_ORDER prompt and help text
Date: Sat, 25 Mar 2023 09:08:27 +0300
Message-Id: <20230325060828.2662773-14-rppt@kernel.org>
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

