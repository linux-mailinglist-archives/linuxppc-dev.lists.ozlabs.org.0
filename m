Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD4A13E45B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 18:08:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47z9cY4FRbzDqXs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 04:07:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=BGDPjtpQ; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z9Jw0GFDzDqbh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 03:54:24 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5658D22525;
 Thu, 16 Jan 2020 16:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579193662;
 bh=1Y83ZRy4JQGM0BUTA/qOSFth1ukzvcOryxz+QvYzsxE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BGDPjtpQlr5FysV9vC0FzVLcxEwxmczDi9JeRBt6N69hq/Qiq5aXn8AiU+EBMNSvd
 6Z9sNTuPjB+funRi5cpppEnQCQ1i/Ai4wHxejfH/CF3BXQn0Fc59qdKQRie/pXUvJJ
 Db9LxnkqRKvsYCvu+Q5F/Pg37SBvPvLsMIMIhgQo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 189/205] powerpc/kasan: Fix boot failure with
 RELOCATABLE && FSL_BOOKE
Date: Thu, 16 Jan 2020 11:42:44 -0500
Message-Id: <20200116164300.6705-189-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116164300.6705-1-sashal@kernel.org>
References: <20200116164300.6705-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: linuxppc-dev@lists.ozlabs.org, Lexi Shao <shaolexi@huawei.com>,
 Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@c-s.fr>

[ Upstream commit 71eb40fc53371bc247c8066ae76ad9e22ae1e18d ]

When enabling CONFIG_RELOCATABLE and CONFIG_KASAN on FSL_BOOKE,
the kernel doesn't boot.

relocate_init() requires KASAN early shadow area to be set up because
it needs access to the device tree through generic functions.

Call kasan_early_init() before calling relocate_init()

Reported-by: Lexi Shao <shaolexi@huawei.com>
Fixes: 2edb16efc899 ("powerpc/32: Add KASAN support")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/b58426f1664a4b344ff696d18cacf3b3e8962111.1575036985.git.christophe.leroy@c-s.fr
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/head_fsl_booke.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index adf0505dbe02..519d49547e2f 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -238,6 +238,9 @@ set_ivor:
 
 	bl	early_init
 
+#ifdef CONFIG_KASAN
+	bl	kasan_early_init
+#endif
 #ifdef CONFIG_RELOCATABLE
 	mr	r3,r30
 	mr	r4,r31
@@ -264,9 +267,6 @@ set_ivor:
 /*
  * Decide what sort of machine this is and initialize the MMU.
  */
-#ifdef CONFIG_KASAN
-	bl	kasan_early_init
-#endif
 	mr	r3,r30
 	mr	r4,r31
 	bl	machine_init
-- 
2.20.1

