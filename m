Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49461B38F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 15:17:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rs0Z5ZtXzDqKj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 23:17:34 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrSm2lZ3zDqHv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:53:28 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MG9c4-1hYhE40ZmG-00GaDP; Sat, 27 Apr 2019 14:52:56 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 26/41] drivers: tty: serial: sunzilog: use dev_info() instead
 of printk()
Date: Sat, 27 Apr 2019 14:52:07 +0200
Message-Id: <1556369542-13247-27-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:mAhDCbido9+iZFtRE4TdsCbv1vAr9Joy1VbiPU+XYBGA3j+D1i7
 8tBC3ZCd802YRf6g/j2wz/Rpr+rNfM3/C9qVun5TY7ecwFsuAGNQ9PkxsomQbrK7CQSqD9t
 lNVdEtEZXMG24nxtzJ9rZ1N16lMRzqr8eSk0ACn+9ciZWtRdbmtCGj6cenKYS6p9eJZMPGK
 +Gf+FP3wxSs4kFyyMktug==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0SWS/YPHXl4=:xXTpK4xlmi8jyBmh5+ECF2
 2f9XUV5idTnhYPicmiA4uN9epzHkr0tM2wgGgfiaPSshMy4/xofCE6fehmo0kVhDKiF8UVbMG
 XR8itAO4whaeeAqp9zT5DYaaSKJ2vtlF2N3zWHCsj7pHbAGbhkSM9yxnLE5xXWK/rrI3rNFKs
 YIL05g1WGyY8xdJe4HFEc4NcJhKh0f6h9LUIcxhmKvH9XKe8ycd0Xe3RywlvzHmnWjcU1z9Vj
 T6vHj0osI3kq595a3frTeGB0+jpxTiEP9p6T6XiuZvNJcMFcVfR19rf4Gj2yDgphVYvMsQryv
 Ksrc5FpwDCtuUawC5zqz/Epzic7ZckEfLjO0q7+UoqsY0qU2w5PVM0DrEJwWrMmVrMhIrOFFw
 81XKksVUTD4AuR+sXqurAVCxRwn6CXlYCaUeQij0f2JVzNuq7fbmsbAgJpeEfV5/tIPLtdEaR
 vBt9XarGGDlzVuyi92jSjgdBgtKrY7LZr+9m6ioeJxy2ufRg0N32AcwiJeOcaGThmWCpht23Y
 m1ocX1+Dlr8+TlglVKRnWgCqKWI2lhH9KcTZN8l27ajs49owlLXy8zkyJUHaswH8NaJ7Vo4HJ
 /Q2JJ0/z9DlIk0AXgG0IJq1NdJttYEUAtvhk5Ms9Ad6jVBqAzeWwQ3FXaB1XSVn+7YmVjffw6
 nb8ej0Ia5DlAdpZ4D1aTwGxiigyP+2TidNSBWB6whE/gbiB9kfqBscb0vJZXs8WN/bVMk7qiH
 gIjVcmF0qrPRPdGta3xTuJy8beZywXyoAWaOnw==
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

Using dev_info() instead of printk() for more consistent output.
(prints device name, etc).

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/sunzilog.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/sunzilog.c b/drivers/tty/serial/sunzilog.c
index bc7af8b..6285bba 100644
--- a/drivers/tty/serial/sunzilog.c
+++ b/drivers/tty/serial/sunzilog.c
@@ -1489,14 +1489,12 @@ static int zs_probe(struct platform_device *op)
 		}
 		uart_inst++;
 	} else {
-		printk(KERN_INFO "%s: Keyboard at MMIO 0x%llx (irq = %d) "
+		dev_info(&op->dev, "Keyboard at MMIO 0x%llx (irq = %d) "
 		       "is a %s\n",
-		       dev_name(&op->dev),
 		       (unsigned long long) up[0].port.mapbase,
 		       op->archdata.irqs[0], sunzilog_type(&up[0].port));
-		printk(KERN_INFO "%s: Mouse at MMIO 0x%llx (irq = %d) "
+		dev_info(&op->dev, "Mouse at MMIO 0x%llx (irq = %d) "
 		       "is a %s\n",
-		       dev_name(&op->dev),
 		       (unsigned long long) up[1].port.mapbase,
 		       op->archdata.irqs[0], sunzilog_type(&up[1].port));
 		kbm_inst++;
-- 
1.9.1

