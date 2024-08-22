Return-Path: <linuxppc-dev+bounces-306-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAB495AE86
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:14:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqDvt1bf2z2yY9;
	Thu, 22 Aug 2024 17:14:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::532"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=lMiRpoOs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqDvs6x49z2xDM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:14:01 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7cd70404bd5so164264a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 00:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724310840; x=1724915640; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/m1IXPfk7xvDU+Qn41r4NiqBFnWc/gEWMU/opSilGI=;
        b=lMiRpoOsp0jkh3gVw4x2u9+2sWo0jA2EhiUrXMsbTfXCBBJi2jRJkjMpMbUuBiAPcf
         ZLpXTuZYORHpZqNh+q4jCT8yCr21Wb9hQWBecakjeR/9HtWecp2G0ifm2GPS8Vz0JFhp
         DukgkOv5L/t34kLofm1AB+WioF6wL3hqvS3rSK6wMedJmiUUoXh61rNwhhETc3unmidW
         8YDi5Ju9MyR0iD5fFDg4qWyfBy4M6R/E62JrQdJUgwWrBkSmhYyT2Usk3xsyvShLI80n
         VsBW+m6oVGwR7EbLY7Ldd6hezejlwgA1WV+mmeWyR3b1Q3cjUHL4jCIx2+Ak4JMOi9M3
         Yzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724310840; x=1724915640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/m1IXPfk7xvDU+Qn41r4NiqBFnWc/gEWMU/opSilGI=;
        b=ZkoRwfcFEbvIk0Xr/z2PodL2xRwiT2iDxoHgzsZvnBCSDAUdb5phI1B0Wz+N3R0rkk
         0S78B//GhR2LHu4P/R7AQ8BvXnk5GqdzyMEMZlDpwOqzt7UwbhZFSft045iLFL4YR8QN
         93CB9ldKcgbnn6/WItt09anHoXnKTAXkb2t/AtLB1faJiJ04ANvwjWFwqJq8ghnPcdlo
         r9Ftkyr1/3ow310bWl2jh+p6q7NRXkNDqalOaPC9zd1IlVNfNPHqT6qoKeZZmJadGB9G
         XxTSLKsp/VV51IyQfxA4K63OTs/T1pOeKTtO3lTwiukEh7FtspTjjlfWeBlzayWYWxxm
         ER6w==
X-Forwarded-Encrypted: i=1; AJvYcCXtii4v1rICrah3TUHMqP8dkW/rOrRfTSfJoCZ9Ejl+BS2Sz5Klu0HV7Yno/SZSJT6i3C5ycPeaIzUyjUQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx2BtDS5IngKgwuNmnQUm4lOhkW94hhLiTjVonil866hN8SkgdY
	ptfAn+O1K7Dc5PM10nEXz9rNpwfU5sLD26jqmIwSlX5LKUEmB1XPf5cLKMoAyTM=
X-Google-Smtp-Source: AGHT+IEhsa9RMy8FC6eeC7Dc/qzW9nWoiqPGY6DtNfgP/dDTOo2T0oKgHsMPC17UGp2n78kSJG5uNg==
X-Received: by 2002:a05:6a20:6a2a:b0:1c4:9c08:5df3 with SMTP id adf61e73a8af0-1cae51cf01cmr3205085637.7.1724310840022;
        Thu, 22 Aug 2024 00:14:00 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([240e:473:c90:f96:d029:ea8a:4e6d:d272])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ac994a3sm695095a12.16.2024.08.22.00.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 00:13:59 -0700 (PDT)
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
Subject: [PATCH v2 02/14] arm: adjust_pte() use pte_offset_map_rw_nolock()
Date: Thu, 22 Aug 2024 15:13:17 +0800
Message-Id: <7915acf5887e7bf0c5cc71ff30ad2fe8447d005d.1724310149.git.zhengqi.arch@bytedance.com>
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

In do_adjust_pte(), we may modify the pte entry. At this time, the write
lock of mmap_lock is not held, and the pte_same() check is not performed
after the PTL held. The corresponding pmd entry may have been modified
concurrently. Therefore, in order to ensure the stability if pmd entry,
use pte_offset_map_rw_nolock() to replace pte_offset_map_nolock(), and do
pmd_same() check after holding the PTL.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/arm/mm/fault-armv.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
index 831793cd6ff94..de6c7d8a2ddfc 100644
--- a/arch/arm/mm/fault-armv.c
+++ b/arch/arm/mm/fault-armv.c
@@ -94,6 +94,7 @@ static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
+	pmd_t pmdval;
 	int ret;
 
 	pgd = pgd_offset(vma->vm_mm, address);
@@ -112,16 +113,22 @@ static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
 	if (pmd_none_or_clear_bad(pmd))
 		return 0;
 
+again:
 	/*
 	 * This is called while another page table is mapped, so we
 	 * must use the nested version.  This also means we need to
 	 * open-code the spin-locking.
 	 */
-	pte = pte_offset_map_nolock(vma->vm_mm, pmd, address, &ptl);
+	pte = pte_offset_map_rw_nolock(vma->vm_mm, pmd, address, &pmdval, &ptl);
 	if (!pte)
 		return 0;
 
 	do_pte_lock(ptl);
+	if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
+		do_pte_unlock(ptl);
+		pte_unmap(pte);
+		goto again;
+	}
 
 	ret = do_adjust_pte(vma, address, pfn, pte);
 
-- 
2.20.1


