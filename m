Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCE76650B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 05:36:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lJWQ3NFQzDqnD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 13:36:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.alibaba.com
 (client-ip=115.124.30.45; helo=out30-45.freemail.mail.aliyun.com;
 envelope-from=alex.shi@linux.alibaba.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.alibaba.com
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lGqg6pxtzDqly
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 12:20:44 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01f04391; MF=alex.shi@linux.alibaba.com; NM=1;
 PH=DS; RN=21; SR=0; TI=SMTPD_---0TWfV401_1562898035; 
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com
 fp:SMTPD_---0TWfV401_1562898035) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 12 Jul 2019 10:20:35 +0800
From: Alex Shi <alex.shi@linux.alibaba.com>
To: linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 12/12] Documentation/xtensa: repointer docs to
 Documentation/arch/
Date: Fri, 12 Jul 2019 10:20:18 +0800
Message-Id: <20190712022018.27989-12-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
In-Reply-To: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
References: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 12 Jul 2019 13:28:54 +1000
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
Cc: linux-s390@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, linux-samsung-soc@vger.kernel.org,
 kvm@vger.kernel.org, Chris Zankel <chris@zankel.net>,
 linux-riscv@lists.infradead.org, Alex Shi <alex.shi@linux.alibaba.com>,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since we move Documentation/xtensa docs to Documentation/arch/xtensa
dir, redirect the doc pointer to them.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-xtensa@linux-xtensa.org
Cc: linux-kernel@vger.kernel.org
---
 arch/xtensa/include/asm/initialize_mmu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/xtensa/include/asm/initialize_mmu.h b/arch/xtensa/include/asm/initialize_mmu.h
index 323d05789159..499fe4847490 100644
--- a/arch/xtensa/include/asm/initialize_mmu.h
+++ b/arch/xtensa/include/asm/initialize_mmu.h
@@ -42,7 +42,7 @@
 #if XCHAL_HAVE_S32C1I && (XCHAL_HW_MIN_VERSION >= XTENSA_HWVERSION_RC_2009_0)
 /*
  * We Have Atomic Operation Control (ATOMCTL) Register; Initialize it.
- * For details see Documentation/xtensa/atomctl.txt
+ * For details see Documentation/arch/xtensa/atomctl.txt
  */
 #if XCHAL_DCACHE_IS_COHERENT
 	movi	a3, 0x25	/* For SMP/MX -- internal for writeback,
-- 
2.19.1.856.g8858448bb

