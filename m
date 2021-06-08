Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2085A39EE70
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 07:56:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzfd14kKlz2yxW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 15:56:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=iORTMHDF;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Hef2qRey;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm2 header.b=iORTMHDF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Hef2qRey; 
 dkim-atps=neutral
X-Greylist: delayed 412 seconds by postgrey-1.36 at boromir;
 Tue, 08 Jun 2021 15:56:08 AEST
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzfcS6gQlz2yWT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 15:56:08 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 0E17D177D;
 Tue,  8 Jun 2021 01:49:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 08 Jun 2021 01:49:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=xdi8ZoMkj+ow5E1j7TUkDFOtWC
 55t0fvPrriVS5Ixkk=; b=iORTMHDFnJRLS4FwbOqubxJpghazJ61kW/hcLvAqya
 XbbOkSuEPgwd9br1aBX66quajlclsZRTEYpQK48X4eijjeB0jcMybRn1pBSIvoDE
 Qv21az9q9XY0mSt+5KJnH5hr6PhYwwGuJZhux91e3bLWpCNuYs060h/YdAnJzLh1
 hZUpmzGydQ+N+bEk1be4YF8+zD8tx6rDAT8oHCUTFzRhnFh0rfVTOvtZE0jEEEAy
 q1bisDJO6uKqRfXIFUioz3JDOVQdP8T8Ajw5VayvskIqw1BsYuqzqP2SwnAgcvFI
 0Zs0gBhdEWCuSToQYV7CCscdXUVpUrb0MytkIRRZwkPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xdi8ZoMkj+ow5E1j7
 TUkDFOtWC55t0fvPrriVS5Ixkk=; b=Hef2qReylRrJFNspXyuz0z1Tudumms/WR
 464Pmv7qtYLI4j1muR+KKtk7QOxj9x+B7ZZSpGReHbIK2VDYFvUQngE2rDILYfli
 NfUePO5w2zq4U5lwqpN6ZbgMRu1gymqq+4yyQ7OqoMSmtKGC+u9zMrdnc2sVF2p8
 z57qJTvsY7pEQFm25Gzqo7zstvy+3zNUsbn2diL3p9FQEjRKqhgi7toQGuRroJwo
 2td0Guy4kRPfYyM8GVZFnq2/Ejq+ynplu376JMjslntHdSacXFIIBU/2aFqVcf56
 Tx9/SDH+gA51EXZbdHuN9kLRD1IVpIb+rXLA0h1GKwPJsNBVttOuQ==
X-ME-Sender: <xms:1gS_YJBVl3GjZ1A-O7BC2A9jBmXammIwxGzEpJCACCjPgX4vvcRTAA>
 <xme:1gS_YHjqBF3R6a93DN1IPINbzWfJ1dQd7Iw1sGnQNZKmJimWioyPLh6prclkPT6uI
 6zisZuJ16Qi6iiIiQ>
X-ME-Received: <xmr:1gS_YEn9vzOYaWqAoaai0yp8TbIibB1usGq8javLZDBXAEKXWO7Jkuce96Z-0tKc9PQy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtkedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvf
 fufffkofgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhrvgih
 uceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepleegle
 efvdffkeegveefleevfedtieelgfdugeekueehhfevgfffkeeugfffkeefnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruh
 hsshgvlhhlrdgttg
X-ME-Proxy: <xmx:1gS_YDzafZjnirEl_RIzux8_OWH5hcoLTVUQHFyjPMRiRzA9-nPFZw>
 <xmx:1gS_YOSXO3P8SXghvD7eD679GHDKUHdhpUwtVtGKgKnY2Yz6KMLEMg>
 <xmx:1gS_YGYg7dl6g12bJVDguAce_bYroFIGAmZ9ym5HL2rtX_PAA8jrDw>
 <xmx:1gS_YH4a6gS1gWim3bb3YEEiCR6H-nftwgKOtaSRcmnKvKYIwOoF-w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Jun 2021 01:49:08 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] selftests/powerpc: Fix typo in spectre_v2
Date: Tue,  8 Jun 2021 15:48:51 +1000
Message-Id: <20210608054851.164659-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.32.0
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
Cc: Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 tools/testing/selftests/powerpc/security/spectre_v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/security/spectre_v2.c b/tools/testing/selftests/powerpc/security/spectre_v2.c
index adc2b7294e5f..e66f66bc482e 100644
--- a/tools/testing/selftests/powerpc/security/spectre_v2.c
+++ b/tools/testing/selftests/powerpc/security/spectre_v2.c
@@ -209,7 +209,7 @@ int spectre_v2_test(void)
 		break;
 	case COUNT_CACHE_DISABLED:
 		if (miss_percent < 95) {
-			printf("Branch misses < 20%% unexpected in this configuration!\n");
+			printf("Branch misses < 95%% unexpected in this configuration!\n");
 			printf("Possible mis-match between reported & actual mitigation\n");
 			return 1;
 		}
-- 
2.32.0

