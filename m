Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D396E198B7A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 06:57:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rxrj2vzdzDqtV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 15:57:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=nqxRHgiE; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=mn0VXpGd; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rxgJ05LSzDqkw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 15:49:00 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F390A5C0274;
 Tue, 31 Mar 2020 00:48:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 31 Mar 2020 00:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=lHgLupnwwVnW8
 9H6t1yvE2k1Yy07V091CXapypcIwwE=; b=nqxRHgiEPi5NinYUkV2aNj2sL+Qc+
 kSp/2HgirIj6UqUYLLP7yByXPkcd5AaxtHJ8T5iyawOYdLjoDcY0g315ujNVXhwi
 2MucyVwY4UUTp1UfvuNMT8DaWM2AP0h/uGUn9SAqG6mnHFzoF1PTBriFM0NDzDO6
 wjnJy7uFHgO+XzMTTrKy2agUgknxxwFzWgVgT4ztwi5k7FDY/zYWRoPh6ggJFCye
 xp3vCu3+feEd9BWeO0h3zBqV008ZsdZfh1kJ2xBBejwcSHqW5rJHG/npGEOGoj4t
 yO6kLtTDYR9vMD/59z6ehlhgGnk/+EtCcK59YD82H0l1Q3QWze3piad0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=lHgLupnwwVnW89H6t1yvE2k1Yy07V091CXapypcIwwE=; b=mn0VXpGd
 6hLPBw4/6qJ8uqM+gOHVN+he5HuYAAex8VzjnKvkeD+t+OfzIq16fm2yl3ttFRb1
 lluQcpDOXGAYCR94RqbModPGf14IFw30RKUWaoay7S9+sCtcQvNcji5dnFD8kDh8
 VgGpFACHiwrjz9jM/b2RPyDNDBdEfPfE0U9ig/9AarceDV1WKJTRbijkj6iL8pR6
 0zV9Hk31BLz7WTKNyP7T79NgM/FGvJiQpS+fWjWmM034Y+UuY6EEOBtQrHxW9wEq
 05pGoPZFea3FBrrcQu2tX9L8mXLaePxUe1G3iUYJNZMpy6U30/bzythYL670sNEp
 GE1yNuce743M8w==
X-ME-Sender: <xms:ucuCXrtTV3mSwpj6fXO5qD5ip9t_WaNwJkg_T0gCY_qUF27eMpXwxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudeiiedgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdludehmdenucfjughrpefhvffufffkofgjfhgggfestdekredtredt
 tdenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecukfhppeduvddurdeghedrvdduvddrvdefleenucevlhhushhtvghr
 ufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvg
 hllhdrtggt
X-ME-Proxy: <xmx:ucuCXoHf7XYuHxOL2orRatnLUiLr4gonUyb_GTXxkcK8GZr62rQgEw>
 <xmx:ucuCXpOG5N0V0ubSJWX6vjZWmNET52ruNnLGRvWl9hnrfMF10aaLEg>
 <xmx:ucuCXoF3KLiaduWDwHE57yGlTw6ESOYx2U3-uLJzpbuJQYrFWzJXGQ>
 <xmx:ucuCXkAOZSFE6zv2K4MmpcTwbfzfgePYqb2HcYfFs3lc9-Nj0Xrcig>
Received: from crackle.ozlabs.ibm.com.com
 (ppp121-45-212-239.bras1.cbr2.internode.on.net [121.45.212.239])
 by mail.messagingengine.com (Postfix) with ESMTPA id 28E5F306CA96;
 Tue, 31 Mar 2020 00:48:54 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 5/7] powerpc/configs: Enable STRICT_MODULE_RWX in
 skiroot_defconfig
Date: Tue, 31 Mar 2020 15:48:23 +1100
Message-Id: <20200331044825.591653-6-ruscur@russell.cc>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200331044825.591653-1-ruscur@russell.cc>
References: <20200331044825.591653-1-ruscur@russell.cc>
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

