Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9D8370E33
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 May 2021 19:26:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYChH5dgxz3023
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 03:26:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYCgz0Tlsz2xZg
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 03:26:22 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 65CBFB001;
 Sun,  2 May 2021 17:26:19 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Don't opencode HAVE_EFFICIENT_UNALIGNED_ACCESS
Date: Sun,  2 May 2021 19:26:08 +0200
Message-Id: <20210502172608.6309-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.26.2
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Anton Blanchard <anton@samba.org>, Michal Suchanek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is some disconnect between commit 8a18cc0c2c36 ("powerpc: Only
disable HAVE_EFFICIENT_UNALIGNED_ACCESS on POWER7 little endian") and
commit a75c380c7129 ("powerpc: Enable DCACHE_WORD_ACCESS on ppc64le").

The first defines HAVE_EFFICIENT_UNALIGNED_ACCESS for the purpose of
enabling DCACHE_WORD_ACCESS and the second opencodes it, and differently
at that.

Fixes: a75c380c7129 ("powerpc: Enable DCACHE_WORD_ACCESS on ppc64le")
Fixes: 8a18cc0c2c36 ("powerpc: Only disable HAVE_EFFICIENT_UNALIGNED_ACCESS on POWER7 little endian")
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 arch/powerpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 75b3afbfc378..b00c37097ca2 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -162,7 +162,7 @@ config PPC
 	select BUILDTIME_TABLE_SORT
 	select BUILD_ELF_V2			if PPC64 && CPU_LITTLE_ENDIAN
 	select CLONE_BACKWARDS
-	select DCACHE_WORD_ACCESS		if PPC64 && CPU_LITTLE_ENDIAN
+	select DCACHE_WORD_ACCESS		if HAVE_EFFICIENT_UNALIGNED_ACCESS
 	select DMA_OPS				if PPC64
 	select DMA_OPS_BYPASS			if PPC64
 	select ARCH_HAS_DMA_MAP_DIRECT 		if PPC64 && PPC_PSERIES
-- 
2.26.2

