Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CE9135429
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 09:16:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tf8p5PfLzDqYq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 19:16:42 +1100 (AEDT)
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
 header.s=mail header.b=HQBqJeCO; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tf7227NczDqGm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 19:15:07 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47tf6s3zYvz9v3KW;
 Thu,  9 Jan 2020 09:15:01 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=HQBqJeCO; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Gi7YKr0mKWYK; Thu,  9 Jan 2020 09:15:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47tf6s2gGzz9v3KV;
 Thu,  9 Jan 2020 09:15:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1578557701; bh=aCJX3qfRGAn+3jSeLTC1vMzfBDwGoUIdPhX/7aLEOfc=;
 h=From:Subject:To:Cc:Date:From;
 b=HQBqJeCOIdc7xFwr0PRHYkj4U7bbp7zWf3xeRiO2hJAUEtL60jYN9+P1OJF6vinSV
 nyT7rLmW2/LHPUB+CNknG8UTjGOm5SyJC9B1RNM8gBNoKgp67fzQdnkDswZf1A0CZj
 2+JzV/+Sp00UtvAhYVMkNPxsmLaHNYb2DpHj07Yg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 54C348B816;
 Thu,  9 Jan 2020 09:15:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fEx0BEfzzKAO; Thu,  9 Jan 2020 09:15:02 +0100 (CET)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0EDCA8B769;
 Thu,  9 Jan 2020 09:15:02 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id B2EB063B8D; Thu,  9 Jan 2020 08:15:01 +0000 (UTC)
Message-Id: <62477e446d9685459d4f27d193af6ff1bd69d55f.1578557581.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] init: fix misleading "This architecture does not have kernel
 memory protection" message
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>
Date: Thu,  9 Jan 2020 08:15:01 +0000 (UTC)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This message leads to think that memory protection is not implemented
for the said architecture, whereas absence of CONFIG_STRICT_KERNEL_RWX
only means that memory protection has not been selected at
compile time.

Don't print this message when CONFIG_ARCH_HAS_STRICT_KERNEL_RWX is
selected by the architecture. Instead, print "Kernel memory protection
not selected by kernel config."

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 init/main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/init/main.c b/init/main.c
index 2cd736059416..fd31b15cc910 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1090,6 +1090,11 @@ static void mark_readonly(void)
 	} else
 		pr_info("Kernel memory protection disabled.\n");
 }
+#elif defined(CONFIG_ARCH_HAS_STRICT_KERNEL_RWX)
+static inline void mark_readonly(void)
+{
+	pr_warn("Kernel memory protection not selected by kernel config.\n");
+}
 #else
 static inline void mark_readonly(void)
 {
-- 
2.13.3

