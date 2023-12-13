Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD516812186
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 23:32:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=no7tl/T9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sr9G73p8qz3d9G
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 09:32:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=no7tl/T9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=37.18.73.165; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sr9DC3KY0z2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 09:30:33 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id F198B100009;
	Thu, 14 Dec 2023 01:30:27 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru F198B100009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1702506627;
	bh=Ii5sBqymhiHfCuQq+3pwgLlO+kjouXvW2nmQVbwI7UU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=no7tl/T9jZK9UqsFMv6dlMpRIpk1r4Z0yLCC5syS64E6OO6uNGre09OjlqNyNAzuS
	 57StAIaX4rIxlUDWPBp0lt0/l+Za59SJV5unYZhrVSDr9INOW4zYz0V45tjE5ot/XQ
	 q5jZTTks7CrNm7mJq5DdeeeapRLh8s172PfxLzg03QIDb5csYBF3PhgkWmMb+cEIo6
	 xx2S7VKZgKvDqWvMzuq7mtpt4DFhDqXNs9JqfmMtC2GRkj6L0vvJuKk6KFhnLmtAn5
	 ioBfvQ32a1ctlUYa3NWZ2OssdaXhCvOxC/Qf9EBZLXfgDPilNoVo4Tnp2G966eB68U
	 cTi36XKJ7EBZQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 14 Dec 2023 01:30:27 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 14 Dec 2023 01:30:27 +0300
From: George Stark <gnstark@salutedevices.com>
To: <andy.shevchenko@gmail.com>, <pavel@ucw.cz>, <lee@kernel.org>,
	<vadimp@nvidia.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <hdegoede@redhat.com>,
	<mazziesaccount@gmail.com>, <peterz@infradead.org>, <mingo@redhat.com>,
	<will@kernel.org>, <longman@redhat.com>, <boqun.feng@gmail.com>,
	<nikitos.tr@gmail.com>
Subject: [PATCH v3 02/11] locking: add define if mutex_destroy() is not an empty function
Date: Thu, 14 Dec 2023 01:30:11 +0300
Message-ID: <20231213223020.2713164-3-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231213223020.2713164-1-gnstark@salutedevices.com>
References: <20231213223020.2713164-1-gnstark@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 182098 [Dec 13 2023]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;127.0.0.199:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/12/13 21:35:00 #22672360
X-KSMG-AntiVirus-Status: Clean, skipped
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
Cc: kernel@salutedevices.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, George Stark <gnstark@salutedevices.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mutex_destroy() is only a debug helper and an empty function on non-debug
configurations still we can't legally ignore it because it's the
established API call and it can be extended theoretically in the future.
Sometimes it could be useful to know e.g. in the higher-level API if
mutex_destroy() really does something in the current configuration
and it's should be called or skipped otherwise for the sake of
optimization so add dedicated define to recognize these cases.

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 include/linux/mutex.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/mutex.h b/include/linux/mutex.h
index a33aa9eb9fc3..2395ce4fcaf6 100644
--- a/include/linux/mutex.h
+++ b/include/linux/mutex.h
@@ -83,6 +83,9 @@ struct mutex {
 
 extern void mutex_destroy(struct mutex *lock);
 
+/* mutex_destroy() is a real function, not a NOP */
+#define mutex_destroy  mutex_destroy
+
 #else
 
 # define __DEBUG_MUTEX_INITIALIZER(lockname)
-- 
2.25.1

