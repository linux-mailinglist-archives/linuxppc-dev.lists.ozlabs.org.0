Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64911E974F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 08:42:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4730m60D9vzF3p0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 18:42:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="wQqtnQ5H"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="TFH+9GaA"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4730Wx0bffzF32J
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 18:31:56 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 8D664467;
 Wed, 30 Oct 2019 03:31:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 30 Oct 2019 03:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=WVehznCtMHUGH
 kkWKbgrT+yshqhj8IDof9KJa08Bq0M=; b=wQqtnQ5HYN2HhoT1Mr87LlzHxpDs7
 OMsTrzNUySexfr30//65eaX8cpiOXynT2XstIB7xpO9nDKCYhGmr4Dn20QbNrHwF
 bwOeY3brgkuk0LMOPVHmDWy+vw29Z/QqEqkIjhmEBHwKIj5kq+5emLcws1Sg+MQV
 m9b3AUY1SmWZRDPrkmHZJ6l/nXucf7c1riUjOFGSrxmjpiSNnjFpoIVgJ+hQvInW
 ks8h83RzQXMYM6bADNP5kWgntJHeVY7bjuT9Z5+ueZ7fLps/pxd6p2YXdN7DgDVn
 Ceh2utf81BEp/+TdoDIxWLBVq3lidTFgcW9ckA8zQYLrU4juPD+yJ8aQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=WVehznCtMHUGHkkWKbgrT+yshqhj8IDof9KJa08Bq0M=; b=TFH+9GaA
 0fjJovwpMWyMGSwcxoYcAkWolg1X1ViCME68QalsBhlA61Ln4C+ViZqrWDY/ojw/
 sM+Zt5IGQorEFngxAzVETzbMT976Uq4MKfJAqQ48M6WpEnv0VwHtnAVi55X1tmOA
 4mbmbUnHefBbu+akPM5BmrleJKw6sW8r3SgBpToCpBMnmxa/0CYz9JDPi1Rko5Q+
 RJCRgpcnpON1FsCp/Akomz+oA/Uf80LfdAFHRiiFaTEKbn8ENhQt+FC6Qdb3SbvU
 nQ6SmqtKNxS+vrV0pbs0LM/iXekAMHrABRayVvntgy1rlMF0CAcUIAGYvIPvNDTy
 nLlHbbkcj0CT9A==
X-ME-Sender: <xms:Yjy5XUSOURbOoxgqz9nzV3yHTBYxWD7R1_4uC-dQ_nLUOvA6kt8C6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtvddguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephf
 fvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhr
 rhgvhicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucfkphepuddvvddrleelrd
 ekvddruddtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghl
 lhdrtggtnecuvehluhhsthgvrhfuihiivgepfe
X-ME-Proxy: <xmx:Yjy5XcYDuDWKlDaq-lkoHIkasBC5ZlDCwiOIoYX75FinQY5X5xyVUA>
 <xmx:Yjy5XV5qqio72KccJdwCtev6sVlLqp3BYeMGy6m0VCQUDMiDiUtRRg>
 <xmx:Yjy5XdRCPs1UvZMNxNCYEYSUcq_7K_dFviKfCs_SyEXN-NgZLg571w>
 <xmx:Yjy5XfcnKqa4sGizMtQ1eUn6CbK-3xVhYQKCaAwAFdgx47LK5rCRQQ>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 305BF80062;
 Wed, 30 Oct 2019 03:31:42 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 4/5] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
Date: Wed, 30 Oct 2019 18:31:10 +1100
Message-Id: <20191030073111.140493-5-ruscur@russell.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030073111.140493-1-ruscur@russell.cc>
References: <20191030073111.140493-1-ruscur@russell.cc>
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
This means that Daniel's test on book3e64 is pretty useless since we've
gone from being unable to turn it *off* to being unable to turn it *on*.

I think this is the right course of action for now.

 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8f7005f0d097..52028e27f2d3 100644
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
2.23.0

