Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D90FC174CF7
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Mar 2020 12:24:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48VgsL61XSzDr3L
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Mar 2020 22:24:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Vgjd2j8lzDrDF
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Mar 2020 22:17:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=eRIHybkV; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48Vgjc5W5Lz9sSG; Sun,  1 Mar 2020 22:17:40 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48Vgjc41DCz9sSH; Sun,  1 Mar 2020 22:17:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1583061460;
 bh=ezOTtAixucqhM7xFdHdfICmSFRsqkvS+bYSkRigpnTk=;
 h=From:To:Subject:Date:From;
 b=eRIHybkVYh75uiBEXgFVqJvglD89BQ3i82+pmnD999UfiIq8pVpHymlx3QpQFFNVz
 tGAWRicfQDeoptgmTl5rIQz5rEGr+AkJa3b7T++oOB7yQ6GjeqhlacWWM2ldKtVzsv
 CpWXUjqb3SMUgekbnFNKvRLItmd4vhEAWh0fZSB19ZJoivDPxZIhGBdFh+hJdUBcXz
 X6foRtZFqojpB8F++ibqSaMxdabwul5dvwGbhn2EAyk+qzxCZW+jf/5+9lOKOXjniC
 6XMA2mBh0d3pWN9C+QYXIAAoPNLFmuFocKu8QyWsYgMxo9RPWGC5tYznzvo1JSOU/2
 cj0lpZ8NLdJxQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/kuap: PPC_KUAP_DEBUG should depend on PPC_KUAP
Date: Sun,  1 Mar 2020 22:17:38 +1100
Message-Id: <20200301111738.22497-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently you can enable PPC_KUAP_DEBUG when PPC_KUAP is disabled,
even though the former has not effect without the latter.

Fix it so that PPC_KUAP_DEBUG can only be enabled when PPC_KUAP is
enabled, not when the platform could support KUAP (PPC_HAVE_KUAP).

Fixes: 890274c2dc4c ("powerpc/64s: Implement KUAP for Radix MMU")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/Kconfig.cputype | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 6caedc88474f..6cd4e3240ec6 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -397,7 +397,7 @@ config PPC_KUAP
 
 config PPC_KUAP_DEBUG
 	bool "Extra debugging for Kernel Userspace Access Protection"
-	depends on PPC_HAVE_KUAP && (PPC_RADIX_MMU || PPC_32)
+	depends on PPC_KUAP && (PPC_RADIX_MMU || PPC_32)
 	help
 	  Add extra debugging for Kernel Userspace Access Protection (KUAP)
 	  If you're unsure, say N.
-- 
2.21.1

