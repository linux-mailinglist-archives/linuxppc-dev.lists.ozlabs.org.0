Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE042DA6D4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 04:31:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cw3gq24yGzDqN1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 14:31:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cw3dg0BCtzDqMf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 14:29:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=YXr9wTd8; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4Cw3df5kH4z9sSC; Tue, 15 Dec 2020 14:29:10 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Cw3df4vv1z9sTL; Tue, 15 Dec 2020 14:29:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1608002950;
 bh=51HQqD+LFXc1awO15HMTfrlKXfR/56aQ965FGFAbY44=;
 h=From:To:Cc:Subject:Date:From;
 b=YXr9wTd8GA/hgTGEGrZTq9JTJPPL+O9rs8QDlTEMbkU3SysborVGWP75mMI7aj2T4
 zYXwHZoxDHFPflpq/3iOhiSvLc+eGG7WrYpKdB9MxJrLD932MXZJd3wIrrKFJFQbPy
 dYwB2+j+4i8LuWeXwwWVcmpcAoE3+ozF0h7P6ZwN9GgqSfFRO+4BMVkqekUjTKTD6f
 I3LSc0Xb4DR1v/ETGphbeiJlfpvhSCnHCILgl206cfiPQniJpDeOaNp3sh3CbWOTON
 HealgboC8TJyf7660tRfy3VruacOOQwv2V4Vnv2ud/Hj/cjleFbEKEYTn3CayIUS5r
 vkjFl9v3opHSg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: masahiroy@kernel.org
Subject: [PATCH] powerpc/boot: Fix build of dts/fsl
Date: Tue, 15 Dec 2020 14:29:06 +1100
Message-Id: <20201215032906.473460-1-mpe@ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The lkp robot reported that some configs fail to build, for example
mpc85xx_smp_defconfig, with:

  cc1: fatal error: opening output file arch/powerpc/boot/dts/fsl/.mpc8540ads.dtb.dts.tmp: No such file or directory

This bisects to:
  cc8a51ca6f05 ("kbuild: always create directories of targets")

Although that commit claims to be about in-tree builds, it somehow
breaks out-of-tree builds. But presumably it's just exposing a latent
bug in our Makefiles.

We can fix it by adding to targets for dts/fsl in the same way that we
do for dts.

Fixes: cc8a51ca6f05 ("kbuild: always create directories of targets")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/boot/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 68a7534454cd..c3e084cceaed 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -372,6 +372,8 @@ initrd-y := $(filter-out $(image-y), $(initrd-y))
 targets	+= $(image-y) $(initrd-y)
 targets += $(foreach x, dtbImage uImage cuImage simpleImage treeImage, \
 		$(patsubst $(x).%, dts/%.dtb, $(filter $(x).%, $(image-y))))
+targets += $(foreach x, dtbImage uImage cuImage simpleImage treeImage, \
+		$(patsubst $(x).%, dts/fsl/%.dtb, $(filter $(x).%, $(image-y))))
 
 $(addprefix $(obj)/, $(initrd-y)): $(obj)/ramdisk.image.gz
 
-- 
2.25.1

