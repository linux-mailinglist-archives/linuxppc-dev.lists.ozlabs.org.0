Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B066B6594AC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 05:26:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Njsf54Jz9z3fBW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 15:26:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=noEHZLOK;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=oz6/6eAj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=noEHZLOK;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=oz6/6eAj;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NjsX46rbLz3c6C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Dec 2022 15:21:24 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 0B1CE5C0327;
	Thu, 29 Dec 2022 23:21:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 29 Dec 2022 23:21:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672374083; x=1672460483; bh=72
	W0OI05DA+JHi5r5u4GIP3geuabyTmRWs9HRRGhXa4=; b=noEHZLOKfwEayFpy7M
	Lkdjv+FpOghAHpvBwzQPIa8ccbfOKptS5Wnjs+4nOGuv47qIiEw36sy51OFa1opb
	1rvbtnNuyBjxB2jstDY6n9DCbYjdjbS53JfPIuq1a/YHgj6TYmIecADVZ+4f8Vfx
	6oMOA+i38bRlYTeGCm1v/7DEr4Vmw521r1Pq2hESaHXysM+Y/aXhrp2CfE5vcNrc
	24DPcgUD7rKm4BO3l2U8ZwD2QlvPFSmVZ337G7tpUMCNha++2jCjoIqarcMLVEfZ
	3TERlqEwylm+eiFBisyLBLhRLsf6LB7OfhvXxF7yrJg00eSzOHA4//KqSSYLTrKb
	g1uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672374083; x=1672460483; bh=72W0OI05DA+JH
	i5r5u4GIP3geuabyTmRWs9HRRGhXa4=; b=oz6/6eAjEPtOxB4ASiBh7l7sn2emL
	EpEoznL1UlztE9eK540gu9Qa4SBYAUgh/rQdl4jPrj7MXjcTR1Rm2x5O99rOIzP8
	K1B6LTZdWdAB/GfZqS0sr81sCKSg/xs744aTcTU354vPb7Pw6ccJgGO/XRIdtvzf
	6kB0vfGXrxt/5VpnK0bnpkABen4A0uV2kXEf6q/pn9eVqajkU2B4RfFy4Rci29r8
	aZIroLEXNYmvZB8l3wTKN9nu16XDLdmsYxjhXXCvLhoQCkWsDAGovRwGOCuqPLhx
	PrZvaFCzBs1J/BXxtW7rLIagvc/tig5XAKOqvfMhuEQ+s01onzgV0GkMw==
X-ME-Sender: <xms:QmeuYxd6P4yn9awaV5RDaUyNfYKKObn1IJfIGiULnvlnp1M4xuyYmg>
    <xme:QmeuY_PB4YXff6a230p3HiipuKEsJwnBqypeRTj1D0670elmtRLVRiEkPXKm_tD8O
    e5X-eS84ksJgTTISg>
X-ME-Received: <xmr:QmeuY6g-xFKVnbhx1CTxOD_9YTf86sQEBSEcwKG_VYOerLfY74fEGpgVLhOEHT4IAT9si5Rw-09rR0fXw9NwIxALQfb7ndLjiuJD36UDAf-t8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieehgdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvve
    fufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhr
    vgihuceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhephf
    dvuefgtddvieeigefffeffkeeigedvgfeitdejteffveefhfdtheejffeiiedvnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrse
    hruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:QmeuY68JnUVLZK1m9O0fq6gTT5FBqMaz0She9V8JYbIGTPvwKGq3Zw>
    <xmx:QmeuY9sdKKZPsRF6TApoSKsKrjDYSZLN5EbBGw9AYBP9CtBFxWm3aQ>
    <xmx:QmeuY5EUsrqBHughV-D0dCzOjhSaHSb10OzAUf6O7HqOnuSzV7u76g>
    <xmx:Q2euY--uW7ac7LNMpW5thOBcxfqRnfgabKQIdC38ykywP85C3rrhbA>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 23:21:19 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 5/7] powerpc/secvar: Handle max object size in the consumer
Date: Fri, 30 Dec 2022 15:20:12 +1100
Message-Id: <20221230042014.154483-6-ruscur@russell.cc>
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
index 190238f51335..aa1daec480e1 100644
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
index 5e9de06b2533..07260460e966 100644
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

