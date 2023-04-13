Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B816E06CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 08:17:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pxq9y08Wfz3fRY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 16:17:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pxq9Q670Tz3cgR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 16:16:57 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pmqGD-0000f0-9t; Thu, 13 Apr 2023 08:16:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pmqGB-00AuJd-0S; Thu, 13 Apr 2023 08:16:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pmqGA-00CntW-6A; Thu, 13 Apr 2023 08:16:42 +0200
Date: Thu, 13 Apr 2023 08:16:42 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: Drop MPC5200 LocalPlus bus FIFO driver
Message-ID: <20230413061642.kqkor4wkt7lp2mhp@pengutronix.de>
References: <20221228145129.31700-1-u.kleine-koenig@pengutronix.de>
 <20230412150524.ojsvukh47hing6db@pengutronix.de>
 <87zg7cabf6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4z3dj3khfkyi65vz"
Content-Disposition: inline
In-Reply-To: <87zg7cabf6.fsf@mpe.ellerman.id.au>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: Anatolij Gustschin <agust@denx.de>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--4z3dj3khfkyi65vz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

While mpc5200b.dtsi contains a device that this driver can bind to, the
only purpose of a bound device is to be used by the four exported functions
mpc52xx_lpbfifo_submit(), mpc52xx_lpbfifo_abort(), mpc52xx_lpbfifo_poll()
and mpc52xx_lpbfifo_start_xfer(). However there are no callers to this
function and so the driver is effectively superfluous and can be deleted.
Also drop some defines and a struct from <asm/mpc52xx.h> that are unused
now together with the declarations of the four mentioned functions.

Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
---

Hello Michael,

On Thu, Apr 13, 2023 at 10:11:25AM +1000, Michael Ellerman wrote:
> Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> writes:
> > On Wed, Dec 28, 2022 at 03:51:29PM +0100, Uwe Kleine-K=F6nig wrote:
> >> The four exported functions mpc52xx_lpbfifo_submit(),
> >> mpc52xx_lpbfifo_abort(), mpc52xx_lpbfifo_poll(), and
> >> mpc52xx_lpbfifo_start_xfer() are not used. So they can be dropped and =
the
> >> definitions needed to call them can be moved into the driver file.
> >>=20
> >> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >
> > I never got feedback about this driver and it has not appeared in next
> > up to now. Did it fell through the cracks?
>=20
> Yeah. I was hoping someone would explain what's going on with the
> driver.
>=20
> Presumably there are some out-of-tree drivers that use the routines
> provided by this driver?

I googled for the function names but the only related hits were
references to this thread :-)

> I think rather than merging this patch, which keeps the code but makes
> it completely useless, do you mind sending a patch to remove the whole
> driver? Maybe that will get someone's attention.

fair enough, here it is.

Best regards
Uwe

 arch/powerpc/include/asm/mpc52xx.h            |  41 --
 arch/powerpc/platforms/52xx/Kconfig           |   5 -
 arch/powerpc/platforms/52xx/Makefile          |   2 -
 arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c | 594 ------------------
 4 files changed, 642 deletions(-)
 delete mode 100644 arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c

