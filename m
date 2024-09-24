Return-Path: <linuxppc-dev+bounces-1546-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A20983CBD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 08:11:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCTyJ3J4hz2xfR;
	Tue, 24 Sep 2024 16:11:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727158280;
	cv=none; b=hCCXDYE2t7NwoyeU/PMxSHqip1EG8AHUSlINmiNbja1dzJboHwEH+uLslUpjqcEK5PQAtDw/qMMjExx2138O7npzqEzhogAAjiRAUrl5zkkownCaTkFZGCHzJdS4bwk7/Hep9UEx70KRNy4L0TVuU1mjWM6z7osWABY5xOTXOLFhSspYUhSuR9vHE5mqRMiSl7hsJVUg6vvfm9s5h6Ue6w1xHBxbadmmb9SIxNcZR1wydckcZtnPr2dpo68fGuXUotBrfbWdwQs/LvAx0Zw1nRSsCH0swRanoktBmFt+CNOn7UMw6EiFOTNEwWNAnsPuq7DJGLa/IQRqcU+w2Nnszw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727158280; c=relaxed/relaxed;
	bh=a5exoCzehntR4bd+ahks+h4WFwEAjFaMLu5nKDHss+4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W63W8O2hQp2rlsUlhLSbDx6bKp2gDpWqH5BvZuhmhZJqCZRjhLwIn4P+g+akfr/Vt4t5S+lg9Sbvi+SPVAtV8ITIOgmGwdhnb3qAk7kektrUwVvO+RBxbC7sGlIccHKX1a1VWbK3ECKE6caaVloHgs1b0i1bElQ6vGr07NSCeHt6mHEEAKMVq1uVUK8qBRdJThyYNRPdnDl/H6JCNeL1aou/miI2+HlHl0iB3ttEUmeLS0F0U0ZeFA0oGJ6W5VakFZigHKh2s8zuqQW/n1lSe210ZnMneQ0HsHjbgfeczCH9KiqTQx3ODBz8IIuQb7YwrFzTz5AU7MGbtgAy+hfJlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=f2fMbpsV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=f2fMbpsV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCTyJ0y9Yz2xMQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 16:11:20 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-208e0a021cfso25485835ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 23:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727158278; x=1727763078; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5exoCzehntR4bd+ahks+h4WFwEAjFaMLu5nKDHss+4=;
        b=f2fMbpsVKLLbVWcMBM6hTZ1AzvGQaRne0CDdd4QOQlHiBd/wESq7x3ObhbXmgVbICv
         YeIKRwmI9zuVnPuLkqL2ze3C00ymuGvfEwsR6MyNMdjQlMuDFAvD0bq7YrVIpkWgYC/z
         K9N0fRmXu8PYt7Ni4inusRUeugY9ka1KZb7kRmFdv7vSyVjIT2ourrRwr8Sa4hxdcIAp
         mc+ncVAdhrK4ldF+i8ZilU6mrCBZ8Muf4mZOoQ7+fVOeaO2r2smxuDpRZhVnGfbeFRJB
         9NZMI3c4Cq4eUt3Q92sLyeTKWsZHMPiJEvnIbaZmLqLoga4sPbVCxNie+k5SXyoaxePa
         zrhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727158278; x=1727763078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5exoCzehntR4bd+ahks+h4WFwEAjFaMLu5nKDHss+4=;
        b=wCIsFOPUQ9Hq0stQV/CS5jlqjXNWRcHAZZ1uf0IzLcaCMCQySxLhlMf/0QvqC1c9FX
         44nkTUktjwLRavvjEsckwm6zTYZ4uvdw/32KCZPA817F6CGwJCBECUIlXe77LBZAjMtL
         YyXEcMNgGlBbbxYFXPPuIQNOsgYwdK4Ptc865Krgf22xXmZ5bCQWcY4PWdZpm5OG4J2J
         Vj7jsfvr1fYGvpencX85f6mXOldaBXvlk4zBIoHC+hjW4NyfzKXVvv57czPXfvaC8nr4
         h9eBlo7aXY/mtQTCWuyfushqGxmsXNFKVnsPN5pP5LzbJIRuYVMnXWMWvqCuKRVDKoVB
         y9Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUukIFMWPA1z97M/JP9P/ejwFIMpvWj0oFtH5ZEmT50gbW6sNJej3ELXFH7ph/PojMr271ZI79GSGrI2KU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywthdxwexncdf6L7pPQjoKv2DjiIErO8ZiazZgMQPMwVKsZ/t49
	R5ratHLA3ohXBvWHDBJiPlOFhzvbMcLTthBo56FoL/XdBQw7A1oVwZqoWedahRY=
X-Google-Smtp-Source: AGHT+IHw+OqtuQ5LCBY4YmqC9EJn7stUTlaTSc5oItaKMOqNO6mqJktvnwlzFLYt5xYGl9LymCl5gw==
X-Received: by 2002:a17:902:d50f:b0:207:1709:380 with SMTP id d9443c01a7336-208d838ede3mr189786005ad.27.1727158278506;
        Mon, 23 Sep 2024 23:11:18 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af17229c9sm4344885ad.85.2024.09.23.23.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 23:11:17 -0700 (PDT)
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
Subject: [PATCH v4 08/13] mm: copy_pte_range() use pte_offset_map_rw_nolock()
Date: Tue, 24 Sep 2024 14:10:00 +0800
Message-Id: <b70b7cb91e000d540773a0e892789da64ab6c108.1727148662.git.zhengqi.arch@bytedance.com>
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

In copy_pte_range(), we may modify the src_pte entry after holding the
src_ptl, so convert it to using pte_offset_map_rw_nolock(). Since we
already hold the exclusive mmap_lock, and the copy_pte_range() and
retract_page_tables() are using vma->anon_vma to be exclusive, so the PTE
page is stable, there is no need to get pmdval and do pmd_same() check.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/memory.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index 6432b636d1ba7..c19cf14e1c565 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1086,6 +1086,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	struct mm_struct *src_mm = src_vma->vm_mm;
 	pte_t *orig_src_pte, *orig_dst_pte;
 	pte_t *src_pte, *dst_pte;
+	pmd_t dummy_pmdval;
 	pte_t ptent;
 	spinlock_t *src_ptl, *dst_ptl;
 	int progress, max_nr, ret = 0;
@@ -1111,7 +1112,15 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 		ret = -ENOMEM;
 		goto out;
 	}
-	src_pte = pte_offset_map_nolock(src_mm, src_pmd, addr, &src_ptl);
+
+	/*
+	 * We already hold the exclusive mmap_lock, the copy_pte_range() and
+	 * retract_page_tables() are using vma->anon_vma to be exclusive, so
+	 * the PTE page is stable, and there is no need to get pmdval and do
+	 * pmd_same() check.
+	 */
+	src_pte = pte_offset_map_rw_nolock(src_mm, src_pmd, addr, &dummy_pmdval,
+					   &src_ptl);
 	if (!src_pte) {
 		pte_unmap_unlock(dst_pte, dst_ptl);
 		/* ret == 0 */
-- 
2.20.1


