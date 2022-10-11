Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8445FAD12
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 08:53:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mmmgv0XG9z3dw5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 17:52:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.23; helo=cstnet.cn; envelope-from=jiasheng@iscas.ac.cn; receiver=<UNKNOWN>)
Received: from cstnet.cn (smtp23.cstnet.cn [159.226.251.23])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmmgM3Xh4z2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 17:52:31 +1100 (AEDT)
Received: from localhost.localdomain (unknown [124.16.138.125])
	by APP-03 (Coremail) with SMTP id rQCowAAnLraqEkVjHF8rBA--.18271S2;
	Tue, 11 Oct 2022 14:52:28 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: christophe.leroy@csgroup.eu,
	qiang.zhao@nxp.com,
	leoyang.li@nxp.com
Subject: [PATCH v3] soc: fsl: qe: Add check for ioremap
Date: Tue, 11 Oct 2022 14:52:25 +0800
Message-Id: <20221011065225.16602-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAAnLraqEkVjHF8rBA--.18271S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFW5KFWDuF1UJr48WFW7Jwb_yoW8KrW3p3
	yDJFyUAFy5Kryxua97Jwn5XF15uayIka4fGrWvg3srCwnxX34DGrsaqFyjqFsxKrWFkr1f
	JF43JF1a93WUtFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r47
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUUEAp5UUUUU==
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
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
Cc: Jiasheng Jiang <jiasheng@iscas.ac.cn>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As ioremap can return NULL pointer, it should
be better to check the return value return error
if fails.
Moreover, the return value of qe_reset should be
checked by cascade.

Fixes: 68f047e3d62e ("fsl/qe: add rx_sync and tx_sync for TDM mode")
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
Changelog:

v2 -> v3:

1. Add return statement of qe_reset when CONFIG_QUICC_ENGINE is not selected.

v1 -> v2:

1. Change the position of the check for ioremap.
2. Simplify the check for qe_reset.
3. Remove the 'extern' keyword.
---
 drivers/soc/fsl/qe/qe.c | 12 ++++++++----
 include/soc/fsl/qe/qe.h |  7 +++++--
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
index b3c226eb5292..33f76cc5872e 100644
--- a/drivers/soc/fsl/qe/qe.c
+++ b/drivers/soc/fsl/qe/qe.c
@@ -83,11 +83,14 @@ static phys_addr_t get_qe_base(void)
 	return qebase;
 }
 
-void qe_reset(void)
+int qe_reset(void)
 {
 	if (qe_immr == NULL)
 		qe_immr = ioremap(get_qe_base(), QE_IMMAP_SIZE);
 
+	if (qe_immr == NULL)
+		return -ENOMEM;
+
 	qe_snums_init();
 
 	qe_issue_cmd(QE_RESET, QE_CR_SUBBLOCK_INVALID,
@@ -98,6 +101,8 @@ void qe_reset(void)
 
 	if (qe_sdma_init())
 		panic("sdma init failed!");
+
+	return 0;
 }
 
 int qe_issue_cmd(u32 cmd, u32 device, u8 mcn_protocol, u32 cmd_input)
@@ -644,9 +649,8 @@ static int __init qe_init(void)
 	np = of_find_compatible_node(NULL, NULL, "fsl,qe");
 	if (!np)
 		return -ENODEV;
-	qe_reset();
 	of_node_put(np);
-	return 0;
+	return qe_reset();
 }
 subsys_initcall(qe_init);
 
@@ -654,7 +658,7 @@ subsys_initcall(qe_init);
 static int qe_resume(struct platform_device *ofdev)
 {
 	if (!qe_alive_during_sleep())
-		qe_reset();
+		return qe_reset();
 	return 0;
 }
 
diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
index b02e9fe69146..0714b0ba7f49 100644
--- a/include/soc/fsl/qe/qe.h
+++ b/include/soc/fsl/qe/qe.h
@@ -84,9 +84,12 @@ extern spinlock_t cmxgcr_lock;
 
 /* Export QE common operations */
 #ifdef CONFIG_QUICC_ENGINE
-extern void qe_reset(void);
+int qe_reset(void);
 #else
-static inline void qe_reset(void) {}
+static inline int qe_reset(void)
+{
+	return 0;
+}
 #endif
 
 int cpm_muram_init(void);
-- 
2.25.1

