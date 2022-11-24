Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C049663724C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 07:20:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHntH559Jz3f3b
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 17:20:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ALEa6F/K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ALEa6F/K;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHnsK145jz3cG9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 17:19:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=P23NM4nqAWcCFp4nIBC+iBFsGGXl6v5G4NOLEXdr/Fo=; b=ALEa6F/KeLi9otJnpTEIXidIiY
	BFrnoWsAtTXugJqm+QRWGfg9/rmGmGBu/LbDgTioAVHHxH7fJDhZH35Gm4pyekz7M8+ErAUzlM7bz
	ufs3lnyNUorX6063iEGamdHk5TXDnowAkWn1qbcvt0RE0FBxE6haf0IUhO165E3eAyAiAN6vHr6su
	v3ROavVTG594onRGtOezIurHgM4IjcxYilnTs1MZMWmU7W2Gpg1abgB8KM+g7OUxjVGiniJH4IGV5
	c45CFGDxaDagLvx+PsEUMyYX4zjFcozktjd4Al17U1CUS9RQSKenqP2ceJXmmvlDmzI0hBm0mal4E
	BtrwWUTQ==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy5a6-008RmS-7B; Thu, 24 Nov 2022 06:19:30 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/mpc52xx_lpbfifo: fix all kernel-doc warnings
Date: Wed, 23 Nov 2022 22:19:18 -0800
Message-Id: <20221124061918.1967-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Anatolij Gustschin <agust@denx.de>, kernel test robot <lkp@intel.com>, Randy Dunlap <rdunlap@infradead.org>, John Bonesio <bones@secretlab.ca>, Mauro Carvalho Chehab <mchehab@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix multiple kernel-doc warnings in mpc52xx_lpbfifo.c:

arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c:377: warning: expecting prototype for mpc52xx_lpbfifo_bcom_poll(). Prototype was for mpc52xx_lpbfifo_poll() instead

mpc52xx_lpbfifo.c:221: warning: No description found for return value of 'mpc52xx_lpbfifo_irq'
mpc52xx_lpbfifo.c:327: warning: No description found for return value of 'mpc52xx_lpbfifo_bcom_irq'
mpc52xx_lpbfifo.c:398: warning: No description found for return value of 'mpc52xx_lpbfifo_submit'

mpc52xx_lpbfifo.c:64: warning: Function parameter or member 'req' not described in 'mpc52xx_lpbfifo_kick'
mpc52xx_lpbfifo.c:220: warning: contents before sections
mpc52xx_lpbfifo.c:223: warning: Function parameter or member 'irq' not described in 'mpc52xx_lpbfifo_irq'
mpc52xx_lpbfifo.c:223: warning: Function parameter or member 'dev_id' not described in 'mpc52xx_lpbfifo_irq'
mpc52xx_lpbfifo.c:328: warning: contents before sections
mpc52xx_lpbfifo.c:331: warning: Function parameter or member 'irq' not described in 'mpc52xx_lpbfifo_bcom_irq'
mpc52xx_lpbfifo.c:331: warning: Function parameter or member 'dev_id' not described in 'mpc52xx_lpbfifo_bcom_irq'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: John Bonesio <bones@secretlab.ca>
Cc: Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c |   14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff -- a/arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c b/arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c
--- a/arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c
@@ -59,6 +59,8 @@ static struct mpc52xx_lpbfifo lpbfifo;
 
 /**
  * mpc52xx_lpbfifo_kick - Trigger the next block of data to be transferred
+ *
+ * @req: Pointer to request structure
  */
 static void mpc52xx_lpbfifo_kick(struct mpc52xx_lpbfifo_request *req)
 {
@@ -178,6 +180,8 @@ static void mpc52xx_lpbfifo_kick(struct
 
 /**
  * mpc52xx_lpbfifo_irq - IRQ handler for LPB FIFO
+ * @irq: IRQ number to be handled
+ * @dev_id: device ID cookie
  *
  * On transmit, the dma completion irq triggers before the fifo completion
  * triggers.  Handle the dma completion here instead of the LPB FIFO Bestcomm
@@ -216,6 +220,8 @@ static void mpc52xx_lpbfifo_kick(struct
  * or nested spinlock condition.  The out path is non-trivial, so
  * extra fiddling is done to make sure all paths lead to the same
  * outbound code.
+ *
+ * Return: irqreturn code (%IRQ_HANDLED)
  */
 static irqreturn_t mpc52xx_lpbfifo_irq(int irq, void *dev_id)
 {
@@ -320,8 +326,12 @@ static irqreturn_t mpc52xx_lpbfifo_irq(i
 
 /**
  * mpc52xx_lpbfifo_bcom_irq - IRQ handler for LPB FIFO Bestcomm task
+ * @irq: IRQ number to be handled
+ * @dev_id: device ID cookie
  *
  * Only used when receiving data.
+ *
+ * Return: irqreturn code (%IRQ_HANDLED)
  */
 static irqreturn_t mpc52xx_lpbfifo_bcom_irq(int irq, void *dev_id)
 {
@@ -372,7 +382,7 @@ static irqreturn_t mpc52xx_lpbfifo_bcom_
 }
 
 /**
- * mpc52xx_lpbfifo_bcom_poll - Poll for DMA completion
+ * mpc52xx_lpbfifo_poll - Poll for DMA completion
  */
 void mpc52xx_lpbfifo_poll(void)
 {
@@ -393,6 +403,8 @@ EXPORT_SYMBOL(mpc52xx_lpbfifo_poll);
 /**
  * mpc52xx_lpbfifo_submit - Submit an LPB FIFO transfer request.
  * @req: Pointer to request structure
+ *
+ * Return: %0 on success, -errno code on error
  */
 int mpc52xx_lpbfifo_submit(struct mpc52xx_lpbfifo_request *req)
 {
