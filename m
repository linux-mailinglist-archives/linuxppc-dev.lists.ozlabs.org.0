Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59284550914
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 09:09:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQkRV1H7Mz3cFJ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 17:09:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=ZyWnJKg7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.5; helo=mail-m965.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=ZyWnJKg7;
	dkim-atps=neutral
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQkQp4mgWz3bZC
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jun 2022 17:08:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=2PsZd
	jyzRgibkKcfmt7102zdLXKY1lTTAZOE+Is/NfY=; b=ZyWnJKg7i1LydfgwR3+bX
	MNsMFfGXnbaZ7KS+9bc1/zxhMeBq5mz1r8yYeO9454ZjuWxCrztVu0YMGJl+xDnu
	aSrxAvzk2JrYfb1kHZqz/omBY+HsyGRVrz5OxEPWviADSfqnHQAdgtKZJxYtylHH
	Qnd4CV/0jesR6dFybCeDkE=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp10 (Coremail) with SMTP id NuRpCgBnf4Bcy65ipKfMEw--.65437S2;
	Sun, 19 Jun 2022 15:08:12 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	christophe.leroy@csgroup.eu,
	npiggin@gmail.com
Subject: [PATCH] powerpc: kernel: Fix refcount bug in legacy_serial.c
Date: Sun, 19 Jun 2022 15:08:11 +0800
Message-Id: <20220619070811.4067215-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgBnf4Bcy65ipKfMEw--.65437S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF17ArWUZr1UuF4xAFW8WFg_yoW3uwb_J3
	s7Wr12kr1UWr4YvwnakFW5Gr4Yywn7Wa4FqFyq9343Ga4DKFsxGF17tFyqqr1DZws8JFZ3
	CF93JF97Jw4v9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjFdyUUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuBwlF2JVj7Po9gAAsD
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
Cc: linuxppc-dev@lists.ozlabs.org, windhl@126.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In find_legacy_serial_ports(), of_find_node_by_path() will return
a node pointer with refcount incremented. We should use of_node_put()
when it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/kernel/legacy_serial.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/legacy_serial.c b/arch/powerpc/kernel/legacy_serial.c
index 5c58460b269a..f048c424c525 100644
--- a/arch/powerpc/kernel/legacy_serial.c
+++ b/arch/powerpc/kernel/legacy_serial.c
@@ -471,6 +471,8 @@ void __init find_legacy_serial_ports(void)
 	}
 #endif
 
+	of_node_put(stdout);
+
 	DBG("legacy_serial_console = %d\n", legacy_serial_console);
 	if (legacy_serial_console >= 0)
 		setup_legacy_serial_console(legacy_serial_console);
-- 
2.25.1

