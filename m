Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7578068B6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 08:38:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p6IQRDqk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlTmB48nxz3dBH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 18:38:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p6IQRDqk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlTlG4BN1z2xdb
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 18:37:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C9E5F61AFA;
	Wed,  6 Dec 2023 07:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B3CC433C9;
	Wed,  6 Dec 2023 07:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701848261;
	bh=18JyKq4qj/ln/rCT3pVsLeqjsPFlBw+nKU0XPRGVwY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p6IQRDqkaYUoPif/d7W9DRIcT9jGBoIc5ICU9urWmi2ZRus2ETMngmAZsTHKOW0To
	 rLG45RiEQcK1kwmt6j8cYToPebcY32H8QRWMylgVKvixxlqgv/RjnmOpPPRMpM9Pam
	 clpS7FkXgElpDEbUkhIQnwF1oJ9lr5zwiPDIrWzPzGNOOsES30u4YDSCJVdsLnYy1f
	 NvbtSPIITiYZisvRQV7jG+tbbo9cpITSVwJI0bKLQJZX/G8VH1xB+Am3COfhw0Uc+E
	 PhzQSdXnEErWlY1yMEY5+Scs3I8k6cOkD5p1NIkmv4DN7y44EoylEGfPKc/kUCvl3c
	 QwIsT15zKSayA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 10/27] tty: ehv_bytechan: convert to u8 and size_t
Date: Wed,  6 Dec 2023 08:36:55 +0100
Message-ID: <20231206073712.17776-11-jirislaby@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206073712.17776-1-jirislaby@kernel.org>
References: <20231206073712.17776-1-jirislaby@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Switch character types to u8 and sizes to size_t. To conform to
characters/sizes in the rest of the tty layer.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org
---
 drivers/tty/ehv_bytechan.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/ehv_bytechan.c b/drivers/tty/ehv_bytechan.c
index cc9f4338da60..69508d7a4135 100644
--- a/drivers/tty/ehv_bytechan.c
+++ b/drivers/tty/ehv_bytechan.c
@@ -49,7 +49,7 @@ struct ehv_bc_data {
 	unsigned int tx_irq;
 
 	spinlock_t lock;	/* lock for transmit buffer */
-	unsigned char buf[BUF_SIZE];	/* transmit circular buffer */
+	u8 buf[BUF_SIZE];	/* transmit circular buffer */
 	unsigned int head;	/* circular buffer head */
 	unsigned int tail;	/* circular buffer tail */
 
@@ -138,9 +138,9 @@ static int find_console_handle(void)
 
 static unsigned int local_ev_byte_channel_send(unsigned int handle,
 					       unsigned int *count,
-					       const char *p)
+					       const u8 *p)
 {
-	char buffer[EV_BYTE_CHANNEL_MAX_BYTES];
+	u8 buffer[EV_BYTE_CHANNEL_MAX_BYTES];
 	unsigned int c = *count;
 
 	/*
@@ -166,7 +166,7 @@ static unsigned int local_ev_byte_channel_send(unsigned int handle,
  * has been sent, or if some error has occurred.
  *
  */
-static void byte_channel_spin_send(const char data)
+static void byte_channel_spin_send(const u8 data)
 {
 	int ret, count;
 
@@ -474,8 +474,7 @@ static ssize_t ehv_bc_tty_write(struct tty_struct *ttys, const u8 *s,
 {
 	struct ehv_bc_data *bc = ttys->driver_data;
 	unsigned long flags;
-	unsigned int len;
-	unsigned int written = 0;
+	size_t len, written = 0;
 
 	while (1) {
 		spin_lock_irqsave(&bc->lock, flags);
-- 
2.43.0

