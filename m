Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 217108ACC5A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 13:53:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=M2XmR7Xb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNNtS5dWWz3dL8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 21:53:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=M2XmR7Xb;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNNsj0GN0z30Pn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 21:52:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713786757;
	bh=QJYC+OzoCGnkrtwmIJuy9V9t6l5NVkhqDdDz68X2FeM=;
	h=From:To:Subject:Date:From;
	b=M2XmR7XbEM2KDI5RZyvX62C36DIOFfQW4WnlR7bs34DsA+iIAVp6GxUUMsNtPJZvy
	 IPDUckSi95LhnZKzzUzgbwPtU9HXyc9sxG61sdxYPwrLjUoT93sIWCGk6TCuMHmgN3
	 BY9BB0W1tSIKjtZqlDpRjodXDv+hrXuGb6Cbv2pZ2uVnwn/Lo8U6wVXgu/SfqNuzfx
	 Q+s+bwRECQ7NcafsJpcdY/Ozpd33m8WgF1Me7Dn/qmf37O3J8vYudZrNSQRsv8AiA1
	 9Gme0dzFwhswh7NalAeaTsMvgseQZfZ7Z+20ZjcQW1RLclVnBYKuqYMngP3P638VSm
	 F9ZlSCt8Pnvig==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VNNsd0VC4z4wyh;
	Mon, 22 Apr 2024 21:52:37 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Mark memory_limit as initdata
Date: Mon, 22 Apr 2024 21:52:31 +1000
Message-ID: <20240422115231.1769984-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.44.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The `memory_limit` variable should only be used during boot, enforce
that by marking it initdata.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 3a440004b97d..12316ac66e7e 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -30,7 +30,7 @@
 
 #include <mm/mmu_decl.h>
 
-unsigned long long memory_limit;
+unsigned long long memory_limit __initdata;
 
 unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
 EXPORT_SYMBOL(empty_zero_page);
-- 
2.44.0

