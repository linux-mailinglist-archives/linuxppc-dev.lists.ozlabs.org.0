Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5AC6573B6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Dec 2022 08:41:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nhk3g0DhFz3cgm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Dec 2022 18:41:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=mh9/6rSE;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MWaK4nmW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=mh9/6rSE;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MWaK4nmW;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NhjxW5CGDz3bZn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Dec 2022 18:35:59 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 797A53200922;
	Wed, 28 Dec 2022 02:30:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 28 Dec 2022 02:30:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672212644; x=1672299044; bh=G1
	FeSOpt3gkzQCJztNRktkYJbX5ca/fOhO+UA6pN5AU=; b=mh9/6rSE2bVsR8C4sw
	EDzrkZNmhqkIuMfUaiLxuNFhb+ggTkQgy0TvRXbw6qhuPoj5IesXT9LTJaEAPwz7
	cFtfWnvbaw4bjN30xBQyq2I0KN7K6VoAIr9Gn9BXq6XYVisN1uVdXeAdS/LgDPSv
	X1mO/QhXYMtS4eKQvPAYO06V1ErBIn9NFSGrQvSpn0Jb630kdbNkqylcmhgoFMcP
	uQ70xe+NgM4Mu5HJHI2Ym/WpNcX9iU/geAiKhGSPjmKoO+QUbR6QEzN4bdET2vGi
	PIShy06MArXLiElxMwESSjrtakrUW1dT6UqLYwFs5X5WIHCsT6mQbh22NSiGn8Sc
	sFfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672212644; x=1672299044; bh=G1FeSOpt3gkzQ
	CJztNRktkYJbX5ca/fOhO+UA6pN5AU=; b=MWaK4nmWLmaNoMmWgKHQoR7GQULUh
	CWwwqk/SzY8uE3iCO6KJU9K715Ajp/CQ5Mo0RCIqV1ycqmrd8cAX6RjBplM2L3yW
	3qNqDU/fMhxuRpibHPd/ygOviiRkm2dlrpi75kQwojniRaJX3U1v5LE5yK88HOlM
	JWyqK3oH4ADNCwRf4t4vjBpTulDTa9b1Ty1tOICXlLI/hbBxmd9r2KdThJ/NIRcl
	wK9YIeSUSDLYVTgu08SvE0l+831aF2u5BxzC5qxmx6vC3ZvM68Q8f+we43P6Clln
	vSws+ZOyheSNswQoOrUu/yihJect4H2yrRdIZK/OjLsd+ZGVysPA1a54g==
X-ME-Sender: <xms:o_CrY41GyAJ3ehCH_la9P4sygO2R0uTroHL8Efl2yhyNIpJHSlDHHw>
    <xme:o_CrYzHUmrbtFkClpEIm-hIbtorh87TCJltYcmxxOBXCPeBolF8JfOUuHlLPqIxkj
    _sTr3-YRMJp6JR7Iw>
X-ME-Received: <xmr:o_CrYw63HO35CNlkeDHVTKCzS92ZR0pXZqYBKjzT70atHVau-8wGDA2qdf50cVCiHxMTBJXe5AF18f2sd4A5a2cZHGUb8D_NRebQBarqipm5bA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedriedugdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvf
    evufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhr
    rhgvhicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpe
    fhvdeugfdtvdeiieegffefffekieegvdfgiedtjeetffevfefhtdehjeffieeivdenucev
    lhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurh
    esrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:o_CrYx3xe-s2KU-ABGXHSFIj7oh21J7_VZ5T5lSnoqNB_LLpDc2oyA>
    <xmx:o_CrY7F7ZUc4dVZOAI-eBCP1QCtxBkDG9GcpW2FPxOB3MMh_a9nQDA>
    <xmx:o_CrY69MaZlR5ZMqK-F_JW3xUwDnFuoG8Ki-CJETHXbtWA31XRRswA>
    <xmx:pPCrY63MlQsCyhIEmruwhOOhIdSEpctNPDCyGPAAvC1YmouduJtgHw>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Dec 2022 02:30:41 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/6] powerpc/secvar: Extend sysfs to include config vars
