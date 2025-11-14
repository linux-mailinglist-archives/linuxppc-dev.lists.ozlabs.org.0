Return-Path: <linuxppc-dev+bounces-14181-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90834C5E7F4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Nov 2025 18:17:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7P2n12kkz2yx7;
	Sat, 15 Nov 2025 04:17:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.10.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763140641;
	cv=none; b=ZTDh78gRNMfbDMJl6B9NbrVggM8pops/7l0yUI63CKWJFXTysULQyVPMfU/Qxj3q4oNa4vSGv9EDDsDsyYx84gAbH2tgIsZtFR+jtrM6PMrfQL/+Xs6n1e/CLtSxjktJOpWQdeu1Z7+2K/qkYy9o6ZeZ878cuU8RR1qhNrvEfWCuOIGC0tu5wZQdeTKbUu+VwsEXqZl2WGiXYhMliKvH4ZqJqex6DfZsUDHB+WrGzOChknKN8q5FzxjLw43fKSwpK70e69XpUkiGXt/IyFyuAA72VgIatH1fUDVUbmHV0D5gm+I7CcoedC5Q2TU4/1pKhEWNCz6seIfIY2EYmIc/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763140641; c=relaxed/relaxed;
	bh=LxYpN1zluBNbCgB8zRBjuTkBHjCxCX4q5kv913E2fcQ=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=bCHJ/AYojI3wgurqYEX5NNVBLWaATPgMA7M2sBMbzRO7q0Cmy0Zep2oQj585feAPLZ/wX9X+mbkgx/k4T1bB86i3e97K5G1ZphfmPYXjfCB2X6AMDPXfXcD0vg7yQSHaLubD0Xu7KA+AyJO4dha/d3WNNbfjfjK+1oUlSnR6dDVm9q5OZkoL+0hoXXsD0rVRb3BNWhz/ia8nKgndDczWCwblimNB/9quJIwcVETXCAvJTE41sZgwb2b0Kq87bCzEuWRp4MZJDf2ycgkyfKkzUM7QK/zmU47CmJjZ3ExrMv3Yg941AfR9CLotFeEVgKfl3/Ht1hjnSMPt2sC85Bj45A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de; dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=tVei6jtc; dkim-atps=neutral; spf=pass (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org) smtp.mailfrom=exactco.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=tVei6jtc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=exactco.de (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 1796 seconds by postgrey-1.37 at boromir; Sat, 15 Nov 2025 04:17:18 AEDT
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7P2k0d2fz2xqL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Nov 2025 04:17:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=LxYpN1zluBNbCgB8zRBjuTkBHjCxCX4q5kv913E2fcQ=; b=t
	Vei6jtciY99mHYdRASuucKt5Bd0G0MlsqNqiOh51eqYQW8pvlOcg4GzfLFHvr8ue125NGdF97Ybba
	u8E9CQOYQVVFgoB4jUiKzkvdBKQOaFKnbR2NJGnHvVjNzpMzKsibqNFBeFGSZaFzOeyZcda/oQtT0
	ITYexG9KKEFZ9vU/4seLNO9y6hyxQZij2FA4BbMIdrU9ZXT+uS5My27TIdUYjFj/8vQ7m5Y3QsJoa
	lmPw6I3XqPNifbaGoQvIrC/bXqgYJhLPOZ3zGLo3wMJQv33Dj/ZSmovD/qogQRqvRsxXIz4RbFnAE
	MpeTmeW+vd8nHWX1armvH4Yqo2RNybjAA==;
Date: Fri, 14 Nov 2025 17:47:14 +0100 (CET)
Message-Id: <20251114.174714.1260401393063615514.rene@exactco.de>
To: linuxppc-dev@lists.ozlabs.org
Cc: Ben Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH] fix windfarm_rm31 for RackMac logging
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Log server, not desktop G5 for RackMac windfarm.

Signed-off-by: René Rebe <rene@exactco.de>

--- a/drivers/macintosh/windfarm_rm31.c	2024-02-18 18:35:38.842532931 +0100
+++ b/drivers/macintosh/windfarm_rm31.c	2024-02-18 18:37:51.563520143 +0100
@@ -699,7 +699,7 @@
 	if (nr_chips > NR_CHIPS)
 		nr_chips = NR_CHIPS;
 
-	pr_info("windfarm: Initializing for desktop G5 with %d chips\n",
+	pr_info("windfarm: Initializing for server G5 with %d chips\n",
 		nr_chips);
 
 	/* Get MPU data for each CPU */

-- 
  René Rebe, ExactCODE GmbH, Lietzenburger Str. 42, DE-10789 Berlin
  https://exactco.de | https://t2linux.com | https://rene.rebe.de

