Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 860CC19BDE8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 10:49:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tGvG6MzlzDrPB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 19:48:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=AeMKmsWv; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=TAqpJN+M; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tGkY6ntxzDrNV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 19:41:25 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DCEF35C01A1;
 Thu,  2 Apr 2020 04:41:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 02 Apr 2020 04:41:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=D35Sp4/q5XH3f
 eqqq2i54P8WdPsSvOStPArRH93EKL4=; b=AeMKmsWvSKArCGXlNReAmXhM0DVdA
 RygWzGXT9sB+/SMVYr/VRDeQhx4cWoC5oawJ+P8f8T8mulnslOCAcwoeEOszRjnN
 vaA59EJXE1q65aJ7q/n9PqK/hmOX35v5rDptze1Gw4NJNkfG6zSHd5bsIGVaulSn
 P3CeuqOlMPEUXF3JAnuPyZ06SbHmFvcxgU4MfGYKTbwVYzbAw1t1b0VT5GHWhFlB
 iehphtSPOOwWKI/eml3jMzDpdA6EEibhb7g04wHaYZpN/iTIEFpAeD13bSbN27gG
 XMvel3xXk1VyeP+t6e6hf47fEeqLjz9fGpbsWcpMopY6CjQkv84zwamUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=D35Sp4/q5XH3feqqq2i54P8WdPsSvOStPArRH93EKL4=; b=TAqpJN+M
 6OolBIUOTLuC2SjQ3TIfFxECndjl+7Q4nWv7WiDbcYoa0OGXkHso/jZTKGZ7pRoe
 MnCRoeMDxmpJHkthO2WmlR4uHUxJeNPRq45o3gKcaj1w14aB0m0SKgg4P5khVg7k
 bxo3w6kNWBfg9aVCNydpZUnZFxQSSEczZz9sRV89tBSToSIo6Gs1R1mTYLtbftSC
 WM5UHmbyWPlPUYkYzV/YPHM9aYRjn95IEpEbpYXl1dU8VqTRSU4Nz2nevMV8HXx/
 8PXDoZBpXrA5yM1c/9KuxrOcojI+YQsJBRuy70MDpE791NaH9iwxqP806TNg20GU
 +H72s2NMf5m32A==
X-ME-Sender: <xms:M6WFXolO0l1SC6vChmJ-HX-U_TpbsaxxGsH4r2Im-Pm7PMgxi3hs4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdeggddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvuf
 ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgv
 hicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucfkphepuddvuddrgeehrddvud
 dvrddvfeelnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhho
 mheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:M6WFXsF7i7qLPCnHyuwObJMglM4Vu8HkLOCb9Ct0ZvBEEu6waLD95Q>
 <xmx:M6WFXhoEKvQG9-YR-gZhlnm_yWd0Oqk4TIwljYa8LYitbhy7Mca_JA>
 <xmx:M6WFXo4kihhoFnWC613Cb8AVNxAPX3DIDiSg8LLl1O-jpwiHRp_4Jw>
 <xmx:M6WFXr0-BjWywE2TCF1Bk4r_-0GZHy6QsqZ1X8YggA0krhxRxdz3nA>
Received: from crackle.ozlabs.ibm.com.com
 (ppp121-45-212-239.bras1.cbr2.internode.on.net [121.45.212.239])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0D142328005A;
 Thu,  2 Apr 2020 04:41:20 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 4/7] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
Date: Thu,  2 Apr 2020 19:40:49 +1100
Message-Id: <20200402084053.188537-4-ruscur@russell.cc>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200402084053.188537-1-ruscur@russell.cc>
References: <20200402084053.188537-1-ruscur@russell.cc>
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
index 399a4de28ff0..1488bb5f4179 100644
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

