Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 503F637579F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 17:39:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fbd6K2Rtpz3cMk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 01:39:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm3 header.b=BkIRKQSF;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=csxIPwzr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm3 header.b=BkIRKQSF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=csxIPwzr; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbd2t4KtCz3022
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 01:36:06 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id E4276580B9A;
 Thu,  6 May 2021 11:27:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 06 May 2021 11:27:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm3; bh=0Vqh/12D+7ItZ
 7+wzTeDhhxcr5RV//7A5m31qLjOfhE=; b=BkIRKQSF6Dj8QO06+XBWBvzR5nZik
 byXGdMgWl3jqK4k07zyusfxS8vwwBDf3X8JVIyGTHojUCrO/pqmnXZYwAEdtPG0H
 xJGZA7QD07YPi3V/NMj7MiFrot7KDNjvh47wE8VEAYoRYgVFYS8lWv0Dj6H8ZLIg
 RyDDax4M1r5NV/NeVqNzLk3iSOVCTej2v7AObHUrTAJ4euJTQZhtn7O3spb9Ai65
 rvKVUjvfjYtg0CAplyv5jPDw1rE2F3N1+de9tDp0L9kY8aZ8igSp8Dmn9QNVhVqI
 P6qyAtpw5SKHltxVmiHt5RbY2wzaq7jzZpprjAQDmSAxLP3N/ywCr6p2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=0Vqh/12D+7ItZ7+wzTeDhhxcr5RV//7A5m31qLjOfhE=; b=csxIPwzr
 uonvNWIgSug9hpDXXfqy4EzlgPzuRdyfFxsm8km04obBGxRyJPAJKc1zadJpqFw8
 xBtdwrq4dZ7jTDkVZpvMZ6P9OEZsNBkYWBA+0boS0zvBT2j/WiSfsug1FFpaWnQl
 1BT25nopWrPRsCDc0sKIN8YkY2+t4JK1biwATAYCPZSe6YmWJZRlfVSwzPfsuKz7
 UAHZctYWYsW3cCHhyRjllbxtI0XoxBBruJxbVbf8JKVB1yR6pxHVckG7kXe7+nnq
 r8i15j/XQSk9IrDc9woctBo7NDyxhwqc2L+BwH0NVPlkT5y8Bq5WHgpowuMnJjaF
 m6SJ4+pFlsE3MQ==
X-ME-Sender: <xms:2AqUYDMB5i5zj_M9PMQ5YkbShTNfpGKdoTUJ5zVl5TwqxwCo2GgOyg>
 <xme:2AqUYN9w_Dlj5yU_UD6wypwx4MYlBAfMcIsIedipELMJrlnHgfZ34s8QYNILZ9nIa
 rku4bVct6pLMwa83g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegtddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfrhgggfestdhqredtredttdenucfhrhhomhepkghiucgj
 rghnuceoiihirdihrghnsehsvghnthdrtghomheqnecuggftrfgrthhtvghrnhepieejue
 dvueduuefhgefhheeiuedvtedvuefgieegveetueeiueehtdegudehfeelnecukfhppeef
 hedrudeigedrvdegiedrfeegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpe
 hmrghilhhfrhhomhepiihirdihrghnsehsvghnthdrtghomh
X-ME-Proxy: <xmx:2AqUYCTB2ORm8xJjUjVXYPh4K4jZLFNI4e0JREsDs8Gi-ygzPfWDew>
 <xmx:2AqUYHsA5LclMx9V_-selLiZPJ0XCv8Xe-NKxI50tTToe7y1ggWeBw>
 <xmx:2AqUYLd6Knz4_vW9KlvspzoQ20x7t_nR0Pg1ITpYY2LdoglMyhecdg>
 <xmx:2AqUYGvOxKS9uFrz7bdHtdarp3eCO3yJPv2vZKeb6MQ79-B1qAcr9Q>
Received: from Threadripper.local
 (ec2-35-164-246-34.us-west-2.compute.amazonaws.com [35.164.246.34])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu,  6 May 2021 11:27:16 -0400 (EDT)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: [RFC PATCH 7/7] [not for merge] mm: increase SECTION_SIZE_BITS to 31
Date: Thu,  6 May 2021 11:26:23 -0400
Message-Id: <20210506152623.178731-8-zi.yan@sent.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210506152623.178731-1-zi.yan@sent.com>
References: <20210506152623.178731-1-zi.yan@sent.com>
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
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, x86@kernel.org,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Zi Yan <ziy@nvidia.com>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Zi Yan <ziy@nvidia.com>

This is only used to test onlining/offlining subsection memory in
a x86_64 system by increasing section size to 2GB and pageblock size to
1GB when MAX_ORDER is set to 20.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 arch/x86/Kconfig                 | 15 +++++++++++++++
 arch/x86/include/asm/sparsemem.h |  2 +-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 0045e1b44190..d8faf59fa5ff 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1654,6 +1654,21 @@ config X86_PMEM_LEGACY
=20
 	  Say Y if unsure.
=20
+config FORCE_MAX_ZONEORDER
+	int "Maximum zone order"
+	range 11 20
+	default "20"
+	help
+	  The kernel memory allocator divides physically contiguous memory
+	  blocks into "zones", where each zone is a power of two number of
+	  pages.  This option selects the largest power of two that the kernel
+	  keeps in the memory allocator.  If you need to allocate very large
+	  blocks of physically contiguous memory, then you may need to
+	  increase this value.
+
+	  This config option is actually maximum order plus one. For example,
+	  a value of 11 means that the largest free memory block is 2^10 pages.
+
 config HIGHPTE
 	bool "Allocate 3rd-level pagetables from highmem"
 	depends on HIGHMEM
diff --git a/arch/x86/include/asm/sparsemem.h b/arch/x86/include/asm/sparse=
mem.h
index 6a9ccc1b2be5..c5a9d498a7e7 100644
--- a/arch/x86/include/asm/sparsemem.h
+++ b/arch/x86/include/asm/sparsemem.h
@@ -23,7 +23,7 @@
 #  define MAX_PHYSMEM_BITS	32
 # endif
 #else /* CONFIG_X86_32 */
-# define SECTION_SIZE_BITS	27 /* matt - 128 is convenient right now */
+# define SECTION_SIZE_BITS	31 /* matt - 128 is convenient right now */
 # define MAX_PHYSMEM_BITS	(pgtable_l5_enabled() ? 52 : 46)
 #endif
=20
--=20
2.30.2

