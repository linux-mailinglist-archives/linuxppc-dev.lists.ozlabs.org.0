Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF58170FEF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 06:01:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SgW56td5zDqtW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 16:01:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SgSs558szDqnT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 15:59:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=U+3vRKRG; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48SgSs2Qdbz9sPK; Thu, 27 Feb 2020 15:59:41 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48SgSs1lsJz9sR4; Thu, 27 Feb 2020 15:59:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582779581;
 bh=gzZcvjGtb+RMOgkmaZCJtDC240VazkRG8nq5VBFy4fU=;
 h=From:To:Cc:Subject:Date:From;
 b=U+3vRKRGFu+jrAGsUsnGf73G/h0nI4glOUKHPerTb7Gk49K3F0g6DSObGFKOGictY
 LC4QMiCm7IBsfz5iEeMkauLt2tqpsB5clZEGhuuclrZtkuj7rxNF7Nu4g4kufRXyg8
 XOQDRw+Ms7S25emTLBYVvL3var3MlEGSNVsOmgNXEWjUNwAdyNZcIPWtX9/hrR4ah7
 Zib8CxtG33R/Q1G0APk3+qVUcZpJK2tbl4chSM+UKNnFNPxd4r+A0a9hLYG1UGS8uk
 mTjuaXr0xyyGJzZMYjb+ZixYxKulUZmCEp0pHytSh/1y1ZQ3zi//DlBQEOGhxnQF/J
 hrLr4EwSNgsGw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 1/2] powerpc/vmlinux.lds: Explicitly retain .gnu.hash
Date: Thu, 27 Feb 2020 15:59:32 +1100
Message-Id: <20200227045933.22967-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
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
Cc: joel@jms.id.au, amodra@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Relocatable kernel builds produce a warning about .gnu.hash being an
orphan section:

  ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.hash'

If we try to discard it the build fails:

  ld -EL -m elf64lppc -pie --orphan-handling=warn --build-id -o
    .tmp_vmlinux1 -T ./arch/powerpc/kernel/vmlinux.lds --whole-archive
    arch/powerpc/kernel/head_64.o arch/powerpc/kernel/entry_64.o
    ...
    sound/built-in.a net/built-in.a virt/built-in.a --no-whole-archive
    --start-group lib/lib.a --end-group
  ld: could not find section .gnu.hash

So add an entry to explicitly retain it, as we do for .hash.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/vmlinux.lds.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index b4c89a1acebb..31a0f201fb6f 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -256,6 +256,7 @@ SECTIONS
 		*(.dynamic)
 	}
 	.hash : AT(ADDR(.hash) - LOAD_OFFSET) { *(.hash) }
+	.gnu.hash : AT(ADDR(.gnu.hash) - LOAD_OFFSET) { *(.gnu.hash) }
 	.interp : AT(ADDR(.interp) - LOAD_OFFSET) { *(.interp) }
 	.rela.dyn : AT(ADDR(.rela.dyn) - LOAD_OFFSET)
 	{
-- 
2.21.1

