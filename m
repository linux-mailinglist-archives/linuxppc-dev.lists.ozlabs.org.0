Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1059A17EDCD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 02:12:35 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48bxsD1xKTzDrK4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 12:12:32 +1100 (AEDT)
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
 header.s=fm1 header.b=RIWKLTk9; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=k/WUSDMT; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48bxgk0XZQzDqMk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 12:04:17 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BB06321B24;
 Mon,  9 Mar 2020 21:04:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 09 Mar 2020 21:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Z84AqZl7dQCow
 nF4r9rNWqCkiMXAjJ064l1LHKxjRLw=; b=RIWKLTk9lOqpnzngpZsEoGRC1Y0it
 QonWOBaNq3SZnlo1CU0zFMjPxdFJCLogJw7qmrvUfrPyjxxqPGlkPtoBYhAnuKYt
 CImG/9IvVNPGqo4GD+LNnsmFMXWpjrQqLUPFxsOmgFmrb4bsGfAdlAp4yZDPfCcg
 zATOqE/La1i5fDiC2R5EODBjgEMwzvjVOjCpquOX2E+8rf5NhGGJPMbcxyxUDXLC
 YDGqapzHJFihAKPsDSz7U5FFOg3z7yt5gbObclWZ6YIxGKJAaR3eSO2HjRISZkD/
 GKXkdhaz9nU8YKtt6GzzETtudn6DSHKWbsGzX8fEbrat78oUgrxpnLzQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Z84AqZl7dQCownF4r9rNWqCkiMXAjJ064l1LHKxjRLw=; b=k/WUSDMT
 avbXihHj1eHQoiLVD1PXMuaY/o8bbadcQMJNaJwuiKRnKIS/Cjun9xEkq2sbgC0G
 OJsiVLpNiVKr9MQCDbnoGkLLxhPHTyuZEwds4L8XjIpi3IXga/pCacuIjtDJusjh
 YRMIpKwu5n060JaA2pLGUakfMrsf5MI34XUd5EOKky7lbO0vS99iSt30CWGufV63
 s2W5/VAIEfFLO86ktJ9bKiO53mRd7hlz4932xCURj5QaqQ6Hv5dVecaWM75Ug0WL
 W10PHXGsDiUaniLLHaO1r+2aHtk6l8mAUkoa1EFqxK+IohsWhUA6fWS1WnnpLn2b
 ZLOsR7XLVtwIkg==
X-ME-Sender: <xms:j-dmXjn9Pob2d8K9ltI0SCcbPWWbUpkF5t8bymf5eautajqeruuPRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudduledgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvf
 fufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhr
 vgihuceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecukfhppeduvddvrdelledrke
 dvrddutdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehruhhstghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:j-dmXp6diB5FHyIxcRUMzYE2xToHEyEc7Oo_qagSdyjJKUnge_P9-A>
 <xmx:j-dmXo7WC9MROTyDrQSFV6jtyi7CFP79fgnPETl95m-PrgfTCjaXUw>
 <xmx:j-dmXpRF6i46qjcKACdO_Q98NdfU9BTuVqellR9XooXuo303Ws9zkA>
 <xmx:j-dmXuWx6uGu6LkkeBQqP7PuYgn_Q7q0phLIKjloWKFpgRcUyXK3cw>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id F1060328005E;
 Mon,  9 Mar 2020 21:04:12 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 4/7] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
Date: Tue, 10 Mar 2020 12:03:35 +1100
Message-Id: <20200310010338.21205-5-ruscur@russell.cc>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310010338.21205-1-ruscur@russell.cc>
References: <20200310010338.21205-1-ruscur@russell.cc>
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

