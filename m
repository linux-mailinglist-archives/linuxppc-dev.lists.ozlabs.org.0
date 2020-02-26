Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4FB16F83C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 07:52:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S61r1H0PzDqST
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 17:52:48 +1100 (AEDT)
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
 header.s=fm1 header.b=cLPnvYBQ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=TalURqec; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S5g00HxwzDqjX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 17:36:28 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 358DB607;
 Wed, 26 Feb 2020 01:36:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 26 Feb 2020 01:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Z84AqZl7dQCow
 nF4r9rNWqCkiMXAjJ064l1LHKxjRLw=; b=cLPnvYBQqMLw3R/nIKxs4X0Dxb9u/
 wxDQORKzLLo49WE4d18S6N4rklknBW3cr2gnuvq/x6sELNRsczY5J70gvN4zINLw
 lLfLq7de96Lyd0NyjEnVF239zQ/2UapFsXH+vEz8lbkmzilxj93WJSbtEkt3L4yj
 8VKKrjY+qXDOTyKdDy47iX5Nry2JLM5YukiCNgRjv6vLb1p3dze5cvkQN68nKrW7
 xbrzbZBNugSH3lFHfSDmhgURtQw+Rpmuthy95UQLVfe/6Tb8YpOurrPIs3PqbB8Q
 YlZNQSjwCgfd81XdH9lMKhp0OJZawz4XscGkZO7Ro6sNUvtgqYLAmhJ7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Z84AqZl7dQCownF4r9rNWqCkiMXAjJ064l1LHKxjRLw=; b=TalURqec
 i6u8jSfsk43AUKcBm8OMNoaYnpSLd0bhc6hv4ax8F9Uu5sE1Vul6cP/5fRVLh/gK
 NIOcsxSJNokTJwEIIMItseOdw/H0mu7SggW1H59MJOxWZse0BV11CPUclJkkOS4x
 lwSyx12UR7m/RlsOhzBcnc/tV2xLjreYC9e25lPS3oyfFY2WizKo87/rtdtyQRCY
 wjdVdRYnOLWs7eOKY4XHtohnocoyG0YLSZF4dHbwU1+YfWtHuoFmdhrex8rIvkXT
 XfZvpAaM32pDUYU5faQhIt0+TDDNQh6FN4gEGDuyOFlJcTJTCxcg0xJ17RAcnsvJ
 v+8+pVJm7dX2HQ==
X-ME-Sender: <xms:6BFWXhYPGABShvuJYKkqaNE3TYVSiGQ30qBi-iv4ny6YOzt3MDQQeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleefgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvuf
 ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgv
 hicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucfkphepuddvvddrleelrdekvd
 druddtnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhep
 rhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:6BFWXqSI2M6CXv89DQ2AhN4gj4Ccz_z6BbY_STTdEqrxkusSqKyHrg>
 <xmx:6BFWXpG3g72cogPureOo3xdPzSyqy6aWsNOBLWlcQoier96XQ3AGmg>
 <xmx:6BFWXv3XfklLijIkRa_w5Rz3cWQhKkGLTK30o_XQgtjP4Umx8uN8lQ>
 <xmx:6BFWXpan8UYfI3VAlyckSgukvu594-WjWubRJuu52G3LwW9vqpdLmw>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8F4D43060FE0;
 Wed, 26 Feb 2020 01:36:21 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 4/8] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
Date: Wed, 26 Feb 2020 17:35:47 +1100
Message-Id: <20200226063551.65363-5-ruscur@russell.cc>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226063551.65363-1-ruscur@russell.cc>
References: <20200226063551.65363-1-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, jniethe5@gmail.com,
 Russell Currey <ruscur@russell.cc>, npiggin@gmail.com, joel@jms.id.au,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To enable strict module RWX on powerpc, set:

    CONFIG_STRICT_MODULE_RWX=y

You should also have CONFIG_STRICT_KERNEL_RWX=y set to have any real
security benefit.

ARCH_HAS_STRICT_MODULE_RWX is set to require ARCH_HAS_STRICT_KERNEL_RWX.
This is due to a quirk in arch/Kconfig and arch/powerpc/Kconfig that
makes STRICT_MODULE_RWX *on by default* in configurations where
STRICT_KERNEL_RWX is *unavailable*.

Since this doesn't make much sense, and module RWX without kernel RWX
doesn't make much sense, having the same dependencies as kernel RWX
works around this problem.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index bd074246e34e..e1fc7fba10bf 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -131,6 +131,7 @@ config PPC
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !HIBERNATION)
+	select ARCH_HAS_STRICT_MODULE_RWX	if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE
 	select ARCH_HAS_UACCESS_MCSAFE		if PPC64
-- 
2.25.1

