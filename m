Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BF758CDCE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 20:42:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1lRc4g9lz3bcv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 04:42:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=e3FwJCeJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--ndesaulniers.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3w1jxygwkdfgd34i0kbd84hi6ee6b4.2ecb8dknff2-34lb8iji.epb01i.eh6@flex--ndesaulniers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=e3FwJCeJ;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1lQd1BnMz3br0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Aug 2022 04:41:11 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id k13-20020a056902024d00b0066fa7f50b97so7980407ybs.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Aug 2022 11:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:list-id:message-id:mime-version:precedence
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=+zebX/pBopRwVmMorUsrI8UWP5H1KkWynBhP3zOcYMQ=;
        b=e3FwJCeJbUIdlbKz7JSvCfjm9lSSS/pkpcls+3lrKoIJRskKpWAGMesEL+HLvHDsjb
         vSqZbU/zCvyhjp6VDoDqZbcBeX5/vwz4/EyDOKJ59Jwf4XA7bV5JNby+oHBsfpX1VPxp
         cfW8tkjbrh09JnlxJfOT3+GUBVkeckiSQ2d1+TfT0jhhca7ZLaDoSD1yPRmC6oHjyB3U
         HiHIjP3DhLKCEdVexqLsR5LXgdo/YlFwazW3nifV9L/pDqDAhiAMgBBbdsqOIp6h47Kg
         JnzU27MvzT3sLCXHhef2SZGVXYqvxpOrNrs/61Ld6XvctQcxrb/abjHWozGYHVvUPTVd
         3Rtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:list-id:message-id:mime-version
         :precedence:references:subject:from:to:cc:content-transfer-encoding;
        bh=+zebX/pBopRwVmMorUsrI8UWP5H1KkWynBhP3zOcYMQ=;
        b=YjZ/qJul1ivqbHzzZYefEgY1wzqGClg9/T1WNBlDOIaqL7IL6wOPlM/UOfTCxTAKrN
         JKZTpM+HYmlTV6LjLjNXTXSKX0pqxtfpVxQ+nsfsK4jbmT79MlSCaJPs9LVAQoIcyMSW
         NNs/1XZ2/MviTVne4+h60996ENle3QyYjF6B+ehPuZkSL2xJ/hih8kFiwOrEkke3vxBb
         4zWV95qPWs7ensBX2L/7YNlzm7E60YQEzbNc+5zC5NgWq2VXT3ridvD+S2EFOkiFjzD8
         n216kyiHmNxfr+1pSH+Id5iJkzUmslfTpDCtQ+kvv585UyUHAUQR4aenEJLD27iB2Tkx
         9Dag==
X-Gm-Message-State: ACgBeo2/TOs3rIupz/GqrU3XrFNtSSFPizaCKvbQv01tjrJeexC/V9t8
	XkrJhK9IVKogBFYUvKi3xANdoapwVQz02TIpGjM=
X-Google-Smtp-Source: AA6agR4177LNYzKQ7Vj5bjrVs6VdlvEvQ/erWBoPOLGG5goE2UScc9gpV4eVHEyUusLo4FHqNFgDM8JXYl6Tq47b6C0=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:88f6:faa7:16e5:a8d5])
 (user=ndesaulniers job=sendgmr) by 2002:a81:be0a:0:b0:329:74c3:b7e6 with SMTP
 id i10-20020a81be0a000000b0032974c3b7e6mr11105717ywn.491.1659984067578; Mon,
 08 Aug 2022 11:41:07 -0700 (PDT)
Date: Mon,  8 Aug 2022 11:41:00 -0700
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
Message-Id: <96f53c237316dab4b1b8c682685266faa92da816.1652074503.git.christophe.leroy@csgroup.eu>
Mime-Version: 1.0
Precedence: bulk
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18]) by
 smtp.lore.kernel.org (Postfix) with ESMTP id 0F42CC41535 for
 <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:47:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand id
 S235398AbiEIFtU (ORCPT <rfc822;linux-kernel@archiver.kernel.org>); Mon, 9 May
 2022 01:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49550 "EHLO
 lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S235012AbiEIFqk (ORCPT <rfc822;linux-kernel@vger.kernel.org>); Mon,
 9 May 2022 01:46:40 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10]) by
 lindbergh.monkeyblade.net (Postfix) with ESMTPS id 273F815E746 for
 <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:42:46 -0700 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67]) by localhost
 (Postfix) with ESMTP id 4KxVKb6ZH6z9sW5; Mon,  9 May 2022 07:36:51 +0200 (CEST)
Received: from pegase2.c-s.fr ([172.26.127.65]) by localhost (pegase2.c-s.fr
 [127.0.0.1]) (amavisd-new, port 10024) with ESMTP id 3P-IuZ94XPXD; Mon,  9
 May 2022 07:36:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192]) by
 pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF6Mvxz9sW9; Mon,  9 May 2022
 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by messagerie.si.c-s.fr
 (Postfix) with ESMTP id D126A8B774; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr ([127.0.0.1]) by localhost
 (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023) with ESMTP id
 62giFMHnIRrU; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108]) by
 messagerie.si.c-s.fr (Postfix) with ESMTP id 880A58B799; Mon,  9 May 2022
 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1]) by
 PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aUjE1591251
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT); Mon, 9
 May 2022 07:36:30 +0200
Received: (from chleroy@localhost) by PO20335.IDSI0.si.c-s.fr
 (8.17.1/8.17.1/Submit) id 2495aU4U1591250; Mon, 9 May 2022 07:36:30 +0200
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1659984060; l=261117;
 i=ndesaulniers@google.com; s=20211004; h=from:subject:message-id;
 bh=L312endlcprtOwCjLIPoedxc1BKVv6FIXDS5pNRsd/8=; b=gAgbKdnq2Aa42DLAwq11+0rXdJJLQ2w9ajLChPYFjv+ukgJSyGbs0p1I9nv6rpTprtfxVPiBnzOW
 iNQRv7dhBSBGPJG4EbsY/woc8TN/NA5kUdWYGiZWUOVQZaq4qheg
X-Mailer: git-send-email 2.35.1
X-Mailing-List: linux-kernel@vger.kernel.org
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Virus-Scanned: amavisd-new at c-s.fr
Subject: [PATCH v3 11/25] powerpc/ftrace: Make __ftrace_make_{nop/call}()
 common to PPC32 and PPC64
From: Nick Desaulniers <ndesaulniers@google.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, naveen.n.rao@linux.vnet.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: nathan@kernel.org, linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, omosnacek@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

Since c93d4f6ecf4b ("powerpc/ftrace: Add module_trampoline_target()
for PPC32"), __ftrace_make_nop() for PPC32 is very similar to the
one for PPC64.

Same for __ftrace_make_call().

Make them common.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2:
- Fixed comment to -mprofile-kernel versus -mkernel_profile
- Replaced a couple of #ifdef with CONFIG_PPC64_ELF_ABI_V1 as suggested by =
Naveen.
---
 arch/powerpc/kernel/trace/ftrace.c | 108 +++--------------------------
 1 file changed, 8 insertions(+), 100 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace=
/ftrace.c
index 0b199fc9cfd3..531da4d93c58 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -114,7 +114,6 @@ static unsigned long find_bl_target(unsigned long ip, p=
pc_inst_t op)
 }
=20
 #ifdef CONFIG_MODULES
-#ifdef CONFIG_PPC64
 static int
 __ftrace_make_nop(struct module *mod,
 		  struct dyn_ftrace *rec, unsigned long addr)
@@ -154,10 +153,11 @@ __ftrace_make_nop(struct module *mod,
 		return -EINVAL;
 	}
=20
-#ifdef CONFIG_MPROFILE_KERNEL
-	/* When using -mkernel_profile there is no load to jump over */
+	/* When using -mprofile-kernel or PPC32 there is no load to jump over */
 	pop =3D ppc_inst(PPC_RAW_NOP());
=20
+#ifdef CONFIG_PPC64
+#ifdef CONFIG_MPROFILE_KERNEL
 	if (copy_inst_from_kernel_nofault(&op, (void *)(ip - 4))) {
 		pr_err("Fetching instruction at %lx failed.\n", ip - 4);
 		return -EFAULT;
@@ -201,6 +201,7 @@ __ftrace_make_nop(struct module *mod,
 		return -EINVAL;
 	}
 #endif /* CONFIG_MPROFILE_KERNEL */
+#endif /* PPC64 */
=20
 	if (patch_instruction((u32 *)ip, pop)) {
 		pr_err("Patching NOP failed.\n");
@@ -209,48 +210,6 @@ __ftrace_make_nop(struct module *mod,
=20
 	return 0;
 }
-
-#else /* !PPC64 */
-static int
-__ftrace_make_nop(struct module *mod,
-		  struct dyn_ftrace *rec, unsigned long addr)
-{
-	ppc_inst_t op;
-	unsigned long ip =3D rec->ip;
-	unsigned long tramp, ptr;
-
-	if (copy_from_kernel_nofault(&op, (void *)ip, MCOUNT_INSN_SIZE))
-		return -EFAULT;
-
-	/* Make sure that that this is still a 24bit jump */
-	if (!is_bl_op(op)) {
-		pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
-		return -EINVAL;
-	}
-
-	/* lets find where the pointer goes */
-	tramp =3D find_bl_target(ip, op);
-
-	/* Find where the trampoline jumps to */
-	if (module_trampoline_target(mod, tramp, &ptr)) {
-		pr_err("Failed to get trampoline target\n");
-		return -EFAULT;
-	}
-
-	if (ptr !=3D addr) {
-		pr_err("Trampoline location %08lx does not match addr\n",
-		       tramp);
-		return -EINVAL;
-	}
-
-	op =3D ppc_inst(PPC_RAW_NOP());
-
-	if (patch_instruction((u32 *)ip, op))
-		return -EPERM;
-
-	return 0;
-}
-#endif /* PPC64 */
 #endif /* CONFIG_MODULES */
=20
 static unsigned long find_ftrace_tramp(unsigned long ip)
@@ -437,13 +396,12 @@ int ftrace_make_nop(struct module *mod,
 }
=20
 #ifdef CONFIG_MODULES
-#ifdef CONFIG_PPC64
 /*
  * Examine the existing instructions for __ftrace_make_call.
  * They should effectively be a NOP, and follow formal constraints,
  * depending on the ABI. Return false if they don't.
  */
-#ifndef CONFIG_MPROFILE_KERNEL
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 static int
 expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
 {
@@ -465,7 +423,7 @@ expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_ins=
t_t op1)
 static int
 expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
 {
-	/* look for patched "NOP" on ppc64 with -mprofile-kernel */
+	/* look for patched "NOP" on ppc64 with -mprofile-kernel or ppc32 */
 	if (!ppc_inst_equal(op0, ppc_inst(PPC_RAW_NOP())))
 		return 0;
 	return 1;
@@ -484,8 +442,10 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned lo=
ng addr)
 	if (copy_inst_from_kernel_nofault(op, ip))
 		return -EFAULT;
=20
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 	if (copy_inst_from_kernel_nofault(op + 1, ip + 4))
 		return -EFAULT;
+#endif
=20
 	if (!expected_nop_sequence(ip, op[0], op[1])) {
 		pr_err("Unexpected call sequence at %p: %s %s\n",
@@ -531,58 +491,6 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned lo=
ng addr)
=20
 	return 0;
 }
-
-#else  /* !CONFIG_PPC64: */
-static int
-__ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
-{
-	int err;
-	ppc_inst_t op;
-	u32 *ip =3D (u32 *)rec->ip;
-	struct module *mod =3D rec->arch.mod;
-	unsigned long tramp;
-
-	/* read where this goes */
-	if (copy_inst_from_kernel_nofault(&op, ip))
-		return -EFAULT;
-
-	/* It should be pointing to a nop */
-	if (!ppc_inst_equal(op,  ppc_inst(PPC_RAW_NOP()))) {
-		pr_err("Expected NOP but have %s\n", ppc_inst_as_str(op));
-		return -EINVAL;
-	}
-
-	/* If we never set up a trampoline to ftrace_caller, then bail */
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-	if (!mod->arch.tramp || !mod->arch.tramp_regs) {
-#else
-	if (!mod->arch.tramp) {
-#endif
-		pr_err("No ftrace trampoline\n");
-		return -EINVAL;
-	}
-
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-	if (rec->flags & FTRACE_FL_REGS)
-		tramp =3D mod->arch.tramp_regs;
-	else
-#endif
-		tramp =3D mod->arch.tramp;
-	/* create the branch to the trampoline */
-	err =3D create_branch(&op, ip, tramp, BRANCH_SET_LINK);
-	if (err) {
-		pr_err("REL24 out of range!\n");
-		return -EINVAL;
-	}
-
-	pr_devel("write to %lx\n", rec->ip);
-
-	if (patch_instruction(ip, op))
-		return -EPERM;
-
-	return 0;
-}
-#endif /* CONFIG_PPC64 */
 #endif /* CONFIG_MODULES */
=20
 static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long=
 addr)
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50EAC41535
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:44:10 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235174AbiEIFrG (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S235019AbiEIFqn (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:46:43 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07BF715E75A
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:42:51 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKc3PLKz9sW9;
        Mon,  9 May 2022 07:36:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id MvxXOftsaf4D; Mon,  9 May 2022 07:36:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF6G45z9sW7;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id CE4148B76E;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id VuS5VDGUey6H; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 723BB8B780;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aT0G1=
591239
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:29 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aTIL159123=
8;
        Mon, 9 May 2022 07:36:29 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 08/25] powerpc: Add CONFIG_PPC64_ELF_ABI_V1 and CONFIG_P=
PC64_ELF_ABI_V2
Date: Mon,  9 May 2022 07:36:06 +0200
Message-Id: <1eca1addbc550167da9841c7340a010d0c4b2200.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074581; l=3D2625;=
 s=3D20211009; h=3Dfrom:subject:message-id; bh=3DNBoBcjsTO1tovFFuP2hBDk2AHE=
9R2iPK5NfoSRq7M98=3D; b=3DHRQc/3CrXc8/4Z0lkCGnXifgCtBr3PfIptOJHdq93TN9cEQ+y=
qTmWT/bzKDS0qNsO40+SgprPROk A7ZXYCHBCmYkv/I4u9gj1zH2iTHQLu7F9FzDa005cck3ZDQ=
fEcCh
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

At the time being, we use CONFIG_CPU_LITTLE_ENDIAN and
CONFIG_CPU_BIG_ENDIAN to pass -mabi=3Delfv1 or elfv2 to
compiler, then define a PPC64_ELF_ABI_v1 or PPC64_ELF_ABI_v2
macro in asm/types.h based on _CALL_ELF define set by the compiler.

Make it more straight forward with a CONFIG option that
is directly usable.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Makefile                  | 10 +++++-----
 arch/powerpc/boot/Makefile             |  2 ++
 arch/powerpc/platforms/Kconfig.cputype |  6 ++++++
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index eb541e730d3c..1ba98be84101 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -89,10 +89,10 @@ endif
=20
 ifdef CONFIG_PPC64
 ifndef CONFIG_CC_IS_CLANG
-cflags-$(CONFIG_CPU_BIG_ENDIAN)		+=3D $(call cc-option,-mabi=3Delfv1)
-cflags-$(CONFIG_CPU_BIG_ENDIAN)		+=3D $(call cc-option,-mcall-aixdesc)
-aflags-$(CONFIG_CPU_BIG_ENDIAN)		+=3D $(call cc-option,-mabi=3Delfv1)
-aflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+=3D -mabi=3Delfv2
+cflags-$(CONFIG_PPC64_ELF_ABI_V1)	+=3D $(call cc-option,-mabi=3Delfv1)
+cflags-$(CONFIG_PPC64_ELF_ABI_V1)	+=3D $(call cc-option,-mcall-aixdesc)
+aflags-$(CONFIG_PPC64_ELF_ABI_V1)	+=3D $(call cc-option,-mabi=3Delfv1)
+aflags-$(CONFIG_PPC64_ELF_ABI_V2)	+=3D -mabi=3Delfv2
 endif
 endif
=20
@@ -141,7 +141,7 @@ endif
=20
 CFLAGS-$(CONFIG_PPC64)	:=3D $(call cc-option,-mtraceback=3Dno)
 ifndef CONFIG_CC_IS_CLANG
-ifdef CONFIG_CPU_LITTLE_ENDIAN
+ifdef CONFIG_PPC64_ELF_ABI_V2
 CFLAGS-$(CONFIG_PPC64)	+=3D $(call cc-option,-mabi=3Delfv2,$(call cc-optio=
n,-mcall-aixdesc))
 AFLAGS-$(CONFIG_PPC64)	+=3D $(call cc-option,-mabi=3Delfv2)
 else
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 4b4827c475c6..b6d4fe04c594 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -49,6 +49,8 @@ ifdef CONFIG_CPU_BIG_ENDIAN
 BOOTCFLAGS	+=3D -mbig-endian
 else
 BOOTCFLAGS	+=3D -mlittle-endian
+endif
+ifdef CONFIG_PPC64_ELF_ABI_V2
 BOOTCFLAGS	+=3D $(call cc-option,-mabi=3Delfv2)
 endif
=20
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platform=
s/Kconfig.cputype
index e2e1fec91c6e..9bfcf972d21d 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -556,6 +556,12 @@ config CPU_LITTLE_ENDIAN
=20
 endchoice
=20
+config PPC64_ELF_ABI_V1
+	def_bool PPC64 && CPU_BIG_ENDIAN
+
+config PPC64_ELF_ABI_V2
+	def_bool PPC64 && CPU_LITTLE_ENDIAN
+
 config PPC64_BOOT_WRAPPER
 	def_bool n
 	depends on CPU_LITTLE_ENDIAN
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E49AC3527B
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:47:45 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234544AbiEIFuJ (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S235336AbiEIFr5 (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:47:57 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 459A0126C3A
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:44:04 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKn0kMLz9sWH;
        Mon,  9 May 2022 07:37:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id G2G3Rqetc9sH; Mon,  9 May 2022 07:37:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKH4kVxz9sWK;
        Mon,  9 May 2022 07:36:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E1418B763;
        Mon,  9 May 2022 07:36:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id DRe330hselgB; Mon,  9 May 2022 07:36:35 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 5BE688B76E;
        Mon,  9 May 2022 07:36:35 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aV6N1=
591291
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:31 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aVO0159129=
0;
        Mon, 9 May 2022 07:36:31 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 21/25] powerpc/ftrace: Don't use copy_from_kernel_nofaul=
t() in module_trampoline_target()
Date: Mon,  9 May 2022 07:36:19 +0200
Message-Id: <c55559103e014b7863161559d340e8e9484eaaa6.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074582; l=3D2705;=
 s=3D20211009; h=3Dfrom:subject:message-id; bh=3DCfrUCzqErjkJ1BZ8LHw9+4wpcE=
nd2IhUoh9LhAGXY+w=3D; b=3DYOzklA9WshRXJoWz/vL2ydfXuPpqPlkb1zNRY5YKGdK2hfy+h=
K1QunRD+f/fAduTLVNB0cMdrOMz q7Ayb0u+CU3mt9WoSRNIqPyy501HRL4jnIi1SU5DDCNOvoR=
DIVoV
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

module_trampoline_target() is quite a hot path used when
activating/deactivating function tracer.

Avoid the heavy copy_from_kernel_nofault() by doing four calls
to copy_inst_from_kernel_nofault().

Use __copy_inst_from_kernel_nofault() for the 3 last calls. First call
is done to copy_from_kernel_nofault() to check address is within
kernel space. No risk to wrap out the top of kernel space because the
last page is never mapped so if address is in last page the first copy
will fails and the other ones will never be performed.

And also make it notrace just like all functions that call it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: Use ppc_inst_t to fix sparse warnings and split trampoline verification=
 in one line per instruction.
---
 arch/powerpc/kernel/module_32.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/module_32.c b/arch/powerpc/kernel/module_3=
2.c
index a0432ef46967..715a42f383d0 100644
--- a/arch/powerpc/kernel/module_32.c
+++ b/arch/powerpc/kernel/module_32.c
@@ -289,23 +289,32 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
 }
=20
 #ifdef CONFIG_DYNAMIC_FTRACE
-int module_trampoline_target(struct module *mod, unsigned long addr,
-			     unsigned long *target)
+notrace int module_trampoline_target(struct module *mod, unsigned long add=
r,
+				     unsigned long *target)
 {
-	unsigned int jmp[4];
+	ppc_inst_t jmp[4];
=20
 	/* Find where the trampoline jumps to */
-	if (copy_from_kernel_nofault(jmp, (void *)addr, sizeof(jmp)))
+	if (copy_inst_from_kernel_nofault(jmp, (void *)addr))
+		return -EFAULT;
+	if (__copy_inst_from_kernel_nofault(jmp + 1, (void *)addr + 4))
+		return -EFAULT;
+	if (__copy_inst_from_kernel_nofault(jmp + 2, (void *)addr + 8))
+		return -EFAULT;
+	if (__copy_inst_from_kernel_nofault(jmp + 3, (void *)addr + 12))
 		return -EFAULT;
=20
 	/* verify that this is what we expect it to be */
-	if ((jmp[0] & 0xffff0000) !=3D PPC_RAW_LIS(_R12, 0) ||
-	    (jmp[1] & 0xffff0000) !=3D PPC_RAW_ADDI(_R12, _R12, 0) ||
-	    jmp[2] !=3D PPC_RAW_MTCTR(_R12) ||
-	    jmp[3] !=3D PPC_RAW_BCTR())
+	if ((ppc_inst_val(jmp[0]) & 0xffff0000) !=3D PPC_RAW_LIS(_R12, 0))
+		return -EINVAL;
+	if ((ppc_inst_val(jmp[1]) & 0xffff0000) !=3D PPC_RAW_ADDI(_R12, _R12, 0))
+		return -EINVAL;
+	if (ppc_inst_val(jmp[2]) !=3D PPC_RAW_MTCTR(_R12))
+		return -EINVAL;
+	if (ppc_inst_val(jmp[3]) !=3D PPC_RAW_BCTR())
 		return -EINVAL;
=20
-	addr =3D (jmp[1] & 0xffff) | ((jmp[0] & 0xffff) << 16);
+	addr =3D (ppc_inst_val(jmp[1]) & 0xffff) | ((ppc_inst_val(jmp[0]) & 0xfff=
f) << 16);
 	if (addr & 0x8000)
 		addr -=3D 0x10000;
=20
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B33C4167E
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:44:10 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234815AbiEIFpf (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S235237AbiEIFnk (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:43:40 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3858113FD5E
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:39:47 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKN24CQz9sTg;
        Mon,  9 May 2022 07:36:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Z5iQMiSJpOPp; Mon,  9 May 2022 07:36:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF5Bcnz9sTT;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id A1F308B763;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id PoDIUbzdMB8Z; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C5AA8B775;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aVcE1=
591283
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:31 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aVJr159128=
2;
        Mon, 9 May 2022 07:36:31 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 19/25] powerpc/ftrace: Minimise number of #ifdefs
Date: Mon,  9 May 2022 07:36:17 +0200
Message-Id: <18ce6708d6f8c71d87436f9c6019f04df4125128.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074582; l=3D13745=
; s=3D20211009; h=3Dfrom:subject:message-id; bh=3DpbcW6UGE+WrYQOSdo6W89HbOG=
E9CaSlQTo8B+0eGVJ0=3D; b=3Dx5yc5YU4Wqgk4iMtCrv9QFupk/KUiLDZG2/83ZfPkTkCrNNM=
f6Msi+aGJxLqBU/KbmoL0XV+BlTj A4c22qc7CyZgxWoN+8Hft3gaYljrKmJsB+MrVA9ElvrL+N=
qO+dqs
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

A lot of #ifdefs can be replaced by IS_ENABLED()

Do so.

This requires to have kernel_toc_addr() defined at all time
as well as PPC_INST_LD_TOC and PPC_INST_STD_LR.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Moved the setup of pop outside of the big if()/else() in __ftrace_make_=
nop()
---
 arch/powerpc/include/asm/code-patching.h |   2 -
 arch/powerpc/include/asm/module.h        |   2 -
 arch/powerpc/include/asm/sections.h      |  24 +--
 arch/powerpc/kernel/trace/ftrace.c       | 182 +++++++++++------------
 4 files changed, 103 insertions(+), 107 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/includ=
e/asm/code-patching.h
index 8b1a10868275..3f881548fb61 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -217,7 +217,6 @@ static inline unsigned long ppc_kallsyms_lookup_name(co=
nst char *name)
 	return addr;
 }
=20
-#ifdef CONFIG_PPC64
 /*
  * Some instruction encodings commonly used in dynamic ftracing
  * and function live patching.
@@ -234,6 +233,5 @@ static inline unsigned long ppc_kallsyms_lookup_name(co=
nst char *name)
=20
 /* usually preceded by a mflr r0 */
 #define PPC_INST_STD_LR		PPC_RAW_STD(_R0, _R1, PPC_LR_STKOFF)
-#endif /* CONFIG_PPC64 */
=20
 #endif /* _ASM_POWERPC_CODE_PATCHING_H */
diff --git a/arch/powerpc/include/asm/module.h b/arch/powerpc/include/asm/m=
odule.h
index 857d9ff24295..09e2ffd360bb 100644
--- a/arch/powerpc/include/asm/module.h
+++ b/arch/powerpc/include/asm/module.h
@@ -41,9 +41,7 @@ struct mod_arch_specific {
=20
 #ifdef CONFIG_DYNAMIC_FTRACE
 	unsigned long tramp;
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 	unsigned long tramp_regs;
-#endif
 #endif
=20
 	/* List of BUG addresses, source line numbers and filenames */
diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm=
/sections.h
index 8be2c491c733..6980eaeb16fe 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -29,18 +29,6 @@ extern char start_virt_trampolines[];
 extern char end_virt_trampolines[];
 #endif
=20
-/*
- * This assumes the kernel is never compiled -mcmodel=3Dsmall or
- * the total .toc is always less than 64k.
- */
-static inline unsigned long kernel_toc_addr(void)
-{
-	unsigned long toc_ptr;
-
-	asm volatile("mr %0, 2" : "=3Dr" (toc_ptr));
-	return toc_ptr;
-}
-
 static inline int overlaps_interrupt_vector_text(unsigned long start,
 							unsigned long end)
 {
@@ -60,5 +48,17 @@ static inline int overlaps_kernel_text(unsigned long sta=
rt, unsigned long end)
=20
 #endif
=20
+/*
+ * This assumes the kernel is never compiled -mcmodel=3Dsmall or
+ * the total .toc is always less than 64k.
+ */
+static inline unsigned long kernel_toc_addr(void)
+{
+	unsigned long toc_ptr;
+
+	asm volatile("mr %0, 2" : "=3Dr" (toc_ptr));
+	return toc_ptr;
+}
+
 #endif /* __KERNEL__ */
 #endif	/* _ASM_POWERPC_SECTIONS_H */
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace=
/ftrace.c
index c34cb394f8a8..5e7a4ed7ad22 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -150,26 +150,39 @@ __ftrace_make_nop(struct module *mod,
 		return -EINVAL;
 	}
=20
-	/* When using -mprofile-kernel or PPC32 there is no load to jump over */
-	pop =3D ppc_inst(PPC_RAW_NOP());
+	if (IS_ENABLED(CONFIG_MPROFILE_KERNEL)) {
+		if (copy_inst_from_kernel_nofault(&op, (void *)(ip - 4))) {
+			pr_err("Fetching instruction at %lx failed.\n", ip - 4);
+			return -EFAULT;
+		}
=20
-#ifdef CONFIG_PPC64
-#ifdef CONFIG_MPROFILE_KERNEL
-	if (copy_inst_from_kernel_nofault(&op, (void *)(ip - 4))) {
-		pr_err("Fetching instruction at %lx failed.\n", ip - 4);
-		return -EFAULT;
-	}
+		/* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
+		if (!ppc_inst_equal(op, ppc_inst(PPC_RAW_MFLR(_R0))) &&
+		    !ppc_inst_equal(op, ppc_inst(PPC_INST_STD_LR))) {
+			pr_err("Unexpected instruction %s around bl _mcount\n",
+			       ppc_inst_as_str(op));
+			return -EINVAL;
+		}
+	} else if (IS_ENABLED(CONFIG_PPC64)) {
+		/*
+		 * Check what is in the next instruction. We can see ld r2,40(r1), but
+		 * on first pass after boot we will see mflr r0.
+		 */
+		if (copy_inst_from_kernel_nofault(&op, (void *)(ip + 4))) {
+			pr_err("Fetching op failed.\n");
+			return -EFAULT;
+		}
=20
-	/* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
-	if (!ppc_inst_equal(op, ppc_inst(PPC_RAW_MFLR(_R0))) &&
-	    !ppc_inst_equal(op, ppc_inst(PPC_INST_STD_LR))) {
-		pr_err("Unexpected instruction %s around bl _mcount\n",
-		       ppc_inst_as_str(op));
-		return -EINVAL;
+		if (!ppc_inst_equal(op,  ppc_inst(PPC_INST_LD_TOC))) {
+			pr_err("Expected %08lx found %s\n", PPC_INST_LD_TOC, ppc_inst_as_str(op=
));
+			return -EINVAL;
+		}
 	}
-#else
+
 	/*
-	 * Our original call site looks like:
+	 * When using -mprofile-kernel or PPC32 there is no load to jump over.
+	 *
+	 * Otherwise our original call site looks like:
 	 *
 	 * bl <tramp>
 	 * ld r2,XX(r1)
@@ -181,24 +194,10 @@ __ftrace_make_nop(struct module *mod,
 	 *
 	 * Use a b +8 to jump over the load.
 	 */
-
-	pop =3D ppc_inst(PPC_RAW_BRANCH(8));	/* b +8 */
-
-	/*
-	 * Check what is in the next instruction. We can see ld r2,40(r1), but
-	 * on first pass after boot we will see mflr r0.
-	 */
-	if (copy_inst_from_kernel_nofault(&op, (void *)(ip + 4))) {
-		pr_err("Fetching op failed.\n");
-		return -EFAULT;
-	}
-
-	if (!ppc_inst_equal(op,  ppc_inst(PPC_INST_LD_TOC))) {
-		pr_err("Expected %08lx found %s\n", PPC_INST_LD_TOC, ppc_inst_as_str(op)=
);
-		return -EINVAL;
-	}
-#endif /* CONFIG_MPROFILE_KERNEL */
-#endif /* PPC64 */
+	if (IS_ENABLED(CONFIG_MPROFILE_KERNEL) || IS_ENABLED(CONFIG_PPC32))
+		pop =3D ppc_inst(PPC_RAW_NOP());
+	else
+		pop =3D ppc_inst(PPC_RAW_BRANCH(8));	/* b +8 */
=20
 	if (patch_instruction((u32 *)ip, pop)) {
 		pr_err("Patching NOP failed.\n");
@@ -207,6 +206,11 @@ __ftrace_make_nop(struct module *mod,
=20
 	return 0;
 }
+#else
+static int __ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec, u=
nsigned long addr)
+{
+	return 0;
+}
 #endif /* CONFIG_MODULES */
=20
 static unsigned long find_ftrace_tramp(unsigned long ip)
@@ -279,11 +283,11 @@ static int setup_mcount_compiler_tramp(unsigned long =
tramp)
 	}
=20
 	/* Let's re-write the tramp to go to ftrace_[regs_]caller */
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-	ptr =3D ppc_global_function_entry((void *)ftrace_regs_caller);
-#else
-	ptr =3D ppc_global_function_entry((void *)ftrace_caller);
-#endif
+	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS))
+		ptr =3D ppc_global_function_entry((void *)ftrace_regs_caller);
+	else
+		ptr =3D ppc_global_function_entry((void *)ftrace_caller);
+
 	if (patch_branch((u32 *)tramp, ptr, 0)) {
 		pr_debug("REL24 out of range!\n");
 		return -1;
@@ -352,10 +356,12 @@ int ftrace_make_nop(struct module *mod,
 		old =3D ftrace_call_replace(ip, addr, 1);
 		new =3D ppc_inst(PPC_RAW_NOP());
 		return ftrace_modify_code(ip, old, new);
-	} else if (core_kernel_text(ip))
+	} else if (core_kernel_text(ip)) {
 		return __ftrace_make_nop_kernel(rec, addr);
+	} else if (!IS_ENABLED(CONFIG_MODULES)) {
+		return -EINVAL;
+	}
=20
-#ifdef CONFIG_MODULES
 	/*
 	 * Out of range jumps are called from modules.
 	 * We should either already have a pointer to the module
@@ -378,10 +384,6 @@ int ftrace_make_nop(struct module *mod,
 		mod =3D rec->arch.mod;
=20
 	return __ftrace_make_nop(mod, rec, addr);
-#else
-	/* We should not get here without modules */
-	return -EINVAL;
-#endif /* CONFIG_MODULES */
 }
=20
 #ifdef CONFIG_MODULES
@@ -411,10 +413,9 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned lo=
ng addr)
 	if (copy_inst_from_kernel_nofault(op, ip))
 		return -EFAULT;
=20
-#ifdef CONFIG_PPC64_ELF_ABI_V1
-	if (copy_inst_from_kernel_nofault(op + 1, ip + 4))
+	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V1) &&
+	    copy_inst_from_kernel_nofault(op + 1, ip + 4))
 		return -EFAULT;
