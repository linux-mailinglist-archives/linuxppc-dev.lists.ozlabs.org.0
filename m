Return-Path: <linuxppc-dev+bounces-3-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2DF94E6B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 08:33:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LjEHKzJS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wj4TR1Lnzz2xpv;
	Mon, 12 Aug 2024 16:33:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LjEHKzJS;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wj4TR0dVqz2xPc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 16:33:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1723444395;
	bh=AV0M00mAcCykDbDYNv8qBM0JYNDUIXbTlB8Qk8AXdLA=;
	h=From:To:Subject:Date:From;
	b=LjEHKzJSy3qsklZQPMQgGCY+p7yw+r0I5PteX3gqqoolWzdFIcGNTtyMR+/a0GWVI
	 fpNA1f0bGzLFuaPmV629ztCsIk/OdXr5sSpOEK0ALkHQ2sPTRpj/dwoWKY3RtX3+2l
	 XwVoCMBn29pf9bMM84U/+ViUc+WdNd2p88JrXK01M6vACqRoTlrrYcGQLRd9yJIQKA
	 /IMQzHkPN4I1Xjpv6/vAdI/o9RXmuV1Yb4H5jgpx7opo5qDxA6ur3ekyj2GzL0vzbt
	 2hGQq4+2PYX3Py4RD4ik1dHXsjNYMokiLSznpAaTZFsFfvQ1rAX84Eecb7kGJSz5fP
	 gghkMm9fjXpIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wj4TQ6dLJz4w2R;
	Mon, 12 Aug 2024 16:33:14 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/modules: start/end_opd are only needed for ABI v1
Date: Mon, 12 Aug 2024 16:33:12 +1000
Message-ID: <20240812063312.730496-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The start_opd/end_opd members of struct mod_arch_specific are only
needed for kernels built using ELF ABI v1. Guard them with an ifdef to
save a little bit of space on ELF ABI v2 kernels.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/module.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/include/asm/module.h b/arch/powerpc/include/asm/module.h
index 300c777cc307..4819b2e7a916 100644
--- a/arch/powerpc/include/asm/module.h
+++ b/arch/powerpc/include/asm/module.h
@@ -35,9 +35,11 @@ struct mod_arch_specific {
 	bool toc_fixed;			/* Have we fixed up .TOC.? */
 #endif
 
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 	/* For module function descriptor dereference */
 	unsigned long start_opd;
 	unsigned long end_opd;
+#endif
 #else /* powerpc64 */
 	/* Indices of PLT sections within module. */
 	unsigned int core_plt_section;
-- 
2.45.2


