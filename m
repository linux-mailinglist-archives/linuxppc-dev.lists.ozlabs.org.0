Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D018B508028
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 06:35:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjnsC5Q6Mz3bpJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 14:35:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=tongtiangen@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjlQy2wtzz2xnJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Apr 2022 12:45:46 +1000 (AEST)
Received: from kwepemi500005.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KjlQh68FmzhXdN;
 Wed, 20 Apr 2022 10:45:32 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi500005.china.huawei.com (7.221.188.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 20 Apr 2022 10:45:40 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 20 Apr 2022 10:45:38 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Mark Rutland <mark.rutland@arm.com>, James Morse <james.morse@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Robin Murphy <robin.murphy@arm.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
 <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH -next v4 5/7] arm64: mte: Clean up user tag accessors
Date: Wed, 20 Apr 2022 03:04:16 +0000
Message-ID: <20220420030418.3189040-6-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420030418.3189040-1-tongtiangen@huawei.com>
References: <20220420030418.3189040-1-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 20 Apr 2022 14:34:53 +1000
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Xie XiuQi <xiexiuqi@huawei.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Tong Tiangen <tongtiangen@huawei.com>, Guohanjun <guohanjun@huawei.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Robin Murphy <robin.murphy@arm.com>

Invoking user_ldst to explicitly add a post-increment of 0 is silly.
Just use a normal USER() annotation and save the redundant instruction.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Tong Tiangen <tongtiangen@huawei.com>
---
 arch/arm64/lib/mte.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/lib/mte.S b/arch/arm64/lib/mte.S
index 8590af3c98c0..eeb9e45bcce8 100644
--- a/arch/arm64/lib/mte.S
+++ b/arch/arm64/lib/mte.S
@@ -93,7 +93,7 @@ SYM_FUNC_START(mte_copy_tags_from_user)
 	mov	x3, x1
 	cbz	x2, 2f
 1:
-	user_ldst 2f, ldtrb, w4, x1, 0
+USER(2f, ldtrb	w4, [x1])
 	lsl	x4, x4, #MTE_TAG_SHIFT
 	stg	x4, [x0], #MTE_GRANULE_SIZE
 	add	x1, x1, #1
@@ -120,7 +120,7 @@ SYM_FUNC_START(mte_copy_tags_to_user)
 1:
 	ldg	x4, [x1]
 	ubfx	x4, x4, #MTE_TAG_SHIFT, #MTE_TAG_SIZE
-	user_ldst 2f, sttrb, w4, x0, 0
+USER(2f, sttrb	w4, [x0])
 	add	x0, x0, #1
 	add	x1, x1, #MTE_GRANULE_SIZE
 	subs	x2, x2, #1
-- 
2.25.1

