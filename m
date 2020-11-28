Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B86A42C6F3B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 08:10:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjjM40VQrzF09n
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 18:10:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Xor/UKmv; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjjHf3q4pzDsPb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 18:07:42 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id 34so5992020pgp.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 23:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w3oWRMvHAa0retNOL9Z6Iu6Rm3CZHGga7R1WoN7izS8=;
 b=Xor/UKmvhmlqZm3VyydOKtoxX3Rck9mkU1XrQp8Ns6xarLl3R0uZQFQzwygwshq10T
 ieqKlYutE5COhEkTnCMXNriF5tRwoO+Dl6D20mhAeff4H6fyHL89ylAi16PS9jhj0w6w
 rn8q4pItuxPP8ZyaqgL6VW1i8Aq7jgRqNYfDnhd/wYwss37qGQm9VYjqI6rkx8BG01Bj
 FFRBRMOEvSEslexeMmXIkrxJOjaofRuulJhED4xACfONkMAmtfH8H82+76SxFYWF9V8c
 OOCj0SwOv8HXIL86CFzdXwxAHOkK7sDK8CO3uRviSRaSQC7Y8vVxf3P0NBisXTPptzIM
 Sqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w3oWRMvHAa0retNOL9Z6Iu6Rm3CZHGga7R1WoN7izS8=;
 b=pTD0sLGuCwwuqKL0MRXKn8kWgsHutWT/Bf4zrJWvrclsNRimw7jeEftGdO6bK1qQN3
 ayeMCFcwASzQaiHfPBuCrqdJnvB3ME8Tll15o6cmXSJzrtXWpmvS8FMD8u8Um9gma1AN
 HaHerv5z2OAbh1XD3ADOF+NIyer7lMvysP677UYDRMSMrQHL5Rx6k3meV3eZlqGqm/uj
 R0I5YOlpi0Ff/WT5mycRxk35scO0+z5E/MChNNNVol1erQpBVuSngfdJh3aLk6Hh+3qP
 HH/QdHYJj8ZqQQe3mVVs7EPBM+C6hj3gT7pN9iYJgeU5FimAVzadUGcLuwb0WLCZXxte
 +a4g==
X-Gm-Message-State: AOAM532mUo3G7DxlmND2oeDGqhjtlLxsoQxE5G11JowbI5ZAgIHHWTf8
 3q7vgO58aAePNEz5xb0sF9vLlE2uM8g=
X-Google-Smtp-Source: ABdhPJyG12KQon1LvVGV1FFKUrt1+uZon+BwxhIiJRZnCvXz4gTtLyYqrEGsI7Cp2uZ21EMwjNP7AA==
X-Received: by 2002:a63:4950:: with SMTP id y16mr8693669pgk.415.1606547259859; 
 Fri, 27 Nov 2020 23:07:39 -0800 (PST)
Received: from bobo.ibm.com (193-116-103-132.tpgi.com.au. [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id e31sm9087329pgb.16.2020.11.27.23.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 23:07:39 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/8] powerpc/64s/powernv: Fix memory corruption when saving
 SLB entries on MCE
Date: Sat, 28 Nov 2020 17:07:21 +1000
Message-Id: <20201128070728.825934-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201128070728.825934-1-npiggin@gmail.com>
References: <20201128070728.825934-1-npiggin@gmail.com>
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
Cc: kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This can be hit by an HPT guest running on an HPT host and bring down
the host, so it's quite important to fix.

Fixes: 7290f3b3d3e66 ("powerpc/64s/powernv: machine check dump SLB contents")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/powernv/setup.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index 46115231a3b2..4426a109ec2f 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -211,11 +211,16 @@ static void __init pnv_init(void)
 		add_preferred_console("hvc", 0, NULL);
 
 	if (!radix_enabled()) {
+		size_t size = sizeof(struct slb_entry) * mmu_slb_size;
 		int i;
 
 		/* Allocate per cpu area to save old slb contents during MCE */
-		for_each_possible_cpu(i)
-			paca_ptrs[i]->mce_faulty_slbs = memblock_alloc_node(mmu_slb_size, __alignof__(*paca_ptrs[i]->mce_faulty_slbs), cpu_to_node(i));
+		for_each_possible_cpu(i) {
+			paca_ptrs[i]->mce_faulty_slbs =
+					memblock_alloc_node(size,
+						__alignof__(struct slb_entry),
+						cpu_to_node(i));
+		}
 	}
 }
 
-- 
2.23.0

