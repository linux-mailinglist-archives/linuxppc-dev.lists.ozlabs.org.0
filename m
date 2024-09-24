Return-Path: <linuxppc-dev+bounces-1541-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB08E983CB4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 08:10:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCTxk2GLGz2yF6;
	Tue, 24 Sep 2024 16:10:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727158250;
	cv=none; b=TZbYO7C2rWPekLVDqgsoDO5PkAUw2esO5a4m+sg3U7y5iFZrm6xWmj75icji3zzcEF8Bn2dVkJlKnjleJrCU4Pr5SVTIeu0ybHqr9qJnh3UJ3FndFQyYskjQmsr7/Tz2hViD6CWPT8xO5o4J9WJaEP+UVZHmJSVExZaE6lCyG0GMWtiG4Ju+A+XK3YdAEfGC1/46OXXTuwW6c0JzshJaM2/XRLhxE9GmBhf5wRqhE+Es17CcLWR+9HXe5GZIgL1QFi+McK2As8Qoe9JhRuIoT3uJp2dwKK8wZuQ9N/DJMRiWiIZle/WZKMyc7FA2alAywcFwEDu2jlwe0HGoZnmMCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727158250; c=relaxed/relaxed;
	bh=BmENsM1LVZMrc0W501TyzYIERT8c75Mhan1AJ9vs73Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R8Ti5B5b9/3Jfr/rgwq34Pqp4ipCe8qcb2RJk0OynEM0VS9TEueGvc/+Xl8YdIV6EdeSE5KbyBKWfZLGcQ8hlXRwr5oSbSp+RDuOoUV72nwox1VBWau208PEiFBZVUhJkTTa6Y4UdrtOHSOQRzgHj8iyjklLWlyz/H8WCupo1+qPprF6203qx3dKESrstDGAxu+bTeLXUwxcjQdNCUAlBUp69xO4z/1kckYCwXIQHmnxG5eaNrbvPXWbQh4o/oywuTga+xCCQK/acJdJUCUTJozQj8EWpkFRdG43f31BEfYF/CbjbszSGXqNfHcvfF3F/+yHyEMV5zwjsOAt9yrnrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=QgK+qKP6; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=QgK+qKP6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCTxj6x2Nz2yDY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 16:10:49 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-206e614953aso49436355ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 23:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727158247; x=1727763047; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmENsM1LVZMrc0W501TyzYIERT8c75Mhan1AJ9vs73Q=;
        b=QgK+qKP6Fg7/MXGar4jye1t+yw9K97i0Uldztrqz0SoXT0SxLkotLJRoPxUz8HNMM4
         PxaSEyDgIxcfGnxkGUXdo+LJxSJCPlcaYZTj0reYOZJI500r6e6vb2wSBSqfHpXsVYQA
         8t8GUJyeQqWktt2AfaW+5VqeNs220rp31EbKPFj450pECqybpYUlaFBDVBUdmRJDm5jw
         BNQJogXEe1/qlqGVL4/R/cmLfrCWeeU0J6Yai18WzepfKH9VwdekWvP5ChG75Ss+RJjd
         23tIST94fAXuAdFB7Yx1jcF401W4uVnYZQmRU/zzS1OMO7tO/ChbYkwuM9D7fS3ObGrX
         xCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727158247; x=1727763047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BmENsM1LVZMrc0W501TyzYIERT8c75Mhan1AJ9vs73Q=;
        b=fvSRgsXyIC588Yn6uojabQKctojEyQ/CPzZMLkzAZ0gGKsHsw7whqk1PGR5B8AzIQ7
         Si6zylUCGc5vi6D/hnS9Y9HaD/TMVtYbIs2MaT0/NyLbo1KN9pqFKvxnxRFk9fCzXRni
         Di6y96o45gy8aUhgbsIus3UUHoWm2Y4MizYETcPiCvXaDuU09f070knA/WbXVhUultOP
         uxCjicz5ZRNxPyB/sW6s8a1xNMOQiTm1IU9xmgnNLSHA86uo4q0OtE8AOmIfbS39NV+H
         aKNX/QWqReGfdEJ19DLTPo+GT80GIUiCTNZYqgsHu6DeHwJYvp3WaxjBpHGTFLTFuk03
         8HjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgjz1lAipHhsf+he/njGnSaeyGSpDjG3ggBHZPA97fUKmU8Gd6591rG+wBe15dOry2NQxM+6UHB+pE+PU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzpRH6fJiKkGDjlqacanuYlZS37BVL+72S+mY8pRZj3JtcHwnzS
	TbOO/COdcfV2Xm54yKrze/9iNa4LSNJrzrHw5c/0x2ja/ceLpJ6xJXz4pOkgC7k=
X-Google-Smtp-Source: AGHT+IGm87aqttqV2Aef0OLuq60VY3Mp4w41J7dgMXq2Y+1L52786e2U6HUOab2ZHlW+VZaRsZgruQ==
X-Received: by 2002:a17:903:22c5:b0:205:6f2d:adf7 with SMTP id d9443c01a7336-208d83a8387mr177369015ad.21.1727158246651;
        Mon, 23 Sep 2024 23:10:46 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af17229c9sm4344885ad.85.2024.09.23.23.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 23:10:46 -0700 (PDT)
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
Subject: [PATCH v4 03/13] mm: filemap: filemap_fault_recheck_pte_none() use pte_offset_map_ro_nolock()
Date: Tue, 24 Sep 2024 14:09:55 +0800
Message-Id: <d90ff787a51aae928324ef2df0a3012818e261fe.1727148662.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1727148662.git.zhengqi.arch@bytedance.com>
References: <cover.1727148662.git.zhengqi.arch@bytedance.com>
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


