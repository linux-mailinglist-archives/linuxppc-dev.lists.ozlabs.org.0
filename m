Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D819A77604B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 15:12:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kZUUyCFd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLVp75pwmz3cS0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 23:12:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kZUUyCFd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLVmP0r72z3bb4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Aug 2023 23:10:45 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3E96E63A20;
	Wed,  9 Aug 2023 13:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D17DC433C7;
	Wed,  9 Aug 2023 13:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691586642;
	bh=8yNyOO+2QZkgnoSSVDnys8vhbwWKyMOWhNjFppxAbQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kZUUyCFdjZy8W9ni44xJMyzler9r/pp5Xrd/1pc+MWEcwzhHd82RLr2naHrtvDvvX
	 Wk0gUHLaQgg9daasROVWAbMjzfaqJBQ8jSbf+hxlblbsejZiYoF0BTCEXaQY1PRj/Y
	 ZN+vAwprYyfK2B0J99Eh18n8hPGYgzdbMKVpEDrAbrkVr5xBu5uZJrhR+UI/fRwCKd
	 PstLGmVdmMq7b24IdRcaNcthcPSuTg+shBJSFEcBM33SWF/VfVqzn26mNKvfrI7EvI
	 YE9nFuLz+w6UYjJD9zAEvS70Y6uez3lfpE/ADmcidjRQa5/AOnhO7pCyZckquMtbqN
	 HV3cPu9jG0XPQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 2/2] powerpc: xmon: remove unused variables
Date: Wed,  9 Aug 2023 15:10:09 +0200
Message-Id: <20230809131024.2039647-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809131024.2039647-1-arnd@kernel.org>
References: <20230809131024.2039647-1-arnd@kernel.org>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Hugh Dickins <hughd@google.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

Randconfig testing with W=1 showed up these warnings that I'd like to enable
by default:

arch/powerpc/xmon/xmon.c: In function 'dump_tlb_book3e':
arch/powerpc/xmon/xmon.c:3833:42: error: variable 'lrat' set but not used [-Werror=unused-but-set-variable]
 3833 |  int i, tlb, ntlbs, pidsz, lpidsz, rasz, lrat = 0;
      |                                          ^~~~
arch/powerpc/xmon/xmon.c:3831:23: error: variable 'lpidmask' set but not used [-Werror=unused-but-set-variable]
 3831 |  u32 mmucfg, pidmask, lpidmask;
      |                       ^~~~~~~~
arch/powerpc/xmon/xmon.c:3831:14: error: variable 'pidmask' set but not used [-Werror=unused-but-set-variable]
 3831 |  u32 mmucfg, pidmask, lpidmask;
      |              ^~~~~~~

Just remove these as they have been unused since the code was added in 2010.

Fixes: 03247157f7391 ("powerpc/book3e: Add TLB dump in xmon for Book3E")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/xmon/xmon.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 9e12b75850d75..e35f13842ce15 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3828,9 +3828,9 @@ static void dump_tlb_44x(void)
 #ifdef CONFIG_PPC_BOOK3E_64
 static void dump_tlb_book3e(void)
 {
-	u32 mmucfg, pidmask, lpidmask;
+	u32 mmucfg;
 	u64 ramask;
-	int i, tlb, ntlbs, pidsz, lpidsz, rasz, lrat = 0;
+	int i, tlb, ntlbs, pidsz, lpidsz, rasz;
 	int mmu_version;
 	static const char *pgsz_names[] = {
 		"  1K",
@@ -3874,12 +3874,8 @@ static void dump_tlb_book3e(void)
 	pidsz = ((mmucfg >> 6) & 0x1f) + 1;
 	lpidsz = (mmucfg >> 24) & 0xf;
 	rasz = (mmucfg >> 16) & 0x7f;
-	if ((mmu_version > 1) && (mmucfg & 0x10000))
-		lrat = 1;
 	printf("Book3E MMU MAV=%d.0,%d TLBs,%d-bit PID,%d-bit LPID,%d-bit RA\n",
 	       mmu_version, ntlbs, pidsz, lpidsz, rasz);
-	pidmask = (1ul << pidsz) - 1;
-	lpidmask = (1ul << lpidsz) - 1;
 	ramask = (1ull << rasz) - 1;
 
 	for (tlb = 0; tlb < ntlbs; tlb++) {
-- 
2.39.2

