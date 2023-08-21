Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E724782BC7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 16:29:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EvQ96XJd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RTvxM0ppWz3bbW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 00:29:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EvQ96XJd;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RTvwS5TjVz30f4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 00:28:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692628104;
	bh=S/aI7ekQPWDUo5vNJKCUmAeJUoruzb4ZJexTlHdan+o=;
	h=From:To:Cc:Subject:Date:From;
	b=EvQ96XJd2423P4ssBwrrc1voJ0tdq+Z3vREgSKRMSq3efUUA9YrGpVIIq4kiZGJ6F
	 6uNd6vqvd+4GPm+PpQtRBs3RJ1MPH2fzIBrKF5LAGkhTFa7zTDj3jtoGwPbF+93xZC
	 fkflKJ87V37LlJ68n4ki6KuPoZ/SG+BL4GcDD6Tt2/R8XBYsx+zqb9rMR2H+SDzxHf
	 ZP2Q7xnLuhwfw2Oben6wKTvKPhR4SKrRMA76mGPOOsbhApiIrsVU1MRjHF4vb1/7/P
	 P8dTFPWQoz30yCK39g43EqM/QKWk+fZhZDUeRexCmLB880/csSZg/8jxseL+r5Dewv
	 rRjMyGwYVifdA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RTvwS3BLhz4wb0;
	Tue, 22 Aug 2023 00:28:24 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/2] powerpc/powernv: Fix fortify source warnings in opal-prd.c
Date: Tue, 22 Aug 2023 00:28:19 +1000
Message-ID: <20230821142820.497107-1-mpe@ellerman.id.au>
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
Cc: jniethe5@gmail.com, mahesh@linux.ibm.com, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As reported by Mahesh & Aneesh, opal_prd_msg_notifier() triggers a
FORTIFY_SOURCE warning:

  memcpy: detected field-spanning write (size 32) of single field "&item->msg" at arch/powerpc/platforms/powernv/opal-prd.c:355 (size 4)
  WARNING: CPU: 9 PID: 660 at arch/powerpc/platforms/powernv/opal-prd.c:355 opal_prd_msg_notifier+0x174/0x188 [opal_prd]
  NIP opal_prd_msg_notifier+0x174/0x188 [opal_prd]
  LR  opal_prd_msg_notifier+0x170/0x188 [opal_prd]
  Call Trace:
    opal_prd_msg_notifier+0x170/0x188 [opal_prd] (unreliable)
    notifier_call_chain+0xc0/0x1b0
    atomic_notifier_call_chain+0x2c/0x40
    opal_message_notify+0xf4/0x2c0

This happens because the copy is targetting item->msg, which is only 4
bytes in size, even though the enclosing item was allocated with extra
space following the msg.

To fix the warning define struct opal_prd_msg with a union of the header
and a flex array, and have the memcpy target the flex array.

Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Reported-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/powernv/opal-prd.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-prd.c b/arch/powerpc/platforms/powernv/opal-prd.c
index 113bdb151f68..40e26e9f318f 100644
--- a/arch/powerpc/platforms/powernv/opal-prd.c
+++ b/arch/powerpc/platforms/powernv/opal-prd.c
@@ -24,13 +24,20 @@
 #include <linux/uaccess.h>
 
 
+struct opal_prd_msg {
+	union {
+		struct opal_prd_msg_header header;
+		DECLARE_FLEX_ARRAY(u8, data);
+	};
+};
+
 /*
  * The msg member must be at the end of the struct, as it's followed by the
  * message data.
  */
 struct opal_prd_msg_queue_item {
-	struct list_head		list;
-	struct opal_prd_msg_header	msg;
+	struct list_head	list;
+	struct opal_prd_msg	msg;
 };
 
 static struct device_node *prd_node;
@@ -156,7 +163,7 @@ static ssize_t opal_prd_read(struct file *file, char __user *buf,
 	int rc;
 
 	/* we need at least a header's worth of data */
-	if (count < sizeof(item->msg))
+	if (count < sizeof(item->msg.header))
 		return -EINVAL;
 
 	if (*ppos)
@@ -186,7 +193,7 @@ static ssize_t opal_prd_read(struct file *file, char __user *buf,
 			return -EINTR;
 	}
 
-	size = be16_to_cpu(item->msg.size);
+	size = be16_to_cpu(item->msg.header.size);
 	if (size > count) {
 		err = -EINVAL;
 		goto err_requeue;
@@ -352,7 +359,7 @@ static int opal_prd_msg_notifier(struct notifier_block *nb,
 	if (!item)
 		return -ENOMEM;
 
-	memcpy(&item->msg, msg->params, msg_size);
+	memcpy(&item->msg.data, msg->params, msg_size);
 
 	spin_lock_irqsave(&opal_prd_msg_queue_lock, flags);
 	list_add_tail(&item->list, &opal_prd_msg_queue);
-- 
2.41.0

