Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B751B4F12EB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 12:16:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KX6BS4SLjz3bl5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 20:16:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=AcjLg+WR;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FataNJlW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm2 header.b=AcjLg+WR; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=FataNJlW; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KX69p2Xlqz2xsP
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Apr 2022 20:15:58 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 74A205C00FF;
 Mon,  4 Apr 2022 06:15:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 04 Apr 2022 06:15:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=OpYjOK8qXNkeZoUyd5OhpdozVPoR9p
 h6sxuzaI33x6Y=; b=AcjLg+WRJtfTC3RcxwlgmRT+4ijHgrTZsTPbG8NC/HO5Tq
 Wuy/DD++EbAy7BViI9stqg/WrIzd3zXVagXsiIxAzjrFEUofEeAHqdclqYVQkgEN
 7HD9jkmzIk4sh+6pIkCMmExXYSBK1N0gxxgbi5zLzOczkNZZnY0iV2IoF6XzbgQY
 VOTqNHQ7iyQCxRgAp+2xij0iTHjFOSbBYCy1VzvH6/0+VN7o6fYMZQl+XY5chNB4
 df3YIMWHpa0UqsdkTk3aO77ueHz+wXVGBktBiFJVypRf+/WK1N4QP2XWSQA8r/1h
 Iy94AHO87Q6b1p0PQMvqjxXYfZRkJqPVSYxuNT1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=OpYjOK
 8qXNkeZoUyd5OhpdozVPoR9ph6sxuzaI33x6Y=; b=FataNJlWAOA11BN+T/Pxi9
 WudfIrEC9B0cbb7c+lxFRTkMW4k3kYvVmKw8vGsS2nzQlLakNgu563XvlJtk6/KZ
 F8G3ShrkJvcU1ngRiYHFtvzPuHEcdWtuV/9xfuJjH4nkN5w/RKnLJSUdd7f03/xw
 orY4m8QXW7QkaUx5zniBCwSafwxk1ZRCeO9IFUqztbWdEeLCl01E+uvbU+Dj8e1v
 jevwWScbJ41Tnm4d7+IRKluNkbjwuKtmW8h0M8m/97819nXeNI/BDSKm3OjrYMTn
 DIeyNm5BUVEH1slS1MeWsmBBa9H/tm6mChY907AuszznsARcACFf+6QViZiuHB0A
 ==
X-ME-Sender: <xms:XMVKYri0XrTy3GDHn7i1hYq0ACluyxKk3OpWXtCPHOIEhAgUtmcXKw>
 <xme:XMVKYoBeRlT3tCRJ1gA93rKn_pTOSw8OoIaoQePnUnBJUWQWaPeDrCU4eu_NFXSFJ
 8nfpBRng797uFAZog>
X-ME-Received: <xmr:XMVKYrGUPTA9GwP3V5U8pQi3D1bnQwI2LA05T2iBnnVecscqL_bc87owVpSDmct-LXMDbiuy3Q3uHwiOZ9DyQ4D2LUtYlAijGKKywyeAKn32uCILieBI9fVMFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejvddgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdludehmdenucfjughrpefhvf
 fufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhr
 vgihuceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnheple
 ehudejieefveetuedtfeevvdfhgfekjeeuieevieellefhleduhfefvdduheegnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrse
 hruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:XMVKYoTB3rOFGK6jajkcr91c2eWG79bkCqa2gWBPyHvbsfhxvd4yQA>
 <xmx:XMVKYozBqNF1vhV_VqSD-V8JB3Zn-2qKaGUPCoyIYqJRu1H-kCmmHA>
 <xmx:XMVKYu7MtDhroSqJtqKx7Cq-XW0-y_vHs6bCNJAiaecPHwA3VM0ZHg>
 <xmx:XMVKYiu1U1uP-tV4kvhbkKngSJMXd1zJ5z13xTwDt2cDRHXl_2nsow>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Apr 2022 06:15:54 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc/powernv: Get STF barrier requirements from
 device-tree
Date: Mon,  4 Apr 2022 20:15:36 +1000
Message-Id: <20220404101536.104794-2-ruscur@russell.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220404101536.104794-1-ruscur@russell.cc>
References: <20220404101536.104794-1-ruscur@russell.cc>
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
Cc: mopsfelder@gmail.com, joel@jms.id.au, npiggin@gmail.com,
 Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The device-tree property no-need-store-drain-on-priv-state-switch is
equivalent to H_CPU_BEHAV_NO_STF_BARRIER from the
H_CPU_GET_CHARACTERISTICS hcall on pseries.

Since commit 84ed26fd00c5 ("powerpc/security: Add a security feature for
STF barrier") powernv systems with this device-tree property have been
enabling the STF barrier when they have no need for it.  This patch
fixes this by clearing the STF barrier feature on those systems.

Fixes: 84ed26fd00c5 ("powerpc/security: Add a security feature for STF barrier")
Reported-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/platforms/powernv/setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index 378f7e5f18d2..824c3ad7a0fa 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -102,6 +102,9 @@ static void __init init_fw_feat_flags(struct device_node *np)
 
 	if (fw_feature_is("enabled", "no-need-l1d-flush-kernel-on-user-access", np))
 		security_ftr_clear(SEC_FTR_L1D_FLUSH_UACCESS);
+
+	if (fw_feature_is("enabled", "no-need-store-drain-on-priv-state-switch", np))
+		security_ftr_clear(SEC_FTR_STF_BARRIER);
 }
 
 static void __init pnv_setup_security_mitigations(void)
-- 
2.35.1

