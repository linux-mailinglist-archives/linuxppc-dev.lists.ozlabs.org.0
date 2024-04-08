Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC3689B72D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 07:32:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=EqSieNpb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCd5d2XtZz3bw2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 15:32:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=EqSieNpb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.132; helo=out30-132.freemail.mail.aliyun.com; envelope-from=yang.lee@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCd481Q1xz3bn7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 15:31:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1712554273; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=xIqilud/SwRfW5dU91Smq2PXSnJK7EwpMfyG/QvdBpQ=;
	b=EqSieNpbtaeLeLfV2ADHp9QFfXXe8CFiR/77u+rTrbIqKGqPP7+rkGBqdKTCn/9qaDnJsXrCslvw8i2aacKVF3CQ4mDs0k5M7KLExCg9nMmwZUmWo4emat2uN530BcIsGegJddNIJ2l3NTTyzrmP8MUNTRjmrNvJLs9nqBIS8dc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0W42BNQ0_1712554271;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0W42BNQ0_1712554271)
          by smtp.aliyun-inc.com;
          Mon, 08 Apr 2024 13:31:11 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: rdunlap@infradead.org,
	arnd@arndb.de,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com
Subject: [PATCH -next 2/3 v2] powerpc: Fix kernel-doc comments in fsl_gtm.c
Date: Mon,  8 Apr 2024 13:31:08 +0800
Message-Id: <20240408053109.96360-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Cc: Yang Li <yang.lee@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix some function names in kernel-doc comments.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 arch/powerpc/sysdev/fsl_gtm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_gtm.c b/arch/powerpc/sysdev/fsl_gtm.c
index 39186ad6b3c3..3dabc9621810 100644
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
@@ -260,7 +260,7 @@ int gtm_set_timer16(struct gtm_timer *tmr, unsigned long usec, bool reload)
 EXPORT_SYMBOL(gtm_set_timer16);
 
 /**
- * gtm_set_exact_utimer16 - (re)set 16 bits timer
+ * gtm_set_exact_timer16 - (re)set 16 bits timer
  * @tmr:	pointer to the gtm_timer structure obtained from gtm_get_timer
  * @usec:	timer interval in microseconds
  * @reload:	if set, the timer will reset upon expiry rather than
-- 
2.20.1.7.g153144c

