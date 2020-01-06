Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA27130CCC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 05:35:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rjNM4lgvzDqDZ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 15:34:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=126.com
 (client-ip=220.181.15.114; helo=m15-114.126.com;
 envelope-from=yingjie_bai@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=126.com header.i=@126.com header.b="Yf4wf6+a"; 
 dkim-atps=neutral
Received: from m15-114.126.com (m15-114.126.com [220.181.15.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rjJ25czKzDqC0
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2020 15:31:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=qdq1RXBhcHvJu8+kiJ
 YoTY6cikTHn4SeTY2dHZs3ha4=; b=Yf4wf6+aaZCi5sW2Z6AuXYOt69+vhGw1lR
 Gsrx3dh7q5BV3zEDviM3bZrHpJW5R76swlb8xDm7T0teST5ZkbV4OS/suN17a1ub
 YKXw0LkUiyxLEwZ94736BCRS2etIM8Oz32C3jxD30558Lq6h3gX5cqlr6kemg09d
 lZgSvHUZc=
Received: from yingjieb-VirtualBox.int.nokia-sbell.com (unknown
 [223.104.212.216])
 by smtp7 (Coremail) with SMTP id DsmowADHfD_ItxJeAqb_BA--.16223S2;
 Mon, 06 Jan 2020 12:30:13 +0800 (CST)
From: yingjie_bai@126.com
To: Scott Wood <oss@buserror.net>,
	Kumar Gala <galak@kernel.crashing.org>
Subject: [PATCH v3 1/2] powerpc32/booke: consistently return phys_addr_t in
 __pa()
Date: Mon,  6 Jan 2020 12:29:53 +0800
Message-Id: <20200106042957.26494-1-yingjie_bai@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: DsmowADHfD_ItxJeAqb_BA--.16223S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr48uF43Kr1xZF4xAFWxXrb_yoWkKFcEya
 ykCa1vgrs5Wr97u3ZFya4rXwnrAr95CFn0ga4fuw17AF4UCF1UCwn7tw1kAws8CrsrCrZx
 uFW0q343Kas2kjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU86nQUUUUUU==
X-Originating-IP: [223.104.212.216]
X-CM-SenderInfo: p1lqwyxlhbutbl6rjloofrz/1tbimRWc91pD-oMzJQABsU
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
 Paul Mackerras <paulus@samba.org>, Allison Randal <allison@lohutok.net>,
 Bai Yingjie <byj.tea@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bai Yingjie <byj.tea@gmail.com>

When CONFIG_RELOCATABLE=y is set, VIRT_PHYS_OFFSET is a 64bit variable,
thus __pa() returns as 64bit value.
But when CONFIG_RELOCATABLE=n, __pa() returns 32bit value.

When CONFIG_PHYS_64BIT is set, __pa() should consistently return as
64bit value irrelevant to CONFIG_RELOCATABLE.
So we'd make __pa() consistently return phys_addr_t, which is 64bit
when CONFIG_PHYS_64BIT is set.

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

