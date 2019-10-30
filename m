Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEFDE9759
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 08:44:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4730pr3HjTzF3sC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 18:44:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.18;
 helo=wnew4-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="sqo0sz7g"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="UlU/1t96"; dkim-atps=neutral
X-Greylist: delayed 555 seconds by postgrey-1.36 at bilbo;
 Wed, 30 Oct 2019 18:41:03 AEDT
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4730kR3R4KzF3qk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 18:41:03 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 7A7C144F;
 Wed, 30 Oct 2019 03:31:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 30 Oct 2019 03:31:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=mssX/JsM5ogaFI8hQrBomCiQNI
 6JK2VPU5sG5BOkvxU=; b=sqo0sz7g86Zgw122bLtbPZXSyq+qdB54dZkslVfD9g
 oIiPN29EbfFRX837pTasKQ4ODTfrbbliCT00RMBZt4auyNeQVfF866uiPflgZjdn
 I5ZilGYgkoXdxJ/dtn1zUwLeo4h03we7HS2681l1PPp4GS4ZhK0rxV2NUX/kP5ap
 Wf+BTHdFTx84gDHFRJf1tmLFIITFMGrz9PSSMjX9M6tYonFNuL1gCa5sYMxRbB4Q
 ORzOjQWT5z4apZ48HV9dflAa+IpfIUWwo5yYkPiwTKDFxB71xQcxZrooLeZT6W81
 OsDnySJEBguMBbABub3vwxRXoLyb4Mh0X/KgwfNAu3ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=mssX/JsM5ogaFI8hQ
 rBomCiQNI6JK2VPU5sG5BOkvxU=; b=UlU/1t96timajT615rqwG5vx1QR/ipwar
 GTfCWVCfmMC3vqzxfgb+h4/+yxATsglYSul146vmEt2PNJP4rT8548Gi6r2UFjOE
 +/E2xClckV/BJdNsLRpicDTjJFItktu1DahPipNvLcUUG2RLJ9oqjNhDtck/zhXW
 ZAfROFeQvMHJA4S+YhWYfGAXObcJ1FsoGQYiTAFiYh3b2m3Wl32dBxcXJPRqRXkq
 BJLwT/pyJDL+CKwSGuo6XwytfS+UY8P2RG2fGyoiJH/dGgEQHtXtYoJlCQZtCocc
 fJ1QHPn7py9Vz0pq0bu4SQ2TiWCL1GFIap85wxzty8PqY+FjOICDw==
X-ME-Sender: <xms:VDy5XW7ZHKuyUF5PiPYbrX0pTPXYtKhNHi0LXCBbVSbPhTQsDPJmng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtvddguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdduhedmnegovehorghsth
 grlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgggfestdekredt
 redttdenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
 hsshgvlhhlrdgttgeqnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkphepuddv
 vddrleelrdekvddruddtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrh
 hushhsvghllhdrtggtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:VDy5XRG7LNlcjNlLQVPdXUF0pdPwMu-WL54eoXPcISXCJUIYzWEB7A>
 <xmx:VDy5XV7Wg77pnKBwN-vJVMjT15YB1gScIeRyXhRcsZ6k044sQs5ITQ>
 <xmx:VDy5Xcg9ri8eJDLSrSK3VvSdYDHg8zOZrjkzNu2K4q5yHrENS2z-jw>
 <xmx:Vjy5XY01lPbca6uwyt4o5O3TJRH5t2KUIeLjCw_4g-5LUf9icc5d_drLuxQ>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8B2E880059;
 Wed, 30 Oct 2019 03:31:29 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 0/5] Implement STRICT_MODULE_RWX for powerpc
Date: Wed, 30 Oct 2019 18:31:06 +1100
Message-Id: <20191030073111.140493-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.23.0
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

v4 cover letter: https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-October/198268.html
v3 cover letter: https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-October/198023.html

Changes since v4:
	[1/5]: Addressed review comments from Michael Ellerman (thanks!)
	[4/5]: make ARCH_HAS_STRICT_MODULE_RWX depend on
	       ARCH_HAS_STRICT_KERNEL_RWX to simplify things and avoid
	       STRICT_MODULE_RWX being *on by default* in cases where
	       STRICT_KERNEL_RWX is *unavailable*
	[5/5]: split skiroot_defconfig changes out into its own patch

The whole Kconfig situation is really weird and confusing, I believe the
correct resolution is to change arch/Kconfig but the consequences are so
minor that I don't think it's worth it, especially given that I expect
powerpc to have mandatory strict RWX Soon(tm).

Russell Currey (5):
  powerpc/mm: Implement set_memory() routines
  powerpc/kprobes: Mark newly allocated probes as RO
  powerpc/mm/ptdump: debugfs handler for W+X checks at runtime
  powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
  powerpc/configs: Enable STRICT_MODULE_RWX in skiroot_defconfig

 arch/powerpc/Kconfig                   |  2 +
 arch/powerpc/Kconfig.debug             |  6 +-
 arch/powerpc/configs/skiroot_defconfig |  1 +
 arch/powerpc/include/asm/set_memory.h  | 32 +++++++++++
 arch/powerpc/kernel/kprobes.c          |  3 +
 arch/powerpc/mm/Makefile               |  1 +
 arch/powerpc/mm/pageattr.c             | 77 ++++++++++++++++++++++++++
 arch/powerpc/mm/ptdump/ptdump.c        | 21 ++++++-
 8 files changed, 140 insertions(+), 3 deletions(-)
 create mode 100644 arch/powerpc/include/asm/set_memory.h
 create mode 100644 arch/powerpc/mm/pageattr.c

-- 
2.23.0

