Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EDD6906B8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 12:19:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCDt35Y6xz3f4m
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 22:19:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HXxmp1XD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HXxmp1XD;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCDr5050jz3f4t
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 22:18:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2F03961A30;
	Thu,  9 Feb 2023 11:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3014CC4339B;
	Thu,  9 Feb 2023 11:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675941489;
	bh=UT29xroFmNA4NXgchhR/19LZ6IaWIrpB7tNSnEi/wCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HXxmp1XDpE029/aC2rjrt5i565U8xs1/d0AJ86y2dN9AkkoG4zgzc4JhL8Da063QK
	 pKs3q+4NPOBNo45fujLUniqAQoFPOV/WAMyYcQNWtSjslNHiiq27J1YlDclDSCjHEO
	 05PxP2eAF5CvmVnvQkohPv6HbwaxUMk40Dpx4nQ27ApiR0IQfnFLEuuXUlWXs8R3f9
	 NWpEqiK4m5oSC02MIV7H3jqaZ7zAAOstyUS0KNdhXeRG/+fPKDtdGyETJRu4VBNwGv
	 kzhDon3N2aU5n0oNWsy3M4Vsamm1Kdwzu+fP3hRR6mqtToFdAJ7RlWCRVMKjgo22Cb
	 oE/yEzotbcQvw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 09/17] powerpc/85xx: Fix unannotated intra-function call warning
Date: Thu,  9 Feb 2023 06:17:21 -0500
Message-Id: <20230209111731.1892569-9-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209111731.1892569-1-sashal@kernel.org>
References: <20230209111731.1892569-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, kernel test robot <lkp@intel.com>, Sathvika Vasireddy <sv@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Sathvika Vasireddy <sv@linux.ibm.com>

[ Upstream commit 8afffce6aa3bddc940ac1909627ff1e772b6cbf1 ]

objtool throws the following warning:
  arch/powerpc/kernel/head_85xx.o: warning: objtool: .head.text+0x1a6c:
  unannotated intra-function call

Fix the warning by annotating KernelSPE symbol with SYM_FUNC_START_LOCAL
and SYM_FUNC_END macros.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20230128124138.1066176-1-sv@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/head_fsl_booke.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index 0a9a0f301474d..5cb599c42b597 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -849,7 +849,7 @@ _GLOBAL(load_up_spe)
  * SPE unavailable trap from kernel - print a message, but let
  * the task use SPE in the kernel until it returns to user mode.
  */
-KernelSPE:
+SYM_FUNC_START_LOCAL(KernelSPE)
 	lwz	r3,_MSR(r1)
 	oris	r3,r3,MSR_SPE@h
 	stw	r3,_MSR(r1)	/* enable use of SPE after return */
@@ -866,6 +866,7 @@ KernelSPE:
 #endif
 	.align	4,0
 
+SYM_FUNC_END(KernelSPE)
 #endif /* CONFIG_SPE */
 
 /*
-- 
2.39.0

