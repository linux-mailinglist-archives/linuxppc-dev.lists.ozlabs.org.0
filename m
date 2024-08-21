Return-Path: <linuxppc-dev+bounces-269-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B540F9597D9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 12:41:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpjYy54Fsz2yMh;
	Wed, 21 Aug 2024 20:41:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52f"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TmUvXwx9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpfQf4SCxz2xX3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 18:20:10 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7cd70404bd5so269366a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 01:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724228409; x=1724833209; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xk5nZGQoU/UHicxrt5T+UXYIL6+4L5PcGNmpQKRqaJs=;
        b=TmUvXwx90dvruGyFof51UbRE64Tk8AHaV8akKqnktONGFDdW4dDEE0X6N2YS3ssE1S
         v9Ld4uTJtmmBNyC69KhKb6BXPHP9GIqXioPGwGJhsKSZsT8rBpMQFFn5i9Q1Njp2vLzs
         1gZy/6+J7Q3Jr4P+pFnRQKzmXjmFuEtR+fLeevkCwSSkgYZ+kNMY0Ocw45EG+Nmfn4k7
         3hSIT0PXbg/HyKQ0GjpDMayZw+yDsjxcv7d1hmGf7F+/XV0hzsWOn0txrW3ori6DRixW
         1zdaZKW1UKbjG/Buh5l/0dExvJIu6XnwBSBsb7qy3ahLXNFaTuxg0WeZGY5A0PhuboUh
         9t5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724228409; x=1724833209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xk5nZGQoU/UHicxrt5T+UXYIL6+4L5PcGNmpQKRqaJs=;
        b=AcTkHE+x0GjzazJAPL/MR2MvbvhiH/HLcjBrM0JSlk7dxMHRa+Sut+KE9dcyfbNcYM
         GdTqXDrF9vrQCCCzILjTGHEGqoQQbjgwi4JHxobdWy7SltTP1gs0UVjHDSpYY/abrhvf
         Hj4s1ZQv/xTZgO9XyFX0+BaC9I8LaYOvaIb2c1Kxt7KdXrf9v0AQq2XaSPMU//GAPelY
         +vIquMZ/6WPDgqRkFPoT9CMox6O4VePauT6qcZKH+gmev8/tbBBME4Mhm70l79FVhuL/
         dbQvkGjk5O2MlarmmGzYh3r1v+0hi3mLNxdwumhzK9Qo90fNN/iW6fn/nTL/avEOCDzB
         dt5w==
X-Forwarded-Encrypted: i=1; AJvYcCUnsXprZEmBBRBvfhNxhIRJ6MwgvJ120DniaxWw7oUODx8POOHzkfSHMU5WbEf12dKDXv1TRbY82oXl2Kw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywvux7lmVfcrxWYU1c/dKFWNBEBksWQ/7+g5c92vcdGaYL0Kq0a
	xIxfeaWuT+4NfeFgJcs3vApZr/zCfndZwXPpPQDLSPjVRH7Q7bjdTLBLsjgXGgg=
X-Google-Smtp-Source: AGHT+IEz6hEUMU7QDWWn6q3mNXap3/YJ5XtpoR3UgLNTk8qimJ6ZhRH05YhkApxF5Pk84JIDmuV6pg==
X-Received: by 2002:a17:90b:4a10:b0:2cb:5dbb:d394 with SMTP id 98e67ed59e1d1-2d5e995c932mr2717849a91.4.1724228407428;
        Wed, 21 Aug 2024 01:20:07 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb9049b0sm1091453a91.17.2024.08.21.01.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:20:07 -0700 (PDT)
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
Subject: [PATCH 06/14] mm: handle_pte_fault() use pte_offset_map_maywrite_nolock()
Date: Wed, 21 Aug 2024 16:18:49 +0800
Message-Id: <239432a0bc56464e58a6baf3622fdc72526c8d57.1724226076.git.zhengqi.arch@bytedance.com>
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

In handle_pte_fault(), we may modify the vmf->pte after acquiring the
vmf->ptl, so convert it to using pte_offset_map_maywrite_nolock(). But
since we already do the pte_same() check, so there is no need to get
pmdval to do pmd_same() check, just pass NULL to pmdvalp parameter.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/memory.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 93c0c25433d02..d3378e98faf13 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5504,9 +5504,14 @@ static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
 		 * pmd by anon khugepaged, since that takes mmap_lock in write
 		 * mode; but shmem or file collapse to THP could still morph
 		 * it into a huge pmd: just retry later if so.
+		 *
+		 * Use the maywrite version to indicate that vmf->pte will be
+		 * modified, but since we will use pte_same() to detect the
+		 * change of the pte entry, there is no need to get pmdval.
 		 */
-		vmf->pte = pte_offset_map_nolock(vmf->vma->vm_mm, vmf->pmd,
-						 vmf->address, &vmf->ptl);
+		vmf->pte = pte_offset_map_maywrite_nolock(vmf->vma->vm_mm,
+							  vmf->pmd, vmf->address,
+							  NULL, &vmf->ptl);
 		if (unlikely(!vmf->pte))
 			return 0;
 		vmf->orig_pte = ptep_get_lockless(vmf->pte);
-- 
2.20.1


