Return-Path: <linuxppc-dev+bounces-6498-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE519A45ECF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 13:25:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2tw1124kz3bmS;
	Wed, 26 Feb 2025 23:25:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740572705;
	cv=none; b=NNF1Db5COQtKesJMF6dvAZXXDjFbjIHz1t2rCw0fA+eOgZ3/0Nvw0zCA3MlMv/4AokaPnceZD1gEapUVZHVunCK6c37BlbbQAV7Hyw79dt2sOaBdAr05GLyIu6KGiewcwlbP2JB7CDDFntMYK4cP2/Qt058CPPSn6JcWniqmndBFlaB1HaStRR5T1KhliiywM/sjLNS//nl9TW0o0SUXihrqZzRB0FyD4d7inngCh0TJ8PABajXN1fQ/pqkMvwIxWg8qJSSHIbpb9ldI9FKli0r6YaQ33ZvGspQLvX/ELai9TH6s7zkiG8nsdfHv7O7c7laUyczMuhKx71dy/K8jyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740572705; c=relaxed/relaxed;
	bh=nr05G2OwJ/ED1gvKC2Tl4B8mFSHknRc/6y/V1Ryu0VE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VG1NIHfDAEnJ3XKsRHrdgIUW5vkvCSt/+0TPl6dJNN9wp1OSHbZBUj7aeCjL0dTXQ4qHgAb0zb6+QOLnuSHvnO8J/u/pinhaRt/aVi59wjG0bCe3gKNOWslNt7VmRXh4ysuZY4P5GTTOTckj1OLkK+E0stutcddb8XUyzbNm6Ocud0JF4S4Ipdt8t5j+Hc4ISvAVUhMfCnnMBV2VD5miON09iFdDQ5XROlqy9Kg6PJrV2yW5LUJbO799XDlCXyjdSKqEdgBvmaaVX10VY5kSpeQQfJrLnnZ/3YKikGpsV9pp3Y4KfD2O/zT9HCUxVXp7nKxlfou8F4tnGuYRtYxBDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2tw04FrZz3blg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 23:25:04 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94D281C0A;
	Wed, 26 Feb 2025 04:24:49 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.40.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2BC4A3F5A1;
	Wed, 26 Feb 2025 04:24:28 -0800 (PST)
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
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH V3 2/5] arch/powerpc: Drop GENERIC_PTDUMP from mpc885_ads_defconfig
Date: Wed, 26 Feb 2025 17:54:01 +0530
Message-Id: <20250226122404.1927473-3-anshuman.khandual@arm.com>
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

GENERIC_PTDUMP gets selected on powerpc explicitly and hence can be dropped
off from mpc885_ads_defconfig. Replace with CONFIG_PTDUMP_DEBUGFS instead.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Fixes: e084728393a5 ("powerpc/ptdump: Convert powerpc to GENERIC_PTDUMP")
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/powerpc/configs/mpc885_ads_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
index 77306be62e9e..129355f87f80 100644
--- a/arch/powerpc/configs/mpc885_ads_defconfig
+++ b/arch/powerpc/configs/mpc885_ads_defconfig
@@ -78,4 +78,4 @@ CONFIG_DEBUG_VM_PGTABLE=y
 CONFIG_DETECT_HUNG_TASK=y
 CONFIG_BDI_SWITCH=y
 CONFIG_PPC_EARLY_DEBUG=y
-CONFIG_GENERIC_PTDUMP=y
+CONFIG_PTDUMP_DEBUGFS=y
-- 
2.25.1


