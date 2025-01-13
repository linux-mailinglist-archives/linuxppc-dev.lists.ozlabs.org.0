Return-Path: <linuxppc-dev+bounces-5174-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE29A0BE51
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 18:07:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWzFp37yPz3clY;
	Tue, 14 Jan 2025 04:07:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736788030;
	cv=none; b=YNihKE4l3nNIJ3jicM02DSstSgav6akyM0pF63kFKgg5E1Uqf0fJIIejjugnKxTaVJpL8byNXoZNzcNE9e84sgIvIf2FQIvH/b9pDjqx+vGEFxoCgsNiy5EHtU3RL2l9v/vAtGE18isbjRDCPmNxu2IcGT+kiuo4ActO/5gg167FO9XRih1STdq0KyKtNjVP74tcpO6WCuvrIPMZFDP5Pz/c8RJsXMrTxB8F6B/PUWUh0L7DoXDxd04pTyKn60mBZhhlmxW2fyiL7xq+cPRTNMX8aEo0PH/eE3UydSr9aBLA7+1M/Mx644pICY4UdmcmBj8+lxjeeLvNnIClN+qFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736788030; c=relaxed/relaxed;
	bh=ni769i74TSTMc2HCIR8rv+ryIDdcPChPeu1Bt8O/pdw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WMW3JtXfvtDL7jHLNVCIK8qMiLUHpmfFvuI82RuUHS/OjoybanrTi8EGuzYUzp4oWWZRv7y6iSobvOmHZaH0qq8WydgHpL7rEcEKowhufQggV7P8Uat7BQC4RNkP4evD85jf7euDk9CqrB0fHKdLWUwy3q+F0sS5VdS7yYV06RbAVN6rNpWGhNNpZFeaYmY0OMDXV4FCtPYp9w2YBvjwZWlW/g/oJPp6iXrUwJl1XHrhRJAtp6wqnYYsIvIkJdgZcJUno8qez93I6zca4Ux9U4wSlG0/AWJabGbwzUPv/0Tue8PrsyTVerB7mN5RznB/Jkr2hnbeFLwzVvgYzexG8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=yury.khrustalev@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=yury.khrustalev@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWzFn5np5z3cgt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 04:07:09 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01E3C1424;
	Mon, 13 Jan 2025 09:07:07 -0800 (PST)
Received: from udebian.localdomain (unknown [10.1.25.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFD0E3F673;
	Mon, 13 Jan 2025 09:06:35 -0800 (PST)
From: Yury Khrustalev <yury.khrustalev@arm.com>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sandipan Das <sandipan@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	nd@arm.com,
	Yury Khrustalev <yury.khrustalev@arm.com>
Subject: [RESEND v4 1/3] mm/pkey: Add PKEY_UNRESTRICTED macro
Date: Mon, 13 Jan 2025 17:06:17 +0000
Message-Id: <20250113170619.484698-2-yury.khrustalev@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250113170619.484698-1-yury.khrustalev@arm.com>
References: <20250113170619.484698-1-yury.khrustalev@arm.com>
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

Memory protection keys (pkeys) uapi has two macros for pkeys restrictions:

 - PKEY_DISABLE_ACCESS 0x1
 - PKEY_DISABLE_WRITE  0x2

with implicit literal value of 0x0 that means "unrestricted". Code that
works with pkeys has to use this literal value when implying that a pkey
imposes no restrictions. This may reduce readability because 0 can be
written in various ways (e.g. 0x0 or 0) and also because 0 in the context
of pkeys can be mistaken for "no permissions" (akin PROT_NONE) while it
actually means "no restrictions". This is important because pkeys are
oftentimes used near mprotect() that uses PROT_ macros.

This patch adds PKEY_UNRESTRICTED macro defined as 0x0.

Signed-off-by: Yury Khrustalev <yury.khrustalev@arm.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
---
 include/uapi/asm-generic/mman-common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/asm-generic/mman-common.h b/include/uapi/asm-generic/mman-common.h
index 1ea2c4c33b86..ef1c27fa3c57 100644
--- a/include/uapi/asm-generic/mman-common.h
+++ b/include/uapi/asm-generic/mman-common.h
@@ -85,6 +85,7 @@
 /* compatibility flags */
 #define MAP_FILE	0
 
+#define PKEY_UNRESTRICTED	0x0
 #define PKEY_DISABLE_ACCESS	0x1
 #define PKEY_DISABLE_WRITE	0x2
 #define PKEY_ACCESS_MASK	(PKEY_DISABLE_ACCESS |\
-- 
2.39.5


