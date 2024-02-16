Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6264857E2E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 14:56:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bYstjYEp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbtkZ3vHvz3vZk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Feb 2024 00:56:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bYstjYEp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tbtjq37Lpz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Feb 2024 00:55:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D4BC61FFB;
	Fri, 16 Feb 2024 13:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C1C3C433F1;
	Fri, 16 Feb 2024 13:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708091724;
	bh=JYRadvk8epVLTennqJxblFfin4HjDeQtbPYeVdFZkTc=;
	h=From:To:Cc:Subject:Date:From;
	b=bYstjYEpD43jdQrvSD9EDleeWQBd8QQ3QVGDGvKpPEQNlpsXc6iJA55H/CJFOsD9n
	 cPAaiLLKMOQ3+sH6TBYOIWjaUZQYLxDSdYc6qBSMmWU34M+0xFis417Xawxz9wKhMV
	 cC6yqKHucIo2a/LMRM1DPwMnr3BjNm4aB9sitOzfpTw5XBOFTsZCzoVwGckGN9tGVg
	 s4iUPran2WXVNXUTh0Rzoaz7sGHOBq5yZArA87Lpjgza3Sc1cv3k6/tOXzfpnjEQAc
	 nVbehF86OK3ddbZ6SlgoKgp+AfuELIE8bnHzL4qr0/fdqsvXNCMcHI5KjAlG02H5bf
	 k4T6qGglqjteA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	"Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: remove unused *_syscall_64.o variables in Makefile
Date: Fri, 16 Feb 2024 22:55:17 +0900
Message-Id: <20240216135517.2002749-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
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
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit ab1a517d55b0 ("powerpc/syscall: Rename syscall_64.c into
interrupt.c") missed to update these three lines:

  GCOV_PROFILE_syscall_64.o := n
  KCOV_INSTRUMENT_syscall_64.o := n
  UBSAN_SANITIZE_syscall_64.o := n

To restore the original behavior, we could replace them with:

  GCOV_PROFILE_interrupt.o := n
  KCOV_INSTRUMENT_interrupt.o := n
  UBSAN_SANITIZE_interrupt.o := n

However, nobody has noticed the functional change in the past three
years, so they were unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/powerpc/kernel/Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 2919433be355..72d1cd6443bc 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -191,9 +191,6 @@ GCOV_PROFILE_kprobes-ftrace.o := n
 KCOV_INSTRUMENT_kprobes-ftrace.o := n
 KCSAN_SANITIZE_kprobes-ftrace.o := n
 UBSAN_SANITIZE_kprobes-ftrace.o := n
-GCOV_PROFILE_syscall_64.o := n
-KCOV_INSTRUMENT_syscall_64.o := n
-UBSAN_SANITIZE_syscall_64.o := n
 UBSAN_SANITIZE_vdso.o := n
 
 # Necessary for booting with kcov enabled on book3e machines
-- 
2.40.1

