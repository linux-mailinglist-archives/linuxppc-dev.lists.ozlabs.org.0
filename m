Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9264916F7F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 07:28:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S5Td41GjzDqN6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 17:28:21 +1100 (AEDT)
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
 header.s=fm1 header.b=vVBBZCHx; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Ub7NgYU3; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S5PK4BrvzDqZ2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 17:24:36 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 4F42959B;
 Wed, 26 Feb 2020 01:24:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 26 Feb 2020 01:24:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=x+/2idmAuI9HRwFz8DjPzZI/Dq
 qAF8SMUv2srieGbSk=; b=vVBBZCHxYM4sCRcDSXCykaS2dYYtu4Q5Cpm7kVmuSb
 i0SF5mLZo1JskE/5n+tWykldulh8Nzy9FR0lyuYRvVvqZiysxjf2eX+0DKC+pRIe
 aahOjKF87D0uC0ZDB7rRQPWBQ+bluY/XiM9MphjN+Bb990jMzc5+3sCVqD2nRAqW
 GIv/CJou715kDuE4JbT7wSx15qIx0fQQLeNBbyN0+0ffSZKoqMOu1iahA7h0zS4q
 /vzC9WEysCT35CV5sl71X8jaYUWTz2T7RPUWEQ9DwGFI4RU6CzApjvIoGQxbD9ey
 R874x6dE5SnCjxt2wSzRht76Rs8FKS2sariBgNdlYiUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=x+/2idmAuI9HRwFz8
 DjPzZI/DqqAF8SMUv2srieGbSk=; b=Ub7NgYU3nTNpP96Wvtby+X1cv2LrC2V9E
 Kosu3BdakRynuyc5VI6vFEXeERMOYUcmkJ8jNx6gC8kAZoeQKN7VZiS0OiZ9wyxJ
 iHL5saq+3ASiKn44pHA/NQ18xaJH2J8TOj9TSNQfOFrAOIF57ymxOda+pZE1E6SF
 CvPMPoXQB9rErqJ1Its6VLZyKSrpFemsMBNBhMnu1jtOd6GY+WmJuvcky38mjNnb
 R2ZzrKlUVVmc/zIVs1hrAe6v4GB2tGLcP7UXIZsZKOmpSeG+NPtKya5qPjDUkkBx
 bg1B0PPAW+FJIvLHN5d5NFZ0/dDjCQ7lspt5il8IoKYPD7vR8TQkQ==
X-ME-Sender: <xms:Hg9WXqvkIC95Ybosj9dGeMwnFGQqK3r-GqiJEUAa36bUKc0auLk9gg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleefgdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdduhedmnecujfgurhephffvuf
 ffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicu
 oehruhhstghurhesrhhushhsvghllhdrtggtqeenucffohhmrghinhepohiilhgrsghsrd
 horhhgnecukfhppeduvddvrdelledrkedvrddutdenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:Hg9WXsGGvW6swRa-HcWG1CfVJactoE-WPdx70-NUweH07N6v4DcnoA>
 <xmx:Hg9WXpYg9VGDYrDqgUASzEMGVwWs8XHALRZaElVDdU7bUtWQ9cJkiA>
 <xmx:Hg9WXrU67W47NQm6MuNEBlV-VRIsdWF1R5stLZ4X9U6lGDmXgbNefg>
 <xmx:Hw9WXo73aaJAZ5x-1USBWInGNFNzdyOO4lfID_X8alR_1PBnfwc2Bg>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0EF5D3060BD1;
 Wed, 26 Feb 2020 01:24:27 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 0/8] set_memory() routines and STRICT_MODULE_RWX
Date: Wed, 26 Feb 2020 17:23:55 +1100
Message-Id: <20200226062403.63790-1-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 joel@jms.id.au, Russell Currey <ruscur@russell.cc>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
 arch/powerpc/include/asm/set_memory.h  |  34 ++++++++
 arch/powerpc/kernel/kprobes.c          |  17 +++-
 arch/powerpc/mm/Makefile               |   2 +-
 arch/powerpc/mm/pageattr.c             | 112 +++++++++++++++++++++++++
 arch/powerpc/mm/pgtable_32.c           |  95 +++------------------
 arch/powerpc/mm/ptdump/ptdump.c        |  21 ++++-
 9 files changed, 197 insertions(+), 93 deletions(-)
 create mode 100644 arch/powerpc/include/asm/set_memory.h
 create mode 100644 arch/powerpc/mm/pageattr.c

-- 
2.25.1

