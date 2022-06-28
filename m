Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A282E55BD72
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 04:24:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LX7h13J8gz3cg4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 12:24:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fG34mLIE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fG34mLIE;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LX7gQ6q9kz3bpy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 12:23:30 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A1D06618AC;
	Tue, 28 Jun 2022 02:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC41CC341CA;
	Tue, 28 Jun 2022 02:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656383006;
	bh=nJaNlPr3jdzCW9OS9MBgZaEotBShDymF6jkYgLqhi4g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fG34mLIEJSxxXKWxDvvEsykJnh80el1XQTDF5mEBUb+KUrGWRv8B/L2kmPN7x0Tdk
	 SizxCEv6//6soUD9tEuMY7WuHb8P1FjWxe0s9ZiC4BDyHRVmzYBGqtJF7a1HRYcMEe
	 UmSGKKHtM+kG/b+zHsnXSL1TwKfdLfsu96xFUkqdPNcH++Zas//vlELUKteMtHtGGN
	 okWmDrqejvnvBxl6dIySA/CcQnuceAPxuFSPpgxs/I5bMhsJUgTHutvZnByjhWnhmF
	 f7YCd/DTSz+jUeBvFjX6dnJZ719P5V3F081DOXHz3ELna+h/e0vSZg2eIADbsS6n7N
	 ZUpDRYn69OuQQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 15/34] powerpc/prom_init: Fix build failure with GCC_PLUGIN_STRUCTLEAK_BYREF_ALL and KASAN
Date: Mon, 27 Jun 2022 22:22:22 -0400
Message-Id: <20220628022241.595835-15-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022241.595835-1-sashal@kernel.org>
References: <20220628022241.595835-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, nick.child@ibm.com, Julia.Lawall@inria.fr, jlu.hpw@foxmail.com, aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, adobriyan@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

[ Upstream commit ca5dabcff1df6bc8c413922b5fa63cc602858803 ]

When CONFIG_KASAN is selected, we expect prom_init to use __memset()
because it is too early to use memset().

But with CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL, the compiler adds calls
to memset() to clear objects on stack, hence the following failure:

	  PROMCHK arch/powerpc/kernel/prom_init_check
	Error: External symbol 'memset' referenced from prom_init.c
	make[2]: *** [arch/powerpc/kernel/Makefile:204 : arch/powerpc/kernel/prom_init_check] Erreur 1

prom_find_machine_type() is called from prom_init() and is called only
once, so lets put compat[] in BSS instead of stack to avoid that.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/3802811f7cf94f730be44688539c01bba3a3b5c0.1654875808.git.christophe.leroy@csgroup.eu
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/prom_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 9e71c0739f08..03c5ef29bd31 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -2265,7 +2265,7 @@ static void __init prom_init_stdout(void)
 
 static int __init prom_find_machine_type(void)
 {
-	char compat[256];
+	static char compat[256] __prombss;
 	int len, i = 0;
 #ifdef CONFIG_PPC64
 	phandle rtas;
-- 
2.35.1

