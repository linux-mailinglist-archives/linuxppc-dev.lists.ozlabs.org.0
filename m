Return-Path: <linuxppc-dev+bounces-960-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0503696B518
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 10:41:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzGDj0rYRz2yVP;
	Wed,  4 Sep 2024 18:41:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725439285;
	cv=none; b=jCEj4p45MaFdTE5nOO3LPFAEVdU++CY6l1F1F62GMFHwvHcyklaoPDFL30G3Y9lS1pTn+Rw5s848TJHWUx99RCkfcUOkcalUJwKvjkDD6YBfLnnxkZ8DZ4c02czMSGEYJtxJ/RO89oZ63vOvnE8tG9PytsAjixSpuc+kn2IPIZkbxCmZpM1V8JC2dVld2tcUqple8SeMC43KWJ0h2MWW7Q8n0Low1kvQ3H8EYUpDLMNZpfPJpA5f/6DMTmxoWmULic0lEujaxSyNl5sqeptZLdU0cacEbEEf+4tuYJrOmWRNhDpfhSCmyWGbbgKNJYoTfVpHWXDoBmlhLAQfRhkIIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725439285; c=relaxed/relaxed;
	bh=pGIEfQHzsThgJvUA20OC+gjd0SFgF9+h9gc5ip8dlng=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version; b=N9bdcZQ+A//Ue0OIn2nsynTk3lOFDM9nUddkV45Wa2N4Q9rm6IoErspu7umj8iM7++he/P3V7BppHont6lFHqAyoY4LI5jOfexOl8tIlZmSjAoPmybCE9SD9b3ZjLJgfYyNPtqudmxP5Vucetk06O+C3GCzAj66FVoPvcHGjr4E4rAooe3xuNbiXWPqnLvXt3Yj3kyYSSY1idsGwZ8pL2uoByjMh1+GVu5GJm6O6boCkcahlze80ga2U+rNU7TkODZ3Zhuc3VFVFJfdH2+c6Sb+uu0RvoQj1S0lDnnB3MkjZ1zz6ZzzAiYwJYu/Hrg5Pv/R1nXhGlRTIHhe+EswPUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=eeEr2294; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=eeEr2294;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzGDh5WV0z2yDx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 18:41:24 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7cd9cfe4748so4059125a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 01:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1725439282; x=1726044082; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGIEfQHzsThgJvUA20OC+gjd0SFgF9+h9gc5ip8dlng=;
        b=eeEr2294HR2BIn1ULieA40gCnE0AOYZiOkyftN8W+H40IFLkFvVhoWQl/yQHXAjNUB
         BF4juIcr8D7njcODKxz/no65qb9EpQB55IsRb/D/HKFtBon/D20E/YqALWsPsza5P1L+
         zTZrEWuZvYxAZxexXyhZ8r/8d8BusdXGqGGLSv+yrOPueGRNGkVbb3RnIQoDvlOrZwj3
         UM88nUEMhUQqeK1Cl8p3TeDe4DtdzT/JxXnkNDDggmVAbwvqPhtXfqqvqkmdXtIMP08A
         4eA07SV7a6aXe22w98viSulUTR8gGjH0Fff1YZAM6LqVqV/OGOoBErxKZmwfwWyC4GeV
         FnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725439282; x=1726044082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGIEfQHzsThgJvUA20OC+gjd0SFgF9+h9gc5ip8dlng=;
        b=TB0OcpbowZAfRtua1gLxWvlT5xR6hl4hq4ZwqUxk+IKmTNDXzNt7TaGUsvsppydCxt
         /y4O9V9S3Jo43G+cfUQIznwtXSzuU2fVdJF4k9hJbLenq15Wwz9s3hOEHqu81iZiM73f
         7KNB3o2F+z/Cj3uskrH8f8Eg8kX2tiagUfcu0fbM9CHD8yzLeQG6RktgEn27W46ZW4M2
         5hRmFeyWEKX6pDaw69QgGpAe/mWjbjTMeobZSg3ojFHtgoQGwJBpXEyoxWvrBMSEaWex
         A+/7Ejynij5a228FezKMNfrdQpbbgqu7VdOlu1FDY9annPWzVN18Zd8c1gjHKgwIq44v
         kjQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUdfSO1N3Nk0LfVF2MNB0hIlB83neuGt9LhfYZTbRVNy1FabVEqSFA+5aZgWhYsJo0T5ocbQCbdL3XKHk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzIesI1VYJOKPVO3bkAALLNNzR6mDB41K4qe9f9pAhSpt/GMf+l
	ML69F4nPbm0EEdfJQ87V7doWiycfL7h3o6uKvmj1HFNARIoPcaUY5FeQhYVKiHI=
X-Google-Smtp-Source: AGHT+IGQLG6wPNgDOgfzFUGIly89eF+GLm9izjxQGbRYP1g8ZSKlFJK5pYdbKQOnPMpn9+eqCP/7EQ==
X-Received: by 2002:a05:6a21:2d86:b0:1c8:b65b:3db8 with SMTP id adf61e73a8af0-1ced607378emr11775108637.9.1725439282360;
        Wed, 04 Sep 2024 01:41:22 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae95a51csm9414045ad.117.2024.09.04.01.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 01:41:22 -0700 (PDT)
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
Subject: [PATCH v3 06/14] mm: handle_pte_fault() use pte_offset_map_rw_nolock()
Date: Wed,  4 Sep 2024 16:40:14 +0800
Message-Id: <20240904084022.32728-7-zhengqi.arch@bytedance.com>
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
index 42674c0748cba..06674f94b7a4e 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5498,14 +5498,24 @@ static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
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


