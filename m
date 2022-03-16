Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA6B4DAB9E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 08:12:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJM0l4rybz3cbV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 18:12:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LgPd0H/C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LgPd0H/C; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJLr40lH6z3bf0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 18:04:52 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6C1606112F;
 Wed, 16 Mar 2022 07:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B164EC36AE3;
 Wed, 16 Mar 2022 07:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647414289;
 bh=a1P2DNQDu+Nr0wIsMe45GFTAoBbxFKExa639SNMT8Ac=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LgPd0H/CgAWrDa1r6V53xbwnOApkexZkCZrfY+9Anm67m/JBXCD8lcjanyRL64Ppd
 QXZc6ovx7MD/aWmVbdzsO48tXypXLMMK2cWjpIib1cT/GXwnNK8Nn/rnCmSw3amNbr
 DP0j/M/jjdTvKABOKUP2KgiSx66XlMucJT9wrMq/3alMD0BgFxBh31R4rA1MCeGqdZ
 maMic0O5dv/tk2cHByy5DPEDsBclItk+BQfdNUc0GirxZygxc8yjkVCSTPC45KeWlX
 TLiOzBX03oPft9KwUSlV2n/RkiN+X5oWXw0RlQ++mkE2319ChO/7TBx2F/pgXGdWUL
 ioVnB7G2ibpbw==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, hch@lst.de
Subject: [PATCH V8 13/20] riscv: compat: process: Add UXL_32 support in
 start_thread
Date: Wed, 16 Mar 2022 15:03:10 +0800
Message-Id: <20220316070317.1864279-14-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316070317.1864279-1-guoren@kernel.org>
References: <20220316070317.1864279-1-guoren@kernel.org>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, heiko@sntech.de,
 linux-parisc@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Guo Ren <guoren@linux.alibaba.com>

If the current task is in COMPAT mode, set SR_UXL_32 in status for
returning userspace. We need CONFIG _COMPAT to prevent compiling
errors with rv32 defconfig.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/kernel/process.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 03ac3aa611f5..8c7665481a9f 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -97,6 +97,15 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	}
 	regs->epc = pc;
 	regs->sp = sp;
+
+#ifdef CONFIG_64BIT
+	regs->status &= ~SR_UXL;
+
+	if (is_compat_task())
+		regs->status |= SR_UXL_32;
+	else
+		regs->status |= SR_UXL_64;
+#endif
 }
 
 void flush_thread(void)
-- 
2.25.1

