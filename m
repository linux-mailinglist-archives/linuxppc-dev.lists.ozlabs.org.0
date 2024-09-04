Return-Path: <linuxppc-dev+bounces-963-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1277696B520
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 10:41:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzGF52fT7z2yNR;
	Wed,  4 Sep 2024 18:41:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725439305;
	cv=none; b=GpGlREDrcH1owIuzogIFBSA0Y5PJqU9eZrKacoTas6o5e0pp2fwJaTqzDUbYMFYjFwRzsOFo5WuudOrSRU3UXjWoCuDNZQcfVwSc22oK78MKvzrkbYPRMKgftAUbe/e3an5HLOb9RaLawP6xvavr6Wi+mJZTMMskVNah64fLxZe5DiF+isz0wWs96HPT9ft1+1UmnZbufTCiLUW8PUXvdLmKaNamfipZZbtZOvhSB/WNAG3DFiMmrHTs8UDurtddBhgid9/ZdK+AE/UCUn2Ejx6GuzUntyLDod9vBSUL4wHFq1mHDl51AGWrd2+9FqEiWGflGztVaX06uAlXe263Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725439305; c=relaxed/relaxed;
	bh=vHfOyy55HFvG/XxGZW1ra6nqYg449VLN9cHJI9/IEBs=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version; b=D2H3yZldd5vYKwP9VLOJ7AdfJnF5Ia0wnQB/ZzjYL81KGPEGgQny95T2aIeBxwkzvIUOp5gWu8kG3l7EDDWPW8FoSRgugNCKFvNOxgdPcszxD59EaHkC6aKQ9Lik5ix6F2KX+jymuT1tANRrBByrKvNgh9qSJjIhx+BLS3eNt4RLBgHyyCjH0zWV9kZhPg6VpkSB434J0l/isynviUZw+otSOLvFLKEUVlQnzdiDEVkfPwgFMNZb2YOkklwah0S5V+UFAY8wXXpKr62g4wEvFYvWXTtdL4zCsWjx/UTcgkFDVFfI00s7BxicFm5o/21m/qu6s+OhKZHb7XI4WTAX2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LRXLZVbt; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LRXLZVbt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzGF514pNz2xbF
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 18:41:45 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-206aee40676so6577715ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 01:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1725439302; x=1726044102; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHfOyy55HFvG/XxGZW1ra6nqYg449VLN9cHJI9/IEBs=;
        b=LRXLZVbtsUo4cz9sdzFOnF+XuUY1svO9GTCX+oNxO3erWWyoK39O73p5IAjMfvMM6y
         HjifTKTpU4fiW5S+Y6YlduuVi4kvv1hi5OYCQPGxwlminSnTty/8BsdFRAdiZnFkbWuW
         yex769A48SF6XJiMfbm8XxIQqeczkSLs3Pkx6tgibR6rNZ82vPfYXb+vS0PZmoi+/rBF
         N0YwxGNqot4uZF6qbQVoiscm/fJOgLZnI/TzvQCv3vucTAJO8YS47HCtIHH2PvwVnonX
         pZrSXYOakuXE+dRLoN78R3qzVj/eBKEVJNduSZChYMtWvokqH/TsLB1TB2kr58Q7WAkH
         OyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725439302; x=1726044102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vHfOyy55HFvG/XxGZW1ra6nqYg449VLN9cHJI9/IEBs=;
        b=cbLwkK9Ipru59eV0xhPct8ZoPPQoefD+7sI9afeFLGfa/t3fXN8FOPoUqpTx1Sa6RW
         J6PIUecVnqQv8k4244CGfrifAvdRiZDAS7Td39l/8jrByTmuWv6BWZQNp9lnxHX3eImh
         l84CFvPg9Cm35U5ZMxEzjkVrC0/fUwyIq0tVscd+e/vTItF6wAeMeMoEkZxcNB9vHWN5
         eTp3MnHyBDsKg/FRPTSE/Yrd8M5mGEzHgXv9XYRcvdNUg+BPOsmkRl6OJuaHkF4UKAXV
         fKPI7mbrhLbRi9TPxmWT4znbycSV8rSjeQnpMYRkv4P18L6Z+1rSnUi/Nf6wmwDkym1J
         Oz7A==
X-Forwarded-Encrypted: i=1; AJvYcCWNj/9aEvYyOveR7Dq1x56ugRciejLxUMNl8uzuOZDi2b+ONBDbcpXmLhc/wJ8wVWS0tCRxyTrVcUJQV5o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyZEXTlqV1jzn84U0ZlnxtcJp5nF3o5BPdrM1uhtb3e8HtzB11R
	4S0LmrrsP2kUnITcH1UOk71/mtHZSHU86WLUYsDlrf3gyJBoXXLG4VICAHSFKiU=
X-Google-Smtp-Source: AGHT+IGlDE+bZkJMe3LtnR3dMefm4RFnOsn/qpiRzdld3O/wCPCkO6r/LjjSl6iGWtDIKmNPthI/eg==
X-Received: by 2002:a17:902:b68b:b0:202:4a24:ee with SMTP id d9443c01a7336-2050c45e710mr147539585ad.55.1725439302519;
        Wed, 04 Sep 2024 01:41:42 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae95a51csm9414045ad.117.2024.09.04.01.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 01:41:42 -0700 (PDT)
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
Subject: [PATCH v3 09/14] mm: mremap: move_ptes() use pte_offset_map_rw_nolock()
Date: Wed,  4 Sep 2024 16:40:17 +0800
Message-Id: <20240904084022.32728-10-zhengqi.arch@bytedance.com>
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

In move_ptes(), we may modify the new_pte after acquiring the new_ptl, so
convert it to using pte_offset_map_rw_nolock(). Since we may free the PTE
page in retract_page_tables() without holding the read lock of mmap_lock,
so we still need to do a pmd_same() check after holding the PTL.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/mremap.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/mm/mremap.c b/mm/mremap.c
index 24712f8dbb6b5..16e54151395ad 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -143,6 +143,7 @@ static int move_ptes(struct vm_area_struct *vma, pmd_t *old_pmd,
 	spinlock_t *old_ptl, *new_ptl;
 	bool force_flush = false;
 	unsigned long len = old_end - old_addr;
+	pmd_t pmdval;
 	int err = 0;
 
 	/*
@@ -175,14 +176,29 @@ static int move_ptes(struct vm_area_struct *vma, pmd_t *old_pmd,
 		err = -EAGAIN;
 		goto out;
 	}
-	new_pte = pte_offset_map_nolock(mm, new_pmd, new_addr, &new_ptl);
+	/*
+	 * Since we may free the PTE page in retract_page_tables() without
+	 * holding the read lock of mmap_lock, so we still need to do a
+	 * pmd_same() check after holding the PTL.
+	 */
+	new_pte = pte_offset_map_rw_nolock(mm, new_pmd, new_addr, &pmdval,
+					   &new_ptl);
 	if (!new_pte) {
 		pte_unmap_unlock(old_pte, old_ptl);
 		err = -EAGAIN;
 		goto out;
 	}
-	if (new_ptl != old_ptl)
+	if (new_ptl != old_ptl) {
 		spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
+
+		if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(new_pmd)))) {
+			pte_unmap_unlock(new_pte, new_ptl);
+			pte_unmap_unlock(old_pte, old_ptl);
+			err = -EAGAIN;
+			goto out;
+		}
+	}
+
 	flush_tlb_batched_pending(vma->vm_mm);
 	arch_enter_lazy_mmu_mode();
 
-- 
2.20.1


