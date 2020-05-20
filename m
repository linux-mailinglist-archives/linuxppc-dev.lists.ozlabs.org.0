Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 974F11DB2D8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 14:14:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RsBQ0h8vzDqXw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 22:14:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Rs872YXQzDqCG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 22:12:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=gJMb4QMA; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49Rs871Cnkz9sT3; Wed, 20 May 2020 22:12:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49Rs8704Mlz9sT6; Wed, 20 May 2020 22:12:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1589976759;
 bh=sWZkynpjj2XpXsW61wFCtWP7dIKIBmtpyVElc9Rz2C0=;
 h=From:To:Subject:Date:From;
 b=gJMb4QMAi6asjhl8BM6l6LC4em0MZRgiSRSLo/bUGaofL2z/llSUPBHfXBzjjvAwg
 SKS+hgnmU1cG8z8eITuRO61LmCyDyDgZgsRHqIFk6lbTiV64S4N77osUntN7NAA8OU
 EPyNDlJPvO8KEv9qItOgJI3bxzd8EGhij0m1xlwuq/MwtiW+iefG39yTcoZp5Fnh2l
 HvXV+Tg4qG/vYZP4h4IM8l5osj5b1Vw4nkTTBtabV3SYxzBAIM/W265itZTuF68xCP
 lbkVvcT2qSJ0bb7d6UIJPK/sndRWmsKZ3tYfry1u0pwXgrqD3l7C4jdsr7NAim5x9j
 3Xl7dgWoU2+FQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/configs/64s: Enable CONFIG_PRINTK_CALLER
Date: Wed, 20 May 2020 22:12:57 +1000
Message-Id: <20200520121257.961112-1-mpe@ellerman.id.au>
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

This adds the CPU or thread number to printk messages. This helps a
lot when deciphering concurrent oopses that have been interleaved.

Example output, of PID1 (T1) triggering a warning:

  [    1.581678][    T1] WARNING: CPU: 0 PID: 1 at crypto/rsa-pkcs1pad.c:539 pkcs1pad_verify+0x38/0x140
  [    1.581681][    T1] Modules linked in:
  [    1.581693][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.5.0-rc5-gcc-8.2.0-00121-gf84c2e595927-dirty #1515
  [    1.581700][    T1] NIP:  c000000000207d64 LR: c000000000207d3c CTR: c000000000207d2c
  [    1.581708][    T1] REGS: c0000000fd2e7560 TRAP: 0700   Not tainted  (5.5.0-rc5-gcc-8.2.0-00121-gf84c2e595927-dirty)
  [    1.581712][    T1] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 44000222  XER: 00040000

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/powernv_defconfig | 1 +
 arch/powerpc/configs/ppc64_defconfig   | 1 +
 arch/powerpc/configs/pseries_defconfig | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index df8bdbaa5d8f..2de9aadf0f50 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -347,3 +347,4 @@ CONFIG_KVM_BOOK3S_64=m
 CONFIG_KVM_BOOK3S_64_HV=m
 CONFIG_VHOST_NET=m
 CONFIG_PRINTK_TIME=y
+CONFIG_PRINTK_CALLER=y
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index bae8170d7401..57142a648ebd 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -358,6 +358,7 @@ CONFIG_CRYPTO_DEV_NX=y
 CONFIG_CRYPTO_DEV_NX_ENCRYPT=m
 CONFIG_CRYPTO_DEV_VMX=y
 CONFIG_PRINTK_TIME=y
+CONFIG_PRINTK_CALLER=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_STACK_USAGE=y
diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
index 0bea4d3ffb85..dfa4a726333b 100644
--- a/arch/powerpc/configs/pseries_defconfig
+++ b/arch/powerpc/configs/pseries_defconfig
@@ -322,3 +322,4 @@ CONFIG_KVM_BOOK3S_64=m
 CONFIG_KVM_BOOK3S_64_HV=m
 CONFIG_VHOST_NET=m
 CONFIG_PRINTK_TIME=y
+CONFIG_PRINTK_CALLER=y
-- 
2.25.1

