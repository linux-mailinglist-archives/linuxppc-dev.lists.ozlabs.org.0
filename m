Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5F13A7743
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 08:42:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3zJD4cM7z3c90
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 16:42:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3zHD3jfWz3091
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 16:41:12 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G3zH04NpdzB99d;
 Tue, 15 Jun 2021 08:41:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gN3w74Z6HH9g; Tue, 15 Jun 2021 08:41:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G3zGz5hpkzB9CJ;
 Tue, 15 Jun 2021 08:40:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BAD9F8B7A3;
 Tue, 15 Jun 2021 08:40:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9RumWMzXaluW; Tue, 15 Jun 2021 08:40:59 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 817E48B7A2;
 Tue, 15 Jun 2021 08:40:59 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 592966627B; Tue, 15 Jun 2021 06:40:59 +0000 (UTC)
Message-Id: <9ce6e3e3bde4621442049476f41b5e0c7cf283be.1623739212.git.christophe.leroy@csgroup.eu>
In-Reply-To: <b813c1f4d3dab2f51300eac44d99029aa8e57830.1623739212.git.christophe.leroy@csgroup.eu>
References: <b813c1f4d3dab2f51300eac44d99029aa8e57830.1623739212.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 3/7] powerpc/signal64: Access function descriptor with user
 access block
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 15 Jun 2021 06:40:59 +0000 (UTC)
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

Access the function descriptor of the handler within a
user access block.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_64.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 8b2eb758131c..9ca97b4366df 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -936,8 +936,18 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 		func_descr_t __user *funct_desc_ptr =
 			(func_descr_t __user *) ksig->ka.sa.sa_handler;
 
-		err |= get_user(regs->ctr, &funct_desc_ptr->entry);
-		err |= get_user(regs->gpr[2], &funct_desc_ptr->toc);
+		if (user_read_access_begin(funct_desc_ptr, sizeof(func_descr_t))) {
+			unsafe_get_user(regs->ctr, &funct_desc_ptr->entry, bad_funct_desc_block);
+			unsafe_get_user(regs->gpr[2], &funct_desc_ptr->toc, bad_funct_desc_block);
+		} else {
+			goto bad_funct_desc;
+bad_funct_desc_block:
+			user_read_access_end();
+bad_funct_desc:
+			signal_fault(current, regs, __func__, funct_desc_ptr);
+			return 1;
+		}
+		user_read_access_end();
 	}
 
 	/* enter the signal handler in native-endian mode */
-- 
2.25.0

