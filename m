Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7221817ED9E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 02:06:03 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48bxjh6ZgbzDqXD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 12:06:00 +1100 (AEDT)
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
 header.s=fm1 header.b=JrKxWdR5; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=IR4E/nLE; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48bxgc0zGRzDqRb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 12:04:08 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2A6F3221FC;
 Mon,  9 Mar 2020 21:04:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 09 Mar 2020 21:04:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=dIh8uC/4N1UI+4ilbuZrGnP794
 RY0IvXvhY5yS9b+GU=; b=JrKxWdR5cimXKdB3kJvADgGfFXrnLGbPTQWUxkON3w
 Q+qF5nQpeOcpdgz18QPcLfhbPVhgtrMTi17lg8ACntX+YLTqQdFH2y62+5seyICp
 tC2PhHQbydxTqLaApejGNU9mn9zChFkK5BGtHmRvUay5qUGFGKm9dAErQYuUTxUg
 KkSIDPLtgf1wLKYCWtzaPK4W1husUoyMEqp9omfXsD1F9cGc4fU9uBpKr9XhMB9c
 dJqeHtU1ik1fu2ZKOtMCHz4eyf4oZRj8KA7dElpohTZ/Sky1FDYVer9dy9y1GIX+
 uqNePIEfSNKkT/iNTYHG2WMxl+yjHMUMXBgrrsjPfKsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dIh8uC/4N1UI+4ilb
 uZrGnP794RY0IvXvhY5yS9b+GU=; b=IR4E/nLEUDG9fI/dFDrthcxr3DXUxQ0Lq
 JiiraKwnNwoujcmxZqMvG6QJ1WM75M9adiEKk7TthXAKqxBfMWaUlSJW4umQG5Bm
 djJhC+28mBw8qOlohw0THbqAAVsd7FNT8adfrESUAezvK7nPD2iNnYF8QhiajEZI
 wkFlEKZvSceCofVDdZZUR+K/bpcB9fk76u65IgnfRpvUVkW2HuZdZnqABSl0wxIz
 h5/BDQN6B4c3tTSDm/fGSYDm4nrWt5H7vu5B2oWyjSkmMDwhGh8hYJyEgvrQrVff
 msBeSZc/UObwu6BCIE5DuJoNdaVXIMuuCw8N8x/xlZJDay9fUuPlQ==
X-ME-Sender: <xms:g-dmXvFpX7lhQPftJpkmGDNYs9XTmo4nhQW73a5-BSQBEKyWYm4pIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudduledgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdludehmdenucfjughrpefhvf
 fufffkofgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhrvgih
 uceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecuffhomhgrihhnpehoiihlrggssh
 drohhrghenucfkphepuddvvddrleelrdekvddruddtnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:g-dmXujOt0tDs5lC47uKCUTpi3f7wAcbCfey5PSIrDPnOVpUEUP7_g>
 <xmx:g-dmXj4cQRz90Ri3w62uETh9C0_is1poX7qDJWP1qJIE0hcy4t-0jA>
 <xmx:g-dmXoc6FC2XSSOJTuGdZdwIN3SDfSWv9IwBO8kYAb4gRslML2lNKA>
 <xmx:hedmXuIt-_36sLLBxWsCqd4E35qWRXVeAunLAXvKKfv10y4iTBppnw>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 938A6328005A;
 Mon,  9 Mar 2020 21:04:00 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 0/7] set_memory() routines and STRICT_MODULE_RWX
Date: Tue, 10 Mar 2020 12:03:31 +1100
Message-Id: <20200310010338.21205-1-ruscur@russell.cc>
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

Back again, just minor changes.

v5: https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=160869

Changes since v5:
	[1/8]: Patch 8/8 squashed as suggested by Andrew Donnellan
	       Added a note to the comment of change_page_attr()
	       Rename size to sz to meet 90 chars without multiple lines

	[8/8]: Removed, change_memory_attr() section squashed, rest dropped
	       as suggested by Christophe Leroy (since I just assumed it was
	       the right thing to do instead of actually checking)

Thanks for the feedback.

Christophe Leroy (2):
  powerpc/mm: implement set_memory_attr()
  powerpc/32: use set_memory_attr()

Russell Currey (5):
  powerpc/mm: Implement set_memory() routines
  powerpc/kprobes: Mark newly allocated probes as RO
  powerpc/mm/ptdump: debugfs handler for W+X checks at runtime
  powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
  powerpc/configs: Enable STRICT_MODULE_RWX in skiroot_defconfig

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

