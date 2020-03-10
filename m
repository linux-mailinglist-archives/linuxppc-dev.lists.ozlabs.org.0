Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4531317EDD7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 02:14:14 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48bxv53qHBzDrR8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 12:14:09 +1100 (AEDT)
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
 header.s=fm1 header.b=dqt/xHsF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=gykmWXvP; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48bxgn2W99zDqMk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 12:04:21 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1FA0E221E5;
 Mon,  9 Mar 2020 21:04:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 09 Mar 2020 21:04:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=fIQUcfHh7QuR4
 38tK6lJLzDWB37n7jovUl45LUEKMUk=; b=dqt/xHsFFvs0lg06urFyb2gzqSi76
 YF8ftWdlUJk+L7KKwtUH5XMJGY/pcS5bBOExUQC4mPDMU0bnXnY74qAgBG5JxDzO
 uFguhW0KFDNcLgdqi6D01nqz8S3LCAgq14vDa6Ndu6GCGDQxUdzKJg0ovOkpbrik
 UY+n1ANFc8biHYWs25PBKULS9bERpbZy35rWwVFiR0qtELlBbUyYG+MoSLA8/K36
 p51hnfHNQ0wvofIch+Rfkk6Hha/U6W2Q4EZ+i7epoBkMq4TFZt00hNZ1HM0Vqhge
 A76AC5yoIE9SCZo9mFBd1GqPcLQUuCqwSKNMSlNKj7JRer6Kq6nEJ3Edw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=fIQUcfHh7QuR438tK6lJLzDWB37n7jovUl45LUEKMUk=; b=gykmWXvP
 n/BhakK7KixuLCtiDcgwIVRniQRq7z6qDlt6vIrNKcDtcXe8BfqLNdfUsImPL0Sa
 ERqUyLOh3NIzl3QJachDjCeNToqNNfP96F7W3S0pfXrFTWXwz3t6t1FwR2XA8cou
 iGhLdo6vD9OaQU9giWpTGKbhtLsPq8nEIXzP6+qIRAZQ0AJsqR5GSlk2OwviMknY
 Q8SJWlmhTdYZ0GbUwXVxjDsIQPOJBeuaFbd7El2OhsUUaOVgwZOdW/lHQCJCHSCd
 TNzUA0wK0U8tGedeUlJqz7NyG2ScogEDNF6WM+6A18nz5bFFnJ62D7Z16V3ftFE+
 7EU+U6kL1QJ88w==
X-ME-Sender: <xms:kudmXgNFEhjyC_ExTYQ1fJ1_WPGgnsHXaNxs5K_zvuql7cms2t0B8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudduledgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdludehmdenucfjughrpefhvffufffkofgjfhgggfestdekredtredt
 tdenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecukfhppeduvddvrdelledrkedvrddutdenucevlhhushhtvghrufhi
 iigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllh
 drtggt
X-ME-Proxy: <xmx:kudmXvwi5zJLboHt6p-Dnv5LGJvAqsjowesTvGknMmPxnoT6ROV98w>
 <xmx:kudmXt06T67kCX3dyup3sVUEIbhRMm6g0uj_eYqmDCfo2WCUo16wNw>
 <xmx:kudmXmEzXkA2H-93pJIalil6PlfAB-1vIoQwUTDTFF5dXA7jBBI9Sg>
 <xmx:k-dmXkH0-CLEf4gaLpmrvt1VVB2_p3_kI_3Hmp_Y2R8W3wAH4fvuyg>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0789E3280059;
 Mon,  9 Mar 2020 21:04:15 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 5/7] powerpc/configs: Enable STRICT_MODULE_RWX in
 skiroot_defconfig
Date: Tue, 10 Mar 2020 12:03:36 +1100
Message-Id: <20200310010338.21205-6-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com,
 Joel Stanley <joel@joel.id.au>, npiggin@gmail.com, joel@jms.id.au,
 Russell Currey <ruscur@russell.cc>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

skiroot_defconfig is the only powerpc defconfig with STRICT_KERNEL_RWX
enabled, and if you want memory protection for kernel text you'd want it
for modules too, so enable STRICT_MODULE_RWX there.

Acked-by: Joel Stanley <joel@joel.id.au>
Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/configs/skiroot_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 1b6bdad36b13..66d20dbe67b7 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -51,6 +51,7 @@ CONFIG_CMDLINE="console=tty0 console=hvc0 ipr.fast_reboot=1 quiet"
 # CONFIG_PPC_MEM_KEYS is not set
 CONFIG_JUMP_LABEL=y
 CONFIG_STRICT_KERNEL_RWX=y
+CONFIG_STRICT_MODULE_RWX=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_SIG_FORCE=y
-- 
2.25.1

