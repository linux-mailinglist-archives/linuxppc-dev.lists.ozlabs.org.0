Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C1A26D14F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 04:46:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsLvT4xNVzF0Ql
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 12:46:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsLt14zhfzDqFZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 12:45:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=M/0/5WAk; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BsLt13mnXz9sRf; Thu, 17 Sep 2020 12:45:13 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BsLt12wFMz9sSC; Thu, 17 Sep 2020 12:45:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1600310713;
 bh=nLKLfs/Omvdqn/uedAk2s8vG05NyP8YsjwWKkIL9Upc=;
 h=From:To:Subject:Date:From;
 b=M/0/5WAklRC2wiWfbzAsjfIeWWsP2cZAhWUYKwL9H9myn/6VfADObIl0IJeEBti2O
 OSedbFp11MEV04QOo3TLodzrS+iW2pbr5EB7VfDHaMefGXhj61lU/EgpClB0Xp09Fe
 24TwoYzLvfgzIzyQ5iMTrIF5KwGd+EvZXPssVIkWxwAoZHQnLzTK5Ri91xWr8Tj+AJ
 QgfXve96KFCG4gsKE3AcoQTZUpklglcKBzbMoieUL23EZiJFlvhl2vImdVCckIx0w9
 6MaWL84SyAjPcBGINry8hZ+LjSBF9th4o5msn/4wx89PXGh86StBzLOOLiLoQihpSs
 w45oGcjAWaROQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/process: Fix uninitialised variable error
Date: Thu, 17 Sep 2020 12:45:09 +1000
Message-Id: <20200917024509.3253837-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clang, and GCC with -Wmaybe-uninitialized, can't see that val is
unused in get_fpexec_mode():

  arch/powerpc/kernel/process.c:1940:7: error: variable 'val' is used
  uninitialized whenever 'if' condition is true
		  if (cpu_has_feature(CPU_FTR_SPE)) {
		      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

We know that CPU_FTR_SPE will only be true iff CONFIG_SPE is also
true, but the compiler doesn't.

Avoid it by initialising val to zero.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 532ed1900d37 ("powerpc/process: Remove useless #ifdef CONFIG_SPE")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 14d5189b17d8..d421a2c7f822 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1934,7 +1934,7 @@ int set_fpexc_mode(struct task_struct *tsk, unsigned int val)
 
 int get_fpexc_mode(struct task_struct *tsk, unsigned long adr)
 {
-	unsigned int val;
+	unsigned int val = 0;
 
 	if (tsk->thread.fpexc_mode & PR_FP_EXC_SW_ENABLE) {
 		if (cpu_has_feature(CPU_FTR_SPE)) {
-- 
2.25.1

