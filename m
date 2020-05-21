Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F9D1DC4E7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 03:47:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SCD61hXJzDqb9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 11:47:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SC885P5jzDqXJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 11:43:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49SC8812mTz9sTS;
 Thu, 21 May 2020 11:43:52 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/7] powerpc: Add new HWCAP bits
Date: Thu, 21 May 2020 11:43:35 +1000
Message-Id: <20200521014341.29095-2-alistair@popple.id.au>
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

POWER10 introduces two new architectural features - ISAv3.1 and matrix
multiply assist (MMA) instructions. Userspace detects the presence
of these features via two HWCAP bits introduced in this patch. These
bits have been agreed to by the compiler and binutils team.

According to ISAv3.1 MMA is an optional feature and software that makes
use of it should first check for availability via this HWCAP bit and use
alternate code paths if unavailable.

Signed-off-by: Alistair Popple <alistair@popple.id.au>
Tested-by: Michael Neuling <mikey@neuling.org>
---
 arch/powerpc/include/uapi/asm/cputable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/include/uapi/asm/cputable.h b/arch/powerpc/include/uapi/asm/cputable.h
index 540592034740..731b97dc2d15 100644
--- a/arch/powerpc/include/uapi/asm/cputable.h
+++ b/arch/powerpc/include/uapi/asm/cputable.h
@@ -50,6 +50,8 @@
 #define PPC_FEATURE2_DARN		0x00200000 /* darn random number insn */
 #define PPC_FEATURE2_SCV		0x00100000 /* scv syscall */
 #define PPC_FEATURE2_HTM_NO_SUSPEND	0x00080000 /* TM w/out suspended state */
+#define PPC_FEATURE2_ARCH_3_1		0x00040000 /* ISA 3.1 */
+#define PPC_FEATURE2_MMA		0x00020000 /* Matrix Multiply Assist */
 
 /*
  * IMPORTANT!
-- 
2.20.1

