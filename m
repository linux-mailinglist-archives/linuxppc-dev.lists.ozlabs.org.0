Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFC6554295
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 08:18:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSY8v6LTMz3brW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 16:18:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=kXSRy8rD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.114; helo=m15114.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=kXSRy8rD;
	dkim-atps=neutral
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSY8F6V9dz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 16:17:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=VVI5y
	riocuWAdqna7xksvzNzIqMUGXMOlYFgaXW0jRI=; b=kXSRy8rDXuTiFuZGd/zp2
	FpuICLEmAIE0wuwdBRveK++x6d8dBnEMHmWUpkr1codL7waSRB4iYwQqlZz0WDJl
	o2hqe2H0CW20GTyo8NFY52F4has/oYzVo60glxSWThpTHSMd8h2lHoJrdX9KFyV5
	T7mdeOFPbByCgnYMTrCIvg=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp7 (Coremail) with SMTP id DsmowAAXVfTVs7Jie2QqDw--.64449S2;
	Wed, 22 Jun 2022 14:16:53 +0800 (CST)
From: Liang He <windhl@126.com>
To: benh@kernel.crashing.org,
	christophe.leroy@csgroup.eu,
	mpe@ellerman.id.au,
	windhl@126.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] macintosh: Add missing of_node_get() in do_attach()
Date: Wed, 22 Jun 2022 14:16:52 +0800
Message-Id: <20220622061652.4095330-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowAAXVfTVs7Jie2QqDw--.64449S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw4xJF4rtr13KFWxuw15Arb_yoWDuFb_Kr
	9agr9rXFn8CwsY9rsrXF4fWryDGrWkuF4DZF1IkFyfAa45AF15Kr90qrn7J3y7uFWYyFy7
	GwsIqF1Utw4agjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_k9NDUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizhUoF18RPWRGiQAAs8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We need a of_node_get() for of_find_compatible_node() to keep refcount
balance.

Signed-off-by: Liang He <windhl@126.com>
---
 drivers/macintosh/therm_windtunnel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/macintosh/therm_windtunnel.c b/drivers/macintosh/therm_windtunnel.c
index 9226b74fa08f..bee0510ab1df 100644
--- a/drivers/macintosh/therm_windtunnel.c
+++ b/drivers/macintosh/therm_windtunnel.c
@@ -317,6 +317,7 @@ static void do_attach(struct i2c_adapter *adapter)
 	if (x.running || strncmp(adapter->name, "uni-n", 5))
 		return;
 
+	of_node_get(adapter->dev.of_node);
 	np = of_find_compatible_node(adapter->dev.of_node, NULL, "MAC,ds1775");
 	if (np) {
 		of_node_put(np);
@@ -325,6 +326,7 @@ static void do_attach(struct i2c_adapter *adapter)
 		i2c_new_scanned_device(adapter, &info, scan_ds1775, NULL);
 	}
 
+	of_node_get(adapter->dev.of_node);
 	np = of_find_compatible_node(adapter->dev.of_node, NULL, "MAC,adm1030");
 	if (np) {
 		of_node_put(np);
-- 
2.25.1

