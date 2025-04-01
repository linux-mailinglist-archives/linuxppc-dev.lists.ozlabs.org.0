Return-Path: <linuxppc-dev+bounces-7421-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0831A78408
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Apr 2025 23:31:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZS1Qh02Xtz2yDr;
	Wed,  2 Apr 2025 08:31:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=58.251.27.85
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743507129;
	cv=none; b=KVxsbU5aA8AkhjuWqskcDQoMAEkfz2bMbdmFvQSwrPZUFTEzUCspxIRZ5vwKiIJFS2yhJDjQFiqiPTtfZkQb64DaUlBqu4SwlcTbxUOQ29GKbEYccyia43gmm0vULl+GJNj2Vg5MA5fX05k0/YwaaQW+1+x3tb3g1S5I9OYrnrryyRNECezarkBeC0NIH9k7b0V/5XdCVkLjh8iotFjrym0fjxV9kxHhcT8eeDB9LW9Z3UhYSG9fbrI2MFiQT0s+h+JNjQsohzepwoB06pzsCcYwjMzshVLzDKPOYE3J0IgUwOojFLlIR9wNavCIG7l4icPiCbdTUVvaag9XmfERkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743507129; c=relaxed/relaxed;
	bh=uj3+v6MyYb7AcCHvuY3pGyXUZM+Yc98I1jJYHhnle/k=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=K7hBm9ZKfL6yUIr3BITHRFSZkm9kwYpwhCzXWqicwoecWtrPw8l90EJRpViuKP7uN8/h1o3kBFNihCc3A7hC6K1xwC/oh1fxfk6nJVKUbANRy+OSZDoL/Mdmh9eJSTxixK4j2EzcYQrVKE6zxfrirDkZaU2lxMtJmcmSgViDi9n+6kvZFa8epkTnDboEY8LNctv9i+Y6RHdwZPKRlQYlnqZFP0/JexbFLRMJZz1nq6RtLPmnuC0wdobSQrg7ZIpW9MiAud2WK6zA0OacmfNqBq23U9pyIwG3P8/9JMkgxZENHfmJboPKpGRnaF4X3xqCqkg8+fiwbxcSypiC+fJO0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass (client-ip=58.251.27.85; helo=mxct.zte.com.cn; envelope-from=shao.mingyin@zte.com.cn; receiver=lists.ozlabs.org) smtp.mailfrom=zte.com.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zte.com.cn (client-ip=58.251.27.85; helo=mxct.zte.com.cn; envelope-from=shao.mingyin@zte.com.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 596 seconds by postgrey-1.37 at boromir; Tue, 01 Apr 2025 22:32:07 AEDT
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRm7C71DZz2ySc
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Apr 2025 22:32:06 +1100 (AEDT)
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZRlvb1xTdzKjJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Apr 2025 19:22:03 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4ZRlvX5CXtz5TCG9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Apr 2025 19:22:00 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZRlvL137sz5B1L5;
	Tue,  1 Apr 2025 19:21:50 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 531BLaWB075046;
	Tue, 1 Apr 2025 19:21:36 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 1 Apr 2025 19:21:39 +0800 (CST)
Date: Tue, 1 Apr 2025 19:21:39 +0800 (CST)
X-Zmail-TransId: 2afb67ebcc43ffffffff9c2-81950
X-Mailer: Zmail v1.0
Message-ID: <20250401192139605xby4g5ak51tei46zArAT8@zte.com.cn>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <geoff@infradead.org>
Cc: <axboe@kernel.dk>, <maddy@linux.ibm.com>, <mpe@ellerman.id.au>,
        <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
        <naveen@kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
        <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yang.yang29@zte.com.cn>, <xu.xin16@zte.com.cn>,
        <ye.xingchen@zte.com.cn>, <feng.wei8@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBibG9jazogcHMzZGlzazogVXNlIHN0cl9yZWFkX3dyaXRlKCkgaGVscGVy?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 531BLaWB075046
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EBCC5A.000/4ZRlvb1xTdzKjJ
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Feng Wei <feng.wei8@zte.com.cn>

Remove hard-coded strings by using the str_read_write() helper.

Signed-off-by: Feng Wei <feng.wei8@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/block/ps3disk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/block/ps3disk.c b/drivers/block/ps3disk.c
index dc9e4a14b885..b7fe90b6fdef 100644
--- a/drivers/block/ps3disk.c
+++ b/drivers/block/ps3disk.c
@@ -9,6 +9,7 @@
 #include <linux/ata.h>
 #include <linux/blk-mq.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/module.h>

 #include <asm/lv1call.h>
@@ -233,7 +234,7 @@ static irqreturn_t ps3disk_interrupt(int irq, void *data)
 		op = "flush";
 	} else {
 		read = !rq_data_dir(req);
-		op = read ? "read" : "write";
+		op = str_read_write(read);
 	}
 	if (status) {
 		dev_dbg(&dev->sbd.core, "%s:%u: %s failed 0x%llx\n", __func__,
-- 
2.25.1

