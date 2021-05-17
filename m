Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C243382696
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 10:17:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkBnL1QXpz3c94
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 18:17:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com;
 envelope-from=tanxiaofei@huawei.com; receiver=<UNKNOWN>)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk8dy0jNsz2yhm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 16:40:37 +1000 (AEST)
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fk8Zf758Yz16R37;
 Mon, 17 May 2021 14:37:46 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 14:40:31 +0800
Received: from localhost.localdomain (10.67.165.24) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 14:40:30 +0800
From: Xiaofei Tan <tanxiaofei@huawei.com>
To: <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>
Subject: [PATCH 6/9] tty: hvc_console: Fix coding style issues of block
 comments
Date: Mon, 17 May 2021 14:37:10 +0800
Message-ID: <1621233433-27094-7-git-send-email-tanxiaofei@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1621233433-27094-1-git-send-email-tanxiaofei@huawei.com>
References: <1621233433-27094-1-git-send-email-tanxiaofei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 17 May 2021 18:15:54 +1000
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
Cc: Xiaofei Tan <tanxiaofei@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linuxarm@openeuler.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix coding style issues of block comments, reported by checkpatch.pl.
Besides, add a period at the end of the sentenses.

Signed-off-by: Xiaofei Tan <tanxiaofei@huawei.com>
---
 drivers/tty/hvc/hvc_console.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
index 39018e5..a61cdf0 100644
--- a/drivers/tty/hvc/hvc_console.c
+++ b/drivers/tty/hvc/hvc_console.c
@@ -177,7 +177,8 @@ static void hvc_console_print(struct console *co, const char *b,
 			r = cons_ops[index]->put_chars(vtermnos[index], c, i);
 			if (r <= 0) {
 				/* throw away characters on error
-				 * but spin in case of -EAGAIN */
+				 * but spin in case of -EAGAIN.
+				 */
 				if (r != -EAGAIN) {
 					i = 0;
 				} else {
@@ -484,7 +485,8 @@ static int hvc_push(struct hvc_struct *hp)
 			return 0;
 		}
 		/* throw away output on error; this happens when
-		   there is no session connected to the vterm. */
+		 *  there is no session connected to the vterm.
+		 */
 		hp->n_outbuf = 0;
 	} else
 		hp->n_outbuf -= n;
@@ -707,7 +709,8 @@ static int __hvc_poll(struct hvc_struct *hp, bool may_sleep)
 			/* XXX should support a sequence */
 			if (buf[i] == '\x0f') {	/* ^O */
 				/* if ^O is pressed again, reset
-				 * sysrq_pressed and flip ^O char */
+				 * sysrq_pressed and flip ^O char.
+				 */
 				sysrq_pressed = !sysrq_pressed;
 				if (sysrq_pressed)
 					continue;
@@ -749,7 +752,8 @@ static int __hvc_poll(struct hvc_struct *hp, bool may_sleep)
 
 	if (read_total) {
 		/* Activity is occurring, so reset the polling backoff value to
-		   a minimum for performance. */
+		 * a minimum for performance.
+		 */
 		timeout = MIN_TIMEOUT;
 
 		tty_flip_buffer_push(&hp->port);
@@ -1037,7 +1041,8 @@ static int hvc_init(void)
 	tty_set_operations(drv, &hvc_ops);
 
 	/* Always start the kthread because there can be hotplug vty adapters
-	 * added later. */
+	 * added later.
+	 */
 	hvc_task = kthread_run(khvcd, NULL, "khvcd");
 	if (IS_ERR(hvc_task)) {
 		printk(KERN_ERR "Couldn't create kthread for console.\n");
-- 
2.8.1

