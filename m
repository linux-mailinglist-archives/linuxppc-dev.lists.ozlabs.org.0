Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C39D45FF04C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 16:27:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mppd44DNLz3g2F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 01:27:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S56tekMO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S56tekMO;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mpnv60hCtz3dtP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 00:54:42 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E14BB61B50;
	Fri, 14 Oct 2022 13:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 585AAC433B5;
	Fri, 14 Oct 2022 13:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665755679;
	bh=9mae/2kNavQataQI+MB9YEXoJv91uSxlXWeWWp7q2K8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S56tekMO3r8+DBHfm6AX2eDi93bwGaggx3HqJ1W7Kz58p8XDhGbsouA07vZCJ45MI
	 ik4fhfF6CVRJEGg/o/aI8ZAFJDtkelc5H7pZB8RBXcn9DGE4+AdLRBKh/ydlYIHsBD
	 o4AxL10kSqypnoYc1gfjB823O406bUpRJgvl/AgensZ/kt4fgqo4wPDkU3lgJGAHp0
	 YTPUUNz0k22RhUPwBgfJrex0QYowpRk6BHaljRgJTv1k+rLo9HNEd7/zSaPpkur44C
	 yZIHPEZgfLbkZ39JVowlycpxtNnyjcxhpE9FR1lLBfU3q3MZACX3MbQSoNAZHSmJhg
	 kR4xCESRZcNKQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 3/5] powerpc: Remove direct call to personality syscall handler
Date: Fri, 14 Oct 2022 09:54:26 -0400
Message-Id: <20221014135430.2110067-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221014135430.2110067-1-sashal@kernel.org>
References: <20221014135430.2110067-1-sashal@kernel.org>
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
index 466216506eb2..94067b6979e4 100644
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