-#endif
=20
 	if (!expected_nop_sequence(ip, op[0], op[1])) {
 		pr_err("Unexpected call sequence at %p: %s %s\n",
@@ -423,20 +424,15 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned l=
ong addr)
 	}
=20
 	/* If we never set up ftrace trampoline(s), then bail */
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-	if (!mod->arch.tramp || !mod->arch.tramp_regs) {
-#else
-	if (!mod->arch.tramp) {
-#endif
+	if (!mod->arch.tramp ||
+	    (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS) && !mod->arch.tramp_regs=
)) {
 		pr_err("No ftrace trampoline\n");
 		return -EINVAL;
 	}
=20
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-	if (rec->flags & FTRACE_FL_REGS)
+	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS) && rec->flags & FTRACE_FL=
_REGS)
 		tramp =3D mod->arch.tramp_regs;
 	else
-#endif
 		tramp =3D mod->arch.tramp;
=20
 	if (module_trampoline_target(mod, tramp, &ptr)) {
@@ -460,6 +456,11 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned lo=
ng addr)
=20
 	return 0;
 }
+#else
+static int __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
+{
+	return 0;
+}
 #endif /* CONFIG_MODULES */
=20
 static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long=
 addr)
@@ -472,16 +473,12 @@ static int __ftrace_make_call_kernel(struct dyn_ftrac=
e *rec, unsigned long addr)
 	entry =3D ppc_global_function_entry((void *)ftrace_caller);
 	ptr =3D ppc_global_function_entry((void *)addr);
=20
-	if (ptr !=3D entry) {
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+	if (ptr !=3D entry && IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS))
 		entry =3D ppc_global_function_entry((void *)ftrace_regs_caller);
-		if (ptr !=3D entry) {
-#endif
-			pr_err("Unknown ftrace addr to patch: %ps\n", (void *)ptr);
-			return -EINVAL;
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-		}
-#endif
+
+	if (ptr !=3D entry) {
+		pr_err("Unknown ftrace addr to patch: %ps\n", (void *)ptr);
+		return -EINVAL;
 	}
=20
 	/* Make sure we have a nop */
@@ -524,10 +521,13 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned=
 long addr)
 		old =3D ppc_inst(PPC_RAW_NOP());
 		new =3D ftrace_call_replace(ip, addr, 1);
 		return ftrace_modify_code(ip, old, new);
-	} else if (core_kernel_text(ip))
+	} else if (core_kernel_text(ip)) {
 		return __ftrace_make_call_kernel(rec, addr);
+	} else if (!IS_ENABLED(CONFIG_MODULES)) {
+		/* We should not get here without modules */
+		return -EINVAL;
+	}
=20
-#ifdef CONFIG_MODULES
 	/*
 	 * Out of range jumps are called from modules.
 	 * Being that we are converting from nop, it had better
@@ -539,10 +539,6 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned =
long addr)
 	}
=20
 	return __ftrace_make_call(rec, addr);
-#else
-	/* We should not get here without modules */
-	return -EINVAL;
-#endif /* CONFIG_MODULES */
 }
=20
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
@@ -633,6 +629,11 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned =
long old_addr,
=20
 	return 0;
 }
+#else
+static int __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_=
addr, unsigned long addr)
+{
+	return 0;
+}
 #endif
=20
 int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
@@ -657,9 +658,11 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigne=
d long old_addr,
 		 * variant, so there is nothing to do here
 		 */
 		return 0;
+	} else if (!IS_ENABLED(CONFIG_MODULES)) {
+		/* We should not get here without modules */
+		return -EINVAL;
 	}
=20
-#ifdef CONFIG_MODULES
 	/*
 	 * Out of range jumps are called from modules.
 	 */
@@ -669,10 +672,6 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigne=
d long old_addr,
 	}
=20
 	return __ftrace_modify_call(rec, old_addr, addr);
-#else
-	/* We should not get here without modules */
-	return -EINVAL;
-#endif /* CONFIG_MODULES */
 }
 #endif
=20
@@ -686,15 +685,13 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	new =3D ftrace_call_replace(ip, (unsigned long)func, 1);
 	ret =3D ftrace_modify_code(ip, old, new);
=20
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 	/* Also update the regs callback function */
-	if (!ret) {
+	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS) && !ret) {
 		ip =3D (unsigned long)(&ftrace_regs_call);
 		old =3D ppc_inst_read((u32 *)&ftrace_regs_call);
 		new =3D ftrace_call_replace(ip, (unsigned long)func, 1);
 		ret =3D ftrace_modify_code(ip, old, new);
 	}
-#endif
=20
 	return ret;
 }
@@ -710,6 +707,9 @@ void arch_ftrace_update_code(int command)
=20
 #ifdef CONFIG_PPC64
 #define PACATOC offsetof(struct paca_struct, kernel_toc)
+#else
+#define PACATOC 0
+#endif
=20
 extern unsigned int ftrace_tramp_text[], ftrace_tramp_init[];
=20
@@ -724,12 +724,18 @@ int __init ftrace_dyn_arch_init(void)
 		PPC_RAW_MTCTR(_R12),
 		PPC_RAW_BCTR()
 	};
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-	unsigned long addr =3D ppc_global_function_entry((void *)ftrace_regs_call=
er);
-#else
-	unsigned long addr =3D ppc_global_function_entry((void *)ftrace_caller);
-#endif
-	long reladdr =3D addr - kernel_toc_addr();
+	unsigned long addr;
+	long reladdr;
+
+	if (IS_ENABLED(CONFIG_PPC32))
+		return 0;
+
+	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS))
+		addr =3D ppc_global_function_entry((void *)ftrace_regs_caller);
+	else
+		addr =3D ppc_global_function_entry((void *)ftrace_caller);
+
+	reladdr =3D addr - kernel_toc_addr();
=20
 	if (reladdr >=3D SZ_2G || reladdr < -SZ_2G) {
 		pr_err("Address of %ps out of range of kernel_toc.\n",
@@ -746,12 +752,6 @@ int __init ftrace_dyn_arch_init(void)
=20
 	return 0;
 }
-#else
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
-#endif
=20
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
=20
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E35C433F5
	for <linux-kernel@archiver.kernel.org>; Wed, 18 May 2022 11:19:25 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235547AbiERLTY (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Wed, 18 May 2022 07:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S235512AbiERLTT (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Wed, 18 May 2022 07:19:19 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD201737E9
        for <linux-kernel@vger.kernel.org>; Wed, 18 May 2022 04:19:14 -0700=
 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) se=
rver-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4L39VN1yvhz4xVP;
        Wed, 18 May 2022 21:19:08 +1000 (AEST)
DKIM-Signature: v=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed; d=3Dellerman.id=
.au;
        s=3D201909; t=3D1652872748;
        bh=3DINuX9O1IpEtUTzC6kCGyh8Jm7VeQJzuBU2ZaIDDAs2k=3D;
        h=3DFrom:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=3Dkc6++Pc9tP7sM3sl1kuk5x93XTnxicRThAJ3MYfhJjEWMWVLUZFDyk+OP6WEc7k=
x4
         QD6A5s6ZYg6SoMxfgCUqkWqrXocW8WENiso45OYN8wRfMQPubEDIhxE5MRRyKVmnS7
         +fdUQzjR0U50KVu6Y2HPcvBt3/bGhNyLOdzas6wRM4BwFGTJIfdCU2blUo4SWLOTZu
         4rcQ1Jv664j0G2aFXMdhBCJET5jTH8UbFYQbbE8ghpSYg1taxZFt9o3Um6H4EDYyLT
         DclLaYMy9K08TAMbIM+lFMqzYnFSLGx5Hc8YzEH7fhGmJbCXzrRjKZm7gItKDun6Of
         ZOZ8HWVbNX+dQ=3D=3D
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Mackerras <paulus@samba.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 19/25] powerpc/ftrace: Minimise number of #ifdefs
In-Reply-To: <1652866821.cdcfe8bs78.naveen@linux.ibm.com>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
 <18ce6708d6f8c71d87436f9c6019f04df4125128.1652074503.git.christophe.leroy@=
csgroup.eu>
 <1652866821.cdcfe8bs78.naveen@linux.ibm.com>
Date: Wed, 18 May 2022 21:19:06 +1000
Message-ID: <87leuznl5h.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
> Christophe Leroy wrote:
>> A lot of #ifdefs can be replaced by IS_ENABLED()
>>=20
>> Do so.
>>=20
>> This requires to have kernel_toc_addr() defined at all time
>> as well as PPC_INST_LD_TOC and PPC_INST_STD_LR.
>>=20
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> v2: Moved the setup of pop outside of the big if()/else() in __ftrace_ma=
ke_nop()
>> ---
>>  arch/powerpc/include/asm/code-patching.h |   2 -
>>  arch/powerpc/include/asm/module.h        |   2 -
>>  arch/powerpc/include/asm/sections.h      |  24 +--
>>  arch/powerpc/kernel/trace/ftrace.c       | 182 +++++++++++------------
>>  4 files changed, 103 insertions(+), 107 deletions(-)
>>=20
>
> <snip>
>
>> @@ -710,6 +707,9 @@ void arch_ftrace_update_code(int command)
>>=20
>>  #ifdef CONFIG_PPC64
>>  #define PACATOC offsetof(struct paca_struct, kernel_toc)
>> +#else
>> +#define PACATOC 0
>> +#endif
>
> This conflicts with my fix for the ftrace init tramp:
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220516071422.46=
3738-1-naveen.n.rao@linux.vnet.ibm.com/
>
> It probably makes sense to retain #ifdef CONFIG_PPC64, so that we can=20
> get rid of the PACATOC. Here is an incremental diff:

Where is the incremental diff meant to apply?

It doesn't apply on top of patch 19, or at the end of the series.

cheers

> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/tra=
ce/ftrace.c
> index da1a2f8ebb72f3..28169a1ccc7377 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -701,11 +701,6 @@ void arch_ftrace_update_code(int command)
>  }
> =20
>  #ifdef CONFIG_PPC64
> -#define PACATOC offsetof(struct paca_struct, kernel_toc)
> -#else
> -#define PACATOC 0
> -#endif
> -
>  extern unsigned int ftrace_tramp_text[], ftrace_tramp_init[];
> =20
>  void ftrace_free_init_tramp(void)
> @@ -724,7 +719,7 @@ int __init ftrace_dyn_arch_init(void)
>  	int i;
>  	unsigned int *tramp[] =3D { ftrace_tramp_text, ftrace_tramp_init };
>  	u32 stub_insns[] =3D {
> -		PPC_RAW_LD(_R12, _R13, PACATOC),
> +		PPC_RAW_LD(_R12, _R13, offsetof(struct paca_struct, kernel_toc)),
>  		PPC_RAW_ADDIS(_R12, _R12, 0),
>  		PPC_RAW_ADDI(_R12, _R12, 0),
>  		PPC_RAW_MTCTR(_R12),
> @@ -733,9 +728,6 @@ int __init ftrace_dyn_arch_init(void)
>  	unsigned long addr;
>  	long reladdr;
> =20
> -	if (IS_ENABLED(CONFIG_PPC32))
> -		return 0;
> -
>  	addr =3D ppc_global_function_entry((void *)FTRACE_REGS_ADDR);
>  	reladdr =3D addr - kernel_toc_addr();
> =20
> @@ -754,6 +746,7 @@ int __init ftrace_dyn_arch_init(void)
> =20
>  	return 0;
>  }
> +#endif
> =20
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
> =20
>
> - Naveen


From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A617C43217
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:44:10 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234422AbiEIFok (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S234730AbiEIFmB (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:42:01 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F4315A75E
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:38:01 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKH558Pz9sWL;
        Mon,  9 May 2022 07:36:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id w_IWBekukbsj; Mon,  9 May 2022 07:36:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF4W20z9sTD;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 855838B76E;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id jZqHhenqiENF; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 43FF88B770;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aUgO1=
591267
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:30 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aU42159126=
6;
        Mon, 9 May 2022 07:36:30 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 15/25] powerpc/ftrace: Use BRANCH_SET_LINK instead of va=
lue 1
Date: Mon,  9 May 2022 07:36:13 +0200
Message-Id: <d57847063ac93660a5af620d4df1847f10edf61a.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074582; l=3D800; =
s=3D20211009; h=3Dfrom:subject:message-id; bh=3DTOQSyZvep4NfIRkmNhrEBlHApgQ=
PEvl5weZnlGVA3L0=3D; b=3DdI8BSq7cmgucIOATwNDwoAaQBgrlAE3V83ojU+P5lFbqR09G8E=
1JyL8V20zTGMaoK395FY4RmQUi sq+0fQfSBmhD8K9fO3iUx+pq2HeCgh4viorlmqK26YYmERoG=
6pU8
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

To make it explicit, use BRANCH_SET_LINK instead of value 1
when calling create_branch().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/trace/ftrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace=
/ftrace.c
index 010a8c7ff4ac..c4a68340a351 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -45,7 +45,7 @@ ftrace_call_replace(unsigned long ip, unsigned long addr,=
 int link)
 	addr =3D ppc_function_entry((void *)addr);
=20
 	/* if (link) set op to 'bl' else 'b' */
-	create_branch(&op, (u32 *)ip, addr, link ? 1 : 0);
+	create_branch(&op, (u32 *)ip, addr, link ? BRANCH_SET_LINK : 0);
=20
 	return op;
 }
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3094FC433F5
	for <linux-kernel@archiver.kernel.org>; Wed, 18 May 2022 10:08:59 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234995AbiERKI5 (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Wed, 18 May 2022 06:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S234871AbiERKIy (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Wed, 18 May 2022 06:08:54 -0400
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90=
084.outbound.protection.outlook.com [40.107.9.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E02B2158966
        for <linux-kernel@vger.kernel.org>; Wed, 18 May 2022 03:08:50 -0700=
 (PDT)
ARC-Seal: i=3D1; a=3Drsa-sha256; s=3Darcselector9901; d=3Dmicrosoft.com; cv=
=3Dnone;
 b=3DFAvMiVkpo+KdfPYgQYFeNJ0+QKiNr+pDPH0ggtAz2bsh73j5pgQGs6EQFOVQ05uohUuuQQ=
miAyTiRz87NzT7hQ0k6Nnfbo2+MVO38ywrByDVyA+HYBpHC9R8fHMiF6j1NGqkhJqnIk9C8rV/z=
ABpQ0tPjqseCGbh+UBbf38IZv8iYTgpLnHZ3eVeDZrgBDMJj7a1RuyDN7szOYN/9cOwgNOQBp8g=
96iv/C+pqedBnHSVCjfC+QE4SBOzOUPB4Vcc66cvpcWLotrIRpE1FQ01nyyu0+FoTafY8xjQvKw=
JjABbsnh2Bv7g12jGc1FeqSPcGVDh38B1J4HHaZyf4AlLvw=3D=3D
ARC-Message-Signature: i=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed; d=3Dmicr=
osoft.com;
 s=3Darcselector9901;
 h=3DFrom:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-A=
ntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Ex=
change-AntiSpam-MessageData-1;
 bh=3DCf8ZgY679IFflPEDF8slUL/28XDtuykA1bSKLRnCdBE=3D;
 b=3DkMDjRJ3A6Caf7Thl/N95NAP5avbKQAW2ZCvWYUTOU8SfHKHgSnr/qbEBboxvdsX2zVCkX/=
KvsA+YZ2kj6GmjHP+qC38uWQrlzPza5reOAaM352dxJdNJw29ZiqF1MUDvk8WcipyJGqBo81gwD=
vOLWZxuO83vgM1r4W7QEv6eB7Js4sR2jo5642L5FYh+mLqCoWJpLU8JG2HXkF0dgWRa7CPAoVc2=
aLC1sG9kuQzAXPRiO8bmZDKCLzExkjC/B98KeeTTtmgfZwixveGj/ENiT730mhUJ3jAReetNS2+=
8vNxnctHw2yHu00cmO/uifajRMU3G0qGUIyOPSqhgErSU1A=3D=3D
ARC-Authentication-Results: i=3D1; mx.microsoft.com 1; spf=3Dpass
 smtp.mailfrom=3Dcsgroup.eu; dmarc=3Dpass action=3Dnone header.from=3Dcsgro=
up.eu;
 dkim=3Dpass header.d=3Dcsgroup.eu; arc=3Dnone
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15=
)
 by PR0P264MB2807.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d2::20) with
 Microsoft SMTP Server (version=3DTLS1_2,
 cipher=3DTLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Wed, 18 =
May
 2022 10:08:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d%8]) with mapi id 15.20.5273.015; Wed, 18 May 2=
022
 10:08:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v3 19/25] powerpc/ftrace: Minimise number of #ifdefs
Thread-Topic: [PATCH v3 19/25] powerpc/ftrace: Minimise number of #ifdefs
Thread-Index: AQHYY2bDo7452AR5CUeMZrEOJfuwwK0kcUMAgAAGdwA=3D
Date: Wed, 18 May 2022 10:08:48 +0000
Message-ID: <75b4b16c-ef1b-dc68-d683-7fb2de0b9c0e@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
 <18ce6708d6f8c71d87436f9c6019f04df4125128.1652074503.git.christophe.leroy@=
csgroup.eu>
 <1652866821.cdcfe8bs78.naveen@linux.ibm.com>
In-Reply-To: <1652866821.cdcfe8bs78.naveen@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach:=20
X-MS-TNEF-Correlator:=20
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=3Dnone (message not signed)
 header.d=3Dnone;dmarc=3Dnone action=3Dnone header.from=3Dcsgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d80bfce-f55c-48ea-9942-08da38b666=
