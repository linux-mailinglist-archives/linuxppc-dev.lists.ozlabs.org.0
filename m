Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9DC4B2AC2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 17:45:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwKHT0jTvz3dj8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Feb 2022 03:45:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=D3VqJlhl;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=YQN1sACl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=D3VqJlhl; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=YQN1sACl; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwKC54gMBz3bZF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Feb 2022 03:41:53 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7367F58037F;
 Fri, 11 Feb 2022 11:41:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 11 Feb 2022 11:41:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=8yuexR1+nrtHGS
 O8wGNcV0MvB+tGU4p0S4nQ2u6/h9Y=; b=D3VqJlhlbyWtV6r6GqE/sdQHhhzfao
 jEbpnb9Wr0ZReRqYHRz6KCXTCd0yivunmYqzFRoQLkQegNx2uHlUfqnjdWV/uzSJ
 zU8M0dPa33aRq+dlCTIv1HKtBD/Kh7pykEWL/ODQJPonFg0wqPv8sIrL0qYanslJ
 /JLrIUPIaJr4Z6KM4Og/F2X8lkSYDPbN7ITWDitlcOlpiq78n71xOGLIXJXz0Odg
 DRLO19YIQToJHSo/aJlV9Z59lWZxCAiI+H1agFbgcJWflqv/7sa6Z/DEHrtZkp3d
 sm83CKxYJVqNKbxcCcoENzJCEn26apNqoREHw+PQFH0GDXE8WDR4bjCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=8yuexR1+nrtHGSO8wGNcV0MvB+tGU4p0S4nQ2u6/h9Y=; b=YQN1sACl
 87xj+F47lfbNUuu2eOmgbTwH2DjTS/HIzp4OOKxqbF9Ccp5g2TMpkwWX2gBWSZNt
 EIPNTSk5Nl922Lg6gwveaU2GuyEA3/UfkKtvPP7p+AGcRnn4sIlGCdRzlTfHo2x1
 OxQNvyL/puQhqVLBtDsJccw8y7Iaq1sUjOQ2m/rnf7M6NoneAkAyKwJj4wZzSkaB
 WxyqKOeTGmYirNdGfaMPZnppY7uXdXPT4AHgxf5NVJMRxE3UDqkMzGCzf8L0gtEi
 VzZ9ycKNj3Y88HlVS7sXcuD+X/zVMZSnrQ0sI1ttCUNu1pmn/5U64GI9YlSxP+j6
 Ee5VZdGDqCSGFw==
X-ME-Sender: <xms:z5EGYoD0HNOZcFFbJ4BM6mXHloZ_7ZKKhfRmcpgqUKvf_v9Nj3klng>
 <xme:z5EGYqg29ZRCUlsrXWU4LEuzwwgbc33fWkpaJRahLkzsJe-fXsry7pQWrWrRrho17
 Ml7Nmn8zyL2dMmaxw>
X-ME-Received: <xmr:z5EGYrmNw8VWdjs_Tz1ZRVcOLW6HyNjege8PTS3V998EKzdu4gQzO5LRhGwaiyvxWsdezm1N>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrieefgdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhhrggfgsedtqhertdertddtnecuhfhrohhmpegkihcujggr
 nhcuoeiiihdrhigrnhesshgvnhhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeeuvd
 euudeuhfeghfehieeuvdetvdeugfeigeevteeuieeuhedtgeduheefleenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeiiihdrhigrnhesshgvnh
 htrdgtohhm
X-ME-Proxy: <xmx:z5EGYuz5Bj9-JaqGriH-MKRe3zFXlOgPQ60DeTL5Jzmwi573abPhjQ>
 <xmx:z5EGYtQ1VmRFqGNTnFcrQNIS2JDX1K0F3ipTVIQHg82r79TtOBAQjQ>
 <xmx:z5EGYpb_ZyVuWCbl_iOa2f738FO1CUfDztTRyhGyeaILcTWnSeqCNQ>
 <xmx:z5EGYpp4NsHG7dNpBbY_x8GNgLUNpaRSeSapkd1LGcqN-l8MqDZo0Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Feb 2022 11:41:50 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [PATCH v5 6/6] arch: powerpc: adjust fadump alignment to be pageblock
 aligned.
Date: Fri, 11 Feb 2022 11:41:35 -0500
Message-Id: <20220211164135.1803616-7-zi.yan@sent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211164135.1803616-1-zi.yan@sent.com>
References: <20220211164135.1803616-1-zi.yan@sent.com>
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
 Oscar Salvador <osalvador@suse.de>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Mike Rapoport <rppt@kernel.org>, Eric Ren <renzhengeek@gmail.com>,
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

