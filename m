Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 998B0494068
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 20:10:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfFbG2rFyz3cny
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 06:10:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=yepEWOhq;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=kp2bX3kb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=yepEWOhq; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=kp2bX3kb; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfFVq2d4qz30Dy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 06:06:43 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3A41E5806C4;
 Wed, 19 Jan 2022 14:06:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 19 Jan 2022 14:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm2; bh=8yuexR1+nrtHG
 SO8wGNcV0MvB+tGU4p0S4nQ2u6/h9Y=; b=yepEWOhqQwJaAjEwgeK7ltMCvFLxT
 bWHWuUq61bCnebk+XIZWZAbFWk2RZ4zogGXrQCh4S3EqNI3esApEtzpXvRH//XK9
 eNIm42Ph0bcPylp93/Lty3jNJFArwl0QKNutZPJuX0/Fjx/MQ6HjhOr6wt6vKxEs
 TRNmtz+ct8O0ERpGexJ2iByprgaswMXxFk3ALJOX6SH2VyrYksrNsF4TbLK3pED9
 r/98U7UrkyTJi3Ru9PqNb6rWFsBx0tnpxsIJ6gic+V50zRFXhfVhO6JOBeu3mbdd
 OL676jHn8AyPIDpdmBLzCffgesZROjN+Dy9eGlciRFAUP490htMC8JebQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=8yuexR1+nrtHGSO8wGNcV0MvB+tGU4p0S4nQ2u6/h9Y=; b=kp2bX3kb
 DYDCMRBL8FNpr/1RYUeTX4yIw+9hmcc9JbIz1l0nG9kHJcva/xj2cSyefBW1Zg/y
 7UY6tJbAjM9/NlOqrL0e03iIuaofDBz8zH7kJYwk5k2pNr2VmufUXz3GUM58IVJl
 UPRGcbxcBpQNIezbpGuM7GzCeIvSMJjS/jizBkPGNr/RZYcRoC0TgFPg3IJYXQpJ
 /U1E68h5gHpx/fXj9oTWwVBmJVejbAMSb6H1ekIFqjaBRlOc5HSSQkgAEfY4S6P8
 TVcvVHEDCdHT8Tm4jlWsKdwo8VTkJHy93+I+Lo4VWReK6LwVCTuiw1JZe7ksJr69
 ajUi4jX5K5sTWA==
X-ME-Sender: <xms:QGHoYSRY4H48mGFpQ1CYPHyM51xpyR0Al1_H13wTS9AbpSsy3mnllg>
 <xme:QGHoYXz721WeYmo8ZWwPJd_3L6arLfMxqoveB9_LEgRi0yO0Wcv7YbYYgVeqC5SOU
 DWg4ztmeNxL78gMdQ>
X-ME-Received: <xmr:QGHoYf3TS4gy4tX3peD_EMagLecgnVFgDRcOpyz_KwQvnlkLOdpKJX9teb6VTYLB09ZGJ4Nv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhhrggfgsedtqhertdertddtnecuhfhrohhmpegkihcujggr
 nhcuoeiiihdrhigrnhesshgvnhhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeeuvd
 euudeuhfeghfehieeuvdetvdeugfeigeevteeuieeuhedtgeduheefleenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeiiihdrhigrnhesshgvnh
 htrdgtohhm
X-ME-Proxy: <xmx:QGHoYeD83UCxVKejVvzNy4cLR9rUbiULW6CM9EaY0fTgQ_uKqDUgdQ>
 <xmx:QGHoYbivearrSCITj7TM-fzcwlLJ2ggHNiGuBrZ1rkUyox129k262Q>
 <xmx:QGHoYaq9NfgZWCAYbskDkwvoVZ_gksJGQg-pwYNaAnFaY7A1riXFYQ>
 <xmx:QWHoYUaZC_pi-6q7r2ORLbdTqmqr4tk1pWSC9MlpMxQTkzjMR-4J3g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Jan 2022 14:06:40 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [PATCH v4 7/7] arch: powerpc: adjust fadump alignment to be pageblock
 aligned.
Date: Wed, 19 Jan 2022 14:06:23 -0500
Message-Id: <20220119190623.1029355-8-zi.yan@sent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220119190623.1029355-1-zi.yan@sent.com>
References: <20220119190623.1029355-1-zi.yan@sent.com>
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

