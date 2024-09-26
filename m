Return-Path: <linuxppc-dev+bounces-1608-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E090E986CC4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 08:47:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDkfy5gw1z2xHW;
	Thu, 26 Sep 2024 16:47:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::e2c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727333242;
	cv=none; b=ngCMTT1HIH5yHMvfrWeGL/jarHA8XMA0b4N9AxIJQicZRAfFMIxLse21Hbvq6JkMH9+i/YuDquslW4yAzSaRoidRGTthpzeAInKT10YI5wybuDYWAq7oUivv9cjbWldLbcLP38nLgiJMvHmHKo07OzvU4R/0NWJhUceIeYv1ssGPsaMt9nBRMEZBtBGu4MQVTNOp4vMTnpLgu8PPZuVA2cgMRlMzgV75kDAfTJmcy2XXW2Thsc3OT5z89/sr5ahGIz+rYFDA0AFhqcXeoFGlQ4fvtmndgoEeVRSCUxj45G23vfhYJnTovAOH8rn41O9Kv606Culrfas5LEuaJcwh6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727333242; c=relaxed/relaxed;
	bh=C6e2rRMn75kFV6Fv258+yl1EB6KpOV48BOzHpMuHQ/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A6fJxMG00sJHdDi7Kot6CfZNy6YNLPd6qgskZVdQ1i8DE6/fZGt+FF5e810Adh3HGPxUVSdH+EhpNZs52/nCSBn75/LPnbyFSjBPXMC2lwJI+QkpUyxZw42IxZqDIuFRYaq82tP+KDWkWkL4WpB6ZnVDX7NB7SlMN7hfKIjsYThhicbPiEM4V2e6t574F4OZmEfmGDRjUBCNiA1xeQzEvqNeD+8O8rTuOiEVHQuHGLE13ElCpWrr2HpZLhwwmZnwYYAjcXYSn1eSeA+cEZGNIKxuO632jn0juToqm0UVlfV29zNr70cS8+7+CS5jZqF5BLxcA+gRdozrvZzn54AzkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=bn+JDORk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::e2c; helo=mail-vs1-xe2c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=bn+JDORk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::e2c; helo=mail-vs1-xe2c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDkfy2JkHz2xF0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 16:47:22 +1000 (AEST)
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-49bc7387371so271700137.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 23:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727333239; x=1727938039; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6e2rRMn75kFV6Fv258+yl1EB6KpOV48BOzHpMuHQ/Y=;
        b=bn+JDORkxpf+6Zt1oj/0cNwHsq826pqG1y+74PH3TVn76aM1fmZUGjbeJ2Zk7o/7W4
         bBrIbd5/kmI04hnUXlfJS+rOSTUnwTaoyTs+WFCHVJxM+UFo6sI+BbvC97xRwzCoApjd
         cFpVRX2G4kOU9UJbiwoaAfBSC27iHB/cwadlWuQ6qK5OOsAJoXXZ7iUYyJAtKGMbYg7g
         9DB2ndk08fMEgkdubmD1omm8yycIT9skQXHhRhamq+LQNfz2QchDdbHhcEocF1zExrsM
         g8duqSbThUPsY9UNxKV0kzzVg7rYBCowJx8WWUIEx/gxi4dZoAx0+0b3sGr4PJ0rwmEh
         Zk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333239; x=1727938039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6e2rRMn75kFV6Fv258+yl1EB6KpOV48BOzHpMuHQ/Y=;
        b=HevgL7CiRepraSEGOCGwB5Q/QP3/8F4o9hRnxu1RpzrNB2NBWEGetzU4MdueYGZqwe
         LXu0/6whBErY4elgTpTcv5wGKR6dK8i/6x80x1xGcKf1qzI6la57l3MVDQiEL4r2DlxO
         lhqwMxs0aEXlMVpIH84CnwnG4vALP/NubY6q0IRczJ7b7AMysBCud6mku4GurOPN2Vxe
         45Uumf65oaifMQpnoKITcEN+DuV5QHfR/r02zsiC+sdJaSnm4cHNWjMGEHDwkyCn14GT
         jWdaCrRS8+aE0e9LfxHLxPVbdYvb2sC7qfXrU7/6tHzYr+HO5qBvgmTEXU4HjYiJ2VVg
         xe3A==
X-Forwarded-Encrypted: i=1; AJvYcCXl/EfW8nACvraWqoxrPOKvG99xESXBGucOKOkBEx2MHHrkNxPsgu5kklNs4d/gxXqWMBVtzaUYUsXavKo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyjJqYWmqZXoE+C7H63jJJB2pl6ZAOKmzadi+G4WIiJKisvN4qr
	FsLvLNt//Io/vxuW0v5tFai6GAWqr2zZ3RXoREIv1wJn2CX+Kfn7Yn4oPav/yWQ=
X-Google-Smtp-Source: AGHT+IHnBlRBHwKCxjYpHBiGYKwBIoiWGnfAohABSGODP2aU4XU9V+T3qIbiD3kwEf9HDK6sMKBjlg==
X-Received: by 2002:a05:6102:6c3:b0:4a0:1cdb:3eb4 with SMTP id ada2fe7eead31-4a15dd1a11amr7011565137.20.1727333238630;
        Wed, 25 Sep 2024 23:47:18 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b5257ff1esm23024611cf.38.2024.09.25.23.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 23:47:18 -0700 (PDT)
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
Subject: [PATCH v5 04/13] mm: khugepaged: __collapse_huge_page_swapin() use pte_offset_map_ro_nolock()
Date: Thu, 26 Sep 2024 14:46:17 +0800
Message-Id: <dc97a6c3cb9ea80cab30c5626eeea79959d93258.1727332572.git.zhengqi.arch@bytedance.com>
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

In __collapse_huge_page_swapin(), we just use the ptl for pte_same() check
in do_swap_page(). In other places, we directly use pte_offset_map_lock(),
so convert it to using pte_offset_map_ro_nolock().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
---
 mm/khugepaged.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index f9c39898eaff6..6498721d4783a 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1011,7 +1011,11 @@ static int __collapse_huge_page_swapin(struct mm_struct *mm,
 		};
 
 		if (!pte++) {
-			pte = pte_offset_map_nolock(mm, pmd, address, &ptl);
+			/*
+			 * Here the ptl is only used to check pte_same() in
+			 * do_swap_page(), so readonly version is enough.
+			 */
+			pte = pte_offset_map_ro_nolock(mm, pmd, address, &ptl);
 			if (!pte) {
 				mmap_read_unlock(mm);
 				result = SCAN_PMD_NULL;
-- 
2.20.1


