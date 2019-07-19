Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B296E072
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 07:08:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qfCd09RmzDqbv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 15:08:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="gKdzmek2"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qcvY6tjKzDqHR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 14:09:13 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 144F021872;
 Fri, 19 Jul 2019 04:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563509351;
 bh=L/zTDr17ridG+WrpvY+xueXwG1RdFupWPmRMDrbkZhI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gKdzmek2hXZ+zUMyOr/5h46kTGluGXe3L3dhRHkFRJ4XqtMXxp+kBGdonZm26bdL0
 3bz/ANzlotJMKeSWJDhbu9p+cVgvdeW4Az6iKj/YFV6Xl+g7LV7GRS4MeueLyxTZ02
 muEtn2Dye84VkSWiFp0xwzAZ/X4TtcDUxDjCGJ2I=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 048/101] powerpc/cacheflush: fix variable set but
 not used
Date: Fri, 19 Jul 2019 00:06:39 -0400
Message-Id: <20190719040732.17285-48-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040732.17285-1-sashal@kernel.org>
References: <20190719040732.17285-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Qian Cai <cai@lca.pw>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Qian Cai <cai@lca.pw>

[ Upstream commit 04db3ede40ae4fc23a5c4237254c4a53bbe4c1f2 ]

The powerpc's flush_cache_vmap() is defined as a macro and never use
both of its arguments, so it will generate a compilation warning,

lib/ioremap.c: In function 'ioremap_page_range':
lib/ioremap.c:203:16: warning: variable 'start' set but not used
[-Wunused-but-set-variable]

Fix it by making it an inline function.

Signed-off-by: Qian Cai <cai@lca.pw>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/cacheflush.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/cacheflush.h b/arch/powerpc/include/asm/cacheflush.h
index d5a8d7bf0759..b189f7aee222 100644
--- a/arch/powerpc/include/asm/cacheflush.h
+++ b/arch/powerpc/include/asm/cacheflush.h
@@ -32,9 +32,12 @@
  * not expect this type of fault. flush_cache_vmap is not exactly the right
  * place to put this, but it seems to work well enough.
  */
-#define flush_cache_vmap(start, end)		do { asm volatile("ptesync" ::: "memory"); } while (0)
+static inline void flush_cache_vmap(unsigned long start, unsigned long end)
+{
+	asm volatile("ptesync" ::: "memory");
+}
 #else
-#define flush_cache_vmap(start, end)		do { } while (0)
+static inline void flush_cache_vmap(unsigned long start, unsigned long end) { }
 #endif
 
 #define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1
-- 
2.20.1

