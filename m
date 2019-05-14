Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEBA1C907
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 14:51:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453Hcd43N0zDqLs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 22:51:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=git.icu
 (client-ip=163.172.180.134; helo=git.icu; envelope-from=shawn@git.icu;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=git.icu
Received: from git.icu (git.icu [163.172.180.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453HZP6GlyzDqD5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 22:49:33 +1000 (AEST)
Received: from localhost.localdomain (minicloud.parqtec.unicamp.br
 [143.106.167.126]) by git.icu (Postfix) with ESMTPSA id 3BA01220515;
 Tue, 14 May 2019 12:49:25 +0000 (UTC)
From: Shawn Landden <shawn@git.icu>
To: 
Subject: [PATCH] powerpc: Allow may_use_simd() to function as feature detection
Date: Tue, 14 May 2019 09:49:18 -0300
Message-Id: <20190514124918.22590-1-shawn@git.icu>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a
In-Reply-To: <20190513005104.20140-1-shawn@git.icu>
References: <20190513005104.20140-1-shawn@git.icu>
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
Cc: Shawn Landden <shawn@git.icu>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ARM does this, so we might as well too.
I am a bit confused however as CONFIG_ALTIVEC does not select
CONFIG_PPC_FPU. Would you ever have altivec without a fpu?

Signed-off-by: Shawn Landden <shawn@git.icu>
---
 arch/powerpc/include/asm/simd.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/include/asm/simd.h b/arch/powerpc/include/asm/simd.h
index 9b066d633..2fe26f258 100644
--- a/arch/powerpc/include/asm/simd.h
+++ b/arch/powerpc/include/asm/simd.h
@@ -7,4 +7,11 @@
  * It's always ok in process context (ie "not interrupt")
  * but it is sometimes ok even from an irq.
  */
+#ifdef CONFIG_PPC_FPU
 extern bool may_use_simd(void);
+#else
+static inline bool may_use_simd(void)
+{
+	return false;
+}
+#endif
-- 
2.21.0.1020.gf2820cf01a

