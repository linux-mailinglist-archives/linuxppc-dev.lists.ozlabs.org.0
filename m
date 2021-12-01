Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7A1465067
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 15:49:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J42786Ql7z3cmT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 01:49:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RvBSYjPV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RvBSYjPV; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J41yc6KkJz3c7S
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 01:42:32 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id j11so13925606pgs.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Dec 2021 06:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=taZLnlPrXdCP99uSGAqCJpCbv2P0WZx06q/5cluHg4Y=;
 b=RvBSYjPVzdlfDSY8Q9l4ENyHYBNrCGPa7c2i6+TvKJh7vP+1rWfGLNSKOvN4XWLh9G
 k9CiRjxdOrxBhjzihnC3IaBYmAxCjdUcfr9I2NXf7I6uz1zJKQpoOXekg21WriD1N5i4
 UOECX50hxgdsRqz0TP7flfbKKTc7WMyOEhzmrmKzlvqoK/8hoXWy8nQUmJoa+lPdauQi
 F/wOe9NvxWg7GECFDTWGiY8GsE60dYUHxBwtDcq/piT+6GkuK7wCS48zZF1JSxsSSV+j
 yVDrPRcL1zolFtc/s1BmbaSipBaf59DddxAdXIaY1VlDKTQu3t0sQSUW018rPu5kaPaY
 zD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=taZLnlPrXdCP99uSGAqCJpCbv2P0WZx06q/5cluHg4Y=;
 b=bIIUyB2PCD+bfg7ZKoO3cnezGwaIxq/vfFjFY93eAHT0qprM1Afr82fQJG7bLeTbaj
 AUnSFOhcvJ/XuPAv8C0SPcWb3lZ5q95aJIvMrAcElf+rn0ToBTF7INxJK5kXkwFU8stI
 x21/prTRFmzdQXlbxFxSoSydPQ9w0NH6dHnkAS+L9qCIOAsicxglkEBVZ6Gdn7YFNSDG
 MUXWFparnsCCx03B1nkUivWI8qvnB94GMJWcAuc7//nH6nbOAkEVPUF0bNpIO5z2Bt3t
 oPP3UMxeZU24GcnAErYs3+jnr+SgzckVtl//ja8tzBjAPOH0n9EPdK4pDF2toz4cHnms
 BqbA==
X-Gm-Message-State: AOAM530rYTCzI61k3JeGws3NNyTc9OWDmwQBerv/bj8FkPLhguvjbdhd
 zhv4sCMdTDcP2tm05k0PMJ0ftfsa0tc=
X-Google-Smtp-Source: ABdhPJxIPqBP+qrAKIqZ7AsnIEfHduu0DiMAmU2JxpGiZeRdKomq7Bx3jBoQMae4Wg+Tfbw2EsebPA==
X-Received: by 2002:a63:8149:: with SMTP id t70mr4966598pgd.2.1638369750790;
 Wed, 01 Dec 2021 06:42:30 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id e13sm29230pgb.8.2021.12.01.06.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 06:42:30 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 11/18] powerpc/64: pcpu setup avoid reading
 mmu_linear_psize on 64e or radix
Date: Thu,  2 Dec 2021 00:41:46 +1000
Message-Id: <20211201144153.2456614-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211201144153.2456614-1-npiggin@gmail.com>
References: <20211201144153.2456614-1-npiggin@gmail.com>
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