b1
x-ms-traffictypediagnostic: PR0P264MB2807:EE_
x-microsoft-antispam-prvs: <PR0P264MB2807DEC1CC4B67FD9B8CC320EDD19@PR0P264M=
B2807.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wxjKgwilVoPTMnojElttU7Ap43I8WxKUdmvM7EHr=
h+ZGkUXratViMcclzrnK5ll/+xQ7XuXx0o2F4LHbg94PRobi/PaEL965bGH/s+zLX0iuAHunQB8=
N9vi5FZU4t20ZERPBZw9vqL4kwqBjVZuKhlGIK6+Sy0pxrCe6fHCrTom49yLimrGuM9b7dp/Fx/=
BVFdTwp9l0qBjJdAH2i1M8Ss+/pBHC4CZTiMM0u7JIlmrlSD41xkgWXreENwxuHzKLVePSzXoay=
+8ojk66u67Fta/lZnvz1Hbhy0antbEYzF0ky3GZdnZGZNBXFwYsoNK0T6sguvC7H7VyEgPqxsHT=
p9EQt2ksLODkiSJplJ6XC2vwckkvRgGuD1kddJeQlpsk4VV0qAAwerhIgQnKyV9NBTSj7aYtvrX=
JQ88t8mC5wSKuaCUBYO5rSt2QYGSnB5wcsQg0iIIb7pn93r1Ga0s+uetx2Q6Hgr+M22fqQ4l8S3=
YzHna3r2kJT/WSlDB2NTXou4osWJY0Mb8i/Qvzv5sMHEELtunqj3DvfLe8RHwVZ1x3uhPdEHTe6=
m9Gcw0733RinXKkOVdbCbly7jV0mSGFt2n5irf5QkFUUQ+k7L4vq2Re7xct3l7CDrFXEmzLdvFA=
Qxq2fECnTYus10Td4CNAj6q3huMgo35HfDz4c94OTXKqS147V7sb8OfKDDINU8BPVTdhFYKfako=
k1nwo5RZfYJelWg9eJN6jXeQnbbpwStWIJXusfaA5t8iQivaNsYQM2681nC+Uxhx9nWYx04XpnR=
vqFEhHNq0mUDb6DJFWUuEJQlYZN8YrCWPStBLbFeo0V/9k2rxt2yEK6y22U7OLhAKg2w660BIQs=
8riS/nYWAg=3D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;I=
PV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:=
(13230001)(4636009)(366004)(5660300002)(110136005)(31696002)(83380400001)(6=
6476007)(86362001)(64756008)(66946007)(8676002)(186003)(38100700002)(122000=
001)(2616005)(6486002)(66574015)(2906002)(38070700005)(71200400001)(5086000=
01)(966005)(66556008)(8936002)(54906003)(66446008)(44832011)(31686004)(6506=
007)(316002)(26005)(76116006)(6512007)(91956017)(36756003)(4326008)(4374050=
0002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =3D?utf-8?B?eitjeXVTZ2R6MFVzdm9PZGUrb=
nhRY1BzczVwRGVUalFROVZvelYwNnZYekVu?=3D
 =3D?utf-8?B?L1ZtTzNwakRrZkhCVy9pMit4M3FRZ1phWHdqYTdTc3NtcThvOGozdHg3VEI4?=
=3D
 =3D?utf-8?B?Qy9hNWI4dGovemFBYXl5M3RyZFY5NjVUQWV0aHI1SUVOeEhDdnBxNEkyVG5a?=
=3D
 =3D?utf-8?B?MzQ3YytQa090dDlhSE1QWnpocy9rNGpqbEVRSHczNVVsNzQ4RW51SUUra2lq?=
=3D
 =3D?utf-8?B?OEVSMWNtWTdyMmk5YnZtNTJlMXkwWmY5aUNNVnFYeUQrcTc0dGIzZ1AzeEg5?=
=3D
 =3D?utf-8?B?ZkRkODNTSFFsSDE5Zk9VYzV4TFpYM2ZhekVuUWx4Y3FTd1gzeG14NVRJNnBE?=
=3D
 =3D?utf-8?B?RzJJTHE2WGRPbzQxRG5zdnBPbHE4NU5LalR0Yk5zbk00OUlCLzJzaktZSjdh?=
=3D
 =3D?utf-8?B?SytYT1k5MlpTeVNGeW52VU5UanU1UTd2aHpxdzduQlJkb05yTzREUGtjOFFn?=
=3D
 =3D?utf-8?B?K3pQSFJhOU5sbzRiZFhTYVM3bWJoS2dWZHp2UVQwTG9qVkRkVU14ekNseit4?=
=3D
 =3D?utf-8?B?OCtWNG5NWkNGLzV5L3NhSlMvbG82TnZHdVErWWc5ZkVIK3VLSHoxTlR2REFD?=
=3D
 =3D?utf-8?B?ZGZFUWlqcDkrandSYXpObVU3dlZVcmdqcHpZbFZDejlYMzgzeHB6YSsrMnZz?=
=3D
 =3D?utf-8?B?Z21nOE1JdkI3NzFhR0ZKZU1HT0hPdDlpbzI3Sm9tWXlCTDY0TUhyc1FvYWhW?=
=3D
 =3D?utf-8?B?WWNCVmpMSStQak9VaHkzTWxOMzAwdU9HRUxuR3FWcjdzOERtRVJubUNNdFd1?=
=3D
 =3D?utf-8?B?TmhhVStlOGo4MFZKckY4dXVOR2FLQzh4RTcrNUExZnFhczBtd290RGN2MDVM?=
=3D
 =3D?utf-8?B?TjViZ1krY2dXcFNaZGdQWm9qM25JQ1Z0ZGdzelQzQlVpRFRzbkRVTXVyenlz?=
=3D
 =3D?utf-8?B?ckJ6OTlZVC9lQ0pUZjJKQmVHV3BTdStuTDBYS3FJdWxpSDh2VUtRYWpWZ2JJ?=
=3D
 =3D?utf-8?B?Qy85TjJmaDU5bThKeWthMkxuYlJwL3FRNU1VdHlhbEJydjY4Tkh2aGtidmFZ?=
=3D
 =3D?utf-8?B?NGpoWkwvbUpCUHRFQWp5T0haeThEQnBkdlJRZVFLMW1YUHhnWk14cEZvenZ1?=
=3D
 =3D?utf-8?B?MFhBdFFoYjBMNlo3NE5DOU10U2czalRLMGZTbUtIRU91QXFlLzVhRnc4NmtV?=
=3D
 =3D?utf-8?B?d1JBUnZ4aFY2NEQyM2tNaHJjZFBGeS9WOFFRWFE1OGxWU0NHQlpPbGttZjEv?=
=3D
 =3D?utf-8?B?UmJNYjZqQjd1SHV4TENDR0xLcDFNdG9UbXdFM0pZZzVmcXE2WUlSVk94T2kw?=
=3D
 =3D?utf-8?B?ZkMxdUp3UzFhTnhqdUllTlYxUTlzWjNFdzZ3cW9EN2xkRmRNRjN3NUJBY2h2?=
=3D
 =3D?utf-8?B?Z2gxV3k2NHorbHJQMDE0aGJSSXBrRXRxMml3cm02TE5LR3JuSUYvZTZkNTRR?=
=3D
 =3D?utf-8?B?dnBUOGtlZDlMb0NpK1NnK1RHRk16YlhVYUlZK0xYS0I4RGp3bU9WT1RSTFdw?=
=3D
 =3D?utf-8?B?cFZuZHJOb0VWTGlZU3luZmxjMWNBSmZGV25vQ2dWTnc5V3BBeitkMS9SbE5L?=
=3D
 =3D?utf-8?B?RVZudFdLeUlMSGdCVFd3MkRMMW5YR2JGY1pVQ3BRY3RONzZST1hxMFFZN1h4?=
=3D
 =3D?utf-8?B?T3IxL3BnMUVOc2Fwa25jcE95QXR3ZHJ3dWplYXhaRFpLa2k5UHcyMlF1U1h1?=
=3D
 =3D?utf-8?B?UWVvc2NHSnNIV1o4SFVleHVsVWhJaUVCSUpLUjZnRHYvaXViOFZLZWdSb3BV?=
=3D
 =3D?utf-8?B?NXNnTHlwSXJHYzcxNHo1a0hLNVlTSmNXeDBCMUlUb3ZVcFRTVnl2RXdMWVNa?=
=3D
 =3D?utf-8?B?L1ZaVHMxYVF0OXl3K3Z2R1NZWmhyVXk0dHhaY0J1d0xMQnpQblZ2b2w2TGV6?=
=3D
 =3D?utf-8?B?M1o5OTE5M3IxN1RwQno0ZWVsNCtmZmRGajdtNVptUTkrYmI3RFF6Q3ZTN1pT?=
=3D
 =3D?utf-8?B?N0wrcmVxOVJGTFdRZG9nZ2F2SFVpazZKcEdmL3RsQkJDQXFPVDFYdVl6UFph?=
=3D
 =3D?utf-8?B?TENDcUxsUU9weEZpMUJOQVNzM3hOVFhleURIdlFiaG5Bc2xzTXAzWE9EYyty?=
=3D
 =3D?utf-8?B?ZjhqRms2Nmt2T2l4cUw2U0ZYZkdFRDdwRlFZdUJ0cWlsUy82MXg2K1hSclNP?=
=3D
 =3D?utf-8?B?NVplQ0xvTmZ6QjltWGNHRU81eFY0M0FCTDdJMnEzSklmaHlRMTUyc3hVVmdJ?=
=3D
 =3D?utf-8?B?NmZ6bDFxTVBVRG5PRzhlQkNTbUMvdGRFYWhLUm5seDd0c1hlOWRKSTFpWW9s?=
=3D
 =3D?utf-8?B?eEVHQlpoTWFBcTNSTDhxY0EyZ3BYUHZYWHZ6akVsNG5Sei8vVkhvSXBnamlX?=
=3D
 =3D?utf-8?B?UEJnVmd4VTU5RFpFSlJVTUJ6SEI4VG5DUjNxUjE2TFVVMnhhckE4aUpmdE96?=
=3D
 =3D?utf-8?B?VXhWZWNDVHZOYWQ2bWlzVFlsNVNycWd0ejUyM1dSUTUrS1NtYlA4UjJGeCt3?=
=3D
 =3D?utf-8?Q?JTCWS/riy78ez8UVrRt6C4J1w4UzyS198huKZ?=3D
Content-Type: text/plain; charset=3D"utf-8"
Content-ID: <AA12DE68874E064ABDB61390B8B981B8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.CO=
M
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d80bfce-f55c-48ea-9942-08da3=
8b666b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 10:08:48.4152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 28SVlp1fQnQbPfBk9M57w0kVZP2iSk=
j1QttKLAjYpkQ3NGxFfuHng+972801Vi9Alisuseyef/0Ztb9ZZIK2QC4PPIeUK8dXew/W6Uqmw=
rA=3D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2807
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

DQoNCkxlIDE4LzA1LzIwMjIgw6AgMTE6NDUsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4=
g
Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+IEEgbG90IG9mICNpZmRlZnMgY2FuIGJlIHJlcGx=
h
Y2VkIGJ5IElTX0VOQUJMRUQoKQ0KPj4NCj4+IERvIHNvLg0KPj4NCj4+IFRoaXMgcmVxdWlyZXM=
g
dG8gaGF2ZSBrZXJuZWxfdG9jX2FkZHIoKSBkZWZpbmVkIGF0IGFsbCB0aW1lDQo+PiBhcyB3ZWx=
s
IGFzIFBQQ19JTlNUX0xEX1RPQyBhbmQgUFBDX0lOU1RfU1REX0xSLg0KPj4NCj4+IFNpZ25lZC1=
v
ZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4=
+
IC0tLQ0KPj4gdjI6IE1vdmVkIHRoZSBzZXR1cCBvZiBwb3Agb3V0c2lkZSBvZiB0aGUgYmlnIGl=
m
KCkvZWxzZSgpIGluIA0KPj4gX19mdHJhY2VfbWFrZV9ub3AoKQ0KPj4gLS0tDQo+PiDCoGFyY2g=
v
cG93ZXJwYy9pbmNsdWRlL2FzbS9jb2RlLXBhdGNoaW5nLmggfMKgwqAgMiAtDQo+PiDCoGFyY2g=
v
cG93ZXJwYy9pbmNsdWRlL2FzbS9tb2R1bGUuaMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgLQ0KPj4=
g
wqBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc2VjdGlvbnMuaMKgwqDCoMKgwqAgfMKgIDI0ICs=
t
LQ0KPj4gwqBhcmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jwqDCoMKgwqDCoMKgIHw=
g
MTgyICsrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+PiDCoDQgZmlsZXMgY2hhbmdlZCwgMTAzIGl=
u
c2VydGlvbnMoKyksIDEwNyBkZWxldGlvbnMoLSkNCj4+DQo+IA0KPiA8c25pcD4NCj4gDQo+PiB=
A
QCAtNzEwLDYgKzcwNyw5IEBAIHZvaWQgYXJjaF9mdHJhY2VfdXBkYXRlX2NvZGUoaW50IGNvbW1=
h
bmQpDQo+Pg0KPj4gwqAjaWZkZWYgQ09ORklHX1BQQzY0DQo+PiDCoCNkZWZpbmUgUEFDQVRPQyB=
v
ZmZzZXRvZihzdHJ1Y3QgcGFjYV9zdHJ1Y3QsIGtlcm5lbF90b2MpDQo+PiArI2Vsc2UNCj4+ICs=
j
ZGVmaW5lIFBBQ0FUT0MgMA0KPj4gKyNlbmRpZg0KPiANCj4gVGhpcyBjb25mbGljdHMgd2l0aCB=
t
eSBmaXggZm9yIHRoZSBmdHJhY2UgaW5pdCB0cmFtcDoNCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3p=
s
YWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9wYXRjaC8yMDIyMDUxNjA3MTQyMi40NjM3Mzg=
t
MS1uYXZlZW4ubi5yYW9AbGludXgudm5ldC5pYm0uY29tLyANCj4gDQo+IA0KPiBJdCBwcm9iYWJ=
s
eSBtYWtlcyBzZW5zZSB0byByZXRhaW4gI2lmZGVmIENPTkZJR19QUEM2NCwgc28gdGhhdCB3ZSB=
j
YW4gDQo+IGdldCByaWQgb2YgdGhlIFBBQ0FUT0MuIEhlcmUgaXMgYW4gaW5jcmVtZW50YWwgZGl=
m
ZjoNCg0KQWggeWVzLCBpdCBtYWtlcyBzZW5zZS4NCg0KSW5pdGlhbCBwdXJwb3NlIHdhcyB0byB=
k
ZS1kdXBsaWNhdGUgZnRyYWNlX2R5bl9hcmNoX2luaXQoKSwgYnV0IGFzIA0KZnRyYWNlX2R5bl9=
h
cmNoX2luaXQoKSBpcyBkZWZpbmVkIGFzIGEgd2VhayBub3AgZnVuY3Rpb24gaW4gDQprZXJuZWw=
v
dHJhY2UvZnRyYWNlLmMgd2UgZG9uJ3QgbmVlZCBpdCBmb3IgUFBDMzIgYXQgYWxsLg0KDQpBbmQ=
g
dGhlbiBrZXJuZWxfdG9jX2FkZHIoKSBjb3VsZCByZW1haW4gaW5zaWRlICNpZmRlZiBDT05GSUd=
f
UFBDNjQgaW4gDQphc20vc2VjdGlvbi5oDQoNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2V=
y
cGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jIA0KPiBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvdHJhY2U=
v
ZnRyYWNlLmMNCj4gaW5kZXggZGExYTJmOGViYjcyZjMuLjI4MTY5YTFjY2M3Mzc3IDEwMDY0NA0=
K
PiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jDQo+ICsrKyBiL2FyY2g=
v
cG93ZXJwYy9rZXJuZWwvdHJhY2UvZnRyYWNlLmMNCj4gQEAgLTcwMSwxMSArNzAxLDYgQEAgdm9=
p
ZCBhcmNoX2Z0cmFjZV91cGRhdGVfY29kZShpbnQgY29tbWFuZCkNCj4gfQ0KPiANCj4gI2lmZGV=
m
IENPTkZJR19QUEM2NA0KPiAtI2RlZmluZSBQQUNBVE9DIG9mZnNldG9mKHN0cnVjdCBwYWNhX3N=
0
cnVjdCwga2VybmVsX3RvYykNCj4gLSNlbHNlDQo+IC0jZGVmaW5lIFBBQ0FUT0MgMA0KPiAtI2V=
u
ZGlmDQo+IC0NCj4gZXh0ZXJuIHVuc2lnbmVkIGludCBmdHJhY2VfdHJhbXBfdGV4dFtdLCBmdHJ=
h
Y2VfdHJhbXBfaW5pdFtdOw0KPiANCj4gdm9pZCBmdHJhY2VfZnJlZV9pbml0X3RyYW1wKHZvaWQ=
p
DQo+IEBAIC03MjQsNyArNzE5LDcgQEAgaW50IF9faW5pdCBmdHJhY2VfZHluX2FyY2hfaW5pdCh=
2
b2lkKQ0KPiAgwqDCoMKgwqBpbnQgaTsNCj4gIMKgwqDCoMKgdW5zaWduZWQgaW50ICp0cmFtcFt=
d
ID0geyBmdHJhY2VfdHJhbXBfdGV4dCwgZnRyYWNlX3RyYW1wX2luaXQgfTsNCj4gIMKgwqDCoMK=
g
dTMyIHN0dWJfaW5zbnNbXSA9IHsNCj4gLcKgwqDCoMKgwqDCoMKgIFBQQ19SQVdfTEQoX1IxMiw=
g
X1IxMywgUEFDQVRPQyksDQo+ICvCoMKgwqDCoMKgwqDCoCBQUENfUkFXX0xEKF9SMTIsIF9SMTM=
s
IG9mZnNldG9mKHN0cnVjdCBwYWNhX3N0cnVjdCwga2VybmVsX3RvYykpLA0KPiAgwqDCoMKgwqD=
C
oMKgwqAgUFBDX1JBV19BRERJUyhfUjEyLCBfUjEyLCAwKSwNCj4gIMKgwqDCoMKgwqDCoMKgIFB=
Q
Q19SQVdfQURESShfUjEyLCBfUjEyLCAwKSwNCj4gIMKgwqDCoMKgwqDCoMKgIFBQQ19SQVdfTVR=
D
VFIoX1IxMiksDQo+IEBAIC03MzMsOSArNzI4LDYgQEAgaW50IF9faW5pdCBmdHJhY2VfZHluX2F=
y
Y2hfaW5pdCh2b2lkKQ0KPiAgwqDCoMKgwqB1bnNpZ25lZCBsb25nIGFkZHI7DQo+ICDCoMKgwqD=
C
oGxvbmcgcmVsYWRkcjsNCj4gDQo+IC3CoMKgwqAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1BQQzM=
y
KSkNCj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPiAtDQo+ICDCoMKgwqDCoGFkZHIgPSB=
w
cGNfZ2xvYmFsX2Z1bmN0aW9uX2VudHJ5KCh2b2lkICopRlRSQUNFX1JFR1NfQUREUik7DQo+ICD=
C
oMKgwqDCoHJlbGFkZHIgPSBhZGRyIC0ga2VybmVsX3RvY19hZGRyKCk7DQo+IA0KPiBAQCAtNzU=
0
LDYgKzc0Niw3IEBAIGludCBfX2luaXQgZnRyYWNlX2R5bl9hcmNoX2luaXQodm9pZCkNCj4gDQo=
+
ICDCoMKgwqDCoHJldHVybiAwOw0KPiB9DQo+ICsjZW5kaWYNCj4gDQo+ICNpZmRlZiBDT05GSUd=
f
RlVOQ1RJT05fR1JBUEhfVFJBQ0VSDQo+IA0KPiANCj4gLSBOYXZlZW4=3D


From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B74FC4167B
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:44:10 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234740AbiEIFpV (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:45:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S235234AbiEIFne (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:43:34 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 863CF13FD5E
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:39:40 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKL3Ljgz9sTN;
        Mon,  9 May 2022 07:36:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id q4ENcxRLtERw; Mon,  9 May 2022 07:36:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF4y51z9sSv;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 995408B773;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id l3e1F9ofiGNP; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 3C9058B76D;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aUYA1=
591271
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:30 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aUlS159127=
0;
        Mon, 9 May 2022 07:36:30 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 16/25] powerpc/ftrace: Use PPC_RAW_xxx() macros instead =
of opencoding.
Date: Mon,  9 May 2022 07:36:14 +0200
Message-Id: <9292094c9a69cef6d29ee83f435a557b59c45065.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074582; l=3D4146;=
 s=3D20211009; h=3Dfrom:subject:message-id; bh=3Dl9MWFNRL2JH1tmWE8RlPsArFLX=
GPKhtcJE5wWg52jNU=3D; b=3DBjwVF24cYZSpNEQ4wzCW4wYBRPDWHpAq9e3ecDgwK4JgU1BiF=
vbWkEMBlvBoKLz2HLmpQO5pjJje k1+azgGcBPjJB2dikGGZvZ0NxzdbjIrhz4Qb5xUFh2kpwFV=
uHWjY
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

PPC_RAW_xxx() macros are self explanatory and less error prone
than open coding.

Use them in ftrace.c

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2:
- Replaced PPC_INST_OFFSET24_MASK by PPC_LI_MASK and added PPC_LI().
- Fix ADDI instead of ADDIS
---
 arch/powerpc/include/asm/ppc-opcode.h |  5 +++++
 arch/powerpc/kernel/trace/ftrace.c    | 32 +++++++++------------------
 2 files changed, 16 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/a=
sm/ppc-opcode.h
index 82f1f0041c6f..3e9aa96ae74b 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -352,6 +352,10 @@
 #define PPC_HIGHER(v)	(((v) >> 32) & 0xffff)
 #define PPC_HIGHEST(v)	(((v) >> 48) & 0xffff)
=20
+/* LI Field */
+#define PPC_LI_MASK	0x03fffffc
+#define PPC_LI(v)	((v) & PPC_LI_MASK)
+
 /*
  * Only use the larx hint bit on 64bit CPUs. e500v1/v2 based CPUs will tre=
at a
  * larx with EH set as an illegal instruction.
@@ -572,6 +576,7 @@
 #define PPC_RAW_EIEIO()			(0x7c0006ac)
=20
 #define PPC_RAW_BRANCH(addr)		(PPC_INST_BRANCH | ((addr) & 0x03fffffc))
+#define PPC_RAW_BL(offset)		(0x48000001 | PPC_LI(offset))
=20
 /* Deal with instructions that older assemblers aren't aware of */
 #define	PPC_BCCTR_FLUSH		stringify_in_c(.long PPC_INST_BCCTR_FLUSH)
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace=
/ftrace.c
index c4a68340a351..ac3f97dd1729 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -90,19 +90,19 @@ static int test_24bit_addr(unsigned long ip, unsigned l=
ong addr)
=20
 static int is_bl_op(ppc_inst_t op)
 {
-	return (ppc_inst_val(op) & 0xfc000003) =3D=3D 0x48000001;
+	return (ppc_inst_val(op) & ~PPC_LI_MASK) =3D=3D PPC_RAW_BL(0);
 }
=20
 static int is_b_op(ppc_inst_t op)
 {
-	return (ppc_inst_val(op) & 0xfc000003) =3D=3D 0x48000000;
+	return (ppc_inst_val(op) & ~PPC_LI_MASK) =3D=3D PPC_RAW_BRANCH(0);
 }
=20
 static unsigned long find_bl_target(unsigned long ip, ppc_inst_t op)
 {
 	int offset;
=20
-	offset =3D (ppc_inst_val(op) & 0x03fffffc);
+	offset =3D PPC_LI(ppc_inst_val(op));
 	/* make it signed */
 	if (offset & 0x02000000)
 		offset |=3D 0xfe000000;
@@ -182,7 +182,7 @@ __ftrace_make_nop(struct module *mod,
 	 * Use a b +8 to jump over the load.
 	 */
=20
-	pop =3D ppc_inst(PPC_INST_BRANCH | 8);	/* b +8 */
+	pop =3D ppc_inst(PPC_RAW_BRANCH(8));	/* b +8 */
=20
 	/*
 	 * Check what is in the next instruction. We can see ld r2,40(r1), but
@@ -394,17 +394,8 @@ int ftrace_make_nop(struct module *mod,
 static int
 expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
 {
-	/*
-	 * We expect to see:
-	 *
-	 * b +8
-	 * ld r2,XX(r1)
-	 *
-	 * The load offset is different depending on the ABI. For simplicity
-	 * just mask it out when doing the compare.
-	 */
-	if (!ppc_inst_equal(op0, ppc_inst(0x48000008)) ||
-	    (ppc_inst_val(op1) & 0xffff0000) !=3D 0xe8410000)
+	if (!ppc_inst_equal(op0, ppc_inst(PPC_RAW_BRANCH(8))) ||
+	    !ppc_inst_equal(op1, ppc_inst(PPC_INST_LD_TOC)))
 		return 0;
 	return 1;
 }
@@ -412,7 +403,6 @@ expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_ins=
t_t op1)
 static int
 expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
 {
-	/* look for patched "NOP" on ppc64 with -mprofile-kernel or ppc32 */
 	if (!ppc_inst_equal(op0, ppc_inst(PPC_RAW_NOP())))
 		return 0;
 	return 1;
@@ -738,11 +728,11 @@ int __init ftrace_dyn_arch_init(void)
 	int i;
 	unsigned int *tramp[] =3D { ftrace_tramp_text, ftrace_tramp_init };
 	u32 stub_insns[] =3D {
-		0xe98d0000 | PACATOC,	/* ld      r12,PACATOC(r13)	*/
-		0x3d8c0000,		/* addis   r12,r12,<high>	*/
-		0x398c0000,		/* addi    r12,r12,<low>	*/
-		0x7d8903a6,		/* mtctr   r12			*/
-		0x4e800420,		/* bctr				*/
+		PPC_RAW_LD(_R12, _R13, PACATOC),
+		PPC_RAW_ADDIS(_R12, _R12, 0),
+		PPC_RAW_ADDI(_R12, _R12, 0),
+		PPC_RAW_MTCTR(_R12),
+		PPC_RAW_BCTR()
 	};
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 	unsigned long addr =3D ppc_global_function_entry((void *)ftrace_regs_call=
er);
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 118F5C433FE
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:47:44 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234596AbiEIFsM (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S233733AbiEIFns (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:43:48 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75CC113FD5E
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:39:54 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKQ0ljwz9sTj;
        Mon,  9 May 2022 07:36:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zQX5uZIXMjlY; Mon,  9 May 2022 07:36:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF5lZdz9sVj;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id AF53D8B770;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id iMMbcD48-7Aj; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 5DC918B77A;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aVM41=
591279
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:31 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aVeI159127=
8;
        Mon, 9 May 2022 07:36:31 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 18/25] powerpc/ftrace: Simplify expected_nop_sequence()
Date: Mon,  9 May 2022 07:36:16 +0200
Message-Id: <305d22472f1f92127fba09692df6bb5d079a8cd0.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074582; l=3D1521;=
 s=3D20211009; h=3Dfrom:subject:message-id; bh=3D4BswpVslfmWCofUljaPxo8plPy=
hnTwi3LkFniY9lZ38=3D; b=3DifRvh8SNQExUvpvzJCaMJ/av7HVnvA3GRiAwu93w7a92OhGYk=
GDDEAxPy9qJCsZW811LXP/TR9VE SauAAWqKCGDYLV9srrglNiA68jExZsDJVQk52GOwizdOK0B=
YavRn
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

Avoid ifdefs around expected_nop_sequence().

While at it make it a bool.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/trace/ftrace.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace=
/ftrace.c
index 346b5485e7ef..c34cb394f8a8 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -390,24 +390,14 @@ int ftrace_make_nop(struct module *mod,
  * They should effectively be a NOP, and follow formal constraints,
  * depending on the ABI. Return false if they don't.
  */
-#ifdef CONFIG_PPC64_ELF_ABI_V1
-static int
-expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
-{
-	if (!ppc_inst_equal(op0, ppc_inst(PPC_RAW_BRANCH(8))) ||
-	    !ppc_inst_equal(op1, ppc_inst(PPC_INST_LD_TOC)))
-		return 0;
-	return 1;
-}
-#else
-static int
-expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
+static bool expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1=
)
 {
-	if (!ppc_inst_equal(op0, ppc_inst(PPC_RAW_NOP())))
-		return 0;
-	return 1;
+	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V1))
+		return ppc_inst_equal(op0, ppc_inst(PPC_RAW_BRANCH(8))) &&
+		       ppc_inst_equal(op1, ppc_inst(PPC_INST_LD_TOC));
+	else
+		return ppc_inst_equal(op0, ppc_inst(PPC_RAW_NOP()));
 }
-#endif
=20
 static int
 __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6C4C433F5
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:46:31 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233928AbiEIFtv (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S235230AbiEIFrV (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:47:21 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C14F415F6CA
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:43:25 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKm2hZPz9sWN;
        Mon,  9 May 2022 07:37:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8w_a-rU7xpHi; Mon,  9 May 2022 07:37:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKH4c2Xz9sWH;
        Mon,  9 May 2022 07:36:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 8680B8B774;
        Mon,  9 May 2022 07:36:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id 5wkjJiXhOqxp; Mon,  9 May 2022 07:36:35 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 5CA0B8B770;
        Mon,  9 May 2022 07:36:35 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aVK41=
591299
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:31 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aVYH159129=
8;
        Mon, 9 May 2022 07:36:31 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 23/25] powerpc/modules: Use PPC_LI macros instead of ope=
ncoding
Date: Mon,  9 May 2022 07:36:21 +0200
Message-Id: <3d56d7bc3200403773d54e62659d0e01292a055d.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074582; l=3D2088;=
 s=3D20211009; h=3Dfrom:subject:message-id; bh=3DDNHkQ3AqPMTm8F5d5vYdHRf8kn=
PDG7LqAC1tvoZK/mA=3D; b=3DRVKopUceGs1tSYS7Qz685ln/9CCoKZ4RzRcmTe3BnkTx1VgvE=
S9CS49/JITDxlHLMDpqKf0W9Qaw 2q7LOpg2C8SWd7UaMCd23V5+wNOF2xxecQMbjW8mfTXe4bR=
PXzT3
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

Use PPC_LI_MASK and PPC_LI() instead of opencoding.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Utilisation de PPC_LI() et PPC_LI_MASK
---
 arch/powerpc/kernel/module_32.c | 11 ++++-------
 arch/powerpc/kernel/module_64.c |  3 +--
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/module_32.c b/arch/powerpc/kernel/module_3=
2.c
index 715a42f383d0..3d47e9853f3e 100644
--- a/arch/powerpc/kernel/module_32.c
+++ b/arch/powerpc/kernel/module_32.c
@@ -256,9 +256,8 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
 			       value, (uint32_t)location);
 			pr_debug("Location before: %08X.\n",
 			       *(uint32_t *)location);
-			value =3D (*(uint32_t *)location & ~0x03fffffc)
-				| ((value - (uint32_t)location)
-				   & 0x03fffffc);
+			value =3D (*(uint32_t *)location & ~PPC_LI_MASK) |
+				PPC_LI(value - (uint32_t)location);
=20
 			if (patch_instruction(location, ppc_inst(value)))
 				return -EFAULT;
@@ -266,10 +265,8 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
 			pr_debug("Location after: %08X.\n",
 			       *(uint32_t *)location);
 			pr_debug("ie. jump to %08X+%08X =3D %08X\n",
-			       *(uint32_t *)location & 0x03fffffc,
-			       (uint32_t)location,
-			       (*(uint32_t *)location & 0x03fffffc)
-			       + (uint32_t)location);
+				 *(uint32_t *)PPC_LI((uint32_t)location), (uint32_t)location,
+				 (*(uint32_t *)PPC_LI((uint32_t)location)) + (uint32_t)location);
 			break;
=20
 		case R_PPC_REL32:
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_6=
4.c
index c1d87937b962..4c844198185e 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -653,8 +653,7 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 			}
=20
 			/* Only replace bits 2 through 26 */
