Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D70F7174CEC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Mar 2020 12:20:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48VgmG1Y1zzDrBZ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Mar 2020 22:19:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48VgjG0FqrzDr27
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Mar 2020 22:17:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=VoLyyb3y; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48VgjF0SjCz9sSH; Sun,  1 Mar 2020 22:17:21 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48VgjD5sL8z9sSN; Sun,  1 Mar 2020 22:17:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1583061440;
 bh=qhGWyD9QsaBlCnugcP/p7zOWxeSIYqLN+TGTmLkrm7w=;
 h=From:To:Subject:Date:From;
 b=VoLyyb3yggwXmct7mu2CQPUlsnl9+j5+w/WKJmtXXi09KHQsRp8jX++nwjv6Xy3op
 qaZRvI6iEmmQXTOVB/gLGL95swqfLskJ4wfjR7yRarZbF2jSbWxJH08Y6CWGPUakO2
 Tci7dTJoeP15cdEpa7m+lzS3yX2aGCbddwTKgeEs5ZWEbTkx54kAl+T3ztHNuWgZwP
 83Z1SkK9HzRZmIKq192oUykVliFRakZefrbBHKEMkYSETYJObDy1Kl3ezMmbu2cyIi
 0KBisrvLT84HeoQo/WKdf+uDM3Xfp1yHAUzs0dGCKurJFKQ88MQeJeHwK/z8QESJXD
 iXD9fyN0uRSIw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 1/2] powerpc: fix hardware PMU exception bug on PowerVM
 compatibility mode systems
Date: Sun,  1 Mar 2020 22:17:16 +1100
Message-Id: <20200301111717.22236-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>

PowerVM systems running compatibility mode on a few Power8 revisions are
still vulnerable to the hardware defect that loses PMU exceptions arriving
prior to a context switch.

The software fix for this issue is enabled through the CPU_FTR_PMAO_BUG
cpu_feature bit, nevertheless this bit also needs to be set for PowerVM
compatibility mode systems.

Fixes: 68f2f0d431d9ea4 ("powerpc: Add a cpu feature CPU_FTR_PMAO_BUG")
Signed-off-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>
Reviewed-by: Leonardo Bras <leonardo@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20200227134715.9715-1-desnesn@linux.ibm.com
---
 arch/powerpc/kernel/cputable.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index e745abc5457a..245be4fafe13 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -2193,11 +2193,13 @@ static struct cpu_spec * __init setup_cpu_spec(unsigned long offset,
 		 * oprofile_cpu_type already has a value, then we are
 		 * possibly overriding a real PVR with a logical one,
 		 * and, in that case, keep the current value for
-		 * oprofile_cpu_type.
+		 * oprofile_cpu_type. Futhermore, let's ensure that the
+		 * fix for the PMAO bug is enabled on compatibility mode.
 		 */
 		if (old.oprofile_cpu_type != NULL) {
 			t->oprofile_cpu_type = old.oprofile_cpu_type;
 			t->oprofile_type = old.oprofile_type;
+			t->cpu_features |= old.cpu_features & CPU_FTR_PMAO_BUG;
 		}
 	}
 
-- 
2.21.1

