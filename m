Return-Path: <linuxppc-dev+bounces-8360-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3703EAACF83
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 23:35:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsWsM4DPwz301Y;
	Wed,  7 May 2025 07:35:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746567335;
	cv=none; b=ZbPkJEn8uRPaNVfsfsYMjrw+lH2e+BY7zGqLT7SLvUtC19tEnSJuv71L9EVFudDsDrs+UaNfCr2rTrvTX4JcfRrQHSmxmv6WMDfwjJlRgYzDUbJDHQf/pQQLicGj6D6cCAiehUoIjmvGOzt0EZcyVtnq3XUMoUhPDdQFn7yijJ++5bs0207TENW6K5RazZsROcuolHWGlmvkyYeavaNxj8OYWbcPQTks2MRosu8dnb1TF6aZ14hbtTUos1xiN0WvLZZzeigE8PaMjmcktoY87WiiP3fS97d7ws+XJHG0TLRfY8a8DiinZ1TW2RwvrEecvaq0m2ZasN6XWrQzD5HNfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746567335; c=relaxed/relaxed;
	bh=xB9Dsp0Cey883brFO4Ao0/E1rxotmcktPy86qxbIiAo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OsGWDt976CUhaFrI7xrt2b1mEEzjZf8WSBAmpW3LG6mYUUuOh3C7BO6WfQ9/xH8zJpd7eQ3SokC0A9nH8bys7Y1fQCuJd+SiJqKhJEJsJixI5xUc+LU8YbJQp7rTJlG7zesyS+jDP9PqwyCEIF14abMviUMpPb/M2s6PYr5g0w65XjgY+JvCCCnLg7PcNbo4EQ64xbbbVJ+mfXlln3adDhcwvFfStNz/s1xEDJsYRXvGZiNjYY7yXGdpQWHtXz5jCC1rMyDxgr00D2W/rZT2jEYf7Xqeys53zoP0nBdcko7zK9ycqXSw8DYk2zmf1klwKilSa0fkysAsb9wl8Kf8xA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s723eAEO; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s723eAEO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsWsL5vw0z2ydQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 07:35:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 149DA61136;
	Tue,  6 May 2025 21:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1912C4CEF1;
	Tue,  6 May 2025 21:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567331;
	bh=Jm5WhIlJxrkHokatjuS6LYXj+etWscX/nFFkAt3oKKg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s723eAEOCJAhUsf+O/0fuvlOBF/IOgzZ/OSnqiAlJq47enTr/rbt9sFC0MDwTtDvQ
	 HkZ9GBgvcP1QFIKFfrStj871aFCmnOQ/6Pmw+bv0LYPvWF1XyoO2hCu+W175ka0onH
	 FVm3iiQScYxXLNPR4bl+beuDEUx9tSqHSDMhZu5EDsdshQZKns5um50bj4S5rw+F+c
	 CWlFK9KMqXoLwOxJxpPUbLSCEcDqqOUa+MceoUp26wRiF8HMA8eIVjz101joFmqElF
	 9UhX9MTnuos6Kbg89jzomdN1ZrMWD3cKo+BVvGxYRbg6yBJVauww8dgkYg3DXb7vDK
	 gwazZrH0mNHaQ==
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
Subject: [PATCH AUTOSEL 6.14 02/20] book3s64/radix: Fix compile errors when CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=n
Date: Tue,  6 May 2025 17:35:05 -0400
Message-Id: <20250506213523.2982756-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250506213523.2982756-1-sashal@kernel.org>
References: <20250506213523.2982756-1-sashal@kernel.org>
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
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
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
index 311e2112d782e..bd6916419472c 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -976,7 +976,7 @@ int __meminit radix__vmemmap_create_mapping(unsigned long start,
 	return 0;
 }
 
-
+#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
 {
 	if (radix_enabled())
@@ -984,6 +984,7 @@ bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
 
 	return false;
 }
+#endif
 
 int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
 				unsigned long addr, unsigned long next)
-- 
2.39.5


