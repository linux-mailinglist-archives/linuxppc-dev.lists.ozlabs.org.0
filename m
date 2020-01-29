Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AB214D16F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 20:52:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487DfG4XspzDqT9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 06:52:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=By0dBFVu; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487Dbr25LKzDqMw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 06:50:15 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 487Dbk13KPz9v6Mk;
 Wed, 29 Jan 2020 20:50:10 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=By0dBFVu; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Q7PoxufizGrV; Wed, 29 Jan 2020 20:50:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 487Dbh6Ts9z9v6Mj;
 Wed, 29 Jan 2020 20:50:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580327408; bh=omfaf4XjOg/DOAMNgBIrA90fdsNIo9S16aDDtammHcA=;
 h=From:Subject:To:Cc:Date:From;
 b=By0dBFVu+gRnHvvbFgvwb0hK9EM/9M3ZV9pXAzO4uq1mvKF5B923cg00oWd7FvKqU
 FWo6Pgv3cHXhgpmfwU1c3ldxXmPDxSlO7wYDUNyzpxZabYjPw9aPWi9DtocJ7lVzo2
 JXx/ckC0U3jWeUbMhdXV0QjObPbhOMCzzUmi5e3A=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DD4468B82F;
 Wed, 29 Jan 2020 20:50:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yox7VE7PLePX; Wed, 29 Jan 2020 20:50:08 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7FFE78B829;
 Wed, 29 Jan 2020 20:50:08 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 095696524E; Wed, 29 Jan 2020 19:50:07 +0000 (UTC)
Message-Id: <6ecbda05b4119c40222dc8ec284604e1597c9bff.1580327381.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/process: Remove unneccessary #ifdef CONFIG_PPC64 in
 copy_thread_tls()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 29 Jan 2020 19:50:07 +0000 (UTC)
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

is_32bit_task() exists on both PPC64 and PPC32, no need of an ifdefery.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/process.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index fad50db9dcf2..e730b8e522b0 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1634,11 +1634,9 @@ int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
 		p->thread.regs = childregs;
 		childregs->gpr[3] = 0;  /* Result from fork() */
 		if (clone_flags & CLONE_SETTLS) {
-#ifdef CONFIG_PPC64
 			if (!is_32bit_task())
 				childregs->gpr[13] = tls;
 			else
-#endif
 				childregs->gpr[2] = tls;
 		}
 
-- 
2.25.0

