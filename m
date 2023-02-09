Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F023A690723
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 12:24:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCDzG5VS4z3fGw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 22:24:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C/p8OHmR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C/p8OHmR;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCDsz68wsz3f8p
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 22:19:51 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EA30761A2B;
	Thu,  9 Feb 2023 11:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72156C433EF;
	Thu,  9 Feb 2023 11:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675941589;
	bh=n6P8LMMd0mFFqrkF+MVvwQSKUmYLoDeVhPpm81ktIf4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C/p8OHmRE08Davrvy5vnJPdT+ezoLq2iPVwLi4leuqL+Idyiyk06GcYePxptWPr1u
	 BHGE5WTWrn4JPtDIc+MCS/Zd16kFiTsVXZDDtnrXtm49+Yo2/naWT1LURXQgtPfAdn
	 p6dEDeAqGRHy4HJxkAysG5rCWYujWzRHgmEP9lKYLyzaqSePWLw4MAEEiq2pisLnOJ
	 L947wDAAf9704b6BEUm4uJHhLlUXsYS67fYKjzrnmvAJlap1nGbP2nWKbpXT0LIeFo
	 Bd0p3UiHX+d40MOR5D3nEtltFclZzLH4/0o05/Zb5CZLWcI3Yx21sJhZQUoCIsY//F
	 r/zYeB8y/WeVA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 06/10] powerpc/kvm: Fix unannotated intra-function call warning
Date: Thu,  9 Feb 2023 06:19:15 -0500
Message-Id: <20230209111921.1893095-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209111921.1893095-1-sashal@kernel.org>
References: <20230209111921.1893095-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, kernel test robot <lkp@intel.com>, npiggin@gmail.com, Sathvika Vasireddy <sv@linux.ibm.com>, seanjc@google.com, pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Sathvika Vasireddy <sv@linux.ibm.com>

[ Upstream commit fe6de81b610e5d0b9d2231acff2de74a35482e7d ]

objtool throws the following warning:
  arch/powerpc/kvm/booke.o: warning: objtool: kvmppc_fill_pt_regs+0x30:
  unannotated intra-function call

Fix the warning by setting the value of 'nip' using the _THIS_IP_ macro,
without using an assembly bl/mflr sequence to save the instruction
pointer.

Reported-by: kernel test robot <lkp@intel.com>
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20230128124158.1066251-1-sv@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kvm/booke.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index be9a45874194f..fc2bb33a4e0e2 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -887,16 +887,15 @@ static int kvmppc_handle_debug(struct kvm_run *run, struct kvm_vcpu *vcpu)
 
 static void kvmppc_fill_pt_regs(struct pt_regs *regs)
 {
-	ulong r1, ip, msr, lr;
+	ulong r1, msr, lr;
 
 	asm("mr %0, 1" : "=r"(r1));
 	asm("mflr %0" : "=r"(lr));
 	asm("mfmsr %0" : "=r"(msr));
-	asm("bl 1f; 1: mflr %0" : "=r"(ip));
 
 	memset(regs, 0, sizeof(*regs));
 	regs->gpr[1] = r1;
-	regs->nip = ip;
+	regs->nip = _THIS_IP_;
 	regs->msr = msr;
 	regs->link = lr;
 }
-- 
2.39.0

