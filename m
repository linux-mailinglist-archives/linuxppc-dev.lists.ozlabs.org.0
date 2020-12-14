Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8822D9384
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 08:08:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvXY01pJszDqN3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 18:08:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ah+DQFnv; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvXP83KDdzDqR1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 18:01:32 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id b5so6061601pjl.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Dec 2020 23:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qp8PGJSLWU/dwswnH2/0kSDHsb+wln5XeqPaVW1B5Z8=;
 b=ah+DQFnviIYaiwW61xx/7aV1EqG6uLPtWc0d5mLXZjof3NJGVQvvrolW/w4GehwsgZ
 Kjz865XZJBwN7csGduekgiDndqDQMMkH63AuRBe60gEq1+3hlOynV/QU29ZZHZy1dmuh
 YqRxTfXSx5g3thhMEubi88ti01h4X/dvY+gl6HB5vRVVk6SEJFY/EpUIEzlpW+qFxvL1
 6VFFiBv7G2JdHMZs/8xBYZm9YzaSgcsZobouuYIA4wRKopgoW2tqi62eQTCOoAhaLIT0
 TK2G/9I2Juvg1hOJVBo51rMWp21v+CNQuh5UMCEp6vNrXNmhMcDRWV0pR3qyedE7yxgr
 oXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qp8PGJSLWU/dwswnH2/0kSDHsb+wln5XeqPaVW1B5Z8=;
 b=THEeOByN0Tvbw8kq3L12mnWMSClN6ITAyn6Jeuw0Ud/WpS23wF8ZB2IdVlgkzF945K
 YEwfCVpvrpELP4p/SlhnOum84nPKKm7HKWwPCI+Gqse3gowqBwWPB4k/7S5jluV/Qz7b
 xCReDch6rFr8aUmn2SWsj8/SLwOv7BQZpHvV9+A2aMzBIlGvXFIrj1v/Pdrcyzcc8bcN
 VzvfUCCF9E5ZLcYeMDKFsPeKUdVIC+jC3DiPhSx4oxRGnAVctgncRO95LmXJ72WlnKbd
 OqjY92IPfKByq3Zhm8nqqDjwBDNiIDxgkySVMAfMKEL2XYDY2ywF0zLk6OP6Q3CG7MLk
 gn2w==
X-Gm-Message-State: AOAM530DZdgKgbsEgzae/T+ETtx18ws8MeyubtxP9WYfwJ4jCIeNb4tY
 mTibToTdte5HVhmRShWV7qg=
X-Google-Smtp-Source: ABdhPJxhvHk5cUvHX6rAbQVwgg8ik+gRYQYw+Z++uVUyjX085PL81mc1MQ6kNeatmpvgR9yE7EELWw==
X-Received: by 2002:a17:90a:3841:: with SMTP id l1mr5029772pjf.3.1607929290263; 
 Sun, 13 Dec 2020 23:01:30 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.228.148])
 by smtp.gmail.com with ESMTPSA id 84sm19570018pfy.9.2020.12.13.23.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 23:01:29 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] powerpc: use lazy mm refcount helper functions
Date: Mon, 14 Dec 2020 16:53:11 +1000
Message-Id: <20201214065312.270062-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201214065312.270062-1-npiggin@gmail.com>
References: <20201214065312.270062-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use _lazy_tlb functions for lazy mm refcounting in powerpc, to prepare
to move to MMU_LAZY_TLB_SHOOTDOWN.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 8c2857cbd960..93c0eaa6f4bf 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1395,7 +1395,7 @@ void start_secondary(void *unused)
 {
 	unsigned int cpu = raw_smp_processor_id();
 
-	mmgrab(&init_mm);
+	mmgrab_lazy_tlb(&init_mm);
 	current->active_mm = &init_mm;
 
 	smp_store_cpu_info(cpu);
-- 
2.23.0

