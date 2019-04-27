Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90941B3AA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 15:56:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rssp042FzDqBc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 23:56:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrZy5wqCzDqZQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:58:50 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MRCFw-1h5zEz3V3s-00N8iN; Sat, 27 Apr 2019 14:52:57 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 28/41] drivers: tty: serial: sunzilog: fix includes
Date: Sat, 27 Apr 2019 14:52:09 +0200
Message-Id: <1556369542-13247-29-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:Vc4oNRhzaq0GImBAR5CgiZ+whb77bqy0PxtEF5afHcYFvx1oVZb
 siNewF36P93CZkzncVMQnr4mlIS/A8kCZTaukIk2D/GuBtTc3OHRLhlyKjwaq32J2XmrRlB
 f2vNOVy/3BrWxRfFIWguM5CtYi1a+WcUK3nW67RriXOHA4rE+69skktXGN0uJRmUq+H07n0
 K1/tFtsXXjzqS2NXo4RKA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:G0FFOz0EZw8=:++ICmXO2GpSRcz5hEx2aD1
 6E5IZz1xZtFc7Bo28D7Xa3YToLuKovidLGz1GvSDCBlRbtmk8MK9qrVEI2YEjK+HM3U3bywBn
 LRybOfgF+YyOp6mswgWhe5WdwQoR0c9nyr36aCKrwuWTPgmBSw98+8ywzd68Xs+Las1Mlx1f9
 dUm270h0Wg1e/wLzu9nUDWuw48qqgJ168lyoA5imIC9NaqH86TAH8rz3GeIeBPtMtQEzE6DIt
 I8ThOIAmO1UUcZ3PqHcpVYcw05Fbdoohq9QKNnWtyeMyNbaCN8mTaFdi1l6g1BBgIYg+X2Jrj
 DVHENskQwNZ1s51Nlu/0wkdKIxageCgYWL+LkXzWjossPOzmG+0ZeFUlCJGkkulQjGYFHNVu7
 K6f8K554rlG4uVrfNHmY7xsE8QIvjxC16WXp4+S2EfS0w+hxxPxLEpHgbIL/pLZ7PV8x8vFik
 BI1fGxW5LJWb+GfNLHwaHssIgGGtCmqDJXguu9xOtkNMizGemLWhYdEh17ZtADTRoT2d1xNuU
 +ShLqyULGCOEb0LAcoc5JbANgDjXSC8N9pBrdxpaFInjJF8mEYP50Fhw0cZnWigtHw1jmD2mo
 zgTJySrDGamBlm3MDPgw9bAWhSSnPFIZbd48ITRqfUKllwyuO2zJ3MUH4JZBmhkxbVQ50udtP
 LGI5ngTEsXOlW9iXua+0UlGmcT52hvjDTTZ8Ypc+Z+XZnydbY+MrEg0oHi/h0MzubG7u4bcTn
 2HxNiSx73lWVfMdqk86PstJKN9CQsrISP70IiA==
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
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org,
 linux-serial@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 sudeep.holla@arm.com, liviu.dudau@arm.com, linux-mips@vger.kernel.org,
 vz@mleia.com, linux@prisktech.co.nz, sparclinux@vger.kernel.org,
 khilman@baylibre.com, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix checkpatch warning:

    WARNING: Use #include <linux/io.h> instead of <asm/io.h>
    #38: FILE: drivers/tty/serial/sunzilog.c:38:
    +#include <asm/io.h>

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/sunzilog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sunzilog.c b/drivers/tty/serial/sunzilog.c
index 17b0520..85edb0d 100644
--- a/drivers/tty/serial/sunzilog.c
+++ b/drivers/tty/serial/sunzilog.c
@@ -34,8 +34,8 @@
 #endif
 #include <linux/init.h>
 #include <linux/of_device.h>
+#include <linux/io.h>
 
-#include <asm/io.h>
 #include <asm/irq.h>
 #include <asm/prom.h>
 #include <asm/setup.h>
-- 
1.9.1

