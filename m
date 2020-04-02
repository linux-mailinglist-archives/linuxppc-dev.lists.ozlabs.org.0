Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C3719BE11
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 10:51:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tGyR2nclzDrBZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 19:51:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=s8oKKLCV; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=p4RRk1Kf; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tGkd5sDFzDrNq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 19:41:29 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 992D05C01A4;
 Thu,  2 Apr 2020 04:41:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 02 Apr 2020 04:41:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=lHgLupnwwVnW8
 9H6t1yvE2k1Yy07V091CXapypcIwwE=; b=s8oKKLCVGzv7CIWboa5qpXbnjq5mC
 +c2hxm2CrgUq2nnL0cKLlz0EOh4x/VODGJT3rwPHY2AvS2arQsssz7aeGyl/EkQB
 f+oP8nPJuzTDJVrTvg907grD8aaAA7Cu+pvSntK3FCFcJM3fDneEZRzWN5W8Lrh0
 JUAtSuTTqV1qd8pTdAxsTE/TJlFI8iy6IVrzg9EUqbjqTsf2WE6abkL6u3OPOUzx
 fCPD87TDk8fW7EGy4DlxYjHp8TlW2GAxmqAp6pTNTXu6YVSvBP91cTaSVi6RS7xY
 kDKYiTo2MhmuU12dJgn4MvJwkjgAVSRoIeRsY1d17zhoGW0W70Y5+HQ+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=lHgLupnwwVnW89H6t1yvE2k1Yy07V091CXapypcIwwE=; b=p4RRk1Kf
 VQkgMxYgvMSxW7TUIt8RnLu9eNP1MW1TV6bOujW3KeQI/dcfEHmtPJMo8RhTZQ6J
 y7uT1DEnsFvrNn6qJQWBJdXU3w77RvpiF+i1rUI6g6xRVm3D8IZNkJ9MpYPdzb7e
 6CjyPI5IELuy4Gw4h1Hkhmld5V+xl1JZ/TzWx8wSzFNZgnSLJPb2Po63/ke0q2x2
 bqGc5hfMsCzB79XlDkmx+n3brbNRr/kC2hpFt1N+KwIYmc/joe4yYW9lvVThQMwY
 Au8yGtELY+h3O6LwgxDST4My7q6Dn6ToNceI0rZtZT5cYiytZNU95SvRPUkzE2bI
 qzmXC69RQXNcEg==
X-ME-Sender: <xms:N6WFXq0DpMVAhoRa136LkVhnHv_yPObp7aWMUBethJSaNT8aXMDCaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdeggddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdduhedmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddt
 necuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhushhsvg
 hllhdrtggtqeenucfkphepuddvuddrgeehrddvuddvrddvfeelnecuvehluhhsthgvrhfu
 ihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlh
 hlrdgttg
X-ME-Proxy: <xmx:N6WFXhX0w4xW3mLKdZSl6pSRIRRROZvqgumRHDO7_OZSfJRlY56Pdg>
 <xmx:N6WFXt63wPdG4ggakB1c7cbennjt65LJrj99-pu0T7xsH3Mni4Yv6A>
 <xmx:N6WFXgLH5rXT2O2bJnp1kwbcTLNbV0NhnEa91w21ZfPKsOTpg6Wk_A>
 <xmx:N6WFXoPmLqat3FmLp5AMg5XsMo5JK4i-pPS1BnZXNmlrPYuV2p91ww>
Received: from crackle.ozlabs.ibm.com.com
 (ppp121-45-212-239.bras1.cbr2.internode.on.net [121.45.212.239])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3020A328005A;
 Thu,  2 Apr 2020 04:41:23 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 5/7] powerpc/configs: Enable STRICT_MODULE_RWX in
 skiroot_defconfig
Date: Thu,  2 Apr 2020 19:40:50 +1100
Message-Id: <20200402084053.188537-5-ruscur@russell.cc>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200402084053.188537-1-ruscur@russell.cc>
References: <20200402084053.188537-1-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com,
 Joel Stanley <joel@joel.id.au>, npiggin@gmail.com,
 Russell Currey <ruscur@russell.cc>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

skiroot_defconfig is the only powerpc defconfig with STRICT_KERNEL_RWX
enabled, and if you want memory protection for kernel text you'd want it
for modules too, so enable STRICT_MODULE_RWX there.

Acked-by: Joel Stanley <joel@joel.id.au>
Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/configs/skiroot_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 1b6bdad36b13..66d20dbe67b7 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -51,6 +51,7 @@ CONFIG_CMDLINE="console=tty0 console=hvc0 ipr.fast_reboot=1 quiet"
 # CONFIG_PPC_MEM_KEYS is not set
 CONFIG_JUMP_LABEL=y
 CONFIG_STRICT_KERNEL_RWX=y
+CONFIG_STRICT_MODULE_RWX=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_SIG_FORCE=y
-- 
2.26.0

