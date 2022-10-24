Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4226609916
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 06:15:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MwhYg3cQKz3brJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 15:15:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=2l25ssTV;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=I7c1+cds;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=2l25ssTV;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=I7c1+cds;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MwhXg25Plz2yyZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Oct 2022 15:14:10 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 789F95C0099;
	Mon, 24 Oct 2022 00:14:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 24 Oct 2022 00:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1666584847; x=1666671247; bh=UVPXPEIz/YUdl7NOKpr9E9wnZ
	oK+oqI/cISmONCq6AE=; b=2l25ssTVKu2of+gdNyX0RW+rN4zOGQ1Rp2O2INBSD
	h7NtzrTiuPEF5ZWetBIFieu/G1pmQba73baBmok7N3i3Gs9oet5CuZsWSY3NXlIN
	ftpOJhxzLSGBWE6N7Irb/t8JrmB5JDP043PyAyjuj1QPsvPB9x+n66GwaJF0ZH1q
	3j90YY2PNJDVu59BSOpylSgByStJAs9/mkGP0/lUNNZOjV5xKcpJqugYttmb1yHp
	x2BCciVGtfySNv+ZptiA1hRVlUJCQpxtpb7o05FGVP5SYkzK2PDiXlqyGQbhYZmZ
	pGIufoPGwhCVXliGOl/pQT5/OG2BnlqCkUHOzQumFZgSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1666584847; x=1666671247; bh=UVPXPEIz/YUdl7NOKpr9E9wnZoK+oqI/cIS
	mONCq6AE=; b=I7c1+cds0fsvy9j+yjo8iH1QWMDxgk6SE9ab+aUCTDVO1vrBXTI
	1X6XBPIqV4sWTrnqUGGTZI0GAAyVH7IXe4Mi9MMyRZ2lUVWKdTpgT129jYRS4qPg
	HaCHdnMabIfIG/Wq2KdxI4lmBBXYJOAQOYaflL7mWBbNd1DPY68BSArqGQWDFbFL
	2ZglAVvvBKYuq6gLTTLczuAl4UhBZXJ46QEAIBZHAsnMwXdMWNRRcJT0/5MAMq9K
	prRTIEk+V/IxQTc8XBqc0HWhPuK9oZ/U6C+cwrZdTsyUmmHOnOK3XFjRgBda5Nmg
	S8TpAxIrsavmtbutofFLOnGqgFMFXkL0awg==
X-ME-Sender: <xms:DxFWY2sEgzqwW8MyojWHibnd1xCyL5e0dGviXMfy9TGMgXkYu1HKfA>
    <xme:DxFWY7cfW8S1E6DJ7wmq3kDwfpP9Jr6biwI50JWsDK5IZTwAUbbifrXbkOTkuTM8a
    bRBXWX-OLDAtBDYiQ>
X-ME-Received: <xmr:DxFWYxxDX18pOjieWzck5WPejuB4D48FF_ytxxNEQ8sq_illqdd2yfKIpftl2lBjOTdJYHx-ySntAVdJKZphR0UBCAeUTY9X_LRySJLCKPlKFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtfedgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvf
    evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgv
    hicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpedvge
    duteejgfevveevuddtieegleeuffevhfefueehueffkefhffehgeehjefhtdenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrh
    hushhsvghllhdrtggt
X-ME-Proxy: <xmx:DxFWYxMnjpxF9AaPvwljuKlp5k_5TTqxU-_HhckvALgaB-DMPNODEw>
    <xmx:DxFWY295aRtaH0yFqJ8DYs5RfEfYLE1SCAYEyqPKmRONfdi2HDI9_A>
    <xmx:DxFWY5UKPSRfwPryf2Df0NV8gFtPJelV_Ad-Nh5jA4_Fj-FbWhjAyg>
    <xmx:DxFWY8nhrQaI_yZf3t6yERINpqS5hrLjfVXcBa7Vu2MCAPh6MC_rGg>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Oct 2022 00:14:05 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/8xx: Fix warning in hw_breakpoint_handler()
Date: Mon, 24 Oct 2022 15:13:46 +1100
Message-Id: <20221024041346.103608-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.37.3
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
Cc: ravi.bangoria@linux.ibm.com, Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In hw_breakpoint_handler(), ea is set by wp_get_instr_detail() except
for 8xx, leading the variable to be passed uninitialised to
wp_check_constraints().  This is safe as wp_check_constraints() returns
early without using ea, so just set it to make the compiler happy.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/kernel/hw_breakpoint.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 8db1a15d7acb..e1b4e70c8fd0 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -646,7 +646,7 @@ int hw_breakpoint_handler(struct die_args *args)
 	ppc_inst_t instr = ppc_inst(0);
 	int type = 0;
 	int size = 0;
-	unsigned long ea;
+	unsigned long ea = 0;
 
 	/* Disable breakpoints during exception handling */
 	hw_breakpoint_disable();
-- 
2.37.3

