Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4609C32FC6B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 19:11:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DtCMw23Xcz3dYk
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Mar 2021 05:11:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DtCLB2ySQz3cJL
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Mar 2021 05:09:34 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DtCL01ghCz9v087;
 Sat,  6 Mar 2021 19:09:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Dkd9jGLgt13J; Sat,  6 Mar 2021 19:09:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DtCKz6sF5z9v085;
 Sat,  6 Mar 2021 19:09:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DEFB88B768;
 Sat,  6 Mar 2021 19:09:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id aAdaIuW_eIWr; Sat,  6 Mar 2021 19:09:29 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6E1A48B75B;
 Sat,  6 Mar 2021 19:09:29 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 3B68E674E3; Sat,  6 Mar 2021 18:09:29 +0000 (UTC)
Message-Id: <f6c758ae1290144896d77e03b8cf7577c723d0f7.1615053848.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615053848.git.christophe.leroy@csgroup.eu>
References: <cover.1615053848.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 1/3] soc: fsl: qe: replace qe_io{read,write}* wrappers by
 generic io{read,write}*
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Timur Tabi <timur@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Date: Sat,  6 Mar 2021 18:09:29 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 6ac9b61786cc ("soc: fsl: qe: introduce qe_io{read,write}*
wrappers") added specific I/O accessors for qe because at that
time ioread/iowrite functions were sub-optimal on powerpc/32
compared to the architecture specific in_/out_ IO accessors.

But as ioread/iowrite accessors are now equivalent since
commit 894fa235eb4c ("powerpc: inline iomap accessors"),
use them in order to allow removal of the qe specific ones.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/gpio.c     | 20 +++++------
 drivers/soc/fsl/qe/qe.c       | 24 ++++++-------
 drivers/soc/fsl/qe/qe_ic.c    |  4 +--
 drivers/soc/fsl/qe/qe_io.c    | 36 +++++++++----------
 drivers/soc/fsl/qe/ucc_fast.c | 68 +++++++++++++++++------------------
 drivers/soc/fsl/qe/ucc_slow.c | 42 +++++++++++-----------
 6 files changed, 97 insertions(+), 97 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index ed75198ed254..99f7de43c3c6 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -41,13 +41,13 @@ static void qe_gpio_save_regs(struct of_mm_gpio_chip *mm_gc)
 		container_of(mm_gc, struct qe_gpio_chip, mm_gc);
 	struct qe_pio_regs __iomem *regs = mm_gc->regs;
 
-	qe_gc->cpdata = qe_ioread32be(&regs->cpdata);
+	qe_gc->cpdata = ioread32be(&regs->cpdata);
 	qe_gc->saved_regs.cpdata = qe_gc->cpdata;
-	qe_gc->saved_regs.cpdir1 = qe_ioread32be(&regs->cpdir1);
-	qe_gc->saved_regs.cpdir2 = qe_ioread32be(&regs->cpdir2);
-	qe_gc->saved_regs.cppar1 = qe_ioread32be(&regs->cppar1);
-	qe_gc->saved_regs.cppar2 = qe_ioread32be(&regs->cppar2);
-	qe_gc->saved_regs.cpodr = qe_ioread32be(&regs->cpodr);
+	qe_gc->saved_regs.cpdir1 = ioread32be(&regs->cpdir1);
+	qe_gc->saved_regs.cpdir2 = ioread32be(&regs->cpdir2);
+	qe_gc->saved_regs.cppar1 = ioread32be(&regs->cppar1);
+	qe_gc->saved_regs.cppar2 = ioread32be(&regs->cppar2);
+	qe_gc->saved_regs.cpodr = ioread32be(&regs->cpodr);
 }
 
 static int qe_gpio_get(struct gpio_chip *gc, unsigned int gpio)
@@ -56,7 +56,7 @@ static int qe_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	struct qe_pio_regs __iomem *regs = mm_gc->regs;
 	u32 pin_mask = 1 << (QE_PIO_PINS - 1 - gpio);
 
-	return !!(qe_ioread32be(&regs->cpdata) & pin_mask);
+	return !!(ioread32be(&regs->cpdata) & pin_mask);
 }
 
 static void qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
@@ -74,7 +74,7 @@ static void qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	else
 		qe_gc->cpdata &= ~pin_mask;
 
-	qe_iowrite32be(qe_gc->cpdata, &regs->cpdata);
+	iowrite32be(qe_gc->cpdata, &regs->cpdata);
 
 	spin_unlock_irqrestore(&qe_gc->lock, flags);
 }
