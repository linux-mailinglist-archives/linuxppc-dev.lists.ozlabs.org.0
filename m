Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B891DC4EC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 03:52:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SCKf4JZQzDqmY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 11:52:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SC8D36m7zDqXJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 11:43:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49SC8C1jpJz9sV0;
 Thu, 21 May 2020 11:43:55 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 4/7] powerpc/dt_cpu_ftrs: Set current thread fscr bits
Date: Thu, 21 May 2020 11:43:38 +1000
Message-Id: <20200521014341.29095-5-alistair@popple.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200521014341.29095-1-alistair@popple.id.au>
References: <20200521014341.29095-1-alistair@popple.id.au>
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
Cc: mikey@neuling.org, npiggin@gmail.com, aneesh.kumar@linux.ibm.com,
 Alistair Popple <alistair@popple.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Setting the FSCR bit directly in the SPR only sets it during the initial
boot and early init of the kernel but not for the init process or any
subsequent kthreads. This is because the thread_struct for those is
copied from the current thread_struct setup at boot which doesn't
reflect any changes made to the FSCR during cpu feature detection. This
patch ensures the current thread state is updated to match once feature
detection is complete.

Signed-off-by: Alistair Popple <alistair@popple.id.au>
---
 arch/powerpc/kernel/dt_cpu_ftrs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index b5e21264d168..677190f70cac 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -170,6 +170,7 @@ static int __init feat_try_enable_unknown(struct dt_cpu_feature *f)
 		u64 fscr = mfspr(SPRN_FSCR);
 		fscr |= 1UL << f->fscr_bit_nr;
 		mtspr(SPRN_FSCR, fscr);
+		current->thread.fscr |= 1UL << f->fscr_bit_nr;
 	} else {
 		/* Does not have a known recipe */
 		return 0;
@@ -205,6 +206,7 @@ static int __init feat_enable(struct dt_cpu_feature *f)
 			u64 fscr = mfspr(SPRN_FSCR);
 			fscr |= 1UL << f->fscr_bit_nr;
 			mtspr(SPRN_FSCR, fscr);
+			current->thread.fscr |= 1UL << f->fscr_bit_nr;
 		}
 	}
 
-- 
2.20.1

