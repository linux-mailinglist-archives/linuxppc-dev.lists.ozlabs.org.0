Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FD559AF0D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 18:53:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M94SL68Sjz3cDs
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Aug 2022 02:53:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=FVi2J+uu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=210.131.2.78; helo=conuserg-11.nifty.com; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=FVi2J+uu;
	dkim-atps=neutral
Received: from conuserg-11.nifty.com (conuserg-11.nifty.com [210.131.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M94Rf1H93z3br0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Aug 2022 02:52:29 +1000 (AEST)
Received: from localhost.localdomain (133-32-182-133.west.xps.vectant.ne.jp [133.32.182.133]) (authenticated)
	by conuserg-11.nifty.com with ESMTP id 27KGpWBs018639;
	Sun, 21 Aug 2022 01:51:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 27KGpWBs018639
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1661014293;
	bh=Ih0ALdpIOTPB/Sn1mTKqVFaEpGzX4IPJIL6cfPyzDKs=;
	h=From:To:Cc:Subject:Date:From;
	b=FVi2J+uumSNsnyLx9bZCiOYwoPHt/3iuaKCxmj+L45yQLp8Few4zQXDsMj8nbB+D8
	 OfxNWScobUfm6Bjk4hyYlUI+nLy/7vn4Ewxkc1rDB7WJoSJSZHduwmgSUZmKt2aNdp
	 Z3rl9YdgbrKpJKPh6lENFt0S5u9GMu+SUA91vlck3West0dP7VmLXtGqH7DlwQwu9q
	 o78aD71BhLu5BM674qeSYAbY4KolOrxj7d3ZpKCbqd6VIc+3ae4zxT4pdSbj0mXZO0
	 LJgahdxAb2Lu+X5/zrqEIoLfGuprgLmil3BCtHORam/upm97d9F+qCC3tWKc1iwPO4
	 vAYRT5uIZKiKg==
X-Nifty-SrcIP: [133.32.182.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: align syscall table for ppc32
Date: Sun, 21 Aug 2022 01:51:29 +0900
Message-Id: <20220820165129.1147589-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy reported that commit 7b4537199a4a ("kbuild: link
symbol CRCs at final link,  removing CONFIG_MODULE_REL_CRCS") broke
mpc85xx_defconfig + CONFIG_RELOCATABLE=y.

    LD      vmlinux
    SYSMAP  System.map
    SORTTAB vmlinux
    CHKREL  vmlinux
  WARNING: 451 bad relocations
  c0b312a9 R_PPC_UADDR32     .head.text-0x3ff9ed54
  c0b312ad R_PPC_UADDR32     .head.text-0x3ffac224
  c0b312b1 R_PPC_UADDR32     .head.text-0x3ffb09f4
  c0b312b5 R_PPC_UADDR32     .head.text-0x3fe184dc
  c0b312b9 R_PPC_UADDR32     .head.text-0x3fe183a8
      ...

The compiler emits a bunch of R_PPC_UADDR32, which is not supported by
arch/powerpc/kernel/reloc_32.S.

The reason is there exists an unaligned symbol.

  $ powerpc-linux-gnu-nm -n vmlinux
    ...
  c0b31258 d spe_aligninfo
  c0b31298 d __func__.0
  c0b312a9 D sys_call_table
  c0b319b8 d __func__.0

Commit 7b4537199a4a is not the root cause. Even before that, I can
reproduce the same issue for mpc85xx_defconfig + CONFIG_RELOCATABLE=y
+ CONFIG_MODVERSIONS=n.

It is just that nobody did not notice it because when CONFIG_MODVERSIONS
is enabled, a __crc_* symbol inserted before sys_call_table was hiding
the unalignment issue.

I checked the commit history, but I could not understand commit
46b45b10f142 ("[POWERPC] Align the sys_call_table").

It said 'Our _GLOBAL macro does a ".align 2" so the alignment is fine
for 32 bit'. I checked the _GLOBAL in include/asm-powerpc/ppc_asm.h
at that time. _GLOBAL specifies ".align 2" for ppc64, but no .align
for ppc32.

Commit c857c43b34ec ("powerpc: Don't use a function descriptor for
system call table") removed _GLOBAL from the syscall table.

Anyway, adding alignment to the syscall table for ppc32 fixes the issue.

I am not giving Fixes tag because I do not know since when it has been
broken, but presumably it has been for a long while.

Link: https://lore.kernel.org/lkml/38605f6a-a568-f884-f06f-ea4da5b214f0@csgroup.eu/
Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/powerpc/kernel/systbl.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/systbl.S b/arch/powerpc/kernel/systbl.S
index cb3358886203..6c1db3b6de2d 100644
--- a/arch/powerpc/kernel/systbl.S
+++ b/arch/powerpc/kernel/systbl.S
@@ -18,6 +18,7 @@
 	.p2align	3
 #define __SYSCALL(nr, entry)	.8byte entry
 #else
+	.p2align	2
 #define __SYSCALL(nr, entry)	.long entry
 #endif
 
-- 
2.34.1

