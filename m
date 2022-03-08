Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6486E4D214F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 20:21:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KClYd2Jb4z3bxS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 06:21:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KClXs4MH6z3bTN
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 06:20:45 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KClXj1DXwz9sSc;
 Tue,  8 Mar 2022 20:20:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CCMx9MW4Oc7a; Tue,  8 Mar 2022 20:20:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KClXh5yv9z9sSW;
 Tue,  8 Mar 2022 20:20:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B0C608B787;
 Tue,  8 Mar 2022 20:20:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id A5vKgD-So7go; Tue,  8 Mar 2022 20:20:36 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.9])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 382348B780;
 Tue,  8 Mar 2022 20:20:36 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 228JKTBQ3553849
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 8 Mar 2022 20:20:29 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 228JKTDR3553848;
 Tue, 8 Mar 2022 20:20:29 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 3/6] powerpc: Include asm/reg.h in asm/svm.h
Date: Tue,  8 Mar 2022 20:20:22 +0100
Message-Id: <482c82c8a29d5fb3ea279b34f107e0e775001344.1646767214.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3c88286b55413730d7784133993a46ef4a3607ce.1646767214.git.christophe.leroy@csgroup.eu>
References: <3c88286b55413730d7784133993a46ef4a3607ce.1646767214.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1646767223; l=606; s=20211009;
 h=from:subject:message-id; bh=anc1lMgqg6w9mMWvGbSgsrpDPLJ4FM21VRuna603bRQ=;
 b=jxuzxf0Mjm/oxp4QDSR7PuVt+/f6gZ3grWU8yEqaEBb7TfRftcSuJ8uoFFfjTuTbv9n0TKhYn0h7
 3BcPKjEFAsr/naobOwPsX2hQof03Yb+d38VnnYKIl94uWT9vFBVZ
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

is_secure_guest() uses mfmsr().

Don't rely on users to include asm/reg.h, include
it in asm/svm.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/svm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/include/asm/svm.h b/arch/powerpc/include/asm/svm.h
index 7546402d796a..da864623cc00 100644
--- a/arch/powerpc/include/asm/svm.h
+++ b/arch/powerpc/include/asm/svm.h
@@ -10,6 +10,8 @@
 
 #ifdef CONFIG_PPC_SVM
 
+#include <asm/reg.h>
+
 static inline bool is_secure_guest(void)
 {
 	return mfmsr() & MSR_S;
-- 
2.34.1

