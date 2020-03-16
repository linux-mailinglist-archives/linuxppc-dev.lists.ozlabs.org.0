Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E1E186BE8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 14:19:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gxhk06F6zDqHf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 00:19:02 +1100 (AEDT)
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
 header.s=mail header.b=PGZm67Ua; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gwl5168VzDqJg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 23:36:01 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48gwks5mQyz9tygW;
 Mon, 16 Mar 2020 13:35:49 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=PGZm67Ua; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id HzA4Qt75hKQS; Mon, 16 Mar 2020 13:35:49 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48gwks3Qh2z9tyg5;
 Mon, 16 Mar 2020 13:35:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584362149; bh=gzZVOWgzxd34wapiHopX2ztrtdLZUIb2o3vS+Xq7Kp8=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=PGZm67UaLpL792dtn0rgDfIMk1uG5V8KY8oSNKSRWuY6gyg+Fzoq3GWueBiLXvMkQ
 btKHsh8WCDURj7TizCHAwpLWcvnuqDm2hS/ITS/h8Si76bb8CIO5HtDpasspmIhfbd
 JdSQF/LokNtGixOH6tFgWOK3ZQk2QTc/3942drUE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 66C048B7D0;
 Mon, 16 Mar 2020 13:35:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id H7_Ae7NLUSoE; Mon, 16 Mar 2020 13:35:54 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 44BCC8B7CB;
 Mon, 16 Mar 2020 13:35:54 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 39EF965595; Mon, 16 Mar 2020 12:35:54 +0000 (UTC)
Message-Id: <65d666efd5a65c2c6f18627cadf4b90245fc7d7f.1584360344.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1584360343.git.christophe.leroy@c-s.fr>
References: <cover.1584360343.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 09/46] powerpc/ptdump: Reorder flags
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 16 Mar 2020 12:35:54 +0000 (UTC)
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

Reorder flags in a more logical way:
- Page size (huge) first
- User
- RWX
- Present
- WIMG
- Special
- Dirty and Accessed

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/ptdump/8xx.c    | 30 +++++++++++++++---------------
 arch/powerpc/mm/ptdump/shared.c | 30 +++++++++++++++---------------
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/mm/ptdump/8xx.c b/arch/powerpc/mm/ptdump/8xx.c
index ca9ce94672f5..a3169677dced 100644
--- a/arch/powerpc/mm/ptdump/8xx.c
+++ b/arch/powerpc/mm/ptdump/8xx.c
@@ -11,11 +11,6 @@
 
 static const struct flag_info flag_array[] = {
 	{
-		.mask	= _PAGE_SH,
-		.val	= _PAGE_SH,
-		.set	= "sh",
-		.clear	= "  ",
-	}, {
 		.mask	= _PAGE_RO | _PAGE_NA,
 		.val	= 0,
 		.set	= "rw",
@@ -37,11 +32,26 @@ static const struct flag_info flag_array[] = {
 		.val	= _PAGE_PRESENT,
 		.set	= "p",
 		.clear	= " ",
+	}, {
+		.mask	= _PAGE_NO_CACHE,
+		.val	= _PAGE_NO_CACHE,
+		.set	= "i",
+		.clear	= " ",
 	}, {
 		.mask	= _PAGE_GUARDED,
 		.val	= _PAGE_GUARDED,
 		.set	= "g",
 		.clear	= " ",
+	}, {
+		.mask	= _PAGE_SH,
+		.val	= _PAGE_SH,
+		.set	= "sh",
+		.clear	= "  ",
+	}, {
+		.mask	= _PAGE_SPECIAL,
+		.val	= _PAGE_SPECIAL,
+		.set	= "s",
+		.clear	= " ",
 	}, {
 		.mask	= _PAGE_DIRTY,
 		.val	= _PAGE_DIRTY,
@@ -52,16 +62,6 @@ static const struct flag_info flag_array[] = {
 		.val	= _PAGE_ACCESSED,
 		.set	= "a",
 		.clear	= " ",
-	}, {
-		.mask	= _PAGE_NO_CACHE,
-		.val	= _PAGE_NO_CACHE,
-		.set	= "i",
-		.clear	= " ",
-	}, {
-		.mask	= _PAGE_SPECIAL,
-		.val	= _PAGE_SPECIAL,
-		.set	= "s",
-		.clear	= " ",
 	}
 };
 
diff --git a/arch/powerpc/mm/ptdump/shared.c b/arch/powerpc/mm/ptdump/shared.c
index 44a8a64a664f..dab5d8028a9b 100644
--- a/arch/powerpc/mm/ptdump/shared.c
+++ b/arch/powerpc/mm/ptdump/shared.c
@@ -30,21 +30,6 @@ static const struct flag_info flag_array[] = {
 		.val	= _PAGE_PRESENT,
 		.set	= "p",
 		.clear	= " ",
-	}, {
-		.mask	= _PAGE_GUARDED,
-		.val	= _PAGE_GUARDED,
-		.set	= "g",
-		.clear	= " ",
-	}, {
-		.mask	= _PAGE_DIRTY,
-		.val	= _PAGE_DIRTY,
-		.set	= "d",
-		.clear	= " ",
-	}, {
-		.mask	= _PAGE_ACCESSED,
-		.val	= _PAGE_ACCESSED,
-		.set	= "a",
-		.clear	= " ",
 	}, {
 		.mask	= _PAGE_WRITETHRU,
 		.val	= _PAGE_WRITETHRU,
@@ -55,11 +40,26 @@ static const struct flag_info flag_array[] = {
 		.val	= _PAGE_NO_CACHE,
 		.set	= "i",
 		.clear	= " ",
+	}, {
+		.mask	= _PAGE_GUARDED,
+		.val	= _PAGE_GUARDED,
+		.set	= "g",
+		.clear	= " ",
 	}, {
 		.mask	= _PAGE_SPECIAL,
 		.val	= _PAGE_SPECIAL,
 		.set	= "s",
 		.clear	= " ",
+	}, {
+		.mask	= _PAGE_DIRTY,
+		.val	= _PAGE_DIRTY,
+		.set	= "d",
+		.clear	= " ",
+	}, {
+		.mask	= _PAGE_ACCESSED,
+		.val	= _PAGE_ACCESSED,
+		.set	= "a",
+		.clear	= " ",
 	}
 };
 
-- 
2.25.0

