Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 378EFE9748
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 08:40:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4730jL6yFBzF3pn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 18:40:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="Tww42pkW"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gG69+En0"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4730Ww6V8WzF32B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 18:31:56 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id F36B947E;
 Wed, 30 Oct 2019 03:31:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 30 Oct 2019 03:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=dc5AVIQHNoFf/
 A7cIAbY87X8bxKg7zfElk6aDCs1HSg=; b=Tww42pkWm30LkhW5jHkFBwOEvZBDD
 b81996v6Bs0M+S2po+hTsjVJitX0ylEzGJ2ApHFfvdOQsiEx+WwL0LFschtGoiff
 3rGhnffxxUnYw0GkopYB6Yd35uOBV0UstdZ79BVlLvC1RpgFp+uPJQYuC2dstFb5
 n41XF4IAfOMDUpC/+iva6Pl2B5CEPVNzUcxlcpBPDpC9BGb6jtPHdk3ZgGBDMHJ9
 uqeu20jo5U+gg9rWDaJ0LvOOuRauc3TgHBQiNONOylC/kQ30Qu2qeJP5Oh5Nw3dD
 aCK0ZZARRuwAiXVIGn81e8Yj0X4+hUR31k1cObD9kMsElfFkUGJQuFrEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=dc5AVIQHNoFf/A7cIAbY87X8bxKg7zfElk6aDCs1HSg=; b=gG69+En0
 okZ1PKBi1VWrL7NU7JrkDF7mBCANG6r3qsetj5yGE7UpamgxGLs5WbPJgagnTU9f
 fjbwdLrlZulK1woLQYcbTtptIxwTn9WDYWhN+Q/62DWoLxiLWBWJVXmMMWFj1Pc0
 xPIFePoimmNMzB6nd+0PrQi986DmG9Vpbyh7kE1/qPEebN12+CJTU6zmgX0oyiNw
 XbL+sOfZ/NqLSb1z1RXZ9rMyx7DRSYpgSJc5rGnkyTtxQ7EdkBA4fLG2SCljuUAK
 T1oW5X7/dicWAAm1mJfwtiUjES/2Ik8rwqSUzjzTkJW0zVWTas/YAQpLi47BnHil
 k3iXpM8mXSuvOg==
X-ME-Sender: <xms:ZTy5XSYw1sMLV4Z6Vs-lRh5TEGcyIEsf2uT4grtZd38Xuk7zcoDVLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtvddguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephf
 fvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhr
 rhgvhicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucfkphepuddvvddrleelrd
 ekvddruddtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghl
 lhdrtggtnecuvehluhhsthgvrhfuihiivgepfe
X-ME-Proxy: <xmx:ZTy5Xb_kxM54wP237-CDUBgXzbAfpsZ2zGOwVJEUmB3_BxX0ek4YMA>
 <xmx:ZTy5XaIr9uK-UsCv32IG2e9QlZNVDWBCDCrsbjAu11QxUeEJOvYd5A>
 <xmx:ZTy5XWsBkZBXSoPTGfimDruj7Qrl6uut8fqk-Im6VVAeMvqTrzfYyw>
 <xmx:ZTy5XeVgVHnM2x95_YfDyC1JY2ZcpG3krvZczEVdDIzd29l-A0Tfdg>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 855048005A;
 Wed, 30 Oct 2019 03:31:46 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 5/5] powerpc/configs: Enable STRICT_MODULE_RWX in
 skiroot_defconfig
Date: Wed, 30 Oct 2019 18:31:11 +1100
Message-Id: <20191030073111.140493-6-ruscur@russell.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030073111.140493-1-ruscur@russell.cc>
References: <20191030073111.140493-1-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 joel@jms.id.au, Russell Currey <ruscur@russell.cc>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

skiroot_defconfig is the only powerpc defconfig with STRICT_KERNEL_RWX
enabled, and if you want memory protection for kernel text you'd want it
for modules too, so enable STRICT_MODULE_RWX there.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/configs/skiroot_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 1253482a67c0..719d899081b3 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -31,6 +31,7 @@ CONFIG_PERF_EVENTS=y
 CONFIG_SLAB_FREELIST_HARDENED=y
 CONFIG_JUMP_LABEL=y
 CONFIG_STRICT_KERNEL_RWX=y
+CONFIG_STRICT_MODULE_RWX=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_SIG=y
-- 
2.23.0

