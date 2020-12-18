Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1A32DE1DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 12:19:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cy5xC2Ht9zDqQS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 22:19:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cy5t40f53zDqXD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Dec 2020 22:17:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=iiyFH6uu; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4Cy5t26Wrlz9sWT; Fri, 18 Dec 2020 22:16:58 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Cy5t25CW8z9sWW; Fri, 18 Dec 2020 22:16:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1608290218;
 bh=g3E2dnr3u5+PC28sggfbdOd/QfaIV6OGrC7v+9QCqRw=;
 h=From:To:Cc:Subject:Date:From;
 b=iiyFH6uuYnDuL2OZ6i0kxKRVHf7KJA38LmaXJeL38XUbeBkdW9SJi9qw5d03gzvh0
 VLhmf9gzFRmZ18NpOXu3adZ1REWIo/h6jvtzh76CBgissOewL6beBHyqa0FAXsMxEE
 7IE5Z/ZFsQIBrdVdGfZDWu+eXTOLxLJgxVRF5v66lFRuZCpKGfrVHt5ZRgYA8efIIM
 DfJjPCMF1mqMMNtaq5Yy2XKpaxnq6mnuOhudMN8QDSM6EKYlYH5BajQ0dqzxvwZMWV
 /K513BQGFL0/OQN/S+OVSUphQe6NWjS7qTOasIWIJlq0O04HFDEPLxegtB+kB75d98
 /dmGft1P4I5+g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 1/3] powerpc/vdso: Block R_PPC_REL24 relocations
Date: Fri, 18 Dec 2020 22:16:17 +1100
Message-Id: <20201218111619.1206391-1-mpe@ellerman.id.au>
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
Cc: skirmisher@protonmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add R_PPC_REL24 relocations to the list of relocations we do NOT
support in the VDSO.

These are generated in some cases and we do not support relocating
them at runtime, so if they appear then the VDSO will not work at
runtime, therefore it's preferable to break the build if we see them.

Fixes: ab037dd87a2f ("powerpc/vdso: Switch VDSO to generic C implementation.")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/vdso32/Makefile | 2 +-
 arch/powerpc/kernel/vdso64/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
index 59aa2944ecae..6616f4e794d0 100644
--- a/arch/powerpc/kernel/vdso32/Makefile
+++ b/arch/powerpc/kernel/vdso32/Makefile
@@ -2,7 +2,7 @@
 
 # List of files in the vdso, has to be asm only for now
 
-ARCH_REL_TYPE_ABS := R_PPC_JUMP_SLOT|R_PPC_GLOB_DAT|R_PPC_ADDR32|R_PPC_ADDR24|R_PPC_ADDR16|R_PPC_ADDR16_LO|R_PPC_ADDR16_HI|R_PPC_ADDR16_HA|R_PPC_ADDR14|R_PPC_ADDR14_BRTAKEN|R_PPC_ADDR14_BRNTAKEN
+ARCH_REL_TYPE_ABS := R_PPC_JUMP_SLOT|R_PPC_GLOB_DAT|R_PPC_ADDR32|R_PPC_ADDR24|R_PPC_ADDR16|R_PPC_ADDR16_LO|R_PPC_ADDR16_HI|R_PPC_ADDR16_HA|R_PPC_ADDR14|R_PPC_ADDR14_BRTAKEN|R_PPC_ADDR14_BRNTAKEN|R_PPC_REL24
 include $(srctree)/lib/vdso/Makefile
 
 obj-vdso32 = sigtramp.o gettimeofday.o datapage.o cacheflush.o note.o getcpu.o
diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
index d365810a689a..bf363ff37152 100644
--- a/arch/powerpc/kernel/vdso64/Makefile
+++ b/arch/powerpc/kernel/vdso64/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # List of files in the vdso, has to be asm only for now
 
-ARCH_REL_TYPE_ABS := R_PPC_JUMP_SLOT|R_PPC_GLOB_DAT|R_PPC_ADDR32|R_PPC_ADDR24|R_PPC_ADDR16|R_PPC_ADDR16_LO|R_PPC_ADDR16_HI|R_PPC_ADDR16_HA|R_PPC_ADDR14|R_PPC_ADDR14_BRTAKEN|R_PPC_ADDR14_BRNTAKEN
+ARCH_REL_TYPE_ABS := R_PPC_JUMP_SLOT|R_PPC_GLOB_DAT|R_PPC_ADDR32|R_PPC_ADDR24|R_PPC_ADDR16|R_PPC_ADDR16_LO|R_PPC_ADDR16_HI|R_PPC_ADDR16_HA|R_PPC_ADDR14|R_PPC_ADDR14_BRTAKEN|R_PPC_ADDR14_BRNTAKEN|R_PPC_REL24
 include $(srctree)/lib/vdso/Makefile
 
 obj-vdso64 = sigtramp.o gettimeofday.o datapage.o cacheflush.o note.o getcpu.o
-- 
2.25.1

