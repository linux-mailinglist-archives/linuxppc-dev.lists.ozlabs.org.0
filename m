Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CB4887B53
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Mar 2024 02:24:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=YA2pouGY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V2JJT63Njz3dTn
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Mar 2024 12:24:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=YA2pouGY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V2JHm0lRCz3bsw
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Mar 2024 12:24:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=9L1Ixhk4fnArxEJyLsZSUrzBMXeZlWcbrA4YzaHi20w=; b=YA2pouGYKw+A1B1ZIA+oI6t2rI
	UYxXKX1FyWHN+OefjkwIVXw4TNo2VrjTkRW3dZ2Wf2zhvExCxBvCWOcSJ3LYgofNlBeFk7Ztq09kg
	JS4590P83CDq8iyIqcMv2rboSQgYeZfcood6A2dm+tsrAQ/EAKcUY1y7UCFYkTak2F6ex8d98lJjq
	DVcAU2/Eo6n4wZ1nZrcCLuGXPzo4SZwVfEwpBArmyX1ZphR8NWKbik+JA5aZ6R0WMGSKMvObGyoyK
	QYhOltp6I6ISOtWRJ+q4ram0fpdYpUVH6WWiBGwZGO435jiP632dleLidpJfJFPwmmLPEBJk8gxP/
	OhOiKkjQ==;
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.8])
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roCaO-0000000CxgD-1YTP;
	Sun, 24 Mar 2024 01:23:44 +0000
Message-ID: <415f4af0-f44a-49fb-b1fa-76f64ed09ec6@infradead.org>
Date: Sun, 24 Mar 2024 10:23:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH] powerpc: Fix PS3 allmodconfig warning
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Chancellor <nathan@kernel.org>, Paul Mackerras <paulus@ozlabs.org>,
 Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
References: <20240320180333.151043-1-arnd@kernel.org>
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20240320180333.151043-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Kevin Hao <haokexin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Justin Stitt <justinstitt@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The struct ps3_notification_device in the ps3_probe_thread routine
is too large to be on the stack, causing a warning for an
allmodconfig build with clang.

Change the struct ps3_notification_device from a variable on the stack
to a dynamically allocated variable.

Reported-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Geoff Levand <geoff@infradead.org>

