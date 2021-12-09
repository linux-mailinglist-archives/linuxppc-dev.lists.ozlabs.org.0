Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BA846F740
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 00:09:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J98qh5kd3z3clH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 10:09:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=EWH4R1T6;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=HZtl8rio;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=EWH4R1T6; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=HZtl8rio; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J98kR4cMJz300S
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 10:04:47 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id D8885580336;
 Thu,  9 Dec 2021 18:04:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 09 Dec 2021 18:04:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm2; bh=AnymEuCYCocHA
 Ds+cC0A+imh3dmQP2pOP/ONvg/OKOg=; b=EWH4R1T6XLR7/XPYv2+SuW3bSclZ2
 Kvvb5NsB7w82sEJmQn0JTB+0tYZOTesLZT4rKW45XSVxeH1bnS7C74KuCr4rc4MT
 p8BtjGButAGWBNV4uo+rZcJ3rKJswkkAJkPSP+Zqdo7YaZ6Zf+UbAsWH2oQ1IVu5
 y7x1kCiTvV6CbZBdLUT2NhuhIGI0vBByiLkfoLEdr6U32Cu6Rz/ZGFsfDuIYwnms
 wLY7nz1uydR2fz3GqBsSnRTesabSsmAgM5e6agHA8En5BtHs2HlAphAH1MBOpPsu
 m4O5k9GgUc1WCJD0+OoSKxbUvdWgPIcq+VlI1Uso6SDFOSpgDCfEEXzdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=AnymEuCYCocHADs+cC0A+imh3dmQP2pOP/ONvg/OKOg=; b=HZtl8rio
 tiDaICvgAUzv/4f1nQmSHjhBIUEQFY861mwC2NyYz6pCsrC7nu3u9UtEXyZVB/mx
 BjBVhTTTu0BpzEwPwkHvBsIVW5nwvpZQgy+QrLPmAH1nl952z6L38W21OrhYwnhc
 peJfhNpeHrz2BC7QfBdFv4KCbeG/ZZhUQWLtQy4lYqiwpdWIWIqCWQd4ToWrz5GP
 9N+4GLDRjrKZai/PggjolYf5hbvep3tSuZMRz/X/MuyX5iv7HYnYBXPwaOZiP3m8
 wAcugQbbt7v/J1Mf/NXWwgXTu4BjEh+XMdDtHqmxke9L9OqmXsy3lbasdxV1vKnd
 T6WCa5FKe+ZVTA==
X-ME-Sender: <xms:iouyYeTVgH8ecDbOlF7wKOSH2hbfe-phC6rhzNtLNbpHdlCYt1dIIg>
 <xme:iouyYTwGLDgDIEHg_Eaw_iNPBtu0RXQqNkJba78sHdTf9RiHSZNgQzS_JVIPJ2IdD
 x0vjj438dKjHVxP0g>
X-ME-Received: <xmr:iouyYb3nCDeuVSMgAhBPzHQBkjPbsZgdOD6I8i1CDXXu32PtmMKuxZJb-VgDZp3rmYzEfzr4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkedugddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhhrggfgsedtqhertdertddtnecuhfhrohhmpegkihcujggr
 nhcuoeiiihdrhigrnhesshgvnhhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeeuvd
 euudeuhfeghfehieeuvdetvdeugfeigeevteeuieeuhedtgeduheefleenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeiiihdrhigrnhesshgvnh
 htrdgtohhm
X-ME-Proxy: <xmx:iouyYaDlHTwHozoQD7OJ2ylBL_etQamuyf48-S6eHzhvK4FtAUES7Q>
 <xmx:iouyYXhJzCDzQtVD3NYsG4zcpqTAUAAJtH0AY-SZdLojN1sLOvUsvg>
 <xmx:iouyYWq0g8wwEte4zQhjjH6ln3n-DKcn94VCAAu62nPln3WBKoAB4g>
 <xmx:iouyYQaZscSeRo5m2okFZdWcKobvbA7nU8mLQF60niy2bvnUQLaDjg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Dec 2021 18:04:42 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [RFC PATCH v2 7/7] arch: powerpc: adjust fadump alignment to be
 pageblock aligned.
Date: Thu,  9 Dec 2021 18:04:14 -0500
Message-Id: <20211209230414.2766515-8-zi.yan@sent.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211209230414.2766515-1-zi.yan@sent.com>
References: <20211209230414.2766515-1-zi.yan@sent.com>
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

