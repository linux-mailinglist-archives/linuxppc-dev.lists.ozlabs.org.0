Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B496AB06E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 14:55:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PV3Bz4k6tz3cKm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 00:55:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rfGtVqhm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rfGtVqhm;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PV37D1NRZz3cfB
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 00:52:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5D44960B0A;
	Sun,  5 Mar 2023 13:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82893C433EF;
	Sun,  5 Mar 2023 13:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678024357;
	bh=d7+kc+gWXq5ZyIrrqwOoh9kM+3TAzAMMcA49QzJ/0RI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rfGtVqhmyqFdbBX9vQIP9IL1pe8hNWa4ENvCeXRjeoM2JQFs3tCtcnGunTIyjvsm5
	 1hJDgVdVOyNNZ9xh8sSJVq06kuiP/tRb6WzCeTIELRhtIFDtskrlfBAtXRoxkjw/OD
	 EdXOhqD+61hOdpSJ160MoPkI5b+5eVb2aIlXmBqMi+f4TJOtje3vFpRcJFAY/KPCoI
	 GtUelTouszOFdp2vlipRih/lOM2fKKTI78T8k3Ei1ZNaoO7pkLe35ikvGgcuWMuomG
	 3DMEw00FWZhEyVNoGS4nIGLjylv9YzFV62V48UoAQydE0teXYpNdEF8pyW0WgLsYWH
	 07SqFKPM7EF3Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 08/16] powerpc: Remove __kernel_text_address() in show_instructions()
Date: Sun,  5 Mar 2023 08:51:59 -0500
Message-Id: <20230305135207.1793266-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230305135207.1793266-1-sashal@kernel.org>
References: <20230305135207.1793266-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, ulf.hansson@linaro.org, keescook@chromium.org, Jason@zx2c4.com, npiggin@gmail.com, jniethe5@gmail.com, wangkefeng.wang@huawei.com, linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org, ebiederm@xmission.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

[ Upstream commit d9ab6da64fd15608c9feb20d769d8df1a32fe212 ]

That test was introducted in 2006 by
commit 00ae36de49cc ("[POWERPC] Better check in show_instructions").
At that time, there was no BPF progs.

As seen in message of commit 89d21e259a94 ("powerpc/bpf/32: Fix Oops
on tail call tests"), when a page fault occurs in test_bpf.ko for
instance, the code is dumped as XXXXXXXXs. Allthough
__kernel_text_address() checks is_bpf_text_address(), it seems it is
not enough.

Today, show_instructions() uses get_kernel_nofault() to read the code,
so there is no real need for additional verifications.

ARM64 and x86 don't do any additional check before dumping
instructions. Do the same and remove __kernel_text_address()
in show_instructions().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/4fd69ef7945518c3e27f96b95046a5c1468d35bf.1675245773.git.christophe.leroy@csgroup.eu
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/process.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index c22cc234672f9..effe9697905dc 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1405,8 +1405,7 @@ static void show_instructions(struct pt_regs *regs)
 	for (i = 0; i < NR_INSN_TO_PRINT; i++) {
 		int instr;
 
-		if (!__kernel_text_address(pc) ||
-		    get_kernel_nofault(instr, (const void *)pc)) {
+		if (get_kernel_nofault(instr, (const void *)pc)) {
 			pr_cont("XXXXXXXX ");
 		} else {
 			if (nip == pc)
-- 
2.39.2

