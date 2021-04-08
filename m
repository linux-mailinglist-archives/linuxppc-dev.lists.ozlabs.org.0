Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D83D0357B28
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 06:18:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FG7LB5tRtz3c6H
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 14:18:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com;
 envelope-from=johnny.chenyi@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 1102 seconds by postgrey-1.36 at boromir;
 Thu, 08 Apr 2021 14:15:35 AEST
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FG7Gb57D2z2yxS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 14:15:31 +1000 (AEST)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FG6ph4Vh3z7tpg;
 Thu,  8 Apr 2021 11:54:52 +0800 (CST)
Received: from huawei.com (10.67.174.142) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Thu, 8 Apr 2021
 11:56:54 +0800
From: <johnny.chenyi@huawei.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
 <aneesh.kumar@linux.ibm.com>
Subject: [PATCH-next] powerpc/interrupt: Remove duplicate header file
Date: Thu, 8 Apr 2021 11:56:44 +0800
Message-ID: <20210408035644.2417002-1-johnny.chenyi@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.142]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 08 Apr 2021 14:17:47 +1000
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
Cc: yuehaibing@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, heying24@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Chen Yi <johnny.chenyi@huawei.com>

Delete one of the header files <asm/interrupt.h> that are included
twice.

Signed-off-by: Chen Yi <johnny.chenyi@huawei.com>
---
 arch/powerpc/kernel/interrupt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index c4dd4b8f9cfa..f64ace0208b7 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -7,7 +7,6 @@
 #include <asm/asm-prototypes.h>
 #include <asm/kup.h>
 #include <asm/cputime.h>
-#include <asm/interrupt.h>
 #include <asm/hw_irq.h>
 #include <asm/interrupt.h>
 #include <asm/kprobes.h>
-- 
2.31.0