diff --git a/arch/powerpc/platforms/ps3/device-init.c b/arch/powerpc/platforms/ps3/device-init.c
index 878bc160246e..03292869e6a1 100644
--- a/arch/powerpc/platforms/ps3/device-init.c
+++ b/arch/powerpc/platforms/ps3/device-init.c
@@ -770,49 +770,51 @@ static struct task_struct *probe_task;
 
 static int ps3_probe_thread(void *data)
 {
-	struct ps3_notification_device dev;
+	struct {
+		struct ps3_notification_device dev;
+		u8 buf[512];
+	} *local;
+	struct ps3_notify_cmd *notify_cmd;
+	struct ps3_notify_event *notify_event;
 	int res;
 	unsigned int irq;
 	u64 lpar;
-	void *buf;
-	struct ps3_notify_cmd *notify_cmd;
-	struct ps3_notify_event *notify_event;
 
 	pr_debug(" -> %s:%u: kthread started\n", __func__, __LINE__);
 
-	buf = kzalloc(512, GFP_KERNEL);
-	if (!buf)
+	local = kzalloc(sizeof(local), GFP_KERNEL);
+	if (!local)
 		return -ENOMEM;
 
-	lpar = ps3_mm_phys_to_lpar(__pa(buf));
-	notify_cmd = buf;
-	notify_event = buf;
+	lpar = ps3_mm_phys_to_lpar(__pa(&local->buf));
+	notify_cmd = (struct ps3_notify_cmd *)&local->buf;
+	notify_event = (struct ps3_notify_event *)&local->buf;
 
 	/* dummy system bus device */
-	dev.sbd.bus_id = (u64)data;
-	dev.sbd.dev_id = PS3_NOTIFICATION_DEV_ID;
-	dev.sbd.interrupt_id = PS3_NOTIFICATION_INTERRUPT_ID;
+	local->dev.sbd.bus_id = (u64)data;
+	local->dev.sbd.dev_id = PS3_NOTIFICATION_DEV_ID;
+	local->dev.sbd.interrupt_id = PS3_NOTIFICATION_INTERRUPT_ID;
 
-	res = lv1_open_device(dev.sbd.bus_id, dev.sbd.dev_id, 0);
+	res = lv1_open_device(local->dev.sbd.bus_id, local->dev.sbd.dev_id, 0);
 	if (res) {
 		pr_err("%s:%u: lv1_open_device failed %s\n", __func__,
 		       __LINE__, ps3_result(res));
 		goto fail_free;
 	}
 
-	res = ps3_sb_event_receive_port_setup(&dev.sbd, PS3_BINDING_CPU_ANY,
-					      &irq);
+	res = ps3_sb_event_receive_port_setup(&local->dev.sbd,
+		PS3_BINDING_CPU_ANY, &irq);
 	if (res) {
 		pr_err("%s:%u: ps3_sb_event_receive_port_setup failed %d\n",
 		       __func__, __LINE__, res);
 	       goto fail_close_device;
 	}
 
-	spin_lock_init(&dev.lock);
-	rcuwait_init(&dev.wait);
+	spin_lock_init(&local->dev.lock);
+	rcuwait_init(&local->dev.wait);
 
 	res = request_irq(irq, ps3_notification_interrupt, 0,
-			  "ps3_notification", &dev);
+			  "ps3_notification", &local->dev);
 	if (res) {
 		pr_err("%s:%u: request_irq failed %d\n", __func__, __LINE__,
 		       res);
@@ -823,7 +825,7 @@ static int ps3_probe_thread(void *data)
 	notify_cmd->operation_code = 0; /* must be zero */
 	notify_cmd->event_mask = 1UL << notify_region_probe;
 
-	res = ps3_notification_read_write(&dev, lpar, 1);
+	res = ps3_notification_read_write(&local->dev, lpar, 1);
 	if (res)
 		goto fail_free_irq;
 
@@ -834,36 +836,37 @@ static int ps3_probe_thread(void *data)
 
 		memset(notify_event, 0, sizeof(*notify_event));
 
-		res = ps3_notification_read_write(&dev, lpar, 0);
+		res = ps3_notification_read_write(&local->dev, lpar, 0);
 		if (res)
 			break;
 
 		pr_debug("%s:%u: notify event type 0x%llx bus id %llu dev id %llu"
 			 " type %llu port %llu\n", __func__, __LINE__,
-			 notify_event->event_type, notify_event->bus_id,
-			 notify_event->dev_id, notify_event->dev_type,
-			 notify_event->dev_port);
+			notify_event->event_type, notify_event->bus_id,
+			notify_event->dev_id, notify_event->dev_type,
+			notify_event->dev_port);
 
 		if (notify_event->event_type != notify_region_probe ||
-		    notify_event->bus_id != dev.sbd.bus_id) {
+			notify_event->bus_id != local->dev.sbd.bus_id) {
 			pr_warn("%s:%u: bad notify_event: event %llu, dev_id %llu, dev_type %llu\n",
 				__func__, __LINE__, notify_event->event_type,
 				notify_event->dev_id, notify_event->dev_type);
 			continue;
 		}
 
-		ps3_find_and_add_device(dev.sbd.bus_id, notify_event->dev_id);
+		ps3_find_and_add_device(local->dev.sbd.bus_id,
+			notify_event->dev_id);
 
 	} while (!kthread_should_stop());
 
 fail_free_irq:
-	free_irq(irq, &dev);
+	free_irq(irq, &local->dev);
 fail_sb_event_receive_port_destroy:
-	ps3_sb_event_receive_port_destroy(&dev.sbd, irq);
+	ps3_sb_event_receive_port_destroy(&local->dev.sbd, irq);
 fail_close_device:
-	lv1_close_device(dev.sbd.bus_id, dev.sbd.dev_id);
+	lv1_close_device(local->dev.sbd.bus_id, local->dev.sbd.dev_id);
 fail_free:
-	kfree(buf);
+	kfree(local);
 
 	probe_task = NULL;
 
