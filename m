Return-Path: <linuxppc-dev+bounces-317-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD65595AEA4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:15:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqDwX2JRrz2ymr;
	Thu, 22 Aug 2024 17:14:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42d"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=OT4WiPvT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqDwW5QB5z2yks
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:14:35 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-71439adca73so165294b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 00:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724310874; x=1724915674; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lG9D96+xW+VlDYZHTIMi8bcfezh9NEOiBopQjA6w29o=;
        b=OT4WiPvT8MpC6CrUrCKiEselPk4ucfCvPcv2rsC17Y7Wno0DaYOpkWa4vNrk1U6EG7
         kDVbGBXIHPigzdt1iU7jKStumbKfLmzTRPvfB/Q/3FzVK5FKkWPKMLjfsDX04dpupoUm
         61MJlGkNVm2mSC5P04PjP9lK+PIdMV15RqDInC9qK69pBIeDiLH5a+63swdiuTfxamNv
         rg1MuuROR7ODsXPSeXXPLRGT7SFZzfDp9G+LAAL4ookHvVIkbXEXem0EKpbL8Hvs4KhL
         gpn7mWCTQLVupmQm3F52miIwW2MQ4egYn9ODZjkRbk6pxli3eHHbXg8YhSC5VESbSwFs
         nc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724310874; x=1724915674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lG9D96+xW+VlDYZHTIMi8bcfezh9NEOiBopQjA6w29o=;
        b=NqhG+lhRHqSIbb1gKNzEqVO6XJR1LJNhFQuhsvQk/zN2P0CtVnjKsnte4dIWG6v+/i
         vV6w9ATJAvSjVWk5Lnio4UisKH+VfWxFT7eduxfYZRlC97cg+tT80fwMKOjJkdWB0DzA
         zufmpgs22NXh76ELnRYr7Y4IOQe6HIP+O3D0uRi9MaF81j35gMmiUczBZ+GUc20Xefut
         t/4FtCbkL4kpVWv1u8nONgBxwPLYewBaNmgunZgLF0EEydKXD/csKCNBZ2lXOmXp00jS
         yJHlOsvEr7l1sRrYHi8fwzwsFNZezuy8aOCrDm904MRAYhc7tTsIM+MLtXDCjUuSQRy7
         ZB0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUf3462cEqK1F/SCotGZBwDsumSV800cNzZd/Xi7Ca9Oop/IWhyOd7C3aL+dVw/TgdSZWKntJlRr+5YbZo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxQXq6RnKXjfl/rjjszNPxpQnlMpCP9iSV022tjGfhKBmLmMTBr
	pKerAJAdbkD11YCBZ0NQ1wbS4ZZahDiuLAUctF9i2L2n5C/8fikMPou/dzOoF7g=
X-Google-Smtp-Source: AGHT+IE1Azw7tBspdYFUO9+EydXCiNKc3KqrNzafyoF+69WNl4yC4JRDYA6cJOAAfX+V+yHVonAuzQ==
X-Received: by 2002:a05:6a20:9d91:b0:1c4:f209:f1ea with SMTP id adf61e73a8af0-1cad80f657emr5853305637.31.1724310873985;
        Thu, 22 Aug 2024 00:14:33 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([240e:473:c90:f96:d029:ea8a:4e6d:d272])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ac994a3sm695095a12.16.2024.08.22.00.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 00:14:33 -0700 (PDT)
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
Subject: [PATCH v2 08/14] mm: copy_pte_range() use pte_offset_map_rw_nolock()
Date: Thu, 22 Aug 2024 15:13:23 +0800
Message-Id: <71100c3867c4cf6f5f429ce9f2db8432066d0e99.1724310149.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1724310149.git.zhengqi.arch@bytedance.com>
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
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

In copy_pte_range(), we may modify the src_pte entry after holding the
src_ptl, so convert it to using pte_offset_map_rw_nolock(). But since we
already hold the write lock of mmap_lock, there is no need to get pmdval
to do pmd_same() check, just pass a dummy variable to it.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/memory.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index 7b6071a0e21e2..30d98025b2a40 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1083,6 +1083,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	struct mm_struct *src_mm = src_vma->vm_mm;
 	pte_t *orig_src_pte, *orig_dst_pte;
 	pte_t *src_pte, *dst_pte;
+	pmd_t dummy_pmdval;
 	pte_t ptent;
 	spinlock_t *src_ptl, *dst_ptl;
 	int progress, max_nr, ret = 0;
@@ -1108,7 +1109,15 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 		ret = -ENOMEM;
 		goto out;
 	}
-	src_pte = pte_offset_map_nolock(src_mm, src_pmd, addr, &src_ptl);
+
+	/*
+	 * Use the maywrite version to indicate that dst_pte will be modified,
+	 * but since we already hold the write lock of mmap_lock, there is no
+	 * need to get pmdval to do pmd_same() check, just pass a dummy variable
+	 * to it.
+	 */
+	src_pte = pte_offset_map_rw_nolock(src_mm, src_pmd, addr, &dummy_pmdval,
+					   &src_ptl);
 	if (!src_pte) {
 		pte_unmap_unlock(dst_pte, dst_ptl);
 		/* ret == 0 */
-- 
2.20.1


