Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7451B53BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 06:43:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4974Rv05MXzDr48
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 14:43:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4974Q41t9VzDqyp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 14:41:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4974Q31Llkz9sSx;
 Thu, 23 Apr 2020 14:41:31 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc: dt_cpu_ftrs: Set current thread fscr bits
Date: Thu, 23 Apr 2020 14:40:56 +1000
Message-Id: <20200423044057.5517-1-alistair@popple.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: mikey@neuling.org, oohall@gmail.com, npiggin@gmail.com,
 Alistair Popple <alistair@popple.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Setting the FSCR bit directly in the SPR only sets it for the initial
boot and early init of the kernel. When the init process is started it
gets copied from the current thread_struct which does not reflect any
changes made during CPU feature detection. This patch ensures the
current thread_struct state is updated to match FSCR after feature
detection is complete.

Signed-off-by: Alistair Popple <alistair@popple.id.au>
---
 arch/powerpc/kernel/dt_cpu_ftrs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 36bc0d5c4f3a..dede8f0b678f 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -169,6 +169,7 @@ static int __init feat_try_enable_unknown(struct dt_cpu_feature *f)
 		u64 fscr = mfspr(SPRN_FSCR);
 		fscr |= 1UL << f->fscr_bit_nr;
 		mtspr(SPRN_FSCR, fscr);
+		current->thread.fscr |= 1UL << f->fscr_bit_nr;
 	} else {
 		/* Does not have a known recipe */
 		return 0;
@@ -204,6 +205,7 @@ static int __init feat_enable(struct dt_cpu_feature *f)
 			u64 fscr = mfspr(SPRN_FSCR);
 			fscr |= 1UL << f->fscr_bit_nr;
 			mtspr(SPRN_FSCR, fscr);
+			current->thread.fscr |= 1UL << f->fscr_bit_nr;
 		}
 	}
 
-- 
2.20.1

