Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABE32185EC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 13:19:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1xdb5zYGzDr7x
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 21:18:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.helo=cstnet.cn
 (client-ip=159.226.251.21; helo=cstnet.cn; envelope-from=vulab@iscas.ac.cn;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=iscas.ac.cn
X-Greylist: delayed 443 seconds by postgrey-1.36 at bilbo;
 Wed, 08 Jul 2020 17:30:02 AEST
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by lists.ozlabs.org (Postfix) with ESMTP id 4B1rYQ6HNLzDqMB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 17:30:02 +1000 (AEST)
Received: from localhost (unknown [159.226.5.99])
 by APP-01 (Coremail) with SMTP id qwCowAAnCOk2dAVfs4CkBA--.31422S2;
 Wed, 08 Jul 2020 15:22:31 +0800 (CST)
From: Xu Wang <vulab@iscas.ac.cn>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 vulab@iscas.ac.cn, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] arch: powerpc: Remove unnecessary cast in kfree()
Date: Wed,  8 Jul 2020 07:22:28 +0000
Message-Id: <20200708072228.30776-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowAAnCOk2dAVfs4CkBA--.31422S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JrWxWw4rXr1rWr1xuw17Wrg_yoW3GrbEk3
 yvkFnFkrW0qrsavanxXF1xGFn2y393Xrs5KrnFga9rt345Xw15C3W3ZrW8Gay8Jry0yrZx
 G3Z8tr98Zas3KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbzAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
 r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
 7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUY6wZUUUUU
X-Originating-IP: [159.226.5.99]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwcLA102Yl76WQAAs8
X-Mailman-Approved-At: Wed, 08 Jul 2020 21:17:30 +1000
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove unnecassary casts in the argument to kfree.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 arch/powerpc/platforms/pseries/dlpar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index 16e86ba8aa20..1f3d26806295 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -379,7 +379,7 @@ static void pseries_hp_work_fn(struct work_struct *work)
 	handle_dlpar_errorlog(hp_work->errlog);
 
 	kfree(hp_work->errlog);
-	kfree((void *)work);
+	kfree(work);
 }
 
 void queue_hotplug_event(struct pseries_hp_errorlog *hp_errlog)
-- 
2.17.1