@@ -101,7 +101,7 @@ static void qe_gpio_set_multiple(struct gpio_chip *gc,
 		}
 	}
 
-	qe_iowrite32be(qe_gc->cpdata, &regs->cpdata);
+	iowrite32be(qe_gc->cpdata, &regs->cpdata);
 
 	spin_unlock_irqrestore(&qe_gc->lock, flags);
 }
@@ -269,7 +269,7 @@ void qe_pin_set_dedicated(struct qe_pin *qe_pin)
 	else
 		qe_gc->cpdata &= ~mask1;
 
-	qe_iowrite32be(qe_gc->cpdata, &regs->cpdata);
+	iowrite32be(qe_gc->cpdata, &regs->cpdata);
 	qe_clrsetbits_be32(&regs->cpodr, mask1, sregs->cpodr & mask1);
 
 	spin_unlock_irqrestore(&qe_gc->lock, flags);
diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
index 2df20d6f85fa..4d38c80f8be8 100644
--- a/drivers/soc/fsl/qe/qe.c
+++ b/drivers/soc/fsl/qe/qe.c
@@ -109,7 +109,7 @@ int qe_issue_cmd(u32 cmd, u32 device, u8 mcn_protocol, u32 cmd_input)
 
 	spin_lock_irqsave(&qe_lock, flags);
 	if (cmd == QE_RESET) {
-		qe_iowrite32be((u32)(cmd | QE_CR_FLG), &qe_immr->cp.cecr);
+		iowrite32be((u32)(cmd | QE_CR_FLG), &qe_immr->cp.cecr);
 	} else {
 		if (cmd == QE_ASSIGN_PAGE) {
 			/* Here device is the SNUM, not sub-block */
@@ -126,13 +126,13 @@ int qe_issue_cmd(u32 cmd, u32 device, u8 mcn_protocol, u32 cmd_input)
 				mcn_shift = QE_CR_MCN_NORMAL_SHIFT;
 		}
 
-		qe_iowrite32be(cmd_input, &qe_immr->cp.cecdr);
-		qe_iowrite32be((cmd | QE_CR_FLG | ((u32)device << dev_shift) | (u32)mcn_protocol << mcn_shift),
+		iowrite32be(cmd_input, &qe_immr->cp.cecdr);
+		iowrite32be((cmd | QE_CR_FLG | ((u32)device << dev_shift) | (u32)mcn_protocol << mcn_shift),
 			       &qe_immr->cp.cecr);
 	}
 
 	/* wait for the QE_CR_FLG to clear */
-	ret = readx_poll_timeout_atomic(qe_ioread32be, &qe_immr->cp.cecr, val,
+	ret = readx_poll_timeout_atomic(ioread32be, &qe_immr->cp.cecr, val,
 					(val & QE_CR_FLG) == 0, 0, 100);
 	/* On timeout, ret is -ETIMEDOUT, otherwise it will be 0. */
 	spin_unlock_irqrestore(&qe_lock, flags);
@@ -231,7 +231,7 @@ int qe_setbrg(enum qe_clock brg, unsigned int rate, unsigned int multiplier)
 	tempval = ((divisor - 1) << QE_BRGC_DIVISOR_SHIFT) |
 		QE_BRGC_ENABLE | div16;
 
-	qe_iowrite32be(tempval, &qe_immr->brg.brgc[brg - QE_BRG1]);
+	iowrite32be(tempval, &qe_immr->brg.brgc[brg - QE_BRG1]);
 
 	return 0;
 }
@@ -375,9 +375,9 @@ static int qe_sdma_init(void)
 			return -ENOMEM;
 	}
 
