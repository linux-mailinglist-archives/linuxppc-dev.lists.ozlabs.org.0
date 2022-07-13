Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E709357387D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 16:12:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ljfh25txYz3dqm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 00:12:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=eRNaledZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.3; helo=mail-m963.mail.126.com; envelope-from=sohu0106@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=eRNaledZ;
	dkim-atps=neutral
X-Greylist: delayed 1808 seconds by postgrey-1.36 at boromir; Thu, 14 Jul 2022 00:11:20 AEST
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjfgD1ryCz3c4N
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 00:11:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=NuxF7
	abVaAXpTR2vWD1m9eXdLM6T1n7ZReTYZWrnKR0=; b=eRNaledZLy1gEh+0mA8/a
	e8oq3Uq9vQW0/X8QQqYf5QMyiMqkqdQchRlNyqJ3Z64Cjil3yBR1GaE9ja4uiDlB
	tjYuGVq/i/ijzL9Rz7gxYcuwhKYWEaN+hVffmTGx5MuB/DcaNLYMoFlm6OLpgH6X
	RbJwbaot722Z8ixbuFYFP0=
Received: from test.pnp.gw (unknown [218.247.43.97])
	by smtp8 (Coremail) with SMTP id NORpCgDnRJlWy85iJGpLHw--.54378S2;
	Wed, 13 Jul 2022 21:40:40 +0800 (CST)
From: NAME <sohu0106@126.com>
To: benh@kernel.crashing.org,
	sohu0106@126.com
Subject: [PATCH] macintosh:fix oob read in do_adb_query function
Date: Wed, 13 Jul 2022 21:40:37 +0800
Message-Id: <20220713134037.2331-1-sohu0106@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgDnRJlWy85iJGpLHw--.54378S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFWUAr17CrWxtw15AF15XFb_yoWfKwcE9w
	4rKr4Iqw45C3s7GrnFkayI9Fy0yF97ur48Cry09FZxAFyDZay7KryvvrnrKFn7ZF4UCFZx
	GF4jg3s8Aw1vgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRHc_ftUUUUU==
X-Originating-IP: [218.247.43.97]
X-CM-SenderInfo: pvrk3iqrqwqiyswou0bp/1tbiuBg9HmJVkVllGgABsC
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
Cc: security@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: sohu0106 <sohu0106@126.com>

In do_adb_query function of drivers/macintosh/adb.c,
req->data is copy form userland. The parameter
"req->data[2]" is Missing check, the array size of
adb_handler[] is 16, so "adb_handler[req->data[2]].
original_address" and "adb_handler[req->data[2]].
handler_id" will lead to oob read.

Signed-off-by: sohu0106 <sohu0106@126.com>
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

