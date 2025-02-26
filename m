Return-Path: <linuxppc-dev+bounces-6500-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE4FA45ED4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 13:25:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2twC2N3Fz3bnB;
	Wed, 26 Feb 2025 23:25:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740572715;
	cv=none; b=L74b+dPASwHWgje7B3IiexwKe2pzTC0Jvou/sU9z6jRJLkJqu3aMgOznkRW1BDxQyfPLuHIZVQjpSxW0Gpzy4SB7jV3nkhh/A1VD9JQIxotGnyxuLvreyFhR6dGjwrzXrft/uLhOtXFSJLW4j9FLehXZRVHgNf+Bq0KJOsL44+5sqD6uqCeQEP83STvogR5KVCpwUnDHwonCmCc4jjL52bExNlfDu3oVq0j/u4jIpcWoozDOM8mb4K3NjDfuVXt5XXVTttD1yOksXYz0xVAPV2RI3ebhx/RtNUDPm8tKaPAzaIlk11K4yspkHmrWhgJBN2+Kf0Tx6WooC1wFamnx5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740572715; c=relaxed/relaxed;
	bh=LRGsBqibvYFIOQyj99eysD7W+10FLHigdztuNASGJ38=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y6G3CQBUoutBT7faPrad8aXwFvRDDJogbCi9mswSZB5/awUzu2bu5mL9G60vqf8dURAxFv59+EyQlsFMbh5BCoGh9P07AqlNGGZWo9rO+EpttfgZXloMBKmLHxQ0uI45jfgRxHz6kfiTkv9Ss9bUWAXcl4TLDVZD9WeG4u02zdh3fUuaa8FVz0MZmqHRjA5gF9vOSrs1rp5sNl1DHfsyyAU0gnVVRBb9HyPSYiEanPuRRFN4lqf2v2XU1bZGT7lT0E+dd3E0uDf6Q1bwfg07RJtvuL2DJVbGpZnKRJCHIlntsfW9cmqtwLeUS4bcGqdaOEl/6fz+nDZv8c9Ib/JCUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2twB6L9rz3blg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 23:25:14 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B27628C7;
	Wed, 26 Feb 2025 04:25:00 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.40.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 146C63F5A1;
	Wed, 26 Feb 2025 04:24:39 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Steven Price <steven.price@arm.com>
Subject: [PATCH V3 4/5] mm: Make DEBUG_WX depdendent on GENERIC_PTDUMP
Date: Wed, 26 Feb 2025 17:54:03 +0530
Message-Id: <20250226122404.1927473-5-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226122404.1927473-1-anshuman.khandual@arm.com>
References: <20250226122404.1927473-1-anshuman.khandual@arm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

DEBUG_WX selects PTDUMP_CORE without even ensuring that the given platform
implements GENERIC_PTDUMP. This problem has been latent until now, as all
the platforms subscribing ARCH_HAS_DEBUG_WX also subscribe GENERIC_PTDUMP.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 mm/Kconfig.debug | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index 41a58536531d..a51a1149909a 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -186,6 +186,7 @@ config ARCH_HAS_DEBUG_WX
 config DEBUG_WX
 	bool "Warn on W+X mappings at boot"
 	depends on ARCH_HAS_DEBUG_WX
+	depends on GENERIC_PTDUMP
 	depends on MMU
 	select PTDUMP_CORE
 	help
-- 
2.25.1


