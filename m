Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D912130CCB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 05:33:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rjLH4B0YzDqCt
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 15:33:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=126.com
 (client-ip=220.181.15.114; helo=m15-114.126.com;
 envelope-from=yingjie_bai@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=126.com header.i=@126.com header.b="oYMjMuac"; 
 dkim-atps=neutral
Received: from m15-114.126.com (m15-114.126.com [220.181.15.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rjJ24S3PzDqBy
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2020 15:31:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=cWQkz6qx21BS5TQBK7
 +VbOfvvvchtkcRVBlxJ7ItxpI=; b=oYMjMuacVpmXv0xRnkdTGU2dd/l+KHkrqk
 4dLwIRLBkG+NvsYIUp57IWUKRzR5wgcFzS2U9TUpLZ66Nl5BYciX7d1i/BA1JRB8
 D+scuBb9G1rduN+iR+NIEvV3oNt2tAKt98lM2kqLMv6XTYGjn916pTA6NM+14K+a
 TA/UL8jjQ=
Received: from yingjieb-VirtualBox.int.nokia-sbell.com (unknown
 [223.104.212.216])
 by smtp7 (Coremail) with SMTP id DsmowADHfD_ItxJeAqb_BA--.16223S3;
 Mon, 06 Jan 2020 12:30:20 +0800 (CST)
From: yingjie_bai@126.com
To: Scott Wood <oss@buserror.net>,
	Kumar Gala <galak@kernel.crashing.org>
Subject: [PATCH v3 2/2] powerpc/mpc85xx: also write addr_h to spin table for
 64bit boot entry
Date: Mon,  6 Jan 2020 12:29:54 +0800
Message-Id: <20200106042957.26494-2-yingjie_bai@126.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200106042957.26494-1-yingjie_bai@126.com>
References: <20200106042957.26494-1-yingjie_bai@126.com>
X-CM-TRANSID: DsmowADHfD_ItxJeAqb_BA--.16223S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ArWfKr43Gw4UuFy5KryUKFg_yoW8Xr45pF
 ykGFnxtrZ5Kr1rZa12qF40grZ0yF4Sg3yjg347AasI93W3Xr9FyF4kZry3XF4kWrWDKFWr
 Zr4ayFZ0kwsrXa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDL0nUUUUU=
X-Originating-IP: [223.104.212.216]
X-CM-SenderInfo: p1lqwyxlhbutbl6rjloofrz/1tbimRWc91pD-oMzJQACsX
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

CPU like P4080 has 36bit physical address, its DDR physical
start address can be configured above 4G by LAW registers.

For such systems in which their physical memory start address was
configured higher than 4G, we need also to write addr_h into the spin
table of the target secondary CPU, so that addr_h and addr_l together
represent a 64bit physical address.
Otherwise the secondary core can not get correct entry to start from.

Signed-off-by: Bai Yingjie <byj.tea@gmail.com>
---
 arch/powerpc/platforms/85xx/smp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/platforms/85xx/smp.c b/arch/powerpc/platforms/85xx/smp.c
index 8c7ea2486bc0..48f7d96ae37d 100644
--- a/arch/powerpc/platforms/85xx/smp.c
+++ b/arch/powerpc/platforms/85xx/smp.c
@@ -252,6 +252,15 @@ static int smp_85xx_start_cpu(int cpu)
 	out_be64((u64 *)(&spin_table->addr_h),
 		__pa(ppc_function_entry(generic_secondary_smp_init)));
 #else
+#ifdef CONFIG_PHYS_ADDR_T_64BIT
+	/*
+	 * We need also to write addr_h to spin table for systems
+	 * in which their physical memory start address was configured
+	 * to above 4G, otherwise the secondary core can not get
+	 * correct entry to start from.
+	 */
+	out_be32(&spin_table->addr_h, __pa(__early_start) >> 32);
+#endif
 	out_be32(&spin_table->addr_l, __pa(__early_start));
 #endif
 	flush_spin_table(spin_table);
-- 
2.17.1

