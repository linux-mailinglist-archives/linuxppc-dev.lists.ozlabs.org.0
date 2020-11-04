Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9406B2A6BBD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 18:33:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRDJj1M3wzDqc2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 04:33:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (unknown [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRDGk1QB4zDqZV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 04:31:29 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CRDG95Fqvz9txtn;
 Wed,  4 Nov 2020 18:31:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id NutH99vC5nLa; Wed,  4 Nov 2020 18:31:13 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CRDG85cqJz9twgy;
 Wed,  4 Nov 2020 18:31:12 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 11349264F; Wed,  4 Nov 2020 18:33:53 +0100 (CET)
Received: from 192.168.4.90 ([192.168.4.90]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Wed, 04 Nov 2020 18:33:53 +0100
Date: Wed, 04 Nov 2020 18:33:53 +0100
Message-ID: <20201104183353.Horde.FyqZycHkfr5KHDjPaOEBpQ7@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Kernel 5.10-rc1 not mounting NAND flash (Bisected to d7157ff49a5b
 ("mtd: rawnand: Use the ECC framework user input parsing bits"))
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Miquel,

I'm unable to boot 5.10-rc1 on my boards. I get the following error:

[    4.125811] nand: device found, Manufacturer ID: 0xad, Chip ID: 0x76
[    4.131992] nand: Hynix NAND 64MiB 3,3V 8-bit
[    4.136173] nand: 64 MiB, SLC, erase size: 16 KiB, page size: 512,  
OOB size: 16
[    4.143534] ------------[ cut here ]------------
[    4.147934] Unsupported ECC algorithm!
[    4.152142] WARNING: CPU: 0 PID: 1 at  
drivers/mtd/nand/raw/nand_base.c:5244 nand_scan_with_ids+0x1260/0x1640
...
[    4.332052] ---[ end trace e3a36f62cae4ac56 ]---
[    4.336882] gpio-nand: probe of c0000000.nand failed with error -22

Bisected to commit d7157ff49a5b ("mtd: rawnand: Use the ECC framework  
user input parsing bits")

My first impression is that with that change, the value set in chip->ecc.algo
by gpio_nand_probe() in drivers/mtd/nand/raw/gpio.c gets overwritten  
in rawnand_dt_init()

The following change fixes the problem, though I'm not sure it is the  
right fix. Can you have a look ?

diff --git a/drivers/mtd/nand/raw/nand_base.c  
b/drivers/mtd/nand/raw/nand_base.c
index 1f0d542d5923..aa74797cf2da 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5032,7 +5032,8 @@ static int rawnand_dt_init(struct nand_chip *chip)
  		chip->ecc.engine_type = nand->ecc.defaults.engine_type;

  	chip->ecc.placement = nand->ecc.user_conf.placement;
-	chip->ecc.algo = nand->ecc.user_conf.algo;
+	if (chip->ecc.algo == NAND_ECC_ALGO_UNKNOWN)
+		chip->ecc.algo = nand->ecc.user_conf.algo;
  	chip->ecc.strength = nand->ecc.user_conf.strength;
  	chip->ecc.size = nand->ecc.user_conf.step_size;

---

Thanks
Christophe
