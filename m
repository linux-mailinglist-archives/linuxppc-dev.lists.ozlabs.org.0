Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 124344161CC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 17:11:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFdsk66X4z307j
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 01:11:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UCykbEU+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=UCykbEU+; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFds43SChz2yPB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 01:10:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1632409843;
 bh=TdyE9zNPAOfAW2kaJiEUMeel/7RlDNhPokKT4pHBPr8=;
 h=From:To:Cc:Subject:Date:From;
 b=UCykbEU+RDtcFN6WunWkt2wXlH+9kQFUDEPtm15PwqUUrzGJomiL4LrqQwOdxrBoe
 tTWH4LuKZRgMXW/JlOq6rYk+mA5VsagOaOzMiYPuoIkjg41LTCtdgZqg9hyEjyE13X
 80wzMX2c55PujtdILmNqkQ/SqohbOPbJr2dujOh1qraO/qycLP1pQEEX3puSPreK+K
 Y+u6JN0woLJHP6kIKeE22biHDZBPfFdtFWALWY1PI5TjGObHo/hj25AefkUx6p+qzW
 4BTcH0gZgl3nnAbN1SUycHAGWFTlzM7ywikdOEhB1fOhVjPQUlPbrHY0Xd/Ud4A7B2
 B4ng1YbkMYVAg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HFdrw34ysz9sW5;
 Fri, 24 Sep 2021 01:10:40 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] KVM: PPC: Book3S HV: Use GLOBAL_TOC for
 kvmppc_h_set_dabr/xdabr()
Date: Fri, 24 Sep 2021 01:10:31 +1000
Message-Id: <20210923151031.72408-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: mikey@neuling.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kvmppc_h_set_dabr(), and kvmppc_h_set_xdabr() which jumps into
it, need to use _GLOBAL_TOC to setup the kernel TOC pointer, because
kvmppc_h_set_dabr() uses LOAD_REG_ADDR() to load dawr_force_enable.

When called from hcall_try_real_mode() we have the kernel TOC in r2,
established near the start of kvmppc_interrupt_hv(), so there is no
issue.

But they can also be called from kvmppc_pseries_do_hcall() which is
module code, so the access ends up happening with the kvm-hv module's
r2, which will not point at dawr_force_enable and could even cause a
fault.

With the current code layout and compilers we haven't observed a fault
in practice, the load hits somewhere in kvm-hv.ko and silently returns
some bogus value.

Note that we we expect p8/p9 guests to use the DAWR, but SLOF uses
h_set_dabr() to test if sc1 works correctly, see SLOF's
lib/libhvcall/brokensc1.c.

Fixes: c1fe190c0672 ("powerpc: Add force enable of DAWR on P9 option")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 90484425a1e6..30a8a07cff18 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1999,7 +1999,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
 	.globl	hcall_real_table_end
 hcall_real_table_end:
 
-_GLOBAL(kvmppc_h_set_xdabr)
+_GLOBAL_TOC(kvmppc_h_set_xdabr)
 EXPORT_SYMBOL_GPL(kvmppc_h_set_xdabr)
 	andi.	r0, r5, DABRX_USER | DABRX_KERNEL
 	beq	6f
@@ -2009,7 +2009,7 @@ EXPORT_SYMBOL_GPL(kvmppc_h_set_xdabr)
 6:	li	r3, H_PARAMETER
 	blr
 
-_GLOBAL(kvmppc_h_set_dabr)
+_GLOBAL_TOC(kvmppc_h_set_dabr)
 EXPORT_SYMBOL_GPL(kvmppc_h_set_dabr)
 	li	r5, DABRX_USER | DABRX_KERNEL
 3:
-- 
2.25.1

