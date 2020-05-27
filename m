Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B55FB1E4724
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 17:17:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XDwB3vhDzDqTT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 01:17:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XDWJ5G2SzDqHW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 00:59:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=CQJkgLch; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49XDWC0R6Pz9sTY; Thu, 28 May 2020 00:59:19 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49XDWB05S1z9sTV; Thu, 28 May 2020 00:59:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590591558;
 bh=xwHXSW2WmdPsV01i/0H3mbEwnlHtfhLgd1eRL7/iGKk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CQJkgLchlzsNt1zo0Q3Nv+G/NAoSIaqfW/OKuSzUkCxn6L6XhVwttI32l+PudClQt
 hHYKoXXjDklMXeaaLXIKy4I/oDP+O3DGnWa1jDVGdGm33BmSGydPG1NDt+vfBAJH2t
 2EGAxc8pAY6wzIdfogCCD8P7O6x53CSQ7l41mBbZ9jR3KSxCYbI9gxOC5sg1C89z5V
 VuCEXo0SJM/HC4YnOkhztaGBkWsBzcGrKek+mmMcWZd4UUtYbQlY9Ad6+Ww1KZK264
 eUbufUmZSFDC3OCOylnmZ+JP/QEpNxzqPpFARr0leqqbeZx8m6tMc5x4mtq24uZ0jY
 1NJHFgTpU0GMw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [RFC PATCH 4/4] powerpc/64s: Don't set FSCR bits in INIT_THREAD
Date: Thu, 28 May 2020 00:58:43 +1000
Message-Id: <20200527145843.2761782-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200527145843.2761782-1-mpe@ellerman.id.au>
References: <20200527145843.2761782-1-mpe@ellerman.id.au>
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
Cc: alistair@popple.id.au, mikey@neuling.org, npiggin@gmail.com,
 jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since the previous commit that saves the value of FSCR configured at
boot into init_task.thread.fscr, the static initialisation in
INIT_THREAD now no longer has any effect.

So remove it.

For non DT CPU features, the end result is the same, because
__init_FSCR() is called on all CPUs that have an FSCR (Power8,
Power9), and it sets FSCR_TAR & FSCR_EBB.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/processor.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 4e53df163b92..52a67835057a 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -302,7 +302,6 @@ struct thread_struct {
 	.ksp = INIT_SP, \
 	.addr_limit = KERNEL_DS, \
 	.fpexc_mode = 0, \
-	.fscr = FSCR_TAR | FSCR_EBB \
 }
 #endif
 
-- 
2.25.1

