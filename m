Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 405995FF061
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 16:32:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MppkG0yMKz2xHJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 01:32:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=asuWPS4n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=asuWPS4n;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpnvR4fPhz3f14
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 00:54:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EC95E61B48;
	Fri, 14 Oct 2022 13:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEECBC43470;
	Fri, 14 Oct 2022 13:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665755697;
	bh=TE6BP9ewEM3scfg8y5+JaE11M16nyUyRAjWMQ7F+xzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=asuWPS4nGIlGNyR63eh1z1khEkqPVs/r9UvirjIz9PjdX7KjeJNG5M0hSn/l/TMKm
	 L4W6RM87aygVS5o9kW05473pbcBdW21e2Fk+uHechD8cnpllMhq1/Qy6rr1OnBgNDM
	 /HxOUrmEr4zngvAJNb9PPhisfJpkUcVHvoB5mgqfgYgjChcMLbUIjHFcysPsc/WB6q
	 9b0ZIIlRlgsFoSMibGUYj8gWRbmxTgqxeUn8e7fiMRi229th3wYLnVOM+AKMXP/xBv
	 fdE0lVOn5UoGAbCmpnqsLVJ5uwm3N6KOxcqlVWhBr9qcqXgb9377TtkNFQEzNGhYvo
	 poWU4NAgHZGYg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 3/4] powerpc: Remove direct call to personality syscall handler
Date: Fri, 14 Oct 2022 09:54:46 -0400
Message-Id: <20221014135448.2110152-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221014135448.2110152-1-sashal@kernel.org>
References: <20221014135448.2110152-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, maqianga@uniontech.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Rohan McLure <rmclure@linux.ibm.com>

[ Upstream commit 4df0221f9ded8c39aecfb1a80cef346026671cb7 ]

Syscall handlers should not be invoked internally by their symbol names,
as these symbols defined by the architecture-defined SYSCALL_DEFINE
macro. Fortunately, in the case of ppc64_personality, its call to
sys_personality can be replaced with an invocation to the
equivalent ksys_personality inline helper in <linux/syscalls.h>.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220921065605.1051927-13-rmclure@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/syscalls.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index a877bf8269fe..31cf6c0befe8 100644
--- a/arch/powerpc/kernel/syscalls.c
+++ b/arch/powerpc/kernel/syscalls.c
@@ -109,7 +109,7 @@ long ppc64_personality(unsigned long personality)
 	if (personality(current->personality) == PER_LINUX32
 	    && personality(personality) == PER_LINUX)
 		personality = (personality & ~PER_MASK) | PER_LINUX32;
-	ret = sys_personality(personality);
+	ret = ksys_personality(personality);
 	if (personality(ret) == PER_LINUX32)
 		ret = (ret & ~PER_MASK) | PER_LINUX;
 	return ret;
-- 
2.35.1

