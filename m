Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B461D129DFD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 07:03:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hlyG2rh7zDqHF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 17:03:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="S4Zlhh/D"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="K15uznEx"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hlp10xSpzDqN5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 16:56:08 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7491E2203E;
 Tue, 24 Dec 2019 00:56:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 24 Dec 2019 00:56:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=iBR0oQDDjQO6Y
 Gl4XkS1WHXbmGR1LldgL5SE2D45VZ8=; b=S4Zlhh/DMWIu3RBFXKAJEZoLpOUz6
 zNcsQHS6x/eOYYJ+0B7vTXL79+S9pTZG3tnAxW3r7TORPtlCF4bbu/+iFNgG1WY2
 VnDDf0+vHvENtXN16uCQiLqpCgU6nAhJ0vPnNX1uIsHtDBNH1TyQTBuC0puR5bwE
 YTN9wB26mTQ1JEA9KdTeUr56cEszq2XbnUUsSuhNbyoDK3sJ3DE4zuxbzV4KmygY
 QGABM73ytLQiGxXFzwQwdffQOoSzEqywNM0NZa6FhsJAOjUafbY+Anr8HVPQ1+uE
 4uRPI43Go4J/78xM+X2ur5mBFH327fnEOBaCf1qlXTiJgeg6YRJrlXoFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=iBR0oQDDjQO6YGl4XkS1WHXbmGR1LldgL5SE2D45VZ8=; b=K15uznEx
 FjNaTkcMEvX1L8kj7tPSHbgCSB30bFIG46NTXv2uBZPc/TiAGgNDvPbUnAgDMNiA
 WNKwIFPz22mfVO711TvkAkaHNVREZ0QSrTC4SpJ61oU6S9sA1P2ChNxFwxMysmuu
 3KHp/79uR/6ZUKpxZd/9RYAJTcZkSKGbCo99inhdiw2EzQYGkq6flxxPOyQRBNMi
 o5Y+VWqH0TdW+RI0gsXpTimWrzu+IGomUa5RWA7Z6ym4Lm7lRlRoVCPeDNNqyMZ9
 6sLHFlJt+gzm1CyB5wJa9vugSlFaWfalWsPdkoSD6XTsz9EP13YRozJeLCuz/xxJ
 m4/FK1iQGeZzYw==
X-ME-Sender: <xms:dqgBXmNVcEfCWslCuH-z67fl38NWTnDZybfPaJpTyhWWp4SrHOBNoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddvuddgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvf
 fufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhr
 vgihuceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecukfhppeduvddvrdelledrke
 dvrddutdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhl
 rdgttgenucevlhhushhtvghrufhiiigvpedv
X-ME-Proxy: <xmx:dqgBXlbjbS7We3HGYiX9G1ECSIvs-fjP3sTp1nzxfE4IShrBv0Budw>
 <xmx:dqgBXkJSI4GO1MXi8renvHaEK_Mxl4CE5OOxttYmQJWgTGVXMgLcIQ>
 <xmx:dqgBXs_B3B98ndLlqYRRBeMEUH51TMrP353nFfX2OKjcj2tktUN5Tg>
 <xmx:dqgBXry5wPW2hf8U_yY-uNEigS-byEopnEPxteZ73GNxbRslKL5xzg>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 77D5030607B4;
 Tue, 24 Dec 2019 00:56:03 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 4/5] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
Date: Tue, 24 Dec 2019 16:55:44 +1100
Message-Id: <20191224055545.178462-5-ruscur@russell.cc>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191224055545.178462-1-ruscur@russell.cc>
References: <20191224055545.178462-1-ruscur@russell.cc>
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
index f0b9b47b5353..97ea012fdff9 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -135,6 +135,7 @@ config PPC
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !RELOCATABLE && !HIBERNATION)
+	select ARCH_HAS_STRICT_MODULE_RWX	if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE
 	select ARCH_HAS_UACCESS_MCSAFE		if PPC64
-- 
2.24.1

