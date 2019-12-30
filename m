Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E02EE12CD77
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2019 09:05:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47mVNf31pfzDq5n
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2019 19:05:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=126.com
 (client-ip=220.181.15.112; helo=m15-112.126.com;
 envelope-from=yingjie_bai@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=126.com header.i=@126.com header.b="Y4yWol+a"; 
 dkim-atps=neutral
Received: from m15-112.126.com (m15-112.126.com [220.181.15.112])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47mVJV1VbnzDq9H
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2019 19:02:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=wKGzF3TmELm4mnLJnq
 TJbcvIyjvMxvdD5NnLsPiVBtg=; b=Y4yWol+aivCF2e7svS2KjVL0SXWordsENL
 ete8ATU/F6K6DtVXsnL0nD3D/SwSnAess+BtpnVj3lx/6ReMQQgWAI/rwNaJ2aTP
 Zvvp9XnBLaw6oN+CXIsQCZpx7UFrre9RR1GGaVPx+xVvEwQhLj/0dwGsPIrRg9T1
 heFoU9nR8=
Received: from yingjieb-VirtualBox.int.nokia-sbell.com (unknown
 [114.87.110.56])
 by smtp2 (Coremail) with SMTP id DMmowADX+Zmnpgle0BNJBA--.64926S2;
 Mon, 30 Dec 2019 15:26:41 +0800 (CST)
From: yingjie_bai@126.com
To: Scott Wood <oss@buserror.net>,
	Kumar Gala <galak@kernel.crashing.org>
Subject: [PATCH v2 1/2] powerpc32/booke: consistently return phys_addr_t in
 __pa()
Date: Mon, 30 Dec 2019 15:26:19 +0800
Message-Id: <20191230072623.25353-1-yingjie_bai@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: DMmowADX+Zmnpgle0BNJBA--.64926S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr48uFy7Zw13AFWfJw47Arb_yoWkGFbEya
 s7Aa1kurs5Wr97urnFya48Jr1DJa48GFn09F1xuw17AF4UA3W5Cws7t34kArs8ursrCrZx
 uFW0q343KF92kjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0pnQUUUUUU==
X-Originating-IP: [114.87.110.56]
X-CM-SenderInfo: p1lqwyxlhbutbl6rjloofrz/1tbirxGb91pD8ekldgAAsA
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
Cc: Jason Yan <yanaijie@huawei.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Diana Craciun <diana.craciun@nxp.com>, Paul Mackerras <paulus@samba.org>,
 Allison Randal <allison@lohutok.net>, Bai Yingjie <byj.tea@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bai Yingjie <byj.tea@gmail.com>

When CONFIG_RELOCATABLE=y is set, VIRT_PHYS_OFFSET is a 64bit variable,
thus __pa() returns as 64bit value.
But when CONFIG_RELOCATABLE=n, __pa() returns 32bit value.

We'd make __pa() consistently return phys_addr_t, even if the upper bits
are known to always be zero in a particular config.

Signed-off-by: Bai Yingjie <byj.tea@gmail.com>
---
 arch/powerpc/include/asm/page.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index 7f1fd41e3065..86332080399a 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -209,7 +209,7 @@ static inline bool pfn_valid(unsigned long pfn)
  */
 #if defined(CONFIG_PPC32) && defined(CONFIG_BOOKE)
 #define __va(x) ((void *)(unsigned long)((phys_addr_t)(x) + VIRT_PHYS_OFFSET))
-#define __pa(x) ((unsigned long)(x) - VIRT_PHYS_OFFSET)
+#define __pa(x) ((phys_addr_t)(unsigned long)(x) - VIRT_PHYS_OFFSET)
 #else
 #ifdef CONFIG_PPC64
 /*
-- 
2.17.1