diff --git a/arch/powerpc/include/asm/mpc52xx.h b/arch/powerpc/include/asm/=
mpc52xx.h
index 5ea16a71c2f0..01ae6c351e50 100644
--- a/arch/powerpc/include/asm/mpc52xx.h
+++ b/arch/powerpc/include/asm/mpc52xx.h
@@ -285,47 +285,6 @@ extern int mpc52xx_gpt_start_timer(struct mpc52xx_gpt_=
priv *gpt, u64 period,
 extern u64 mpc52xx_gpt_timer_period(struct mpc52xx_gpt_priv *gpt);
 extern int mpc52xx_gpt_stop_timer(struct mpc52xx_gpt_priv *gpt);
=20
-/* mpc52xx_lpbfifo.c */
-#define MPC52XX_LPBFIFO_FLAG_READ		(0)
-#define MPC52XX_LPBFIFO_FLAG_WRITE		(1<<0)
-#define MPC52XX_LPBFIFO_FLAG_NO_INCREMENT	(1<<1)
-#define MPC52XX_LPBFIFO_FLAG_NO_DMA		(1<<2)
-#define MPC52XX_LPBFIFO_FLAG_POLL_DMA		(1<<3)
-
-struct mpc52xx_lpbfifo_request {
-	struct list_head list;
-
-	/* localplus bus address */
-	unsigned int cs;
-	size_t offset;
-
-	/* Memory address */
-	void *data;
-	phys_addr_t data_phys;
-
-	/* Details of transfer */
-	size_t size;
-	size_t pos;	/* current position of transfer */
-	int flags;
-	int defer_xfer_start;
-
-	/* What to do when finished */
-	void (*callback)(struct mpc52xx_lpbfifo_request *);
-
-	void *priv;		/* Driver private data */
-
-	/* statistics */
-	int irq_count;
-	int irq_ticks;
-	u8 last_byte;
-	int buffer_not_done_cnt;
-};
-
-extern int mpc52xx_lpbfifo_submit(struct mpc52xx_lpbfifo_request *req);
-extern void mpc52xx_lpbfifo_abort(struct mpc52xx_lpbfifo_request *req);
-extern void mpc52xx_lpbfifo_poll(void);
-extern int mpc52xx_lpbfifo_start_xfer(struct mpc52xx_lpbfifo_request *req);
-
 /* mpc52xx_pic.c */
 extern void mpc52xx_init_irq(void);
 extern unsigned int mpc52xx_get_irq(void);
diff --git a/arch/powerpc/platforms/52xx/Kconfig b/arch/powerpc/platforms/5=
2xx/Kconfig
index b72ed2950ca8..384e4bef2c28 100644
--- a/arch/powerpc/platforms/52xx/Kconfig
+++ b/arch/powerpc/platforms/52xx/Kconfig
@@ -54,8 +54,3 @@ config PPC_MPC5200_BUGFIX
 	  for MPC5200B based boards.
=20
 	  It is safe to say 'Y' here
-
-config PPC_MPC5200_LPBFIFO
-	tristate "MPC5200 LocalPlus bus FIFO driver"
-	depends on PPC_MPC52xx && PPC_BESTCOMM
-	select PPC_BESTCOMM_GEN_BD
diff --git a/arch/powerpc/platforms/52xx/Makefile b/arch/powerpc/platforms/=
52xx/Makefile
index f40d48eab779..1b1f72d83342 100644
--- a/arch/powerpc/platforms/52xx/Makefile
+++ b/arch/powerpc/platforms/52xx/Makefile
@@ -14,5 +14,3 @@ obj-$(CONFIG_PM)		+=3D mpc52xx_sleep.o mpc52xx_pm.o
 ifdef CONFIG_PPC_LITE5200
 	obj-$(CONFIG_PM)	+=3D lite5200_sleep.o lite5200_pm.o
 endif
-
-obj-$(CONFIG_PPC_MPC5200_LPBFIFO)	+=3D mpc52xx_lpbfifo.o
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c b/arch/powerpc/p=
latforms/52xx/mpc52xx_lpbfifo.c
deleted file mode 100644
index 6d1dd6e87478..000000000000
--- a/arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c
+++ /dev/null
@@ -1,594 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * LocalPlus Bus FIFO driver for the Freescale MPC52xx.
- *
- * Copyright (C) 2009 Secret Lab Technologies Ltd.
- *
- * Todo:
- * - Add support for multiple requests to be queued.
- */
-
-#include <linux/interrupt.h>
-#include <linux/kernel.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/of_platform.h>
-#include <linux/spinlock.h>
-#include <linux/module.h>
-#include <asm/io.h>
-#include <asm/mpc52xx.h>
-#include <asm/time.h>
-
-#include <linux/fsl/bestcomm/bestcomm.h>
-#include <linux/fsl/bestcomm/bestcomm_priv.h>
-#include <linux/fsl/bestcomm/gen_bd.h>
-
-MODULE_AUTHOR("Grant Likely <grant.likely@secretlab.ca>");
-MODULE_DESCRIPTION("MPC5200 LocalPlus FIFO device driver");
-MODULE_LICENSE("GPL");
-
-#define LPBFIFO_REG_PACKET_SIZE		(0x00)
-#define LPBFIFO_REG_START_ADDRESS	(0x04)
-#define LPBFIFO_REG_CONTROL		(0x08)
-#define LPBFIFO_REG_ENABLE		(0x0C)
-#define LPBFIFO_REG_BYTES_DONE_STATUS	(0x14)
-#define LPBFIFO_REG_FIFO_DATA		(0x40)
-#define LPBFIFO_REG_FIFO_STATUS		(0x44)
-#define LPBFIFO_REG_FIFO_CONTROL	(0x48)
-#define LPBFIFO_REG_FIFO_ALARM		(0x4C)
-
-struct mpc52xx_lpbfifo {
-	struct device *dev;
-	phys_addr_t regs_phys;
-	void __iomem *regs;
-	int irq;
-	spinlock_t lock;
-
-	struct bcom_task *bcom_tx_task;
-	struct bcom_task *bcom_rx_task;
-	struct bcom_task *bcom_cur_task;
-
-	/* Current state data */
-	struct mpc52xx_lpbfifo_request *req;
-	int dma_irqs_enabled;
-};
-
-/* The MPC5200 has only one fifo, so only need one instance structure */
-static struct mpc52xx_lpbfifo lpbfifo;
-
-/**
- * mpc52xx_lpbfifo_kick - Trigger the next block of data to be transferred
- *
- * @req: Pointer to request structure
- */
-static void mpc52xx_lpbfifo_kick(struct mpc52xx_lpbfifo_request *req)
-{
-	size_t transfer_size =3D req->size - req->pos;
-	struct bcom_bd *bd;
-	void __iomem *reg;
-	u32 *data;
-	int i;
-	int bit_fields;
-	int dma =3D !(req->flags & MPC52XX_LPBFIFO_FLAG_NO_DMA);
-	int write =3D req->flags & MPC52XX_LPBFIFO_FLAG_WRITE;
-	int poll_dma =3D req->flags & MPC52XX_LPBFIFO_FLAG_POLL_DMA;
-
-	/* Set and clear the reset bits; is good practice in User Manual */
-	out_be32(lpbfifo.regs + LPBFIFO_REG_ENABLE, 0x01010000);
-
-	/* set master enable bit */
-	out_be32(lpbfifo.regs + LPBFIFO_REG_ENABLE, 0x00000001);
-	if (!dma) {
-		/* While the FIFO can be setup for transfer sizes as large as
-		 * 16M-1, the FIFO itself is only 512 bytes deep and it does
-		 * not generate interrupts for FIFO full events (only transfer
-		 * complete will raise an IRQ).  Therefore when not using
-		 * Bestcomm to drive the FIFO it needs to either be polled, or
-		 * transfers need to constrained to the size of the fifo.
-		 *
-		 * This driver restricts the size of the transfer
-		 */
-		if (transfer_size > 512)
-			transfer_size =3D 512;
-
-		/* Load the FIFO with data */
-		if (write) {
-			reg =3D lpbfifo.regs + LPBFIFO_REG_FIFO_DATA;
-			data =3D req->data + req->pos;
-			for (i =3D 0; i < transfer_size; i +=3D 4)
-				out_be32(reg, *data++);
-		}
-
-		/* Unmask both error and completion irqs */
-		out_be32(lpbfifo.regs + LPBFIFO_REG_ENABLE, 0x00000301);
-	} else {
-		/* Choose the correct direction
-		 *
-		 * Configure the watermarks so DMA will always complete correctly.
-		 * It may be worth experimenting with the ALARM value to see if
-		 * there is a performance impact.  However, if it is wrong there
-		 * is a risk of DMA not transferring the last chunk of data
-		 */
-		if (write) {
-			out_be32(lpbfifo.regs + LPBFIFO_REG_FIFO_ALARM, 0x1e4);
-			out_8(lpbfifo.regs + LPBFIFO_REG_FIFO_CONTROL, 7);
-			lpbfifo.bcom_cur_task =3D lpbfifo.bcom_tx_task;
-		} else {
-			out_be32(lpbfifo.regs + LPBFIFO_REG_FIFO_ALARM, 0x1ff);
-			out_8(lpbfifo.regs + LPBFIFO_REG_FIFO_CONTROL, 0);
-			lpbfifo.bcom_cur_task =3D lpbfifo.bcom_rx_task;
-
-			if (poll_dma) {
-				if (lpbfifo.dma_irqs_enabled) {
-					disable_irq(bcom_get_task_irq(lpbfifo.bcom_rx_task));
-					lpbfifo.dma_irqs_enabled =3D 0;
-				}
-			} else {
-				if (!lpbfifo.dma_irqs_enabled) {
-					enable_irq(bcom_get_task_irq(lpbfifo.bcom_rx_task));
-					lpbfifo.dma_irqs_enabled =3D 1;
-				}
-			}
-		}
-
-		bd =3D bcom_prepare_next_buffer(lpbfifo.bcom_cur_task);
-		bd->status =3D transfer_size;
-		if (!write) {
-			/*
-			 * In the DMA read case, the DMA doesn't complete,
-			 * possibly due to incorrect watermarks in the ALARM
-			 * and CONTROL regs. For now instead of trying to
-			 * determine the right watermarks that will make this
-			 * work, just increase the number of bytes the FIFO is
-			 * expecting.
-			 *
-			 * When submitting another operation, the FIFO will get
-			 * reset, so the condition of the FIFO waiting for a
-			 * non-existent 4 bytes will get cleared.
-			 */
-			transfer_size +=3D 4; /* BLECH! */
-		}
-		bd->data[0] =3D req->data_phys + req->pos;
-		bcom_submit_next_buffer(lpbfifo.bcom_cur_task, NULL);
-
-		/* error irq & master enabled bit */
-		bit_fields =3D 0x00000201;
-
-		/* Unmask irqs */
-		if (write && (!poll_dma))
-			bit_fields |=3D 0x00000100; /* completion irq too */
-		out_be32(lpbfifo.regs + LPBFIFO_REG_ENABLE, bit_fields);
-	}
-
-	/* Set transfer size, width, chip select and READ mode */
-	out_be32(lpbfifo.regs + LPBFIFO_REG_START_ADDRESS,
-		 req->offset + req->pos);
-	out_be32(lpbfifo.regs + LPBFIFO_REG_PACKET_SIZE, transfer_size);
-
-	bit_fields =3D req->cs << 24 | 0x000008;
-	if (!write)
-		bit_fields |=3D 0x010000; /* read mode */
-	out_be32(lpbfifo.regs + LPBFIFO_REG_CONTROL, bit_fields);
-
-	/* Kick it off */
-	if (!lpbfifo.req->defer_xfer_start)
-		out_8(lpbfifo.regs + LPBFIFO_REG_PACKET_SIZE, 0x01);
-	if (dma)
-		bcom_enable(lpbfifo.bcom_cur_task);
-}
-
-/**
- * mpc52xx_lpbfifo_irq - IRQ handler for LPB FIFO
- * @irq: IRQ number to be handled
- * @dev_id: device ID cookie
- *
- * On transmit, the dma completion irq triggers before the fifo completion
- * triggers.  Handle the dma completion here instead of the LPB FIFO Bestc=
omm
- * task completion irq because everything is not really done until the LPB=
 FIFO
- * completion irq triggers.
- *
- * In other words:
- * For DMA, on receive, the "Fat Lady" is the bestcom completion irq. on
- * transmit, the fifo completion irq is the "Fat Lady". The opera (or in t=
his
- * case the DMA/FIFO operation) is not finished until the "Fat Lady" sings.
- *
- * Reasons for entering this routine:
- * 1) PIO mode rx and tx completion irq
- * 2) DMA interrupt mode tx completion irq
- * 3) DMA polled mode tx
- *
- * Exit conditions:
- * 1) Transfer aborted
- * 2) FIFO complete without DMA; more data to do
- * 3) FIFO complete without DMA; all data transferred
- * 4) FIFO complete using DMA
- *
- * Condition 1 can occur regardless of whether or not DMA is used.
- * It requires executing the callback to report the error and exiting
- * immediately.
- *
- * Condition 2 requires programming the FIFO with the next block of data
- *
- * Condition 3 requires executing the callback to report completion
- *
- * Condition 4 means the same as 3, except that we also retrieve the bcom
- * buffer so DMA doesn't get clogged up.
- *
- * To make things trickier, the spinlock must be dropped before
- * executing the callback, otherwise we could end up with a deadlock
- * or nested spinlock condition.  The out path is non-trivial, so
- * extra fiddling is done to make sure all paths lead to the same
- * outbound code.
- *
- * Return: irqreturn code (%IRQ_HANDLED)
- */
-static irqreturn_t mpc52xx_lpbfifo_irq(int irq, void *dev_id)
-{
-	struct mpc52xx_lpbfifo_request *req;
-	u32 status =3D in_8(lpbfifo.regs + LPBFIFO_REG_BYTES_DONE_STATUS);
-	void __iomem *reg;
-	u32 *data;
-	int count, i;
-	int do_callback =3D 0;
-	u32 ts;
-	unsigned long flags;
-	int dma, write, poll_dma;
-
-	spin_lock_irqsave(&lpbfifo.lock, flags);
-	ts =3D mftb();
-
-	req =3D lpbfifo.req;
-	if (!req) {
-		spin_unlock_irqrestore(&lpbfifo.lock, flags);
-		pr_err("bogus LPBFIFO IRQ\n");
-		return IRQ_HANDLED;
-	}
-
-	dma =3D !(req->flags & MPC52XX_LPBFIFO_FLAG_NO_DMA);
-	write =3D req->flags & MPC52XX_LPBFIFO_FLAG_WRITE;
-	poll_dma =3D req->flags & MPC52XX_LPBFIFO_FLAG_POLL_DMA;
-
-	if (dma && !write) {
-		spin_unlock_irqrestore(&lpbfifo.lock, flags);
-		pr_err("bogus LPBFIFO IRQ (dma and not writing)\n");
-		return IRQ_HANDLED;
-	}
-
-	if ((status & 0x01) =3D=3D 0) {
-		goto out;
-	}
-
-	/* check abort bit */
-	if (status & 0x10) {
-		out_be32(lpbfifo.regs + LPBFIFO_REG_ENABLE, 0x01010000);
-		do_callback =3D 1;
-		goto out;
-	}
-
-	/* Read result from hardware */
-	count =3D in_be32(lpbfifo.regs + LPBFIFO_REG_BYTES_DONE_STATUS);
-	count &=3D 0x00ffffff;
-
-	if (!dma && !write) {
-		/* copy the data out of the FIFO */
-		reg =3D lpbfifo.regs + LPBFIFO_REG_FIFO_DATA;
-		data =3D req->data + req->pos;
-		for (i =3D 0; i < count; i +=3D 4)
-			*data++ =3D in_be32(reg);
-	}
-
-	/* Update transfer position and count */
-	req->pos +=3D count;
-
-	/* Decide what to do next */
-	if (req->size - req->pos)
-		mpc52xx_lpbfifo_kick(req); /* more work to do */
-	else
-		do_callback =3D 1;
-
- out:
-	/* Clear the IRQ */
-	out_8(lpbfifo.regs + LPBFIFO_REG_BYTES_DONE_STATUS, 0x01);
-
-	if (dma && (status & 0x11)) {
-		/*
-		 * Count the DMA as complete only when the FIFO completion
-		 * status or abort bits are set.
-		 *
-		 * (status & 0x01) should always be the case except sometimes
-		 * when using polled DMA.
-		 *
-		 * (status & 0x10) {transfer aborted}: This case needs more
-		 * testing.
-		 */
-		bcom_retrieve_buffer(lpbfifo.bcom_cur_task, &status, NULL);
-	}
-	req->last_byte =3D ((u8 *)req->data)[req->size - 1];
-
-	/* When the do_callback flag is set; it means the transfer is finished
-	 * so set the FIFO as idle */
-	if (do_callback)
-		lpbfifo.req =3D NULL;
-
-	if (irq !=3D 0) /* don't increment on polled case */
-		req->irq_count++;
-
-	req->irq_ticks +=3D mftb() - ts;
-	spin_unlock_irqrestore(&lpbfifo.lock, flags);
-
-	/* Spinlock is released; it is now safe to call the callback */
-	if (do_callback && req->callback)
-		req->callback(req);
-
-	return IRQ_HANDLED;
-}
-
-/**
- * mpc52xx_lpbfifo_bcom_irq - IRQ handler for LPB FIFO Bestcomm task
- * @irq: IRQ number to be handled
- * @dev_id: device ID cookie
- *
- * Only used when receiving data.
- *
- * Return: irqreturn code (%IRQ_HANDLED)
- */
-static irqreturn_t mpc52xx_lpbfifo_bcom_irq(int irq, void *dev_id)
-{
-	struct mpc52xx_lpbfifo_request *req;
-	unsigned long flags;
-	u32 status;
-	u32 ts;
-
-	spin_lock_irqsave(&lpbfifo.lock, flags);
-	ts =3D mftb();
-
-	req =3D lpbfifo.req;
-	if (!req || (req->flags & MPC52XX_LPBFIFO_FLAG_NO_DMA)) {
-		spin_unlock_irqrestore(&lpbfifo.lock, flags);
-		return IRQ_HANDLED;
-	}
-
-	if (irq !=3D 0) /* don't increment on polled case */
-		req->irq_count++;
-
-	if (!bcom_buffer_done(lpbfifo.bcom_cur_task)) {
-		spin_unlock_irqrestore(&lpbfifo.lock, flags);
-
-		req->buffer_not_done_cnt++;
-		if ((req->buffer_not_done_cnt % 1000) =3D=3D 0)
-			pr_err("transfer stalled\n");
-
-		return IRQ_HANDLED;
-	}
-
-	bcom_retrieve_buffer(lpbfifo.bcom_cur_task, &status, NULL);
-
-	req->last_byte =3D ((u8 *)req->data)[req->size - 1];
-
-	req->pos =3D status & 0x00ffffff;
-
-	/* Mark the FIFO as idle */
-	lpbfifo.req =3D NULL;
-
-	/* Release the lock before calling out to the callback. */
-	req->irq_ticks +=3D mftb() - ts;
-	spin_unlock_irqrestore(&lpbfifo.lock, flags);
-
-	if (req->callback)
-		req->callback(req);
-
-	return IRQ_HANDLED;
-}
-
-/**
- * mpc52xx_lpbfifo_poll - Poll for DMA completion
- */
-void mpc52xx_lpbfifo_poll(void)
-{
-	struct mpc52xx_lpbfifo_request *req =3D lpbfifo.req;
-	int dma =3D !(req->flags & MPC52XX_LPBFIFO_FLAG_NO_DMA);
-	int write =3D req->flags & MPC52XX_LPBFIFO_FLAG_WRITE;
-
-	/*
-	 * For more information, see comments on the "Fat Lady"=20
-	 */
-	if (dma && write)
-		mpc52xx_lpbfifo_irq(0, NULL);
-	else=20
-		mpc52xx_lpbfifo_bcom_irq(0, NULL);
-}
-EXPORT_SYMBOL(mpc52xx_lpbfifo_poll);
-
-/**
- * mpc52xx_lpbfifo_submit - Submit an LPB FIFO transfer request.
- * @req: Pointer to request structure
- *
- * Return: %0 on success, -errno code on error
- */
-int mpc52xx_lpbfifo_submit(struct mpc52xx_lpbfifo_request *req)
-{
-	unsigned long flags;
-
-	if (!lpbfifo.regs)
-		return -ENODEV;
-
-	spin_lock_irqsave(&lpbfifo.lock, flags);
-
-	/* If the req pointer is already set, then a transfer is in progress */
-	if (lpbfifo.req) {
-		spin_unlock_irqrestore(&lpbfifo.lock, flags);
-		return -EBUSY;
-	}
-
-	/* Setup the transfer */
-	lpbfifo.req =3D req;
-	req->irq_count =3D 0;
-	req->irq_ticks =3D 0;
-	req->buffer_not_done_cnt =3D 0;
-	req->pos =3D 0;
-
-	mpc52xx_lpbfifo_kick(req);
-	spin_unlock_irqrestore(&lpbfifo.lock, flags);
-	return 0;
-}
-EXPORT_SYMBOL(mpc52xx_lpbfifo_submit);
-
-int mpc52xx_lpbfifo_start_xfer(struct mpc52xx_lpbfifo_request *req)
-{
-	unsigned long flags;
-
-	if (!lpbfifo.regs)
-		return -ENODEV;
-
-	spin_lock_irqsave(&lpbfifo.lock, flags);
-
-	/*
-	 * If the req pointer is already set and a transfer was
-	 * started on submit, then this transfer is in progress
-	 */
-	if (lpbfifo.req && !lpbfifo.req->defer_xfer_start) {
-		spin_unlock_irqrestore(&lpbfifo.lock, flags);
-		return -EBUSY;
-	}
-
-	/*
-	 * If the req was previously submitted but not
-	 * started, start it now
-	 */
-	if (lpbfifo.req && lpbfifo.req =3D=3D req &&
-	    lpbfifo.req->defer_xfer_start) {
-		out_8(lpbfifo.regs + LPBFIFO_REG_PACKET_SIZE, 0x01);
-	}
-
-	spin_unlock_irqrestore(&lpbfifo.lock, flags);
-	return 0;
-}
-EXPORT_SYMBOL(mpc52xx_lpbfifo_start_xfer);
-
-void mpc52xx_lpbfifo_abort(struct mpc52xx_lpbfifo_request *req)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&lpbfifo.lock, flags);
-	if (lpbfifo.req =3D=3D req) {
-		/* Put it into reset and clear the state */
-		bcom_gen_bd_rx_reset(lpbfifo.bcom_rx_task);
-		bcom_gen_bd_tx_reset(lpbfifo.bcom_tx_task);
-		out_be32(lpbfifo.regs + LPBFIFO_REG_ENABLE, 0x01010000);
-		lpbfifo.req =3D NULL;
-	}
-	spin_unlock_irqrestore(&lpbfifo.lock, flags);
-}
-EXPORT_SYMBOL(mpc52xx_lpbfifo_abort);
-
-static int mpc52xx_lpbfifo_probe(struct platform_device *op)
-{
-	struct resource res;
-	int rc =3D -ENOMEM;
-
-	if (lpbfifo.dev !=3D NULL)
-		return -ENOSPC;
-
-	lpbfifo.irq =3D irq_of_parse_and_map(op->dev.of_node, 0);
-	if (!lpbfifo.irq)
-		return -ENODEV;
-
-	if (of_address_to_resource(op->dev.of_node, 0, &res))
-		return -ENODEV;
-	lpbfifo.regs_phys =3D res.start;
-	lpbfifo.regs =3D of_iomap(op->dev.of_node, 0);
-	if (!lpbfifo.regs)
-		return -ENOMEM;
-
-	spin_lock_init(&lpbfifo.lock);
-
-	/* Put FIFO into reset */
-	out_be32(lpbfifo.regs + LPBFIFO_REG_ENABLE, 0x01010000);
-
-	/* Register the interrupt handler */
-	rc =3D request_irq(lpbfifo.irq, mpc52xx_lpbfifo_irq, 0,
-			 "mpc52xx-lpbfifo", &lpbfifo);
-	if (rc)
-		goto err_irq;
-
-	/* Request the Bestcomm receive (fifo --> memory) task and IRQ */
-	lpbfifo.bcom_rx_task =3D
-		bcom_gen_bd_rx_init(2, res.start + LPBFIFO_REG_FIFO_DATA,
-				    BCOM_INITIATOR_SCLPC, BCOM_IPR_SCLPC,
-				    16*1024*1024);
-	if (!lpbfifo.bcom_rx_task)
-		goto err_bcom_rx;
-
-	rc =3D request_irq(bcom_get_task_irq(lpbfifo.bcom_rx_task),
-			 mpc52xx_lpbfifo_bcom_irq, 0,
-			 "mpc52xx-lpbfifo-rx", &lpbfifo);
-	if (rc)
-		goto err_bcom_rx_irq;
-
-	lpbfifo.dma_irqs_enabled =3D 1;
-
-	/* Request the Bestcomm transmit (memory --> fifo) task and IRQ */
-	lpbfifo.bcom_tx_task =3D
-		bcom_gen_bd_tx_init(2, res.start + LPBFIFO_REG_FIFO_DATA,
-				    BCOM_INITIATOR_SCLPC, BCOM_IPR_SCLPC);
-	if (!lpbfifo.bcom_tx_task)
-		goto err_bcom_tx;
-
-	lpbfifo.dev =3D &op->dev;
-	return 0;
-
- err_bcom_tx:
-	free_irq(bcom_get_task_irq(lpbfifo.bcom_rx_task), &lpbfifo);
- err_bcom_rx_irq:
-	bcom_gen_bd_rx_release(lpbfifo.bcom_rx_task);
- err_bcom_rx:
-	free_irq(lpbfifo.irq, &lpbfifo);
- err_irq:
-	iounmap(lpbfifo.regs);
-	lpbfifo.regs =3D NULL;
-
-	dev_err(&op->dev, "mpc52xx_lpbfifo_probe() failed\n");
-	return -ENODEV;
-}
-
-
-static int mpc52xx_lpbfifo_remove(struct platform_device *op)
-{
-	if (lpbfifo.dev !=3D &op->dev)
-		return 0;
-
-	/* Put FIFO in reset */
-	out_be32(lpbfifo.regs + LPBFIFO_REG_ENABLE, 0x01010000);
-
-	/* Release the bestcomm transmit task */
-	free_irq(bcom_get_task_irq(lpbfifo.bcom_tx_task), &lpbfifo);
-	bcom_gen_bd_tx_release(lpbfifo.bcom_tx_task);
-=09
-	/* Release the bestcomm receive task */
-	free_irq(bcom_get_task_irq(lpbfifo.bcom_rx_task), &lpbfifo);
-	bcom_gen_bd_rx_release(lpbfifo.bcom_rx_task);
-
-	free_irq(lpbfifo.irq, &lpbfifo);
-	iounmap(lpbfifo.regs);
-	lpbfifo.regs =3D NULL;
-	lpbfifo.dev =3D NULL;
-
-	return 0;
-}
-
-static const struct of_device_id mpc52xx_lpbfifo_match[] =3D {
-	{ .compatible =3D "fsl,mpc5200-lpbfifo", },
-	{},
-};
-MODULE_DEVICE_TABLE(of, mpc52xx_lpbfifo_match);
-
-static struct platform_driver mpc52xx_lpbfifo_driver =3D {
-	.driver =3D {
-		.name =3D "mpc52xx-lpbfifo",
-		.of_match_table =3D mpc52xx_lpbfifo_match,
-	},
-	.probe =3D mpc52xx_lpbfifo_probe,
-	.remove =3D mpc52xx_lpbfifo_remove,
-};
-module_platform_driver(mpc52xx_lpbfifo_driver);

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
--=20
2.39.2

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4z3dj3khfkyi65vz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ3nkkACgkQj4D7WH0S
/k613gf/WNUDPjEdEoJ04g3K05ek9O6RQ9W6rVTnioKuJU9wsojSXkEuJow4962C
JcuxKoGixBnCS+s38cKKX5qQzwg1L2suH9eHSRvS5nIIbHy+r+QrdzPIfkfL/png
htKBs/svEsD5FIVPOs7oJojQ253FUKPjooXcEFjQjY6qH5aKUuzhgTJit8Me9rJ6
5AtgmWO/SFsL5OVHd0yZ24x0nZNQXhe23twrK2C3rJvKXS8yx7AwQexfZgfZlgNj
P7jaYGzYPg3HMV/uyF1yU7dIRdzbPIt4t+z+BGSy53w2DDe9yNmJnji8DGVMWEuC
0//PWGHAhKEVBdUEVLh1DCAS3dzBqg==
=tMmk
-----END PGP SIGNATURE-----

--4z3dj3khfkyi65vz--
