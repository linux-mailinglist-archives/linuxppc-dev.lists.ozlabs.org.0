Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C87FBD0EC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 19:49:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46d7xS6HTtzDqKZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 03:49:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="sCPnrbme"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46d6YN3hpvzDqT9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 02:47:20 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2592920673;
 Tue, 24 Sep 2019 16:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569343637;
 bh=ZrLi2JF1gXBIO8UjLt7eus8vyU6RSKJMJP9EwGTXIH8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sCPnrbmemEN5ZURH77DR2omWFUNT57giK8n1HxFkt/pX666pZDcXo8mrmMxVmsLym
 QTRlzPJZAp+RjWITIII3/qoZsG0YpchRwiqZumK8byxqGWyg3KMzNDA/sVYNsgHjah
 0Bj6+8ygXGT6Xc7+nftcl/6QETu9cJPPOxI0fBrc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 36/70] powerpc/64s/radix: Fix memory hotplug
 section page table creation
Date: Tue, 24 Sep 2019 12:45:15 -0400
Message-Id: <20190924164549.27058-36-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164549.27058-1-sashal@kernel.org>
References: <20190924164549.27058-1-sashal@kernel.org>
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
index 8deb432c29754..2b6cc823046a3 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -901,7 +901,7 @@ int __meminit radix__create_section_mapping(unsigned long start, unsigned long e
 		return -1;
 	}
 
-	return create_physical_mapping(start, end, nid);
+	return create_physical_mapping(__pa(start), __pa(end), nid);
 }
 
 int __meminit radix__remove_section_mapping(unsigned long start, unsigned long end)
-- 
2.20.1

