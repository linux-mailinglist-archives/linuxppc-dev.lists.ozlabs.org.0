Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F399B390
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 15:19:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rs2W5xkWzDqNd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 23:19:15 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrSr6VlgzDqYV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:53:32 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N49Yn-1gckUf0Xp3-0101lS; Sat, 27 Apr 2019 14:52:36 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 03/41] drivers: tty: serial: dz: fix missing parentheses
Date: Sat, 27 Apr 2019 14:51:44 +0200
Message-Id: <1556369542-13247-4-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:DCKi2YoTk5F832OQUdu63uCQyxtOturAok1rJyvr3Cj1aB4PytR
 39oykOLn/6maTSaugkdLtAO+JW6mtXKXNyEKmjf/LfUX+UrtldHzEn6VJRT6Ai5Wmv6fPJu
 zDbdAsnAWjMsVY/Lfxtu7H3H0VD9b6vzG1KkGY93toXvi1amjf/kUGN1jMaJH9MM+TdtJWy
 6Qq+l2SfPMMVa3xrX3Dhg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hCaJcuTMeuA=:EB4ux1IA7Tt2VnO5QHlgjW
 pkbxMpPw2nta4CmIKC1kcgXZ8R3PVqr7ziHZCtHeUGvHHk9Qk9raYRBGZaF5IqaPVm6CNMnxr
 9vty1/D38JGFJJSTwt3NFvurWC70JuBjH/BKAB8yESh6+wLopafjQqQPN8l2KX8SGQjfwv2xO
 TyzFvmsYNx3rtFuVJ/pJ1vV56+pzzVMgAzd7E0EpyYgb7DGVVlUR2LG1dxWjJ2Hof/It2Rmfz
 p9izFHquGUwtbxHeqxGGWvM4ijYINTbcCUZVJjV5oJC9/JYWT730WUlA9JIbF2xjIF7PBRVXX
 kASrSTWn7c2M2sc3c6bB50GRDqBH6dH94gztdOwsPoZ4cj+JQkPM6uX86/TUJ8e4WJY2B5iGU
 HP7+HVB4tQVuFWqAHT2uGAz6varlOIJ5yKrTIJx6feesH62tAViO17zmGulcYNIxOP3eNPMOD
 Hmet1YF6m/ZGilYNo9SR/pjTIMz1EyH8o7eL4CQcuBZ9FwhDFRYTxTY15EVLqHyCvQkPg27Rb
 8uO0aVYpOJ/qo2qK8zbTnZCXXNRXdpe5e3F/ivKBz+b1Oa+zghaMw2mbTc4DrgKSeZzP1LTNm
 teKvpXO2ByNWbSgSgXOBtzriQtZsC2TVemyVqTtaDrQpo+R6tvq8EoDpEQZIo8UeRCmxfnM7Q
 CuTeQ7zz0fUVVIk54pr5H16riYLFpjz7OQg7RqO6kuwjj9BxIwYM6AphowGhGxOWdsrYDcB8I
 YsZWUl7WRUQ4eG9segmrTeI0ta1XPj9nf9dvOw==
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
  #912: FILE: dz.c:912:
  +#define SERIAL_DZ_CONSOLE	&dz_console

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/dz.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/dz.c b/drivers/tty/serial/dz.c
index fd4f0cc..b3e9313 100644
--- a/drivers/tty/serial/dz.c
+++ b/drivers/tty/serial/dz.c
@@ -909,7 +909,7 @@ static int __init dz_serial_console_init(void)
 
 console_initcall(dz_serial_console_init);
 
-#define SERIAL_DZ_CONSOLE	&dz_console
+#define SERIAL_DZ_CONSOLE	(&dz_console)
 #else
 #define SERIAL_DZ_CONSOLE	NULL
 #endif /* CONFIG_SERIAL_DZ_CONSOLE */
-- 
1.9.1