-			value =3D (*(uint32_t *)location & ~0x03fffffc)
-				| (value & 0x03fffffc);
+			value =3D (*(uint32_t *)location & ~PPC_LI_MASK) | PPC_LI(value);
=20
 			if (patch_instruction((u32 *)location, ppc_inst(value)))
 				return -EFAULT;
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D78C4321E
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:47:44 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235021AbiEIFsw (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S234973AbiEIFqZ (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:46:25 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFEE315BAF8
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:42:32 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKV0CjBz9sVm;
        Mon,  9 May 2022 07:36:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4cy8k89s_P-V; Mon,  9 May 2022 07:36:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF5zBtz9sW3;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id B4F798B775;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id 1KfzM8C6YGTb; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 661938B77C;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aUHZ1=
591263
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:30 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aUVf159126=
2;
        Mon, 9 May 2022 07:36:30 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 14/25] powerpc/ftrace: Remove ftrace_plt_tramps[]
Date: Mon,  9 May 2022 07:36:12 +0200
Message-Id: <daeeb618a6619e3a7e3f82f1bd83ca7c25af6330.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074582; l=3D1209;=
 s=3D20211009; h=3Dfrom:subject:message-id; bh=3DqYxT4k4CRUJ3Sg3spsrdpRhV7E=
ICOLHjYkSCFSOK6Q8=3D; b=3DoIqJjn97eI7VsuU5wJcMjjbaMsuQ381dV81mMSe29UXlSpAoV=
04rk364OQQYFWnNN/l+nVKDEprI uBwoIyaUBYVEnsWrl6KRkhq8mMfPVxkz5OPi1PfEY4bR+1O=
EyPxY
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

ftrace_plt_tramps table is never filled so it is useless.

Remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/trace/ftrace.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace=
/ftrace.c
index f89bcaa5f0fc..010a8c7ff4ac 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -250,7 +250,6 @@ static int setup_mcount_compiler_tramp(unsigned long tr=
amp)
 	int i;
 	ppc_inst_t op;
 	unsigned long ptr;
-	static unsigned long ftrace_plt_tramps[NUM_FTRACE_TRAMPS];
=20
 	/* Is this a known long jump tramp? */
 	for (i =3D 0; i < NUM_FTRACE_TRAMPS; i++)
@@ -259,13 +258,6 @@ static int setup_mcount_compiler_tramp(unsigned long t=
ramp)
 		else if (ftrace_tramps[i] =3D=3D tramp)
 			return 0;
=20
-	/* Is this a known plt tramp? */
-	for (i =3D 0; i < NUM_FTRACE_TRAMPS; i++)
-		if (!ftrace_plt_tramps[i])
-			break;
-		else if (ftrace_plt_tramps[i] =3D=3D tramp)
-			return -1;
-
 	/* New trampoline -- read where this goes */
 	if (copy_inst_from_kernel_nofault(&op, (void *)tramp)) {
 		pr_debug("Fetching opcode failed.\n");
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F75C433EF
	for <linux-kernel@archiver.kernel.org>; Wed, 18 May 2022 12:04:14 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236162AbiERMEM (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Wed, 18 May 2022 08:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S236149AbiERMEE (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Wed, 18 May 2022 08:04:04 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea0=
0::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F7783632C
        for <linux-kernel@vger.kernel.org>; Wed, 18 May 2022 05:04:03 -0700=
 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) se=
rver-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4L3BV63YQ6z4xbP;
        Wed, 18 May 2022 22:03:58 +1000 (AEST)
DKIM-Signature: v=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed; d=3Dellerman.id=
.au;
        s=3D201909; t=3D1652875438;
        bh=3DtCWgxXr7XXOx2XHZ9VRkQnDGXiWz2tzxEYsme/eLKqE=3D;
        h=3DFrom:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=3DbgEw3lhpumxzhiCa0NmLobkT9jCCBKGXzAYGvAAKp4y6+qKbEoTuUzgD3lmp9Zp=
QP
         X19kR3JPHCXNMK0FkYN276FM5ipkoO1DkQKOZOCHCpu4aJfGi+WuSiMSatT7/e6XtJ
         HHvd0uonUT9wLssaLa3oG2bW0M+HhUcdY1/6+AmCT5HcK5LTLFR5lJqn7+ChNlo+2v
         BKS5BkFqVQ35v9urZsHSR0W/eVnDf3aLOMDn1x+BXUXqpgbWiFHfVYR4qQBrZB5VlK
         +/asA2hBbKnUQu0jFO0kubBmsXwfG8aeJX2vd/Ub5EAa8jJ5QMJ6Z16WnstFzAKjKT
         EtWcZCuakOCpQ=3D=3D
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Mackerras <paulus@samba.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 19/25] powerpc/ftrace: Minimise number of #ifdefs
In-Reply-To: <87leuznl5h.fsf@mpe.ellerman.id.au>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
 <18ce6708d6f8c71d87436f9c6019f04df4125128.1652074503.git.christophe.leroy@=
csgroup.eu>
 <1652866821.cdcfe8bs78.naveen@linux.ibm.com>
 <87leuznl5h.fsf@mpe.ellerman.id.au>
Date: Wed, 18 May 2022 22:03:55 +1000
Message-ID: <87ilq3nj2s.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

Michael Ellerman <mpe@ellerman.id.au> writes:
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
>> Christophe Leroy wrote:
>>> A lot of #ifdefs can be replaced by IS_ENABLED()
>>>=20
>>> Do so.
>>>=20
>>> This requires to have kernel_toc_addr() defined at all time
>>> as well as PPC_INST_LD_TOC and PPC_INST_STD_LR.
>>>=20
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>> v2: Moved the setup of pop outside of the big if()/else() in __ftrace_m=
ake_nop()
>>> ---
>>>  arch/powerpc/include/asm/code-patching.h |   2 -
>>>  arch/powerpc/include/asm/module.h        |   2 -
>>>  arch/powerpc/include/asm/sections.h      |  24 +--
>>>  arch/powerpc/kernel/trace/ftrace.c       | 182 +++++++++++------------
>>>  4 files changed, 103 insertions(+), 107 deletions(-)
>>>=20
>>
>> <snip>
>>
>>> @@ -710,6 +707,9 @@ void arch_ftrace_update_code(int command)
>>>=20
>>>  #ifdef CONFIG_PPC64
>>>  #define PACATOC offsetof(struct paca_struct, kernel_toc)
>>> +#else
>>> +#define PACATOC 0
>>> +#endif
>>
>> This conflicts with my fix for the ftrace init tramp:
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220516071422.4=
63738-1-naveen.n.rao@linux.vnet.ibm.com/
>>
>> It probably makes sense to retain #ifdef CONFIG_PPC64, so that we can=20
>> get rid of the PACATOC. Here is an incremental diff:
>
> Where is the incremental diff meant to apply?
>
> It doesn't apply on top of patch 19, or at the end of the series.

I think I worked out what you meant.

Can you check what's in next-test:

  https://github.com/linuxppc/linux/commits/next-test

cheers


From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28FBAC433EF
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:44:10 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234288AbiEIFof (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S234607AbiEIFlg (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:41:36 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DEAD15A75D
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:37:43 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKG4yL1z9sWF;
        Mon,  9 May 2022 07:36:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id EUhEu2-OyNkj; Mon,  9 May 2022 07:36:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF4CL3z9sTC;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 7FD8B8B763;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id eZzkV1eGw1pY; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E7368B76E;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aTXQ1=
591243
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:29 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aT0Q159124=
2;
        Mon, 9 May 2022 07:36:29 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 09/25] powerpc: Replace PPC64_ELF_ABI_v{1/2} by CONFIG_P=
PC64_ELF_ABI_V{1/2}
Date: Mon,  9 May 2022 07:36:07 +0200
Message-Id: <ba13d59e8c50bc9aa6328f1c7f0c0d0278e0a3a7.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074581; l=3D13645=
; s=3D20211009; h=3Dfrom:subject:message-id; bh=3Dn+fJjNfZGXYYu8Kp2QFg9Cg0h=
KwoJLneMbmp5HOOxdM=3D; b=3DomIG1yCBR0+f6qUwQZfTrgrHQ/jxUIry4HNzkKmB9GlofBoN=
1UChs9JT+8E1irnPgrt5RvjCUGLI FLKT4J6lCx/ieT4cUWGxnX8hvOoDdwgM1f64XrsYTBfXES=
4I1xL7
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

Replace all uses of PPC64_ELF_ABI_v1 and PPC64_ELF_ABI_v2 by
resp CONFIG_PPC64_ELF_ABI_V1 and CONFIG_PPC64_ELF_ABI_V2.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/code-patching.h | 12 ++++++------
 arch/powerpc/include/asm/ftrace.h        |  4 ++--
 arch/powerpc/include/asm/linkage.h       |  2 +-
 arch/powerpc/include/asm/ppc_asm.h       |  4 ++--
 arch/powerpc/include/asm/ptrace.h        |  2 +-
 arch/powerpc/kernel/head_64.S            |  2 +-
 arch/powerpc/kernel/interrupt_64.S       |  2 +-
 arch/powerpc/kernel/kprobes.c            |  6 +++---
 arch/powerpc/kernel/misc_64.S            |  2 +-
 arch/powerpc/kernel/module.c             |  4 ++--
 arch/powerpc/kernel/module_64.c          |  4 ++--
 arch/powerpc/kernel/ptrace/ptrace.c      |  2 +-
 arch/powerpc/kernel/trace/ftrace.c       |  4 ++--
 arch/powerpc/kvm/book3s_interrupts.S     |  2 +-
 arch/powerpc/kvm/book3s_rmhandlers.S     |  2 +-
 arch/powerpc/net/bpf_jit.h               |  2 +-
 arch/powerpc/net/bpf_jit_comp.c          |  2 +-
 arch/powerpc/net/bpf_jit_comp64.c        |  4 ++--
 18 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/includ=
e/asm/code-patching.h
index 4260e89f62b1..8b1a10868275 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -130,7 +130,7 @@ bool is_conditional_branch(ppc_inst_t instr);
=20
 static inline unsigned long ppc_function_entry(void *func)
 {
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
 	u32 *insn =3D func;
=20
 	/*
@@ -155,7 +155,7 @@ static inline unsigned long ppc_function_entry(void *fu=
nc)
 		return (unsigned long)(insn + 2);
 	else
 		return (unsigned long)func;
-#elif defined(PPC64_ELF_ABI_v1)
+#elif defined(CONFIG_PPC64_ELF_ABI_V1)
 	/*
 	 * On PPC64 ABIv1 the function pointer actually points to the
 	 * function's descriptor. The first entry in the descriptor is the
@@ -169,7 +169,7 @@ static inline unsigned long ppc_function_entry(void *fu=
nc)
=20
 static inline unsigned long ppc_global_function_entry(void *func)
 {
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
 	/* PPC64 ABIv2 the global entry point is at the address */
 	return (unsigned long)func;
 #else
@@ -186,7 +186,7 @@ static inline unsigned long ppc_global_function_entry(v=
oid *func)
 static inline unsigned long ppc_kallsyms_lookup_name(const char *name)
 {
 	unsigned long addr;
-#ifdef PPC64_ELF_ABI_v1
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 	/* check for dot variant */
 	char dot_name[1 + KSYM_NAME_LEN];
 	bool dot_appended =3D false;
@@ -207,7 +207,7 @@ static inline unsigned long ppc_kallsyms_lookup_name(co=
nst char *name)
 	if (!addr && dot_appended)
 		/* Let's try the original non-dot symbol lookup	*/
 		addr =3D kallsyms_lookup_name(name);
-#elif defined(PPC64_ELF_ABI_v2)
+#elif defined(CONFIG_PPC64_ELF_ABI_V2)
 	addr =3D kallsyms_lookup_name(name);
 	if (addr)
 		addr =3D ppc_function_entry((void *)addr);
@@ -224,7 +224,7 @@ static inline unsigned long ppc_kallsyms_lookup_name(co=
nst char *name)
  */
=20
 /* This must match the definition of STK_GOT in <asm/ppc_asm.h> */
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
 #define R2_STACK_OFFSET         24
 #else
 #define R2_STACK_OFFSET         40
diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/f=
trace.h
index d83758acd1c7..b56166b7ea68 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -64,7 +64,7 @@ void ftrace_graph_func(unsigned long ip, unsigned long pa=
rent_ip,
  * those.
  */
 #define ARCH_HAS_SYSCALL_MATCH_SYM_NAME
-#ifdef PPC64_ELF_ABI_v1
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 static inline bool arch_syscall_match_sym_name(const char *sym, const char=
 *name)
 {
 	/* We need to skip past the initial dot, and the __se_sys alias */
@@ -83,7 +83,7 @@ static inline bool arch_syscall_match_sym_name(const char=
 *sym, const char *name
 		(!strncmp(sym, "ppc32_", 6) && !strcmp(sym + 6, name + 4)) ||
 		(!strncmp(sym, "ppc64_", 6) && !strcmp(sym + 6, name + 4));
 }
-#endif /* PPC64_ELF_ABI_v1 */
+#endif /* CONFIG_PPC64_ELF_ABI_V1 */
 #endif /* CONFIG_FTRACE_SYSCALLS */
=20
 #ifdef CONFIG_PPC64
diff --git a/arch/powerpc/include/asm/linkage.h b/arch/powerpc/include/asm/=
linkage.h
index 1f00d2891d69..b71b9582e754 100644
--- a/arch/powerpc/include/asm/linkage.h
+++ b/arch/powerpc/include/asm/linkage.h
@@ -4,7 +4,7 @@
=20
 #include <asm/types.h>
=20
-#ifdef PPC64_ELF_ABI_v1
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 #define cond_syscall(x) \
 	asm ("\t.weak " #x "\n\t.set " #x ", sys_ni_syscall\n"		\
 	     "\t.weak ." #x "\n\t.set ." #x ", .sys_ni_syscall\n")
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/=
ppc_asm.h
index 4dea2d963738..83c02f5a7f2a 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -149,7 +149,7 @@
 #define __STK_REG(i)   (112 + ((i)-14)*8)
 #define STK_REG(i)     __STK_REG(__REG_##i)
=20
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
 #define STK_GOT		24
 #define __STK_PARAM(i)	(32 + ((i)-3)*8)
 #else
@@ -158,7 +158,7 @@
 #endif
 #define STK_PARAM(i)	__STK_PARAM(__REG_##i)
=20
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
=20
 #define _GLOBAL(name) \
 	.align 2 ; \
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/p=
trace.h
index 42f89e2d8f04..a03403695cd4 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -120,7 +120,7 @@ struct pt_regs
 				 STACK_FRAME_OVERHEAD + KERNEL_REDZONE_SIZE)
 #define STACK_FRAME_MARKER	12
=20
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
 #define STACK_FRAME_MIN_SIZE	32
 #else
 #define STACK_FRAME_MIN_SIZE	STACK_FRAME_OVERHEAD
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 5c5181e8d5f1..f85660d054bd 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -435,7 +435,7 @@ generic_secondary_common_init:
 	ld	r12,CPU_SPEC_RESTORE(r23)
 	cmpdi	0,r12,0
 	beq	3f
-#ifdef PPC64_ELF_ABI_v1
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 	ld	r12,0(r12)
 #endif
 	mtctr	r12
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/inter=
rupt_64.S
index 7bab2d7de372..4caddff1d6f9 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -721,7 +721,7 @@ _GLOBAL(ret_from_kernel_thread)
 	REST_NVGPRS(r1)
 	mtctr	r14
 	mr	r3,r15
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
 	mr	r12,r14
 #endif
 	bctrl
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 7dae0b01abfb..f7af1a3e4f75 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -45,7 +45,7 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, uns=
igned int offset)
 {
 	kprobe_opcode_t *addr =3D NULL;
=20
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
 	/* PPC64 ABIv2 needs local entry point */
 	addr =3D (kprobe_opcode_t *)kallsyms_lookup_name(name);
 	if (addr && !offset) {
@@ -63,7 +63,7 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, uns=
igned int offset)
 #endif
 			addr =3D (kprobe_opcode_t *)ppc_function_entry(addr);
 	}
-#elif defined(PPC64_ELF_ABI_v1)
+#elif defined(CONFIG_PPC64_ELF_ABI_V1)
 	/*
 	 * 64bit powerpc ABIv1 uses function descriptors:
 	 * - Check for the dot variant of the symbol first.
@@ -107,7 +107,7 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, u=
nsigned int offset)
=20
 static bool arch_kprobe_on_func_entry(unsigned long offset)
 {
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
 #ifdef CONFIG_KPROBES_ON_FTRACE
 	return offset <=3D 16;
 #else
diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
index d38a019b38e1..fd6d8d3a548e 100644
--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@ -454,7 +454,7 @@ _GLOBAL(kexec_sequence)
 	beq	1f
=20
 	/* clear out hardware hash page table and tlb */
-#ifdef PPC64_ELF_ABI_v1
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 	ld	r12,0(r27)		/* deref function descriptor */
 #else
 	mr	r12,r27
diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index 97a76a8619fb..f6d6ae0a1692 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -64,13 +64,13 @@ int module_finalize(const Elf_Ehdr *hdr,
 				  (void *)sect->sh_addr + sect->sh_size);
 #endif /* CONFIG_PPC64 */
=20
-#ifdef PPC64_ELF_ABI_v1
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 	sect =3D find_section(hdr, sechdrs, ".opd");
 	if (sect !=3D NULL) {
 		me->arch.start_opd =3D sect->sh_addr;
 		me->arch.end_opd =3D sect->sh_addr + sect->sh_size;
 	}
-#endif /* PPC64_ELF_ABI_v1 */
+#endif /* CONFIG_PPC64_ELF_ABI_V1 */
=20
 #ifdef CONFIG_PPC_BARRIER_NOSPEC
 	sect =3D find_section(hdr, sechdrs, "__spec_barrier_fixup");
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_6=
4.c
index 794720530442..c1d87937b962 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -31,7 +31,7 @@
    this, and makes other things simpler.  Anton?
    --RR.  */
=20
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
=20
 static func_desc_t func_desc(unsigned long addr)
 {
@@ -122,7 +122,7 @@ static u32 ppc64_stub_insns[] =3D {
 	/* Save current r2 value in magic place on the stack. */
 	PPC_RAW_STD(_R2, _R1, R2_STACK_OFFSET),
 	PPC_RAW_LD(_R12, _R11, 32),
-#ifdef PPC64_ELF_ABI_v1
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 	/* Set up new r2 from function descriptor */
 	PPC_RAW_LD(_R2, _R11, 40),
 #endif
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptra=
ce/ptrace.c
index 6d5026a9db4f..9fbe155a9bd0 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -445,7 +445,7 @@ void __init pt_regs_check(void)
 	 */
 	BUILD_BUG_ON(PT_DSCR < sizeof(struct user_pt_regs) / sizeof(unsigned long=
));
=20
-#ifdef PPC64_ELF_ABI_v1
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 	BUILD_BUG_ON(!IS_ENABLED(CONFIG_HAVE_FUNCTION_DESCRIPTORS));
 #else
 	BUILD_BUG_ON(IS_ENABLED(CONFIG_HAVE_FUNCTION_DESCRIPTORS));
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace=
/ftrace.c
index 1b05d33f96c6..0b199fc9cfd3 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -953,7 +953,7 @@ unsigned long prepare_ftrace_return(unsigned long paren=
t, unsigned long ip,
 #endif
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
=20
-#ifdef PPC64_ELF_ABI_v1
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 char *arch_ftrace_match_adjust(char *str, const char *search)
 {
 	if (str[0] =3D=3D '.' && search[0] !=3D '.')
@@ -961,4 +961,4 @@ char *arch_ftrace_match_adjust(char *str, const char *s=
earch)
 	else
 		return str;
 }
-#endif /* PPC64_ELF_ABI_v1 */
+#endif /* CONFIG_PPC64_ELF_ABI_V1 */
diff --git a/arch/powerpc/kvm/book3s_interrupts.S b/arch/powerpc/kvm/book3s=
_interrupts.S
index 25a3679fb590..f4bec2fc51aa 100644
--- a/arch/powerpc/kvm/book3s_interrupts.S
+++ b/arch/powerpc/kvm/book3s_interrupts.S
@@ -15,7 +15,7 @@
 #include <asm/asm-compat.h>
=20
 #if defined(CONFIG_PPC_BOOK3S_64)
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
 #define FUNC(name) 		name
 #else
 #define FUNC(name) 		GLUE(.,name)
diff --git a/arch/powerpc/kvm/book3s_rmhandlers.S b/arch/powerpc/kvm/book3s=
_rmhandlers.S
index b45b750fa77a..03886ca24498 100644
--- a/arch/powerpc/kvm/book3s_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_rmhandlers.S
@@ -26,7 +26,7 @@
=20
 #if defined(CONFIG_PPC_BOOK3S_64)
=20
-#ifdef PPC64_ELF_ABI_v2
+#ifdef CONFIG_PPC64_ELF_ABI_V2
 #define FUNC(name) 		name
 #else
 #define FUNC(name) 		GLUE(.,name)
diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 979701d360da..80d973da9093 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -13,7 +13,7 @@
 #include <asm/types.h>
 #include <asm/ppc-opcode.h>
=20
-#ifdef PPC64_ELF_ABI_v1
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 #define FUNCTION_DESCR_SIZE	24
 #else
 #define FUNCTION_DESCR_SIZE	0
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_com=
p.c
index 427185256216..43e634126514 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -276,7 +276,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *f=
p)
 		 */
 		bpf_jit_dump(flen, proglen, pass, code_base);
=20
-#ifdef PPC64_ELF_ABI_v1
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 	/* Function descriptor nastiness: Address + TOC */
 	((u64 *)image)[0] =3D (u64)code_base;
 	((u64 *)image)[1] =3D local_paca->kernel_toc;
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_c=
omp64.c
index 585f257da045..d7b42f45669e 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -126,7 +126,7 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_=
context *ctx)
 {
 	int i;
=20
-	if (__is_defined(PPC64_ELF_ABI_v2))
+	if (__is_defined(CONFIG_PPC64_ELF_ABI_V2))
 		EMIT(PPC_RAW_LD(_R2, _R13, offsetof(struct paca_struct, kernel_toc)));
=20
 	/*
@@ -266,7 +266,7 @@ static int bpf_jit_emit_tail_call(u32 *image, struct co=
degen_context *ctx, u32 o
 	int b2p_index =3D bpf_to_ppc(BPF_REG_3);
 	int bpf_tailcall_prologue_size =3D 8;
=20
-	if (__is_defined(PPC64_ELF_ABI_v2))
+	if (__is_defined(CONFIG_PPC64_ELF_ABI_V2))
 		bpf_tailcall_prologue_size +=3D 4; /* skip past the toc load */
=20
 	/*
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F26C43219
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:45:52 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235280AbiEIFrg (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S235141AbiEIFq7 (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:46:59 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A27C15E75C
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:43:07 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKk22Chz9sTC;
        Mon,  9 May 2022 07:36:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id oA3kXpf5qK0R; Mon,  9 May 2022 07:36:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKH4Y98z9sWG;
        Mon,  9 May 2022 07:36:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 879928B775;
        Mon,  9 May 2022 07:36:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id qkc3CVA6d5_U; Mon,  9 May 2022 07:36:35 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B1E48B763;
        Mon,  9 May 2022 07:36:35 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aVhI1=
591295
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:31 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aVlO159129=
4;
        Mon, 9 May 2022 07:36:31 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 22/25] powerpc/inst: Remove PPC_INST_BRANCH
Date: Mon,  9 May 2022 07:36:20 +0200
Message-Id: <fa8807108a2ef2287a2c9651d6e1ff7c051923d9.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074582; l=3D1674;=
 s=3D20211009; h=3Dfrom:subject:message-id; bh=3DGoqVFmJgvgqJKNrjF8mpSAEOdU=
Fe9GmQ2Bf3fRLVT0E=3D; b=3D+XbTr0dN0PY6QJbnSgYMbatq2kO9ihP5IQFBaxJjPzfC/f8bz=
qeSAtBMo1hOCtd9YqHYf2Rx6e3J QJNKL+oRCcSfgOFs4tb8VkAMI4NwqmSA/IcaZbZyEMQ6vQV=
DkASd
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

Convert last users of PPC_INST_BRANCH to PPC_RAW_BRANCH()

And remove PPC_INST_BRANCH.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc-opcode.h | 3 +--
 arch/powerpc/lib/feature-fixups.c     | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/a=
sm/ppc-opcode.h
index 3e9aa96ae74b..1871a86c5436 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -290,7 +290,6 @@
 #define PPC_INST_ADDIS			0x3c000000
 #define PPC_INST_ADD			0x7c000214
 #define PPC_INST_DIVD			0x7c0003d2
-#define PPC_INST_BRANCH			0x48000000
 #define PPC_INST_BL			0x48000001
 #define PPC_INST_BRANCH_COND		0x40800000
=20
@@ -575,7 +574,7 @@
 #define PPC_RAW_MTSPR(spr, d)		(0x7c0003a6 | ___PPC_RS(d) | __PPC_SPR(spr)=
)
 #define PPC_RAW_EIEIO()			(0x7c0006ac)
=20
-#define PPC_RAW_BRANCH(addr)		(PPC_INST_BRANCH | ((addr) & 0x03fffffc))
+#define PPC_RAW_BRANCH(offset)		(0x48000000 | PPC_LI(offset))
 #define PPC_RAW_BL(offset)		(0x48000001 | PPC_LI(offset))
=20
 /* Deal with instructions that older assemblers aren't aware of */
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-f=
ixups.c
index 343a78826035..993d3f31832a 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -451,7 +451,7 @@ static int __do_rfi_flush_fixups(void *data)
=20
 	if (types & L1D_FLUSH_FALLBACK)
 		/* b .+16 to fallback flush */
-		instrs[0] =3D PPC_INST_BRANCH | 16;
+		instrs[0] =3D PPC_RAW_BRANCH(16);
=20
 	i =3D 0;
 	if (types & L1D_FLUSH_ORI) {
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82741C4321E
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:44:10 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234769AbiEIFpZ (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S235235AbiEIFng (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:43:36 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095C113FD5E
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:39:44 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKM1Pmbz9sSv;
        Mon,  9 May 2022 07:36:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id G8UoWLCdSTTB; Mon,  9 May 2022 07:36:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF5Nbhz9sTg;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id A8F138B76D;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id d3MkbeER6pAr; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 4B1EB8B774;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aV8B1=
591275
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:31 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aVIP159127=
4;
        Mon, 9 May 2022 07:36:31 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 17/25] powerpc/ftrace: Use size macro instead of opencod=
ing
Date: Mon,  9 May 2022 07:36:15 +0200
Message-Id: <bb6626e884acffe87b58736291df57db3deaa9b9.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074582; l=3D734; =
s=3D20211009; h=3Dfrom:subject:message-id; bh=3DHgZAgEzfpoCvC4jitZoURd9Kz09=
C0R3pxWBfU77ivQQ=3D; b=3DMGaBIOxbI9zEAIf4laxeCK9cQ4c0Thmk5sAzySyvMGKbsKeWBj=
QMEL99ir1mq5Fbmvv0e6aK504D 1QXivr5SDtvEp4Yv8vtYti+b3rt1ur+N30/Nd+a7/Ibz15wV=
8ZLX
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

0x80000000 is SZ_2G. Use it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/trace/ftrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace=
/ftrace.c
index ac3f97dd1729..346b5485e7ef 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -741,7 +741,7 @@ int __init ftrace_dyn_arch_init(void)
 #endif
 	long reladdr =3D addr - kernel_toc_addr();
=20
-	if (reladdr > 0x7FFFFFFF || reladdr < -(0x80000000L)) {
+	if (reladdr >=3D SZ_2G || reladdr < -SZ_2G) {
 		pr_err("Address of %ps out of range of kernel_toc.\n",
 				(void *)addr);
 		return -1;
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C27C433EF
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:43:13 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232926AbiEIFpR (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S235196AbiEIFna (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:43:30 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C7F13FD5E
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:39:36 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKK4tNXz9sT7;
        Mon,  9 May 2022 07:36:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FPwFrJmwv649; Mon,  9 May 2022 07:36:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF4hxJz9sTN;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E74A8B770;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id ZYcdwSDnGbSn; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 45B878B773;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aVqV1=
591287
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:31 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aV8a159128=
6;
        Mon, 9 May 2022 07:36:31 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 20/25] powerpc/inst: Add __copy_inst_from_kernel_nofault=
()
Date: Mon,  9 May 2022 07:36:18 +0200
Message-Id: <1f3702890d6dbd64702b61834753bcc96851c18c.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074582; l=3D1534;=
 s=3D20211009; h=3Dfrom:subject:message-id; bh=3DuNUWZzzzPfrKXF6jD9unCulUYA=
F0cNf3EZC4MAgTHXc=3D; b=3DFrAE5/ZTxKUxlACNTbwIuVUFM//TtMPyfgYdKe5iiMoA7Aa65=
TRgGdY5GTk77k5AJ1bezEwzfA55 wjI9bKlVCxkjBMqMMbYXD+DOJL79X4UWX3vvkawyFLWyCX4=
KXdZC
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

On the same model as get_user() versus __get_user(),
introduce __copy_inst_from_kernel_nofault() which doesn't
check address.

To be used by callers that have already checked that the adress
is a kernel address.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/inst.h | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/ins=
t.h
index 80b6d74146c6..b49aae9f6f27 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -158,13 +158,10 @@ static inline char *__ppc_inst_as_str(char str[PPC_IN=
ST_STR_LEN], ppc_inst_t x)
 	__str;				\
 })
=20
-static inline int copy_inst_from_kernel_nofault(ppc_inst_t *inst, u32 *src=
)
+static inline int __copy_inst_from_kernel_nofault(ppc_inst_t *inst, u32 *s=
rc)
 {
 	unsigned int val, suffix;
=20
-	if (unlikely(!is_kernel_addr((unsigned long)src)))
-		return -ERANGE;
-
 /* See https://github.com/ClangBuiltLinux/linux/issues/1521 */
 #if defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION < 140000
 	val =3D suffix =3D 0;
@@ -181,4 +178,12 @@ static inline int copy_inst_from_kernel_nofault(ppc_in=
st_t *inst, u32 *src)
 	return -EFAULT;
 }
=20
+static inline int copy_inst_from_kernel_nofault(ppc_inst_t *inst, u32 *src=
)
+{
+	if (unlikely(!is_kernel_addr((unsigned long)src)))
+		return -ERANGE;
+
+	return __copy_inst_from_kernel_nofault(inst, src);
+}
+
 #endif /* _ASM_POWERPC_INST_H */
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF605C433FE
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:45:52 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235251AbiEIFr1 (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S235122AbiEIFq4 (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:46:56 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12A9B15E746
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:43:04 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKj3Thqz9sWD;
        Mon,  9 May 2022 07:36:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Or9R2v2D7Nu5; Mon,  9 May 2022 07:36:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKH4PyTz9sTC;
        Mon,  9 May 2022 07:36:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 8464A8B773;
        Mon,  9 May 2022 07:36:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id Q0HI4tzoWP0t; Mon,  9 May 2022 07:36:35 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 5BD448B76C;
        Mon,  9 May 2022 07:36:35 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aWD01=
591303
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:32 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aV65159130=
2;
        Mon, 9 May 2022 07:36:31 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 24/25] powerpc/inst: Remove PPC_INST_BL
Date: Mon,  9 May 2022 07:36:22 +0200
Message-Id: <d9eacb758e7ae7cf224211ebe3f6f7d409a333be.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074582; l=3D1300;=
 s=3D20211009; h=3Dfrom:subject:message-id; bh=3DsW/JSfIHiKBxCIZ62GcYgvl+OL=
yOrCgP+Naw3li71dY=3D; b=3DrGCdd50F7rnSj/5HOtCZkuVJfJRHBEIjWs/M2+DOTF7Irsf8C=
DWdYFx9mhpvY3R1CHqbYdGM8TRY +Rlgwu1AC1XdpwnXjqGwwZLXn9UhIM9PUzF/JJOgCvrxV+S=
04oEG
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

Convert last users of PPC_INST_BL to PPC_RAW_BL()

And remove PPC_INST_BL.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc-opcode.h | 1 -
 arch/powerpc/net/bpf_jit.h            | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/a=
sm/ppc-opcode.h
index 1871a86c5436..9ca8996ee1cd 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -290,7 +290,6 @@
 #define PPC_INST_ADDIS			0x3c000000
 #define PPC_INST_ADD			0x7c000214
 #define PPC_INST_DIVD			0x7c0003d2
-#define PPC_INST_BL			0x48000001
 #define PPC_INST_BRANCH_COND		0x40800000
=20
 /* Prefixes */
diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 80d973da9093..a4f7880f959d 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -35,7 +35,7 @@
 	} while (0)
=20
 /* bl (unconditional 'branch' with link) */
-#define PPC_BL(dest)	EMIT(PPC_INST_BL | (((dest) - (unsigned long)(image +=
 ctx->idx)) & 0x03fffffc))
+#define PPC_BL(dest)	EMIT(PPC_RAW_BL((dest) - (unsigned long)(image + ctx-=
>idx)))
=20
 /* "cond" here covers BO:BI fields. */
 #define PPC_BCC_SHORT(cond, dest)					      \
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF896C4167E
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:47:44 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235137AbiEIFtM (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S235008AbiEIFqc (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:46:32 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7F1615E746
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:42:39 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKY0Cfpz9sVq;
        Mon,  9 May 2022 07:36:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id lmN4D4BYOimX; Mon,  9 May 2022 07:36:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF5xcbz9sW1;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id C3D508B763;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id widlIQcjDZqV; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 7E09C8B796;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aS2O1=
591211
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:28 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aRLp159120=
9;
        Mon, 9 May 2022 07:36:27 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 01/25] powerpc/ftrace: Refactor prepare_ftrace_return()
Date: Mon,  9 May 2022 07:35:59 +0200
Message-Id: <0d42deafe353980c66cf19d3132638c05ba9f4a9.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074581; l=3D1899;=
 s=3D20211009; h=3Dfrom:subject:message-id; bh=3DzXRjPYU7QaID1rculDvXRerDW2=
vtk7P4KyqgYPe84dw=3D; b=3Do1G0sYC8erkJqZcmp7GkD0pST9lh2bvwHstrjnoDn3xdXwNCX=
y2S3uRTP1fhToxjlMs0JGWHMdDc Oz314hUEAXYYDKAiHwHWKPvo68IJM2f/GXaJeTSb2vV7fHg=
tX/dp
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

When we have CONFIG_DYNAMIC_FTRACE_WITH_ARGS,
prepare_ftrace_return() is called by ftrace_graph_func()
otherwise prepare_ftrace_return() is called from assembly.

Refactor prepare_ftrace_return() into a static
__prepare_ftrace_return() that will be called by both
prepare_ftrace_return() and ftrace_graph_func().

It will allow GCC to fold __prepare_ftrace_return() inside
ftrace_graph_func().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/trace/ftrace.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace=
/ftrace.c
index 4ee04aacf9f1..7a266fd469b7 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -939,8 +939,8 @@ int ftrace_disable_ftrace_graph_caller(void)
  * Hook the return address and push it in the stack of return addrs
  * in current thread info. Return the address we want to divert to.
  */
-unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip=
,
-						unsigned long sp)
+static unsigned long
+__prepare_ftrace_return(unsigned long parent, unsigned long ip, unsigned l=
ong sp)
 {
 	unsigned long return_hooker;
 	int bit;
@@ -969,7 +969,13 @@ unsigned long prepare_ftrace_return(unsigned long pare=
nt, unsigned long ip,
 void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
 		       struct ftrace_ops *op, struct ftrace_regs *fregs)
 {
-	fregs->regs.link =3D prepare_ftrace_return(parent_ip, ip, fregs->regs.gpr=
[1]);
+	fregs->regs.link =3D __prepare_ftrace_return(parent_ip, ip, fregs->regs.g=
pr[1]);
+}
+#else
+unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip=
,
+				    unsigned long sp)
+{
+	return __prepare_ftrace_return(parent, ip, sp);
 }
 #endif
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95980C43217
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:47:44 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234870AbiEIFsp (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S234888AbiEIFpq (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:45:46 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4015159599
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:41:51 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKS0gHfz9sVd;
        Mon,  9 May 2022 07:36:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id OgspKrjzC2SQ; Mon,  9 May 2022 07:36:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF5mp6z9sVm;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id BDBF98B776;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id 1PkpxPF2XuRO; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 565958B778;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aTv31=
591231
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:29 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aTVr159123=
0;
        Mon, 9 May 2022 07:36:29 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 06/25] powerpc/ftrace: Inline ftrace_modify_code()
Date: Mon,  9 May 2022 07:36:04 +0200
Message-Id: <1597a06d57cfc80e6853838c4066e799bf6c7977.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074581; l=3D1024;=
 s=3D20211009; h=3Dfrom:subject:message-id; bh=3DgUl26aWBapldceuYTq45qkCOSg=
pcMCNP7bN7cPhPsTs=3D; b=3DGlvWJyB70cjLYKrxKqYkNh2CJ9793ojD+nKBhyXJzI1kF2uEv=
qki+zAHGXFZZ/GnSCLJ/Xb5PBVp egGtikEEBk/2KTFk2EAxKDvnN9ainbqnkoOt8NCSrc4W8cf=
vmeJS
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

Inlining ftrace_modify_code(), it increases a bit the
size of ftrace code but brings 5% improvment on ftrace
activation.

Usually in C files we let gcc decide what to do but here
it really help to 'help' gcc to decide to inline, thought
we don't want to force it with an __always_inline that
would be too much for CONFIG_CC_OPTIMIZE_FOR_SIZE.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: More explanation in commit message
---
 arch/powerpc/kernel/trace/ftrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace=
/ftrace.c
index 41c45b9c7f39..98e82fa4980f 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -53,7 +53,7 @@ ftrace_call_replace(unsigned long ip, unsigned long addr,=
 int link)
 	return op;
 }
=20
-static int
+static inline int
 ftrace_modify_code(unsigned long ip, ppc_inst_t old, ppc_inst_t new)
 {
 	ppc_inst_t replaced;
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90AC3C4332F
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:45:52 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235227AbiEIFrU (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:47:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S235087AbiEIFqx (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:46:53 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA54315E75A
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:43:00 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKh15P4z9sWM;
        Mon,  9 May 2022 07:36:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 868ZzAbfAgVE; Mon,  9 May 2022 07:36:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF6WrXz9sWD;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id D431C8B778;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id zfxjU5nf4LtZ; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 8742A8B798;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aTJX1=
591227
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:29 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aTln159122=
6;
        Mon, 9 May 2022 07:36:29 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 05/25] powerpc/code-patching: Inline create_branch()
Date: Mon,  9 May 2022 07:36:03 +0200
Message-Id: <69851cc9a7bf8f03d025e6d29e165f2d0bd3bb6e.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074581; l=3D2728;=
 s=3D20211009; h=3Dfrom:subject:message-id; bh=3Dd2swIJrMmUDKV+uH13vJ0j/DNa=
2ajgVmApWQwP8siB0=3D; b=3DZ5Jll7/9z25GY0FND2b02eHhlHnW3KCgNNePBgJIm27iAC4z/=
tdn0RU4s56Ml0Tu0+G6PBjGjNYp sjHBTg4CB3PosHQT2R6Hp/G0eH/TdF+9+VaWvMTt2hRRjqO=
r6ma0
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

create_branch() is a good candidate for inlining because:
- Flags can be folded in.
- Range tests are likely to be already done.

Hence reducing the create_branch() to only a set of instructions.

So inline it.

It improves ftrace activation by 10%.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/code-patching.h | 22 ++++++++++++++++++++--
 arch/powerpc/lib/code-patching.c         | 20 --------------------
 2 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/includ=
e/asm/code-patching.h
index e7c5df50cb4e..4260e89f62b1 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -49,8 +49,26 @@ static inline bool is_offset_in_cond_branch_range(long o=
ffset)
 	return offset >=3D -0x8000 && offset <=3D 0x7fff && !(offset & 0x3);
 }
=20
-int create_branch(ppc_inst_t *instr, const u32 *addr,
-		  unsigned long target, int flags);
+static inline int create_branch(ppc_inst_t *instr, const u32 *addr,
+				unsigned long target, int flags)
+{
+	long offset;
+
+	*instr =3D ppc_inst(0);
+	offset =3D target;
+	if (! (flags & BRANCH_ABSOLUTE))
+		offset =3D offset - (unsigned long)addr;
+
+	/* Check we can represent the target in the instruction format */
+	if (!is_offset_in_branch_range(offset))
+		return 1;
+
+	/* Mask out the flags and target, so they don't step on each other. */
+	*instr =3D ppc_inst(0x48000000 | (flags & 0x3) | (offset & 0x03FFFFFC));
+
+	return 0;
+}
+
 int create_cond_branch(ppc_inst_t *instr, const u32 *addr,
 		       unsigned long target, int flags);
 int patch_branch(u32 *addr, unsigned long target, int flags);
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patch=
ing.c
index 58262c7e447c..7adbdb05fee7 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -230,26 +230,6 @@ bool is_conditional_branch(ppc_inst_t instr)
 }
 NOKPROBE_SYMBOL(is_conditional_branch);
=20
-int create_branch(ppc_inst_t *instr, const u32 *addr,
-		  unsigned long target, int flags)
-{
-	long offset;
-
-	*instr =3D ppc_inst(0);
-	offset =3D target;
-	if (! (flags & BRANCH_ABSOLUTE))
-		offset =3D offset - (unsigned long)addr;
-
-	/* Check we can represent the target in the instruction format */
-	if (!is_offset_in_branch_range(offset))
-		return 1;
-
-	/* Mask out the flags and target, so they don't step on each other. */
-	*instr =3D ppc_inst(0x48000000 | (flags & 0x3) | (offset & 0x03FFFFFC));
-
-	return 0;
-}
-
 int create_cond_branch(ppc_inst_t *instr, const u32 *addr,
 		       unsigned long target, int flags)
 {
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80AA4C4332F
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:47:44 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234838AbiEIFsb (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S234621AbiEIFoz (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:44:55 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0670D110312
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:41:03 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKR1HpYz9sVj;
        Mon,  9 May 2022 07:36:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id o9_dxTuXoPLn; Mon,  9 May 2022 07:36:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF5dFVz9sVd;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id ACA588B76E;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id bU37uZxVXqHF; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 51AA28B776;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aR9w1=
591206
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:27 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aQXb159120=
5;
        Mon, 9 May 2022 07:36:26 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 00/25] powerpc: ftrace optimisation and cleanup and more=
 [v3]
Date: Mon,  9 May 2022 07:35:58 +0200
Message-Id: <cover.1652074503.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074581; l=3D3842;=
 s=3D20211009; h=3Dfrom:subject:message-id; bh=3D51wV9eNRVhtkrENuM3ARQMOo9s=
4nz33TjB7nd9UuZ9k=3D; b=3D5cHXoeQUSw6/s49i9T83aDQblwQx/bkwWim71GkTXPcdJAmIQ=
N1FULV+fhrAMAr9boUqwdTVRCC7 ADMcx+S4C56WgZ2JRzvaAMU49HONnidpXa8Utb0gYagb40p=
okvnE
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

This series provides optimisation and cleanup of ftrace on powerpc.

With this series ftrace activation is about 20% faster on an 8xx.

At the end of the series come additional cleanups around ppc-opcode,
that would likely conflict with this series if posted separately.

Change since v2:
- The only change in v3 is in patch 21, to fix sparse problems reported by =
the Robot.

Main changes since v1 (details in after each individual patch description):
- Added 3 patches (8, 9, 10) that convert PPC64_ELF_ABI_v{1/2} macros by CO=
NFIG_PPC64_ELF_ABI_V{1/2}
- Taken comments from Naveen

Christophe Leroy (25):
  powerpc/ftrace: Refactor prepare_ftrace_return()
  powerpc/ftrace: Remove redundant create_branch() calls
  powerpc/code-patching: Inline is_offset_in_{cond}_branch_range()
  powerpc/ftrace: Use is_offset_in_branch_range()
  powerpc/code-patching: Inline create_branch()
  powerpc/ftrace: Inline ftrace_modify_code()
  powerpc/ftrace: Use patch_instruction() return directly
  powerpc: Add CONFIG_PPC64_ELF_ABI_V1 and CONFIG_PPC64_ELF_ABI_V2
  powerpc: Replace PPC64_ELF_ABI_v{1/2} by CONFIG_PPC64_ELF_ABI_V{1/2}
  powerpc: Finalise cleanup around ABI use
  powerpc/ftrace: Make __ftrace_make_{nop/call}() common to PPC32 and
    PPC64
  powerpc/ftrace: Don't include ftrace.o for CONFIG_FTRACE_SYSCALLS
  powerpc/ftrace: Use CONFIG_FUNCTION_TRACER instead of
    CONFIG_DYNAMIC_FTRACE
  powerpc/ftrace: Remove ftrace_plt_tramps[]
  powerpc/ftrace: Use BRANCH_SET_LINK instead of value 1
  powerpc/ftrace: Use PPC_RAW_xxx() macros instead of opencoding.
  powerpc/ftrace: Use size macro instead of opencoding
  powerpc/ftrace: Simplify expected_nop_sequence()
  powerpc/ftrace: Minimise number of #ifdefs
  powerpc/inst: Add __copy_inst_from_kernel_nofault()
  powerpc/ftrace: Don't use copy_from_kernel_nofault() in
    module_trampoline_target()
  powerpc/inst: Remove PPC_INST_BRANCH
  powerpc/modules: Use PPC_LI macros instead of opencoding
  powerpc/inst: Remove PPC_INST_BL
  powerpc/opcodes: Remove unused PPC_INST_XXX macros

 arch/powerpc/Kconfig                     |   2 +-
 arch/powerpc/Makefile                    |  12 +-
 arch/powerpc/boot/Makefile               |   2 +
 arch/powerpc/include/asm/code-patching.h |  65 +++-
 arch/powerpc/include/asm/ftrace.h        |   4 +-
 arch/powerpc/include/asm/inst.h          |  13 +-
 arch/powerpc/include/asm/linkage.h       |   2 +-
 arch/powerpc/include/asm/module.h        |   2 -
 arch/powerpc/include/asm/ppc-opcode.h    |  22 +-
 arch/powerpc/include/asm/ppc_asm.h       |   4 +-
 arch/powerpc/include/asm/ptrace.h        |   2 +-
 arch/powerpc/include/asm/sections.h      |  24 +-
 arch/powerpc/include/asm/types.h         |   8 -
 arch/powerpc/kernel/fadump.c             |  13 +-
 arch/powerpc/kernel/head_64.S            |   2 +-
 arch/powerpc/kernel/interrupt_64.S       |   2 +-
 arch/powerpc/kernel/kprobes.c            |   6 +-
 arch/powerpc/kernel/misc_64.S            |   2 +-
 arch/powerpc/kernel/module.c             |   4 +-
 arch/powerpc/kernel/module_32.c          |  38 ++-
 arch/powerpc/kernel/module_64.c          |   7 +-
 arch/powerpc/kernel/ptrace/ptrace.c      |   6 -
 arch/powerpc/kernel/trace/Makefile       |   5 +-
 arch/powerpc/kernel/trace/ftrace.c       | 375 +++++++----------------
 arch/powerpc/kvm/book3s_interrupts.S     |   2 +-
 arch/powerpc/kvm/book3s_rmhandlers.S     |   2 +-
 arch/powerpc/lib/code-patching.c         |  49 +--
 arch/powerpc/lib/feature-fixups.c        |   2 +-
 arch/powerpc/net/bpf_jit.h               |   4 +-
 arch/powerpc/net/bpf_jit_comp.c          |   2 +-
 arch/powerpc/net/bpf_jit_comp64.c        |   4 +-
 arch/powerpc/platforms/Kconfig.cputype   |   6 +
 32 files changed, 271 insertions(+), 422 deletions(-)

--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30ED1C433F5
	for <linux-kernel@archiver.kernel.org>; Wed, 18 May 2022 12:13:16 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236320AbiERMNL (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Wed, 18 May 2022 08:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S236251AbiERMMw (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Wed, 18 May 2022 08:12:52 -0400
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90=
089.outbound.protection.outlook.com [40.107.9.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB1BE14CDDC
        for <linux-kernel@vger.kernel.org>; Wed, 18 May 2022 05:12:50 -0700=
 (PDT)
ARC-Seal: i=3D1; a=3Drsa-sha256; s=3Darcselector9901; d=3Dmicrosoft.com; cv=
=3Dnone;
 b=3DePVzX5anI5PRNEG/Orx7PKSDuKBhXb76ZwrdhIqKp5RMQcoVRpjYqioAsvNmFOyZ+5y1RI=
yRP+iA7HnjVCGygXqLobe40ugeahfm6QrX/aJqSm78qpsgbu/A4rQ5hOFFpU1zxUpIIPUdfAEMd=
tQjyHmmZIVIJp+mS3/fTZ5xgFfpnHyrAHVaWy6CRGAm3PjKXOBjjd1OcbWj4GbpaL0cPRkoJrgo=
kk16lcOmAskIyQvPA6yrUP+00OLLXMb5q9loRGp2AasTIGt9kV55lDtn6asUJJXzTuxEpyaXKbM=
qdXOIxxh+S5ka1CSynj1XM/vrkqdZTrWIUGsUq3rMbzpRsw=3D=3D
ARC-Message-Signature: i=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed; d=3Dmicr=
osoft.com;
 s=3Darcselector9901;
 h=3DFrom:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-A=
ntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Ex=
change-AntiSpam-MessageData-1;
 bh=3DVRsqZxS6cqFZUroR0lRcJqEBJVTJ9qkAqg1bBBdLgm8=3D;
 b=3DPKfZRHnS3U9jQxXV9I/8RtjQDrWH8XNJs5UrAs40UTvAZPNE/qXIAK0/vs2r+uxICM8Eyx=
I/i0e9uLl4ovyy3wOs78wMe4pe7Rxyb1qP3r7iBju5C5bqFAO62eawESDqEY+gAbLUP6IHhHUWi=
6WUbtFLrVRnzxdDWdfkZI08zOca6hrxzwJkoQ9h1O+gEqraAi07ngro4QXWKjbEXup0xJHQfqFf=
clbv3PJgrOThsuEzZCftNUKgH3Suy1I2f6Z8qfZzBCvSTErBKNh4PPcL/MDVaDKy+AF3d5LxEf+=
BXwez3DRheOMZf+c1LqIB49dFeCI03Z9bIXC/tWKLqgQpAg=3D=3D
ARC-Authentication-Results: i=3D1; mx.microsoft.com 1; spf=3Dpass
 smtp.mailfrom=3Dcsgroup.eu; dmarc=3Dpass action=3Dnone header.from=3Dcsgro=
up.eu;
 dkim=3Dpass header.d=3Dcsgroup.eu; arc=3Dnone
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15=
)
 by PR0P264MB3855.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:25a::24) with
 Microsoft SMTP Server (version=3DTLS1_2,
 cipher=3DTLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Wed, 18 =
May
 2022 12:12:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d%8]) with mapi id 15.20.5273.015; Wed, 18 May 2=
022
 12:12:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
        "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v3 19/25] powerpc/ftrace: Minimise number of #ifdefs
Thread-Topic: [PATCH v3 19/25] powerpc/ftrace: Minimise number of #ifdefs
Thread-Index: AQHYY2bDo7452AR5CUeMZrEOJfuwwK0kcUMAgAAaGwCAAAyGgIAAAnqA
Date: Wed, 18 May 2022 12:12:47 +0000
Message-ID: <a7e47e3d-9b2b-ee12-d38c-3e6bbba83f7d@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
 <18ce6708d6f8c71d87436f9c6019f04df4125128.1652074503.git.christophe.leroy@=
csgroup.eu>
 <1652866821.cdcfe8bs78.naveen@linux.ibm.com>
 <87leuznl5h.fsf@mpe.ellerman.id.au> <87ilq3nj2s.fsf@mpe.ellerman.id.au>
In-Reply-To: <87ilq3nj2s.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach:=20
X-MS-TNEF-Correlator:=20
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=3Dnone (message not signed)
 header.d=3Dnone;dmarc=3Dnone action=3Dnone header.from=3Dcsgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4ef897b-5506-4485-8eea-08da38c7b9=
06
x-ms-traffictypediagnostic: PR0P264MB3855:EE_
x-microsoft-antispam-prvs: <PR0P264MB38550A28379592959F7CCB54EDD19@PR0P264M=
B3855.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7CC/nnIhAdxI3glNQ0AyXe3xP3OT8RkT0nGNTM5u=
6O2twDuEv79szcM9Ktf/erxnyetrgCFWigP2Kh/tOELvzc1xektyCVujxO/iUpkbuKnCe4MdehA=
R4s9wg/RWmsfEZ9xfVIOHX0pOlM1EgXgPwlQ+Adw+6pfL56vlDm0aRXkqduDsoApLGxBOi4nNw/=
/85vDvWrrpqH2IivORNYM0M6SucfqIfAOp27GPHOaW/+tkNDiUxcFVO1nzP/UVw4XjDd1pEgpbF=
3H3W6jaHvYJRHAeXYpzXTNpnTaYIZzlX8c8MMdlfR55EhBWl++8GUhXXyItM+1E9TAxPhoQp/qq=
4PE5lhavWDaFp4SghGMqfmAzdEpZw4sRflCKvgO8a6gE8wZuSYk+SC1VpU0IKSGOJkfzuwE0dpR=
b3II4GnKBTRbygDwiZq6oPulPLqwSknLU+0DGO/ZejW/KzUqVe3DXJu4egI0BCKRpv4ZD6bOfWw=
Ht8ZDRgKoOlQ4e0eL7svWgzT2lIA632zYIY/OAwiPHo6IpUfaKle3aS9h4V0cJ65FHN+t1iFZ+4=
GsR3J/TtSJdTQpeXOYqwJ3ZvxThM95UcT0qGuPeyQZuegC83kmLsk99A60Nd61J8CiLEwvn0gqS=
9n21P9yuYWLJsMwzEethTb0I9OHamC3k7yRp5KDtIDydYQb8VbAsQX9RRGl0TUHYsSU+0ehRGtW=
9Cjmmddw0NkY3JARW+Tjj8qjLA5chzMqXAQmsP+3B3CLN0OuyDM53rxGar3LXi0TPGi5WLmhXXw=
0g4DpdbHhC/MnY7qY68sIpEtm+4J02Rri8tluYp/TbBeJHKR/c26D93ZIHz40hp1HdWf3zaF10b=
HoqRtbHP1E=3D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;I=
PV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:=
(13230001)(4636009)(366004)(66946007)(4326008)(31696002)(66574015)(83380400=
001)(76116006)(91956017)(38070700005)(86362001)(8676002)(966005)(44832011)(=
6506007)(508600001)(6512007)(26005)(8936002)(5660300002)(38100700002)(66446=
008)(64756008)(66556008)(66476007)(122000001)(186003)(2616005)(54906003)(29=
06002)(316002)(110136005)(31686004)(36756003)(6486002)(71200400001)(4374050=
0002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =3D?utf-8?B?bTNBUkV5Rkl4UjNBR3V4WTBXV=
WMvTS9lZlJ6SU55OHBYblorN20zVkJOZkNz?=3D
 =3D?utf-8?B?M3RXZ2IycDBvcFNjWDg1VW1iY1hUUWpHMzNsT2VKMmRhMEdDOVlnTjVOWk9v?=
=3D
 =3D?utf-8?B?bGVCOFh3UkxEUGFkV2JhdjdsQUdaQXVVdWxYTXluWFZyVDN1SithK1lLejcv?=
=3D
 =3D?utf-8?B?d1lRTUVpTWpaell4aUVySXFwVVB2TlZzVVhDc29KK3o5LzZYc0FOUlhRc1l6?=
=3D
 =3D?utf-8?B?ZjR4ZWZKbmtVeDltS0VrSzNjd1BtTHhzelJ6dHIrRkZSRHh3UlJiOEdoMzM4?=
=3D
 =3D?utf-8?B?a1NSa0Z1K3UxNDY5REYwNS9FSktLM2hEdFl2M3ptaGFHamNwMlVtMFdlajJu?=
=3D
 =3D?utf-8?B?K0p5MngydzU0a3IzR2djdmllSnRaMXZ6UVVVVnlJelR2K3Y4cnFhamptdnB4?=
=3D
 =3D?utf-8?B?U0VvQm96dkFqM0tTdXBmeHk4ZHJhaXRKcEhEQ1dEUWkvR3cveEJNTE9MSnNF?=
=3D
 =3D?utf-8?B?VzVRc1FvWHpSYXFoTmRlOFlmYTdXQXpicU1RRmM2RkhoNll6bE51K0dUQWEv?=
=3D
 =3D?utf-8?B?eUY5RUZMVEJ3M0lINkNhWHdGNnIwVzJuN3dLMjhvOE1nMGo3VFRvUmpyTVZ0?=
=3D
 =3D?utf-8?B?dy90a2lmTCtzRys2LzN2NG94Z1c0TWhRRHMxT2Z3K2lIUDlJOE9TR2JTWEw5?=
=3D
 =3D?utf-8?B?R09pTHNrdUJKLzRtL0NvWDFaVWtZQkhSdlJPY292ZERvaVNubE83eUV3T3Ay?=
=3D
 =3D?utf-8?B?N3ZlU2FBdzEwZk9XZnp4Ky9DWTJIbDIrQnhrdjQxVlhLNHhhdXhLeUlaeE1u?=
=3D
 =3D?utf-8?B?UlAyRDlsRmJvbGFIWWhJdG5Hb2lnL2sxL3Vzcm8zWFZYSFo5ODVvUWtKRHdB?=
=3D
 =3D?utf-8?B?Z2Ivdk9LMUV1OE9RdS9YOVQrcGRwNWhmR1BVaEUvTHhqWWpEamV4QnNjemZP?=
=3D
 =3D?utf-8?B?RDAvakROZmhEUWtlVUNWZFRyLzVOdFhNOVh2NzlwTFVTY2NVTTdoK0NxRHJM?=
=3D
 =3D?utf-8?B?MUNOUkxVYlZsT0dILzZUMy8wNU1VNEIvdkxxNzVXekRVaXF5d1pmTDFIUm11?=
=3D
 =3D?utf-8?B?MmxIY2Mrd0FDQS9TRXhQblYzaEpSOTFobnl4d2wydFpIaC9CSHVPZVpRNFhV?=
=3D
 =3D?utf-8?B?S2pEWWZhTG1jNDR3czBldlJLeWNUaHpNY3luZUpONDROQzUrSjBGUHMvYSto?=
=3D
 =3D?utf-8?B?L05RZnd6VkwzeVVVUG81L2dSSDNDQTZnVlMxSUxoTmJnVGl0Tmx1Q3VRSUJL?=
=3D
 =3D?utf-8?B?UW9ZaERmQUpad3VhL3h0SUc1OEluTFkxTjI2SkIzM2NtRmRrRldiMXA0U2V5?=
=3D
 =3D?utf-8?B?Y040MU92aGN3cExKZVdxalJ4T1ZkeGo5QW9iRUgzT0NSMHNRSk01WWVRT0o2?=
=3D
 =3D?utf-8?B?K0xKanlkcFpSOTN5N215eWpoT0dFOXptZlJKb1U1UjdZYmJTRjJudnhqc2J4?=
=3D
 =3D?utf-8?B?a0NhSEtySmVQRkFZc0M0TkE4NVRkZ2d4cEVNNmM5L05FdW5sdnREQk8xZDRT?=
=3D
 =3D?utf-8?B?bFBBWnVPT1c3NFA0cjlPZTNYZThXNk80ZEJtbURtY1RmTGh2QXJEZEFwSkFa?=
=3D
 =3D?utf-8?B?c0FPOEtmN1pnV1lYVXo2TEFFSEt3NGRwTUwwZEw2ckhxb0w1MUcvZUYwT09u?=
=3D
 =3D?utf-8?B?ZFEreGVmOU0zaVU3R2N1Q3BCaGMzNDAvNmQzOGVKTmMrL1FObWNBVVozTmRs?=
=3D
 =3D?utf-8?B?RHI2UDlWZVRWY2Z2Vmhjd3BRV0VFOVFwQXVIejFoNStHVGZZSHFGcmZUY3lx?=
=3D
 =3D?utf-8?B?VmhLMEFsM2dESVQyanN6eERJTmJFeWxqZ3JxSXNDTERFNVJ3MXFuT0kwbC8x?=
=3D
 =3D?utf-8?B?K1VIN3lxVXJiSVZZeG9xVmxkZjl6ampKOVlSZE5NY2ZUUHlGclpZOGx3a05h?=
=3D
 =3D?utf-8?B?Ulp2bUg4cmVzajZpN1BkZE9PazJpUEZYU1A2ME95bWphUFQ1aTlqMDA0YUJR?=
=3D
 =3D?utf-8?B?cDh5b2xtcStlbDFiQmlOazRZeVN2OUxaeFAxVVlKSkx4RWdjelNWSWNHdXFV?=
=3D
 =3D?utf-8?B?amYwQTRJS2J4S2NJOHlsQWk5TjN2NkJOS3BuMHNCc2YzQm1HK1lPKys2YlNj?=
=3D
 =3D?utf-8?B?U1ozZEhzZ0tsWmdBcEQ2cER4M1hqb2d0VUltcTlQL3VhVXhMaEpJaEppTVdN?=
=3D
 =3D?utf-8?B?Ti9MV1RrbXg2NVdZL1psT3hMNjdDcXhlb2VyQ3A0QllTbkY4a3dOeC94MkRN?=
=3D
 =3D?utf-8?B?TjRpaTByU2lzK0RzR3FYVUlBT0lDUjlaYVBSOG5PbFdMUFJtcnY0K3g5OUJz?=
=3D
 =3D?utf-8?B?VlRlbTJtT0M1N0YvUzlJNTN5Tjh0bjFqU3JQM2FWdUNZblk2ZFhNZDd1WXFI?=
=3D
 =3D?utf-8?B?NHMraERGbTBhcGZZWTZOcjRDQlQzK0lBRjZGWFp0M1FOODBoTzQ1TS83dWdy?=
=3D
 =3D?utf-8?B?N0tpZThZUXlVcFJMdnVZTEFXb2FVK3hJUkVnZnkzQTBKZVFEK3pyMm05bDhi?=
=3D
 =3D?utf-8?Q?k4ap3P2uJxoDAiMLvvWIAJG+iLxjHcXPSqMjD?=3D
Content-Type: text/plain; charset=3D"utf-8"
Content-ID: <A78A15EFBD6C904FB76E7ECB1D499349@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.CO=
M
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ef897b-5506-4485-8eea-08da3=
8c7b906
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 12:12:47.9584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xdr45ku2/x1YpLISaFlcB6fYNAq0tz=
284wB4KcX86YGrmNlyZi1A1BmpnjBwqYs4oq5GTPqPPtcXT1yCouXLBhAVGeY7aT9c3FOeRouqf=
tk=3D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3855
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

DQoNCkxlIDE4LzA1LzIwMjIgw6AgMTQ6MDMsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDo=
N
Cj4gTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1PiB3cml0ZXM6DQo+PiAiTmF=
2
ZWVuIE4uIFJhbyIgPG5hdmVlbi5uLnJhb0BsaW51eC52bmV0LmlibS5jb20+IHdyaXRlczoNCj4=
+
PiBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4+PiBBIGxvdCBvZiAjaWZkZWZzIGNhbiBiZSB=
y
ZXBsYWNlZCBieSBJU19FTkFCTEVEKCkNCj4+Pj4NCj4+Pj4gRG8gc28uDQo+Pj4+DQo+Pj4+IFR=
o
aXMgcmVxdWlyZXMgdG8gaGF2ZSBrZXJuZWxfdG9jX2FkZHIoKSBkZWZpbmVkIGF0IGFsbCB0aW1=
l
DQo+Pj4+IGFzIHdlbGwgYXMgUFBDX0lOU1RfTERfVE9DIGFuZCBQUENfSU5TVF9TVERfTFIuDQo=
+
Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGV=
y
b3lAY3Nncm91cC5ldT4NCj4+Pj4gLS0tDQo+Pj4+IHYyOiBNb3ZlZCB0aGUgc2V0dXAgb2YgcG9=
w
IG91dHNpZGUgb2YgdGhlIGJpZyBpZigpL2Vsc2UoKSBpbiBfX2Z0cmFjZV9tYWtlX25vcCgpDQo=
+
Pj4+IC0tLQ0KPj4+PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9jb2RlLXBhdGNoaW5nLmg=
g
fCAgIDIgLQ0KPj4+PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9tb2R1bGUuaCAgICAgICA=
g
fCAgIDIgLQ0KPj4+PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9zZWN0aW9ucy5oICAgICA=
g
fCAgMjQgKy0tDQo+Pj4+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC90cmFjZS9mdHJhY2UuYyAgICA=
g
ICB8IDE4MiArKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPj4+PiAgIDQgZmlsZXMgY2hhbmdlZCw=
g
MTAzIGluc2VydGlvbnMoKyksIDEwNyBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pg0KPj4+IDxzbml=
w
Pg0KPj4+DQo+Pj4+IEBAIC03MTAsNiArNzA3LDkgQEAgdm9pZCBhcmNoX2Z0cmFjZV91cGRhdGV=
f
Y29kZShpbnQgY29tbWFuZCkNCj4+Pj4NCj4+Pj4gICAjaWZkZWYgQ09ORklHX1BQQzY0DQo+Pj4=
+
ICAgI2RlZmluZSBQQUNBVE9DIG9mZnNldG9mKHN0cnVjdCBwYWNhX3N0cnVjdCwga2VybmVsX3R=
v
YykNCj4+Pj4gKyNlbHNlDQo+Pj4+ICsjZGVmaW5lIFBBQ0FUT0MgMA0KPj4+PiArI2VuZGlmDQo=
+
Pj4NCj4+PiBUaGlzIGNvbmZsaWN0cyB3aXRoIG15IGZpeCBmb3IgdGhlIGZ0cmFjZSBpbml0IHR=
y
YW1wOg0KPj4+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1=
k
ZXYvcGF0Y2gvMjAyMjA1MTYwNzE0MjIuNDYzNzM4LTEtbmF2ZWVuLm4ucmFvQGxpbnV4LnZuZXQ=
u
aWJtLmNvbS8NCj4+Pg0KPj4+IEl0IHByb2JhYmx5IG1ha2VzIHNlbnNlIHRvIHJldGFpbiAjaWZ=
k
ZWYgQ09ORklHX1BQQzY0LCBzbyB0aGF0IHdlIGNhbg0KPj4+IGdldCByaWQgb2YgdGhlIFBBQ0F=
U
T0MuIEhlcmUgaXMgYW4gaW5jcmVtZW50YWwgZGlmZjoNCj4+DQo+PiBXaGVyZSBpcyB0aGUgaW5=
j
cmVtZW50YWwgZGlmZiBtZWFudCB0byBhcHBseT8NCj4+DQo+PiBJdCBkb2Vzbid0IGFwcGx5IG9=
u
IHRvcCBvZiBwYXRjaCAxOSwgb3IgYXQgdGhlIGVuZCBvZiB0aGUgc2VyaWVzLg0KPiANCj4gSSB=
0
aGluayBJIHdvcmtlZCBvdXQgd2hhdCB5b3UgbWVhbnQuDQo+IA0KPiBDYW4geW91IGNoZWNrIHd=
o
YXQncyBpbiBuZXh0LXRlc3Q6DQo+IA0KPiAgICBodHRwczovL2dpdGh1Yi5jb20vbGludXhwcGM=
v
bGludXgvY29tbWl0cy9uZXh0LXRlc3QNCg0KWWVzIHRoYXQgbG9va3MgZmluZS4NCg0KQXMgTmF=
2
ZWVuIG1lbnRpb25lZCB3ZSBjYW4gYWxzbyBnZXQgcmlkIG9mIFBBQ0FUT0MgY29tcGxldGVseSB=
h
bmQgdXNlIA0Kb2Zmc2V0b2Yoc3RydWN0IHBhY2Ffc3RydWN0LCBrZXJuZWxfdG9jKSBkaXJlY3R=
s
eSBhdCB0aGUgb25seSBwbGFjZSANClBBQ0FUT0MgaXMgdXNlZC4NCg0KVGhhbmtzDQpDaHJpc3R=
v
cGhl


From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A43C4167B
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:47:44 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235044AbiEIFtA (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:49:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S234995AbiEIFq3 (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:46:29 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC4D15E499
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:42:36 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKW0sWKz9sW3;
        Mon,  9 May 2022 07:36:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3VCec8f1JckO; Mon,  9 May 2022 07:36:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF5tpdz9sVq;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id B6D268B773;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id JMyJ9JAKuTsQ; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 5A8238B779;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aUB51=
591247
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:30 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aUpD159124=
6;
        Mon, 9 May 2022 07:36:30 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 10/25] powerpc: Finalise cleanup around ABI use
Date: Mon,  9 May 2022 07:36:08 +0200
Message-Id: <709d9d69523c14c8a9fba4486395dca0f2d675b1.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074581; l=3D4161;=
 s=3D20211009; h=3Dfrom:subject:message-id; bh=3DWxVopPaHaxL4NhbA6gDzSbUKU2=
1wfZC2s9FczOO6P/8=3D; b=3D1ndoSdj89H5/B1LcUVAVDtrq1kGRMDqityfCFTWjafvdSc028=
UoG4hB9Eq1YR696xb1BGk+jNWr0 q4z/ciE9Bt9UOQwkn9S/aZINfZKDV9pD80F5DCloaxY8zsh=
A+rzI
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

Now that we have CONFIG_PPC64_ELF_ABI_V1 and CONFIG_PPC64_ELF_ABI_V2,
get rid of all indirect detection of ABI version.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                |  2 +-
 arch/powerpc/Makefile               |  2 +-
 arch/powerpc/include/asm/types.h    |  8 --------
 arch/powerpc/kernel/fadump.c        | 13 ++++++++-----
 arch/powerpc/kernel/ptrace/ptrace.c |  6 ------
 arch/powerpc/net/bpf_jit_comp64.c   |  4 ++--
 6 files changed, 12 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 174edabb74fa..5514fed3f072 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -208,7 +208,7 @@ config PPC
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS	if !(CPU_LITTLE_ENDIAN && POWER7_C=
PU)
 	select HAVE_FAST_GUP
 	select HAVE_FTRACE_MCOUNT_RECORD
-	select HAVE_FUNCTION_DESCRIPTORS	if PPC64 && !CPU_LITTLE_ENDIAN
+	select HAVE_FUNCTION_DESCRIPTORS	if PPC64_ELF_ABI_V1
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 1ba98be84101..8bd3b631f094 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -213,7 +213,7 @@ CHECKFLAGS	+=3D -m$(BITS) -D__powerpc__ -D__powerpc$(BI=
TS)__
 ifdef CONFIG_CPU_BIG_ENDIAN
 CHECKFLAGS	+=3D -D__BIG_ENDIAN__
 else
-CHECKFLAGS	+=3D -D__LITTLE_ENDIAN__ -D_CALL_ELF=3D2
+CHECKFLAGS	+=3D -D__LITTLE_ENDIAN__
 endif
=20
 ifdef CONFIG_476FPE_ERR46
diff --git a/arch/powerpc/include/asm/types.h b/arch/powerpc/include/asm/ty=
pes.h
index 84078c28c1a2..93157a661dcc 100644
--- a/arch/powerpc/include/asm/types.h
+++ b/arch/powerpc/include/asm/types.h
@@ -11,14 +11,6 @@
=20
 #include <uapi/asm/types.h>
=20
-#ifdef __powerpc64__
-#if defined(_CALL_ELF) && _CALL_ELF =3D=3D 2
-#define PPC64_ELF_ABI_v2 1
-#else
-#define PPC64_ELF_ABI_v1 1
-#endif
-#endif /* __powerpc64__ */
-
 #ifndef __ASSEMBLY__
=20
 typedef __vector128 vector128;
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 65562c4a0a69..5f7224d66586 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -968,11 +968,14 @@ static int fadump_init_elfcore_header(char *bufp)
 	elf->e_entry =3D 0;
 	elf->e_phoff =3D sizeof(struct elfhdr);
 	elf->e_shoff =3D 0;
-#if defined(_CALL_ELF)
-	elf->e_flags =3D _CALL_ELF;
-#else
-	elf->e_flags =3D 0;
-#endif
+
+	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
+		elf->e_flags =3D 2;
+	else if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V1))
+		elf->e_flags =3D 1;
+	else
+		elf->e_flags =3D 0;
+
 	elf->e_ehsize =3D sizeof(struct elfhdr);
 	elf->e_phentsize =3D sizeof(struct elf_phdr);
 	elf->e_phnum =3D 0;
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptra=
ce/ptrace.c
index 9fbe155a9bd0..4d2dc22d4a2d 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -444,10 +444,4 @@ void __init pt_regs_check(void)
 	 * real registers.
 	 */
 	BUILD_BUG_ON(PT_DSCR < sizeof(struct user_pt_regs) / sizeof(unsigned long=
));
-
-#ifdef CONFIG_PPC64_ELF_ABI_V1
-	BUILD_BUG_ON(!IS_ENABLED(CONFIG_HAVE_FUNCTION_DESCRIPTORS));
-#else
-	BUILD_BUG_ON(IS_ENABLED(CONFIG_HAVE_FUNCTION_DESCRIPTORS));
-#endif
 }
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_c=
omp64.c
index d7b42f45669e..594c54931e20 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -126,7 +126,7 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_=
context *ctx)
 {
 	int i;
=20
-	if (__is_defined(CONFIG_PPC64_ELF_ABI_V2))
+	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
 		EMIT(PPC_RAW_LD(_R2, _R13, offsetof(struct paca_struct, kernel_toc)));
=20
 	/*
@@ -266,7 +266,7 @@ static int bpf_jit_emit_tail_call(u32 *image, struct co=
degen_context *ctx, u32 o
 	int b2p_index =3D bpf_to_ppc(BPF_REG_3);
 	int bpf_tailcall_prologue_size =3D 8;
=20
-	if (__is_defined(CONFIG_PPC64_ELF_ABI_V2))
+	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
 		bpf_tailcall_prologue_size +=3D 4; /* skip past the toc load */
=20
 	/*
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11334C4332F
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:44:10 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234240AbiEIFoZ (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S233737AbiEIFk4 (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:40:56 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81AC2158D4C
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:37:01 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKF4cbHz9sTH;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fkr_kpJCzgbX; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF3rCJz9sSv;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 73C9E8B792;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id upHjl707mpSh; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A9D68B76C;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aSOr1=
591223
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:29 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aS8h159122=
2;
        Mon, 9 May 2022 07:36:28 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 04/25] powerpc/ftrace: Use is_offset_in_branch_range()
Date: Mon,  9 May 2022 07:36:02 +0200
Message-Id: <912ae51782f5a53c44e435497c8c3fb5cc632387.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074581; l=3D1631;=
 s=3D20211009; h=3Dfrom:subject:message-id; bh=3DOWDdhcCtR60EJOCWc6cwIHh4xD=
hD5orD3drnjJOkPJg=3D; b=3DAISHgv8tS7wKPDrY7M9+uR7wcr56R2cPYVaMYJ90vojA3PHJ/=
RHRYAgrkN4eBPOPZa+HUs+HK3V0 LA/PLxcnBvWClEjtHEh+StZAETBKqJ3sCA4+bGUKQhGGxuP=
dw+hH
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

Use is_offset_in_branch_range() instead of create_branch()
to check if a target is within branch range.

This patch together with the previous one improves
ftrace activation time by 7%

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/trace/ftrace.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace=
/ftrace.c
index 3ce3697e8a7c..41c45b9c7f39 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -89,11 +89,9 @@ ftrace_modify_code(unsigned long ip, ppc_inst_t old, ppc=
_inst_t new)
  */
 static int test_24bit_addr(unsigned long ip, unsigned long addr)
 {
-	ppc_inst_t op;
 	addr =3D ppc_function_entry((void *)addr);
=20
-	/* use the create_branch to verify that this offset can be branched */
-	return create_branch(&op, (u32 *)ip, addr, 0) =3D=3D 0;
+	return is_offset_in_branch_range(addr - ip);
 }
=20
 static int is_bl_op(ppc_inst_t op)
@@ -261,7 +259,6 @@ __ftrace_make_nop(struct module *mod,
 static unsigned long find_ftrace_tramp(unsigned long ip)
 {
 	int i;
-	ppc_inst_t instr;
=20
 	/*
 	 * We have the compiler generated long_branch tramps at the end
@@ -270,8 +267,7 @@ static unsigned long find_ftrace_tramp(unsigned long ip=
)
 	for (i =3D NUM_FTRACE_TRAMPS - 1; i >=3D 0; i--)
 		if (!ftrace_tramps[i])
 			continue;
-		else if (create_branch(&instr, (void *)ip,
-				       ftrace_tramps[i], 0) =3D=3D 0)
+		else if (is_offset_in_branch_range(ftrace_tramps[i] - ip))
 			return ftrace_tramps[i];
=20
 	return 0;
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA65C433F5
	for <linux-kernel@archiver.kernel.org>; Wed, 18 May 2022 09:46:54 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234691AbiERJqt (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Wed, 18 May 2022 05:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S234922AbiERJqT (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Wed, 18 May 2022 05:46:19 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.=
163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13340B1C
        for <linux-kernel@vger.kernel.org>; Wed, 18 May 2022 02:46:09 -0700=
 (PDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24I=
9gi64006451;
        Wed, 18 May 2022 09:45:48 GMT
DKIM-Signature: v=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed; d=3Dibm.com; h=
=3Ddate : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=3Dpp1;
 bh=3DQQVA55xALZqqZ0+UCK4bbILmJo0n4KksKg2EVFGHGDc=3D;
 b=3DO2XfT2w/1QSCq2fRsAeHDD4Lny+5Gr1CjxkRjxnEKhfvxEw+zWL8x2ZTWlcbGyjuzKcY
 560KMV4uKAPGrP+aG+cckHCeWw1vjjpT4mEdwMfKiepjCjxe+8aB30fowMNV2d5LW2jm
 zOxOcgKJbNLoq9RinCKSNyFlaICVxNg1xHQ0G7qkvPPKg6ehgTP9Pon+FxYUikUrgPvZ
 gVuJl/ajoycDn1fDVSUNSWJjpgKei8mYf2xzkjB04vdHFmCvTaRtIUvYPQB0j64hAMpn
 esH6k2Qm9zD7/ljWsvQVN8HCQmQ7NULIsboWLzyCAJiLlWTxlcJPCreselHQUBUsMwTn iA=3D=
=3D=20
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [=
169.51.49.98])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g4xdh8238-1
        (version=3DTLSv1.2 cipher=3DECDHE-RSA-AES256-GCM-SHA384 bits=3D256 =
verify=3DNOT);
        Wed, 18 May 2022 09:45:47 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24I9gbcq02=
0274;
        Wed, 18 May 2022 09:45:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk=
.ibm.com [9.149.109.194])
        by ppma03ams.nl.ibm.com with ESMTP id 3g2429dfwh-1
        (version=3DTLSv1.2 cipher=3DECDHE-RSA-AES256-GCM-SHA384 bits=3D256 =
verify=3DNOT);
        Wed, 18 May 2022 09:45:45 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com=
 [9.149.105.62])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) wit=
h ESMTP id 24I9jh6A42336578
        (version=3DTLSv1/SSLv3 cipher=3DDHE-RSA-AES256-GCM-SHA384 bits=3D25=
6 verify=3DOK);
        Wed, 18 May 2022 09:45:43 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7E45CAE04D;
        Wed, 18 May 2022 09:45:43 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D830EAE045;
        Wed, 18 May 2022 09:45:42 +0000 (GMT)
Received: from localhost (unknown [9.43.19.36])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed, 18 May 2022 09:45:42 +0000 (GMT)
Date: Wed, 18 May 2022 15:15:40 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 19/25] powerpc/ftrace: Minimise number of #ifdefs
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
        <18ce6708d6f8c71d87436f9c6019f04df4125128.1652074503.git.christophe=
.leroy@csgroup.eu>
In-Reply-To: <18ce6708d6f8c71d87436f9c6019f04df4125128.1652074503.git.chris=
tophe.leroy@csgroup.eu>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1652866821.cdcfe8bs78.naveen@linux.ibm.com>
Content-Type: text/plain; charset=3Dutf-8; format=3Dflowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -xXV3WEQRZy-1nk7o9MuDv6wx1WAzkTW
X-Proofpoint-ORIG-GUID: -xXV3WEQRZy-1nk7o9MuDv6wx1WAzkTW
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=3Dbaseguard
 engine=3DICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=3D2022-05-18_03,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=3Doutbound_notspam policy=3Doutbound score=
=3D0 priorityscore=3D1501
 phishscore=3D0 mlxscore=3D0 lowpriorityscore=3D0 spamscore=3D0 impostorsco=
re=3D0
 adultscore=3D0 clxscore=3D1011 suspectscore=3D0 malwarescore=3D0 mlxlogsco=
re=3D928
 bulkscore=3D0 classifier=3Dspam adjust=3D0 reason=3Dmlx scancount=3D1
 engine=3D8.12.0-2202240000 definitions=3Dmain-2205180052
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

Christophe Leroy wrote:
> A lot of #ifdefs can be replaced by IS_ENABLED()
>=3D20
> Do so.
>=3D20
> This requires to have kernel_toc_addr() defined at all time
> as well as PPC_INST_LD_TOC and PPC_INST_STD_LR.
>=3D20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: Moved the setup of pop outside of the big if()/else() in __ftrace_mak=
=3D
e_nop()
> ---
>  arch/powerpc/include/asm/code-patching.h |   2 -
>  arch/powerpc/include/asm/module.h        |   2 -
>  arch/powerpc/include/asm/sections.h      |  24 +--
>  arch/powerpc/kernel/trace/ftrace.c       | 182 +++++++++++------------
>  4 files changed, 103 insertions(+), 107 deletions(-)
>=3D20

<snip>

> @@ -710,6 +707,9 @@ void arch_ftrace_update_code(int command)
>=3D20
>  #ifdef CONFIG_PPC64
>  #define PACATOC offsetof(struct paca_struct, kernel_toc)
> +#else
> +#define PACATOC 0
> +#endif

This conflicts with my fix for the ftrace init tramp:
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220516071422.4637=
=3D
38-1-naveen.n.rao@linux.vnet.ibm.com/

It probably makes sense to retain #ifdef CONFIG_PPC64, so that we can=3D20
get rid of the PACATOC. Here is an incremental diff:

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace=
=3D
/ftrace.c
index da1a2f8ebb72f3..28169a1ccc7377 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -701,11 +701,6 @@ void arch_ftrace_update_code(int command)
 }
=3D20
 #ifdef CONFIG_PPC64
-#define PACATOC offsetof(struct paca_struct, kernel_toc)
-#else
-#define PACATOC 0
-#endif
-
 extern unsigned int ftrace_tramp_text[], ftrace_tramp_init[];
=3D20
 void ftrace_free_init_tramp(void)
@@ -724,7 +719,7 @@ int __init ftrace_dyn_arch_init(void)
 	int i;
 	unsigned int *tramp[] =3D3D { ftrace_tramp_text, ftrace_tramp_init };
 	u32 stub_insns[] =3D3D {
-		PPC_RAW_LD(_R12, _R13, PACATOC),
+		PPC_RAW_LD(_R12, _R13, offsetof(struct paca_struct, kernel_toc)),
 		PPC_RAW_ADDIS(_R12, _R12, 0),
 		PPC_RAW_ADDI(_R12, _R12, 0),
 		PPC_RAW_MTCTR(_R12),
@@ -733,9 +728,6 @@ int __init ftrace_dyn_arch_init(void)
 	unsigned long addr;
 	long reladdr;
=3D20
-	if (IS_ENABLED(CONFIG_PPC32))
-		return 0;
-
 	addr =3D3D ppc_global_function_entry((void *)FTRACE_REGS_ADDR);
 	reladdr =3D3D addr - kernel_toc_addr();
=3D20
@@ -754,6 +746,7 @@ int __init ftrace_dyn_arch_init(void)
=3D20
 	return 0;
 }
+#endif
=3D20
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
=3D20

- Naveen


From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711D1C433EF
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:45:52 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235203AbiEIFrQ (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S235067AbiEIFqu (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:46:50 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF4E815E75A
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:42:57 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKg02ygz9sWB;
        Mon,  9 May 2022 07:36:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zE4kndyPflGx; Mon,  9 May 2022 07:36:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF6VjKz9sWC;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id CFEAD8B770;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id 4WhdA-dXHa5n; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 6CC058B77D;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aStl1=
591219
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:28 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aSbV159121=
8;
        Mon, 9 May 2022 07:36:28 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 03/25] powerpc/code-patching: Inline is_offset_in_{cond}=
_branch_range()
Date: Mon,  9 May 2022 07:36:01 +0200
Message-Id: <a05be0ccb7373e6a9789a1988fcd0c810f5f9269.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074581; l=3D3156;=
 s=3D20211009; h=3Dfrom:subject:message-id; bh=3DgLaYW1av0GijX4+cqYkHFoJkNF=
VZ0gQqCQkmFifsN0M=3D; b=3DdLAEd9s8YLV02PIcm3kAxAn6Kt0HmYzrrV229Yma06yk5t9Ks=
mh51HQdmnH+QG6iLpgYnaTc/Mq3 W/2d9x/RBI8JS+PPSnvYbfP2xrKvpa1wy5+nenAyDUx0lWI=
0sik2
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

Test in is_offset_in_branch_range() and is_offset_in_cond_branch_range()
are simple tests that are worth inlining.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/code-patching.h | 29 ++++++++++++++++++++++--
 arch/powerpc/lib/code-patching.c         | 27 ----------------------
 2 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/includ=
e/asm/code-patching.h
index 409483b2d0ce..e7c5df50cb4e 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -22,8 +22,33 @@
 #define BRANCH_SET_LINK	0x1
 #define BRANCH_ABSOLUTE	0x2
=20
-bool is_offset_in_branch_range(long offset);
-bool is_offset_in_cond_branch_range(long offset);
+/*
+ * Powerpc branch instruction is :
+ *
+ *  0         6                 30   31
+ *  +---------+----------------+---+---+
+ *  | opcode  |     LI         |AA |LK |
+ *  +---------+----------------+---+---+
+ *  Where AA =3D 0 and LK =3D 0
+ *
+ * LI is a signed 24 bits integer. The real branch offset is computed
+ * by: imm32 =3D SignExtend(LI:'0b00', 32);
+ *
+ * So the maximum forward branch should be:
+ *   (0x007fffff << 2) =3D 0x01fffffc =3D  0x1fffffc
+ * The maximum backward branch should be:
+ *   (0xff800000 << 2) =3D 0xfe000000 =3D -0x2000000
+ */
+static inline bool is_offset_in_branch_range(long offset)
+{
+	return (offset >=3D -0x2000000 && offset <=3D 0x1fffffc && !(offset & 0x3=
));
+}
+
+static inline bool is_offset_in_cond_branch_range(long offset)
+{
+	return offset >=3D -0x8000 && offset <=3D 0x7fff && !(offset & 0x3);
+}
+
 int create_branch(ppc_inst_t *instr, const u32 *addr,
 		  unsigned long target, int flags);
 int create_cond_branch(ppc_inst_t *instr, const u32 *addr,
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patch=
ing.c
index 00c68e7fb11e..58262c7e447c 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -208,33 +208,6 @@ int patch_branch(u32 *addr, unsigned long target, int =
flags)
 	return patch_instruction(addr, instr);
 }
=20
-bool is_offset_in_branch_range(long offset)
-{
-	/*
-	 * Powerpc branch instruction is :
-	 *
-	 *  0         6                 30   31
-	 *  +---------+----------------+---+---+
-	 *  | opcode  |     LI         |AA |LK |
-	 *  +---------+----------------+---+---+
-	 *  Where AA =3D 0 and LK =3D 0
-	 *
-	 * LI is a signed 24 bits integer. The real branch offset is computed
-	 * by: imm32 =3D SignExtend(LI:'0b00', 32);
-	 *
-	 * So the maximum forward branch should be:
-	 *   (0x007fffff << 2) =3D 0x01fffffc =3D  0x1fffffc
-	 * The maximum backward branch should be:
-	 *   (0xff800000 << 2) =3D 0xfe000000 =3D -0x2000000
-	 */
-	return (offset >=3D -0x2000000 && offset <=3D 0x1fffffc && !(offset & 0x3=
));
-}
-
-bool is_offset_in_cond_branch_range(long offset)
-{
-	return offset >=3D -0x8000 && offset <=3D 0x7fff && !(offset & 0x3);
-}
-
 /*
  * Helper to check if a given instruction is a conditional branch
  * Derived from the conditional checks in analyse_instr()
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00858C4167D
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:47:44 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235243AbiEIFtR (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S235011AbiEIFqf (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:46:35 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0792615E746
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:42:43 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKZ1snjz9sW1;
        Mon,  9 May 2022 07:36:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7KM8SCAmtaN8; Mon,  9 May 2022 07:36:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF61W9z9sW5;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id C5DC38B76D;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id KUMmZ8YwXu2A; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 700BE8B77E;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aSip1=
591215
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:28 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aSXm159121=
4;
        Mon, 9 May 2022 07:36:28 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 02/25] powerpc/ftrace: Remove redundant create_branch() =
calls
Date: Mon,  9 May 2022 07:36:00 +0200
Message-Id: <aa45fbad0b4b7493080835d8276c0cb4ce146503.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074581; l=3D2368;=
 s=3D20211009; h=3Dfrom:subject:message-id; bh=3D92KxuX0pLpQCITr7vgjlWnrEBj=
5V6cm1CJL4gIXJC9A=3D; b=3DP/AWRwH7skYub8t+ORIyGISWSRXUZdLajW1CEaI3+PeSm1R/T=
wnZ/Q+9vApeitoRcpcaqYOGH/tq wbUnYj5dAYKNXm0WKBGoJs4YoOfrvbQMr9PqYAyZVFNc2ug=
hK44y
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

Since commit d5937db114e4 ("powerpc/code-patching: Fix patch_branch()
return on out-of-range failure") patch_branch() fails with -ERANGE
when trying to branch out of range.

No need to perform the test twice. Remove redundant create_branch()
calls.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/trace/ftrace.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace=
/ftrace.c
index 7a266fd469b7..3ce3697e8a7c 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -301,7 +301,6 @@ static int setup_mcount_compiler_tramp(unsigned long tr=
amp)
 	int i;
 	ppc_inst_t op;
 	unsigned long ptr;
-	ppc_inst_t instr;
 	static unsigned long ftrace_plt_tramps[NUM_FTRACE_TRAMPS];
=20
 	/* Is this a known long jump tramp? */
@@ -344,12 +343,6 @@ static int setup_mcount_compiler_tramp(unsigned long t=
ramp)
 #else
 	ptr =3D ppc_global_function_entry((void *)ftrace_caller);
 #endif
-	if (create_branch(&instr, (void *)tramp, ptr, 0)) {
-		pr_debug("%ps is not reachable from existing mcount tramp\n",
-				(void *)ptr);
-		return -1;
-	}
-
 	if (patch_branch((u32 *)tramp, ptr, 0)) {
 		pr_debug("REL24 out of range!\n");
 		return -1;
@@ -490,7 +483,6 @@ static int
 __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 {
 	ppc_inst_t op[2];
-	ppc_inst_t instr;
 	void *ip =3D (void *)rec->ip;
 	unsigned long entry, ptr, tramp;
 	struct module *mod =3D rec->arch.mod;
@@ -539,12 +531,6 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned lo=
ng addr)
 		return -EINVAL;
 	}
=20
-	/* Ensure branch is within 24 bits */
-	if (create_branch(&instr, ip, tramp, BRANCH_SET_LINK)) {
-		pr_err("Branch out of range\n");
-		return -EINVAL;
-	}
-
 	if (patch_branch(ip, tramp, BRANCH_SET_LINK)) {
 		pr_err("REL24 out of range!\n");
 		return -EINVAL;
@@ -770,12 +756,6 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned =
long old_addr,
 		return -EINVAL;
 	}
=20
-	/* Ensure branch is within 24 bits */
-	if (create_branch(&op, (u32 *)ip, tramp, BRANCH_SET_LINK)) {
-		pr_err("Branch out of range\n");
-		return -EINVAL;
-	}
-
 	if (patch_branch((u32 *)ip, tramp, BRANCH_SET_LINK)) {
 		pr_err("REL24 out of range!\n");
 		return -EINVAL;
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54F1C4167D
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:44:10 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234902AbiEIFpu (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S235242AbiEIFnn (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:43:43 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D4A913FD5E
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:39:51 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKP1lhNz9sTT;
        Mon,  9 May 2022 07:36:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id AR1W8gDEP_uC; Mon,  9 May 2022 07:36:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF5Sxyz9sTj;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id B1FEB8B774;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id IavGzwKucdaz; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 615328B77B;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aUeG1=
591255
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:30 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aUGs159125=
4;
        Mon, 9 May 2022 07:36:30 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 12/25] powerpc/ftrace: Don't include ftrace.o for CONFIG=
_FTRACE_SYSCALLS
Date: Mon,  9 May 2022 07:36:10 +0200
Message-Id: <275932a5d61543b825ff9a64f61abed6da5d4a2a.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074582; l=3D797; =
s=3D20211009; h=3Dfrom:subject:message-id; bh=3DdBT+4KIjHuCkAQQu4k+Tl2VRVeq=
nuyJrNn++RX40GAM=3D; b=3DarmQhxjL03kCeRWxv46aRmfigz0t0GPdf6n2sK/szxXPL61wKr=
axnaoHXBlgobWokcpTE/dUfcKd tpWyp9nfCpMi9S9hnwWocI8g8JylQ6jeMy58Qj4Z/AQCntSr=
aqWS
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

Since commit 7bea7ac0ca01 ("powerpc/syscalls: Fix syscall tracing")
ftrace.o is not needed anymore for CONFIG_FTRACE_SYSCALLS.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/trace/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kernel/trace/Makefile b/arch/powerpc/kernel/trace=
/Makefile
index 542aa7a8b2b4..fc32ec30b297 100644
--- a/arch/powerpc/kernel/trace/Makefile
+++ b/arch/powerpc/kernel/trace/Makefile
@@ -17,7 +17,6 @@ endif
 obj-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace_low.o
 obj-$(CONFIG_DYNAMIC_FTRACE)		+=3D ftrace.o
 obj-$(CONFIG_FUNCTION_GRAPH_TRACER)	+=3D ftrace.o
-obj-$(CONFIG_FTRACE_SYSCALLS)		+=3D ftrace.o
 obj-$(CONFIG_TRACING)			+=3D trace_clock.o
=20
 obj-$(CONFIG_PPC64)			+=3D $(obj64-y)
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58221C433F5
	for <linux-kernel@archiver.kernel.org>; Wed, 18 May 2022 17:04:27 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240685AbiERREZ (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Wed, 18 May 2022 13:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S240634AbiERREY (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Wed, 18 May 2022 13:04:24 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.=
163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AF1B1BA8C6
        for <linux-kernel@vger.kernel.org>; Wed, 18 May 2022 10:04:22 -0700=
 (PDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24I=
GhldX027678;
        Wed, 18 May 2022 17:03:53 GMT
DKIM-Signature: v=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed; d=3Dibm.com; h=
=3Ddate : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=3Dpp1;
 bh=3D6LkEKSKYnLd9+NeeMKKztUmSNBhimo1u40eTF6WU5hk=3D;
 b=3DXRhX0opITUhYlW2jcrqI3yNVggeDj9jzJyMK3sVNiAAbq8Pc228RnA6qiNtBiA1nUjVx
 qZ0H1C7K6Cfn5WwCO1JRg8oKoEg/dyX98LviKR/g+YfTkOVUdgD7pz+zCCxOiXh5yDX/
 86reXHWVcrBFuGtyNQyjAwaQA/IwdIVA5tz6Uc73DnwWLS6XxuvnCAKpQ9Ta1J5PfirL
 Q9UZO+9k5GL2b3cATxjulLxL/+P/QXrtSBvwiDywEl+3tfQ1aYz48FEvdN3HYfYJDFei
 hqukfjeae956jqWZk5/vNNiaGVk8fZnrnSvD2V5UA0BAvAtdLAcqr+6P85Ncg3R6JcD0 JQ=3D=
=3D=20
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [=
159.122.73.71])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g54jrgedb-1
        (version=3DTLSv1.2 cipher=3DECDHE-RSA-AES256-GCM-SHA384 bits=3D256 =
verify=3DNOT);
        Wed, 18 May 2022 17:03:53 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
        by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24IH32dK03=
1811;
        Wed, 18 May 2022 17:03:51 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmo=
uth.uk.ibm.com [9.149.26.194])
        by ppma02fra.de.ibm.com with ESMTP id 3g2428mv9a-1
        (version=3DTLSv1.2 cipher=3DECDHE-RSA-AES256-GCM-SHA384 bits=3D256 =
verify=3DNOT);
        Wed, 18 May 2022 17:03:51 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com=
 [9.149.105.61])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) w=
ith ESMTP id 24IH3Ds824576388
        (version=3DTLSv1/SSLv3 cipher=3DDHE-RSA-AES256-GCM-SHA384 bits=3D25=
6 verify=3DOK);
        Wed, 18 May 2022 17:03:13 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0068B11C04C;
        Wed, 18 May 2022 17:03:49 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 892A511C04A;
        Wed, 18 May 2022 17:03:48 +0000 (GMT)
Received: from localhost (unknown [9.43.19.36])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed, 18 May 2022 17:03:48 +0000 (GMT)
Date: Wed, 18 May 2022 22:33:46 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 19/25] powerpc/ftrace: Minimise number of #ifdefs
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
        <18ce6708d6f8c71d87436f9c6019f04df4125128.1652074503.git.christophe=
.leroy@csgroup.eu>
        <1652866821.cdcfe8bs78.naveen@linux.ibm.com>
        <87leuznl5h.fsf@mpe.ellerman.id.au> <87ilq3nj2s.fsf@mpe.ellerman.id=
.au>
        <a7e47e3d-9b2b-ee12-d38c-3e6bbba83f7d@csgroup.eu>
In-Reply-To: <a7e47e3d-9b2b-ee12-d38c-3e6bbba83f7d@csgroup.eu>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1652893170.ef56yw5h6t.naveen@linux.ibm.com>
Content-Type: text/plain; charset=3Dutf-8; format=3Dflowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2Lw9lBGYPmdAMOKq1LZlAJM__mQ2ej4a
X-Proofpoint-ORIG-GUID: 2Lw9lBGYPmdAMOKq1LZlAJM__mQ2ej4a
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=3Dbaseguard
 engine=3DICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=3D2022-05-18_06,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=3Doutbound_notspam policy=3Doutbound score=
=3D0 priorityscore=3D1501
 phishscore=3D0 spamscore=3D0 clxscore=3D1015 adultscore=3D0 mlxscore=3D0
 suspectscore=3D0 malwarescore=3D0 impostorscore=3D0 bulkscore=3D0
 lowpriorityscore=3D0 mlxlogscore=3D999 classifier=3Dspam adjust=3D0 reason=
=3Dmlx
 scancount=3D1 engine=3D8.12.0-2202240000 definitions=3Dmain-2205180101
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

Christophe Leroy wrote:
>=3D20
>=3D20
> Le 18/05/2022 =3DC3=3DA0 14:03, Michael Ellerman a =3DC3=3DA9crit=3DC2=3D=
A0:
>> Michael Ellerman <mpe@ellerman.id.au> writes:
>>> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
>>>> Christophe Leroy wrote:
>>>>> A lot of #ifdefs can be replaced by IS_ENABLED()
>>>>>
>>>>> Do so.
>>>>>
>>>>> This requires to have kernel_toc_addr() defined at all time
>>>>> as well as PPC_INST_LD_TOC and PPC_INST_STD_LR.
>>>>>
>>>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>>> ---
>>>>> v2: Moved the setup of pop outside of the big if()/else() in __ftrace=
=3D
_make_nop()
>>>>> ---
>>>>>   arch/powerpc/include/asm/code-patching.h |   2 -
>>>>>   arch/powerpc/include/asm/module.h        |   2 -
>>>>>   arch/powerpc/include/asm/sections.h      |  24 +--
>>>>>   arch/powerpc/kernel/trace/ftrace.c       | 182 +++++++++++---------=
=3D
---
>>>>>   4 files changed, 103 insertions(+), 107 deletions(-)
>>>>>
>>>>
>>>> <snip>
>>>>
>>>>> @@ -710,6 +707,9 @@ void arch_ftrace_update_code(int command)
>>>>>
>>>>>   #ifdef CONFIG_PPC64
>>>>>   #define PACATOC offsetof(struct paca_struct, kernel_toc)
>>>>> +#else
>>>>> +#define PACATOC 0
>>>>> +#endif
>>>>
>>>> This conflicts with my fix for the ftrace init tramp:
>>>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220516071422=
=3D
.463738-1-naveen.n.rao@linux.vnet.ibm.com/
>>>>
>>>> It probably makes sense to retain #ifdef CONFIG_PPC64, so that we can
>>>> get rid of the PACATOC. Here is an incremental diff:
>>>
>>> Where is the incremental diff meant to apply?
>>>
>>> It doesn't apply on top of patch 19, or at the end of the series.

Ugh, sorry. I had an additional patch that converts those=3D20
ftrace_[regs_]_caller uses to FTRACE_REGS_ADDR, which prevented one of=3D20
the hunks from applying.

>>=3D20
>> I think I worked out what you meant.
>>=3D20
>> Can you check what's in next-test:
>>=3D20
>>    https://github.com/linuxppc/linux/commits/next-test
>=3D20
> Yes that looks fine.

+1

>=3D20
> As Naveen mentioned we can also get rid of PACATOC completely and use=3D2=
0
> offsetof(struct paca_struct, kernel_toc) directly at the only place=3D20
> PACATOC is used.

Yes, or we can send it out as a separate cleanup.


Thanks,
Naveen



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA993C43217
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:45:52 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235298AbiEIFrn (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S235164AbiEIFrC (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:47:02 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD4115EA61
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:43:10 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKl12QKz9sWG;
        Mon,  9 May 2022 07:36:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id CF7nhX8EsE2D; Mon,  9 May 2022 07:36:59 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKH4hb3z9sWJ;
        Mon,  9 May 2022 07:36:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E2638B76C;
        Mon,  9 May 2022 07:36:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id iLP1FahFznMB; Mon,  9 May 2022 07:36:35 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 5BE2D8B76D;
        Mon,  9 May 2022 07:36:35 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aWLM1=
591307
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:32 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aWrm159130=
6;
        Mon, 9 May 2022 07:36:32 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 25/25] powerpc/opcodes: Remove unused PPC_INST_XXX macro=
s
Date: Mon,  9 May 2022 07:36:23 +0200
Message-Id: <8c28636126f69141419953b5638b4a908c184dc1.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074583; l=3D2923;=
 s=3D20211009; h=3Dfrom:subject:message-id; bh=3DpV3LNsUwDLHbNMELI+9s3LvNdD=
+cK5R0Uilc4bWSJuA=3D; b=3DhPEhg4WbImfXpykLn4mDEWQUtvRtWDiTMnYhhHVqhEbiDo/Qm=
bx5pwKhrBnYRQPQ8BHShu9m/JdX /1mERwTJCAWcOikyPUnt846Oj/UzK6VQc9lYGGECv4/mRol=
6ad+/
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

The following PPC_INST_XXX macros are not used anymore
outside ppc-opcode.h:
	- PPC_INST_LD
	- PPC_INST_STD
	- PPC_INST_ADDIS
	- PPC_INST_ADD
	- PPC_INST_DIVD

Remove them.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc-opcode.h | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/a=
sm/ppc-opcode.h
index 9ca8996ee1cd..b9d6f95b66e9 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -285,11 +285,6 @@
 #define PPC_INST_TRECHKPT		0x7c0007dd
 #define PPC_INST_TRECLAIM		0x7c00075d
 #define PPC_INST_TSR			0x7c0005dd
-#define PPC_INST_LD			0xe8000000
-#define PPC_INST_STD			0xf8000000
-#define PPC_INST_ADDIS			0x3c000000
-#define PPC_INST_ADD			0x7c000214
-#define PPC_INST_DIVD			0x7c0003d2
 #define PPC_INST_BRANCH_COND		0x40800000
=20
 /* Prefixes */
@@ -462,10 +457,10 @@
 	(0x100000c7 | ___PPC_RT(vrt) | ___PPC_RA(vra) | ___PPC_RB(vrb) | __PPC_RC=
21)
 #define PPC_RAW_VCMPEQUB_RC(vrt, vra, vrb) \
 	(0x10000006 | ___PPC_RT(vrt) | ___PPC_RA(vra) | ___PPC_RB(vrb) | __PPC_RC=
21)
-#define PPC_RAW_LD(r, base, i)		(PPC_INST_LD | ___PPC_RT(r) | ___PPC_RA(ba=
se) | IMM_DS(i))
+#define PPC_RAW_LD(r, base, i)		(0xe8000000 | ___PPC_RT(r) | ___PPC_RA(bas=
e) | IMM_DS(i))
 #define PPC_RAW_LWZ(r, base, i)		(0x80000000 | ___PPC_RT(r) | ___PPC_RA(ba=
se) | IMM_L(i))
 #define PPC_RAW_LWZX(t, a, b)		(0x7c00002e | ___PPC_RT(t) | ___PPC_RA(a) |=
 ___PPC_RB(b))
-#define PPC_RAW_STD(r, base, i)		(PPC_INST_STD | ___PPC_RS(r) | ___PPC_RA(=
base) | IMM_DS(i))
+#define PPC_RAW_STD(r, base, i)		(0xf8000000 | ___PPC_RS(r) | ___PPC_RA(ba=
se) | IMM_DS(i))
 #define PPC_RAW_STDCX(s, a, b)		(0x7c0001ad | ___PPC_RS(s) | ___PPC_RA(a) =
