Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD37D6594AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 05:25:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Njscw4jtzz3fC9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 15:25:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=hODI6cBZ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=N4+/Tnzg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=hODI6cBZ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=N4+/Tnzg;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NjsX14T96z3c7s
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Dec 2022 15:21:21 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id ADE235C034B;
	Thu, 29 Dec 2022 23:21:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 29 Dec 2022 23:21:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672374079; x=1672460479; bh=e4
	W1n9Rq2Lh1pGU541iP6qdQ1ybWYpnkP5s+p6s8HIE=; b=hODI6cBZkLPfno+wow
	JZLp+0yufbvAiF4jHRgyFGmzw5qhrdER6aXzUglusJBc9/JuqFJZ8Edhstn3rxL0
	FopRzpj1WGK3JDNpl7xYFg5Qdri51N5ICNLyBSNOOeba4+51pHVgk082qO5PLaVJ
	3LFAHz5zvGiTGTS7OgdLgFwHUMiRwdnUGoTUbpXexX+bFXvopwzTYQ2hXTO1QkYW
	EItwJlhb8G9JZRG1mXFLTW+5doDO9gljwJ1oHbfLC+b0IPhnCRy22dmXNdvzcu5C
	krOomkCsrr93HXosLwS2PvfyDcfbVoOBOnRSfhcZCRowd0dDN8Juy+mwd8ciIX6R
	AqXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672374079; x=1672460479; bh=e4W1n9Rq2Lh1p
	GU541iP6qdQ1ybWYpnkP5s+p6s8HIE=; b=N4+/TnzgXl7LlTl5oT1urYsTIhdfV
	gOyEF9tw7R2B0wOe2FXw9ge1/GFrphHRYctZkI6lLfY3c415tXFEoBd5pPbXPbSU
	FuzEGHng87OQjAF3tO4Kem9hWJBa96kXQp1CuvDWS8bSw+ddMqIzGUetvIDXCH4F
	kSdCdq+OQza6QIq2Os/PY3dWtXtwaS4+gR/2r9wMMtn6GjNmWiBQxoIc9jfRCZAy
	bgn/xIciC5taQvu2otiv+lmCoUaziQN/ULS+/bx0o7uA0N5L6SR3I90ILu3msf1f
	b6dPJ6L8vP4Fgu7cgEGLQ4kCi9X9j1zzO04F+9v6CKQ4C6PNA1CzsbhiQ==
X-ME-Sender: <xms:P2euY8huHNoETIKz05-oxJPmZK6b3LLAi35wW3VJf2VfQf2zdKmxgw>
    <xme:P2euY1D3-EE55tL3QJOSttS85EIDkHI2NPEMg__s7jvncbtbqe2Rl0VbcpH5zpVuq
    KI67IwTFs4eZitMZw>
X-ME-Received: <xmr:P2euY0GFUxqYgg34gW0ixa_FoWscBAvEBAEKOR7wwpffs-zvHkh1g-Mej0_7lX7yeoo3jWAT-L745qifyKxgnWqpw2vJYgSdKd-qAt44j7dpzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieehgdeilecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvve
    fufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhr
    vgihuceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhephf
    dvuefgtddvieeigefffeffkeeigedvgfeitdejteffveefhfdtheejffeiiedvnecuvehl
    uhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrse
    hruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:P2euY9SOF7p3s7fyqruC3yX6VZmZwcGENaHUMw0GHUrD8PQ-mAU0-Q>
    <xmx:P2euY5wMDiYMmE4jWi03X9nhMZcFBdnqQI9XRXUYHcVA0cU56m3zhA>
    <xmx:P2euY74iBjxNwnzn2q6o5S7Wu7emk_PMxrBkv5NQ2BI5e48aHdgsZg>
    <xmx:P2euY4z1zrQ5zJdG7gSQK62ZvhC0HfvsFJjJE6blZ0aRNwd4FU9vCA>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 23:21:16 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/7] powerpc/secvar: Handle format string in the consumer
Date: Fri, 30 Dec 2022 15:20:11 +1100
Message-Id: <20221230042014.154483-5-ruscur@russell.cc>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230042014.154483-1-ruscur@russell.cc>
References: <20221230042014.154483-1-ruscur@russell.cc>
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
index 02e9fee1552e..190238f51335 100644
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
-	rc = sysfs_emit(buf, "%s\n", format);
-
-out:
-	of_node_put(node);
-
-	return rc;
+	return secvar_ops->format(buf);
 }
 
 
diff --git a/arch/powerpc/platforms/powernv/opal-secvar.c b/arch/powerpc/platforms/powernv/opal-secvar.c
index 14133e120bdd..5e9de06b2533 100644
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
+	rc = sysfs_emit(buf, "%s\n", format);
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

