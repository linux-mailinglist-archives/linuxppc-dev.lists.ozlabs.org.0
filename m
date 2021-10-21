Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE161436D94
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 00:38:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb2S92bkjz3f2W
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 09:38:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pARSpIlj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pARSpIlj; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb2Hx2XfPz3c8G
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 09:30:53 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id
 e5-20020a17090a804500b001a116ad95caso1633448pjw.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 15:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eckziN4dlZxBjg9WF0lQlRnoAAInyPRkHQQY9N/5vnE=;
 b=pARSpIljKgLd8IiNclVA8sZyMwZkoLxuQqej9ZqtT5nlkR9X5x0VAzvhLDib62gtvR
 lyO2u12dsqKTYmMh7uYaQ2X2PUpa5Yh6vklyi1gGldLz1/c+EMSKcMzoQ4vAXBISNQbZ
 sFTSanyRxR6sRXtGoH2Bcx8WXsz07D7vcaeD6N8eIYpJ9DYVfexMXeEohDZ2pwklTHDE
 r2JZ8oNYHdzUUKlv+lHiKg7XmyWb2XcGDfheNGqNY7DmQUFBhaNeTwOk+WTdPKtUnTzG
 bo8+4P6JQNigCgT5fFj3sbRMrUs2uXkeyCzqjNYS7RnY+PalWUCLYXZp6Vl/nxo5GASK
 MYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eckziN4dlZxBjg9WF0lQlRnoAAInyPRkHQQY9N/5vnE=;
 b=FG5RoF3G6a2WtemzIlS5Q8miWKagOM5AcQTVRLQw+c81fPbX9ivdeBMuVEUb3X07W3
 mB0XDmVZoWWtVKQiaSfX7OaEPhIzuSoZ8FJufb3eBZSffCHguNWkk12d7VMJ/LdfwWVl
 KoVDG6P3SC/DiBhRH5SuKCh98/XAXVtS8+J4EL49oRs7zg4O3KVEq22xKlqpiGIspSQm
 uO1qzRg4aMSO0evezF2+mtIw5Rrb1w6YwTw28WLZA4BjbBUKt0ba4CQxgQiLYH0KMMVj
 4jrKxVNLJ0HiiihyzX8jciQtV3ADNWwJyGMdvXU+EHsZxxs4GsGNsrj5dhj0DQN+V7IS
 oO8A==
X-Gm-Message-State: AOAM533QKFFJ/66sGNFS8YSkdwXfEUMRWhEDWoAaEh24uaiDSTVWEPAl
 xaY8zuiOcmVsb4JU9SWR1ixSw3DXHTQ=
X-Google-Smtp-Source: ABdhPJzptSo+OEjPeKcgHKS1I2sRW+bUi9dtbyR5xxfXcDDpoWg3GJwU15zp7cCBpF4bmAfICN65bA==
X-Received: by 2002:a17:90b:1112:: with SMTP id
 gi18mr9705422pjb.136.1634855451445; 
 Thu, 21 Oct 2021 15:30:51 -0700 (PDT)
Received: from bobo.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id e6sm7205716pfm.212.2021.10.21.15.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 15:30:51 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 11/18] powerpc/64: pcpu setup avoid reading
 mmu_linear_psize on 64e or radix
Date: Fri, 22 Oct 2021 08:30:06 +1000
Message-Id: <20211021223013.2641952-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211021223013.2641952-1-npiggin@gmail.com>
References: <20211021223013.2641952-1-npiggin@gmail.com>
MIME-Version: 1.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Radix never sets mmu_linear_psize so it's always 4K, which causes pcpu
atom_size to always be PAGE_SIZE. 64e sets it to 1GB always.

Make paths for these platforms to be explicit about what value they set
atom_size to.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/setup_64.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index eaa79a0996d1..a6132b2fee9e 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -880,14 +880,23 @@ void __init setup_per_cpu_areas(void)
 	int rc = -EINVAL;
 
 	/*
-	 * Linear mapping is one of 4K, 1M and 16M.  For 4K, no need
-	 * to group units.  For larger mappings, use 1M atom which
-	 * should be large enough to contain a number of units.
+	 * BookE and BookS radix are historical values and should be revisited.
 	 */
-	if (mmu_linear_psize == MMU_PAGE_4K)
+	if (IS_ENABLED(CONFIG_PPC_BOOK3E)) {
+		atom_size = SZ_1M;
+	} else if (radix_enabled()) {
 		atom_size = PAGE_SIZE;
-	else
-		atom_size = 1 << 20;
+	} else {
+		/*
+		 * Linear mapping is one of 4K, 1M and 16M.  For 4K, no need
+		 * to group units.  For larger mappings, use 1M atom which
+		 * should be large enough to contain a number of units.
+		 */
+		if (mmu_linear_psize == MMU_PAGE_4K)
+			atom_size = PAGE_SIZE;
+		else
+			atom_size = SZ_1M;
+	}
 
 	if (pcpu_chosen_fc != PCPU_FC_PAGE) {
 		rc = pcpu_embed_first_chunk(0, dyn_size, atom_size, pcpu_cpu_distance,
-- 
2.23.0