| ___PPC_RB(b))
 #define PPC_RAW_LFSX(t, a, b)		(0x7c00042e | ___PPC_RT(t) | ___PPC_RA(a) |=
 ___PPC_RB(b))
 #define PPC_RAW_STFSX(s, a, b)		(0x7c00052e | ___PPC_RS(s) | ___PPC_RA(a) =
| ___PPC_RB(b))
@@ -476,8 +471,8 @@
 #define PPC_RAW_ADDE(t, a, b)		(0x7c000114 | ___PPC_RT(t) | ___PPC_RA(a) |=
 ___PPC_RB(b))
 #define PPC_RAW_ADDZE(t, a)		(0x7c000194 | ___PPC_RT(t) | ___PPC_RA(a))
 #define PPC_RAW_ADDME(t, a)		(0x7c0001d4 | ___PPC_RT(t) | ___PPC_RA(a))
-#define PPC_RAW_ADD(t, a, b)		(PPC_INST_ADD | ___PPC_RT(t) | ___PPC_RA(a) =
| ___PPC_RB(b))
-#define PPC_RAW_ADD_DOT(t, a, b)	(PPC_INST_ADD | ___PPC_RT(t) | ___PPC_RA(=
a) | ___PPC_RB(b) | 0x1)
+#define PPC_RAW_ADD(t, a, b)		(0x7c000214 | ___PPC_RT(t) | ___PPC_RA(a) | =
___PPC_RB(b))
+#define PPC_RAW_ADD_DOT(t, a, b)	(0x7c000214 | ___PPC_RT(t) | ___PPC_RA(a)=
 | ___PPC_RB(b) | 0x1)
 #define PPC_RAW_ADDC(t, a, b)		(0x7c000014 | ___PPC_RT(t) | ___PPC_RA(a) |=
 ___PPC_RB(b))
 #define PPC_RAW_ADDC_DOT(t, a, b)	(0x7c000014 | ___PPC_RT(t) | ___PPC_RA(a=
) | ___PPC_RB(b) | 0x1)
 #define PPC_RAW_NOP()			PPC_RAW_ORI(0, 0, 0)
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06100C433F5
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:45:52 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235187AbiEIFrJ (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S235043AbiEIFqr (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:46:47 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2073415E75A
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:42:54 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKd230Zz9sW7;
        Mon,  9 May 2022 07:36:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vtBHFhrxjztr; Mon,  9 May 2022 07:36:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF6VCPz9sWB;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id D31A38B776;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id 5TFobGZUBxXF; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 7AF938B76C;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aTqU1=
591235
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:29 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aTBl159123=
4;
        Mon, 9 May 2022 07:36:29 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 07/25] powerpc/ftrace: Use patch_instruction() return di=
rectly
Date: Mon,  9 May 2022 07:36:05 +0200
Message-Id: <49a8597230713e2633e7d9d7b56140787c4a7e20.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074581; l=3D3210;=
 s=3D20211009; h=3Dfrom:subject:message-id; bh=3DMd4LXS00pJjwBL+ITuR9eEwWCB=
aAOzBbKV+lmd2htSc=3D; b=3Dbw+q62+/aBRPBc5kH6gDGF9O/ZQowCJR4GOLPi23Xf0KjpRe1=
VbdFMOWF85wGURwH2sKiEjwu5zF m1IIEnc/By+PEXlutM8oglp+rmJnGXI3RqxDYeFA8Vaqa9f=
mNmcW
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

Instead of returning -EPERM when patch_instruction() fails,
just return what patch_instruction returns.

That simplifies ftrace_modify_code():

	   0:	94 21 ff c0 	stwu    r1,-64(r1)
	   4:	93 e1 00 3c 	stw     r31,60(r1)
	   8:	7c 7f 1b 79 	mr.     r31,r3
	   c:	40 80 00 30 	bge     3c <ftrace_modify_code+0x3c>
	  10:	93 c1 00 38 	stw     r30,56(r1)
	  14:	7c 9e 23 78 	mr      r30,r4
	  18:	7c a4 2b 78 	mr      r4,r5
	  1c:	80 bf 00 00 	lwz     r5,0(r31)
	  20:	7c 1e 28 40 	cmplw   r30,r5
	  24:	40 82 00 34 	bne     58 <ftrace_modify_code+0x58>
	  28:	83 c1 00 38 	lwz     r30,56(r1)
	  2c:	7f e3 fb 78 	mr      r3,r31
	  30:	83 e1 00 3c 	lwz     r31,60(r1)
	  34:	38 21 00 40 	addi    r1,r1,64
	  38:	48 00 00 00 	b       38 <ftrace_modify_code+0x38>
				38: R_PPC_REL24	patch_instruction

Before:

	   0:	94 21 ff c0 	stwu    r1,-64(r1)
	   4:	93 e1 00 3c 	stw     r31,60(r1)
	   8:	7c 7f 1b 79 	mr.     r31,r3
	   c:	40 80 00 4c 	bge     58 <ftrace_modify_code+0x58>
	  10:	93 c1 00 38 	stw     r30,56(r1)
	  14:	7c 9e 23 78 	mr      r30,r4
	  18:	7c a4 2b 78 	mr      r4,r5
	  1c:	80 bf 00 00 	lwz     r5,0(r31)
	  20:	7c 08 02 a6 	mflr    r0
	  24:	90 01 00 44 	stw     r0,68(r1)
	  28:	7c 1e 28 40 	cmplw   r30,r5
	  2c:	40 82 00 48 	bne     74 <ftrace_modify_code+0x74>
	  30:	7f e3 fb 78 	mr      r3,r31
	  34:	48 00 00 01 	bl      34 <ftrace_modify_code+0x34>
				34: R_PPC_REL24	patch_instruction
	  38:	80 01 00 44 	lwz     r0,68(r1)
	  3c:	20 63 00 00 	subfic  r3,r3,0
	  40:	83 c1 00 38 	lwz     r30,56(r1)
	  44:	7c 63 19 10 	subfe   r3,r3,r3
	  48:	7c 08 03 a6 	mtlr    r0
	  4c:	83 e1 00 3c 	lwz     r31,60(r1)
	  50:	38 21 00 40 	addi    r1,r1,64
	  54:	4e 80 00 20 	blr

It improves ftrace activation/deactivation duration by about 3%.

Modify patch_instruction() return on failure to -EPERM in order to
match with ftrace expectations. Other users of patch_instruction()
do not care about the exact error value returned.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Make patch_instruction() return -EPERM in case of failure
---
 arch/powerpc/kernel/trace/ftrace.c | 5 +----
 arch/powerpc/lib/code-patching.c   | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace=
/ftrace.c
index 98e82fa4980f..1b05d33f96c6 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -78,10 +78,7 @@ ftrace_modify_code(unsigned long ip, ppc_inst_t old, ppc=
_inst_t new)
 	}
