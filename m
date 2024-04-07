Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3885189AEE8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Apr 2024 08:41:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=b6XYzPl9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VC2gS0Nrvz3fQR
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Apr 2024 16:41:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=b6XYzPl9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.98; helo=out30-98.freemail.mail.aliyun.com; envelope-from=yang.lee@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VC2dw4bCjz3bnv
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Apr 2024 16:40:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1712471998; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=dvtlUfZMwcpJa+7Ecw8O4/rWENt4hMvDpxuBMY7/pw0=;
	b=b6XYzPl9pXnO1htaOV8CCaWLqGPduBCINnaO+P32DnqjgqkIe8VdjIVlb89gYX+P4kDxpzKL5lJAgTa9cMVmIcJjRDP9J35EGqJK3DMO0spNkxW+5dks52/TlP//WZVvrW+DRwoVxsEp+cKkfOAwAJs52tUsRr9OZg0liIfyHWM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R261e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0W4.ZytW_1712471996;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0W4.ZytW_1712471996)
          by smtp.aliyun-inc.com;
          Sun, 07 Apr 2024 14:39:57 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: arnd@arndb.de,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com
Subject: [PATCH -next 2/3] powerpc: Fix kernel-doc comments in fsl_gtm.c
Date: Sun,  7 Apr 2024 14:39:51 +0800
Message-Id: <20240407063952.36270-2-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20240407063952.36270-1-yang.lee@linux.alibaba.com>
References: <20240407063952.36270-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=n
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
Cc: Yang Li <yang.lee@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix some function names in kernel-doc comments.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 arch/powerpc/sysdev/fsl_gtm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_gtm.c b/arch/powerpc/sysdev/fsl_gtm.c
index 39186ad6b3c3..71e07883eb48 100644
--- a/arch/powerpc/sysdev/fsl_gtm.c
+++ b/arch/powerpc/sysdev/fsl_gtm.c
@@ -77,7 +77,7 @@ struct gtm {
 static LIST_HEAD(gtms);
 
 /**
- * gtm_get_timer - request GTM timer to use it with the rest of GTM API
+ * gtm_get_timer16 - request GTM timer to use it with the rest of GTM API
  * Context:	non-IRQ
  *
  * This function reserves GTM timer for later use. It returns gtm_timer
@@ -110,7 +110,7 @@ struct gtm_timer *gtm_get_timer16(void)
 EXPORT_SYMBOL(gtm_get_timer16);
 
 /**
- * gtm_get_specific_timer - request specific GTM timer
+ * gtm_get_specific_timer16 - request specific GTM timer
  * @gtm:	specific GTM, pass here GTM's device_node->data
  * @timer:	specific timer number, Timer1 is 0.
  * Context:	non-IRQ
@@ -276,7 +276,7 @@ EXPORT_SYMBOL(gtm_set_timer16);
  * crop precision of the "usec" argument, thus usec is limited to 16 bits
  * (single timer width).
  */
-int gtm_set_exact_timer16(struct gtm_timer *tmr, u16 usec, bool reload)
+int gtm_set_exact_utimer16(struct gtm_timer *tmr, u16 usec, bool reload)
 {
 	/* quite obvious, frequency which is enough for µSec precision */
 	const int freq = 1000000;
-- 
2.20.1.7.g153144c

