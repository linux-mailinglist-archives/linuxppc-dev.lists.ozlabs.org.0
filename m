Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DFD75EB91
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 08:34:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BSdcx4Wo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8Vkt1Vy5z3bZF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 16:34:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BSdcx4Wo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8Vjx111wz2xdp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 16:33:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=xi02gFW93Id0bT7Sh+4wBXdpqlJzFPayUdH3m+EHzPM=; b=BSdcx4WoALDgeHupsuSnOLc1rn
	gERe7ONSyqR4QdO2pdzHlgtJabW3mHKBgo9gz+fGGpRUX+vnDhZJ5AOedAXhwikUVAL0+SmhjwbxN
	/N0VWSoe1u1O8qFlW0Q/15iF3i1+4nL3KQEXy6vAxvUZONFG/WTS+I9t67a82XbLG7OfvoNZTxlTI
	kjMZrhFr7XVvcCGYfNtO/vTmnvsfUi39W5AF55O0z+mC8Pv0FcqpRQ7u2UZsTkfqp6YEEL95yW2ps
	/w1IpB+gf6iGr6PMeyaMEROi7+ys87t30fRl2tQhbDcxqjeRIsrAXvlidl94WCiUtoYWe74OlVV2m
	HuQe1YPw==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qNp8c-002ySv-17;
	Mon, 24 Jul 2023 06:33:46 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: devices.txt: reconcile serial/ucc_uart minor numers
Date: Sun, 23 Jul 2023 23:33:41 -0700
Message-ID: <20230724063341.28198-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.41.0
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
Cc: Timur Tabi <timur@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Kumar Gala <galak@kernel.crashing.org>, linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reconcile devices.txt with serial/ucc_uart.c regarding device number
assignments. ucc_uart.c supports 4 ports and uses minor devnums
46-49, so update devices.txt with that info.
Then update ucc_uart.c's reference to the location of the devices.txt
list in the kernel source tree.

Fixes: d7584ed2b994 ("[POWERPC] qe-uart: add support for Freescale QUICCEngine UART")
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Timur Tabi <timur@kernel.org>
Cc: Kumar Gala <galak@kernel.crashing.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/admin-guide/devices.txt |    2 +-
 drivers/tty/serial/ucc_uart.c         |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff -- a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -59,7 +59,7 @@ static int firmware_loaded;
 /* #define LOOPBACK */
 
 /* The major and minor device numbers are defined in
- * http://www.lanana.org/docs/device-list/devices-2.6+.txt.  For the QE
+ * Documentation/admin-guide/devices.txt.  For the QE
  * UART, we have major number 204 and minor numbers 46 - 49, which are the
  * same as for the CPM2.  This decision was made because no Freescale part
  * has both a CPM and a QE.
diff -- a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
--- a/Documentation/admin-guide/devices.txt
+++ b/Documentation/admin-guide/devices.txt
@@ -2691,7 +2691,7 @@
 		 45 = /dev/ttyMM1		Marvell MPSC - port 1 (obsolete unused)
 		 46 = /dev/ttyCPM0		PPC CPM (SCC or SMC) - port 0
 		    ...
-		 47 = /dev/ttyCPM5		PPC CPM (SCC or SMC) - port 5
+		 49 = /dev/ttyCPM5		PPC CPM (SCC or SMC) - port 3
 		 50 = /dev/ttyIOC0		Altix serial card
 		    ...
 		 81 = /dev/ttyIOC31		Altix serial card
