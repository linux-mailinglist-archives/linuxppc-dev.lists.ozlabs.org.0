Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB9EB266
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 03:42:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rYZ31x9jzDqb5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 11:42:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="qzeupJCX"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rYWX3bNvzDqTV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 11:39:52 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 123B9208CB;
 Sat, 27 Apr 2019 01:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556329188;
 bh=dYOStLGNgxw+C8nTvKJr0GmoThFgHBIN2xwY/JkDaW4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qzeupJCXoFE7N0vY4Q7FqgbIz+LME4HKW0n7+kPZjbYABAEa5eZVXzsOScNneCxOM
 s0L5Fs98+CYVN4SF/VeDMWWbuC9mNLLFj16PS7LvOF6GwgExYKT7vka2COmOUtQDZ/
 twckOkkuwj89yuUTbXgqPVsZ3UB0rmy2UqkuyDCE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 44/79] powerpc/vdso32: fix CLOCK_MONOTONIC on PPC64
Date: Fri, 26 Apr 2019 21:38:03 -0400
Message-Id: <20190427013838.6596-44-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190427013838.6596-1-sashal@kernel.org>
References: <20190427013838.6596-1-sashal@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@c-s.fr>

[ Upstream commit dd9a994fc68d196a052b73747e3366c57d14a09e ]

Commit b5b4453e7912 ("powerpc/vdso64: Fix CLOCK_MONOTONIC
inconsistencies across Y2038") changed the type of wtom_clock_sec
to s64 on PPC64. Therefore, VDSO32 needs to read it with a 4 bytes
shift in order to retrieve the lower part of it.

Fixes: b5b4453e7912 ("powerpc/vdso64: Fix CLOCK_MONOTONIC inconsistencies across Y2038")
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/vdso32/gettimeofday.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kernel/vdso32/gettimeofday.S
index 1e0bc5955a40..afd516b572f8 100644
--- a/arch/powerpc/kernel/vdso32/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
@@ -98,7 +98,7 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
 	 * can be used, r7 contains NSEC_PER_SEC.
 	 */
 
-	lwz	r5,WTOM_CLOCK_SEC(r9)
+	lwz	r5,(WTOM_CLOCK_SEC+LOPART)(r9)
 	lwz	r6,WTOM_CLOCK_NSEC(r9)
 
 	/* We now have our offset in r5,r6. We create a fake dependency
-- 
2.19.1

