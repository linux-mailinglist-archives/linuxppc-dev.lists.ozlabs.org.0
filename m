Return-Path: <linuxppc-dev+bounces-3750-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 702039E2C42
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 20:46:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2rkf01x8z30B3;
	Wed,  4 Dec 2024 06:46:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733255193;
	cv=none; b=Zsm9T0KNPl6fqtHLBtqiTqgvk2j7F4UZ8ergaO29mUs8P3F/638nF3i42AAcmx1zChDwaOfkD3mU/xLnJ7GuqIu84HxqujeFHbt3lxQ7d5D0hAokjgO+MOnP6KNokwH6PSdwSQRKGUt71Utg/jWGtFkYKqEilNQZ+b/4BY2+kVdh6NZd4TltC4vrLdYO9Fp9qBWgvNtsNXU+vErKUB0vJHCTN5amSLMzTFGhnDbqi9+Y2hsksnSJUB66JbXUGkz4u5BWUneUpxLQVYnHuLroKy6c3j+O6fkCrCPbywmD771/vaV55aVmhGf6vChu7W6b5HbLs8HjhvYE19I2wagGWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733255193; c=relaxed/relaxed;
	bh=79npd1aF/KTGlypXxm6vBi9nOaBJBfPBsOdeoSyKsxE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XzLU0zzm6oysvIrIXgH7HRdUtfdjnkOcKRwXzG+AGe0ur9EO2TnNfZua79vd6m6W8HmMKA4t9rVPeMhUS0542GSo3DKXsuHsbWAAWvBqxtgxja7Nnvdvy7xi6yaPxVgPhyf1hcYMhZhQhX4wbhGiaRGFIIVjLK/Zh9PvoU88MhxYyVTphesj8b9Rw5r4nvO3idB/5TRrJiRCmLgSBrP4V5Wdrkg7nzSqhRQwTemcedwzp+ia9VsbFJ/jQrfwKylqiNkbuhH85uMQKOi6igdkswd64JfhWJZj21puITkkJIjd0x57jg6X3RgDIOEuti2QFdSETyeJUfg8Y34wAeEMkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2rkc1dzjz2yGT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 06:46:30 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y2rkS3ybwz9stF;
	Tue,  3 Dec 2024 20:46:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kjPAPZv7yfh5; Tue,  3 Dec 2024 20:46:24 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y2rkS34dCz9stD;
	Tue,  3 Dec 2024 20:46:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4FAB58B767;
	Tue,  3 Dec 2024 20:46:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id rIwxW3CFzOGj; Tue,  3 Dec 2024 20:46:24 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 83D368B763;
	Tue,  3 Dec 2024 20:46:23 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 0/4] Implement inline static calls on PPC32 - v4
Date: Tue,  3 Dec 2024 20:44:48 +0100
Message-ID: <cover.1733245362.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733255162; l=1638; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Jx62nYcMSTwvdKtKDQNerCZbsnNhCFz68IobPQVAdEA=; b=Vaz4d+v6txV/Q+bQM6mS4v2BNnSdLmi67e1D6FDiWHRGOLGgf/e+1G1Osrdd2/be5z+h07qO1 XoMzrV3t+WDBOTVvXC6nevltX7m2NOqd/ue3f+ZFR8JSDWnvI0Pw+pu
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This series implements inline static calls on PPC32.

First patch adds to static_call core the ability to pass the
trampoline address at the same time as the site address to
arch_static_call_transform() so that it can fallback on branching to
the trampoline when the site is too far (Max distance for direct
branch is 32 Mbytes on powerpc).

Second patch adds support for decoding all types of uncond branches.

Third patch rearranges function arch_static_call_transform() to ease
implementation of inline static call in following patch.

Last patch implements inline static calls on PPC32: This is done by:
- Put a 'bl' to the destination function ('b' if tail call)
- Put a 'nop' when the destination function is NULL ('blr' if tail call)
- Put a 'li r3,0' when the destination is the RET0 function and not
a tail call.

If the destination is too far (over the 32Mb limit), go via the
trampoline thanks to patch 1.

Christophe Leroy (4):
  static_call_inline: Provide trampoline address when updating sites
  objtool/powerpc: Add support for decoding all types of uncond branches
  powerpc: Prepare arch_static_call_transform() for supporting inline
    static calls
  powerpc/static_call: Implement inline static calls

 arch/powerpc/Kconfig                   |  1 +
 arch/powerpc/include/asm/static_call.h |  2 +
 arch/powerpc/kernel/static_call.c      | 58 +++++++++++++++++++-------
 arch/x86/kernel/static_call.c          |  2 +-
 kernel/static_call_inline.c            |  2 +-
 tools/objtool/arch/powerpc/decode.c    |  8 +++-
 6 files changed, 55 insertions(+), 18 deletions(-)

-- 
2.47.0


