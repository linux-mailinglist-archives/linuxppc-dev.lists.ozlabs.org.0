Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 196A7B3BF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 16:22:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rtRx4JPXzDqfr
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 00:22:53 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrbS2zWbzDqbC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:59:16 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N9MlI-1gfl9m1ece-015ExT; Sat, 27 Apr 2019 14:52:54 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 24/41] drivers: tty: serial: timbuart: use dev_err() instead
 of printk()
Date: Sat, 27 Apr 2019 14:52:05 +0200
Message-Id: <1556369542-13247-25-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:BieBEBBsy2gfEajzWoDGWMcE2Mvq0o7NJ63l6aX+FxhP7ufm2yW
 8dXTC3JQUAFY/WCMJ1/1FJOwC4nH5OFd4rdRacx9W0Ygab84QWKSXEPsRUsyINwb9XiMSPm
 RCcNrFz9CApcr0oX4NbMqQ9F8s3kYV2PWgfs7u2aOEsWDpqGeA0wVWyWwLSbOC/ddaW82Li
 OjOZ6NUleeV5JtDUVLwHg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xdrw3IhlTxo=:mMMbSQLC8s6s6mq9c8pay3
 Ul/PMrF6YccL7/1eIjXOck09cIEG7W7xtBIO5Fo8T6DdPTkT357JcQ7poG9DgEeFskUBN9mfV
 +et4q35NezF4sG+x+im8Hg1EJuAxSZVEmjN085DlF+WvqEnm0L/vvamW5p+x1kWuwCDW4ohGw
 LoqadgCztkVNe1cqkLWwgc6ZcKYOw6c16jctenOHprGF7yJPYcUdb3tHz7RBhfMHIxYOvteRb
 1yrIt0tM4IKoJgWvCSNikz4SDyobkndYH6/BK2/l7aMldaga2fYNGum5mrd4MyOC4HxgMiZiQ
 VghtXOVquqZxgMpk8lbLJeiPDNVyA6w/Qy/5Zx/inWn7IxXHJ51s28dqBRuY8AY+EFVQPts5b
 06n0aBCajhZDcbOmfmcZHpSvSbZ4NIwIgHtFIRHq2MowUbYFSv4PWZtQJ7Y3PpJvHHmK8Tyf8
 LfSggz4bh2iOdKOZydAQlorCqRbMhs1Mfc6rFouSxqi5at60Rh4sxgrxxPoGZtkGrEwE1bKHw
 e6FlDbO0RQaCVZIiYRXL7FQhCIeGs+6VI+KQcRQtewezTTVtyrWt71nx4LL8AAx83dlje88tK
 dcaZ9tG4AD4OooA1EjaxP1YkJRL9LvPmf7HfgAjTyZQzKe73NPwgZ/c5wx7TF9K+pzOdFIjIF
 KpIl9Xb1HgD+e7g/KZa/IC1WFDb+GqB2wMEdAZsC1ab69o6k1mjktvIPOU/OP00bB0/xXp2kC
 Hk82Pt12dBg+e66jXS8a4qbr0ldcDUYNCFPHOFTcjOdxwfOjDs2CBPNNjKm+LDO6b1S/BeBeI
 UMe99a7dwRMP9piOWx8Y0uMNp283AXMIfRDQzfAvqh0AIKMNNuIR7FDK6ytbKd3MBc0W7BZTw
 IsmdhG5c+cjmDQ8uWbXk5GI03Q/UcQEATo+Uu8+zslOLnwkcqBqjfvLYhIQvUENXaIxG3RdHV
 x/5YcRAFWxQ==
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
 drivers/tty/serial/timbuart.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tty/serial/timbuart.c b/drivers/tty/serial/timbuart.c
index 19d38b5..dcce936 100644
--- a/drivers/tty/serial/timbuart.c
+++ b/drivers/tty/serial/timbuart.c
@@ -470,8 +470,7 @@ static int timbuart_probe(struct platform_device *dev)
 err_register:
 	kfree(uart);
 err_mem:
-	printk(KERN_ERR "timberdale: Failed to register Timberdale UART: %d\n",
-		err);
+	dev_err(&dev->dev, "Failed to register Timberdale UART: %d\n", err);
 
 	return err;
 }
-- 
1.9.1

