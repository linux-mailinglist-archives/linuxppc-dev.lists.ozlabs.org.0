Return-Path: <linuxppc-dev+bounces-1610-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFD1986CC8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 08:47:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDkgF4N7Kz2yYd;
	Thu, 26 Sep 2024 16:47:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727333257;
	cv=none; b=O0Gf7jBIKGPh+s0vo/Fib0ati2XShvsBYFU4nJDYtIE7dO3OZBXUVfm/eqRJrMX4iCGsSDxNFoTrqysPU0PyCy6GAdDRT1qTTz1pijVfpkGmRVHQanqKwudE7TVa219/DvzRo/wYGZQYpV2gtjWyFqguR8Mbtk3Xrg8QdyuUiK7vLZXMojiXWGC/AswCIE1fs868PkXBHcYNPYEOi8KddHCoeoRVRNg9TrN30Tsj30H6SNYRerYU4NLDtpHviDBIHBUueIoU1cWG86llN8j0txbMnopxZ2HMdax0naBOenSrJfwtehoCV3/ADqWytyzui8jweOSqWqiuzILsNWoKZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727333257; c=relaxed/relaxed;
	bh=88oX8R3xcxvOkzUvzbp2hva7xyyimZKCI3msRz7gwSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mY5WkhZpRLVae5kG0AEvK1JqkFNriz57e+UtjhbVsltj+YSQYXi8M1z+zm7clgFJaueT52i7lQXIYCXCaYbmmFfMh6D5zML1L/T/BOvggI5Hbt5wq3JBG4xnuCR6pze7o5yZDxQfRM721DP5ZtgplpYxYDi8DVh7REPCaPCAXKhUBS3hxVQIpqCP8j4U/gnoANCk5+4rYGMwORI7a4AAwv/Pus4qm277mu5/nsIi8E/2JcEjCuTI0yaGkHBUWZEkgI4FcsWN2THYqajZpIcDUPUuZaSWXIooi+lt8Rmq1C/py0QD/hHWvn+yUDtmpba7DCjSTyIS5GTJTun8ADTXlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=e/chfbs0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=e/chfbs0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDkgF1DP0z2xF0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 16:47:37 +1000 (AEST)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-45aeef3ce92so3444561cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 23:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727333254; x=1727938054; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88oX8R3xcxvOkzUvzbp2hva7xyyimZKCI3msRz7gwSQ=;
        b=e/chfbs0daHyhFDDZPYteCthf/3Sse9reJeZ46PMamz6l/uTGNlLkdagJQQfbcgBye
         +vnSGZM/Ac5eunu+raAf9bOp4pFiqAMu9aWucg+5K76t0TAlN1gN6WXXkbk3Rf60ox41
         Si3uAirNkVIazpCCewyECm6d+FUvLXCKA5opwYJGf7HBn3p7gmnASDJ5Jt+tNPtXHhfC
         YPJcUOiZehpLVUXcKT0CHkpaNdXl0qvNJLJNO8kQXUQxFdTXkptMORURfXr8XR3AECHM
         ZJmnbIbPFRbtpS6c6FQYFpZP1ztzFp9C7cyQr0cg6MTD1t1udRmrZokYKWwkHgktQuy6
         5fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333254; x=1727938054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88oX8R3xcxvOkzUvzbp2hva7xyyimZKCI3msRz7gwSQ=;
        b=lQuCSjYBk2mWm2aLwCOuzwgOOYepvvkZ7k5QiiIk5ouC5ckobcAZHIM2yZom/amDXn
         G/teM88IzWSqhQzx2CKNwbgx6JPxHxzLfUCQWauZKub978ACYdE2QE/n2zYb9Ev/Rohb
         s//hE9Ldz+RUTcf0LO5RU4lIw9A7oYkO5wdS8goGtQ8NBpdoMpT90HreAS3A1fyZK/Sz
         oPDTPacj2p7QJEr6d7JTKuX0dUxaMrd6Qrjk1mGQWbJa/WbuHjINrE0mYNRgrmmM77dq
         iHMhbm7VApoT4+kjIOQ2GzuntWwZ8O654vBdk6EisUIEEcWpA6CLkIBX1uHdbL2Xbwhr
         Vb5g==
X-Forwarded-Encrypted: i=1; AJvYcCUgIOQMwmSJvwbEDH8PiZ65eMVF64wkf6g9bXtEK1k7IivJiC1czgAF5qubFTlR2NjC/NndmS27O3xLg/o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzsy95M5zx5sXVt4Ya8Ee42c6lot0OsVz8zIKCLvCi7U1BO16SP
	YW/KBhiS6dcms6TNd39yvlJITVqCzK8TWRd6ZWMKz3xR6I89rQ+aBjq+4l4nAEc=
X-Google-Smtp-Source: AGHT+IEkNfjkqcOSOf8WFqyh7ycpXwLGwDHOuzbRwWfPgE4JYY85w8LbZC4JktZjOBGqNKfXWcA2mg==
X-Received: by 2002:ac8:5a43:0:b0:458:3824:a083 with SMTP id d75a77b69052e-45b5def43dcmr69885101cf.32.1727333254117;
        Wed, 25 Sep 2024 23:47:34 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b5257ff1esm23024611cf.38.2024.09.25.23.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 23:47:33 -0700 (PDT)
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
Subject: [PATCH v5 06/13] mm: handle_pte_fault() use pte_offset_map_rw_nolock()
Date: Thu, 26 Sep 2024 14:46:19 +0800
Message-Id: <af8d694853b44c5a6018403ae435440e275854c7.1727332572.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1727332572.git.zhengqi.arch@bytedance.com>
References: <cover.1727332572.git.zhengqi.arch@bytedance.com>
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
vmf->ptl, so convert it to using pte_offset_map_rw_nolock(). But since we
will do the pte_same() check, so there is no need to get pmdval to do
pmd_same() check, just pass a dummy variable to it.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
---
 mm/memory.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index a245d28787034..6432b636d1ba7 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5750,14 +5750,24 @@ static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
 		vmf->pte = NULL;
 		vmf->flags &= ~FAULT_FLAG_ORIG_PTE_VALID;
 	} else {
+		pmd_t dummy_pmdval;
+
 		/*
 		 * A regular pmd is established and it can't morph into a huge
 		 * pmd by anon khugepaged, since that takes mmap_lock in write
 		 * mode; but shmem or file collapse to THP could still morph
 		 * it into a huge pmd: just retry later if so.
+		 *
+		 * Use the maywrite version to indicate that vmf->pte may be
+		 * modified, but since we will use pte_same() to detect the
+		 * change of the !pte_none() entry, there is no need to recheck
+		 * the pmdval. Here we chooes to pass a dummy variable instead
+		 * of NULL, which helps new user think about why this place is
+		 * special.
 		 */
-		vmf->pte = pte_offset_map_nolock(vmf->vma->vm_mm, vmf->pmd,
-						 vmf->address, &vmf->ptl);
+		vmf->pte = pte_offset_map_rw_nolock(vmf->vma->vm_mm, vmf->pmd,
+						    vmf->address, &dummy_pmdval,
+						    &vmf->ptl);
 		if (unlikely(!vmf->pte))
 			return 0;
 		vmf->orig_pte = ptep_get_lockless(vmf->pte);
-- 
2.20.1


