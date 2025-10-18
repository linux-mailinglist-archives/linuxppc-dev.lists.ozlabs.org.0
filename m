Return-Path: <linuxppc-dev+bounces-13043-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BAFBED6EE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Oct 2025 19:52:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cpq6D52h9z3cl3;
	Sun, 19 Oct 2025 04:52:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760809972;
	cv=none; b=ondxuwOfh4nC/vZLPVkDfmmfSGIg8ysnu9lBC0ywXGnEBc2/mfJ+44TYIyL45N8WqnBsro3n911XKzSLw1W1FpS+IS/B2CcewJnQH7OT1ylspZnETagmf9yXHy+d4hPfHVLuloAyHavg+dSshRQV/p9vsQeF+Gp8S7EJCGyDgyAGD7RQnddlXjBu6qQ4gC+ka6lsARe9qKHtPGUE5/cQ7agwvOoasINsKGIgBdDxzwqOAohDEV/ochsVsqw+USFB3XBmIylf15kEq00qzAkKzq0Ro17nAEa6dop9rfpKh5cclrtHQpNcYVH35a97D0jdi56kMGSmo8Jdv/keJl1A+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760809972; c=relaxed/relaxed;
	bh=Qy/eVGyIULz4L6WeUQU4lhR+JmpzkyGXuD8vwG/kVag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QEusp/qakgOaa9XdxlRzaseRF1sW+2rbUAs2D1goVK2/EkKqaqN9PjjyMB4Mv2/Kn/bPX1jydaHmoz1GdtZ8A8cXm9RIpOP6gfkFBsl2ZtRlYEOpZhIoy5iwdwtIB8UQGfWKS3J3bvlN6/NE9vE2aQgu/8xXZTOptNDXAqDM3LsZ8pePB7tHGqj+3uGAZvY8vfJimSWW9faXcuDev84qoAcGmXMZ7lWMaKCmrrbtdEqhc1mw7wK8BtPtEf8wacLLj+tvQLU/Ir1k1Wulg+v2c4eLlXrBH90/B8Xoqk30pziHxpEn0bpCSlYEwqe/5VjJMzUF+RlpU/6743oesrJYuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SpDZTuSP; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SpDZTuSP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cpq6B6pnMz3chb
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Oct 2025 04:52:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D68740BCA;
	Sat, 18 Oct 2025 17:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB00FC4CEF8;
	Sat, 18 Oct 2025 17:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760809968;
	bh=1cU9a8sYkJdXpA+th5ZVtswTz4K/NZYD/UAAtbUYJ+U=;
	h=From:Date:Subject:To:Cc:From;
	b=SpDZTuSP+5pSrV+mlBUpCRSnHMT8ygs4j7P+OAVfcrOdYhrJTaUsQJrUeQ63lEOvL
	 rTMPW0oivx51UJE1h05t3viz87Ugc8Bx+CgxnHSroY55WqTIZRLHPoNiwCNHxn2irt
	 HM2URobfxl6UbEMpvAU820qO3EGfen+lxjZxcMY5kO0MTJUNRlPXea3oiKrpC+6m2B
	 YvAg3iTsqZFhPsolw5FLaqlJuwCaSEfoFM3XK2EuoLkYPOfMxoezAfkHLmoAZoY4eK
	 cT8mTGhsCO+xUbav3WRKnD1JFNJZiRHr0/hEdVt6chPdWs+XSBQhogiuceaxdl+waG
	 jL+tFXSNrjLOw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sat, 18 Oct 2025 18:52:40 +0100
Subject: [PATCH] powerpc/vmlinux.lds: Drop .interp description
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-ppc-fix-lld-interp-v1-1-a083de6dccc9@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOfT82gC/x2MWwqAIBAArxL73YJrT7pK9CG61UKYaEQQ3j3pc
 2BmXkgchRNM1QuRb0ly+gJUV2B34zdGcYVBK92RohFDsLjKg8fhUPzFMSCZYbRNT9a1GkoYIhf
 jn85Lzh/fNNbHZAAAAA==
X-Change-ID: 20251018-ppc-fix-lld-interp-1a78c361cd42
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Vishal Chourasia <vishalc@linux.ibm.com>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1957; i=nathan@kernel.org;
 h=from:subject:message-id; bh=1cU9a8sYkJdXpA+th5ZVtswTz4K/NZYD/UAAtbUYJ+U=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBmfL7+9rfyrYIeMV1LFeq7Hez26xN0KX/1/aJe6wy/Vv
 iVNq+ZzRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjI76uMDO/d6zX5PimpfVPM
 vtyn8Wqxi/aZkgXp3nVcfzd09ksttGD4Z2h5svVzodO6T3eXcT5pjDxVbDxZRerHXuY3SyXcJD3
 LmQA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit da30705c4621 ("arch/powerpc: Remove .interp section in vmlinux")
intended to drop the .interp section from vmlinux but even with this
change, relocatable kernels linked with ld.lld contain an empty .interp
section, which ends up causing crashes in GDB [1].

  $ make -skj"$(nproc)" ARCH=powerpc LLVM=1 clean pseries_le_defconfig vmlinux

  $ llvm-readelf -S vmlinux | grep interp
    [44] .interp           PROGBITS        c0000000021ddb34 21edb34 000000 00   A  0   0  1

There appears to be a subtle difference between GNU ld and ld.lld when
it comes to discarding sections that specify load addresses [2].

Since '--no-dynamic-linker' prevents emission of the .interp section,
there is no need to describe it in the output sections of the vmlinux
linker script. Drop the .interp section description from vmlinux.lds.S
to avoid this issue altogether.

Link: https://sourceware.org/bugzilla/show_bug.cgi?id=33481 [1]
Link: https://github.com/ClangBuiltLinux/linux/issues/2137 [2]
Reported-by: Vishal Chourasia <vishalc@linux.ibm.com>
Closes: https://lore.kernel.org/20251013040148.560439-1-vishalc@linux.ibm.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/powerpc/kernel/vmlinux.lds.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index de6ee7d35cff..15850296c0a9 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -330,7 +330,6 @@ SECTIONS
 	}
 	.hash : AT(ADDR(.hash) - LOAD_OFFSET) { *(.hash) }
 	.gnu.hash : AT(ADDR(.gnu.hash) - LOAD_OFFSET) { *(.gnu.hash) }
-	.interp : AT(ADDR(.interp) - LOAD_OFFSET) { *(.interp) }
 	.rela.dyn : AT(ADDR(.rela.dyn) - LOAD_OFFSET)
 	{
 		__rela_dyn_start = .;

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251018-ppc-fix-lld-interp-1a78c361cd42

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


