Return-Path: <linuxppc-dev+bounces-266-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B4F9597D2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 12:41:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpjYR2Mzvz2yJL;
	Wed, 21 Aug 2024 20:41:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1030"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=iKgm06tW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpfQD4Rl2z2xTl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 18:19:48 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2d3d0b06a2dso4606872a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 01:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724228386; x=1724833186; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkLNXpSDw35lj4Q8QTsPG+BhSNUK5Ar50Dqo0ISPkHo=;
        b=iKgm06tWty5hEXR+VcYLCYi01JvZyyDU3IdYWkESd9He8mARjmyAie7qlaT+s7y/b3
         /O+G7Ii5djZyTY8aEdmRB/MAN8PI/pAfeohZm8thbUPgLP9JaVPpE2C11yrXHECv6QJo
         zYzjRGhlKfbf8rKPRtjvw5r8SXVZ52+EOrnznJsseQOuqQ51KtO+obfZ5JhmKI32zgz2
         MkaPA4jqKxWjYVuQhr1v7P4MmaBo4JOxN6yHnDStkcsRvm/ZXEzmg1fJxxbCx1WUQsHy
         u5BTXfif9LSgJc5K6sYxeatv/8jH89ikFnPciuhQ7E8hUCbvIkZyz/L2AYO2vsGkemao
         H42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724228386; x=1724833186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkLNXpSDw35lj4Q8QTsPG+BhSNUK5Ar50Dqo0ISPkHo=;
        b=Qfq50c4lpNHNKUnW1gfDTAUxGqpXbnSFfMYz280dl/QmCXjMdnzfA7BluAM0ZwoIP6
         L0f7oCGX7dIIfQXgK3P71s6QcfWp17saRjKlrg/YbvWQ6kY+uVsYB3u7DNVqPgaKRxhR
         TmS2r0n2cLStAgjsUgxUL9AfWymnbw+QRfjw/6YO3sy1OAQWtA2HcTKWZXwavNuKA1pM
         Saf0tfKy2RKjpGt3oEmjozQOzRFuMcNDhWsl3uAnWoDWuvKelqP2MSXv6uvJ98Hfasq9
         6I1k/8ef1hkOM+P5Uha0P3V0iANFqRzgWAwXozRkeOK+4RkuNOv3H8Fx5HTWewqcUI8t
         lFBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAa1m01UgeZHy6+s7UxqrWZ78iDapTIp++HYNsb4t/ArvdQehWq3zhuQYBKUsB4CU23KeODywhYosLFKQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyA//U9wWetrQV6KtZQEy3J2V0w2tQO0ICC5J+vf6LttOfBJzrr
	edauQOs78RMmX1X1YKah2zVc7RrP5urqnbfV3ZMx89jfkKXsjAZBhjjjKWkKkY0=
X-Google-Smtp-Source: AGHT+IFyY3NlNyztu6E70clqH4irJgHSXlPUHA4AtOW6RrWWSbwAKaoUYDBEK6KZMX7nlR++kviHPA==
X-Received: by 2002:a17:90a:e7c6:b0:2cf:cc0d:96cc with SMTP id 98e67ed59e1d1-2d5e99c8b75mr1585510a91.9.1724228385781;
        Wed, 21 Aug 2024 01:19:45 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb9049b0sm1091453a91.17.2024.08.21.01.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:19:45 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: david@redhat.com,
	hughd@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	vishal.moola@gmail.com,
	peterx@redhat.com,
	ryan.roberts@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH 03/14] powerpc: assert_pte_locked() use pte_offset_map_readonly_nolock()
Date: Wed, 21 Aug 2024 16:18:46 +0800
Message-Id: <a69c4631ab86ff9aad3f576c4f88979a223bbc55.1724226076.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1724226076.git.zhengqi.arch@bytedance.com>
References: <cover.1724226076.git.zhengqi.arch@bytedance.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In assert_pte_locked(), we just get the ptl and assert if it was already
held, so convert it to using pte_offset_map_readonly_nolock().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/powerpc/mm/pgtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 7316396e452d8..ae4d236b5cef7 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -398,7 +398,7 @@ void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
 	 */
 	if (pmd_none(*pmd))
 		return;
-	pte = pte_offset_map_nolock(mm, pmd, addr, &ptl);
+	pte = pte_offset_map_readonly_nolock(mm, pmd, addr, &ptl);
 	BUG_ON(!pte);
 	assert_spin_locked(ptl);
 	pte_unmap(pte);
-- 
2.20.1


