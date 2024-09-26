Return-Path: <linuxppc-dev+bounces-1607-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0CD986CC2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 08:47:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDkfn3NH7z2yWK;
	Thu, 26 Sep 2024 16:47:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::836"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727333233;
	cv=none; b=Lkwif6jVwIfisxhPONSx0lOVDSF7v52x8mRYwTm/5TF053kEXd/cqukUuHfkMSbuYg6QmsGNh08WC3I9kfytc67oBHVTistj3LtsKKVHgP15cWr+HoXN9WSwkK1iACUgCA19c3DMQ0Jwg0a5QLi/zv3BmRtEoFqGW0Gu9sOKB1tejHzX29WtrR3c/WoDMzSTLj56hvuMYKa4airZV1ITncQMmc2ceC7Itjkx9GTRiEwCC68Co/AUlKeUGNS4NKlxJ1HYClwyFFezpU2l1DT6pilTKx6lY9TvVDLVXCawZUrV2Yvc6kfhBLaV/frK+R3qghp9ytQabNEV9GdXZyVUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727333233; c=relaxed/relaxed;
	bh=BmENsM1LVZMrc0W501TyzYIERT8c75Mhan1AJ9vs73Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g3gh6h5oMc7zoDEdFTkFpSZ4dmlDveEFEKQhUWpCOYyKHD6AEDZk0XXwZhPDObLSKaZfCRNlnbFzmObqU79Z5bvr9Ki+vAfO75+AeLd3ljJAdoDibZ4O0ScMXm6nbxBICoCh+bXgAJPZvafcDTQADHVmb9nZJTYVmF4Xt6D/FIfWyCMJjz6PKd1Irv+3ttpb8XTMk7A8BGIXP27DWcOKw941XiaN0ko7iJ+bAADbGF2x1CR6Bmw2ZJVcqBtZbpl8OTWAnylYWwyrUG5RfTFsaOVFn/6GYxHarCU/AfY0VGRlRDL6Jq6CDtLkPQdbQbpoViltcy1E50Ld7n/6yvaxjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=VgMptUwF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=VgMptUwF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDkfn0Fxcz2yV8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 16:47:13 +1000 (AEST)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-45821eb62daso3474231cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 23:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727333231; x=1727938031; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmENsM1LVZMrc0W501TyzYIERT8c75Mhan1AJ9vs73Q=;
        b=VgMptUwFmKybnc6oQnxp7E28eVHSX13DLsf/NA1F5Zk5JbzdrWeLFTu+1ywNZXOotW
         SGYqbyR53loqDe0iYLpExG+tznNA1qPDgdRGHyr8ILACICXqS/VhtomaxynrxUaJZa49
         ZjfUgGWtF2qSIE85ojYDFdMaVSxUILKePqNub+obMpqlOPIMTMUyh1JzaF/HhDj6l2js
         ACaqcQs5xYz2Ua0NdYsIilgQj7k4m+qz7j3sEsZE+x3kY6ZRkLnToCLxOnYYtVeuKzpM
         VHxPUQRAOC6gq2SIvuV+rnARTiEDDuLSxafBsG/ol9caPnC4l8lWGrYUxSj+67yaHbKE
         h0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333231; x=1727938031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BmENsM1LVZMrc0W501TyzYIERT8c75Mhan1AJ9vs73Q=;
        b=POMjy4c6VneOWrNbjIX7mniSGaO6pFRYG5BMS7Gi3DdcJAQEaSaiCiAGDvKiOjO+tz
         PiI9Fd6kpI0nlrAMtCI2EiHQ1bzGHF1iMM5ebloGC5hrJf7zh7ZJNnFZ9IzLYE2Y/tFO
         Uu+6m6XxgYWn2GzqwFaFZI2sA/HEjxMSkS01w5fWrAW4b/W9a9grJus6xFR85rJ42BxI
         JIBN0aL8fqQcmz8Fp0crYf02K82xipzUPik2mUEkONYSHqiWr3Po84n1qkn45F3rYTwh
         oWHk8T58M7NYO8D+zYkgcrdIgE8iBOFCqp3lNiEppjw/UgbdkI8pOQWv2H2p2P6WK/Z+
         W9qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXA1N+ScaYHt7phDVYdPcKGbTz44bz9cbaXlZUR6um9SzIxhdfRzbfl0j5MeFZ7MFAUcXKe3aIdyIB4QM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzIm6VIT2Qkg+0Jol8SYsGdQO4I4BaptQmUFnoQs+DMHQlKmyqm
	d0oHbZs7V9FoTHz4x2Qu/jGDrxZ7UhOiYm+y55vuxcsrQRydwfGcEjNsr68Oip8=
X-Google-Smtp-Source: AGHT+IF3jq8XAx4d8MvdG//ydygdKBfb8RG21eWCHGRQrOC65QRa0E/gKmvca15+75cy4x5ki2/uwA==
X-Received: by 2002:ac8:5914:0:b0:458:fb8:9dc3 with SMTP id d75a77b69052e-45b5def1dadmr61649591cf.25.1727333230912;
        Wed, 25 Sep 2024 23:47:10 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b5257ff1esm23024611cf.38.2024.09.25.23.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 23:47:10 -0700 (PDT)
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
Subject: [PATCH v5 03/13] mm: filemap: filemap_fault_recheck_pte_none() use pte_offset_map_ro_nolock()
Date: Thu, 26 Sep 2024 14:46:16 +0800
Message-Id: <9f7cbbaa772385ced1b8931b67a8b9d246c9b82d.1727332572.git.zhengqi.arch@bytedance.com>
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

In filemap_fault_recheck_pte_none(), we just do pte_none() check, so
convert it to using pte_offset_map_ro_nolock().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
---
 mm/filemap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 3e46ca45e13dc..6c6ff8722550f 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3271,8 +3271,8 @@ static vm_fault_t filemap_fault_recheck_pte_none(struct vm_fault *vmf)
 	if (!(vmf->flags & FAULT_FLAG_ORIG_PTE_VALID))
 		return 0;
 
-	ptep = pte_offset_map_nolock(vma->vm_mm, vmf->pmd, vmf->address,
-				     &vmf->ptl);
+	ptep = pte_offset_map_ro_nolock(vma->vm_mm, vmf->pmd, vmf->address,
+					&vmf->ptl);
 	if (unlikely(!ptep))
 		return VM_FAULT_NOPAGE;
 
-- 
2.20.1


