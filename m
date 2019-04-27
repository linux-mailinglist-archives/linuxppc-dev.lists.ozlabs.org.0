Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA79B3AC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 15:58:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rswG1bj4zDqQl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 23:58:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrZz248HzDqLJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:58:50 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MNss4-1h9I592Io4-00OFB5; Sat, 27 Apr 2019 14:52:39 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 07/41] drivers: tty: serial: sb1250-duart: include
 <linux/io.h> instead of <asm/io.h>
Date: Sat, 27 Apr 2019 14:51:48 +0200
Message-Id: <1556369542-13247-8-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:rdRXb5foI78ZUKXg0PVAe5Z5nzYlAxuzsWdK2nGI/ZCG+/6jRlM
 hI3kp/kBUUgLKHfqLAS7fc8k7GQ2ADy4ZKXhqdqZiryVc7Z/Z2r9L5PNnJpvCGJ5Wm3QKlp
 qfPO4bQ3xuErAjl1GwNDMV08O2NC44IuFF/UesW2Ttt/YM+Ee5ZbuxprWyPUKJV4WjcRcmA
 KbeNYOb/RogJgZxW+H2Qg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jvvsYo9LuQY=:0CBFF1B+GF8XcuC/OEGe+u
 lE4du1nr2BxJUF3un6Key4aTFwXC9M1MP7vy6bRFShSWpMf0LqNeZ0PIMA0Boouqvq/LrWtch
 Bk8WIgPTVxONhX5cGTvv16KtAPX0N4Fc9XShLvZ3WIf85Pb8B1cmctvJO+91Vowqbv+OcZI7t
 u+klW1Y8h/XcHrCaCI9URzloY+8Skh09MjkRvd8JImBxErSZR4TrV4lBw/vZvh3JRZ3nDa87F
 2Ofw4ntjWDHq9/4ydwL8/MS8Ra0tJ7FucapkGNCI03gw6bHg/Zq4CUz1NxvvtMpgxBnM44EhT
 2A3Z5OphsucVUhbQFEvQY9hXMAtMHGW4rZOtjflDCKjXwJn18oRU+SQ/6LI35sYnI0g+RNJXj
 tcWYqG4u9L0O8K8B4QVhUS7hRnlp2mbXd445I0YV8wXTD24XSK5SWOLFwReIA2lMQsJebO8bf
 kOYGnaMypkS+rVMNELRAxXUQTHj6gaeBgDMuxEmFbm0dchrEnZ00FbAiLxbs/e9Y/E/n9X0Eq
 o+xS5zS5vti1O/IP6Ues2fjQ1nTyVd/xw4wMImB6WzxwnZmNp0YWHbZLvjJL63nIoXq9Qz+BJ
 x7N9TE7pgE2XwhIytU04iiIwK8ScI8APYxb0YztNJoFdEZciwryk1L+87RQy/1IYdGGBwWFcL
 QUDI0D0Z4viNgV6YKzf3QKqTOX97ZXwOA6V8297sBPuZdKsbJllrR12CsQvQnG8kj12Fs0lKS
 H6/3+9ybOTfmXynKHeq0NbNED/Mh0mZepeJ+kw==
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
    #41: FILE: drivers/tty/serial/sb1250-duart.c:41:
    +#include <asm/io.h>

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/sb1250-duart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sb1250-duart.c b/drivers/tty/serial/sb1250-duart.c
index 655961c..b4342c8 100644
--- a/drivers/tty/serial/sb1250-duart.c
+++ b/drivers/tty/serial/sb1250-duart.c
@@ -38,7 +38,7 @@
 #include <linux/types.h>
 
 #include <linux/refcount.h>
-#include <asm/io.h>
+#include <linux/io.h>
 #include <asm/war.h>
 
 #include <asm/sibyte/sb1250.h>
-- 
1.9.1

