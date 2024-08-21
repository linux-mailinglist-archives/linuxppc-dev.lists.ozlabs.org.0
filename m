Return-Path: <linuxppc-dev+bounces-271-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9A29597DD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 12:42:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpjZJ45Q4z2yNs;
	Wed, 21 Aug 2024 20:42:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::534"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LywolRsl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpfQv3zHlz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 18:20:23 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7c1324be8easo376478a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 01:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724228421; x=1724833221; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ib2peXsn8Xzv08d3et99PPledeQt2suHPjEB9mw45Nc=;
        b=LywolRsl1+p6Mw9bZ5CDjTrcTYqHA07RAfllbzn6N89+uHWB8BFv1/f7tBa/SQn8yr
         4n4WTwE0hf0fdYEnTl9oyh0EGpJ6KXq5oTo+RxnBkS1Gi1waAA+kUEp56e6I7Y8OuFd0
         rCaVuSUt18Rnbe15KU/mbvnuLIU+bUvZR5vG7qjp/OXukRd2yEYlJ7BCgald4+A7tWxI
         89oGqpUGr43PYdidnCrndWqX5WbF6FgcyRfcmab1H6hGpK2ED2x9WrRUe2cab5et/VSL
         eeuFOrw95QtR/JArpOXes7RCFTeeShl1ghUtWBMNqP0EYXq4FNOhNreJ5uh+I3MpFSYs
         vWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724228421; x=1724833221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ib2peXsn8Xzv08d3et99PPledeQt2suHPjEB9mw45Nc=;
        b=ZfrHwkUHkbNZmXZvkXMVNDu1ANbIirdlyY/jEXDRvIiwmAJh78Yo5uhro0pHfqrEa6
         GGMchBXCp99QdzZgDKe6byEUqF+vagQjPoVKSG9Jye4y2Xxtjc0IxAV+yLbjB56Iueb/
         abQ/aLZMWYmXFRqUIZkFirv8Jf5CTP/vMB3fcbJzfheCeXiEapAtp71ZhfNui5FqnZ79
         850tX3oubzChvQUIElQWZDSCpK/gUnnEoRf2fCjV1eOpQEaOjQCja7F88rbMLfqWljlX
         FVg2uTT5jmgB/rtmMBToMOg8ByCKJVokfJbtZCEk/M2pOQIjJDHY+fMzbBgbGo3CpyNu
         H15Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrIi7TvASIrgVD5qB7TiWrvuRX9gl4yuSeSn3shYkxuNq1qMyoyXU2V0ACL5H92ZkaFmoRbrdYodBqios=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz9s8HfvP3RLVycIG8fnmx5an5JumuSAUU7ldfgWghjwcbHij+Y
	MZHplp9PdSRFmrQOtn7235I6iMWFVHhE0MVQdxDQQcSquQ3lRVdQad6RNdD9Dac=
X-Google-Smtp-Source: AGHT+IE93wrdhvj1jPWy5zvxTPwSbhlcdosDYnf+NOlDda6ytSjhdKrpXWKVADSrOUal4AF7Aqrd8g==
X-Received: by 2002:a17:90b:350a:b0:2d3:c084:9d93 with SMTP id 98e67ed59e1d1-2d5e9a2f0damr2610948a91.14.1724228421082;
        Wed, 21 Aug 2024 01:20:21 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb9049b0sm1091453a91.17.2024.08.21.01.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:20:20 -0700 (PDT)
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
Subject: [PATCH 08/14] mm: copy_pte_range() use pte_offset_map_maywrite_nolock()
Date: Wed, 21 Aug 2024 16:18:51 +0800
Message-Id: <05c311498fc8e7e9b2143c7b5fef6dc624cfc49f.1724226076.git.zhengqi.arch@bytedance.com>
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

In copy_pte_range(), we may modify the src_pte entry after holding the
src_ptl, so convert it to using pte_offset_map_maywrite_nolock(). But
since we already hold the write lock of mmap_lock, there is no need to
get pmdval to do pmd_same() check, just pass NULL to pmdvalp parameter.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/memory.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index d3378e98faf13..3016b3bf0c3b0 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1083,6 +1083,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	struct mm_struct *src_mm = src_vma->vm_mm;
 	pte_t *orig_src_pte, *orig_dst_pte;
 	pte_t *src_pte, *dst_pte;
+	pmd_t pmdval;
 	pte_t ptent;
 	spinlock_t *src_ptl, *dst_ptl;
 	int progress, max_nr, ret = 0;
@@ -1108,7 +1109,8 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 		ret = -ENOMEM;
 		goto out;
 	}
-	src_pte = pte_offset_map_nolock(src_mm, src_pmd, addr, &src_ptl);
+	src_pte = pte_offset_map_maywrite_nolock(src_mm, src_pmd, addr, NULL,
+						 &src_ptl);
 	if (!src_pte) {
 		pte_unmap_unlock(dst_pte, dst_ptl);
 		/* ret == 0 */
-- 
2.20.1