=20
 	/* replace the text with the new text */
-	if (patch_instruction((u32 *)ip, new))
-		return -EPERM;
-
-	return 0;
+	return patch_instruction((u32 *)ip, new);
 }
=20
 /*
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patch=
ing.c
index 7adbdb05fee7..cd25c07df23c 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -32,7 +32,7 @@ static int __patch_instruction(u32 *exec_addr, ppc_inst_t=
 instr, u32 *patch_addr
 	return 0;
=20
 failed:
-	return -EFAULT;
+	return -EPERM;
 }
=20
 int raw_patch_instruction(u32 *addr, ppc_inst_t instr)
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DA8C43219
	for <linux-kernel@archiver.kernel.org>; Mon,  9 May 2022 05:44:10 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234685AbiEIFpG (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Mon, 9 May 2022 01:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S235075AbiEIFnG (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 9 May 2022 01:43:06 -0400
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A92913FD5D
        for <linux-kernel@vger.kernel.org>; Sun,  8 May 2022 22:39:12 -0700=
 (PDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4KxVKJ2xmsz9sTD;
        Mon,  9 May 2022 07:36:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id cpQb6tMvOx0T; Mon,  9 May 2022 07:36:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF479Cz9sT7;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 77E708B794;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port =
10023)
        with ESMTP id cbyx-2MR_D7F; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 3994E8B763;
        Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aUMr1=
591259
        (version=3DTLSv1.3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256 verif=
y=3DNOT);
        Mon, 9 May 2022 07:36:30 +0200
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aUxU159125=
8;
        Mon, 9 May 2022 07:36:30 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to ch=
ristophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        naveen.n.rao@linux.vnet.ibm.com
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 13/25] powerpc/ftrace: Use CONFIG_FUNCTION_TRACER instea=
d of CONFIG_DYNAMIC_FTRACE
Date: Mon,  9 May 2022 07:36:11 +0200
Message-Id: <628d357503eb90b4a034f99b7df516caaff4d279.1652074503.git.christ=
ophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=3D1; a=3Ded25519-sha256; t=3D1652074582; l=3D2342;=
 s=3D20211009; h=3Dfrom:subject:message-id; bh=3Dbji15qs2JPAG4suNrV+7J234iP=
VSFPzCbSxwzfrHc3k=3D; b=3DKd84EKFgYgwez8uFPBZrU5HS1xBVEOglCr+t0139mh5/fh9zp=
NcFaPRb70f4tok7Ky0eDm7Z4ReZ zEAz5rDeD/Z4lFLpo4VNbFRvpM5nVSdVoy6Kf8BNr47FHW+=
PzxH4
X-Developer-Key: i=3Dchristophe.leroy@csgroup.eu; a=3Ded25519; pk=3DHIzTzUj=
91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=3D
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

Since commit 0c0c52306f47 ("powerpc: Only support DYNAMIC_FTRACE not
static"), CONFIG_DYNAMIC_FTRACE is always selected when
CONFIG_FUNCTION_TRACER is selected.

To avoid confusion and have the reader wonder what's happen when
CONFIG_FUNCTION_TRACER is selected and CONFIG_DYNAMIC_FTRACE is not,
use CONFIG_FUNCTION_TRACER in ifdefs instead of CONFIG_DYNAMIC_FTRACE.

As CONFIG_FUNCTION_GRAPH_TRACER depends on CONFIG_FUNCTION_TRACER,
ftrace.o doesn't need to appear for both symbols in Makefile.

Then as ftrace.o is built only when CONFIG_FUNCTION_TRACER is selected
ifdef CONFIG_FUNCTION_TRACER is not needed in ftrace.c, and since it
implies CONFIG_DYNAMIC_FTRACE, CONFIG_DYNAMIC_FTRACE is not needed
in ftrace.c

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Limit the change to the content of arch/powerpc/kernel/trace as suggest=
ed by Naveen.
---
 arch/powerpc/kernel/trace/Makefile | 4 +---
 arch/powerpc/kernel/trace/ftrace.c | 4 ----
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/trace/Makefile b/arch/powerpc/kernel/trace=
/Makefile
index fc32ec30b297..af8527538fe4 100644
--- a/arch/powerpc/kernel/trace/Makefile
+++ b/arch/powerpc/kernel/trace/Makefile
@@ -14,9 +14,7 @@ obj64-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace_mprofile.o
 else
 obj64-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace_64_pg.o
 endif
-obj-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace_low.o
-obj-$(CONFIG_DYNAMIC_FTRACE)		+=3D ftrace.o
-obj-$(CONFIG_FUNCTION_GRAPH_TRACER)	+=3D ftrace.o
+obj-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace_low.o ftrace.o
 obj-$(CONFIG_TRACING)			+=3D trace_clock.o
=20
 obj-$(CONFIG_PPC64)			+=3D $(obj64-y)
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace=
/ftrace.c
index 531da4d93c58..f89bcaa5f0fc 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -28,9 +28,6 @@
 #include <asm/syscall.h>
 #include <asm/inst.h>
=20
-
-#ifdef CONFIG_DYNAMIC_FTRACE
-
 /*
  * We generally only have a single long_branch tramp and at most 2 or 3 pl=
t
  * tramps generated. But, we don't use the plt tramps currently. We also a=
llot
@@ -783,7 +780,6 @@ int __init ftrace_dyn_arch_init(void)
 	return 0;
 }
 #endif
-#endif /* CONFIG_DYNAMIC_FTRACE */
=20
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
=20
--=20
2.35.1



