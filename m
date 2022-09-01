Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B59C65A95FC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 13:49:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJK8S5DjGz2xy4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 21:49:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJK811sslz2xZT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 21:49:02 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MJK7s1Bkmz9sp8;
	Thu,  1 Sep 2022 13:48:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zENmgUcEPJFI; Thu,  1 Sep 2022 13:48:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MJK7r70wRz9sp7;
	Thu,  1 Sep 2022 13:48:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DD8BF8B780;
	Thu,  1 Sep 2022 13:48:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id TIenZCy2TllG; Thu,  1 Sep 2022 13:48:56 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.131])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A3AA18B764;
	Thu,  1 Sep 2022 13:48:56 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 281BmkoS1768874
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 1 Sep 2022 13:48:46 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 281BmgEQ1768870;
	Thu, 1 Sep 2022 13:48:42 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        sv@linux.ibm.com, bgray@linux.ibm.com, agust@denx.de,
        jpoimboe@kernel.org, peterz@infradead.org, jbaron@akamai.com,
        rostedt@goodmis.org, ardb@kernel.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com
Subject: [PATCH v3 0/6] Implement inline static calls on PPC32 - v3
Date: Thu,  1 Sep 2022 13:48:19 +0200
Message-Id: <cover.1662032631.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1662032901; l=1870; s=20211009; h=from:subject:message-id; bh=GAgDRyI5Iv4v6NxY6e0q7Pc95r863rGYKNlkTCV4Iz4=; b=xIoTdQATVlMxl+qo3b8kowa0Ce1JnaXHUKOLiVoHMjZhqAH98kCIcW/VrJESaDkHweU7OcGCCuQ/ ZHZ5QlLlAZhSMhFyRCUfG3ew9RKhh2g10uAM5ujyxo71l437f4Kv
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
Cc: chenzhongjin@huawei.com, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series applies on top of the series v2 "objtool: Enable and
implement --mcount option on powerpc" [1]

A few modifications are done to core parts to enable powerpc
implementation:
- R_X86_64_PC32 is abstracted to R_REL32 so that it can then be
redefined as R_PPC_REL32.
- A call to static_call_init() is added to start_kernel() to avoid
every architecture to have to call it
- Trampoline address is provided to arch_static_call_transform() even
when setting a site to fallback on a call to the trampoline when the
target is too far.

[1] https://lore.kernel.org/all/20220829055223.24767-8-sv@linux.ibm.com/T/

This version of the series includes a preliminary patch (patch 1) that
should be squashed into Sathvika's series.

Christophe Leroy (6):
  Fixup for "objtool/powerpc: Add --mcount specific implementation"
  objtool: Add architecture specific R_REL32 macro
  init: Call static_call_init() from start_kernel()
  static_call_inline: Provide trampoline address when updating sites
  powerpc: Prepare arch_static_call_transform() for supporting inline
    static calls
  powerpc/static_call: Implement inline static calls

 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/include/asm/static_call.h        |  2 +
 arch/powerpc/kernel/static_call.c             | 58 ++++++++++++++-----
 arch/x86/kernel/static_call.c                 |  2 +-
 init/main.c                                   |  1 +
 kernel/static_call_inline.c                   |  2 +-
 tools/objtool/arch/powerpc/decode.c           | 39 +++++++++----
 tools/objtool/arch/powerpc/include/arch/elf.h |  1 +
 tools/objtool/arch/x86/include/arch/elf.h     |  1 +
 tools/objtool/check.c                         | 10 ++--
 tools/objtool/orc_gen.c                       |  2 +-
 11 files changed, 85 insertions(+), 34 deletions(-)

-- 
2.37.1

