Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 402D5B3A2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 15:46:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rsfM5dZPzDqH5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 23:46:51 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrZw0hr1zDqZT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:58:47 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MhUDj-1gqW7b2XwJ-00efAG; Sat, 27 Apr 2019 14:52:52 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 22/41] drivers: tty: serial: cpm_uart: fix logging calls
Date: Sat, 27 Apr 2019 14:52:03 +0200
Message-Id: <1556369542-13247-23-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:6aniEe4uJcRcav5vVBfcQ4eLLFWMnqJpVC4vZyHJ9k0A6q/tn4j
 b9DaJRxToUGOhrA8XctR1mPhJ0cf7Ttk2f4rAFWNa3fQjR7YkDeiN3gu2Jkvl9J2LTCqub4
 NvWiLxdxAxFk1k9fhSMKs/EVAw4rvAGYukqY9dkQaz94+MijAkIVPXhEPMgivLXBUM8RACd
 PwxeoNLw6M7rcZKmGYaIg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4ae+pXryDgc=:mx0SCluB4vmxIoFPECpZI0
 I+pi99k37uAp/PBAy5oVXSCaXHiGTG6dqW38LtyfujehIJipGNKdaMmdazfpDadjAEgwWsmX4
 W7Und1DBuKx/nWHjtssgjEb+TBTcTmXzLurc8piE/KzQS8bd8JlSKed3+k452MwfKq3+35IzJ
 M6TyJgB8TUW0HJIysE0RjSi4sJqSgXl8rJscZAw2l13jHSnEj3/rJwrbQJJOFC5P1075DM+wk
 WGBZT4LjsbjnB2by0QUmFtCQAl7B060lVus4iVl5bwIgmLGtAuaVBUYl/Z8M3jLhLIqC0JAC6
 +mB3/lJgI2f1Nvs33f9bS5YcQiXmmfVenjRMrNi2di59SDG0jYAXnIpXY4sJs1ZAu8YnsZRsU
 37osy93VtkEcKNvzLFbEG++IG89LRjdH9d8NQEr/K2M2oALKpj+kvh4dg3eHLDdXQxSdkD92B
 WVwAcm5EvCrGAxmiByZuHAzWoq3sJ4ZhAPePEUfJkAnCEaDkpN0tOu1XGCbELCMhCzuMdSC7j
 391oyi6l66AnQpVtOW/xN4q0n/U6j6889kTq7oArvf5bOqS+CGWrt4GeHYMhDjJgb67JeV1O5
 VJObZETt5SKMQvcEzRSmPjDhRxKdNgWwD7Lycw/XQtIwLzDgn7tob6yNJiWhf2OPx8oDuVFhf
 9EKWLB531/XmZjW8vl3u+dinoMueW3XdTJHfx8LQ1QRZKyfFcd5erZRfdf67oUUhcOFqLTE5w
 UM355inC0Yw+C74Qjz0UYWJgtfMZqucLadoUmw==
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

Fix checkpatch warnings by using pr_err():

    WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
    #109: FILE: drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c:109:
    +		printk(KERN_ERR

    WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
    #128: FILE: drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c:128:
    +		printk(KERN_ERR

    WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
    +           printk(KERN_ERR

    WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
    +           printk(KERN_ERR

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/cpm_uart/cpm_uart_cpm1.c | 6 ++----
 drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_cpm1.c b/drivers/tty/serial/cpm_uart/cpm_uart_cpm1.c
index 56fc527..aed61e9 100644
--- a/drivers/tty/serial/cpm_uart/cpm_uart_cpm1.c
+++ b/drivers/tty/serial/cpm_uart/cpm_uart_cpm1.c
@@ -71,8 +71,7 @@ int cpm_uart_allocbuf(struct uart_cpm_port *pinfo, unsigned int is_con)
 	dpmemsz = sizeof(cbd_t) * (pinfo->rx_nrfifos + pinfo->tx_nrfifos);
 	dp_offset = cpm_dpalloc(dpmemsz, 8);
 	if (IS_ERR_VALUE(dp_offset)) {
-		printk(KERN_ERR
-		       "cpm_uart_cpm1.c: could not allocate buffer descriptors\n");
+		pr_err("cpm_uart_cpm1.c: could not allocate buffer descriptors\n");
 		return -ENOMEM;
 	}
 	dp_mem = cpm_dpram_addr(dp_offset);
@@ -90,8 +89,7 @@ int cpm_uart_allocbuf(struct uart_cpm_port *pinfo, unsigned int is_con)
 
 	if (mem_addr == NULL) {
 		cpm_dpfree(dp_offset);
-		printk(KERN_ERR
-		       "cpm_uart_cpm1.c: could not allocate coherent memory\n");
+		pr_err("cpm_uart_cpm1.c: could not allocate coherent memory\n");
 		return -ENOMEM;
 	}
 
diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c b/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
index 40cfcf4..a0fccda 100644
--- a/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
+++ b/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
@@ -106,8 +106,7 @@ int cpm_uart_allocbuf(struct uart_cpm_port *pinfo, unsigned int is_con)
 	dpmemsz = sizeof(cbd_t) * (pinfo->rx_nrfifos + pinfo->tx_nrfifos);
 	dp_offset = cpm_dpalloc(dpmemsz, 8);
 	if (IS_ERR_VALUE(dp_offset)) {
-		printk(KERN_ERR
-		       "cpm_uart_cpm.c: could not allocate buffer descriptors\n");
+		pr_err("cpm_uart_cpm.c: could not allocate buffer descriptors\n");
 		return -ENOMEM;
 	}
 
@@ -125,8 +124,7 @@ int cpm_uart_allocbuf(struct uart_cpm_port *pinfo, unsigned int is_con)
 
 	if (mem_addr == NULL) {
 		cpm_dpfree(dp_offset);
-		printk(KERN_ERR
-		       "cpm_uart_cpm.c: could not allocate coherent memory\n");
+		pr_err("cpm_uart_cpm.c: could not allocate coherent memory\n");
 		return -ENOMEM;
 	}
 
-- 
1.9.1

