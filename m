Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52071129E2B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 07:44:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hmtH34dtzDqQM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 17:44:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="P3aqrYxl"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="b6cfNRNB"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hmpj4sH5zDqDX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 17:41:49 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 11E3B21E92;
 Tue, 24 Dec 2019 01:41:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 24 Dec 2019 01:41:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=031jmz6EBoYNU
 R3BaH2ZU2C1q/5jOCaWENRfD+QKc+Q=; b=P3aqrYxlqgqNLryt/+agi2lJE9MlC
 TVtsSGwzXhQiEB0ZupsOPcAjZ86hxSvVUccAOKqMOpwfMnduRBRj3QDXGhTMmmUS
 nvXt82ERRzVU9hA9QRw91KjwebFYoNNK3SCsVl+AM5cZTHX+DLqXlsCiksmFoUQG
 YCPTek/mQWs/+Qm8JDBvLmEmwgSsqmUGEQM+GFomYwd0TbuydOyYVkT+qnmAEnBI
 eexxu2sCnZWeM/uEts+UxVTh/2cmxEt0rPYoa5wTR+6zT2sJTKbCfNifBnazthlh
 ONJFNZBMMTH+KPzYXWmyzOt7SQ12smTrrCWaZqmuRRv18tkQI4YZcHZqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=031jmz6EBoYNUR3BaH2ZU2C1q/5jOCaWENRfD+QKc+Q=; b=b6cfNRNB
 tAiNoGF4zmFPw9I2vWAGbwM05+5KJWbItqyFoviB97OgAZBuMUKwsyq7BoyE+PTV
 BJl5ioCPxM0sLipxeXHR71huJ4rEcfsLNe8J5C5ox8t2WFblTONmg75SHn/3o8Gt
 Oxulcuh4R7AFx6srqEACnYGBdt10dSeFVhUxap+/yxy/b99tudRXew/q30qbIxwy
 xr8Rcp00RdTxjPG4GIrk48hIS2SLDAkFwLhsfN16vt1tTgIbssgl2kdsvC8a3fWV
 mj2vdhztSEfxsQmavqTMwJko2zOIP7dSJ3HLHE/PDnbqUV8LbhNqpRoI805mjzc8
 xX1WRy0rIEClOg==
X-ME-Sender: <xms:K7MBXnZptm4ht6QcHFc8F8l-_rXS0vHwjGHxcInYgjFDCKuOCKfqzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddvuddgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvf
 fufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhr
 vgihuceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecukfhppeduvddvrdelledrke
 dvrddutdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhl
 rdgttgenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:K7MBXiNWZFBIIySvkHUai3cayvBSXca15ruMIfFX_X_ylc9EaFyj8w>
 <xmx:K7MBXlVYserwBLRsM55Cl6gQmyLUQvPCIOqAsvzvE7VgAFwjT8Ah1Q>
 <xmx:K7MBXnI36ZnGj5FOa9WlW-cWsihi85ln8vYxUGWnXuUKnDiFTFOqFA>
 <xmx:K7MBXntmEtYU4BTdzCUYk7JrgfE0tpXXZmYAtJMO46ygWY-4HWnShQ>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6EAC13060774;
 Tue, 24 Dec 2019 01:41:44 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc: Remove STRICT_KERNEL_RWX incompatibility with
 RELOCATABLE
Date: Tue, 24 Dec 2019 17:41:26 +1100
Message-Id: <20191224064126.183670-2-ruscur@russell.cc>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191224064126.183670-1-ruscur@russell.cc>
References: <20191224064126.183670-1-ruscur@russell.cc>
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
 Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I have tested this with the Radix MMU and everything seems to work, and
the previous patch for Hash seems to fix everything too.
STRICT_KERNEL_RWX should still be disabled by default for now.

Please test STRICT_KERNEL_RWX + RELOCATABLE!

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1ec34e16ed65..6093c48976bf 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -133,7 +133,7 @@ config PPC
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_MEMBARRIER_CALLBACKS
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
-	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !RELOCATABLE && !HIBERNATION)
+	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !HIBERNATION)
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE
 	select ARCH_HAS_UACCESS_MCSAFE		if PPC64
-- 
2.24.1