-	qe_iowrite32be((u32)sdma_buf_offset & QE_SDEBCR_BA_MASK,
+	iowrite32be((u32)sdma_buf_offset & QE_SDEBCR_BA_MASK,
 		       &sdma->sdebcr);
-	qe_iowrite32be((QE_SDMR_GLB_1_MSK | (0x1 << QE_SDMR_CEN_SHIFT)),
+	iowrite32be((QE_SDMR_GLB_1_MSK | (0x1 << QE_SDMR_CEN_SHIFT)),
 		       &sdma->sdmr);
 
 	return 0;
@@ -416,14 +416,14 @@ static void qe_upload_microcode(const void *base,
 			"uploading microcode '%s'\n", ucode->id);
 
 	/* Use auto-increment */
-	qe_iowrite32be(be32_to_cpu(ucode->iram_offset) | QE_IRAM_IADD_AIE | QE_IRAM_IADD_BADDR,
+	iowrite32be(be32_to_cpu(ucode->iram_offset) | QE_IRAM_IADD_AIE | QE_IRAM_IADD_BADDR,
 		       &qe_immr->iram.iadd);
 
 	for (i = 0; i < be32_to_cpu(ucode->count); i++)
-		qe_iowrite32be(be32_to_cpu(code[i]), &qe_immr->iram.idata);
+		iowrite32be(be32_to_cpu(code[i]), &qe_immr->iram.idata);
 	
 	/* Set I-RAM Ready Register */
-	qe_iowrite32be(QE_IRAM_READY, &qe_immr->iram.iready);
+	iowrite32be(QE_IRAM_READY, &qe_immr->iram.iready);
 }
 
 /*
@@ -542,12 +542,12 @@ int qe_upload_firmware(const struct qe_firmware *firmware)
 			u32 trap = be32_to_cpu(ucode->traps[j]);
 
 			if (trap)
-				qe_iowrite32be(trap,
+				iowrite32be(trap,
 					       &qe_immr->rsp[i].tibcr[j]);
 		}
 
 		/* Enable traps */
-		qe_iowrite32be(be32_to_cpu(ucode->eccr),
+		iowrite32be(be32_to_cpu(ucode->eccr),
 			       &qe_immr->rsp[i].eccr);
 	}
 
diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index 0390af999900..3f711c1a0996 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -222,13 +222,13 @@ static struct qe_ic_info qe_ic_info[] = {
 
 static inline u32 qe_ic_read(__be32  __iomem *base, unsigned int reg)
 {
-	return qe_ioread32be(base + (reg >> 2));
+	return ioread32be(base + (reg >> 2));
 }
 
 static inline void qe_ic_write(__be32  __iomem *base, unsigned int reg,
 			       u32 value)
 {
-	qe_iowrite32be(value, base + (reg >> 2));
+	iowrite32be(value, base + (reg >> 2));
 }
 
 static inline struct qe_ic *qe_ic_from_irq(unsigned int virq)
diff --git a/drivers/soc/fsl/qe/qe_io.c b/drivers/soc/fsl/qe/qe_io.c
index 11ea08e97db7..e277c827bdf3 100644
--- a/drivers/soc/fsl/qe/qe_io.c
+++ b/drivers/soc/fsl/qe/qe_io.c
@@ -54,16 +54,16 @@ void __par_io_config_pin(struct qe_pio_regs __iomem *par_io, u8 pin, int dir,
 	pin_mask1bit = (u32) (1 << (QE_PIO_PINS - (pin + 1)));
 
 	/* Set open drain, if required */
-	tmp_val = qe_ioread32be(&par_io->cpodr);
+	tmp_val = ioread32be(&par_io->cpodr);
 	if (open_drain)
-		qe_iowrite32be(pin_mask1bit | tmp_val, &par_io->cpodr);
+		iowrite32be(pin_mask1bit | tmp_val, &par_io->cpodr);
 	else
-		qe_iowrite32be(~pin_mask1bit & tmp_val, &par_io->cpodr);
+		iowrite32be(~pin_mask1bit & tmp_val, &par_io->cpodr);
 
 	/* define direction */
 	tmp_val = (pin > (QE_PIO_PINS / 2) - 1) ?
-		qe_ioread32be(&par_io->cpdir2) :
-		qe_ioread32be(&par_io->cpdir1);
+		ioread32be(&par_io->cpdir2) :
+		ioread32be(&par_io->cpdir1);
 
 	/* get all bits mask for 2 bit per port */
 	pin_mask2bits = (u32) (0x3 << (QE_PIO_PINS -
@@ -75,30 +75,30 @@ void __par_io_config_pin(struct qe_pio_regs __iomem *par_io, u8 pin, int dir,
 
 	/* clear and set 2 bits mask */
 	if (pin > (QE_PIO_PINS / 2) - 1) {
-		qe_iowrite32be(~pin_mask2bits & tmp_val, &par_io->cpdir2);
+		iowrite32be(~pin_mask2bits & tmp_val, &par_io->cpdir2);
 		tmp_val &= ~pin_mask2bits;
-		qe_iowrite32be(new_mask2bits | tmp_val, &par_io->cpdir2);
+		iowrite32be(new_mask2bits | tmp_val, &par_io->cpdir2);
 	} else {
-		qe_iowrite32be(~pin_mask2bits & tmp_val, &par_io->cpdir1);
+		iowrite32be(~pin_mask2bits & tmp_val, &par_io->cpdir1);
 		tmp_val &= ~pin_mask2bits;
-		qe_iowrite32be(new_mask2bits | tmp_val, &par_io->cpdir1);
+		iowrite32be(new_mask2bits | tmp_val, &par_io->cpdir1);
 	}
 	/* define pin assignment */
 	tmp_val = (pin > (QE_PIO_PINS / 2) - 1) ?
-		qe_ioread32be(&par_io->cppar2) :
-		qe_ioread32be(&par_io->cppar1);
+		ioread32be(&par_io->cppar2) :
+		ioread32be(&par_io->cppar1);
 
 	new_mask2bits = (u32) (assignment << (QE_PIO_PINS -
 			(pin % (QE_PIO_PINS / 2) + 1) * 2));
 	/* clear and set 2 bits mask */
 	if (pin > (QE_PIO_PINS / 2) - 1) {
-		qe_iowrite32be(~pin_mask2bits & tmp_val, &par_io->cppar2);
+		iowrite32be(~pin_mask2bits & tmp_val, &par_io->cppar2);
 		tmp_val &= ~pin_mask2bits;
-		qe_iowrite32be(new_mask2bits | tmp_val, &par_io->cppar2);
+		iowrite32be(new_mask2bits | tmp_val, &par_io->cppar2);
 	} else {
-		qe_iowrite32be(~pin_mask2bits & tmp_val, &par_io->cppar1);
+		iowrite32be(~pin_mask2bits & tmp_val, &par_io->cppar1);
 		tmp_val &= ~pin_mask2bits;
-		qe_iowrite32be(new_mask2bits | tmp_val, &par_io->cppar1);
+		iowrite32be(new_mask2bits | tmp_val, &par_io->cppar1);
 	}
 }
 EXPORT_SYMBOL(__par_io_config_pin);
@@ -126,12 +126,12 @@ int par_io_data_set(u8 port, u8 pin, u8 val)
 	/* calculate pin location */
 	pin_mask = (u32) (1 << (QE_PIO_PINS - 1 - pin));
 
-	tmp_val = qe_ioread32be(&par_io[port].cpdata);
+	tmp_val = ioread32be(&par_io[port].cpdata);
 
 	if (val == 0)		/* clear */
-		qe_iowrite32be(~pin_mask & tmp_val, &par_io[port].cpdata);
+		iowrite32be(~pin_mask & tmp_val, &par_io[port].cpdata);
 	else			/* set */
-		qe_iowrite32be(pin_mask | tmp_val, &par_io[port].cpdata);
+		iowrite32be(pin_mask | tmp_val, &par_io[port].cpdata);
 
 	return 0;
 }
diff --git a/drivers/soc/fsl/qe/ucc_fast.c b/drivers/soc/fsl/qe/ucc_fast.c
index ad6193ea4597..53d8aafc9317 100644
--- a/drivers/soc/fsl/qe/ucc_fast.c
+++ b/drivers/soc/fsl/qe/ucc_fast.c
@@ -29,42 +29,42 @@ void ucc_fast_dump_regs(struct ucc_fast_private * uccf)
 	printk(KERN_INFO "Base address: 0x%p\n", uccf->uf_regs);
 
 	printk(KERN_INFO "gumr  : addr=0x%p, val=0x%08x\n",
-		  &uccf->uf_regs->gumr, qe_ioread32be(&uccf->uf_regs->gumr));
+		  &uccf->uf_regs->gumr, ioread32be(&uccf->uf_regs->gumr));
 	printk(KERN_INFO "upsmr : addr=0x%p, val=0x%08x\n",
-		  &uccf->uf_regs->upsmr, qe_ioread32be(&uccf->uf_regs->upsmr));
+		  &uccf->uf_regs->upsmr, ioread32be(&uccf->uf_regs->upsmr));
 	printk(KERN_INFO "utodr : addr=0x%p, val=0x%04x\n",
-		  &uccf->uf_regs->utodr, qe_ioread16be(&uccf->uf_regs->utodr));
+		  &uccf->uf_regs->utodr, ioread16be(&uccf->uf_regs->utodr));
 	printk(KERN_INFO "udsr  : addr=0x%p, val=0x%04x\n",
-		  &uccf->uf_regs->udsr, qe_ioread16be(&uccf->uf_regs->udsr));
+		  &uccf->uf_regs->udsr, ioread16be(&uccf->uf_regs->udsr));
 	printk(KERN_INFO "ucce  : addr=0x%p, val=0x%08x\n",
-		  &uccf->uf_regs->ucce, qe_ioread32be(&uccf->uf_regs->ucce));
+		  &uccf->uf_regs->ucce, ioread32be(&uccf->uf_regs->ucce));
 	printk(KERN_INFO "uccm  : addr=0x%p, val=0x%08x\n",
-		  &uccf->uf_regs->uccm, qe_ioread32be(&uccf->uf_regs->uccm));
+		  &uccf->uf_regs->uccm, ioread32be(&uccf->uf_regs->uccm));
 	printk(KERN_INFO "uccs  : addr=0x%p, val=0x%02x\n",
-		  &uccf->uf_regs->uccs, qe_ioread8(&uccf->uf_regs->uccs));
+		  &uccf->uf_regs->uccs, ioread8(&uccf->uf_regs->uccs));
 	printk(KERN_INFO "urfb  : addr=0x%p, val=0x%08x\n",
-		  &uccf->uf_regs->urfb, qe_ioread32be(&uccf->uf_regs->urfb));
+		  &uccf->uf_regs->urfb, ioread32be(&uccf->uf_regs->urfb));
 	printk(KERN_INFO "urfs  : addr=0x%p, val=0x%04x\n",
-		  &uccf->uf_regs->urfs, qe_ioread16be(&uccf->uf_regs->urfs));
+		  &uccf->uf_regs->urfs, ioread16be(&uccf->uf_regs->urfs));
 	printk(KERN_INFO "urfet : addr=0x%p, val=0x%04x\n",
-		  &uccf->uf_regs->urfet, qe_ioread16be(&uccf->uf_regs->urfet));
+		  &uccf->uf_regs->urfet, ioread16be(&uccf->uf_regs->urfet));
 	printk(KERN_INFO "urfset: addr=0x%p, val=0x%04x\n",
 		  &uccf->uf_regs->urfset,
-		  qe_ioread16be(&uccf->uf_regs->urfset));
+		  ioread16be(&uccf->uf_regs->urfset));
 	printk(KERN_INFO "utfb  : addr=0x%p, val=0x%08x\n",
-		  &uccf->uf_regs->utfb, qe_ioread32be(&uccf->uf_regs->utfb));
+		  &uccf->uf_regs->utfb, ioread32be(&uccf->uf_regs->utfb));
 	printk(KERN_INFO "utfs  : addr=0x%p, val=0x%04x\n",
-		  &uccf->uf_regs->utfs, qe_ioread16be(&uccf->uf_regs->utfs));
+		  &uccf->uf_regs->utfs, ioread16be(&uccf->uf_regs->utfs));
 	printk(KERN_INFO "utfet : addr=0x%p, val=0x%04x\n",
-		  &uccf->uf_regs->utfet, qe_ioread16be(&uccf->uf_regs->utfet));
+		  &uccf->uf_regs->utfet, ioread16be(&uccf->uf_regs->utfet));
 	printk(KERN_INFO "utftt : addr=0x%p, val=0x%04x\n",
-		  &uccf->uf_regs->utftt, qe_ioread16be(&uccf->uf_regs->utftt));
+		  &uccf->uf_regs->utftt, ioread16be(&uccf->uf_regs->utftt));
 	printk(KERN_INFO "utpt  : addr=0x%p, val=0x%04x\n",
-		  &uccf->uf_regs->utpt, qe_ioread16be(&uccf->uf_regs->utpt));
+		  &uccf->uf_regs->utpt, ioread16be(&uccf->uf_regs->utpt));
 	printk(KERN_INFO "urtry : addr=0x%p, val=0x%08x\n",
-		  &uccf->uf_regs->urtry, qe_ioread32be(&uccf->uf_regs->urtry));
+		  &uccf->uf_regs->urtry, ioread32be(&uccf->uf_regs->urtry));
 	printk(KERN_INFO "guemr : addr=0x%p, val=0x%02x\n",
-		  &uccf->uf_regs->guemr, qe_ioread8(&uccf->uf_regs->guemr));
+		  &uccf->uf_regs->guemr, ioread8(&uccf->uf_regs->guemr));
 }
 EXPORT_SYMBOL(ucc_fast_dump_regs);
 
