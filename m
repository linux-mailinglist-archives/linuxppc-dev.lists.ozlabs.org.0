Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CF41FDCAD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 03:21:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nPKL72BqzDr02
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 11:21:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=2TnSmiB0; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nP3f3V8RzDqyX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 11:09:34 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 33C9321D92;
 Thu, 18 Jun 2020 01:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442572;
 bh=VbvwX07h7tv/JNZrZ3PGvYl0YFbuhr9qHoWR3e3SoN8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2TnSmiB0gpUmHOt/bhDReDt9ZokH6KAzMGk8cbl+Bgf4iheIObCqeQG8uRvO/mJ45
 fBRFFhmZAXotYk++yHQw25yjtVvp4yR0wP0lKFXBYui3KvtMscdh4Y2bC2ZO6cTOP7
 dT5tqr81y+I1r3PPtV7ZddjJKoIPzTdCERz7mY28=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 065/388] powerpc/book3s64/radix/tlb: Determine
 hugepage flush correctly
Date: Wed, 17 Jun 2020 21:02:42 -0400
Message-Id: <20200618010805.600873-65-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Bharata B Rao <bharata@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

[ Upstream commit 8f53f9c0f68ab2168f637494b9e24034899c1310 ]

With a 64K page size flush with start and end:

  (start, end) = (721f680d0000, 721f680e0000)

results in:

  (hstart, hend) = (721f68200000, 721f68000000)

ie. hstart is above hend, which indicates no huge page flush is
needed.

However the current logic incorrectly sets hflush = true in this case,
because hstart != hend.

That causes us to call __tlbie_va_range() passing hstart/hend, to do a
huge page flush even though we don't need to. __tlbie_va_range() will
skip the actual tlbie operation for start > end. But it will still end
up calling fixup_tlbie_va_range() and doing the TLB fixups in there,
which is harmless but unnecessary work.

Reported-by: Bharata B Rao <bharata@linux.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
[mpe: Drop else case, hflush is already false, flesh out change log]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20200513030616.152288-1-aneesh.kumar@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 758ade2c2b6e..b5cc9b23cf02 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -884,9 +884,7 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
 			hstart = (start + PMD_SIZE - 1) & PMD_MASK;
 			hend = end & PMD_MASK;
-			if (hstart == hend)
-				hflush = false;
-			else
+			if (hstart < hend)
 				hflush = true;
 		}
 
-- 
2.25.1

