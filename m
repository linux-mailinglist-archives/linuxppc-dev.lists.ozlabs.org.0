Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5256C16F82E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 07:45:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S5sk1Q42zDqmJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 17:45:46 +1100 (AEDT)
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
 header.s=fm1 header.b=QB3lHwMo; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=O4/p3ZJv; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S5fl2QgZzDqdq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 17:36:15 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 0505063D;
 Wed, 26 Feb 2020 01:36:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 26 Feb 2020 01:36:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=xzPxK0T3LkI6AKlfQxuJpPd2C1
 +xMqQduZDssjupEwU=; b=QB3lHwMoFrMTwCghDNWOiSxy2EErGseqg/TawWgLL/
 CmgWAj7Dq0dNddaHBCPXjD69LEOLV7nMa97QhYBdjBA8zGXO0ozC2izszq2jj42m
 mBBrHd0OROYbjFKjAIlIzc6xiawriOTP0HBFugkgSFrlQuxFsIuLAirOVrGyBwgZ
 vWO5L7+T2LRmJMIuE58XBv9bKBHSZ4wwFBRJU1TJaGpy6/4IG7c5GAjGO5DdxjJJ
 XMCS7iTCTY2zvROxQSV/PtIiCcOlad5r13j3EVJ2xPuaolJ/XShJjBJHoQ+T+dCj
 iUNw0kDVMC435P01rfRCuRyGGBGQPvwpUfMzZ+Gh9a7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xzPxK0T3LkI6AKlfQ
 xuJpPd2C1+xMqQduZDssjupEwU=; b=O4/p3ZJvPHU2wN2WkpCFFxVgXlb5y7zN1
 S4fob/M5jVJbSM63v82LuesIkd809mq/nhk1qddMxU5s1ue/PuMvZV+iT1uusdwb
 eDj16F0M9uM+GRHnqa6CAF7BV0EM7ZCMadBbKUx3nBe+WQxOzPuEU21+V+OfBjYu
 MMkXMxODChCsUXnxPlVqN5OZWQOcSm/UzMV1sTZA+3huyj3b6Uk0BygbS+dbemyv
 T3czXUb7XtOv6mHRtgtKxs/ymizI49FCP/A8S9n2djbcmUdf2jrp47hL78xtpTBf
 +uXAXJEQFJZ2EQ2+gQEL47ssz5b+tUB7werucUfi7bKO6j5o/E0Cw==
X-ME-Sender: <xms:2hFWXjwZ8PsF3RYZBr82cl83KP4hW5hPWuv7R-MmO22VKlwplbOVqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleefgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdduhedmnecujfgurhephffvuf
 ffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicu
 oehruhhstghurhesrhhushhsvghllhdrtggtqeenucffohhmrghinhepohiilhgrsghsrd
 horhhgnecukfhppeduvddvrdelledrkedvrddutdenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:2hFWXgzG1ZG8GHOfcB1lBAZSUHJbv4kHMPzvGwP2MH07QsOIyRwc4Q>
 <xmx:2hFWXlqyHoV86kVxbDL8IPAjkuZo58yyNQyWbS7_Im2WUFthohiKaA>
 <xmx:2hFWXrmL_VTKqcDgkIBHo6cCG47ZY5-jyr1BvtTpt8G_PAiMWjw8kw>
 <xmx:2xFWXg762S7bax3C8pnNjvrEFv6QMzTxraRC9dRSNsZKLrVSOmF6qg>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5FB153060F09;
 Wed, 26 Feb 2020 01:36:07 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 0/8] set_memory() routines and STRICT_MODULE_RWX
Date: Wed, 26 Feb 2020 17:35:43 +1100
Message-Id: <20200226063551.65363-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.25.1
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

Repost from v4 because I somehow missed half of the final patch.

Picking up from Christophe's last series, including the following changes:

- [6/8] Cast "data" to unsigned long instead of int to fix build
- [8/8] New, to fix an issue reported by Jordan Niethe

Christophe's last series is here:
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=156428

Christophe Leroy (4):
  powerpc/mm: Implement set_memory() routines
  powerpc/kprobes: Mark newly allocated probes as RO
  powerpc/mm: implement set_memory_attr()
  powerpc/32: use set_memory_attr()

Russell Currey (4):
  powerpc/mm/ptdump: debugfs handler for W+X checks at runtime
  powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
  powerpc/configs: Enable STRICT_MODULE_RWX in skiroot_defconfig
  powerpc/mm: Disable set_memory() routines when strict RWX isn't
    enabled

 arch/powerpc/Kconfig                   |   2 +
 arch/powerpc/Kconfig.debug             |   6 +-
 arch/powerpc/configs/skiroot_defconfig |   1 +
 arch/powerpc/include/asm/set_memory.h  |  34 +++++++
 arch/powerpc/kernel/kprobes.c          |  17 +++-
 arch/powerpc/mm/Makefile               |   2 +-
 arch/powerpc/mm/pageattr.c             | 117 +++++++++++++++++++++++++
 arch/powerpc/mm/pgtable_32.c           |  95 +++-----------------
 arch/powerpc/mm/ptdump/ptdump.c        |  21 ++++-
 9 files changed, 202 insertions(+), 93 deletions(-)
 create mode 100644 arch/powerpc/include/asm/set_memory.h
 create mode 100644 arch/powerpc/mm/pageattr.c

-- 
2.25.1