@@ -86,7 +86,7 @@ EXPORT_SYMBOL(ucc_fast_get_qe_cr_subblock);
 
 void ucc_fast_transmit_on_demand(struct ucc_fast_private * uccf)
 {
-	qe_iowrite16be(UCC_FAST_TOD, &uccf->uf_regs->utodr);
+	iowrite16be(UCC_FAST_TOD, &uccf->uf_regs->utodr);
 }
 EXPORT_SYMBOL(ucc_fast_transmit_on_demand);
 
@@ -98,7 +98,7 @@ void ucc_fast_enable(struct ucc_fast_private * uccf, enum comm_dir mode)
 	uf_regs = uccf->uf_regs;
 
 	/* Enable reception and/or transmission on this UCC. */
-	gumr = qe_ioread32be(&uf_regs->gumr);
+	gumr = ioread32be(&uf_regs->gumr);
 	if (mode & COMM_DIR_TX) {
 		gumr |= UCC_FAST_GUMR_ENT;
 		uccf->enabled_tx = 1;
@@ -107,7 +107,7 @@ void ucc_fast_enable(struct ucc_fast_private * uccf, enum comm_dir mode)
 		gumr |= UCC_FAST_GUMR_ENR;
 		uccf->enabled_rx = 1;
 	}
-	qe_iowrite32be(gumr, &uf_regs->gumr);
+	iowrite32be(gumr, &uf_regs->gumr);
 }
 EXPORT_SYMBOL(ucc_fast_enable);
 
