Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E418B382420
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 08:18:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk88t6jFjz30G7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 16:18:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mUL6I5DC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mUL6I5DC; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk8745HW7z2yyv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 16:17:20 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id q2so4205983pfh.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 23:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mLv4bWSclRNeKydGcAItZKU13VW866/h0P1sQk42Rhg=;
 b=mUL6I5DCcjN/QiKfWDfnSs7QUveb7IraKnABRFbm/D4J0tdF/+ZMt+YwY8vvduF2o4
 xtefiiytx2I4jKe9ZWfoOzdEM13KlVbkk32Zky9gGlEZDGMg8rP3d4ibF5mh6Sp7bkQR
 nTxvL13hd/9yCq4l1MUh5vYM4UQ04VorDl1FZ//C1nTjIzkhkBU7ADUD+GvPj6bd3psn
 lnthrQRZd7qVHUCdyCV+DvlB2U/Rvcd+2+GycN6HkjLOR7Nm+rMiSJS1Zezgk4J8X5V+
 CEP/yR9kfrrRffYeGNCXxa2uRVU+LYG3ih/tw/aGn0hWWKuKVoyV5JpN+a11wA55pp+P
 3tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mLv4bWSclRNeKydGcAItZKU13VW866/h0P1sQk42Rhg=;
 b=GEQvx8BgQonJrPTvl5GGhXYGPc8nDs81TvzDbgzVPRp5DmmukBzSNP+tLSrU8OY+Cg
 7QQhIf7B9S9jD4k3DgXkvVeqwXZ2+7vO+10MqiDbnRZ7gjca12JaEjR3498RbC9tkyn4
 TYSAsvvQXW2E0YFiZbW8xyJYp8z0RSchlagL3SA25y4W/nIgw6+t5RIGL8WK+b/sCN4p
 O/pK1+bogRfZrrZeE9cfsbgUk2lZ8oYO2iVAh0Ow36vngNcU4NGpjdBLSLJv62naOeHI
 rtCFrD52Xf8EtJpimW0k1OJvRhvykyykLEBBACcItJb4tktK6tMisWuHlp6qi95+7+G0
 0OIA==
X-Gm-Message-State: AOAM532vph48xIfhrjqjbGS+/F8V6NjwwB+X25/aMuR2Ax0IV8ug/1F2
 t5Zp5pbVotZ44v3FxnAKMhNs/kOMKfA=
X-Google-Smtp-Source: ABdhPJz8I2Y2PVTaTWUZkDjGcAgjgp0+CXy7BVTfNH6Ii8ld594yb/7IQmZKnwh/L0hy9mWWCnVOdg==
X-Received: by 2002:a65:640f:: with SMTP id a15mr46757445pgv.251.1621232238299; 
 Sun, 16 May 2021 23:17:18 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id gg2sm1505327pjb.45.2021.05.16.23.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 23:17:18 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/4] powerpc/64s: Allow double call of
 kernel_[un]map_linear_page()
Date: Mon, 17 May 2021 16:16:57 +1000
Message-Id: <20210517061658.194708-4-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517061658.194708-1-jniethe5@gmail.com>
References: <20210517061658.194708-1-jniethe5@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, npiggin@gmail.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

If the page is already mapped resp. already unmapped, bail out.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index d74482cce064..fe5cf1cf4dd5 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1953,6 +1953,9 @@ static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
 	if (!vsid)
 		return;
 
+	if (linear_map_hash_slots[lmi] & 0x80)
+		return;
+
 	ret = hpte_insert_repeating(hash, vpn, __pa(vaddr), mode,
 				    HPTE_V_BOLTED,
 				    mmu_linear_psize, mmu_kernel_ssize);
@@ -1972,7 +1975,10 @@ static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long lmi)
 
 	hash = hpt_hash(vpn, PAGE_SHIFT, mmu_kernel_ssize);
 	spin_lock(&linear_map_hash_lock);
-	BUG_ON(!(linear_map_hash_slots[lmi] & 0x80));
+	if (!(linear_map_hash_slots[lmi] & 0x80)) {
+		spin_unlock(&linear_map_hash_lock);
+		return;
+	}
 	hidx = linear_map_hash_slots[lmi] & 0x7f;
 	linear_map_hash_slots[lmi] = 0;
 	spin_unlock(&linear_map_hash_lock);
-- 
2.25.1

