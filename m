Return-Path: <linuxppc-dev+bounces-272-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C62F79597E2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 12:42:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpjZj5Jybz2yPR;
	Wed, 21 Aug 2024 20:42:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=e1M645wF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpfR25q40z2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 18:20:30 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2020b730049so38806825ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 01:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724228428; x=1724833228; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wf5h3KMWWmEe6/3TeJpf55VgCdFHsYKNAkaT296AWg=;
        b=e1M645wFqiketQzZaIP7J0Myg5atP2kSDGwZgF3zMP3yk7xwefNw9LwipWY14q8rql
         h8mHKEhysol9ZL/yNmgyV2/bPIqomP2KtQvkj3ZrzObJPuqhAyhQvgY7CyhofhSRAjbM
         aSZA0R8XK0ZqqZvH8jxAhv16qMzV7kc6zHRrlEQXB8CsjDQXSIJ5Ij2K5hyekC6UHo6l
         6Nkl8WYfqr/CcwWQ29jpIo+ynb2PdMAZ4xTt8MgLTolPXh8HslYQRCF8IqHjsSf58cNW
         AIssKkgfLvo1DKU/u3D8Zh08H2c/Hep18BzmwuMkuGIWbM/jY/gf4uzNUvEH3pGMa+gX
         yrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724228428; x=1724833228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wf5h3KMWWmEe6/3TeJpf55VgCdFHsYKNAkaT296AWg=;
        b=wfeCzlSIEjjh+yQw/WXW4jTBGiPqXOhvjASL/xo0geRHfWfxaJZWgNvf1u3+pIvcBB
         w07Sf03rm/vcLmTQIjrgRkauv20z6WWJpqN+doI/VrqIu+o7+bBL+QI649r9TwlJzxc2
         z6Ev5LPgz0DTf3RY3sHIrqIrcaKHEEblhqE5vYz3w3nxmfvEOvgNiDv47QyiwCqEW+qg
         L9DBMcP3febcWP3PMr/F+7orZLmcDRnHYp7CCmsHSKaL0wB2A1o/ljpvtQrebfufyHOv
         JYFYZOBKhEQM6h6jkNdScJ/QN+rtJI7/IqoJ+PFuKTK0UPJ2p9uTDlLU4Pr8R+hToiFm
         PN/w==
X-Forwarded-Encrypted: i=1; AJvYcCUDDHWsFCy0S6uVqDzXcXtpFL0tSPhZdOz8o5QsWJ9sn5kNauZJgo7xegCa70YCMpilxANib0ljz/5H/I0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz5O6GAnbK7mvk22U1Ubjoa9uvdf2/wkIYL1rYS4QDOwmI9ve6Y
	SBG3gxYKY9BfOUqRUVptyjcSeeOFpX/EE0Zw/YogBWEydkPNQvMuLZU5Wb/3VOI=
X-Google-Smtp-Source: AGHT+IGct1lfg7s+Av92JTuFI7wGr/k4q1ybIYiVEVcgmdImld0nRYlRbV5Vh9eNiEYSyV0nSbS/hA==
X-Received: by 2002:a17:90a:7893:b0:2c9:635b:7271 with SMTP id 98e67ed59e1d1-2d5e9a24ea2mr1616047a91.21.1724228428100;
        Wed, 21 Aug 2024 01:20:28 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb9049b0sm1091453a91.17.2024.08.21.01.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:20:27 -0700 (PDT)
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
	ryan.roberts@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH 09/14] mm: mremap: move_ptes() use pte_offset_map_maywrite_nolock()
Date: Wed, 21 Aug 2024 16:18:52 +0800
Message-Id: <89bd1d48db1986ec83dcae228defa748f38238ff.1724226076.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1724226076.git.zhengqi.arch@bytedance.com>
References: <cover.1724226076.git.zhengqi.arch@bytedance.com>
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
convert it to using pte_offset_map_maywrite_nolock(). But since we already
hold the exclusive mmap_lock, there is no need to get pmdval to do
pmd_same() check, just pass NULL to pmdvalp parameter.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/mremap.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/mremap.c b/mm/mremap.c
index e7ae140fc6409..33a0ccf79c32d 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -175,7 +175,12 @@ static int move_ptes(struct vm_area_struct *vma, pmd_t *old_pmd,
 		err = -EAGAIN;
 		goto out;
 	}
-	new_pte = pte_offset_map_nolock(mm, new_pmd, new_addr, &new_ptl);
+	/*
+	 * Use the maywrite version to indicate that new_pte will be modified,
+	 * but since we hold the exclusive mmap_lock, there is no need to
+	 * recheck pmd_same() after acquiring the new_ptl.
+	 */
+	new_pte = pte_offset_map_maywrite_nolock(mm, new_pmd, new_addr, NULL, &new_ptl);
 	if (!new_pte) {
 		pte_unmap_unlock(old_pte, old_ptl);
 		err = -EAGAIN;
-- 
2.20.1