Date: Wed, 28 Dec 2022 18:29:42 +1100
Message-Id: <20221228072943.429266-6-ruscur@russell.cc>
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

The forthcoming pseries consumer of the secvar API wants to expose a
number of config variables.  Allowing secvar implementations to provide
their own sysfs attributes makes it easy for consumers to expose what
they need to.

This is not being used by the OPAL secvar implementation at present, and
the config directory will not be created if no attributes are set.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
I played around with adding an API call to facilitate a more generic
key/value interface for config variables and it seemed like unnecessary
complexity.  I think this is cleaner.  If there was ever a secvar
interface other than sysfs we'd have to rework it, though.

 arch/powerpc/include/asm/secvar.h  |  3 +++
 arch/powerpc/kernel/secvar-sysfs.c | 40 ++++++++++++++++++++++++++----
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/secvar.h b/arch/powerpc/include/asm/secvar.h
index 92d2c051918b..250e7066b6da 100644
--- a/arch/powerpc/include/asm/secvar.h
+++ b/arch/powerpc/include/asm/secvar.h
@@ -10,6 +10,7 @@
 
 #include <linux/types.h>
 #include <linux/errno.h>
+#include <linux/sysfs.h>
 
 extern const struct secvar_operations *secvar_ops;
 
@@ -27,10 +28,12 @@ struct secvar_operations {
 #ifdef CONFIG_PPC_SECURE_BOOT
 
 extern void set_secvar_ops(const struct secvar_operations *ops);
+extern void set_secvar_config_attrs(const struct attribute **attrs);
 
 #else
 
 static inline void set_secvar_ops(const struct secvar_operations *ops) { }
+static inline void set_secvar_config_attrs(const struct attribute **attrs) { }
 
 #endif
 
diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
index ea408763dc78..0c3790345403 100644
--- a/arch/powerpc/kernel/secvar-sysfs.c
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -15,9 +15,17 @@
 
 #define NAME_MAX_SIZE	   1024
 
+const struct attribute **secvar_config_attrs __ro_after_init = NULL;
+
 static struct kobject *secvar_kobj;
 static struct kset *secvar_kset;
 
+void set_secvar_config_attrs(const struct attribute **attrs)
+{
+	WARN_ON_ONCE(secvar_config_attrs);
+	secvar_config_attrs = attrs;
+}
+
 static ssize_t format_show(struct kobject *kobj, struct kobj_attribute *attr,
 			   char *buf)
 {
@@ -134,6 +142,16 @@ static int update_kobj_size(void)
 	return 0;
 }
 
+static int secvar_sysfs_config(struct kobject *kobj)
+{
+	struct attribute_group config_group = {
+		.name = "config",
+		.attrs = (struct attribute **)secvar_config_attrs,
+	};
+
+	return sysfs_create_group(kobj, &config_group);
+}
+
 static int secvar_sysfs_load(void)
 {
 	char *name;
@@ -196,26 +214,38 @@ static int secvar_sysfs_init(void)
 
 	rc = sysfs_create_file(secvar_kobj, &format_attr.attr);
 	if (rc) {
-		kobject_put(secvar_kobj);
-		return -ENOMEM;
+		pr_err("secvar: Failed to create format object\n");
+		rc = -ENOMEM;
+		goto err;
 	}
 
 	secvar_kset = kset_create_and_add("vars", NULL, secvar_kobj);
 	if (!secvar_kset) {
 		pr_err("secvar: sysfs kobject registration failed.\n");
-		kobject_put(secvar_kobj);
-		return -ENOMEM;
+		rc = -ENOMEM;
+		goto err;
 	}
 
 	rc = update_kobj_size();
 	if (rc) {
 		pr_err("Cannot read the size of the attribute\n");
-		return rc;
+		goto err;
+	}
+
+	if (secvar_config_attrs) {
+		rc = secvar_sysfs_config(secvar_kobj);
+		if (rc) {
+			pr_err("secvar: Failed to create config directory\n");
+			goto err;
+		}
 	}
 
 	secvar_sysfs_load();
 
 	return 0;
+err:
+	kobject_put(secvar_kobj);
+	return rc;
 }
 
 late_initcall(secvar_sysfs_init);
-- 
2.38.1

