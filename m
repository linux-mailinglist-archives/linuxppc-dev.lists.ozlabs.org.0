Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 303F616F803
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 07:35:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S5dj5kbhzDqmX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 17:35:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=bJ+ybytN; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=YYhTw7Ip; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S5PZ6r3fzDqZV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 17:24:50 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 6C402544;
 Wed, 26 Feb 2020 01:24:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 26 Feb 2020 01:24:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=fIQUcfHh7QuR4
 38tK6lJLzDWB37n7jovUl45LUEKMUk=; b=bJ+ybytNw+AgsIL1M9PUKtLkAJyNb
 9EX+LPSQZRzQ3mSfNnh0E7cWyUb2vkxMxDKd7Cp/MrQC+aWIIdAqzK3KLBVhFsdp
 RfA8ZKKrDLYocx6DJxMoCIyEEdc7pNfISq5Bkj+T5ZCSevMCjP2GQpJNpLcg5U1g
 qeIfln0dxE8Pf/pCuzmCxK75gN6EEk+lLDyqwx69koesDTleXnxhpZ6zPJwdvQnY
 tIQlI12ZS8gTyXEheLg/hxpvD2NUq1J7mi6kTIy4LpZ1vnEg6djs3KWui7gFAD4S
 VWJmVC8jMasiZLRjcQ9P3labbHrtN9LMUGMVBDtmHxQ6PQnmbPGMLXXqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=fIQUcfHh7QuR438tK6lJLzDWB37n7jovUl45LUEKMUk=; b=YYhTw7Ip
 +MaYW2FOuBQoC0hwu15yFBuvVQ/M5BeX84WMuaEO7wim1oZIqKZxHaTTeBIbQZDa
 ABxkvXeJEp19sWyBOU59+5m5ukB8WPwglRp2/GmAEao5IvH/6l8WoEtVeKDe4qKY
 gwLWlcdIx4OWndHPd7o4InICAttG2a8TyH+2uNgSbpUz1ci2MD23Y440Dha7Adgo
 BR0O4iHa4rMD9jcp25HwdRsNLDhiM7A9p6wQ5ahAJv9YFPXXORNDpaCFTj2La05H
 3SWadYy5Cof3CHAiXHD/CnOufhPXlUnlPAr4RESi0eFfjyFYMyZey6W9FLie43By
 CB6kNaOz+2hCSw==
X-ME-Sender: <xms:Lw9WXorGNM58Q6lt7qGajM6EnKN0448xBnweSySu_76CvrzTzQkYCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleefgdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdduhedmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddt
 necuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhushhsvg
 hllhdrtggtqeenucfkphepuddvvddrleelrdekvddruddtnecuvehluhhsthgvrhfuihii
 vgepfeenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrd
 gttg
X-ME-Proxy: <xmx:Lw9WXqRKkns6ewi7zPXMVs_CBnMaovIMJ4VelXmNEAmymrVr_O1OtQ>
 <xmx:Lw9WXvW2MLOLt6Xsmplr-_jKef7lnqEJn9CPwpEEur_QodkwBWWrQQ>
 <xmx:Lw9WXuRUet_5axeQu1Qzde_ncxsTUN_Wj_y9Exg-AGdYW0LkT58MNw>
 <xmx:MA9WXpMv7yQUHzQqWjn00uD2UZ6RldZvVLVwVGqJf7cs2eedmkP_ag>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 86C193060F09;
 Wed, 26 Feb 2020 01:24:44 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 5/8] powerpc/configs: Enable STRICT_MODULE_RWX in
 skiroot_defconfig
Date: Wed, 26 Feb 2020 17:24:00 +1100
Message-Id: <20200226062403.63790-6-ruscur@russell.cc>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226062403.63790-1-ruscur@russell.cc>
References: <20200226062403.63790-1-ruscur@russell.cc>
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
 Joel Stanley <joel@joel.id.au>, npiggin@gmail.com, joel@jms.id.au,
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
2.25.1

