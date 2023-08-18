Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D86781006
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 18:14:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RS6QC1qd3z3cmC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 02:14:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=csgroup.eu (client-ip=90.115.179.12; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (unknown [90.115.179.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RS6Pg3f35z3cGC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Aug 2023 02:13:56 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RS6PX19G4z9vbf;
	Fri, 18 Aug 2023 18:13:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mr8JbmkwvXuM; Fri, 18 Aug 2023 18:13:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RS6PX0Rhfz9vbb;
	Fri, 18 Aug 2023 18:13:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0B5CB8B76D;
	Fri, 18 Aug 2023 18:13:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id V6WLQT1FsPtw; Fri, 18 Aug 2023 18:13:51 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (PO17626.IDSI0.si.c-s.fr [172.19.54.29])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BE9B58B76C;
	Fri, 18 Aug 2023 18:13:51 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37IGDefs139533
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 18:13:40 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37IGDeGo139532;
	Fri, 18 Aug 2023 18:13:40 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 2/2] powerpc/8xx: Honor execonly protection
Date: Fri, 18 Aug 2023 18:13:27 +0200
Message-ID: <602dcac64428b91b1b11e0bb730e2455ff1fb688.1692375190.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <227e23622d4778c342d072541ad2416aea5ab44e.1692375190.git.christophe.leroy@csgroup.eu>
References: <227e23622d4778c342d072541ad2416aea5ab44e.1692375190.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692375205; l=1026; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=2rfl+yqmRc5MQ1yinQnNfbAsbCr55ZSojtTJwdSH9tw=; b=u6Pl/ROSjUzdFiIH/CYD4i5GoEZS0AfhI5NcocxUllCJh8EbJK6TsD0T9mGM1ZWovf8caCa0b XCBaisgJAD0BXyRQWDIV/fuZNPjXou+K8iV4oaoELCFnT6a7v55U+mz
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: Kees Cook <keescook@chromium.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On powerpc 8xx, exec does not imply read so
redefine PAGE_NONE_X as PAGE_NONE + X

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Russell Currey <ruscur@russell.cc>
Cc: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/include/asm/nohash/32/pte-8xx.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
index b234a93b05f1..f47d36d40a26 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
@@ -79,7 +79,7 @@
 
 /* Permission masks used to generate the __P and __S table */
 #define PAGE_NONE	__pgprot(_PAGE_BASE | _PAGE_NA)
-#define PAGE_NONE_X	__pgprot(_PAGE_BASE | _PAGE_RO | _PAGE_EXEC)
+#define PAGE_NONE_X	__pgprot(_PAGE_BASE | _PAGE_NA | _PAGE_EXEC)
 #define PAGE_SHARED	__pgprot(_PAGE_BASE)
 #define PAGE_SHARED_X	__pgprot(_PAGE_BASE | _PAGE_EXEC)
 #define PAGE_COPY	__pgprot(_PAGE_BASE | _PAGE_RO)
-- 
2.41.0

