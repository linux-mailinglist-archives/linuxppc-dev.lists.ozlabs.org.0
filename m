Return-Path: <linuxppc-dev+bounces-310-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0472295AE91
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:14:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqDw7004pz2yK9;
	Thu, 22 Aug 2024 17:14:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::431"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Jh46hr6X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqDw64mJqz2ygy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:14:14 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7142a93ea9cso394260b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 00:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724310851; x=1724915651; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnbwyZ8nm7OA7xAj7wrWrabgK1t5zgYyH3DelQTt/t4=;
        b=Jh46hr6Xw1i3jrNTYvvpAYRvQTeq4fDqTOX6C8hjg9bWXrwSEDmEXEPN+Oz4W/iWJv
         JpC7AQGB4rlLQxKO1HfnvJ9QtYFPH4yvYez1q5scNK0dMlwnvARovb+fpGuh8ErXYz2W
         3gOGBF2exieTsSVkgH3bRlljsnBTeNW2wxd7dF8GvVMtU7JzqCm9HdEYq7tD5kzftKBF
         jxUCAyeiF/qKuHePIxKO3Wg03wCOmvMSj6YoJBl3XK7uaW1G9GUpaY/We5quXAPJrems
         g+g9APXnQxtGD3ebcZIKve4HM9E6A9MGzjd4psWSMRKDsyDJ3OtuMnnuCs6UOJROmWB1
         l3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724310851; x=1724915651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jnbwyZ8nm7OA7xAj7wrWrabgK1t5zgYyH3DelQTt/t4=;
        b=mpANmvgDVOs6WaaOGshTjxJPEupbqcjMGN441F7vHHSuPXa8OF7lPkZL6CNITjzInW
         DpWnPTVwN5HZdMyHX3dIwBVhLr1ZEw5Zr7ARKHUkBOu0ZqSZM8s3jka9wDqoYtFrRtYD
         Pl5yiaU2QC1m/Xe4PDVbe1aSxbKVYTjmy2dK+xWKhTizyIFPh4ksKLYnXeYX3FAmSv67
         3dCmiFI+DU4PleuSLJf7OIGnIdP3WXnnTMCJZchgU5XReDvwI02z7tpUegqQGZEL+h1l
         YKU7iUSBRt+ndZOdgsE/bbHqE1HHHZpQMOaCKhHr3nYO+1U/c11fnNHB2n8vL5gzjGkj
         HveA==
X-Forwarded-Encrypted: i=1; AJvYcCWRFI2t0syca0ATkJqqMVlSfmQ9IgIThtv/AtCIL2iDBYfwWn8tBCxCh7Caiz+qzcwIKYX00waj2YmerxM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxw4w9pd60GBBAckGmmLpw+uHH/br+mLDAWMW1dKm98yr1VrLe4
	H5fq7u4bdJooCpvX/IDWVm3gHhTm7uy6QXRm2qFmP4rsNKQ3mgsVPhKuxRthqSY=
X-Google-Smtp-Source: AGHT+IGXmNRuv+mQEijx6lEwkmYjHk6XirTogWRG+N5Gk1h3xzTz9eMzqUkZv9fzF0cNQyeHFRUhTA==
X-Received: by 2002:a05:6a00:c93:b0:70d:3777:da8b with SMTP id d2e1a72fcca58-714235a5404mr6267050b3a.25.1724310851578;
        Thu, 22 Aug 2024 00:14:11 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([240e:473:c90:f96:d029:ea8a:4e6d:d272])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ac994a3sm695095a12.16.2024.08.22.00.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 00:14:10 -0700 (PDT)
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
Subject: [PATCH v2 04/14] mm: filemap: filemap_fault_recheck_pte_none() use pte_offset_map_ro_nolock()
Date: Thu, 22 Aug 2024 15:13:19 +0800
Message-Id: <d5d4744c87c759a53b5e115a0d59326232696f61.1724310149.git.zhengqi.arch@bytedance.com>
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

In filemap_fault_recheck_pte_none(), we just do pte_none() check, so
convert it to using pte_offset_map_ro_nolock().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/filemap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 0f13126b43b08..c98da9af6b9bd 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3234,8 +3234,8 @@ static vm_fault_t filemap_fault_recheck_pte_none(struct vm_fault *vmf)
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


