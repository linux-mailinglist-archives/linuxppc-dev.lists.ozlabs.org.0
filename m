Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0524C38B079
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 15:51:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmB3T0GsYz3c19
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 23:51:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmB2s34Khz3083
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 23:50:45 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FmB2m4c4lz9sTP;
 Thu, 20 May 2021 15:50:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SKVrAdrGOrIs; Thu, 20 May 2021 15:50:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FmB2k3VmTz9sT8;
 Thu, 20 May 2021 15:50:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 47EE98B815;
 Thu, 20 May 2021 15:50:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 41r-VQm3G30B; Thu, 20 May 2021 15:50:38 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 29B7E8B814;
 Thu, 20 May 2021 15:50:38 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1F15264C40; Thu, 20 May 2021 13:50:38 +0000 (UTC)
Message-Id: <0320e5b41a794fd456ab8c5993bbfadcf9e1d8b4.1621516826.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1621516826.git.christophe.leroy@csgroup.eu>
References: <cover.1621516826.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 01/12] powerpc/inst: Fix sparse detection on
 get_user_instr()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com, jniethe5@gmail.com
Date: Thu, 20 May 2021 13:50:38 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

get_user_instr() lacks sparse detection for the __user tag.

This is because __gui_ptr is assigned with a cast.

Fix that by adding a __chk_user_ptr()

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
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
2.25.0

