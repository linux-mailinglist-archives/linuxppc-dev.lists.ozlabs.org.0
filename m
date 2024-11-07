Return-Path: <linuxppc-dev+bounces-2976-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EB79C03AA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 12:16:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkffR0Sf9z3bdj;
	Thu,  7 Nov 2024 22:16:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730978207;
	cv=none; b=hKM+myNqik/asK/5Bhb+s7PVMz/ZZ6UZ9iWvIvJdxuIvlOPArbv2/wnBUp1wP+ucXE18YGjWbmkfpJDJZ5FP5w6FBFDfQS/47BEntj2NwmwB8Ahc0Mg/F8yN9mn+nnr/qMzQjRcVDf2qVp8Pw0aXnQffmQidb1oQRsCep4qqUQRTjJxYfWgn43zUUYH4gcF1MwRBDEwHUk47N9+SXHh6O03216mUzYQbJciYWearacI8wIHQikPVCVK0OqTd8OFOJNz4rxybIPOr1TcrjB2YFk7jevs1r2u0Pqu92fGEjqfVKlrGoaUf8u17WDQxKzwvixBqwNAuaoaDUfrtm10UlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730978207; c=relaxed/relaxed;
	bh=hQwIr2Rl4epcCCtzI38xeQIq6RcKA3ikE/JHmSvIq2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l+H+wfIrA5/G3GB2UuFI/Q16RtSoZD/p60HBnvrqhIsRIu60p6zyqhgV14GdomhJxN4/p3sPvWMHE7x+XnsiI7Tof0j0f93HAm2goMTiVIaLiUIiT6wA2ytZLz/7PrCw9EIA4bHUNgK7LRAVcJYCjD/24kky+1JtE6iDiSkTYgyRCdMOsKeD4mIHyPPFyfIoHWfCglApKjK9vtlqWbWiw+ANSByBNRzNZqzJ3WgTpUgetbvY3WltswNiCicxP8IGepD+90egCbFLk8D9MaMj3IXtCH/PjycKAPUUqcOFznDD9Gs7+0nQj0Rswh/NvlYaWFArGCpw6PMUivoh6K4WKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bboYeFlT; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bboYeFlT;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkffP39sPz30f5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 22:16:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730978197;
	bh=hQwIr2Rl4epcCCtzI38xeQIq6RcKA3ikE/JHmSvIq2s=;
	h=From:To:Cc:Subject:Date:From;
	b=bboYeFlTGGwiC52fEjjLqBhYczSVWWGqes/3ueoLfPus+b6UPHTl7vLqMReNjPFDP
	 yIcthKfo8invjbIFROHXw2094cJxttgg03vfN+XHBVY6LaucHJOFHxyWo/FWKQHYkG
	 HEORzsisHqmIXO51fPq4m/TWvYRpzzRhzmunM7gu663JY3GyP/VvUw8UgFBOD6fj3c
	 6pHWZPUDHHoCiHka0Ai5Xx14dzIu71QeUhIF2ajhW0shS2A2H0w/Btitzgxp17u3DO
	 ohOKwjt9hcLyYPzAMssj/RmWjonx0x1Y0OiQUyyibqDXBDt20L3LyS5JNjUCNE2Nqp
	 v4g7gk/lJzDug==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XkffF4WLHz4wcj;
	Thu,  7 Nov 2024 22:16:37 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <naveen@kernel.org>,
	hbathini@linux.ibm.com
Subject: [PATCH] powerpc/ftrace: Fix ftrace bug with KASAN=y
Date: Thu,  7 Nov 2024 22:16:30 +1100
Message-ID: <20241107111630.31068-1-mpe@ellerman.id.au>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Booting a KASAN=y kernel with the recently added ftrace out-of-line
support causes a warning at boot:

  ------------[ cut here ]------------
  Stub index overflow (1729 > 1728)
  WARNING: CPU: 0 PID: 0 at arch/powerpc/kernel/trace/ftrace.c:209 ftrace_init_nop+0x408/0x444
  ...
  NIP ftrace_init_nop+0x408/0x444
  LR  ftrace_init_nop+0x404/0x444
  Call Trace:
    ftrace_init_nop+0x404/0x444 (unreliable)
    ftrace_process_locs+0x544/0x8a0
    ftrace_init+0xb4/0x22c
    start_kernel+0x1dc/0x4d4
    start_here_common+0x1c/0x20
  ...
  ftrace failed to modify
  [<c0000000030beddc>] _sub_I_65535_1+0x8/0x3c
   actual:   00:00:00:60
  Initializing ftrace call sites
  ftrace record flags: 0
   (0)
   expected tramp: c00000000008b418
  ------------[ cut here ]------------

The function in question, _sub_I_65535_1 is some sort of trampoline
generated for KASAN, and is in the .text.startup section. That section
is part of INIT_TEXT, meaning is_kernel_inittext() returns true for it.

But the script that determines how many out-of-line ftrace stubs are
needed isn't doesn't consider .text.startup as inittext, leading to
there not being enough space for the init stubs.

Conversely the logic to calculate how many stubs are needed for the text
section isn't filtering out the symbols in .text.startup and so ends up
over counting.

Fix both problems by calculating the total number of stubs first, then
the number that count as inittext, and then subtract the latter from the
former to get the count for the text section.

Fixes: eec37961a56a ("powerpc64/ftrace: Move ftrace sequence out of line")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/tools/ftrace-gen-ool-stubs.sh | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/tools/ftrace-gen-ool-stubs.sh b/arch/powerpc/tools/ftrace-gen-ool-stubs.sh
index 950a7778324b..bac186bdf64a 100755
--- a/arch/powerpc/tools/ftrace-gen-ool-stubs.sh
+++ b/arch/powerpc/tools/ftrace-gen-ool-stubs.sh
@@ -15,10 +15,11 @@ if [ -z "$is_64bit" ]; then
 	RELOCATION=R_PPC_ADDR32
 fi
 
-num_ool_stubs_text=$($objdump -r -j __patchable_function_entries "$vmlinux_o" |
-		     grep -v ".init.text" | grep -c "$RELOCATION")
+num_ool_stubs_total=$($objdump -r -j __patchable_function_entries "$vmlinux_o" |
+		      grep -c "$RELOCATION")
 num_ool_stubs_inittext=$($objdump -r -j __patchable_function_entries "$vmlinux_o" |
-			 grep ".init.text" | grep -c "$RELOCATION")
+			 grep -e ".init.text" -e ".text.startup" | grep -c "$RELOCATION")
+num_ool_stubs_text=$((num_ool_stubs_total - num_ool_stubs_inittext))
 
 if [ "$num_ool_stubs_text" -gt "$num_ool_stubs_text_builtin" ]; then
 	num_ool_stubs_text_end=$((num_ool_stubs_text - num_ool_stubs_text_builtin))
-- 
2.47.0


