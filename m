Return-Path: <linuxppc-dev+bounces-8362-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C56BAACF90
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 23:36:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsWtD4js6z2ydw;
	Wed,  7 May 2025 07:36:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746567380;
	cv=none; b=LvHOXO/GgEqCadjm+vyY+aHYGFKwyf86UFizcQ1EzYKbADK87fn4WYZ5iVW15CiiF81gceOacnCzqo1KRf3R4eRciVKrZupjGxGsY5CCG7qrWEPvQBlLnMc0siKojJMz+RdOr1/XQTZz78tS/LXvXQ6YlzOBg0TRp+sg2nSVBvv4CAIrNtUTWTEZ14MslyAmKU2Y6VxQwwJrjqm37cN/dsUIPtY9b3qVDzBjEHDn14gWGxyFQ4lMqd1DuZ5vEh4IsQD2gV3mOoEU20M4QJfryZ14I5u+ua6PGVYj0yTJeYlu+5Fm/J1LM2TyEx64bc4507nPttdDqE9TK4ii+udRbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746567380; c=relaxed/relaxed;
	bh=/5yUxuIyYp0bMeZ3hXzKl3RVwlKWpkGGHS1Iu1hY9Bw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DowxeamzyGQL/m5gBTSVmEwwwQpF3VcmJV/16/4smDgi9a9Qln/W0XrZ5bajIkjxYrA8Djohe0R+rJyFf1HZnGb0nVI6Ev+sItYF92wFW7izRtl9ahUg1hu4WmMTFdUqvgERRhWpfmJFvwU8/lzurBWxRIR8fAE9hDvyWCwso9FgLee8QjRP/pULa5lcxR5eZlUNPtvAl7uGOF6ABKjL9xKykT8eZg2Gv1qxx1+b/o+o4M9pPww3smairft88KJxKyVoAlMTdvEFStmc0ezzewbL5fIJlu1+FnT8jHmQ+lAc9my+sxvyLf7Y8I3Ej4UcmVGy8oRRfebe5afwKK/p3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=saX2FzS8; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=saX2FzS8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsWtD0cwyz300F
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 07:36:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB5965C0642;
	Tue,  6 May 2025 21:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E53C4CEEE;
	Tue,  6 May 2025 21:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567377;
	bh=n+v9BOhh3isrjokrbTClmyh8lyR9UdQtGmiOV/8lRJM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=saX2FzS8/kjzOFD42D2ZClX0nGDbVMgN/lWaup/pVLK/8PVkKjfT3Jp6n3RKiHbxh
	 8zr2Jt09APMnMkOmWufp3k3OzrnR8M9yfh1eNa1Rluq+MVcpO+bWjR5J4OyVcaC27Q
	 /2txdsU9JV23ZYgssjtllOD3jlDurR4NzdlMXrElU8LS+8mSZpY7gU7kWbiB5cg1vd
	 8rB6+o2qrKLwc852b1xmsm9qufMHOxjYCzVIc99rhuhFs6gbd9m5uA8UK9gjsobRYF
	 D81LYoWeSQucJcJBsfB74gbuGe2moBXKu/kCSjUzsxPJvGrORccfz2NqwQToEkTMJh
	 anHt5LzDafkBw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Donet Tom <donettom@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Sasha Levin <sashal@kernel.org>,
	mpe@ellerman.id.au,
	hbathini@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 02/18] book3s64/radix: Fix compile errors when CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=n
Date: Tue,  6 May 2025 17:35:54 -0400
Message-Id: <20250506213610.2983098-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250506213610.2983098-1-sashal@kernel.org>
References: <20250506213610.2983098-1-sashal@kernel.org>
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
Precedence: list
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.27
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>

[ Upstream commit 29bdc1f1c1df80868fb35bc69d1f073183adc6de ]

Fix compile errors when CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=n

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Link: https://patch.msgid.link/8231763344223c193e3452eab0ae8ea966aff466.1741609795.git.donettom@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index b0d927009af83..633d500ea7ab6 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -988,7 +988,7 @@ int __meminit radix__vmemmap_create_mapping(unsigned long start,
 	return 0;
 }
 
-
+#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
 {
 	if (radix_enabled())
@@ -996,6 +996,7 @@ bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
 
 	return false;
 }
+#endif
 
 int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
 				unsigned long addr, unsigned long next)
-- 
2.39.5


