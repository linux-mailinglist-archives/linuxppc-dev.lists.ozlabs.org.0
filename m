Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1530573A53
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 17:38:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ljhc54qyvz3cFm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 01:38:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=UFTryoNB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.4; helo=mail-m964.mail.126.com; envelope-from=sohu0106@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=UFTryoNB;
	dkim-atps=neutral
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjhbQ0nZRz3c2n
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 01:38:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=7PZSB
	mt5J6QvWk1lc7xSD00eJmJ0nxNnkNfSNzhvMvM=; b=UFTryoNBkk60drf+Icg0U
	lgNF90H93pGvKSgA77CJzDc6jwF9jeQILgFQ6fics43KmAWMpsquIUgKBC8foQWs
	g2hqTfyC5a/4jeCZZQt/uhEbnrwYFSKpFh557mviXdNGApiRC5lsbkENhPBEpmrA
	2JbxbA1/c0uhNmfWx67NX0=
Received: from test.pnp.gw (unknown [218.247.43.97])
	by smtp9 (Coremail) with SMTP id NeRpCgCXidK_5s5iIeV7Gg--.38668S2;
	Wed, 13 Jul 2022 23:37:36 +0800 (CST)
From: Ning Qiang <sohu0106@126.com>
To: benh@kernel.crashing.org,
	sohu0106@126.com
Subject: [PATCH] macintosh:fix oob read in do_adb_query function
Date: Wed, 13 Jul 2022 23:37:34 +0800
Message-Id: <20220713153734.2248-1-sohu0106@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NeRpCgCXidK_5s5iIeV7Gg--.38668S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWxZryUAr1Utw4fKF4Uurg_yoWfZwcE9w
	4Fgr4Igw45C3s7GrnFkayI9Fy0kF97ur18C3y0grZxCFyDZayxtryvvrnrGFn7Zr4rCFZx
	JF4UW3s8Aw1qgjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU9mR5UUUUU==
X-Originating-IP: [218.247.43.97]
X-CM-SenderInfo: pvrk3iqrqwqiyswou0bp/xtbBGgA9Hl-HZfgwvwAAsz
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
Cc: greg@kroah.com, security@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In do_adb_query function of drivers/macintosh/adb.c, req->data is copy
form userland. the  parameter "req->data[2]" is Missing check, the
array size of adb_handler[] is 16, so "adb_handler[
req->data[2]].original_address" and "adb_handler[
req->data[2]].handler_id" will lead to oob read.

Signed-off-by: Ning Qiang <sohu0106@126.com>
---
 drivers/macintosh/adb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/adb.c b/drivers/macintosh/adb.c
index 439fab4eaa85..1bbb9ca08d40 100644
--- a/drivers/macintosh/adb.c
+++ b/drivers/macintosh/adb.c
@@ -647,7 +647,7 @@ do_adb_query(struct adb_request *req)
 
 	switch(req->data[1]) {
 	case ADB_QUERY_GETDEVINFO:
-		if (req->nbytes < 3)
+		if (req->nbytes < 3 || req->data[2] >= 16)
 			break;
 		mutex_lock(&adb_handler_mutex);
 		req->reply[0] = adb_handler[req->data[2]].original_address;
-- 
2.25.1

