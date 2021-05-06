Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E28375786
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 17:37:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fbd4J69w0z3bTM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 01:37:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm3 header.b=ERr+ibPO;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Gy0HBk0D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm3 header.b=ERr+ibPO; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Gy0HBk0D; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbd2q1g3gz3018
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 01:36:02 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 46CE9580B98;
 Thu,  6 May 2021 11:27:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 06 May 2021 11:27:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm3; bh=CNhCM5piZYB3R
 G0DYNDKizi7nXlnPEa9s7srXlj6PXg=; b=ERr+ibPOf0zVPcQflUsZusng7IDBt
 Ly+me/4A5/4jPSYelctQuWumPKZHomt2odPjYpof3hzY459tKjcCPONvUILkhh/t
 6OC9a5HPpB2Yyq0o5us8PKWmCvW0mQg0f8aYcFxatzcRQYA+Eo0sWo/ZiTzuKXmI
 Hd01N3Fw2jIv2f2YFBMQkjq8B1pc4vuSxr0UIiQSeIIs85G/OdYyaHjWXBC+xCAX
 K6LBqXwl30RHi/8Vt2uTdqBmdlqpltiukvdWtro7EpYqNBN3iugBknXl6MwpGfFA
 mQRSO5ILaqStJXxGzBc3QKabgCtMhBgDXKM1Wk3hGtyex3njKiN0j6RfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=CNhCM5piZYB3RG0DYNDKizi7nXlnPEa9s7srXlj6PXg=; b=Gy0HBk0D
 anbxcrn2TuZswDhEOR9nzUkL2OpRqP+G0E19ruuqkPdfG2QaMkjbgAmYgQDs2PYh
 X+u9gTjbgqnObnMCUoj+FaA95NZ9nq3dqUJghdetX+vfhI75COOAIVu45MvktsRp
 uN67O1drDk5ZvdUy0NP/n2xtAuMwihR7u7jxaIwFEFvS+Lf0X7Bu8G20EewqgnkQ
 wNmhoLBgWiIJ2Q+gcJfXE7xX9ZnkMm45EiNdfx6VxiK0pMrKHq//PZK0Gj78wkXb
 vHLLIqaG6XGkdvhTQPQ92lb9hweVk9danextwxInKDS/il/3M6ZqnGhSpbXu1q+P
 JNOnDyTiAoP7aA==
X-ME-Sender: <xms:1AqUYCulhFTFCq1TuIitxSwjbJhsysFyDWUIdrqlrydF-otZD2kHpA>
 <xme:1AqUYHcRef67m2nBpQTonTKTcKYIJ7CXSm2um39PI8T4RYV45KzrCen5CiNaIHCew
 pmrlofvEXwhQdEu2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegtddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfrhgggfestdhqredtredttdenucfhrhhomhepkghiucgj
 rghnuceoiihirdihrghnsehsvghnthdrtghomheqnecuggftrfgrthhtvghrnhepieejue
 dvueduuefhgefhheeiuedvtedvuefgieegveetueeiueehtdegudehfeelnecukfhppeef
 hedrudeigedrvdegiedrfeegnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpe
 hmrghilhhfrhhomhepiihirdihrghnsehsvghnthdrtghomh
X-ME-Proxy: <xmx:1AqUYNyxUWL3vkssN2aKr6C1w4NWi4ijMS6vzUobtCsaH6Se0wUjcg>
 <xmx:1AqUYNPOR0aPhbs12_rW4UBrnh8mhESTe0nMFBQzvCJJkG8ka3lF1w>
 <xmx:1AqUYC9mLFHQjMskumASj7jqaORsqmWfp5qx_O7C4l9zV6VhU2vw6Q>
 <xmx:1AqUYCN8ya_kW4otEza_yHf29kFghE0pN4XXQgR62DB2F1X4flPr8w>
Received: from Threadripper.local
 (ec2-35-164-246-34.us-west-2.compute.amazonaws.com [35.164.246.34])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu,  6 May 2021 11:27:12 -0400 (EDT)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: [RFC PATCH 6/7] arch: x86: no MAX_ORDER exceeds SECTION_SIZE check
 for 32bit vdso.
Date: Thu,  6 May 2021 11:26:22 -0400
Message-Id: <20210506152623.178731-7-zi.yan@sent.com>
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

For x86_64, 32bit vdso is compiled for compatibility reason and 32bit
SECTION_SIZE_BITS value is used during compilation. It causes
compilation time error when MAX_ORDER is increased in the 64bit
environment even if it is OK for 64bit SECTION_SIZE_BITS. Remove the
check during 32bit vdso compilation. It will be checked when other
kernel components are compiled.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 arch/x86/entry/vdso/Makefile | 1 +
 include/linux/mmzone.h       | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index 05c4abc2fdfd..cad339136ed1 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -156,6 +156,7 @@ KBUILD_CFLAGS_32 +=3D -fno-stack-protector
 KBUILD_CFLAGS_32 +=3D $(call cc-option, -foptimize-sibling-calls)
 KBUILD_CFLAGS_32 +=3D -fno-omit-frame-pointer
 KBUILD_CFLAGS_32 +=3D -DDISABLE_BRANCH_PROFILING
+KBUILD_CFLAGS_32 +=3D -DNO_MAX_ORDER_CHECK
=20
 ifdef CONFIG_RETPOLINE
 ifneq ($(RETPOLINE_VDSO_CFLAGS),)
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 965a0cd5eac1..fb5a0c2ab528 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1211,9 +1211,11 @@ static inline struct zoneref *first_zones_zonelist(s=
truct zonelist *zonelist,
 #define SECTION_BLOCKFLAGS_BITS \
 	((1UL << (PFN_SECTION_SHIFT - pageblock_order)) * NR_PAGEBLOCK_BITS)
=20
+#ifndef NO_MAX_ORDER_CHECK
 #if (MAX_ORDER - 1 + PAGE_SHIFT) > SECTION_SIZE_BITS
 #error Allocator MAX_ORDER exceeds SECTION_SIZE
 #endif
+#endif
=20
 static inline unsigned long pfn_to_section_nr(unsigned long pfn)
 {
--=20
2.30.2

