Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 933F958B4B4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Aug 2022 11:01:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M0GfY4Bysz3bnM
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Aug 2022 19:01:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=AjiOc4or;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Jf38Smhz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=AjiOc4or;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Jf38Smhz;
	dkim-atps=neutral
X-Greylist: delayed 415 seconds by postgrey-1.36 at boromir; Sat, 06 Aug 2022 19:00:47 AEST
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M0Gdq20vkz2xH3
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Aug 2022 19:00:47 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id E6C855C00A3;
	Sat,  6 Aug 2022 04:53:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sat, 06 Aug 2022 04:53:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1659776025; x=1659862425; bh=P7YY9gPDkFTaW1lt8W8ILrgKp
	aR7t9ZPJa7SfgfyxeA=; b=AjiOc4orsn/su0YKW2quCJuP/QLNk6MNI7o4EYOtr
	En5HIVSEjiMA8FOclkL+GiiaOGPQZ2WLxuk1ernJy+upNacmqD6bFNQyLAui7Cbc
	Ys+lAn++zTubueBb2j33vbUC/fe3uHKcOuRSGknt9pHjuRzxDbaYgLDprFDz/kg4
	XNET4/GRFv4wS/6xY6uY+OmDi8EEYZnRnVIDBPiN1+ovQrTGNTpDgxudmL+eIWG7
	q68DqTsKRyZWEdPZrznNeGhAkWIKHoUZ4XQ8XZfpGum/V4B4TWwVCKraZSJgOEwt
	YmQiyQFetYfj/0KDHzmTwvY371Xz7btcKlYizSh56f9cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1659776025; x=1659862425; bh=P7YY9gPDkFTaW1lt8W8ILrgKpaR7t9ZPJa7
	SfgfyxeA=; b=Jf38Smhz+Pupfq9lmSOkq/PBIHbsZyHT1Pd4f4K2meyTbf3vKUY
	5bIsldQk6WwZgShJmbPmjscHQymaedG8dWSpbF2qCRyJ8YEZcjolJiosyn8FyiYh
	SEUZjW9k6POHa4EsaO2x8wigt6FDfLWsZqlg4goKmfXYZYxLJMuMCrP62DaYJCt3
	7B8k2ZK+HuB9sufzwNbiNHwE8MkhKSlvms0pKatSwsYMY5MVMISrXAm0wNYYfIqh
	8LC3qcsHVI4GOEUyIAIDMpVE0S7MuZMy2cTM48EwS3ztSp3mzc5FlmKBbEmoLDmm
	VU2g4E31uu2NlnMRqyrJAG2RwC43hEPo1Vg==
X-ME-Sender: <xms:GCzuYgtGf5lTJRhVzaCV8i0OoYm_00kUP63slcN94U9hEyCU9AKy5Q>
    <xme:GCzuYtfQOBgbnWRle8NIkp6xN5eht3RVCfZvkYI2cg2Ol984gVSlSSwPsAi6l1t9s
    UsuqyV_LbZdl90ezw>
X-ME-Received: <xmr:GCzuYrxtZksssXGkYfBEPkCMBBzvUwU5EYGZDWDZ6j-HzPWHkxuZx6kZ73XbevFjNbBKFDtgpivjJWv61KV6qCiSsW-kOz0HsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeffedguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdluddtmdenucfjughrpefhvf
    evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgv
    hicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpedvge
    duteejgfevveevuddtieegleeuffevhfefueehueffkefhffehgeehjefhtdenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrh
    hushhsvghllhdrtggt
X-ME-Proxy: <xmx:GCzuYjMNZ5cYLd238Boc805Po-Np5L_XesxzBBbsYSuwNrWh1vJ_0A>
    <xmx:GCzuYg81BK5abrARVZQuZOP4mLIg5zJHXV-sj8hU7w4Rk6lJIaXefw>
    <xmx:GCzuYrWtMExSodTzPa32HxKzFsGYaw0VYZOmyJy4Q9lMfudLqCaYDw>
    <xmx:GSzuYkYw5qClCbRu4grwlSIBYSK7RXers6XrAfnFvV0UxoKqb15wBg>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 6 Aug 2022 04:53:42 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] MAINTAINERS: Remove myself as EEH maintainer
Date: Sat,  6 Aug 2022 18:53:01 +1000
Message-Id: <20220806085301.25142-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.37.1
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
Cc: Russell Currey <ruscur@russell.cc>, oohall@gmail.com, linux-pci@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I haven't touched EEH in a long time I don't have much knowledge of the
subsystem at this point either, so it's misleading to have me as a
maintainer.

I remain grateful to Oliver for picking up my slack over the years.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a9f77648c107..dfe6081fa0b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15639,7 +15639,6 @@ F:	drivers/pci/endpoint/
 F:	tools/pci/
 
 PCI ENHANCED ERROR HANDLING (EEH) FOR POWERPC
-M:	Russell Currey <ruscur@russell.cc>
 M:	Oliver O'Halloran <oohall@gmail.com>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Supported
-- 
2.37.1

