Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 917771992A5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 11:46:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s4G00rwJzDqCV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 20:46:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48s4By0d41zDqxl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 20:43:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48s4Bx46Zkz9sTh;
 Tue, 31 Mar 2020 20:43:21 +1100 (AEDT)
From: Alistair Popple <alistair@popple.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Add new HWCAP bits
Date: Tue, 31 Mar 2020 20:42:47 +1100
Message-Id: <20200331094247.28976-1-alistair@popple.id.au>
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
Cc: mikey@neuling.org, Alistair Popple <alistair@popple.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Two new future architectural features requiring HWCAP bits are being
developed. Once allocated in the kernel firmware can enable these via
device tree cpu features.

Signed-off-by: Alistair Popple <alistair@popple.id.au>
---
 arch/powerpc/include/uapi/asm/cputable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/include/uapi/asm/cputable.h b/arch/powerpc/include/uapi/asm/cputable.h
index 540592034740..8888c6fe10b2 100644
--- a/arch/powerpc/include/uapi/asm/cputable.h
+++ b/arch/powerpc/include/uapi/asm/cputable.h
@@ -50,6 +50,8 @@
 #define PPC_FEATURE2_DARN		0x00200000 /* darn random number insn */
 #define PPC_FEATURE2_SCV		0x00100000 /* scv syscall */
 #define PPC_FEATURE2_HTM_NO_SUSPEND	0x00080000 /* TM w/out suspended state */
+#define PPC_FEATURE2_ARCH_3_10		0x00040000 /* ISA 3.10 */
+#define PPC_FEATURE2_MMA		0x00020000 /* Matrix Multiply Accumulate */
 
 /*
  * IMPORTANT!
-- 
2.20.1