From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C23DC433F5
	for <linux-kernel@archiver.kernel.org>; Tue, 24 May 2022 11:16:21 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236652AbiEXLQT (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Tue, 24 May 2022 07:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S236485AbiEXLPh (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Tue, 24 May 2022 07:15:37 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C126B09F
        for <linux-kernel@vger.kernel.org>; Tue, 24 May 2022 04:15:36 -0700=
 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) se=
rver-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s7W5XBcz4ySp;
        Tue, 24 May 2022 21:15:35 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: naveen.n.rao@linux.vnet.ibm.com,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 00/25] powerpc: ftrace optimisation and cleanup and =
more [v3]
Message-Id: <165339055456.1718562.6144281793562720834.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:09:14 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset=3D"utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

On Mon, 9 May 2022 07:35:58 +0200, Christophe Leroy wrote:
> This series provides optimisation and cleanup of ftrace on powerpc.
>=20
> With this series ftrace activation is about 20% faster on an 8xx.
>=20
> At the end of the series come additional cleanups around ppc-opcode,
> that would likely conflict with this series if posted separately.
>=20
> [...]

Applied to powerpc/next.

[01/25] powerpc/ftrace: Refactor prepare_ftrace_return()
        https://git.kernel.org/powerpc/c/d996d5053eb5c0abc0358e5670014a62ad=
