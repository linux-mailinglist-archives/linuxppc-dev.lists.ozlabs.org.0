Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E812485B1E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jan 2022 22:53:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTjsG3JQ5z3cn4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 08:53:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=kNcgqXMU;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=PhZUATg9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=kNcgqXMU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=PhZUATg9; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTjm115Hnz2y7P
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 08:48:33 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4AB4D580571;
 Wed,  5 Jan 2022 16:48:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 05 Jan 2022 16:48:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm2; bh=8yuexR1+nrtHG
 SO8wGNcV0MvB+tGU4p0S4nQ2u6/h9Y=; b=kNcgqXMU4/n+0YyMRK0TyVMysDqOh
 yGnxu3188w1RZak/r6C5GGCMGkYAvYZrGUXVsCm5C/Jb9fk2x8P+Zhkbv2juEiHF
 Xx9yXwsMcFZDgw14URi8KOX4Gq3BjiqSdCn8GKzv3NQXWRkliOB0JVHVM8uS81kz
 FXWoyZvcC8pdi2IY2HIDM9KJjv4NSShQ3V/ljJO+UE1AAlyWOJHG3t1nZ3upZM6c
 K6hHMhVO16bR2AATD8DVfvQ/aYyij27BJTE7NIUx0TvMRg4mNtuYCz5coZkOImzw
 Rby2nrBx/WVcBJxX1xpgf8EFekNemKmfyEiUBjB3mQtzUXARZkQ3mfEPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=8yuexR1+nrtHGSO8wGNcV0MvB+tGU4p0S4nQ2u6/h9Y=; b=PhZUATg9
 FmZKLL8OPTeqjkwnPLyfUAOaHv5EhgMImn/cYWCeGVksMiYYzIciYyMSBtwa1hDH
 zCMqdscamUNJ9VbKXUa+IXBcuZ4nNEh60LtYJw1Gyy7ZrarTM7wCpYBEirVm+okP
 YES7YEJcbaR5e1IzVbtjM+zqax4CfbcEuaxE6NvYyGcm+/aJJ5AVvkeBkZgiJuFq
 6idpjFtqRH2qzA1FEI/Uln2s5XO78fxP3GhFfLNoCsG+v6WvjpSukS8udRI4XDeu
 yJj7Gmw41fOmt1fCiz7dqFk+yuPnwHiyM29QUQlFw2sp8YKAXCccMuYCYuzG/BA2
 DQReGxxAcIFXcg==
X-ME-Sender: <xms:LRLWYQPVidpmgi01iA-MzZbuDuRhT6Z_IJjKkBfP34fKrxdB3GTGRw>
 <xme:LRLWYW-AyiLLpcJde4tItRbz_921Vw_Be1O8-D_3ARqY5j5MeIw-G6ZDKLkPiAqMM
 fabpTHp8Wvjadrqgg>
X-ME-Received: <xmr:LRLWYXTBUF87OXxBul7SmmYv5X2QdNgcUKdPg2JXNJS8qbfmKQuYz1B3f8TGEP5BJp_-22cV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudefjedgieekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfrhgggfestdhqredtredttdenucfhrhhomhepkghiucgj
 rghnuceoiihirdihrghnsehsvghnthdrtghomheqnecuggftrfgrthhtvghrnhepieejue
 dvueduuefhgefhheeiuedvtedvuefgieegveetueeiueehtdegudehfeelnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepiihirdihrghnsehsvg
 hnthdrtghomh
X-ME-Proxy: <xmx:LRLWYYsCBFereavIdxgPqU4MOOT3p7BIVnUwwIExBXietPI4jPWS8w>
 <xmx:LRLWYYe7ZcX5PSG-JXwLG-eqVMgwlXFXAbwWTb-NcNTuScSBOo3bQQ>
 <xmx:LRLWYc2-Jua3FPZLC43ywFWwFVHK36Ata-2S4GvbOxjWi2yu6fx06A>
 <xmx:LRLWYe3ONauEy1XZrRc2lxpCjRBxgKLaO5tTCuBjiiinzKzKitiBhw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Jan 2022 16:48:28 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [RFC PATCH v3 8/8] arch: powerpc: adjust fadump alignment to be
 pageblock aligned.
Date: Wed,  5 Jan 2022 16:47:56 -0500
Message-Id: <20220105214756.91065-9-zi.yan@sent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220105214756.91065-1-zi.yan@sent.com>
References: <20220105214756.91065-1-zi.yan@sent.com>
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
Cc: Mel Gorman <mgorman@techsingularity.net>, Zi Yan <ziy@nvidia.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Eric Ren <renzhengeek@gmail.com>,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Vlastimil Babka <vbabka@suse.cz>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Zi Yan <ziy@nvidia.com>

CMA only requires pageblock alignment now. Change CMA alignment in
fadump too.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 arch/powerpc/include/asm/fadump-internal.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/incl=
ude/asm/fadump-internal.h
index 52189928ec08..fbfca85b4200 100644
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
2.34.1

