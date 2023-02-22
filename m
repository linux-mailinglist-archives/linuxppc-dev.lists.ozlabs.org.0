Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B13B69EE8D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 07:01:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PM5Bl2HNRz3blJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 17:01:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=emcrCkZ4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PM59n2sMmz308w
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 17:00:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=emcrCkZ4;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PM59l38Dcz4x7j;
	Wed, 22 Feb 2023 17:00:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1677045643;
	bh=ujTkYsGUrS6XQ/KPlAV7Z8gIGIWLzcKwgnlcZYIW7u4=;
	h=From:To:Cc:Subject:Date:From;
	b=emcrCkZ4y05Gpezi+ZzwGO+rwJcpHlL8AV2OGQqqF7V4XRcAUEOmdnKnHKozSAULB
	 h5mwiUeGv8lc6dWSktrSNPzxnhdQCXxKr3hlgf9pu8Ka/IEqe5PvlS+5Ys8Ic4bOtZ
	 I8pf3K7MnUnTGdA8rgBH4pLjV7/R8MiZgjJoQ50vUGjvrMp+UOQDz/ZEIQLHtOKV8W
	 r6rNHCmIdJVQk8zbM8s5tSrwAE3stzyR+25186YaE9gFA6rguQcfVXPSPSMblD7RJh
	 qOA2sgu9RwiKncEcXFmYvIN6lc2VYHT9b2Tb1BHivwFMJVui5fi0nP2ND+Vrmk0GGw
	 2qM6k0FR6yq3g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/vmlinux.lds: Add .text.asan/tsan sections
Date: Wed, 22 Feb 2023 17:00:37 +1100
Message-Id: <20230222060037.2897169-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
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
Cc: nathan@kernel.org, ndesaulniers@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When KASAN/KCSAN are enabled clang generates .text.asan/tsan sections.
Because they are not mentioned in the linker script warnings are
generated, and when orphan handling is set to error that becomes a build
error, eg:

  ld.lld: error: vmlinux.a(init/main.o):(.text.tsan.module_ctor) is
  being placed in '.text.tsan.module_ctor' ld.lld: error:
  vmlinux.a(init/version.o):(.text.tsan.module_ctor) is being placed in
  '.text.tsan.module_ctor'

Fix it by adding the sections to our linker script, similar to the
generic change made in 848378812e40 ("vmlinux.lds.h: Handle clang's
module.{c,d}tor sections").

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/vmlinux.lds.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 958e77a24f85..7a2209767adf 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -125,6 +125,7 @@ SECTIONS
 		 * included with the main text sections, so put it by itself.
 		 */
 		*(.sfpr);
+		*(.text.asan.* .text.tsan.*)
 		MEM_KEEP(init.text)
 		MEM_KEEP(exit.text)
 	} :text
-- 
2.39.1

