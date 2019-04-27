Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07502B3A7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 15:50:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rsky2yhyzDqDY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 23:50:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrZx3x8FzDqZT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:58:49 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MBltM-1hUJWA0Zhs-00CCVD; Sat, 27 Apr 2019 14:52:42 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 10/41] drivers: tty: serial: sb1250-duart: fix missing
 parentheses
Date: Sat, 27 Apr 2019 14:51:51 +0200
Message-Id: <1556369542-13247-11-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:Q5d+R5/xof5LSpkM+m/1QK4rIat5cet+2kq+5TbMlzlAg7YOwcq
 yY6SxH8FWCXU0xZpYSh06YbjnruYS3jvbIaTQGqHoabIXLaqLV16hsMLD2TgWS4RStegv55
 BXylfzMhBa4VLDqOgexGnNJRWU6fc3oOK3V503qwx9kOQsSqkjZe8MoxRvmw7LEmLadmc7U
 bud6UfVRg0CpivgeZa72w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/cEwRct3WtI=:pGRTLNVHSidz524v/P9lm6
 IOVXBlcHq3QwTLXY7qdfbOsmO0kZzTY9DTx5ix7/A3uo3ezoqe1VWaWDGX0zoIBdIfmRtNzJO
 Zh1jHm3voTHDSPbCEJ9dkN/gyKRpp6P/CAYGSFbq2mauBYNr7hC3ffLEs7VoWceOoxO20UucM
 ZlttfbP0hc4PosLUj9TslTn1UddpbJasul+p3sou9zjLca1N8EK4J1CVYxEtIZsHSCfWItyV0
 E4ExbIIi+CGKhMXlD1KmaI/9ThDx9cVPVpg64Mlib82vMeorSJzLQMU9k1wLuLTCM9/3XcbQ0
 vE9wooAIkGsyhG2W3XGMgeAyREF6m7kg2mZvTLpurBkFfUzWqvP6fLjBdT9A0+abArSnaGyik
 Mu1Wk2nxkTMVS4+9bncH/Mhipy6wdFhikWt6VBeKmHgTwxELRmxkNbCdcRtATXUNn+1nsypkB
 IC19IsFBQRDTQ65ePqnaYiUaMP8lwlIWWecCfsv11xW/pVUIiWAs5UaijESBvCZZ2loF5FPrA
 6lM1k65xGXC8xxkPngMYK0Lt1WFbdB13eV4TUsi4uKLAQpRk4jbh8Irc6s+g4YXhR9Gh6wLnQ
 CNhhIuRAYIAAhWio+rzWPdHjXqaI36GFxnyd7xahyOu6s9wTpJFBAYdnY6qhQtt/p1fvFo7rM
 6H3x1rzpKrpXcECUbMc6IzMzRXHxDBKZRbk4prLOydpao5Rq3jW8mPxBjc/yMpnA2ixoisEjU
 zECHSQedvsLx4EoCabl7MF4qKzBZ1f9BKI5oXw==
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

    ERROR: Macros with complex values should be enclosed in parentheses
    #911: FILE: drivers/tty/serial/sb1250-duart.c:911:
    +#define SERIAL_SB1250_DUART_CONSOLE	&sbd_console

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/sb1250-duart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sb1250-duart.c b/drivers/tty/serial/sb1250-duart.c
index 1184226..ec74f09 100644
--- a/drivers/tty/serial/sb1250-duart.c
+++ b/drivers/tty/serial/sb1250-duart.c
@@ -908,7 +908,7 @@ static int __init sbd_serial_console_init(void)
 
 console_initcall(sbd_serial_console_init);
 
-#define SERIAL_SB1250_DUART_CONSOLE	&sbd_console
+#define SERIAL_SB1250_DUART_CONSOLE	(&sbd_console)
 #else
 #define SERIAL_SB1250_DUART_CONSOLE	NULL
 #endif /* CONFIG_SERIAL_SB1250_DUART_CONSOLE */
-- 
1.9.1

