Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F31B3B3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 16:12:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rtCp6gGrzDqfZ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 00:12:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrbM26yHzDqZQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:59:10 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MrQN5-1gyFsf3szn-00oX3M; Sat, 27 Apr 2019 14:53:03 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 34/41] drivers: tty: serial: zs: fill mapsize and use it
Date: Sat, 27 Apr 2019 14:52:15 +0200
Message-Id: <1556369542-13247-35-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:zrosD3Ctd1aN0WpNLZFdBQRFBUqXoIn/vK59RCWQKALAv5BYyI4
 9kJucz8qp+qIXGcy4ADN10n35GRjp3t1bSz4vEWOCzwTB2XXPf6KteeGAGjUQOXvDMkS0PQ
 658vUta/FNmxhHolnomtYwAm2hVQ/rOsExC3aVbcC7iO/2z6qctqb6KpFVlO6xFHXeNXPYX
 uBsZgE/3Ekcv4Nsi/qZwQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jwkeYbi956s=:fkr540vSqeyxqS0cN3h95V
 BFrjn1rg7quReDZD5BHTiW4xe5OXmEXmcizp9iGZ0ZLsYDmF5Z8AJ415mbo3mB1JToPrH8WAr
 Utj66F2u9C2TQ3DjXXTCEUpMmGSjnB1yuWHZpbuFyMqhEkKLLFsEuD0ZcQrj6rGFiYfyiNci2
 2tPDCLGMRRfHhUUUM/j8ogXAgy23jIIY+NzZ/KkIkGlnQr+O5m0IZgX8QHd/h/AxkDVhGLLeX
 zWdKlJPa6rMsgJxDYmPiVRTBjewa5XXGgf2c5zz/hIocTcfu880m3tFQaYza4pnq7iGzNjD0k
 nd++5EpCstfuYQ9wIACDcZcDILy77PWl7OEZJ3T99B8dyqwUoN5LY/ehX/+W7lgnsRDCTKz+K
 XRbwwRzMV06DZtwr16N2tYBnss7Y+Qr1aa0PyGnrckTCbbKjI+GbWZtP/GoYT2JPvcp8KD6TO
 XOepHZF2fPs3rS5yauTp4/aSaxcnU6N+QzzvHlAp2lA7NDuR9RCQ38lpnRUkoceDwRyEXBVt1
 ILWBEGEmvePXWVPLsTQCIuEbUuHNMnO9KszRRy2+Ib/07dmm79K0NyPpgUk6hMQ/HFs+yBE97
 R+NW7Zdj142F35K7I2SYY8TXsX5072oHwz1lQ6YlqwOM5ilhGmK9OVl3K5gVQOGQWi/EKyMIs
 oNsW6PPp7QOowGKod167YNZ0f7yLHWjFXAyW4q3hxWZBtZwPraAYOxY5Xyy1MzEmXqMGfPwh1
 ApcePAJBPo+D1vxsnjA0vH9L792yVdDdAv2LOQ==
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

Fill the struct uart_port->mapsize field and use it, insteaf of
hardcoded values in many places. This makes the code layout a bit
more consistent and easily allows using generic helpers for the
io memory handling.

Candidates for such helpers could be eg. the request+ioremap and
iounmap+release combinations.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/zs.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/zs.c b/drivers/tty/serial/zs.c
index adbfe79..ab432ba 100644
--- a/drivers/tty/serial/zs.c
+++ b/drivers/tty/serial/zs.c
@@ -986,14 +986,14 @@ static void zs_release_port(struct uart_port *uport)
 {
 	iounmap(uport->membase);
 	uport->membase = 0;
-	release_mem_region(uport->mapbase, ZS_CHAN_IO_SIZE);
+	release_mem_region(uport->mapbase, uport->mapsize);
 }
 
 static int zs_map_port(struct uart_port *uport)
 {
 	if (!uport->membase)
 		uport->membase = ioremap_nocache(uport->mapbase,
-						 ZS_CHAN_IO_SIZE);
+						 uport->mapsize);
 	if (!uport->membase) {
 		dev_err(port->dev, "zs: Cannot map MMIO\n");
 		return -ENOMEM;
@@ -1005,13 +1005,13 @@ static int zs_request_port(struct uart_port *uport)
 {
 	int ret;
 
-	if (!request_mem_region(uport->mapbase, ZS_CHAN_IO_SIZE, "scc")) {
+	if (!request_mem_region(uport->mapbase, uport->mapsize, "scc")) {
 		dev_err(uport->dev, "zs: Unable to reserve MMIO resource\n");
 		return -EBUSY;
 	}
 	ret = zs_map_port(uport);
 	if (ret) {
-		release_mem_region(uport->mapbase, ZS_CHAN_IO_SIZE);
+		release_mem_region(uport->mapbase, uport->mapsize);
 		return ret;
 	}
 	return 0;
@@ -1113,6 +1113,7 @@ static int __init zs_probe_sccs(void)
 			uport->flags	= UPF_BOOT_AUTOCONF;
 			uport->ops	= &zs_ops;
 			uport->line	= chip * ZS_NUM_CHAN + side;
+			uport->mapsize	= ZS_CHAN_IO_SIZE;
 			uport->mapbase	= dec_kn_slot_base +
 					  zs_parms.scc[chip] +
 					  (side ^ ZS_CHAN_B) * ZS_CHAN_IO_SIZE;
-- 
1.9.1

