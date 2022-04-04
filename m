Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C424F12EE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 12:17:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KX6C95qf7z3bxY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 20:17:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=V5+EektB;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=RpOYc55V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm2 header.b=V5+EektB; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=RpOYc55V; 
 dkim-atps=neutral
X-Greylist: delayed 245 seconds by postgrey-1.36 at boromir;
 Mon, 04 Apr 2022 20:15:55 AEST
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KX69l6jyrz2xdN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Apr 2022 20:15:55 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 0599E5C00AF;
 Mon,  4 Apr 2022 06:15:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 04 Apr 2022 06:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; bh=yrfRuy50zXFhzu/93kUIZDWd8h+lP3MyW9/HjDGdVLY=; b=V5+Ee
 ktBwh5nFoponQKnEU2Obn4P0OuQM7Qm0ia78XchntvqNSFncG+48aO1yxmeVf4Q5
 0LPsZkm/99K8i+bWtlxJ0eFuEXvM1g/lLrl+lKsWfeTMCKqm06Y8qG/no/3sSZrn
 iLyMPemmjDUVhvol9MgO881igeisYRg3O3uuIqeq3IfNuGs8itPck6qfmxGv/ZuN
 HqyXK3eIAvWIjufgNwGJiCYVBz5NkKBaGSwAEb7jY4u9RCKbKGCHY/eVMaHvlKl0
 YQk2fOGYpicBAdEHERUAvOROf8Wv4NjRuuw+6X2KJ5YqSlKT4JsX81ISDQND01BK
 qr+SsxHC0JMB7PfKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=yrfRuy50zXFhzu/93kUIZDWd8h+lP
 3MyW9/HjDGdVLY=; b=RpOYc55Vfh6QvjLnE8p25jehw2Xqftox49ThoefAtmbm2
 5gb/CR8G2/YK7spnxgb4/jr41NWyXfjIWLCmwUY/5QEW6z8UHTJ2Epw6Xim5LYNl
 MILL6mWw6I1v3+2MHq864PFBITTK/hWkB/7ZseWavbV1svM34ii9y2fgXvBqSF9L
 tM1ANIaksUvVkB2OORmzXK4rfm+uH5VgQ2ILOAAQIS2EJ85C+3d93Z+EY8j6QJ+B
 gs4X8KajF9r8HNX5yJPdh4iPloD5iaFTVwez9xIGQx7ZmhvYwZhQOA22QeW6mSTh
 MG31sukqihJLITkqi/UZ4iB0o3T1z4wVPbyAleBQw==
X-ME-Sender: <xms:WcVKYkhCWC7XL6y1O8z10Nj3B_SB7jN6skOOPaB8tE1fdXIlNoLmPA>
 <xme:WcVKYtAEd9mZCH0o8MGF7Q4AOcO6jXB8uKhCMUijDOGblJrJG2NLR6ymebVRjLgDV
 WJP2TMdXH003s1OWw>
X-ME-Received: <xmr:WcVKYsFEIE2313kdKxbQsY-BX0Ty09P3kEmM5zanzz8tDGSG-ATNbeGBbJN79rFbLfPVvgz4V2bc8TsJi4tkCFmRTivqGV8jqBTyPLBxl8ED9UAMBwifBtsCuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejvddgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdludehmdenucfjughrpefhvf
 fufffkofgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhrvgih
 uceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepleegle
 efvdffkeegveefleevfedtieelgfdugeekueehhfevgfffkeeugfffkeefnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruh
 hsshgvlhhlrdgttg
X-ME-Proxy: <xmx:WcVKYlQYUtn3Q6Z4ILZwrCf2m27qPGvDLe-VPmsd2dNMYzGM-ML-Iw>
 <xmx:WcVKYhyYg8t7dLwbwCLNEiPqI7NMHPujSIboqDuRgRjbcLrD-q8e3A>
 <xmx:WcVKYj6IZ-SqqEDpPp2sMzBMNiZKe8qyKRF9L4JOPDGXRWAEPJ66vg>
 <xmx:WsVKYjtoRBXqGRLhBQO_4SDwMsChuZQ0qSpVIjNBasboQl8LfpP70Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Apr 2022 06:15:51 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] powerpc/powernv: Get L1D flush requirements from
 device-tree
Date: Mon,  4 Apr 2022 20:15:35 +1000
Message-Id: <20220404101536.104794-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.35.1
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

The device-tree properties no-need-l1d-flush-msr-pr-1-to-0 and
no-need-l1d-flush-kernel-on-user-access are the equivalents of
H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY and H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS
from the H_GET_CPU_CHARACTERISTICS hcall on pseries respectively.

In commit d02fa40d759f ("powerpc/powernv: Remove POWER9 PVR version
check for entry and uaccess flushes") the condition for disabling the
L1D flush on kernel entry and user access was changed from any non-P9
CPU to only checking P7 and P8.  Without the appropriate device-tree
checks for newer processors on powernv, these flushes are unnecessarily
enabled on those systems.  This patch corrects this.

Fixes: d02fa40d759f ("powerpc/powernv: Remove POWER9 PVR version check for entry and uaccess flushes")
Reported-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/platforms/powernv/setup.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index 105d889abd51..378f7e5f18d2 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -96,6 +96,12 @@ static void __init init_fw_feat_flags(struct device_node *np)
 
 	if (fw_feature_is("disabled", "needs-spec-barrier-for-bound-checks", np))
 		security_ftr_clear(SEC_FTR_BNDS_CHK_SPEC_BAR);
+
+	if (fw_feature_is("enabled", "no-need-l1d-flush-msr-pr-1-to-0", np))
+		security_ftr_clear(SEC_FTR_L1D_FLUSH_ENTRY);
+
+	if (fw_feature_is("enabled", "no-need-l1d-flush-kernel-on-user-access", np))
+		security_ftr_clear(SEC_FTR_L1D_FLUSH_UACCESS);
 }
 
 static void __init pnv_setup_security_mitigations(void)
-- 
2.35.1

