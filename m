Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F5516F801
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 07:33:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S5bh3n5CzDqdk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 17:33:36 +1100 (AEDT)
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
 header.s=fm1 header.b=smFOLbq+; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=MQO+bh6i; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S5PW05xmzDqZN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 17:24:47 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 8BD2A595;
 Wed, 26 Feb 2020 01:24:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 26 Feb 2020 01:24:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Z84AqZl7dQCow
 nF4r9rNWqCkiMXAjJ064l1LHKxjRLw=; b=smFOLbq+zsgiAS4lVZSUu08eP5nd9
 s835PQdJ3S6lbc7vptT52P9TjNL2BSjPqVM7z9y13UBINCFDFYC/JRpDNPa0GRWn
 VEV7DCAMjqd4EmYM5FroumvXsbonrfucNaIMSbFbzbACiWLPakxy0r+seLDIoOr7
 3knro/W+bx+YdWkMVm3nSXM0E8XVug/RfxfwyC9JcgNkW3fpDw0e2ynj/UMO/zwT
 +fzQsFAwd4v3QsmRxoKsPGr4iUxm3AFcvMHWK0FsCNeifxOFjsdbca/+7n21RPyE
 kRcypIUTDjbDdX8YGIMrnEDOVzmbMRqmIiOtMtJDeiPzM7Acfp0ht7jDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Z84AqZl7dQCownF4r9rNWqCkiMXAjJ064l1LHKxjRLw=; b=MQO+bh6i
 wcuL9aHNsnUJA+jasgYE4/h/6bFaQsRPNy1PtXDoWepuS9gIiV8eBzQtV6UrVODR
 KUsVh+fkESc/CCHMu+wiyZXE9hhDH18OIDfuVmCJGqrr/6gm+pbQiFtuqr6hTqbr
 l4bFOVGXCnyIQKxO5wueCXxsVUhIYimZFjlagQr9vsPUbfYBM+SJ7cbuCrL4MNgr
 ax93nAFCFaz4Zlo7Mix+eyFtZW5obUjCvtqHKNCWFp4TRKiTZyL4l9lEH9jKUrGz
 OXmF7jVve2x3kOsS0SYkVDjwgGAhuCf46KtqMb09xWF9qCHSh/uu0ZYOsJpWO44S
 oUOsQ/grPAZQnQ==
X-ME-Sender: <xms:LA9WXhk4tGcOweXtqUryZSJ0vpPJ488NA2ASDvxr6blQnX2-fZxGAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleefgdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvuf
 ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgv
 hicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucfkphepuddvvddrleelrdekvd
 druddtnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhep
 rhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:LA9WXhFOUxgStmGl-LT1U9ZWpru2U5B-fwwQPgjxLDPJY_uw8iz3wA>
 <xmx:LA9WXipw8qo71r7smmfem2xCfrh3qmY8uMY34p04PbNRi_rDN1wq4g>
 <xmx:LA9WXl6HtntCpDmztmU83zlusyL5FkAJgUvDT2J5bIxclgqbkjOIaQ>
 <xmx:LA9WXh94XYPHmja6sWgZ3Mq8YJgt1M5Ld1ymizOJmPyJTNafRtmPSg>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3E4483060FCB;
 Wed, 26 Feb 2020 01:24:41 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 4/8] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
Date: Wed, 26 Feb 2020 17:23:59 +1100
Message-Id: <20200226062403.63790-5-ruscur@russell.cc>
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

