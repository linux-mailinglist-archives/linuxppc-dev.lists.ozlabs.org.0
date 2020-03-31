Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 511E4198B72
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 06:55:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rxq04sKwzDqsH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 15:55:40 +1100 (AEDT)
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
 header.s=fm1 header.b=HN0ge7rO; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=m0YhYt/X; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rxgF0xY5zDqkw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 15:48:57 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DD5AD5C0272;
 Tue, 31 Mar 2020 00:48:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 31 Mar 2020 00:48:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=YdgK5wJ0mllJO
 Oyk0mWMEHi90zL9Pke/ZAcvxVO1EF0=; b=HN0ge7rOcJmVS5YSgBnI7FNcjbNK1
 yflZMlr6PjhIhFvYqnru5rzZUib0OEKBzGrkukS4Rx6P+p5YQxWdB8biNie5x0GI
 a8STiAC4/7j616u+PtpizEH5b8TT/f7WMmgIKHuV9qNPmzG47EWDb8v1cOqXeAg/
 GegXMiW9NVqJ2rYSgqhmD+IG9LRsZvA1E9YDzCV8BUrADu671L7+tO02vthswhXX
 d+1GFh8OqGgVyslTknIpj7E7zZ4/AdzVCPf6rb9HGEDVyqPa53aU+igIbzPIgHfu
 lPeOi6zuqlxDij2BHPh2q9iQc8dCL5OvCCnZXpn3NPATsmE0019vlSaMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=YdgK5wJ0mllJOOyk0mWMEHi90zL9Pke/ZAcvxVO1EF0=; b=m0YhYt/X
 WIoOraJVRbjnE3A9OBVteVQyMODBfGLu+0us37fiUQgoKZ8nw21fLOcdH5NBLTc6
 L+3QDKS8f3zxAdL76HCDz6Ko3L77uXq+VbTCBfXjN9UYF6qoUXHELDSGJg/+LNWd
 Psy4obJJumcQFpkxOu116KpAgD3mnul1e8wLBS/VajsXR1ngT8xF59JMKW/wfOPI
 TBk4tT7kYlj5mMqOzfhrmkWHVm/+02e/ZqLc1GdqgEStZUmUbF+489pOiX2LJxUP
 bDIzE+7UGmPID01SYThJEWM9d+Me7NYqGMokPgZ6ztpq7j87BqPbQefJ8eMU6k3q
 okeiqNF65eGwPQ==
X-ME-Sender: <xms:tsuCXp6V-fsTiPeSxEayxsgA9Mcd0gkm9gBY7uzUnMr7UBMNh8mHiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudeiiedgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvf
 fufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhr
 vgihuceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecukfhppeduvddurdeghedrvd
 duvddrvdefleenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehruhhstghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:tsuCXsC-_ABZWvw9MjJ-HXmUpQ8Ay7_K5LCJxWllSqoWJAkeHFggyw>
 <xmx:tsuCXnvBrieNQmQzXrPlIioFY6-Y8LM60N0x0vqmiBzszak4wVtSZg>
 <xmx:tsuCXpvETuzyT3fjsXoxQLau2lCUChyEYrv8SywpBeJBGjgmtdaWwQ>
 <xmx:tsuCXts-4kXTA_nXvz5s6PF39QP0DGeZdFKFmcH_t9A6NI1bBp2GAA>
Received: from crackle.ozlabs.ibm.com.com
 (ppp121-45-212-239.bras1.cbr2.internode.on.net [121.45.212.239])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6DF14306CA96;
 Tue, 31 Mar 2020 00:48:52 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 4/7] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
Date: Tue, 31 Mar 2020 15:48:22 +1100
Message-Id: <20200331044825.591653-5-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 Russell Currey <ruscur@russell.cc>, dja@axtens.net
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
2.26.0

