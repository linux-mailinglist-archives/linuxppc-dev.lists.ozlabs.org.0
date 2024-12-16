Return-Path: <linuxppc-dev+bounces-4177-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 375F99F304C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 13:17:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBf8774qNz2yyD;
	Mon, 16 Dec 2024 23:17:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734351431;
	cv=none; b=EJncUiJqAbyz5yErt8B9RiHnmALxkt7+zZhGfiNhiqEnY7ADz0QqnV2JGkwvWLNfFPS7149rlJGXj3FQESY0+q0/NP3cz41orE6odzMGrN8iiMlmTfs5SgAaHpzVyMTSEsK2DK3TWskTiz5h7mZZtShIdYZ4wZRUEXB/9gP/R6EvczMsmMZxovWBOgYs+rGVjPTyHmjRV1LCxHzIRtuRD5grr7vDbIAiclccU36xcp7W9DdxIHUJ7k2H9bT75VH+L0568/NHjje2ao8KqbXvtI/GIRuMIeX50sIc/Wj1HgY+c9vfPwIurbM8MKG+BVy0oCZUNhyaTapgwTSvWsM+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734351431; c=relaxed/relaxed;
	bh=GN8KaB+dDNaEvl1+H2fNk5xqcnrHlBgkdVBb1FcEdAA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=SpXW9JaVOaGxfmENW0ixhALhkPpmSHsQ1vpG3az6IEpncrtiIKLdPXuXy5KAOEbmaIOZI/urisr/JzxKunxZVquCoP2KlNRmh+AJeRzHIlfDv+UgUo5qXPE7iuWCPVzNnfz8Mkk1aCAFrIGJ1HlFeTlUVvmdxG9pHOfkOOqE5x/C5Ek6h9Peyiig18MB3fRqap/XDnbZLKH3icgVS5+Ff4He1bwWdVNvZdAqFkkbXc7lPB2VpeeBJqiVISPTmQs2mAY+BXxv0u+/51ILRbtBslDFDRfTA62KinzIH+durk/AWl1C1tMoUkcGMJkqz5n+WPEJC1DliY+9Cxv6yBuGIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LakFXh4p; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LakFXh4p;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBf8545rrz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 23:17:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734351423;
	bh=GN8KaB+dDNaEvl1+H2fNk5xqcnrHlBgkdVBb1FcEdAA=;
	h=From:To:Subject:Date:From;
	b=LakFXh4p7+8p3oFibIlHIYa2VBitRiy5vODpat67vbk6xMu9kYRPNB8caZQA5F00J
	 0fpjtMsFc1AtDfXnXh6cM4yOOcRCNG2+ckedWk46xkkSAIObuZP2+PpLiOsohYskdE
	 di3vYCzMg+OgZoaO3zE0A/Iy9968Tzl4+pP69QDS/ZeQEAwWjCbiwGr1+lNUpYQ8sX
	 JWWiNBF2OyJ51YadvMPeD4YDCZ/UF/hHLDFfeR5baMjbl3vd5DzKJOPat3Z/V2ubF9
	 tkGj15bZzAyohTMyGyPdiq6/JCkfLvEIEQQvV9ArfuBZRvphdpifCwFIIcrDE8OOxq
	 qdOxYLtsDGgIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YBf7z5T8kz4wcD;
	Mon, 16 Dec 2024 23:17:03 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64: Use get_user() in start_thread()
Date: Mon, 16 Dec 2024 23:17:06 +1100
Message-ID: <20241216121706.26790-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.1
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

For ELFv1 binaries (big endian), the ELF entry point isn't the address
of the first instruction, instead it points to the function descriptor
for the entry point. The address of the first instruction is in the
function descriptor.

That means the kernel has to fetch the address of the first instruction
from user memory.

Because start_thread() uses __get_user(), which has no access_ok()
checks, it looks like a malicious ELF binary could be crafted to point
the entry point address at kernel memory. The kernel would load 8 bytes
from kernel memory into the NIP and then start the process, it would
typically crash, but a debugger could observe the NIP value which would
be the result of reading from kernel memory.

However that's NOT possible, because there is a check in
load_elf_binary() that ensures the ELF entry point is < TASK_SIZE
(look for BAD_ADDR(elf_entry)).

However it's fragile for start_thread() to rely on a check elsewhere,
even if the ELF parser is unlikely to ever drop the check that elf_entry
is a user address.

Make it more robust by using get_user(), which checks that the address
points at userspace before doing the load. If the address doesn't point
at userspace it will just set the result to zero, and the userspace
program will crash at zero (which is fine because it's self-inflicted).

Note that it's also possible for a malicious binary to have a valid
ELF entry address, but with the first instruction address pointing into
the kernel. However that's OK, because it is blocked by the MMU, just
like any other attempt to jump into the kernel from userspace.

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 7b739b9a91ab..ef91f71e07c4 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1960,8 +1960,8 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
 			 * address of _start and the second entry is the TOC
 			 * value we need to use.
 			 */
-			__get_user(entry, (unsigned long __user *)start);
-			__get_user(toc, (unsigned long __user *)start+1);
+			get_user(entry, (unsigned long __user *)start);
+			get_user(toc, (unsigned long __user *)start+1);
 
 			/* Check whether the e_entry function descriptor entries
 			 * need to be relocated before we can use them.
-- 
2.47.1


