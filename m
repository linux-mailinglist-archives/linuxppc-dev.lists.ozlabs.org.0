Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71430CB59E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 10:01:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46l2QB74gjzDqcy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 18:01:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="Dg9Djbf/"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="hLaaM5jx"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46l2Bf72rQzDqbk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 17:51:38 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 51C8E52D;
 Fri,  4 Oct 2019 03:51:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 04 Oct 2019 03:51:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=zIJvcs+zIUjZ8
 LxbvoggHqZjSIKDAr2YAIXC3G/ShgU=; b=Dg9Djbf/Fus47p4nx2rhh06INfmTI
 TWa2D6hz+BWWFqIQDUVTCVUWM2odDh0fJP9egSox4Pm0+4FXQ7HJ8v21Ig8ngo4x
 7OCx20U5NPwro6841X5n46GmEQrQVSbwnGQM3q2Ns5zDauqaGxif1i65QJzoCnYD
 51RyFRp7euoPZcEjf8m+zVUJAobOZbCN3zHG/0xARmukZ1LtSyIC1/4cGw5ChfxE
 zG8KLgsq3OXp02Sjmt0+B0a9XChH5hLhjHTMplCXbSm1aKifUOku5U1B7NqeJc2p
 qbsBnrUmblXttEEx8jLUGzfjwlukYqp3DpkrqMSptqzhznfmI8hLDF0Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=zIJvcs+zIUjZ8LxbvoggHqZjSIKDAr2YAIXC3G/ShgU=; b=hLaaM5jx
 LqIhTTr0IG4s73qB/CjM2cDiJN0aLeBGl7OVv2vdccyjF60SOq4LKkl8aSJP3ygq
 Mn2dn0CPmZo0I/2jKNSRlLjlESuIChxMiCq2w5lwrwyFydDlwHX3x4dTl1AcbQJs
 Pe/Q7N1UmIlnSuouVXysPZm1Z5YILivhjZ2xV4bkz1NZQ70u08Enyd8/QtJYYEdm
 wKMXkmdr3DrAomqpHaxxJXFxlytJ/nGflpzTFlQlTwaONwSQwBhaL7s/3S16Rmz8
 gXqW2MfCdOiuuWhXnyD9Fd5RLfaMcTYY5vb/0Rzq7atqcEItrcECJYg+lNk8/CFx
 8kjplprZnn8ALw==
X-ME-Sender: <xms:B_qWXVDa4XA4-O51TJdJoU9bm1CYDSBo1vpzfTyz7UbdlW34hyhjcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrhedtgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvuf
 ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgv
 hicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucfkphepuddvvddrleelrdekvd
 druddtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdr
 tggtnecuvehluhhsthgvrhfuihiivgepfe
X-ME-Proxy: <xmx:B_qWXbeKBKCYeXj3JDIxF2JqQnvk7w7jimTqlFUjMk3_xekrQ5-g9A>
 <xmx:B_qWXXyD6d5NjxIzY-ICxgV_tWXUtWXdsTmHHzuI8Dv-BsxFaYF_6g>
 <xmx:B_qWXWPBwYh2_vDaoT76_enAiWwgMmN57A5XToCMLqR8-i5e3PewFw>
 <xmx:B_qWXSKVgVnynCVOlPMeSPMtN5kNSrtX66nrcdD9i9qK_QT5VTg4Rw>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id CC11D80061;
 Fri,  4 Oct 2019 03:51:32 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 4/4] powerpc: Enable STRICT_MODULE_RWX
Date: Fri,  4 Oct 2019 17:50:50 +1000
Message-Id: <20191004075050.73327-5-ruscur@russell.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191004075050.73327-1-ruscur@russell.cc>
References: <20191004075050.73327-1-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, joel@jms.id.au,
 Russell Currey <ruscur@russell.cc>, rashmica.g@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Whether STRICT_MODULE_RWX is enabled by default depends on powerpc
platform - in arch/Kconfig, STRICT_MODULE_RWX depends on
ARCH_OPTIONAL_KERNEL_RWX, which in arch/powerpc/Kconfig is selected if
ARCH_HAS_STRICT_KERNEL_RWX is selected, which is only true with
CONFIG_RELOCATABLE *disabled*.

defconfigs like skiroot_defconfig which turn STRICT_KERNEL_RWX on when
it is not already on by default also do NOT enable STRICT_MODULE_RWX
automatically, so it is explicitly enabled there in this patch.

Thus, on by default for ppc32 only.  Module RWX doesn't provide a whole
lot of value with Kernel RWX off, but it doesn't hurt, either.  The next
step is to make STRICT_KERNEL_RWX compatible with RELOCATABLE so it can
be on by default.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/Kconfig                   | 1 +
 arch/powerpc/configs/skiroot_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8f7005f0d097..212c4d02be40 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -135,6 +135,7 @@ config PPC
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !RELOCATABLE && !HIBERNATION)
+	select ARCH_HAS_STRICT_MODULE_RWX
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE
 	select ARCH_HAS_UACCESS_MCSAFE		if PPC64
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

