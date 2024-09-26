Return-Path: <linuxppc-dev+bounces-1616-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29978986CD2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 08:48:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDkh61FSSz2yYq;
	Thu, 26 Sep 2024 16:48:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::829"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727333302;
	cv=none; b=ITSIVsUioGgWquH77b78nxMY+xgSyTIlH/RFRXz9r5fFgAYp5t2dXHh4fm0iV3aj24cuXNkk+sQB9qeIChproM9UrD1+aCe+nNvDxcdsB2shysncin7TuTXHW6C8FiEAirVqRWhTjkcVrcdlyqjuBtRuzIxx8UcJD6Tq9DVSTWNWEzRSopKkHuJspk095yeXAPbeSeDUct0czkqTfJ8dnlYoN+JQ8R5NblWNZk9Zncav0hfML86hvvohLP2zFhyPRydwix82/TFk93Q9beowFXQ3lF+DUhew7SgokruMCh4R55Eqp+RuNb4JYdeApGP9duMpxM9KIidOuC8fqn6u6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727333302; c=relaxed/relaxed;
	bh=wKWf8ZYo9tlbP3964sEqp7HhdDy32FNbDdGL8iSt+Ok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gDNgw0BKmzZTyYRPaomJhKeYo1y46SRbRyjjnCbsbaOLmTKsQlvABaPiygEQijGBcv3zqm6wRe7kKm1zQy+ITlJOfwcWEqwffp1G/wvZLoAafvAW/kJSyyWdw+90QKUrw8c/TEE5THnJdN0Y8IQGNSqMTatoBY9uIVJ1z47RJVc3WndFUxat9rQHj0O8CL8bo2TwE8V6tfscdcNmK+c8V8L3VDqeJCBeLgpWFo48Pck61wxE/Bc7/DkzbzO4SK7foe6B8x7nEH76sfOsMpR4S8zHO7O+P43UsOwE2xAkRufkHHhb77sWXw3S3tfmoDyh/3w9nMsc0wY1WnkjFwvrsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TlJZs3uO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TlJZs3uO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDkh55HNjz2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 16:48:21 +1000 (AEST)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-458362e898aso4398981cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 23:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727333300; x=1727938100; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKWf8ZYo9tlbP3964sEqp7HhdDy32FNbDdGL8iSt+Ok=;
        b=TlJZs3uOtidYuz+0C8UwsRVPx6mNZfv5q3raUWr3/QlEGPUAJYF/1Sui/AIt0l9Rsc
         IbKu7l8ar11MUd/pnOJIFYYR7Qc2RBGE4OucVH2CTsMa0Mpu14hMOt233THnqVjLz974
         ssAWug5qlS/t/kPqef59SLcg7LtKth58u9f35gZYCou0I+TraKPB6OpYQDCkj+iPWZZ4
         Okp+zE+MEJ9DyVrhGWZGJR5FXSIBJgJDpmaq1Z20c7vkd36pBm9aLPa8jC4DiPAZN7aU
         XftxxxKiYNYtsD092/8PkJaaQusm05U7jblt+VQk1+1rT6oIAZODyyU/YynuNZHmzRlj
         rmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333300; x=1727938100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKWf8ZYo9tlbP3964sEqp7HhdDy32FNbDdGL8iSt+Ok=;
        b=SAu7glzEPxWKDqHllEiJ3lB6EUKUNL9YaKaEjryQgxxyibr22Hbg6H3FBi2gib4rNL
         aNjWptvPhh4hS0kKe1zxFGyAn5Xd8vVnEiqAOlJQFd6zHrSFngcCAUpLTQB8pkW6S093
         3IN590tm/to+veGGfg/yWiBC1p8+OgdJ25m4cY1JxBWPvUXCuWDfmlz0B5KpMqWozYZh
         ElPGNYzq90QrbDKL5YAMPupoGdC5+20iL1HpjJlUEENkOF38Mc/KNt8K29xDVXIqUAA9
         LxEM8eNa2XvehySvIxhwAbLHyLo2UYSBDMyhD4Ea0Kl+D8byEp/Ad9DbUx80afqXOrSt
         JAWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN1FtG9Shqyo3G2TgGqv/6INzkUZryntLG6ob4g9uTN7TO8h/yxER4sn+k59FEfPX5Td/HlZskNJAYicc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy4w0KPkeMdtx5a6aNeHbOvY3uHXmdz8HVq8ftJMiCbKp9YfVwL
	w4IEnydrbDaTVFt4cXzPasIgjxxHvkRlaFLb9zCbNKk+YKVmj/GHCwiBl1drq6I=
X-Google-Smtp-Source: AGHT+IH0PykjARYOlhRdYD8Ei00ntSXkZvlp+w/DvL/wK29HFMzX/PK1qWz6iq3HMQhndU3PBLr5iA==
X-Received: by 2002:a05:622a:51:b0:458:3e20:65d3 with SMTP id d75a77b69052e-45b5e06627amr81705351cf.60.1727333299714;
        Wed, 25 Sep 2024 23:48:19 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b5257ff1esm23024611cf.38.2024.09.25.23.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 23:48:19 -0700 (PDT)
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
Subject: [PATCH v5 12/13] mm: multi-gen LRU: walk_pte_range() use pte_offset_map_rw_nolock()
Date: Thu, 26 Sep 2024 14:46:25 +0800
Message-Id: <7e9c194a5efacc9609cfd31abb9c7df88b53b530.1727332572.git.zhengqi.arch@bytedance.com>
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

In walk_pte_range(), we may modify the pte entry after holding the ptl, so
convert it to using pte_offset_map_rw_nolock(). At this time, the
pte_same() check is not performed after the ptl held, so we should get
pmdval and do pmd_same() check to ensure the stability of pmd entry.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Acked-by: David Hildenbrand <david@redhat.com>
---
 mm/vmscan.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 749cdc110c745..bdca94e663bc5 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3375,8 +3375,10 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 	struct pglist_data *pgdat = lruvec_pgdat(walk->lruvec);
 	DEFINE_MAX_SEQ(walk->lruvec);
 	int old_gen, new_gen = lru_gen_from_seq(max_seq);
+	pmd_t pmdval;
 
-	pte = pte_offset_map_nolock(args->mm, pmd, start & PMD_MASK, &ptl);
+	pte = pte_offset_map_rw_nolock(args->mm, pmd, start & PMD_MASK, &pmdval,
+				       &ptl);
 	if (!pte)
 		return false;
 	if (!spin_trylock(ptl)) {
@@ -3384,6 +3386,11 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 		return false;
 	}
 
+	if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
+		pte_unmap_unlock(pte, ptl);
+		return false;
+	}
+
 	arch_enter_lazy_mmu_mode();
 restart:
 	for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
-- 
2.20.1


