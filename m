Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACDA34FC91
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 11:22:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9LSq0rBnz3bxw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 20:22:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com;
 envelope-from=linqiheng@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 967 seconds by postgrey-1.36 at boromir;
 Wed, 31 Mar 2021 20:15:03 AEDT
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9LHq24s6z30GS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 20:15:01 +1100 (AEDT)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F9Ksz0XZmzPmHD;
 Wed, 31 Mar 2021 16:56:07 +0800 (CST)
Received: from DESKTOP-EFRLNPK.china.huawei.com (10.174.177.129) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 16:58:35 +0800
From: Qiheng Lin <linqiheng@huawei.com>
To: <linqiheng@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Ingo Molnar <mingo@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Peter Zijlstra <peterz@infradead.org>, Frederic Weisbecker
 <frederic@kernel.org>
Subject: [PATCH -next] powerpc: Remove duplicated include from time.c
Date: Wed, 31 Mar 2021 16:58:35 +0800
Message-ID: <20210331085835.3032-1-linqiheng@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.129]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 31 Mar 2021 20:22:34 +1100
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove duplicated include.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
---
 arch/powerpc/kernel/time.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index b67d93a609a2..2c8762002b21 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -53,7 +53,6 @@
 #include <linux/of_clk.h>
 #include <linux/suspend.h>
 #include <linux/sched/cputime.h>
-#include <linux/sched/clock.h>
 #include <linux/processor.h>
 #include <asm/trace.h>
 

