Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFD5768F77
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 10:03:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zxkxs5Hl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RDrNK2Fwfz30PQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 18:03:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zxkxs5Hl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RDrMP2W66z2ykX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jul 2023 18:02:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3885960F5E;
	Mon, 31 Jul 2023 08:02:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63489C433C7;
	Mon, 31 Jul 2023 08:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690790572;
	bh=CFCUO1q2jsK74UC2bwVz7miuEtn6Vz1wrsnbjpoYBoE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zxkxs5HlsQ22+uk6HxRfSnXVnkXQrgnRL0xYAU9zOhLxxVwnTltHXn3xkW5TIMaVA
	 s2/ZkpjZZrsy8Yg47g2Yf6J1CiFdQWjIc8LClZCxbWSWsIx4BJBwYCTFv++rMjad0T
	 bHa+WlPcEaoyuTPupPQn+KQzuiUUJlUe85LatZEg8/M7dVgtlx5YSXL2fBjUXkCtGR
	 EeZxkxnt3IiL1s2w3nP4JNwjGIP/y34/uWg1PvxyRzGHy6wyoIRPcvYu2IFVYnJvdK
	 Mm7KNXDq6EX4oP1juDpt5FVQYe8qiOOzMV4TeS1zxXzR4gLmFiHzfb0/A9xEBtChFX
	 qmetPBluQldWA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 03/10] tty: hvsi: remove an extra variable from hvsi_write()
Date: Mon, 31 Jul 2023 10:02:37 +0200
Message-ID: <20230731080244.2698-4-jirislaby@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731080244.2698-1-jirislaby@kernel.org>
References: <20230731080244.2698-1-jirislaby@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

'source' is the same as 'buf'. Rename the parameter ('buf') to
'source' and drop the local variable.

Likely, the two were introduced to have a different type. But 'char' and
'unsigned char' are the same in the kernel for a long time.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
---
 drivers/tty/hvc/hvsi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tty/hvc/hvsi.c b/drivers/tty/hvc/hvsi.c
index a200d01eceed..c1b8a4fd8b1e 100644
--- a/drivers/tty/hvc/hvsi.c
+++ b/drivers/tty/hvc/hvsi.c
@@ -905,10 +905,9 @@ static unsigned int hvsi_chars_in_buffer(struct tty_struct *tty)
 }
 
 static int hvsi_write(struct tty_struct *tty,
-		     const unsigned char *buf, int count)
+		     const unsigned char *source, int count)
 {
 	struct hvsi_struct *hp = tty->driver_data;
-	const char *source = buf;
 	unsigned long flags;
 	int total = 0;
 	int origcount = count;
-- 
2.41.0

