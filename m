Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB890109478
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 20:53:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MHl12nxYzDqVF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 06:53:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=126.com
 (client-ip=220.181.15.112; helo=m15-112.126.com;
 envelope-from=yingjie_bai@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=126.com header.i=@126.com header.b="b/WZZMCD"; 
 dkim-atps=neutral
Received: from m15-112.126.com (m15-112.126.com [220.181.15.112])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MBMC5WmBzDqWj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 02:50:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=5WrnMnd6SLO8+2ax4Q
 ZOP4APwycvcmz4bvINZCCXEKA=; b=b/WZZMCD66fo2YPdU5hzVY+kir06onvw0R
 BbCSjMmCubOW5ZKQgxmOTFtuCMQyQIJiPYtGWIicB0oHgliSn7HiWlre02p3C0xc
 0GLzPGYdcuG3iZoZP0P1phgcnQdHmla2bBzrHOE4HIZHszCEkntSHm1y8tvkLQjr
 PgXTruwt4=
Received: from localhost.localdomain (unknown [183.192.13.68])
 by smtp2 (Coremail) with SMTP id DMmowAA3o+B08NtdNlfzAQ--.21587S2;
 Mon, 25 Nov 2019 23:17:17 +0800 (CST)
From: yingjie_bai@126.com
To: Scott Wood <oss@buserror.net>,
	Kumar Gala <galak@kernel.crashing.org>
Subject: [PATCH] powerpc/mpc85xx: also write addr_h to spin table for 64bit
 boot entry
Date: Mon, 25 Nov 2019 23:15:43 +0800
Message-Id: <1574694943-7883-1-git-send-email-yingjie_bai@126.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: DMmowAA3o+B08NtdNlfzAQ--.21587S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ArWfKryxWFWruF47Wr18AFb_yoW8XFykpa
 4xGrnxtrZ5Kr1rZa12yF4IgrZ0yFsxu3yUW347AasI93W3Xr9xAF4DZry3WF1kWrWqkFWr
 Zr4ayFyqyrsrWa7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bn5rcUUUUU=
X-Originating-IP: [183.192.13.68]
X-CM-SenderInfo: p1lqwyxlhbutbl6rjloofrz/1tbipB1491pD-LHSuQAAsJ
X-Mailman-Approved-At: Tue, 26 Nov 2019 06:51:13 +1100
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
 Bai Yingjie <byj.tea@gmail.com>, linuxppc-dev@lists.ozlabs.org
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

This should do no harm for normal case where addr_h is all 0.

Signed-off-by: Bai Yingjie <byj.tea@gmail.com>
---
 arch/powerpc/platforms/85xx/smp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/platforms/85xx/smp.c b/arch/powerpc/platforms/85xx/smp.c
index 8c7ea2486bc0..f12cdd1e80ff 100644
--- a/arch/powerpc/platforms/85xx/smp.c
+++ b/arch/powerpc/platforms/85xx/smp.c
@@ -252,6 +252,14 @@ static int smp_85xx_start_cpu(int cpu)
 	out_be64((u64 *)(&spin_table->addr_h),
 		__pa(ppc_function_entry(generic_secondary_smp_init)));
 #else
+	/*
+	 * We need also to write addr_h to spin table for systems
+	 * in which their physical memory start address was configured
+	 * to above 4G, otherwise the secondary core can not get
+	 * correct entry to start from.
+	 * This does no harm for normal case where addr_h is all 0.
+	 */
+	out_be32(&spin_table->addr_h, __pa(__early_start) >> 32);
 	out_be32(&spin_table->addr_l, __pa(__early_start));
 #endif
 	flush_spin_table(spin_table);
-- 
2.17.1

