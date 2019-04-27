Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB36B3AF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 16:06:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rt5H24bdzDqNr
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 00:06:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrb26R0gzDqZp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:58:54 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MQ5nE-1h759i2pEm-00M2Ff; Sat, 27 Apr 2019 14:52:38 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 06/41] drivers: tty: serial: sb1250-duart: use dev_err()
 instead of printk()
Date: Sat, 27 Apr 2019 14:51:47 +0200
Message-Id: <1556369542-13247-7-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:virapGaLe72N04lun9WdAKkbszb/ggQMqOiOUSHBcLWgpMmeSap
 mBYtyGLtkO8bfsb4eQ43Ka/Pvv/b4cCI/WGEqijtDJEFEcNTc93ifR7R/FI82p+Et0Hzuoy
 6Mqe+toYlTBM2KOFgvujwEBfyVHzntqNkA4zWfZ1M4ILi8IQFR+Hd6QOrw7CXV2bkioPk2/
 824zpPHm55RHdm67u7Kxw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SXNQXQp8sh0=:R+aDQv3lvekLyrADiGHuEK
 CtjfTAKoGHRmAjJ6Xb8dN2lYsNh+W28aEMdgh54xOhuTgRpDw4N5AydwVa1GkJGE/tBGvdfAD
 LGbG75FmSB3lV4Wn/TKhId58KXrWjy4NasiTvMWwcEQCMJzYAkG/jiv4voibWWMGGn5SGimjx
 Ri5mwvqYchoCMBxp5G8fq8TAC3jOucf6Mss2WGvap1Dy1W51Z7vBnDhn+i5v7TDsglctmWzan
 Ke8R49dCVVJFUaYWtPYEn/kT9DlGBvcvv6NSuH1LmfFzwVSaM7Oc++m734vQgRN+BQmrZrEai
 niQ5mxsmA06CCqcVnq1OGyvvC+jd8DI6V5EHytHjcZdD5BWacXE3X1Ph37DGnF5QaAElvcJNx
 JHZmdDuln4PJd69ya3LTzIHfVGfys5Hu+kB1hnqYHdNmnKP7BueWXVbU/UC9QKwlYqeU6G66o
 ru2DwKVH9t45x6cXhEa7yA2jvN3ouOU76Sz+H5Cp+nlDq1Ybci8/nhjNiwfo4jawKsg+zj3Iw
 RbGPd4x2mRMaP3PWyH5HvBuQSzrNsyMmhQ8SHnxzTbWwqf9KPTumzBJ0iHnYYxttOp5cJTjdg
 6mSjPGkYGuHLjRrkoaTi1lfmVInfsYZ4Lr37aECl4PjQqWv+wlisIiGO0YN6Vjqb/PWhlVKsX
 0xddrJBapb3NNXPajntYjHK3wk4Ry+UwAxRBGz7v3H7C4gehhm/qGZtQVkt5NAFC55ZbINGVA
 O/1LHfyS5WzFTyyM6LXbhxXCsAQY2rESpK26aQ==
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

Using dev_err() instead of printk() for more consistent output.
(prints device name, etc).

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/sb1250-duart.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/sb1250-duart.c b/drivers/tty/serial/sb1250-duart.c
index 329aced..655961c 100644
--- a/drivers/tty/serial/sb1250-duart.c
+++ b/drivers/tty/serial/sb1250-duart.c
@@ -663,7 +663,6 @@ static void sbd_release_port(struct uart_port *uport)
 
 static int sbd_map_port(struct uart_port *uport)
 {
-	const char *err = KERN_ERR "sbd: Cannot map MMIO\n";
 	struct sbd_port *sport = to_sport(uport);
 	struct sbd_duart *duart = sport->duart;
 
@@ -671,7 +670,7 @@ static int sbd_map_port(struct uart_port *uport)
 		uport->membase = ioremap_nocache(uport->mapbase,
 						 DUART_CHANREG_SPACING);
 	if (!uport->membase) {
-		printk(err);
+		dev_err(uport->dev, "Cannot map MMIO (base)\n");
 		return -ENOMEM;
 	}
 
@@ -679,7 +678,7 @@ static int sbd_map_port(struct uart_port *uport)
 		sport->memctrl = ioremap_nocache(duart->mapctrl,
 						 DUART_CHANREG_SPACING);
 	if (!sport->memctrl) {
-		printk(err);
+		dev_err(uport->dev, "Cannot map MMIO (ctrl)\n");
 		iounmap(uport->membase);
 		uport->membase = NULL;
 		return -ENOMEM;
-- 
1.9.1

