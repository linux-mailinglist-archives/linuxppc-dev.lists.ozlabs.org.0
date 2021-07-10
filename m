Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 942533C2CF4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jul 2021 04:20:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GMDJM2grlz3bWn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jul 2021 12:20:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OTXAruOJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OTXAruOJ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GMDHh2tSNz3bW6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jul 2021 12:19:28 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4C17613AF;
 Sat, 10 Jul 2021 02:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625883566;
 bh=0YPOTlGAevRTrCYvMVP6goKkOJ4HD5gtpQFiIRIXX6I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OTXAruOJ4APS5gHShb3eJJdgD0oRtS+GAKJmf0zILeA5+hsmQTOK4pL/3LcJDAndG
 NK/XPCMkQw7rxYIAExUoYYlqZxGaQpAc4X0xqkUaue+aN2wnYeQZwCa5URZ3dOu86N
 an3nK68JDU1uXnTXa1xBurnIbAyyQWjp2F9JStKnZfB9KHZFacoAH7cldFcyaYHkFt
 pm+Q7l2V99J8BfpT6DQ0S7HiC89VncusYHHSGBDuyO0mehnsNLDanyw8Ng+uMGy1UI
 SNRqU3BhlytNRxQiEl6jLhFM5woXswPbm/Qpms1h2t4KRrosGVcs4zfhI0R+hkMbOE
 Xe951GQmUOHUw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 073/114] powerpc/inst: Fix sparse detection on
 get_user_instr()
Date: Fri,  9 Jul 2021 22:17:07 -0400
Message-Id: <20210710021748.3167666-73-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710021748.3167666-1-sashal@kernel.org>
References: <20210710021748.3167666-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

[ Upstream commit b3a9e523237013477bea914b7fbfbe420428b988 ]

get_user_instr() lacks sparse detection for the __user tag.

This is because __gui_ptr is assigned with a cast.

Fix that by adding a __chk_user_ptr()

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/0320e5b41a794fd456ab8c5993bbfadcf9e1d8b4.1621516826.git.christophe.leroy@csgroup.eu
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/inst.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 268d3bd073c8..887ef150fdda 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -12,6 +12,8 @@
 	unsigned long __gui_ptr = (unsigned long)ptr;			\
 	struct ppc_inst __gui_inst;					\
 	unsigned int __prefix, __suffix;				\
+									\
+	__chk_user_ptr(ptr);						\
 	__gui_ret = gu_op(__prefix, (unsigned int __user *)__gui_ptr);	\
 	if (__gui_ret == 0) {						\
 		if ((__prefix >> 26) == OP_PREFIX) {			\
@@ -29,7 +31,10 @@
 })
 #else /* !CONFIG_PPC64 */
 #define ___get_user_instr(gu_op, dest, ptr)				\
-	gu_op((dest).val, (u32 __user *)(ptr))
+({									\
+	__chk_user_ptr(ptr);						\
+	gu_op((dest).val, (u32 __user *)(ptr));				\
+})
 #endif /* CONFIG_PPC64 */
 
 #define get_user_instr(x, ptr) \
-- 
2.30.2

