Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2556573B7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Dec 2022 08:42:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nhk4j0QjLz3cd3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Dec 2022 18:42:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=A+2ZT9G3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=l3C92B6l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=A+2ZT9G3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=l3C92B6l;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NhjxW59tNz3bZl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Dec 2022 18:35:59 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id E40933200921;
	Wed, 28 Dec 2022 02:30:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 28 Dec 2022 02:30:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672212634; x=1672299034; bh=WN
	XT52ksa1LSW+Evq+GXqK8F8+ErNwjr8XxtvfSaKZc=; b=A+2ZT9G3iOeqh15YyA
	/mAkKPEKOMp/GGJ3/yFkAiTe9Hy4eLaYx81D5Fjbmq+0n+6BCRGGPUzG13jC3CPt
	HJaDlI/JYzDEhuLyRjKOhKOkyOugqJhefiSTc6tiCTMXdq4aKP7CgipX2YpcUNfM
	VaLM7c15XIh8oE75rYpkNJ++pYhkA3PVXACBxXTncMbYlNfB00QO/xXkXTQsNaoK
	Kmi645QWbJDAqqVd65Bhpo2yhkmvRbxjTuMxyTilsCbNzpoLy5uTNc3W+w+3kj50
	9RsxoPK0ornwX6PQxzDl7JMGLXuqhLt0yjrxmvNX6XR0DaGElukqQemssT1uYLFg
	6wng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672212634; x=1672299034; bh=WNXT52ksa1LSW
	+Evq+GXqK8F8+ErNwjr8XxtvfSaKZc=; b=l3C92B6l9aaihvIIKo0MSTXo7406P
	LBrJ+5D63UabOyg2JCbhO0oJ64YAoFNzMHi5z7Vk3P+/va0TVOp4oZxPgrEva1RO
	66FGuSI1e0OT34jnSzwyJi2ObBNQDrZlJyk5JrDLqT4BL8aGPgObpiGt0nRjvJml
	OCQahAki/ZrZtxrTWs3zPWIPDx9bqSoVLSXDZ9aVS8KOGJtEu/j626WxAnykfgRf
	QSvpAxYsDdBX2VZzbX6rPK8+TDl1pgt+t1ddWG+cYQesv1cw5o4a/tOnOKNwfoVe
	sOA/lsvPCRaN9zCB7BR/iKqpeHi2YtYCHB7ESz7ZEY9jLPBDdnicc4Uuw==
X-ME-Sender: <xms:mvCrY4b_eCg42tsKWVe9FagO99HmcxhGTKQIrAeh0BO7iatKS9lDBg>
    <xme:mvCrYzZMlfyYNYgtdolPI8_M1zLndJDsMlWgisJtPOILwThqOSsYv8WTyDlo8kZ3Z
    wR39IyTQfCBAGUa6A>
X-ME-Received: <xmr:mvCrYy9PMruykBNNfH4j5g3DMtGth2DBkQjq1WOlFYEWh5auSi8YfsBGnfnwJxpS7vFlQCMXLV1cvH_pYBlHtEmmvrvU8v3GR0H1nAS30zj-hg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedriedugddutdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvf
    evufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhr
    rhgvhicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpe
    fhvdeugfdtvdeiieegffefffekieegvdfgiedtjeetffevfefhtdehjeffieeivdenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurh
    esrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:mvCrYypdx-2SNZJ2ZE_ia3RE0XXFbQWi8DTpsEuq4tuRpQskEEA-lg>
    <xmx:mvCrYzorkubqBLF4sAr1pFpxS8gfrwoM2HgJfVabMsf_IzP4OOYSag>
    <xmx:mvCrYwQgcSVZA0t9aP66BigpsOlo2BgZl9IrQxrUjgedjxoIGi60Dg>
    <xmx:mvCrY_JPYgcBxR-WmOs4r3F5BQYiQWcATUTuW_YZjYmtSPJjznyPqg>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Dec 2022 02:30:31 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/6] powerpc/secvar: Handle format string in the consumer
Date: Wed, 28 Dec 2022 18:29:40 +1100
Message-Id: <20221228072943.429266-4-ruscur@russell.cc>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228072943.429266-1-ruscur@russell.cc>
References: <20221228072943.429266-1-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, Russell Currey <ruscur@russell.cc>, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The code that handles the format string in secvar-sysfs.c is entirely
OPAL specific, so create a new "format" op in secvar_operations to make
the secvar code more generic.  No functional change.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/include/asm/secvar.h            |  1 +
 arch/powerpc/kernel/secvar-sysfs.c           | 21 +---------------
 arch/powerpc/platforms/powernv/opal-secvar.c | 25 ++++++++++++++++++++
 3 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/secvar.h b/arch/powerpc/include/asm/secvar.h
index 4cc35b58b986..3b7e5a3625bd 100644
--- a/arch/powerpc/include/asm/secvar.h
+++ b/arch/powerpc/include/asm/secvar.h
@@ -20,6 +20,7 @@ struct secvar_operations {
 			uint64_t keybufsize);
 	int (*set)(const char *key, uint64_t key_len, u8 *data,
 		   uint64_t data_size);
+	ssize_t (*format)(char *buf);
 };
 
 #ifdef CONFIG_PPC_SECURE_BOOT
diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
index 1ee4640a2641..daf28b11866f 100644
--- a/arch/powerpc/kernel/secvar-sysfs.c
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -21,26 +21,7 @@ static struct kset *secvar_kset;
 static ssize_t format_show(struct kobject *kobj, struct kobj_attribute *attr,
 			   char *buf)
 {
-	ssize_t rc = 0;
-	struct device_node *node;
-	const char *format;
-
-	node = of_find_compatible_node(NULL, NULL, "ibm,secvar-backend");
-	if (!of_device_is_available(node)) {
-		rc = -ENODEV;
-		goto out;
-	}
-
-	rc = of_property_read_string(node, "format", &format);
-	if (rc)
-		goto out;
-
-	rc = sprintf(buf, "%s\n", format);
-
-out:
-	of_node_put(node);
-
-	return rc;
+	return secvar_ops->format(buf);
 }
 
 
diff --git a/arch/powerpc/platforms/powernv/opal-secvar.c b/arch/powerpc/platforms/powernv/opal-secvar.c
index 14133e120bdd..cd5b5c06c091 100644
--- a/arch/powerpc/platforms/powernv/opal-secvar.c
+++ b/arch/powerpc/platforms/powernv/opal-secvar.c
@@ -101,10 +101,35 @@ static int opal_set_variable(const char *key, uint64_t ksize, u8 *data,
 	return opal_status_to_err(rc);
 }
 
+static ssize_t opal_secvar_format(char *buf)
+{
+	ssize_t rc = 0;
+	struct device_node *node;
+	const char *format;
+
+	node = of_find_compatible_node(NULL, NULL, "ibm,secvar-backend");
+	if (!of_device_is_available(node)) {
+		rc = -ENODEV;
+		goto out;
+	}
+
+	rc = of_property_read_string(node, "format", &format);
+	if (rc)
+		goto out;
+
+	rc = sprintf(buf, "%s\n", format);
+
+out:
+	of_node_put(node);
+
+	return rc;
+}
+
 static const struct secvar_operations opal_secvar_ops = {
 	.get = opal_get_variable,
 	.get_next = opal_get_next_variable,
 	.set = opal_set_variable,
+	.format = opal_secvar_format,
 };
 
 static int opal_secvar_probe(struct platform_device *pdev)
-- 
2.38.1

