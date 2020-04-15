Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC66F1A9F14
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 14:10:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492LlG5fkNzDqtl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 22:10:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=OuncJ1Ni; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492LBl3wJqzDqwl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 21:45:19 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C511421582;
 Wed, 15 Apr 2020 11:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586951117;
 bh=Sql1Qa0q1sxaK1NvXSoxR08DQdz4Luetn7Wwjl1NXMo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OuncJ1NinoP6bEJqkbGrrURx91BViYuJmK5f8OhNqu4peomz/0h0dNDBUIm8qqRWA
 lrWFFVvY0Bz0WNr8yYuM/KWGRHxC2jPYI8js0tK2H4e7QkQpuGWD/mll4EKLwnK0Ex
 YJiiqgX0BS8s1giaLm8q0NUXpqf01wrhHTJlfzvI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 31/84] powerpc/prom_init: Pass the "os-term"
 message to hypervisor
Date: Wed, 15 Apr 2020 07:43:48 -0400
Message-Id: <20200415114442.14166-31-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415114442.14166-1-sashal@kernel.org>
References: <20200415114442.14166-1-sashal@kernel.org>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

[ Upstream commit 74bb84e5117146fa73eb9d01305975c53022b3c3 ]

The "os-term" RTAS calls has one argument with a message address of OS
termination cause. rtas_os_term() already passes it but the recently
added prom_init's version of that missed it; it also does not fill
args correctly.

This passes the message address and initializes the number of arguments.

Fixes: 6a9c930bd775 ("powerpc/prom_init: Add the ESM call to prom_init")
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20200312074404.87293-1-aik@ozlabs.ru
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/prom_init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index eba9d4ee4baf6..689664cd4e79b 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -1761,6 +1761,9 @@ static void __init prom_rtas_os_term(char *str)
 	if (token == 0)
 		prom_panic("Could not get token for ibm,os-term\n");
 	os_term_args.token = cpu_to_be32(token);
+	os_term_args.nargs = cpu_to_be32(1);
+	os_term_args.nret = cpu_to_be32(1);
+	os_term_args.args[0] = cpu_to_be32(__pa(str));
 	prom_rtas_hcall((uint64_t)&os_term_args);
 }
 #endif /* CONFIG_PPC_SVM */
-- 
2.20.1

