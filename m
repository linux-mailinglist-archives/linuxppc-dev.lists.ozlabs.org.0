Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4394C2B169B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 08:41:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXVlP2MQZzDr3f
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 18:41:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.helo=cstnet.cn
 (client-ip=159.226.251.25; helo=cstnet.cn; envelope-from=vulab@iscas.ac.cn;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=iscas.ac.cn
X-Greylist: delayed 350 seconds by postgrey-1.36 at bilbo;
 Fri, 13 Nov 2020 18:39:43 AEDT
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CXVjW5V78zDr3S
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Nov 2020 18:39:42 +1100 (AEDT)
Received: from localhost.localdomain (unknown [124.16.141.242])
 by APP-05 (Coremail) with SMTP id zQCowAAXKpzaNq5fakXMAA--.54661S2;
 Fri, 13 Nov 2020 15:33:46 +0800 (CST)
From: Xu Wang <vulab@iscas.ac.cn>
To: benh@kernel.crashing.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] macintosh: windfarm: Use NULL to compare with pointer-typed
 value rather than 0
Date: Fri, 13 Nov 2020 07:33:43 +0000
Message-Id: <20201113073343.64378-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowAAXKpzaNq5fakXMAA--.54661S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XF1DZr1kuFy8Gr15Kw48WFg_yoWDCFXEkw
 1xWrn7Wr47K39Fkr4jganaqFyvkayDu3Z5Wa1FqrZ3ZFyxJwnFqF1vqrnxXa1xu3WIgFZx
 Gr1Fqr40yws29jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb2xYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r4xMxAIw28I
 cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
 IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI
 42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
 IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
 z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcsjjUUUUU
X-Originating-IP: [124.16.141.242]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCAsTA18J9x6ybQAAsz
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

Compare pointer-typed values to NULL rather than 0.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/macintosh/windfarm_pm121.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/macintosh/windfarm_pm121.c b/drivers/macintosh/windfarm_pm121.c
index ab467b9c31be..62826844b584 100644
--- a/drivers/macintosh/windfarm_pm121.c
+++ b/drivers/macintosh/windfarm_pm121.c
@@ -650,7 +650,7 @@ static void pm121_create_cpu_fans(void)
 
 	/* First, locate the PID params in SMU SBD */
 	hdr = smu_get_sdb_partition(SMU_SDB_CPUPIDDATA_ID, NULL);
-	if (hdr == 0) {
+	if (hdr == NULL) {
 		printk(KERN_WARNING "pm121: CPU PID fan config not found.\n");
 		goto fail;
 	}
@@ -969,7 +969,7 @@ static int pm121_init_pm(void)
 	const struct smu_sdbp_header *hdr;
 
 	hdr = smu_get_sdb_partition(SMU_SDB_SENSORTREE_ID, NULL);
-	if (hdr != 0) {
+	if (hdr != NULL) {
 		struct smu_sdbp_sensortree *st =
 			(struct smu_sdbp_sensortree *)&hdr[1];
 		pm121_mach_model = st->model_id;
-- 
2.17.1

