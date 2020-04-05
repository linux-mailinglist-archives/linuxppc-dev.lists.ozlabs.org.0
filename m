Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC0A19ED30
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 19:57:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wLwk559jzDqT7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 03:57:26 +1000 (AEST)
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
 header.s=mail header.b=QSD7230r; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wLf72fNxzDqcG
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 03:44:47 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48wLdz4Q0Cz9ty3d;
 Sun,  5 Apr 2020 19:44:39 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=QSD7230r; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id l6_ueIiV2GDV; Sun,  5 Apr 2020 19:44:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48wLdz3MrRz9ty2y;
 Sun,  5 Apr 2020 19:44:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586108679; bh=9KvxZF0NJ1djyzKEWLsEBPQl38pgAHPtJyUllkNivxo=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=QSD7230rL5+rqQDDMVmc5uBt231EnAPhx7iz1THtCaseCk4Pog9uGx9PLqa2ry7Fx
 YuDe+TpE/K6cjTpbCL/JwOIKY8aAtAF6QGX9N9il1fazyYB2PwvFmF90ZxFzhBNbet
 4vttXw6R0ouIWwAvaqRLbQK8Wkvn0eQ+iScKysZo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0FE328B783;
 Sun,  5 Apr 2020 19:44:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id I6E058I0cnlN; Sun,  5 Apr 2020 19:44:42 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 954CA8B774;
 Sun,  5 Apr 2020 19:44:42 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 694736571C; Sun,  5 Apr 2020 17:44:42 +0000 (UTC)
Message-Id: <efd2f46f926c62a55d8f9bc4021e4859dcc2a83a.1586108649.git.christophe.leroy@c-s.fr>
In-Reply-To: <029e1064b1ad738785718221ea468c9cfc282457.1586108649.git.christophe.leroy@c-s.fr>
References: <029e1064b1ad738785718221ea468c9cfc282457.1586108649.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v2 07/13] powerpc/syscall: Use is_compat_task()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Sun,  5 Apr 2020 17:44:42 +0000 (UTC)
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

Instead of hard comparing task flags with _TIF_32BIT, use
is_compat_task(). The advantage is that it returns 0 on PPC32
allthough _TIF_32BIT is always set.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/syscall.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
index 28bd43db8755..4674cfd2916d 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 #include <linux/err.h>
+#include <linux/compat.h>
+
 #include <asm/asm-prototypes.h>
 #include <asm/kup.h>
 #include <asm/cputime.h>
@@ -92,7 +94,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	/* May be faster to do array_index_nospec? */
 	barrier_nospec();
 
-	if (unlikely(ti_flags & _TIF_32BIT)) {
+	if (is_compat_task()) {
 		f = (void *)compat_sys_call_table[r0];
 
 		r3 &= 0x00000000ffffffffULL;
-- 
2.25.0

