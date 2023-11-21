Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E47C17F28E0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 10:25:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ljq1V0RC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZJrt5jkqz3vqP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 20:25:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ljq1V0RC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZJp62jDGz3vhN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 20:23:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E68A8CE1AA0;
	Tue, 21 Nov 2023 09:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50BFFC433BD;
	Tue, 21 Nov 2023 09:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700558603;
	bh=+5n2mUpG4q3myzhvyd7KfFL/hxg0CFLJ/PmuTSTaY6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ljq1V0RC2KP6ws3XfIFi2ZR28B0v5Bfu38nZAOFsLytKLElqcxHwreJJQLxWZ+fri
	 mWSMDDvPs64Aof9bEcPnM6TRuWBTy6YOzLt5yZUy3MqiUdh74Iyne4CQryja0MK6DC
	 WW+HJ6KY+9qIRLpdDaiBqHyNQgxwzYbL+77WrZM2DtKVU824khjepG0Sfqt/9BCMb6
	 Up2caehfFcZlTOCyI9KomPdNrrUHfY9h8wDItDtRiHa/2GIAw5UGnOtwrcUJh4Q1+j
	 u/WCFpblEnv7exzQktl2l7+Y04/Xlv/eIRTeaQsfQh8IoFf1+L9BdNJg/d1Pcljsn/
	 +rohHZM+ihVlg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 11/17] tty: hvc_console: use flexible array for outbuf
Date: Tue, 21 Nov 2023 10:22:52 +0100
Message-ID: <20231121092258.9334-12-jirislaby@kernel.org>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231121092258.9334-1-jirislaby@kernel.org>
References: <20231121092258.9334-1-jirislaby@kernel.org>
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

This means:
* move outbuf to the end of struct hvc_struct and convert from pointer
  to flexible array (the structure is smaller now)
* use struct_size() at the allocation site
* align outbuf in the struct instead of ALIGN() at kzalloc()

And apart from the above, use u8 instead of char (which are the same
thanks to -funsigned-char). The former is now preferred over the latter.

It makes the code easier to understand.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
---
 drivers/tty/hvc/hvc_console.c | 4 +---
 drivers/tty/hvc/hvc_console.h | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
index 959fae54ca39..93b613e1f176 100644
--- a/drivers/tty/hvc/hvc_console.c
+++ b/drivers/tty/hvc/hvc_console.c
@@ -922,8 +922,7 @@ struct hvc_struct *hvc_alloc(uint32_t vtermno, int data,
 			return ERR_PTR(err);
 	}
 
-	hp = kzalloc(ALIGN(sizeof(*hp), sizeof(long)) + outbuf_size,
-			GFP_KERNEL);
+	hp = kzalloc(struct_size(hp, outbuf, outbuf_size), GFP_KERNEL);
 	if (!hp)
 		return ERR_PTR(-ENOMEM);
 
@@ -931,7 +930,6 @@ struct hvc_struct *hvc_alloc(uint32_t vtermno, int data,
 	hp->data = data;
 	hp->ops = ops;
 	hp->outbuf_size = outbuf_size;
-	hp->outbuf = &((char *)hp)[ALIGN(sizeof(*hp), sizeof(long))];
 
 	tty_port_init(&hp->port);
 	hp->port.ops = &hvc_port_ops;
diff --git a/drivers/tty/hvc/hvc_console.h b/drivers/tty/hvc/hvc_console.h
index 9668f821db01..b718714bf399 100644
--- a/drivers/tty/hvc/hvc_console.h
+++ b/drivers/tty/hvc/hvc_console.h
@@ -37,7 +37,6 @@ struct hvc_struct {
 	spinlock_t lock;
 	int index;
 	int do_wakeup;
-	char *outbuf;
 	int outbuf_size;
 	int n_outbuf;
 	uint32_t vtermno;
@@ -48,6 +47,7 @@ struct hvc_struct {
 	struct work_struct tty_resize;
 	struct list_head next;
 	unsigned long flags;
+	u8 outbuf[] __aligned(sizeof(long));
 };
 
 /* implemented by a low level driver */
-- 
2.42.1

