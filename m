Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EB6B38B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 15:11:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rrsz6PYYzDqbh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 23:11:51 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrSg3J6jzDqYb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:53:15 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MWRZr-1hIx843db1-00XpY8; Sat, 27 Apr 2019 14:52:44 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 12/41] drivers: tty: serial: uartlite: use dev_dbg() instead
 of pr_debug()
Date: Sat, 27 Apr 2019 14:51:53 +0200
Message-Id: <1556369542-13247-13-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:iKlivJb6BzLykaezfbMDcQZdn+ix2ooVfsC6tW0pEhl98LAPDeE
 JRRVgVcfczmetBZDaIj6bTxrIsuLJZWRq491LJqAx+h9NbgwnoIDbHxcrTYcX/2PcSRokum
 actVckV0OuFGgmAK7gUuP0HXW1/BSfc94DTxmg7pJbcD5SZVKeVCxYgAJklKBryYGvN1CJo
 ibF50Jd1+Py/n87SQbwsQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:u5P2g8JRH2I=:qGaH8ryqR7sUqOGrLtEnq0
 2WfUNdHCnLg10s1ecEg65pn/njtDsMqOeP8gNEpxCMTzcWsLT9VA4DU3CEBVa3HCzjiKJcfHG
 eTHURytwvHGp7s9jZVE5iai0hKZDLmT9tnCMG0O5bDybrILrbz2OaCok/sor106qS90eCocZA
 WHMkOGw0j1qJeCv0leK1Z4fuVANM96a4sKdqYlnLL2v1g0Yy7Qv2BA/TyHUBS+K7r2RGhcM93
 TQCZfinRHziPPxnqY8q6GJipcuPVsuiLqzJC0H8npIwN2FnPLLAPYV/vgXo00WkXMfxjp7mWe
 s9cDM9K+72I9v9RY2NCSZ4HlPW78uNjLRoKXH9UI6yEUBsHch/+0OxFFZTB2NnEgI5hM4CxaA
 aW2LQCsOERK9kjsOnJFUi/mvk0axc5fq8TDylOAwQOSe0Nkpla45hTAsiHS221ZrBXCbrV5zA
 vp2fnOF01p7Eyj5ee/bkdEt+KrcA0YHPLrsTPFX/ReZeKT0iqAavOA1IICkPrbO/J9OgpkqPM
 +e5kU1Y2uDllo5BJ52L6yldoO9jgsv77olPmdDGKDcAfFx4RUBuMjYer7MOaRBSCwUzPaMwsD
 tgJ7G6LdN06zK0oIyp9V0oKzUCmMe1VTLSZaAIbSfUawtMPghR9Z49rdDsyfAYZ2DohkJIPTF
 xQn1Ht0ha1HyECC5uOoj7J38mbBQIygbj3uOhqVZj78SrVH8ls26OFebX6TDxvvF5GTZrl2n3
 rnTYYYquT1fzWtIJQj/tIvkv4pDPeDZLTev6ZQ==
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

Using dev_dbg() instead of pr_debg() for more consistent output.
(prints device name, etc).

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/uartlite.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
index b8b912b..44d65bd 100644
--- a/drivers/tty/serial/uartlite.c
+++ b/drivers/tty/serial/uartlite.c
@@ -352,7 +352,8 @@ static int ulite_request_port(struct uart_port *port)
 	struct uartlite_data *pdata = port->private_data;
 	int ret;
 
-	pr_debug("ulite console: port=%p; port->mapbase=%llx\n",
+	dev_dbg(port->dev,
+		"ulite console: port=%p; port->mapbase=%llx\n",
 		 port, (unsigned long long) port->mapbase);
 
 	if (!request_mem_region(port->mapbase, ULITE_REGION, "uartlite")) {
@@ -519,7 +520,8 @@ static int ulite_console_setup(struct console *co, char *options)
 
 	/* Has the device been initialized yet? */
 	if (!port->mapbase) {
-		pr_debug("console on ttyUL%i not present\n", co->index);
+		dev_dbg(port->dev, "console on ttyUL%i not present\n",
+			co->index);
 		return -ENODEV;
 	}
 
-- 
1.9.1

