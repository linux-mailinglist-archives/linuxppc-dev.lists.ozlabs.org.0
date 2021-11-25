Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A05AD45DA89
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 13:58:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0HxB3XNyz3dgN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 23:58:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WwbDv0Gj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WwbDv0Gj; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Hmp04BFz3bnG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 23:51:05 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so7712207pja.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 04:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=taZLnlPrXdCP99uSGAqCJpCbv2P0WZx06q/5cluHg4Y=;
 b=WwbDv0GjbI2ZRbcxr+Q9KpXAqhZ7nKmVxQXAI4OK9NNYer187Wb8sN4iHWCUcILXY3
 AoIQnsX8pP2OglygZr0McvxkJJiDK4kvAX+cfEsxIdvu+aL8E12mHg6otlqMmQldAT1g
 L6RT8NagQIhGXwAfrZqqICGld3KGKnjX9Gsg+OcD7SKsaLG6Hw254S2vSK3WSVwZxvtc
 WBrEheHtC4zz9u7yrAnz2Tz//x9Atl1GXZ6CjV5+W+4pSGBxfPIq2oBa7TzCpH5Bi1hR
 O6BRQ5AP/7F1difURNI94+df3n2TTlU66bQ2pFzFe7cuYQFF4obK0M8tWV8Ao2NKaFfD
 YTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=taZLnlPrXdCP99uSGAqCJpCbv2P0WZx06q/5cluHg4Y=;
 b=uoie2EqwANUj80YFoej5MP5RluS13LBcUTFKAlXutMommJMUkJttbfaKbMs12lpOes
 xEQAJItUzyVqJFtxrapeelms1DmSsOU494hH0S8L7aW+USh1lO4kRoLyhJFxQxAP0nWi
 i6BW594r7xSqC0OmYtFOi5GAQnvLupbG9PFN54s/tcZmw8FELCYaWZHAB5Eiqb7qlED/
 i/myBU8gLnvMSaVK2UwJKhaulbiV0eY+l++zdtXjXcH254rBxtouKHmNyPVXFui30fe1
 iHalNZY1fSxrCsJmACrj/NVkmj69Q1+yXRIrfzkmL3AQ48397ntl8K22ltZwqex6UcR+
 wE5g==
X-Gm-Message-State: AOAM530vj2kml6vwCN1cVWLy2HKFxc9EpVeUR9NEOmoCEzU3swz4ASXV
 ocVsEorg+JWAvog6OVdiyuJyvncGYZc=
X-Google-Smtp-Source: ABdhPJziy/AKYhpfauPY7GrZgiAG/z4nSJq2ad67mhYPYEsBgzbNsf5v5knQoK4MrRbBZ19EfEaj8A==
X-Received: by 2002:a17:90a:e395:: with SMTP id
 b21mr6468573pjz.103.1637844663778; 
 Thu, 25 Nov 2021 04:51:03 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id gc22sm7242851pjb.57.2021.11.25.04.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:51:03 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 11/17] powerpc/64: pcpu setup avoid reading
 mmu_linear_psize on 64e or radix
Date: Thu, 25 Nov 2021 22:50:19 +1000
Message-Id: <20211125125025.1472060-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211125125025.1472060-1-npiggin@gmail.com>
References: <20211125125025.1472060-1-npiggin@gmail.com>
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
index 6052f5d5ded3..9a493796ce66 100644
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

