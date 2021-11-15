Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA64B451322
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 20:48:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtKWD1f4tz3c54
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 06:48:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=0KSmGcem;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=AG6W7724;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=0KSmGcem; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=AG6W7724; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtKSB1Gmpz2yHC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 06:46:01 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 490E5580631;
 Mon, 15 Nov 2021 14:37:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 15 Nov 2021 14:37:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm2; bh=YFFMYVihWiPWk
 tyuxrOQDQ9eoOlotAMNNpVZGNCElO4=; b=0KSmGcem0XSmBLi02KfOtT89MOTZm
 Z4IwFx+QEXZqMm9++dx+bVPqeYflclLgTijihCkbG3s6+Eky5F2lf6aFaXEqLRHD
 QXWVVps72mZG/SDaBR48uA/py4FZ/lrH/C8H4IYNePPY1SMkE7zG7RLQBeJ6iOgb
 NWmjiIROVXymlsb3OlpA9NcHUZYGin1/sGkSx5cV33lSBFFerYaA4a042ztvizP9
 lYIZ/7miQQEPhi3OzlywV4dxvBWTb/4LVxVzhZqHze5C2nL8kZ0+Szraiw+sWqSL
 YhaD1bH8jWoPpwRqkwRJkpLfmSo75LU4pv8XDfIkpXx9LtFqufoufdDtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=YFFMYVihWiPWktyuxrOQDQ9eoOlotAMNNpVZGNCElO4=; b=AG6W7724
 w7Vhj06SHRZjFE5aU+pnidCinTGfjv2nhxJZ6TS6uRSphj9r4DRwfRzwtAlwiyIu
 bfcqb9UuKAeHnI7c65ujBBKh4zFj/kh8Lv5pexFDa4EtIURbKPur0FTkBPl2Qzag
 dfp0NU1PZ+tTPSTFvTb40cpl9zNtKGA4Vv5Mtqxs4NqEQE7zaPJsCcFtjyYVOnMJ
 CM4rCwlCYtDhE/5L2eyV2fVmI2iPcdD994UiDrGP05p3G3gzrFnzL74Bm7/4In48
 NG1l/W0XuYMPkAR0fI4Haw8j13qj2IUs7iW/Dp20cmR+VZ7XEeUkvCxrdv08tiJU
 JTsrAy3/AJdG6A==
X-ME-Sender: <xms:D7eSYR6F2OCY0aXFjolRkyiLBwUm32hkrpDW71yH2l3z9yq8yQcirQ>
 <xme:D7eSYe69Z0e0J9imxreIuQ7ljrcXkMShhzOi7Hiyiin8CWsdHLManl2sSfm1bZoL7
 353LyVjCu3k_AXYlw>
X-ME-Received: <xmr:D7eSYYcKmA6JuI4rVsFCUxaAaWia70Hkyp3ZR9MO9sMh6Mmwt0A2cv0pf2oFWt0QncpB6bI9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfedtgddutddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfrhgggfestdhqredtredttdenucfhrhhomhepkghiucgj
 rghnuceoiihirdihrghnsehsvghnthdrtghomheqnecuggftrfgrthhtvghrnhepieejue
 dvueduuefhgefhheeiuedvtedvuefgieegveetueeiueehtdegudehfeelnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepiihirdihrghnsehsvg
 hnthdrtghomh
X-ME-Proxy: <xmx:D7eSYaIxidt93JQnvs-8VA9VlQE9H9wWsjtj_jteON4m098vlZF6Fw>
 <xmx:D7eSYVJynTUv1E1Gn2kLXcxam7_4OfTH85AuqAk3OrDZU0k1gkO-rQ>
 <xmx:D7eSYTz1PUmixsZoMw4rWRLueT399yXJBV5agTa10jzreI5ii-_DkA>
 <xmx:ELeSYeX-tSoOAwwfRfuGF2owt7JF4z9ZpWx6we5_tg1jp0WhR_Q9Jg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Nov 2021 14:37:51 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [RFC PATCH 3/3] arch: powerpc: adjust fadump alignment to pageblock
 aligned.
Date: Mon, 15 Nov 2021 14:37:25 -0500
Message-Id: <20211115193725.737539-5-zi.yan@sent.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211115193725.737539-1-zi.yan@sent.com>
References: <20211115193725.737539-1-zi.yan@sent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Zi Yan <ziy@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Zi Yan <ziy@nvidia.com>,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Zi Yan <ziy@nvidia.com>

CMA only requires pageblock alignment. Change fadump too.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 arch/powerpc/include/asm/fadump-internal.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/incl=
ude/asm/fadump-internal.h
index 8d61c8f3fec4..9198f20b6b68 100644
--- a/arch/powerpc/include/asm/fadump-internal.h
+++ b/arch/powerpc/include/asm/fadump-internal.h
@@ -20,9 +20,7 @@
 #define memblock_num_regions(memblock_type)	(memblock.memblock_type.cnt)
=20
 /* Alignment per CMA requirement. */
-#define FADUMP_CMA_ALIGNMENT	(PAGE_SIZE <<				\
-				 max_t(unsigned long, MAX_ORDER - 1,	\
-				 pageblock_order))
+#define FADUMP_CMA_ALIGNMENT	(PAGE_SIZE << pageblock_order)
=20
 /* FAD commands */
 #define FADUMP_REGISTER			1
--=20
2.33.0

