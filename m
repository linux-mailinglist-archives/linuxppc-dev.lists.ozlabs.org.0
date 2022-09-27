Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E07745EC68B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 16:36:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McMct50ZBz3fS3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 00:36:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McMZL4mn0z3cdB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 00:34:02 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4McMYp2QSGz9spG;
	Tue, 27 Sep 2022 16:33:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1zT7Gyh6NGPT; Tue, 27 Sep 2022 16:33:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4McMYm2nxJz9sp5;
	Tue, 27 Sep 2022 16:33:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5179D8B790;
	Tue, 27 Sep 2022 16:33:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id yWy96NN-JrEf; Tue, 27 Sep 2022 16:33:32 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.35])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EE56E8B77A;
	Tue, 27 Sep 2022 16:33:31 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 28REXRkv351176
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Sep 2022 16:33:27 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 28REXRPh351175;
	Tue, 27 Sep 2022 16:33:27 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 4/4] powerpc/code-patching: Use jump_label to check if poking_init() is done
Date: Tue, 27 Sep 2022 16:33:08 +0200
Message-Id: <8d6088aca7b63247377b6d9e4897d08d935fbe93.1647962456.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <cover.1647962456.git.christophe.leroy@csgroup.eu>
References: <cover.1647962456.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1664289185; l=1657; s=20211009; h=from:subject:message-id; bh=VpCvKObwtwt586zecmpLYRX0hNgaFguYgIynvmw/m08=; b=kT8iktDaTO4pQER95y0kfISPsXUCHdTEt8zdMLVh9Q+Ug2+sTLPJT5PHFJs61dIl0HCh74vY0E0U Z+VmuI4PCfnxu6nL6rutSs1td7mtU7CNWz7LavNjI//cZ2byXe/x
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It's only during early startup that poking_init() is not done yet,
for instance when calling ftrace_init().

Once poking_init() has been called there must be a poking area, no
need to check it everytime patch_instruction() is called.

ftrace activation time is reduced by 7% with the change on an 8xx.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/lib/code-patching.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index ab434c3853c9..8bd74bbe8b8d 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -79,6 +79,8 @@ static int text_area_cpu_down(unsigned int cpu)
 	return 0;
 }
 
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(poking_init_done);
+
 /*
  * Although BUG_ON() is rude, in this case it should only happen if ENOMEM, and
  * we judge it as being preferable to a kernel that will crash later when
@@ -89,6 +91,7 @@ void __init poking_init(void)
 	BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 		"powerpc/text_poke:online", text_area_cpu_up,
 		text_area_cpu_down));
+	static_branch_enable(&poking_init_done);
 }
 
 static unsigned long get_patch_pfn(void *addr)
@@ -176,7 +179,7 @@ static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
 	 * when text_poke_area is not ready, but we still need
 	 * to allow patching. We just do the plain old patching
 	 */
-	if (!this_cpu_read(text_poke_area))
+	if (!static_branch_likely(&poking_init_done))
 		return raw_patch_instruction(addr, instr);
 
 	local_irq_save(flags);
-- 
2.35.1

