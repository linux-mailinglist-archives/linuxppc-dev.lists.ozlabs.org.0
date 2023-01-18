Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 771A867220D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 16:50:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nxqwb2djqz3fN2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 02:50:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LbsikhVg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=andrzej.hajda@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LbsikhVg;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxqps44kyz3fCD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 02:45:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674056741; x=1705592741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6s3fA2jhqnAHgwbfGrKCZDIy07cNkborYz0vvTXb80k=;
  b=LbsikhVgJ+c11P7JXsJkhdslgrUQqtpj3Mr8ZKL6WWkGD7uTW03wNjv+
   +yANOcvRAjaCw7u3t7tn+TEo6oyFd25GSmxo3ACQrhieMYiEnJdje2i1F
   l+7NkbtxjAIctUlv5s1A2pUkBHu3754/AaHl4l1JhBubYFFpoSvuvj0c7
   F9X4/JFLDTKxSsB9IY33W11emxXlYu+0jPYJuVOKr5AIreJxINgTAZpG+
   o/Jui0QRa8cn7XwOsPghFwyQW9JQh2qoDIYW5ZbRibzBqiG00MQCq8MGA
   lJ20tCGg19DzoL2mpjbefQDBEYykkNIIRCi0kpz5WjQ8QzyuxqSf8jWm+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="322701422"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="322701422"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 07:45:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="661759384"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="661759384"
Received: from lab-ah.igk.intel.com ([10.102.42.211])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 07:45:35 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 6/7] qed: use __xchg if possible
Date: Wed, 18 Jan 2023 16:44:49 +0100
Message-Id: <20230118154450.73842-6-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118154450.73842-1-andrzej.hajda@intel.com>
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <20230118154450.73842-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Recently introduced helper simplifies the code.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 include/linux/qed/qed_chain.h | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/include/linux/qed/qed_chain.h b/include/linux/qed/qed_chain.h
index a84063492c71ae..6355d558cf01b2 100644
--- a/include/linux/qed/qed_chain.h
+++ b/include/linux/qed/qed_chain.h
@@ -11,6 +11,7 @@
 #include <asm/byteorder.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/qed/common_hsi.h>
@@ -368,7 +369,7 @@ static inline void qed_chain_return_produced(struct qed_chain *p_chain)
  */
 static inline void *qed_chain_produce(struct qed_chain *p_chain)
 {
-	void *p_ret = NULL, *p_prod_idx, *p_prod_page_idx;
+	void *p_prod_idx, *p_prod_page_idx;
 
 	if (is_chain_u16(p_chain)) {
 		if ((p_chain->u.chain16.prod_idx &
@@ -390,11 +391,8 @@ static inline void *qed_chain_produce(struct qed_chain *p_chain)
 		p_chain->u.chain32.prod_idx++;
 	}
 
-	p_ret = p_chain->p_prod_elem;
-	p_chain->p_prod_elem = (void *)(((u8 *)p_chain->p_prod_elem) +
-					p_chain->elem_size);
-
-	return p_ret;
+	return __xchg(&p_chain->p_prod_elem,
+		      (u8 *)p_chain->p_prod_elem + p_chain->elem_size);
 }
 
 /**
@@ -439,7 +437,7 @@ static inline void qed_chain_recycle_consumed(struct qed_chain *p_chain)
  */
 static inline void *qed_chain_consume(struct qed_chain *p_chain)
 {
-	void *p_ret = NULL, *p_cons_idx, *p_cons_page_idx;
+	void *p_cons_idx, *p_cons_page_idx;
 
 	if (is_chain_u16(p_chain)) {
 		if ((p_chain->u.chain16.cons_idx &
@@ -461,11 +459,8 @@ static inline void *qed_chain_consume(struct qed_chain *p_chain)
 		p_chain->u.chain32.cons_idx++;
 	}
 
-	p_ret = p_chain->p_cons_elem;
-	p_chain->p_cons_elem = (void *)(((u8 *)p_chain->p_cons_elem) +
-					p_chain->elem_size);
-
-	return p_ret;
+	return __xchg(&p_chain->p_cons_elem,
+		      (u8 *)p_chain->p_cons_elem + p_chain->elem_size);
 }
 
 /**
-- 
2.34.1