a6967e
[02/25] powerpc/ftrace: Remove redundant create_branch() calls
        https://git.kernel.org/powerpc/c/ae3a2a2188214adc355a5bdf6deb291208=
86c96f
[03/25] powerpc/code-patching: Inline is_offset_in_{cond}_branch_range()
        https://git.kernel.org/powerpc/c/1acbf27e8a5843911d122ad0008e79ec5f=
7b6382
[04/25] powerpc/ftrace: Use is_offset_in_branch_range()
        https://git.kernel.org/powerpc/c/a1facd2578b312770aaea384adc7de0ed3=
f543d1
[05/25] powerpc/code-patching: Inline create_branch()
        https://git.kernel.org/powerpc/c/d2f47dabf1252520a88d257133e6bdec47=
4fd935
[06/25] powerpc/ftrace: Inline ftrace_modify_code()
        https://git.kernel.org/powerpc/c/2c920fca8c70287c4448f2653a388ecca7=
b32e83
[07/25] powerpc/ftrace: Use patch_instruction() return directly
        https://git.kernel.org/powerpc/c/bbffdd2fc743bdc529f9a8264bdb5d3491=
f58c95
[08/25] powerpc: Add CONFIG_PPC64_ELF_ABI_V1 and CONFIG_PPC64_ELF_ABI_V2
        https://git.kernel.org/powerpc/c/661aa880398add5c27943cb077c451a45c=
c112a1
[09/25] powerpc: Replace PPC64_ELF_ABI_v{1/2} by CONFIG_PPC64_ELF_ABI_V{1/2=
}
        https://git.kernel.org/powerpc/c/7d40aff8213c92e64a1576ba9dfebcd201=
c0564d
[10/25] powerpc: Finalise cleanup around ABI use
        https://git.kernel.org/powerpc/c/5b89492c03e5c0a2c259b97d7d4c1bb9b0=
2860aa
[11/25] powerpc/ftrace: Make __ftrace_make_{nop/call}() common to PPC32 and=
 PPC64
        https://git.kernel.org/powerpc/c/23b44fc248f420bbcd0dcd290c33998853=
60984d
[12/25] powerpc/ftrace: Don't include ftrace.o for CONFIG_FTRACE_SYSCALLS
        https://git.kernel.org/powerpc/c/a3d0f5b4b7e425b8abeadda1e76496bda8=
8989bd
[13/25] powerpc/ftrace: Use CONFIG_FUNCTION_TRACER instead of CONFIG_DYNAMI=
C_FTRACE
        https://git.kernel.org/powerpc/c/c2cba93d1a5e2475a636b5cb974da6b73d=
7a72df
[14/25] powerpc/ftrace: Remove ftrace_plt_tramps[]
        https://git.kernel.org/powerpc/c/ccf6607e45aaf5e0ceabfe018aeb01818a=
936697
[15/25] powerpc/ftrace: Use BRANCH_SET_LINK instead of value 1
        https://git.kernel.org/powerpc/c/cf9df92a823ce24c19c4c64b334dc5cadd=
74fa98
[16/25] powerpc/ftrace: Use PPC_RAW_xxx() macros instead of opencoding.
        https://git.kernel.org/powerpc/c/e89aa642be21b14e53bab40a37b8c6b0cf=
05143d
[17/25] powerpc/ftrace: Use size macro instead of opencoding
        https://git.kernel.org/powerpc/c/c8deb28095f9cd2ee2f4d16e948c9e816a=
22811b
[18/25] powerpc/ftrace: Simplify expected_nop_sequence()
        https://git.kernel.org/powerpc/c/b97d0e3dcfba07590ec3d2ca2b95b2f029=
962d16
[19/25] powerpc/ftrace: Minimise number of #ifdefs
        https://git.kernel.org/powerpc/c/af8b9f352ffd435734ab8f94f99ccb922d=
a916b4
[20/25] powerpc/inst: Add __copy_inst_from_kernel_nofault()
        https://git.kernel.org/powerpc/c/8dfdbe4368c09d9eeae2df8968ee6c345e=
c8c1b5
[21/25] powerpc/ftrace: Don't use copy_from_kernel_nofault() in module_tram=
poline_target()
        https://git.kernel.org/powerpc/c/8052d043a48f733905e8ea8f900bf58b44=
1a317f
[22/25] powerpc/inst: Remove PPC_INST_BRANCH
        https://git.kernel.org/powerpc/c/4390a58ee1c37dc915dcf44fabe925b160=
f5bcf0
[23/25] powerpc/modules: Use PPC_LI macros instead of opencoding
        https://git.kernel.org/powerpc/c/e0c2ef43210b023ed9a58c520c2fbede70=
10c592
[24/25] powerpc/inst: Remove PPC_INST_BL
        https://git.kernel.org/powerpc/c/ae2c760fa10ba2475aa46fffa6be420505=
86c604
[25/25] powerpc/opcodes: Remove unused PPC_INST_XXX macros
        https://git.kernel.org/powerpc/c/6bdc81eca9519a85d36b3915136640ef9c=
ba1a23

cheers


From git@z Thu Jan  1 00:00:00 1970
Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 920A0C433EF
	for <linux-kernel@archiver.kernel.org>; Wed, 18 May 2022 12:04:48 +0000 (U=
TC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236145AbiERMEp (ORCPT <rfc822;linux-kernel@archiver.kernel.org>=
);
        Wed, 18 May 2022 08:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.=
org
        with ESMTP id S236166AbiERMEf (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Wed, 18 May 2022 08:04:35 -0400
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90=
053.outbound.protection.outlook.com [40.107.9.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83765366AC
        for <linux-kernel@vger.kernel.org>; Wed, 18 May 2022 05:04:31 -0700=
 (PDT)
ARC-Seal: i=3D1; a=3Drsa-sha256; s=3Darcselector9901; d=3Dmicrosoft.com; cv=
=3Dnone;
 b=3DARKu3STw5qyeMMDupVqqeLYLjY9hWoi+77RNazcV4j+cRxcutzxii+KhuKIaWn4OmaWGv8=
DFV0isXKymyJL7TVe0pBj7ih+b/WbfhA2JsSPjvINysYQMPdU6yGzqS4fxiCOnFXYqBsu36tuvW=
JC48X3zj5Im/mHHWN9QcNTn5D+xllbo1Z4zZ7aXCB7ArjFlSZkiMatkC3Yvn1zhg0fq4wBnf7jh=
5YO/zoOMGrZMvkYBik+x6/3eURjt/8AFhBvt10tYw+p9myCdBnT4LtvAmi6LaceoBR9XfvakB6P=
hb6DNf0U3UkKPBLscQsYJlToKt9S1KkxuZeUPYZY8LJhYkw=3D=3D
ARC-Message-Signature: i=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed; d=3Dmicr=
osoft.com;
 s=3Darcselector9901;
 h=3DFrom:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-A=
ntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Ex=
change-AntiSpam-MessageData-1;
 bh=3D+lP0oP8TGaP6VrATCRKf57XhNTlUuTo3e7Sb2QMMDY8=3D;
 b=3DjQStHQlHu1/9z6N6EJ7ULnMoC/qKdoMN+nPQBOslZrdAJMEWPEliDs4fmO0PO00ihWMikb=
ypnwgftz540X4auXX5K5plCb792WEhee63AMqOOtA3DrZS0/9pprS8DXnc7rqNMwLafIvLPo/7Y=
0siDvW+1lFnAKemWajUYxfC66KlQdsDe0MhSTw8VofFqlxHj2+2g41sezRl6+6iOiU6SIqgpBbK=
sjk8jXaq0YG9WoztXoYdlXbEEVtNQjiGL5/khovISKN3fDbVZ1ZWFafOsgkGyOAE7xm0BROcuFy=
+xBdxv4VCim3b5yDlM2AVacVlGOHOsrdkhdQ/b7s8PhOUYA=3D=3D
ARC-Authentication-Results: i=3D1; mx.microsoft.com 1; spf=3Dpass
 smtp.mailfrom=3Dcsgroup.eu; dmarc=3Dpass action=3Dnone header.from=3Dcsgro=
up.eu;
 dkim=3Dpass header.d=3Dcsgroup.eu; arc=3Dnone
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15=
)
 by PAZP264MB3087.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f5::20) with
 Microsoft SMTP Server (version=3DTLS1_2,
 cipher=3DTLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Wed, 18 =
May
 2022 12:04:28 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d%8]) with mapi id 15.20.5273.015; Wed, 18 May 2=
022
 12:04:28 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
        "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v3 19/25] powerpc/ftrace: Minimise number of #ifdefs
Thread-Topic: [PATCH v3 19/25] powerpc/ftrace: Minimise number of #ifdefs
Thread-Index: AQHYY2bDo7452AR5CUeMZrEOJfuwwK0kcUMAgAAaGwCAAAysgA=3D=3D
Date: Wed, 18 May 2022 12:04:28 +0000
Message-ID: <24d21ab6-06f6-8958-b8e5-ae0c228f55a8@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
 <18ce6708d6f8c71d87436f9c6019f04df4125128.1652074503.git.christophe.leroy@=
csgroup.eu>
 <1652866821.cdcfe8bs78.naveen@linux.ibm.com>
 <87leuznl5h.fsf@mpe.ellerman.id.au>
In-Reply-To: <87leuznl5h.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach:=20
X-MS-TNEF-Correlator:=20
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=3Dnone (message not signed)
 header.d=3Dnone;dmarc=3Dnone action=3Dnone header.from=3Dcsgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2a5d8bc-8d35-41bf-281d-08da38c68f=
21
x-ms-traffictypediagnostic: PAZP264MB3087:EE_
x-microsoft-antispam-prvs: <PAZP264MB30878EC6DFF544FE2753E940EDD19@PAZP264M=
B3087.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gLJ7+TbzIf65eKRae7YwRZyEhWJMkJmr7fmFTaZo=
s8+ONbQRpDB21H+BPuuJfu8oUGu5UW52H6T35EKc/inGOI5vxQJXsMfRQCyMzZkqHPD0e9vfxWq=
llWaFnMYTTFEuEa5Wafm8kGZ2gbaRTDqurSCuv2vtH7Lkl0UqFYz6hz2SX9/z/5o9u3dqQMtbZW=
H2cXAODCAVI2O+o3q5l44n5efviKmnhXKQaQaxDQ6D228KZhdqenTYu/bP5Y3XT6viWNecaCl5f=
Ny2UN97Ww3ZOtwinsmEmYdghrICQN4C7wAQ+1P/zHLkig0FOUSmqmbdsyMv1A65hKyH5UIZC32h=
AEs2fe8iHbkVWhX77sft2+z5VeSRXHG3PVupqpVP78jztGjLEQEJ27ivMLtb7fAizdIRLHLZOac=
Itf9AzU8qCRaPp8to9+lE+i1vXHWOdpuaqtVCfHRePilPkL046J72UJk9yAgqWG20tgri86jO5r=
UrsF4cVaU8Khv8oolJNlhqnJZCcwqWCd/5LSS69nCoEDbn3VaqtrT2UIjJFuaOZni+ucE1HBj7A=
+ZBfZ3AvYkiCQVGhX0wzUIbkwI5Z8bYb27dV/7+wPvYhMNLn7wq4ckplYHxKoIQY3hgc6gW9Cza=
nDXTx3l7NQHsQN/YApoNihZWh0dWY6gmdcDR4cGNE3iB7SG/c9Abqm7kTIuT4HgkiSuJa3n8Q4k=
tBZ8O0bZIbYwGKnWRTZKStegunEqOi54V6J9FhPy5YzNEkr8l39izBErjr65G25RyRK1a23qAga=
dGgqvSoxvhEX9XOLPvWiyoA9IDMCO1En7hje4QqAyN9KWNnwBfIKfU9A5CYMemsjHHXoI5u3pOV=
jA4rxetsLU=3D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;I=
PV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:=
(13230001)(4636009)(366004)(6486002)(316002)(64756008)(508600001)(966005)(2=
906002)(66476007)(66446008)(4326008)(110136005)(54906003)(86362001)(3807070=
0005)(66556008)(8676002)(31696002)(122000001)(38100700002)(71200400001)(761=
16006)(5660300002)(6512007)(186003)(31686004)(44832011)(66574015)(66946007)=
(8936002)(2616005)(83380400001)(36756003)(6506007)(91956017)(26005)(4374050=
0002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =3D?utf-8?B?TlpQcW15UjBqalRLRGp3Wm5TM=
VhsOGYxQ0RHa240aEdMdGZrYzVtM0Q0U2tl?=3D
 =3D?utf-8?B?Y2IrR25Mazc3SjRWZVNrcGRPWlI5UmY5NGZiSzFkTTQzWHlSTWU4S2QwcXlP?=
=3D
 =3D?utf-8?B?L1pDcEV5a2VJNGRmSG02NTR5dXFib1ViczZHMWVWWHMweTdYT2JnSGhlNVJQ?=
=3D
 =3D?utf-8?B?TjhHRU5vN1lEU21MNFBlNHhXaVp1bFNURDhJMHo4VWpJR0wyb3lUYkJMK2VT?=
=3D
 =3D?utf-8?B?MnUvS000d1RvSTRqSTY4bEpXODRPU3NmaXJJKzhkaWh5aGtJaFFXUjNqcmRw?=
=3D
 =3D?utf-8?B?OWRiZ2czTVloS2tCdTZUeGQ4ZDAxaThITWI5Z2xJRVJmUEc0UTBTOExxRDJt?=
=3D
 =3D?utf-8?B?ZjhFaENBS3ZTaW1NTFpwbDBXSE01bGFyaXBUbjZEM1RQZ3N6bVdkZEltVVdO?=
=3D
 =3D?utf-8?B?VHplSnpNdjkrSDFQYlltQVFXSDM5aU5VMDhMTm12L0ZoUTdKQ1lSak1yeGli?=
=3D
 =3D?utf-8?B?VnpCS2kwV3VQSjdOMDRyRGxNcEJUdmo4TGc5dWtGcG5tSzVPYjA2YkRyQW5r?=
=3D
 =3D?utf-8?B?L2VXREV0L1orT09mVmN1dTQzUlgrVUljb2hTZHVRdVFqTzVwbGxmVmQvS1Y4?=
=3D
 =3D?utf-8?B?Z1F1TlVjOWJZZkcwd0d3M3d2a0tSUlFEMWpMbWIva1pnR0E2Y2pHMzBUT3pT?=
=3D
 =3D?utf-8?B?dWNOd1ZrcFVWcG9acHNyOU9oQnoyU1pKQVVVd0N2VHpiOE8yNEtmenp0d2ZB?=
=3D
 =3D?utf-8?B?RlJmMEFZU2d0R21iZXRFeTNwREN6NDAwM0RTdGRFMkxMVzhmUWp6SEpyMzVK?=
=3D
 =3D?utf-8?B?aVR5d0JsdGE1c0JEMUlMV2xqaFh4ZitoQkw3dGVLTUxNNTVVcSsxUTFZbjNx?=
=3D
 =3D?utf-8?B?MEJtYmFLY0VQOEJwRVRuU3JXT2xpNmIrMUZCRnRRVlNBVnVkeUFteWkyMjVC?=
=3D
 =3D?utf-8?B?cGpzVE5WeDVTbTB2TzZPZUZiU3loL0crekNkTmJzYVpHaXJRVXlKWnNHK2ZU?=
=3D
 =3D?utf-8?B?RDYyejd2U282YnBiaWd3WUlOWlFQNm9KS01WMmx6Q3BKTnVhYnlKUk9UT0hR?=
=3D
 =3D?utf-8?B?V25MZVR1MmhkM1BManpHSWxNMkNxdWdta2ova1Z3UzhHcHV6TEJodFg5RHNF?=
=3D
 =3D?utf-8?B?V3E2ZDVpem10bU51UTA0YkRWQjl6bUw3M3kwSWNJc0Vwa2gxU2dhWUVCSXdn?=
=3D
 =3D?utf-8?B?N0xMbUJ5cW1NdzFEbWNqanpsMXZjZ3JzbGZkb2kwbnZmY0FBUEQxQnpFaWM2?=
=3D
 =3D?utf-8?B?NWFiY1E1NTcxSkJGWUxTV1RoZWtDTzl2VnBwelZPc1NqOW12bmtUTGdHRDhC?=
=3D
 =3D?utf-8?B?Skx6RmsrTW43bmgxZ0lzZWlVY2htZEVKUE82cGVNZUxiS0RnRDFqWWRqZ1ZO?=
=3D
 =3D?utf-8?B?NWcrZ0Z4TW42TGVIVGRGeFY0ZEFPSEZVcmZsZ0d3TzBMZ2pIampSMzduNXQy?=
=3D
 =3D?utf-8?B?NXJ0c3dUUmhYOWMyMHJzK000dlNMUzdSNklCY3VaQkZHR1VudjRJVkxIQ2lN?=
=3D
 =3D?utf-8?B?V1pEamc4aGIyUlVTQkxMdWxxTyt2V3hBeTd2SU8wU3FBVktNb2s4TTQ0ZTRD?=
=3D
 =3D?utf-8?B?SWZTSnJNc2NrNDZKazM2Q1piMEg4Q1Q0dEVTRWlGbXlBcUFJTkZ3NlBwYzdD?=
=3D
 =3D?utf-8?B?MkJPNXpDKzQ0aVFXWEJTS0wzN3lrYjhvcjBlK20xL05pdVc5bm1kakdYdzFz?=
=3D
 =3D?utf-8?B?eUVJQ05BaDJmWlhKSnRzMzlHYUxYTnF6dHZtNSt5TjlDbW1SUnN0dlY3Q3gv?=
=3D
 =3D?utf-8?B?ekEyTGRwQnRMYm1oV3pIeXF1a3lOVEtZUm0zblJDY1NmSWlXV3ZEUVRxRTZX?=
=3D
 =3D?utf-8?B?eUhwM1lmZk5GdC9janhTTHJLTW42Zkd0dVB5ajFjUzZZb2J6bno2RHFpWDY0?=
=3D
 =3D?utf-8?B?MVcxNVhRMk9HTXg3K0tSOHBvdTRrYzgvV3ZKbzc1OWxkL0J1Q0NGdEh0cFQy?=
=3D
 =3D?utf-8?B?RFZyOWhTN05JY0ljN1RzWWtZU1o1aDlpTklwN3g2S241MlJ4Ris2eVMvV2dW?=
=3D
 =3D?utf-8?B?K2JVMGVpTkJaSXEvdXJINFN1SUhEVTU2aWc2eG9sZFEvYjl1ZVhwNTFTWWZw?=
=3D
 =3D?utf-8?B?NGljdytCYjh6cnpKcnZkOTdmNmU3YzhDOE0wb0szeExrTjJzeG1RUE0vRXFo?=
=3D
 =3D?utf-8?B?dTNoNDQ1ZHE5L2l1d2VwdTJTRXkxbDFqVGJJVXpYVHFKbTVqazNwR25rMGZ0?=
=3D
 =3D?utf-8?B?Y0JVMGp3QUdKNi9GMXVNczF6ZTRtbkwwQkhNZmZkSi9UWURrVTdpTFBxWXhK?=
=3D
 =3D?utf-8?B?VDkwSk5aWHpiRWo4UWpxVThPcXI3TWFic0xoTzVYbkJkcHVqTTdPbExoZ3R0?=
=3D
 =3D?utf-8?B?bXNrUG83L1BGWVNNNXNkVlFoQmVxbk9Ibm5IQmVpMDlsMkpOKzd4NHdqMVJp?=
=3D
 =3D?utf-8?B?TnJZWkNZUEFQSys5UEdUNVJGbWc3dHVsVnRlVndTS0Z2bnlPM1pyNzZYK2hQ?=
=3D
 =3D?utf-8?Q?BA7IEdxUJKIG2FIhlKG6aJDpfR/ffVKwVgFQv?=3D
Content-Type: text/plain; charset=3D"utf-8"
Content-ID: <FB1D638A2132424FAB27D7FB681AA02C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.CO=
M
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a5d8bc-8d35-41bf-281d-08da3=
8c68f21
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 12:04:28.2028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8nL/iCCx4c07IggLuQZpZRnSAa1uid=
BvaCBLBK8Po2biRwdiv83dJ46UGrf1+S/Epn2R/FjyJyAy7t4HhnGUqdhB3LVTcxeMnBUGYrfw4=
JM=3D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3087
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org

DQoNCkxlIDE4LzA1LzIwMjIgw6AgMTM6MTksIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDo=
N
Cj4gIk5hdmVlbiBOLiBSYW8iIDxuYXZlZW4ubi5yYW9AbGludXgudm5ldC5pYm0uY29tPiB3cml=
0
ZXM6DQo+PiBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4+IEEgbG90IG9mICNpZmRlZnMgY2F=
u
IGJlIHJlcGxhY2VkIGJ5IElTX0VOQUJMRUQoKQ0KPj4+DQo+Pj4gRG8gc28uDQo+Pj4NCj4+PiB=
U
aGlzIHJlcXVpcmVzIHRvIGhhdmUga2VybmVsX3RvY19hZGRyKCkgZGVmaW5lZCBhdCBhbGwgdGl=
t
ZQ0KPj4+IGFzIHdlbGwgYXMgUFBDX0lOU1RfTERfVE9DIGFuZCBQUENfSU5TVF9TVERfTFIuDQo=
+
Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm9=
5
QGNzZ3JvdXAuZXU+DQo+Pj4gLS0tDQo+Pj4gdjI6IE1vdmVkIHRoZSBzZXR1cCBvZiBwb3Agb3V=
0
c2lkZSBvZiB0aGUgYmlnIGlmKCkvZWxzZSgpIGluIF9fZnRyYWNlX21ha2Vfbm9wKCkNCj4+PiA=
t
LS0NCj4+PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9jb2RlLXBhdGNoaW5nLmggfCAgIDI=
g
LQ0KPj4+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL21vZHVsZS5oICAgICAgICB8ICAgMiA=
t
DQo+Pj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc2VjdGlvbnMuaCAgICAgIHwgIDI0ICs=
t
LQ0KPj4+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC90cmFjZS9mdHJhY2UuYyAgICAgICB8IDE4MiA=
r
KysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPj4+ICAgNCBmaWxlcyBjaGFuZ2VkLCAxMDMgaW5zZXJ=
0
aW9ucygrKSwgMTA3IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pg0KPj4gPHNuaXA+DQo+Pg0KPj4+IEB=
A
IC03MTAsNiArNzA3LDkgQEAgdm9pZCBhcmNoX2Z0cmFjZV91cGRhdGVfY29kZShpbnQgY29tbWF=
u
ZCkNCj4+Pg0KPj4+ICAgI2lmZGVmIENPTkZJR19QUEM2NA0KPj4+ICAgI2RlZmluZSBQQUNBVE9=
D
IG9mZnNldG9mKHN0cnVjdCBwYWNhX3N0cnVjdCwga2VybmVsX3RvYykNCj4+PiArI2Vsc2UNCj4=
+
PiArI2RlZmluZSBQQUNBVE9DIDANCj4+PiArI2VuZGlmDQo+Pg0KPj4gVGhpcyBjb25mbGljdHM=
g
d2l0aCBteSBmaXggZm9yIHRoZSBmdHJhY2UgaW5pdCB0cmFtcDoNCj4+IGh0dHBzOi8vcGF0Y2h=
3
b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvcGF0Y2gvMjAyMjA1MTYwNzE0MjI=
u
NDYzNzM4LTEtbmF2ZWVuLm4ucmFvQGxpbnV4LnZuZXQuaWJtLmNvbS8NCj4+DQo+PiBJdCBwcm9=
i
YWJseSBtYWtlcyBzZW5zZSB0byByZXRhaW4gI2lmZGVmIENPTkZJR19QUEM2NCwgc28gdGhhdCB=
3
ZSBjYW4NCj4+IGdldCByaWQgb2YgdGhlIFBBQ0FUT0MuIEhlcmUgaXMgYW4gaW5jcmVtZW50YWw=
g
ZGlmZjoNCj4gDQo+IFdoZXJlIGlzIHRoZSBpbmNyZW1lbnRhbCBkaWZmIG1lYW50IHRvIGFwcGx=
5
Pw0KPiANCj4gSXQgZG9lc24ndCBhcHBseSBvbiB0b3Agb2YgcGF0Y2ggMTksIG9yIGF0IHRoZSB=
l
bmQgb2YgdGhlIHNlcmllcy4NCg0KV2hpdGUgc3BhY2UgZGFtYWdlIGl0IHNlZW1zLg0KDQpJJ2x=
s
IHNlbmQgeW91IGEgcHJvcGVyIGZpeHVwIGZvciB0aGF0IHBhdGNoIGluIGEgZmV3IG1pbnV0ZXM=
u
DQoNCg0KPiANCj4gY2hlZXJzDQo+IA0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJ=
u
ZWwvdHJhY2UvZnRyYWNlLmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jDQo=
+
PiBpbmRleCBkYTFhMmY4ZWJiNzJmMy4uMjgxNjlhMWNjYzczNzcgMTAwNjQ0DQo+PiAtLS0gYS9=
h
cmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jDQo+PiArKysgYi9hcmNoL3Bvd2VycGM=
v
a2VybmVsL3RyYWNlL2Z0cmFjZS5jDQo+PiBAQCAtNzAxLDExICs3MDEsNiBAQCB2b2lkIGFyY2h=
f
ZnRyYWNlX3VwZGF0ZV9jb2RlKGludCBjb21tYW5kKQ0KPj4gICB9DQo+PiAgIA0KPj4gICAjaWZ=
k
ZWYgQ09ORklHX1BQQzY0DQo+PiAtI2RlZmluZSBQQUNBVE9DIG9mZnNldG9mKHN0cnVjdCBwYWN=
h
X3N0cnVjdCwga2VybmVsX3RvYykNCj4+IC0jZWxzZQ0KPj4gLSNkZWZpbmUgUEFDQVRPQyAwDQo=
+
PiAtI2VuZGlmDQo+PiAtDQo+PiAgIGV4dGVybiB1bnNpZ25lZCBpbnQgZnRyYWNlX3RyYW1wX3R=
l
eHRbXSwgZnRyYWNlX3RyYW1wX2luaXRbXTsNCj4+ICAgDQo+PiAgIHZvaWQgZnRyYWNlX2ZyZWV=
f
aW5pdF90cmFtcCh2b2lkKQ0KPj4gQEAgLTcyNCw3ICs3MTksNyBAQCBpbnQgX19pbml0IGZ0cmF=
j
ZV9keW5fYXJjaF9pbml0KHZvaWQpDQo+PiAgIAlpbnQgaTsNCj4+ICAgCXVuc2lnbmVkIGludCA=
q
dHJhbXBbXSA9IHsgZnRyYWNlX3RyYW1wX3RleHQsIGZ0cmFjZV90cmFtcF9pbml0IH07DQo+PiA=
g
IAl1MzIgc3R1Yl9pbnNuc1tdID0gew0KPj4gLQkJUFBDX1JBV19MRChfUjEyLCBfUjEzLCBQQUN=
B
VE9DKSwNCj4+ICsJCVBQQ19SQVdfTEQoX1IxMiwgX1IxMywgb2Zmc2V0b2Yoc3RydWN0IHBhY2F=
f
c3RydWN0LCBrZXJuZWxfdG9jKSksDQo+PiAgIAkJUFBDX1JBV19BRERJUyhfUjEyLCBfUjEyLCA=
w
KSwNCj4+ICAgCQlQUENfUkFXX0FEREkoX1IxMiwgX1IxMiwgMCksDQo+PiAgIAkJUFBDX1JBV19=
N
VENUUihfUjEyKSwNCj4+IEBAIC03MzMsOSArNzI4LDYgQEAgaW50IF9faW5pdCBmdHJhY2VfZHl=
u
X2FyY2hfaW5pdCh2b2lkKQ0KPj4gICAJdW5zaWduZWQgbG9uZyBhZGRyOw0KPj4gICAJbG9uZyB=
y
ZWxhZGRyOw0KPj4gICANCj4+IC0JaWYgKElTX0VOQUJMRUQoQ09ORklHX1BQQzMyKSkNCj4+IC0=
J
CXJldHVybiAwOw0KPj4gLQ0KPj4gICAJYWRkciA9IHBwY19nbG9iYWxfZnVuY3Rpb25fZW50cnk=
o
KHZvaWQgKilGVFJBQ0VfUkVHU19BRERSKTsNCj4+ICAgCXJlbGFkZHIgPSBhZGRyIC0ga2VybmV=
s
X3RvY19hZGRyKCk7DQo+PiAgIA0KPj4gQEAgLTc1NCw2ICs3NDYsNyBAQCBpbnQgX19pbml0IGZ=
0
cmFjZV9keW5fYXJjaF9pbml0KHZvaWQpDQo+PiAgIA0KPj4gICAJcmV0dXJuIDA7DQo+PiAgIH0=
N
Cj4+ICsjZW5kaWYNCj4+ICAgDQo+PiAgICNpZmRlZiBDT05GSUdfRlVOQ1RJT05fR1JBUEhfVFJ=
B
Q0VSDQo+PiAgIA0KPj4NCj4+IC0gTmF2ZWVu


