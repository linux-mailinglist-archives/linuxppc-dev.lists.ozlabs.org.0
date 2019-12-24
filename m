Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AA3129DFE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 07:05:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hm0G6Fs4zDqNQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 17:05:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="RNY1BDc3"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="X/dXvbKi"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hlp441LJzDqN5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 16:56:12 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4CDDE22036;
 Tue, 24 Dec 2019 00:56:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 24 Dec 2019 00:56:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=4VL2rvXf5bbo/
 YYVlys+nvN5T+AYKTkC0MAqwoxcqsI=; b=RNY1BDc3jqyQ7snuL6VqhiYFbV451
 qo5KtP0LkobTzZTw9CcwZMP/JyCJWr6gx6hTfjDGxY4bTlRJuU+uj00Sxk2RAhit
 Rdw1CvQhsScp4lcd43tyJtHRhJ3PvU8/0NZ9pbgpqr25Cn8oHFwAD6ddIhRszjKq
 ran4fi76zAGVuGQgo6HfKlGWy/2lU0WMBrn9YFCwSHknjeme5G3uquNf9g2SeZqn
 fYO/S9fEGDoRo26g+kut2nebFUrDv7TKzko+2onAdO99c7o5B0WdPwXUd0fG+Hsa
 C65846M1vA3AhFhvbWCq4mb7SMbAR75tpfzxAFAv3ue3rQ/h2CKPxZhzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=4VL2rvXf5bbo/YYVlys+nvN5T+AYKTkC0MAqwoxcqsI=; b=X/dXvbKi
 fOvuRuADJ1aBGEP88UvQHraAOuT2/5AWDr7lJtWg+8Q6gjhc/E6A7r19MSQ2zR3W
 8RUzRACWn6Q4EocfTpS9Bg5V7O0V4Q/2pdj3hH3RQti5M/UHIOyZhfODOl4NIQGY
 e8KSg5cTu/W8s7tT8OpQL0tqt8PzhOUKGrK5U1yP3IN06yWIVYxZF5yzAelcvTc2
 7RvySaQiYKWZ4OKAPs8Rf+es0yLcVvDl1AWnn+3ZGdl2CMBggZLv+CasNTkLD5tz
 gA+Pfiac6Z+VN561qjn/ZKql/Oh+YNNs6DvoyGxMwwh+xIOa5z+B95Fxv32qWLfO
 VVLJyhIU6J+jnQ==
X-ME-Sender: <xms:eagBXsFeNKetXKcXTgWX_Dq8Y3uKLqiDdqZlyvOrtMi3SsFunKEFQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddvuddgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdludehmdenucfjughrpefhvffufffkofgjfhgggfestdekredtredt
 tdenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecukfhppeduvddvrdelledrkedvrddutdenucfrrghrrghmpehmrghi
 lhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttgenucevlhhushhtvghrufhiii
 gvpeeg
X-ME-Proxy: <xmx:eagBXk79d5TuN1A2mSRleroxHixGPj2EQl69WgjSkaLJ4-jj2G418A>
 <xmx:eagBXqeBDg_KkYUuGqZuthmA_U3-G7SkploUjsUvw8xaTPyReQrvwg>
 <xmx:eagBXgm-fQoIZ7CC8LONNkSk8-Oi5vI3Vs0l5xBdFYtYebTQGPog2A>
 <xmx:eqgBXgRCVNvTqr4KNUunT_bpxaOqBbw4fMG_S76vYClT9NmyMUuV5g>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id C54C730607B4;
 Tue, 24 Dec 2019 00:56:06 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 5/5] powerpc/configs: Enable STRICT_MODULE_RWX in
 skiroot_defconfig
Date: Tue, 24 Dec 2019 16:55:45 +1100
Message-Id: <20191224055545.178462-6-ruscur@russell.cc>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191224055545.178462-1-ruscur@russell.cc>
References: <20191224055545.178462-1-ruscur@russell.cc>
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
index 069f67f12731..b74358c3ede8 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -31,6 +31,7 @@ CONFIG_PERF_EVENTS=y
 CONFIG_SLAB_FREELIST_HARDENED=y
 CONFIG_JUMP_LABEL=y
 CONFIG_STRICT_KERNEL_RWX=y
+CONFIG_STRICT_MODULE_RWX=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_SIG=y
-- 
2.24.1

