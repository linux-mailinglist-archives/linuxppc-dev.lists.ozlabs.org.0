Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A876573B0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Dec 2022 08:36:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NhjyW4Q1xz3c4Y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Dec 2022 18:36:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=MzHkDSTe;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NWs1T5Nz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=MzHkDSTe;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NWs1T5Nz;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NhjxQ3PHGz308w
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Dec 2022 18:35:53 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id C98BA320092B;
	Wed, 28 Dec 2022 02:30:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 28 Dec 2022 02:30:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672212639; x=1672299039; bh=Br
	FC+57y08hRIR+Z3gCskLpXrFWtKi5jsyNeZhcK7F0=; b=MzHkDSTeWqYBp25vS1
	T2Dw05oAOs4l89qU0oLHNXQQDp+x5IobZkCLYBXW0xRhR5E3qG4WC/jiBGRVdaoa
	FvbjAB6S0/kvsqZUoTDfHjWQTWNMELVxvNMwb75ESsSSEMrpmTVCcGKxiagGRsir
	KPxwILrYE6z+2ZTkjGKeVTGrNQeLAU90x3DF+EDBqS0qfJltJmuexrhbU0nhKAUj
	cmxvt7X5/n5P0PcUoqHSuSd2PVgOWgMIP8YyCp7UVsYk++yDqKPIYSIpxz5KxVDT
	zwAV9efRGy6szHKa3P7UTtYUtpIoVXX7l2KYMz3UJn77052PuhfRJNkWMsXjAQms
	KC8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672212639; x=1672299039; bh=BrFC+57y08hRI
	R+Z3gCskLpXrFWtKi5jsyNeZhcK7F0=; b=NWs1T5Nzd557sJFnJxB+8HVaZ/gY5
	7ELJ2ZzgnPPfAjRgqQF5HNt3Wy1ub5ywFVFHOoCtlkg5n/DrzWi7WWENYY1cVKgq
	psqWiPliuieZaWfBbQ0VuxzAzWcpU+LM73Xwi1SxQrSx2/KLrGfZR3/JdlbbaPNr
	8G/2B8r7w5wvfqTKA2rlRrPAiAeXsrsR1kFRvSsgYxCkeoOD7gNahTzVmtdNyg/8
	Tyo1g5lwve0GD3DB69TyEox1n8hyhBvCEwBFZ2f75yVK3D1FVgPK5QtJNt1ABo/L
	hP1q4qFLOSOiW/pq3Ohz8P7K/IYHm3jwL16JAE/Qob+SlwJNyXFBhoL4w==
X-ME-Sender: <xms:n_CrY28Y3chqol6WgZlbAoD26iiCHAnH4_VucletNcUgPlFpMitNqQ>
    <xme:n_CrY2s9YTr1TYIHGVU62SixdwPVFA4THhhb2qfziaS01EndBni4GrPlbhNQGyJTx
    ZuJQAjLGVzSeO014A>
X-ME-Received: <xmr:n_CrY8CgmZiPMSAIFjVFigPzkfkb2h3a5vOCKWeF01vumvmkPfarRaInioBYmrEoi4tLV6gE6j1ozL8AZcZQxdu9NiLKwKNmYTnP7UhQWo9sqQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedriedugdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvf
    evufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhr
    rhgvhicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpe
    fhvdeugfdtvdeiieegffefffekieegvdfgiedtjeetffevfefhtdehjeffieeivdenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurh
    esrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:n_CrY-ddufXFNgERDYpXR2wObuvj8xZaipdDSqRrHuFebHuCZt1QcA>
    <xmx:n_CrY7NJgklVj_XXHjziU_7Qa8eUnsftP4aV90-Ys69OuvHlEsYr3w>
    <xmx:n_CrY4nPmgbYhlkCWaPVHKcBlRP922Up2oHUf7OQqSa8GSn_NC6hkA>
    <xmx:n_CrY2f4EHx8ZWL8M5y_Ll8IahdrYZrG2E-EvU6HxpvplTcY6weuUg>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Dec 2022 02:30:36 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/6] powerpc/secvar: Handle max object size in the consumer
Date: Wed, 28 Dec 2022 18:29:41 +1100
Message-Id: <20221228072943.429266-5-ruscur@russell.cc>
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

Currently the max object size is handled in the core secvar code with an
entirely OPAL-specific implementation, so create a new max_size() op and
move the existing implementation into the powernv platform.  Should be
no functional change.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/include/asm/secvar.h            |  1 +
 arch/powerpc/kernel/secvar-sysfs.c           | 17 +++--------------
 arch/powerpc/platforms/powernv/opal-secvar.c | 19 +++++++++++++++++++
 3 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/secvar.h b/arch/powerpc/include/asm/secvar.h
index 3b7e5a3625bd..92d2c051918b 100644
--- a/arch/powerpc/include/asm/secvar.h
+++ b/arch/powerpc/include/asm/secvar.h
@@ -21,6 +21,7 @@ struct secvar_operations {
 	int (*set)(const char *key, uint64_t key_len, u8 *data,
 		   uint64_t data_size);
 	ssize_t (*format)(char *buf);
+	int (*max_size)(uint64_t *max_size);
 };
 
 #ifdef CONFIG_PPC_SECURE_BOOT
diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
index daf28b11866f..ea408763dc78 100644
--- a/arch/powerpc/kernel/secvar-sysfs.c
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -122,27 +122,16 @@ static struct kobj_type secvar_ktype = {
 static int update_kobj_size(void)
 {
 
-	struct device_node *node;
 	u64 varsize;
-	int rc = 0;
+	int rc = secvar_ops->max_size(&varsize);
 
-	node = of_find_compatible_node(NULL, NULL, "ibm,secvar-backend");
-	if (!of_device_is_available(node)) {
-		rc = -ENODEV;
-		goto out;
-	}
-
-	rc = of_property_read_u64(node, "max-var-size", &varsize);
 	if (rc)
-		goto out;
+		return rc;
 
 	data_attr.size = varsize;
 	update_attr.size = varsize;
 
-out:
-	of_node_put(node);
-
-	return rc;
+	return 0;
 }
 
 static int secvar_sysfs_load(void)
diff --git a/arch/powerpc/platforms/powernv/opal-secvar.c b/arch/powerpc/platforms/powernv/opal-secvar.c
index cd5b5c06c091..3ef6b9afd129 100644
--- a/arch/powerpc/platforms/powernv/opal-secvar.c
+++ b/arch/powerpc/platforms/powernv/opal-secvar.c
@@ -125,11 +125,30 @@ static ssize_t opal_secvar_format(char *buf)
 	return rc;
 }
 
+static int opal_secvar_max_size(uint64_t *max_size)
+{
+	int rc;
+	struct device_node *node;
+
+	node = of_find_compatible_node(NULL, NULL, "ibm,secvar-backend");
+	if (!of_device_is_available(node)) {
+		rc = -ENODEV;
+		goto out;
+	}
+
+	rc = of_property_read_u64(node, "max-var-size", max_size);
+
+out:
+	of_node_put(node);
+	return rc;
+}
+
 static const struct secvar_operations opal_secvar_ops = {
 	.get = opal_get_variable,
 	.get_next = opal_get_next_variable,
 	.set = opal_set_variable,
 	.format = opal_secvar_format,
+	.max_size = opal_secvar_max_size,
 };
 
 static int opal_secvar_probe(struct platform_device *pdev)
-- 
2.38.1

