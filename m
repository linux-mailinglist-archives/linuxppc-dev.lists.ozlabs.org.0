Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 600CB477FE8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 23:10:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFRBj1z6xz3fHQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 09:10:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dzWPSU6e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f36;
 helo=mail-qv1-xf36.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=dzWPSU6e; dkim-atps=neutral
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFQzh2w0Fz3c4b
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 09:01:04 +1100 (AEDT)
Received: by mail-qv1-xf36.google.com with SMTP id m17so600536qvx.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 14:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DvMJ434CH1uK1ceYThBOiVq0e770iFS7Yqkua9hqxn8=;
 b=dzWPSU6ew/qBYLyfrqu1q7hapZ8zTRsSodnEH7fqswKSsh64ZbqW6+ebOOF4gA7Erf
 HgcLG7mUKL9IeDTFEBysYzrsjhxnHKjyrM9lOLNY0baXzCeRnQAHOws8f/QGJjSMXQAJ
 jWGdX+kw9bfJPS+09Vr5Z2JU8ybo0UlhiVrEZZEf8dlWrXD9GiMpaXcUsw1hZNCb+xgr
 0chShxyU/vT/Z6u5QfzkLz5S4jBLDlJQ6P9a8kS38WCseOLktB9zIuWZsq0291nSwPrZ
 kv3f4QksAgAyibc7bYoYvOtpLDfE45C2mzfX/WeQb/22ftFvFVC6eqmKpAXrXVP9LpyE
 9NoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DvMJ434CH1uK1ceYThBOiVq0e770iFS7Yqkua9hqxn8=;
 b=OUyRFcdeTU7a5DH4SV6kac5j00JmW07SBsPMddREc6BSyTn7e7DJkESXKQSFIK28de
 l6GEMRK7g2TaP75BQyTm0ysJz81ba9VT3AaWNGboTkLGOTcGnAUav2d/nz5JAjLBC84i
 qyQc1RvMKP2EtqSTYesdie4WQALwxSvQK3EBpFncqW7/xd8Hn0sT1E9voVv2w5veUdqL
 ReSg7pKvbSh5x32d7faXyeL8cp97TpYywp0MT9DaqDprrYaqbCEq8Wwl4o5k1K8GNlyg
 cYpofQqBLtTfwGCUk+o8qJ1gI303XchMgGJIEn00ANu7VNK8KiYUQpdIIKjEm8ovKNxO
 eXwA==
X-Gm-Message-State: AOAM531op4q8c2qV+mZjaxOAhHRCJgrhjAjim4/kl4nZPRFOL9yR8Ftb
 0TbtxOhoc1hEVINfkA55xmz3lic0SjA=
X-Google-Smtp-Source: ABdhPJx/+FtMuurEyJHxOY7s3gt1q4ZQH958kZyjbc0Z4WN0AVOhKFHQ+6RhbZTQ67VccUhRWZOUOQ==
X-Received: by 2002:a05:6214:29e7:: with SMTP id
 jv7mr8356821qvb.16.1639692061476; 
 Thu, 16 Dec 2021 14:01:01 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:dce6:135:603d:e519])
 by smtp.gmail.com with ESMTPSA id y21sm5478483qtw.10.2021.12.16.14.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:01:01 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 14/20] powerpc/4xx: Add __init attribute to eligible
 functions
Date: Thu, 16 Dec 2021 17:00:29 -0500
Message-Id: <20211216220035.605465-15-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216220035.605465-1-nick.child@ibm.com>
References: <20211216220035.605465-1-nick.child@ibm.com>
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some functions defined in 'arch/powerpc/platforms/4xx' are deserving of an
`__init` macro attribute. These functions are only called by other
initialization functions and therefore should inherit the attribute.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/platforms/4xx/cpm.c | 4 ++--
 arch/powerpc/platforms/4xx/pci.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/4xx/cpm.c b/arch/powerpc/platforms/4xx/cpm.c
index ae8b812c9202..2571841625a2 100644
--- a/arch/powerpc/platforms/4xx/cpm.c
+++ b/arch/powerpc/platforms/4xx/cpm.c
@@ -163,7 +163,7 @@ static ssize_t cpm_idle_store(struct kobject *kobj,
 static struct kobj_attribute cpm_idle_attr =
 	__ATTR(idle, 0644, cpm_idle_show, cpm_idle_store);
 
-static void cpm_idle_config_sysfs(void)
+static void __init cpm_idle_config_sysfs(void)
 {
 	struct device *dev;
 	unsigned long ret;
@@ -231,7 +231,7 @@ static const struct platform_suspend_ops cpm_suspend_ops = {
 	.enter		= cpm_suspend_enter,
 };
 
-static int cpm_get_uint_property(struct device_node *np,
+static int __init cpm_get_uint_property(struct device_node *np,
 				 const char *name)
 {
 	int len;
diff --git a/arch/powerpc/platforms/4xx/pci.c b/arch/powerpc/platforms/4xx/pci.c
index c13d64c3b019..24f41e178cbc 100644
--- a/arch/powerpc/platforms/4xx/pci.c
+++ b/arch/powerpc/platforms/4xx/pci.c
@@ -1273,7 +1273,7 @@ static int __init ppc405ex_pciex_core_init(struct device_node *np)
 	return 2;
 }
 
-static void ppc405ex_pcie_phy_reset(struct ppc4xx_pciex_port *port)
+static void __init ppc405ex_pcie_phy_reset(struct ppc4xx_pciex_port *port)
 {
 	/* Assert the PE0_PHY reset */
 	mtdcri(SDR0, port->sdr_base + PESDRn_RCSSET, 0x01010000);
-- 
2.25.1

