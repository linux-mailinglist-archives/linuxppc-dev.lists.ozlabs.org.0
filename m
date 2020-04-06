Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A01319F988
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 18:01:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wwJP0thHzDr85
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 02:01:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=canonical.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=cascardo@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=canonical.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wwDV5BlGzDr7g
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 01:58:01 +1000 (AEST)
Received: from 201-43-83-214.dsl.telesp.net.br ([201.43.83.214]
 helo=localhost.localdomain) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cascardo@canonical.com>)
 id 1jLU8K-0004O2-9p; Mon, 06 Apr 2020 15:57:56 +0000
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/vio: drop bus_type from parent device
Date: Mon,  6 Apr 2020 12:57:48 -0300
Message-Id: <20200406155748.6761-1-cascardo@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: cascardo@canonical.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit df44b479654f62b478c18ee4d8bc4e9f897a9844 ("kobject: return error
code if writing /sys/.../uevent fails") started returning failure when
writing to /sys/devices/vio/uevent.

This causes an early udevadm trigger to fail. On some installer versions of
Ubuntu, this will cause init to exit, thus panicing the system very early
during boot.

Removing the bus_type from the parent device will remove some of the extra
empty files from /sys/devices/vio/, but will keep the rest of the layout
for vio devices, keeping them under /sys/devices/vio/.

It has been tested that uevents for vio devices don't change after this
fix, they still contain MODALIAS.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Fixes: df44b479654f ("kobject: return error code if writing /sys/.../uevent fails")
---
 arch/powerpc/platforms/pseries/vio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index 37f1f25ba804..a94dab3972a0 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -36,7 +36,6 @@ static struct vio_dev vio_bus_device  = { /* fake "parent" device */
 	.name = "vio",
 	.type = "",
 	.dev.init_name = "vio",
-	.dev.bus = &vio_bus_type,
 };
 
 #ifdef CONFIG_PPC_SMLPAR
-- 
2.20.1

