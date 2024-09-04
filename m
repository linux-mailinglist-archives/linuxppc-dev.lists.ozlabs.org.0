Return-Path: <linuxppc-dev+bounces-962-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE69996B51F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 10:41:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzGDy6rtNz2yTy;
	Wed,  4 Sep 2024 18:41:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::535"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725439298;
	cv=none; b=cSEZuavwM5A0Qh0TBjAHOslK+DkL0rzEY9MryGKfNTmoVTMYScK7Xsz7tVtC4J9LNfTK/yfd03HOADNNDAFq7FQjex/UzD0YLwV4WoTIdteFTiE7dZadglEvTnZKBecqetUbl6K9gNC7FJpOyd7D+tRO8oq2zrKWDjgcBz5WxXl+/q5VciFuW8Way4GYxjnUgIXV9nXguVhV+kjc8RsSw7RQK+hiP5/kN8z/J1nbXYt0dxtKc95D+sNY4Htx6WNhkshNL2JpLzRny6jekH3Fbx7jxt42qmbtlDYqiDIHiyRoPZsUsEdBZP7PRh7zm+Ji6k0L8fZuRwm1bH11bkbDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725439298; c=relaxed/relaxed;
	bh=ffoF6/h1+uprLqHi9escfobEZTHc+3j5UpPJif6C52k=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version; b=g4tJlS/df0Go1FQ/IhWMgrGsUx97HK4wiM6biSgXHdXa2TMYjS8k2QA907nNa4BX6DDzR4TRezr80iBrT3FvCMqVmgAk8AWgAWTbuMGkuQbc7Yor4CMT8wZUpNoguaUQHqDTS2UF+mNhtmMN5bet3ABRGbNTucgWrAvPEKpC2VEiYSNAWeJXkUinYja80n35JVaRbUYI76yR//E+lsx20UTWGRLSgtrY80SFWiFtuWG8UuRfsIbDTso7PBinr+et5QYRbnvlBIOPPH/NfraWJbtUh+SJUPIYQZ1kGVB9TdXHNykMHY6OVF9qElwODkJuRV/7iDgVRtR1d+PpjV/cuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=MK4jLMC+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=MK4jLMC+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzGDy4S4Vz2yNR
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 18:41:38 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-656d8b346d2so3803160a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 01:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1725439296; x=1726044096; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffoF6/h1+uprLqHi9escfobEZTHc+3j5UpPJif6C52k=;
        b=MK4jLMC+W26E041CI75ev3GCmAxkCs/ttAJJABpnk72P7VmBVqF4xfrTdcNLSjPiwI
         XTBeGMiCg1pKi7HM7ks1uI/fJrxolNuf5tZmBL9bKelHXS0oe30rWvaEi4Sfko/IXPKy
         9ARWAK9LP9JsLAgl0DbspY5ubvNUOhN5lWo1cnmYj+MgW1DmnrXUzC5Ak67j2HLPEvsz
         iyME6RDrXNsKp7nYPi9oADet2zsNLRx2DSJzTNSTZeYlPawgzso7n4vSqEpbpcEsOCT9
         ZfW6jIDl9axl9HZzIMkbuYhKtBDAyUoNkSe/6q/YojrIUxjdgW9U+Ese97m6SOnv+Yum
         NvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725439296; x=1726044096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffoF6/h1+uprLqHi9escfobEZTHc+3j5UpPJif6C52k=;
        b=gAsj5Dt7ztPWb01q1Stpm00C8eHZ5Apm/9K5hMdmmROTq6aTkTq9awOVsjye+Ah4+1
         r9x4clAVOCuSbbLPlEdyTgH9jJ12n3gvk+YWAgKPHHCd07idTCx+A9Wk5Bp4OivaBxMf
         LDZtT6CpVG76+7Ntm5aPrKUwDJjwpEnGZK2tFrgwz2P06iQXiQqTWOs9BJkXrb2bd6J0
         d5qUV441bFPT07mCcFwBCoKaw7lTijhXBwJ8mBX7NRO1RXZbe9jOaM76772g9zmV+yRC
         ZemZehbRK/DWayrMKAD0deIi5CKyTpl7Y715rkAbyypeb5PqlBn0hpvwoIiEVj4MyT/N
         xIqA==
X-Forwarded-Encrypted: i=1; AJvYcCVxBM2W75cj8SIy4y93PAnI45jRdkvnHN2+CZT9WEyF2ony549Xrn6l5Cx8s2rRjeJPmsyrKTCkvfySMh4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwI6BLH2d8k39vnpdCut0liXFRyoxXq2M0uNTuAzmIUD9zJ/4x+
	4QnCqbIpJgdyZ1/PeUY8V8LrPM5Wd8CoT3RI3r2/V0xJMQ6aq8tRxoyv2E+V1w0=
X-Google-Smtp-Source: AGHT+IHnX4UPdOrG4UbMFan2fo99NWoUyUAqXexLL4zg80mEgnx1zTpF+DDeMcB5gD3OIXAOIo10hg==
X-Received: by 2002:a05:6a20:b40a:b0:1ce:f77a:67d4 with SMTP id adf61e73a8af0-1cef77a69e6mr6594806637.6.1725439295802;
        Wed, 04 Sep 2024 01:41:35 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae95a51csm9414045ad.117.2024.09.04.01.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 01:41:35 -0700 (PDT)
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
Subject: [PATCH v3 08/14] mm: copy_pte_range() use pte_offset_map_rw_nolock()
Date: Wed,  4 Sep 2024 16:40:16 +0800
Message-Id: <20240904084022.32728-9-zhengqi.arch@bytedance.com>
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

In copy_pte_range(), we may modify the src_pte entry after holding the
src_ptl, so convert it to using pte_offset_map_rw_nolock(). Since we may
free the PTE page in retract_page_tables() without holding the read lock
of mmap_lock, so we still need to get pmdval and do pmd_same() check after
the ptl is held.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
Hi Muchun, since the code has changed, I dropped your Reviewed-by tag here.

 mm/memory.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index 06674f94b7a4e..47974cc4bd7f2 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1082,6 +1082,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	struct mm_struct *src_mm = src_vma->vm_mm;
 	pte_t *orig_src_pte, *orig_dst_pte;
 	pte_t *src_pte, *dst_pte;
+	pmd_t pmdval;
 	pte_t ptent;
 	spinlock_t *src_ptl, *dst_ptl;
 	int progress, max_nr, ret = 0;
@@ -1107,13 +1108,28 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 		ret = -ENOMEM;
 		goto out;
 	}
-	src_pte = pte_offset_map_nolock(src_mm, src_pmd, addr, &src_ptl);
+
+	/*
+	 * Since we may free the PTE page in retract_page_tables() without
+	 * holding the read lock of mmap_lock, so we still need to do a
+	 * pmd_same() check after holding the PTL.
+	 */
+	src_pte = pte_offset_map_rw_nolock(src_mm, src_pmd, addr, &pmdval,
+					   &src_ptl);
 	if (!src_pte) {
 		pte_unmap_unlock(dst_pte, dst_ptl);
 		/* ret == 0 */
 		goto out;
 	}
 	spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
+
+	if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(src_pmd)))) {
+		pte_unmap_unlock(src_pte, src_ptl);
+		pte_unmap_unlock(dst_pte, dst_ptl);
+		/* ret == 0 */
+		goto out;
+	}
+
 	orig_src_pte = src_pte;
 	orig_dst_pte = dst_pte;
 	arch_enter_lazy_mmu_mode();
-- 
2.20.1


