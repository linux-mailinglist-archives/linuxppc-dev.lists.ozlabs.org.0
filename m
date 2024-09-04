Return-Path: <linuxppc-dev+bounces-957-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B00FD96B513
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 10:41:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzGDK6cHxz2yPj;
	Wed,  4 Sep 2024 18:41:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::536"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725439265;
	cv=none; b=Xfvxte4t3fV9AJBWUy93CGQW5KSZdtUv5xY6SKokH7U3Pm9Z7fy9xWo8mcAZwq3YnZzGVy1Nm1wJq3VbUzCrtdWWT27OWbTOkucp48qbKm7U5ekwUY0Y19yslSTphh84DFr//e0mMRgrsFBgYIUnR7QPmbdEH+vsQb5IiJfL8s09DuHpIYg73/7oX3EpXmykvdUIhaaS+1nr6c50pyZYi6+gjJzuJH6QNx0ZUdVjUUZZRy2iNKvH2hSBCS8zVccKx9QceJYP8mKiK8UC9W8vLcmwWfLFrvAa0sEaEiU8r03Q6v5FY2p39m8vMzjkNo1jAXgW7MPA1yO1z8SQXf4VGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725439265; c=relaxed/relaxed;
	bh=7WBwKEY9MWquOlo01BPdpzLz4TZdRIsQgPATlcDwMyk=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version; b=EZc6RAWojW/StqAJf95qRR+hGDqLnXN7qJfLp6Q0v4izXAavXydcmSvjdA0+tQHdtwsGAx9E99YUOgXPL8Xj61Ofi2yLLUQNtCd1Juof9Ad2fCtwPNZH6ACbYqeyIeAgs1kWpjNlZbHKfO2eMcAbGnwKAowzWpBvhXJutHL7Vt3UGeVjkOiYAb+vGtVk7Ho/X3EWjAv7iWKxnqDGwWHdSK6Idut9ggY9mK9yPFIt6e9uZw6QbPss72bSPPWBGK0M2WLrYusUCfflVALunPsNOcEQ95HJfStuY6RT+urvAMIWyimW/yAfvPsLOcQzIu988oWHU3wHRtTMN+YyPDh1BQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=WqmwLYsU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=WqmwLYsU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzGDK4RyRz2yDx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 18:41:05 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7cd830e0711so368553a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 01:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1725439263; x=1726044063; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WBwKEY9MWquOlo01BPdpzLz4TZdRIsQgPATlcDwMyk=;
        b=WqmwLYsUh68MkhY0gS/zmLQ+qjY3gJ7MhzWMXq5fhlJAhYVm1H5enDjnex6mZlAHSi
         1vn5DLTtGeKQi8/deStbaOf256Qm+9EeJzbZrHkbUUq78S3YIcv6jJa8Y+cQ8kjIhboN
         0Op8yHj5npg/Ty5XGZ3KbAzrkBZd9bd3SevtRo+qzWvl9NA76yA7z9IyfU4MrVG89s0G
         u2h16/tZzUztfqGxvTBR4MCo+oNMh/raUNJeDrB3FebNH76KZdL2cmqNyQdCLLWgRwv3
         pPeJEBRIOrqWR2X0/5wQHQrygr0SRV+anijLIvmWmQlJPgqfZY9ZDUQ4NcL1njLMdjTF
         +PdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725439263; x=1726044063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7WBwKEY9MWquOlo01BPdpzLz4TZdRIsQgPATlcDwMyk=;
        b=e72/tAC3ro+mdwW/ZwcScayFtGSbE6cLuj+iNFm22bUF0jfpZyB8NJh8R5mB0KGvso
         eOJvmjkloqYwMjL9g2Fft+q689A3xUHxxk4qeO6Xq7Pt/OslqV8URJkHtZBDEGs2snai
         eTODS7sjVeFeL2I0ekqMeALWp5M7V+miFEF7x+iJr0tN8Jai4FfVfU3UNw1NV2knJONU
         YXx2w+tMGu49SS2Ms/OUMHhUrxnghsOvVahQ29KBgsc007SuGIi81DFPHSBq+W2vF4KA
         se5HTmdbOr4YK8TRPnx5JMV+bxDSVk1V/3f8m+VRDLkueSbiMVeEGrmNOaT1n/PN4S9G
         fxXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFmaKczYo174jAuH9awj5FxsE7Gxgc4nDweFKGPNNJNs0Eb3Llo7WJftueWQ+4p+Yap0zdsDarCA9VtMI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxF2CJb0Eil6h/S5PIXANMTd2dJXzBWqhyTX+6m7g+Lyk5GBNJj
	GdKm0BHEiZpy7sJ8tlsnnxAOfCsCYVmxxKqidA4W0fVK/1nNH47emB/j5uNt1eY=
X-Google-Smtp-Source: AGHT+IFosxGKKraD23O7QyExDWz973MicB0gfFUEF3j/RrDnY2sLd35727GFsppJnEl62/xkyI7W0A==
X-Received: by 2002:a17:902:c412:b0:204:e471:8f06 with SMTP id d9443c01a7336-206b83566dcmr20294065ad.17.1725439263160;
        Wed, 04 Sep 2024 01:41:03 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae95a51csm9414045ad.117.2024.09.04.01.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 01:41:02 -0700 (PDT)
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
	ryan.roberts@arm.com,
	christophe.leroy2@cs-soprasteria.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 03/14] powerpc: assert_pte_locked() use pte_offset_map_ro_nolock()
Date: Wed,  4 Sep 2024 16:40:11 +0800
Message-Id: <20240904084022.32728-4-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20240904084022.32728-1-zhengqi.arch@bytedance.com>
References: <20240904084022.32728-1-zhengqi.arch@bytedance.com>
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
held, so convert it to using pte_offset_map_ro_nolock().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
---
 arch/powerpc/mm/pgtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 7316396e452d8..61df5aed79894 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -398,7 +398,7 @@ void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
 	 */
 	if (pmd_none(*pmd))
 		return;
-	pte = pte_offset_map_nolock(mm, pmd, addr, &ptl);
+	pte = pte_offset_map_ro_nolock(mm, pmd, addr, &ptl);
 	BUG_ON(!pte);
 	assert_spin_locked(ptl);
 	pte_unmap(pte);
-- 
2.20.1


