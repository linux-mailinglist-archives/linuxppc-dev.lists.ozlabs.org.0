Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAD772A77
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 10:51:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tpwb4cZFzDqHG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 18:51:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="W7UQM/EE"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tprJ3jdxzDqGN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 18:47:28 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id w24so21737993plp.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 01:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yeA5fh1Ch0+CG67IzCY8H8gbbjcLsTzUO6FW9sn2dao=;
 b=W7UQM/EEkwZUnRQDmo0f4C6cp/7AAHUPIAs/GO4dL8LL+qiFh2QETn3XY9W1LpPo7e
 eQPmSId9eALHHAlDry6/dFXDiVMQ48zlO0xPgD5Xx+0qgljkx45zOo1dVkxuHdblbCbL
 Seik2vAlvECi1bHNBDeVmyewUDxXijnbEFMt9U8/ZjyvdPyjXiX8AJhF/l9qWF0gTVtT
 mNTble4bDKrXySCbUHSl5cr7ED5CQPcAlf3I9O9IP9qpy2prcPBZqjYQpoY1Fx8z9xLN
 l/VgfANRjkgQfYJX8Jrk7G+xFW2AOl2RQfN6KqwkRL60A1gmH9OEtyZHejkm1CEKB95U
 wSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yeA5fh1Ch0+CG67IzCY8H8gbbjcLsTzUO6FW9sn2dao=;
 b=dZOyMoALnSrk8Kt49/3RhUM7E5hLcmw0Hg90zXSixMEj0+0u4unfTuP7HjmH4ASWWZ
 aoIFGtlQ9MaCSlMoTPoNL7MqA5QLyAmSlLW98OoT9pDVJ36DjlzpmfDthQBZLg4pQRRX
 LT2tmpQTyS98CMTi7IRwVrhaYg2x2dmHBz1jgWyS6q+Ex1kkNxrvspEBt46gBTCsBxXO
 HY51DHnowSXpM8CS4A9tsWKlW+UKUCc9iWhuM9Vp12dZioDnfTA6uAmABz0VdiYceXOT
 AC7JfZxKx7TWML1E6K057+yzuDCYItXPQalCKrnjAswRV9niIv52o19Cu3+plDNijfQf
 IH4w==
X-Gm-Message-State: APjAAAVczGA5E7fsuDBZCjJq8fn+0lM3S3qYbRhqCBWEgmNLieHaq55P
 hUHk3I5B2h/yd0EiUqR7jxxtMLL0
X-Google-Smtp-Source: APXvYqwdwuBrHDD40DIzNFrxMK1BhePBf+6XCrMoWGjhNGHH+ZyAfyWckYNZoTVEezvN3p5cKFZKXg==
X-Received: by 2002:a17:902:aa95:: with SMTP id
 d21mr81364588plr.185.1563958045209; 
 Wed, 24 Jul 2019 01:47:25 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([220.240.251.33])
 by smtp.gmail.com with ESMTPSA id a3sm54286745pje.3.2019.07.24.01.47.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 01:47:24 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/5] powerpc/64s/radix: Fix memory hot-unplug page table split
Date: Wed, 24 Jul 2019 18:46:35 +1000
Message-Id: <20190724084638.24982-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190724084638.24982-1-npiggin@gmail.com>
References: <20190724084638.24982-1-npiggin@gmail.com>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Reza Arbab <arbab@linux.vnet.ibm.com>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

create_physical_mapping expects physical addresses, but splitting
these mapping on hot unplug is supplying virtual (effective)
addresses.

[I'm not sure how to test this one]

Cc: Balbir Singh <bsingharora@gmail.com>
Fixes: 4dd5f8a99e791 ("powerpc/mm/radix: Split linear mapping on hot-unplug")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index c5cc16ab1954..2204d8eeb784 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -737,8 +737,8 @@ static int __meminit stop_machine_change_mapping(void *data)
 
 	spin_unlock(&init_mm.page_table_lock);
 	pte_clear(&init_mm, params->aligned_start, params->pte);
-	create_physical_mapping(params->aligned_start, params->start, -1);
-	create_physical_mapping(params->end, params->aligned_end, -1);
+	create_physical_mapping(__pa(params->aligned_start), __pa(params->start), -1);
+	create_physical_mapping(__pa(params->end), __pa(params->aligned_end), -1);
 	spin_lock(&init_mm.page_table_lock);
 	return 0;
 }
-- 
2.22.0

