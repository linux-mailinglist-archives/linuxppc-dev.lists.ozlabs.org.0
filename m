Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2D1BD05D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 19:12:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46d76k50hjzDqDd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 03:12:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="rRMj0twZ"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46d6TS2BSpzDqSD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 02:43:55 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5DCC20872;
 Tue, 24 Sep 2019 16:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569343432;
 bh=uF6LpAxsYE0kGQZyHL/8g2CnZUbyHV5+7kIbwDuFRO0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rRMj0twZyWgIlNpfGcjmiZ31pO4TH0XoaJcX4QRC3+jwgYDlQCGU1msGTtjN8yOiZ
 xQDvHKL3cM4zuM7YBFXzEWsTPfiaGSjYYmQnDHRbLRMWNHmCoo1OTQy6iBaADnDF3A
 hIpZHVjsFHP7I0dHTzC6Ey3kH4F4mNmi/7PBZjOI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 47/87] powerpc/64s/radix: Fix memory hotplug
 section page table creation
Date: Tue, 24 Sep 2019 12:41:03 -0400
Message-Id: <20190924164144.25591-47-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
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
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

[ Upstream commit 8f51e3929470942e6a8744061254fdeef646cd36 ]

create_physical_mapping expects physical addresses, but creating and
splitting these mappings after boot is supplying virtual (effective)
addresses. This can be irritated by booting with mem= to limit memory
then probing an unused physical memory range:

  echo <addr> > /sys/devices/system/memory/probe

This mostly works by accident, firstly because __va(__va(x)) == __va(x)
so the virtual address does not get corrupted. Secondly because pfn_pte
masks out the upper bits of the pfn beyond the physical address limit,
so a pfn constructed with a 0xc000000000000000 virtual linear address
will be masked back to the correct physical address in the pte.

Fixes: 6cc27341b21a8 ("powerpc/mm: add radix__create_section_mapping()")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20190724084638.24982-1-npiggin@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index b4ca9e95e6781..c5cc16ab1954e 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -902,7 +902,7 @@ int __meminit radix__create_section_mapping(unsigned long start, unsigned long e
 		return -1;
 	}
 
-	return create_physical_mapping(start, end, nid);
+	return create_physical_mapping(__pa(start), __pa(end), nid);
 }
 
 int __meminit radix__remove_section_mapping(unsigned long start, unsigned long end)
-- 
2.20.1