@@ -119,7 +119,7 @@ void ucc_fast_disable(struct ucc_fast_private * uccf, enum comm_dir mode)
 	uf_regs = uccf->uf_regs;
 
 	/* Disable reception and/or transmission on this UCC. */
-	gumr = qe_ioread32be(&uf_regs->gumr);
+	gumr = ioread32be(&uf_regs->gumr);
 	if (mode & COMM_DIR_TX) {
 		gumr &= ~UCC_FAST_GUMR_ENT;
 		uccf->enabled_tx = 0;
@@ -128,7 +128,7 @@ void ucc_fast_disable(struct ucc_fast_private * uccf, enum comm_dir mode)
 		gumr &= ~UCC_FAST_GUMR_ENR;
 		uccf->enabled_rx = 0;
 	}
-	qe_iowrite32be(gumr, &uf_regs->gumr);
+	iowrite32be(gumr, &uf_regs->gumr);
 }
 EXPORT_SYMBOL(ucc_fast_disable);
 
@@ -262,7 +262,7 @@ int ucc_fast_init(struct ucc_fast_info * uf_info, struct ucc_fast_private ** ucc
 	gumr |= uf_info->tenc;
 	gumr |= uf_info->tcrc;
 	gumr |= uf_info->mode;
-	qe_iowrite32be(gumr, &uf_regs->gumr);
+	iowrite32be(gumr, &uf_regs->gumr);
 
 	/* Allocate memory for Tx Virtual Fifo */
 	uccf->ucc_fast_tx_virtual_fifo_base_offset =
@@ -287,16 +287,16 @@ int ucc_fast_init(struct ucc_fast_info * uf_info, struct ucc_fast_private ** ucc
 	}
 
 	/* Set Virtual Fifo registers */
-	qe_iowrite16be(uf_info->urfs, &uf_regs->urfs);
-	qe_iowrite16be(uf_info->urfet, &uf_regs->urfet);
-	qe_iowrite16be(uf_info->urfset, &uf_regs->urfset);
-	qe_iowrite16be(uf_info->utfs, &uf_regs->utfs);
-	qe_iowrite16be(uf_info->utfet, &uf_regs->utfet);
-	qe_iowrite16be(uf_info->utftt, &uf_regs->utftt);
+	iowrite16be(uf_info->urfs, &uf_regs->urfs);
+	iowrite16be(uf_info->urfet, &uf_regs->urfet);
+	iowrite16be(uf_info->urfset, &uf_regs->urfset);
+	iowrite16be(uf_info->utfs, &uf_regs->utfs);
+	iowrite16be(uf_info->utfet, &uf_regs->utfet);
+	iowrite16be(uf_info->utftt, &uf_regs->utftt);
 	/* utfb, urfb are offsets from MURAM base */
-	qe_iowrite32be(uccf->ucc_fast_tx_virtual_fifo_base_offset,
+	iowrite32be(uccf->ucc_fast_tx_virtual_fifo_base_offset,
 		       &uf_regs->utfb);
-	qe_iowrite32be(uccf->ucc_fast_rx_virtual_fifo_base_offset,
+	iowrite32be(uccf->ucc_fast_rx_virtual_fifo_base_offset,
 		       &uf_regs->urfb);
 
 	/* Mux clocking */
@@ -365,14 +365,14 @@ int ucc_fast_init(struct ucc_fast_info * uf_info, struct ucc_fast_private ** ucc
 	}
 
 	/* Set interrupt mask register at UCC level. */
-	qe_iowrite32be(uf_info->uccm_mask, &uf_regs->uccm);
+	iowrite32be(uf_info->uccm_mask, &uf_regs->uccm);
 
 	/* First, clear anything pending at UCC level,
 	 * otherwise, old garbage may come through
 	 * as soon as the dam is opened. */
 
 	/* Writing '1' clears */
-	qe_iowrite32be(0xffffffff, &uf_regs->ucce);
+	iowrite32be(0xffffffff, &uf_regs->ucce);
 
 	*uccf_ret = uccf;
 	return 0;
diff --git a/drivers/soc/fsl/qe/ucc_slow.c b/drivers/soc/fsl/qe/ucc_slow.c
index 7e11be41ab62..d5ac1ac0ed3c 100644
--- a/drivers/soc/fsl/qe/ucc_slow.c
+++ b/drivers/soc/fsl/qe/ucc_slow.c
@@ -78,7 +78,7 @@ void ucc_slow_enable(struct ucc_slow_private * uccs, enum comm_dir mode)
 	us_regs = uccs->us_regs;
 
 	/* Enable reception and/or transmission on this UCC. */
-	gumr_l = qe_ioread32be(&us_regs->gumr_l);
+	gumr_l = ioread32be(&us_regs->gumr_l);
 	if (mode & COMM_DIR_TX) {
 		gumr_l |= UCC_SLOW_GUMR_L_ENT;
 		uccs->enabled_tx = 1;
@@ -87,7 +87,7 @@ void ucc_slow_enable(struct ucc_slow_private * uccs, enum comm_dir mode)
 		gumr_l |= UCC_SLOW_GUMR_L_ENR;
 		uccs->enabled_rx = 1;
 	}
-	qe_iowrite32be(gumr_l, &us_regs->gumr_l);
+	iowrite32be(gumr_l, &us_regs->gumr_l);
 }
 EXPORT_SYMBOL(ucc_slow_enable);
 
@@ -99,7 +99,7 @@ void ucc_slow_disable(struct ucc_slow_private * uccs, enum comm_dir mode)
 	us_regs = uccs->us_regs;
 
 	/* Disable reception and/or transmission on this UCC. */
-	gumr_l = qe_ioread32be(&us_regs->gumr_l);
+	gumr_l = ioread32be(&us_regs->gumr_l);
 	if (mode & COMM_DIR_TX) {
 		gumr_l &= ~UCC_SLOW_GUMR_L_ENT;
 		uccs->enabled_tx = 0;
@@ -108,7 +108,7 @@ void ucc_slow_disable(struct ucc_slow_private * uccs, enum comm_dir mode)
 		gumr_l &= ~UCC_SLOW_GUMR_L_ENR;
 		uccs->enabled_rx = 0;
 	}
-	qe_iowrite32be(gumr_l, &us_regs->gumr_l);
+	iowrite32be(gumr_l, &us_regs->gumr_l);
 }
 EXPORT_SYMBOL(ucc_slow_disable);
 
@@ -194,7 +194,7 @@ int ucc_slow_init(struct ucc_slow_info * us_info, struct ucc_slow_private ** ucc
 		return ret;
 	}
 
-	qe_iowrite16be(us_info->max_rx_buf_length, &uccs->us_pram->mrblr);
+	iowrite16be(us_info->max_rx_buf_length, &uccs->us_pram->mrblr);
 
 	INIT_LIST_HEAD(&uccs->confQ);
 
@@ -222,27 +222,27 @@ int ucc_slow_init(struct ucc_slow_info * us_info, struct ucc_slow_private ** ucc
 	bd = uccs->confBd = uccs->tx_bd = qe_muram_addr(uccs->tx_base_offset);
 	for (i = 0; i < us_info->tx_bd_ring_len - 1; i++) {
 		/* clear bd buffer */
-		qe_iowrite32be(0, &bd->buf);
+		iowrite32be(0, &bd->buf);
 		/* set bd status and length */
-		qe_iowrite32be(0, (u32 __iomem *)bd);
+		iowrite32be(0, (u32 __iomem *)bd);
 		bd++;
 	}
 	/* for last BD set Wrap bit */
-	qe_iowrite32be(0, &bd->buf);
-	qe_iowrite32be(T_W, (u32 __iomem *)bd);
+	iowrite32be(0, &bd->buf);
+	iowrite32be(T_W, (u32 __iomem *)bd);
 
 	/* Init Rx bds */
 	bd = uccs->rx_bd = qe_muram_addr(uccs->rx_base_offset);
 	for (i = 0; i < us_info->rx_bd_ring_len - 1; i++) {
 		/* set bd status and length */
-		qe_iowrite32be(0, (u32 __iomem *)bd);
+		iowrite32be(0, (u32 __iomem *)bd);
 		/* clear bd buffer */
-		qe_iowrite32be(0, &bd->buf);
+		iowrite32be(0, &bd->buf);
 		bd++;
 	}
 	/* for last BD set Wrap bit */
-	qe_iowrite32be(R_W, (u32 __iomem *)bd);
-	qe_iowrite32be(0, &bd->buf);
+	iowrite32be(R_W, (u32 __iomem *)bd);
+	iowrite32be(0, &bd->buf);
 
 	/* Set GUMR (For more details see the hardware spec.). */
 	/* gumr_h */
@@ -263,7 +263,7 @@ int ucc_slow_init(struct ucc_slow_info * us_info, struct ucc_slow_private ** ucc
 		gumr |= UCC_SLOW_GUMR_H_TXSY;
 	if (us_info->rtsm)
 		gumr |= UCC_SLOW_GUMR_H_RTSM;
-	qe_iowrite32be(gumr, &us_regs->gumr_h);
+	iowrite32be(gumr, &us_regs->gumr_h);
 
 	/* gumr_l */
 	gumr = (u32)us_info->tdcr | (u32)us_info->rdcr | (u32)us_info->tenc |
@@ -276,18 +276,18 @@ int ucc_slow_init(struct ucc_slow_info * us_info, struct ucc_slow_private ** ucc
 		gumr |= UCC_SLOW_GUMR_L_TINV;
 	if (us_info->tend)
 		gumr |= UCC_SLOW_GUMR_L_TEND;
-	qe_iowrite32be(gumr, &us_regs->gumr_l);
+	iowrite32be(gumr, &us_regs->gumr_l);
 
 	/* Function code registers */
 
 	/* if the data is in cachable memory, the 'global' */
 	/* in the function code should be set. */
-	qe_iowrite8(UCC_BMR_BO_BE, &uccs->us_pram->tbmr);
-	qe_iowrite8(UCC_BMR_BO_BE, &uccs->us_pram->rbmr);
+	iowrite8(UCC_BMR_BO_BE, &uccs->us_pram->tbmr);
+	iowrite8(UCC_BMR_BO_BE, &uccs->us_pram->rbmr);
 
 	/* rbase, tbase are offsets from MURAM base */
-	qe_iowrite16be(uccs->rx_base_offset, &uccs->us_pram->rbase);
-	qe_iowrite16be(uccs->tx_base_offset, &uccs->us_pram->tbase);
+	iowrite16be(uccs->rx_base_offset, &uccs->us_pram->rbase);
+	iowrite16be(uccs->tx_base_offset, &uccs->us_pram->tbase);
 
 	/* Mux clocking */
 	/* Grant Support */
@@ -317,14 +317,14 @@ int ucc_slow_init(struct ucc_slow_info * us_info, struct ucc_slow_private ** ucc
 	}
 
 	/* Set interrupt mask register at UCC level. */
-	qe_iowrite16be(us_info->uccm_mask, &us_regs->uccm);
+	iowrite16be(us_info->uccm_mask, &us_regs->uccm);
 
 	/* First, clear anything pending at UCC level,
 	 * otherwise, old garbage may come through
 	 * as soon as the dam is opened. */
 
 	/* Writing '1' clears */
-	qe_iowrite16be(0xffff, &us_regs->ucce);
+	iowrite16be(0xffff, &us_regs->ucce);
 
 	/* Issue QE Init command */
 	if (us_info->init_tx && us_info->init_rx)
-- 
2.25.0

