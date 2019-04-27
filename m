Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF0CB384
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 15:05:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rrkz16xfzDqbm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 23:05:47 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrSf0mwkzDqYV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:53:21 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M72wZ-1hQgsG1F7v-008djg; Sat, 27 Apr 2019 14:52:35 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 02/41] drivers: tty: serial: dz: include <linux/io.h> instead
 of <asm/io.h>
Date: Sat, 27 Apr 2019 14:51:43 +0200
Message-Id: <1556369542-13247-3-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:vWpyHvDheL6gbLjo3etBs2JZ/UueJUyOwv5jXuZL9y2wfL1t2Sz
 Q/+Nt5v3237WzwYwrkHtvh8CdRpqwPqpHpcjERpTIKU+EcAYTF+qBG0cw4jXtPhcJu5L1xP
 kkBztdWdJQKAWhxdJmybmuQlVUbgmAr1fvOkc6orv3ghX86g6ax2Ao2WppX1ubS4UHmC3BK
 omfMVJUQwR4EJT11yTj+A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PWTU6h30wog=:g3KXzB9M32PW8Kl8vCIU73
 qJ8Hw/X5UhMxHr5PXZ5NJLP8zF+n5L1AYhbxdz0HkWq3pRijKJD3ZZgMPMXT5AC0MCjgTwTnG
 BKB6ehulTwMDvn0rk/0UWp57hVY8n65jpID29G2/RtuijyesvETIRsoOmsEDDklXWWrpv6Hvq
 J5ApyjRxjwebOu+2DLtzw/iHyVZjoSBSJ3tfl+uRrcbirei0rvO8pIPPAp9hShgt6wvsRCnWy
 69Nm4xD9n73QNYwZz1WgLz31zuE/AXQbiEv14NTsptf7xQB3TMb47qEcLeEIXQttLDlssfrUu
 sUnzAbwiXa9qXMynpyfRG2WmHpKy3Sb57NCyp79kJVZNqzTeWy5rJ580LJtiNOnKV5l0NEl4P
 ft43B9g3QEw0dE2RA1G9sPuGJvuILiXEPeqUqYjhTT+UmVrLG83+OrotnH1YPjhkzWg9WZGyl
 ZsMxaVC5zUJY8olqHlPJl3lfAv4fxzGIBE75jKtOJwB61iyMmTGCbLZT9aUnRGj+9CHDKLe70
 r7+eZMXeXJ9eT1W7HDMQibFCPL6QSTKhCVVawhfq7GZkd2tcZx4GWCO7RGRNgouXD8JVSy7qz
 m5Wbs2AH+EWnYtwKwE+ERMHMsz/tgMtlUXwgbizNPnSQPzD9LYY+Bqrq0DeP+AXy3VjT0jaZn
 /zPlxBehxOKrsnCjM3aDW+YERQBO5njRt7YPdL+ImY78ofqqhgs0vMjuBK7/voIREnYQyHmyR
 QiZRIDUO7YShRpDwljxwkZ//0pWuawyNDeyJ3w==
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

fixing checkpatch warning:

  WARNING: Use #include <linux/io.h> instead of <asm/io.h>
  #55: FILE: dz.c:55:
  +#include <asm/io.h>

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/dz.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/dz.c b/drivers/tty/serial/dz.c
index 96e35af..fd4f0cc 100644
--- a/drivers/tty/serial/dz.c
+++ b/drivers/tty/serial/dz.c
@@ -52,7 +52,7 @@
 
 #include <linux/atomic.h>
 #include <asm/bootinfo.h>
-#include <asm/io.h>
+#include <linux/io.h>
 
 #include <asm/dec/interrupts.h>
 #include <asm/dec/kn01.h>
-- 
1.9.1

