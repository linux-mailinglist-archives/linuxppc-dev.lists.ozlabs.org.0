Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AECA2DBE69
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 11:14:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwrbJ1WMZzDqRf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 21:14:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwrR81lYhzDqMH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 21:07:47 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CwrQv0qTNz9v1ZG;
 Wed, 16 Dec 2020 11:07:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hvM-Cqhlr7xG; Wed, 16 Dec 2020 11:07:35 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CwrQv00BYz9v1Z7;
 Wed, 16 Dec 2020 11:07:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B52848B7CC;
 Wed, 16 Dec 2020 11:07:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WSKtveR0_kV4; Wed, 16 Dec 2020 11:07:35 +0100 (CET)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 57B3E8B7C7;
 Wed, 16 Dec 2020 11:07:35 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 2D71A6681D; Wed, 16 Dec 2020 10:07:35 +0000 (UTC)
Message-Id: <ceea0970692b967990cd8ac6bf01c222541b83e2.1608112797.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1608112796.git.christophe.leroy@csgroup.eu>
References: <cover.1608112796.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 5/7] powerpc/bpf: Change values of SEEN_ flags
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, kafai@fb.com,
 songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@chromium.org, naveen.n.rao@linux.ibm.com, sandipan@linux.ibm.com
Date: Wed, 16 Dec 2020 10:07:35 +0000 (UTC)
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
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Because PPC32 will use more non volatile registers,
move SEEN_ flags to positions 0-2 which corresponds to special
registers.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/net/bpf_jit.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index b34abfce15a6..fb4656986fb9 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -108,18 +108,18 @@ static inline bool is_nearbranch(int offset)
 #define COND_LT		(CR0_LT | COND_CMP_TRUE)
 #define COND_LE		(CR0_GT | COND_CMP_FALSE)
 
-#define SEEN_FUNC	0x1000 /* might call external helpers */
-#define SEEN_STACK	0x2000 /* uses BPF stack */
-#define SEEN_TAILCALL	0x4000 /* uses tail calls */
+#define SEEN_FUNC	0x20000000 /* might call external helpers */
+#define SEEN_STACK	0x40000000 /* uses BPF stack */
+#define SEEN_TAILCALL	0x80000000 /* uses tail calls */
 
 struct codegen_context {
 	/*
 	 * This is used to track register usage as well
 	 * as calls to external helpers.
 	 * - register usage is tracked with corresponding
-	 *   bits (r3-r10 and r27-r31)
+	 *   bits (r3-r31)
 	 * - rest of the bits can be used to track other
-	 *   things -- for now, we use bits 16 to 23
+	 *   things -- for now, we use bits 0 to 2
 	 *   encoded in SEEN_* macros above
 	 */
 	unsigned int seen;
-- 
2.25.0

