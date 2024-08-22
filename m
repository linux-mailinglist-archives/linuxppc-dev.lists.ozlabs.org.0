Return-Path: <linuxppc-dev+bounces-313-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BE895AE98
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:15:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqDwL55ctz2yjV;
	Thu, 22 Aug 2024 17:14:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=OciNZDeO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqDwL1XCYz2yLT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:14:26 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71430e7eaf8so391984b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 00:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724310863; x=1724915663; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTJMrM+GLhYLeZwUuiK6dImcBAbTGjqYt196yQPATUA=;
        b=OciNZDeORUbI63yazH0oDkuhSMpppsE20FtTPXLv4w/liCgRyP1LfAGtiZRfJM77rA
         S4pZ6n0WBycwWw1EJKiPfgK4DTxbwNk7EEZ2mYgqMqFVV0+JBW//52Q2K/MKhYcJNjyw
         rVeStUvE6knAeP6ZVTwDknL8iIa/YTpbb0KZ/GTM00QYf9bPxZJ6fWSSlDofU2iogPOr
         Be1gWKWnjEJvysQL1qgD2L3PDbl/kpdLR27BDRrX0Ldm3JG5SWHTMATSTx6Bl/dENZXb
         PZIGgZW+8URMzNEtlUxOWxVryrSlXJUK05nB6h2PonwW5ke0EMXuU7R1VLKWHch0jmq+
         JclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724310863; x=1724915663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTJMrM+GLhYLeZwUuiK6dImcBAbTGjqYt196yQPATUA=;
        b=ppRfz6rMVwdgeqOgo0yOP+2Xi2tU2rcxZNMvI4ZHhB1H00SvXvQBOKOWO3956YuFkh
         n4M2Kw6sAP7wdPFDHXbfWRW2hEBqmsPkzOFspAMmGisnMGbhHBR4QfLvDoipRQc8gS1p
         oKhgLhaatpMX82NPiGxn+Bl73NqKcBEMno8r/+q457ypmgrDdf8phcIZUrjRckz+XThN
         eJMLM6ISLlTz48NB1QmesDwqj/HTl5+9wmcW6A8z5lf/weXq97e4YE6HkDyQblZIZD9q
         ujshILdaYVZASGSEsKVcsfCLwDdl7uU2CYc1zVobQ0pM5hy7PS0XUtUJnmm7a37qVEzg
         PoPw==
X-Forwarded-Encrypted: i=1; AJvYcCVBdIPR0nJcQ2Xj8A0SUOZ4ZUZ0JW4VtUn4psjOTieUGZCwxtZNgRiYwmbmctG9xi4h7wRT+5XE83tWNWQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwVVuBXfiNYwc0OpGsWARiTlw1XoQC2vk789qLyI1JYmuklvzrL
	EgLiFVahAUAjuWUVK4XYWHfbdSHtysGLdJI0DdkKcTwqIxmcV+pYQqG7RY79zkM=
X-Google-Smtp-Source: AGHT+IEJaUpX6CQIEutPHebqIOZXfyMaKxdLW1UElMR3gb10gY3PgzFG7UEaK+UwdtskMN8KUpfIGw==
X-Received: by 2002:a05:6a00:cd4:b0:714:1bce:913a with SMTP id d2e1a72fcca58-7142356e960mr5852557b3a.21.1724310862916;
        Thu, 22 Aug 2024 00:14:22 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([240e:473:c90:f96:d029:ea8a:4e6d:d272])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ac994a3sm695095a12.16.2024.08.22.00.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 00:14:22 -0700 (PDT)
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
Subject: [PATCH v2 06/14] mm: handle_pte_fault() use pte_offset_map_rw_nolock()
Date: Thu, 22 Aug 2024 15:13:21 +0800
Message-Id: <5acabedfae7ded01b075960b4a91f2e15b4d76b5.1724310149.git.zhengqi.arch@bytedance.com>
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

In handle_pte_fault(), we may modify the vmf->pte after acquiring the
vmf->ptl, so convert it to using pte_offset_map_rw_nolock(). But since we
will do the pte_same() check, so there is no need to get pmdval to do
pmd_same() check, just pass a dummy variable to it.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/memory.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 93c0c25433d02..7b6071a0e21e2 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5499,14 +5499,22 @@ static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
 		vmf->pte = NULL;
 		vmf->flags &= ~FAULT_FLAG_ORIG_PTE_VALID;
 	} else {
+		pmd_t dummy_pmdval;
+
 		/*
 		 * A regular pmd is established and it can't morph into a huge
 		 * pmd by anon khugepaged, since that takes mmap_lock in write
 		 * mode; but shmem or file collapse to THP could still morph
 		 * it into a huge pmd: just retry later if so.
+		 *
+		 * Use the maywrite version to indicate that vmf->pte will be
+		 * modified, but since we will use pte_same() to detect the
+		 * change of the pte entry, there is no need to get pmdval, so
+		 * just pass a dummy variable to it.
 		 */
-		vmf->pte = pte_offset_map_nolock(vmf->vma->vm_mm, vmf->pmd,
-						 vmf->address, &vmf->ptl);
+		vmf->pte = pte_offset_map_rw_nolock(vmf->vma->vm_mm, vmf->pmd,
+						    vmf->address, &dummy_pmdval,
+						    &vmf->ptl);
 		if (unlikely(!vmf->pte))
 			return 0;
 		vmf->orig_pte = ptep_get_lockless(vmf->pte);
-- 
2.20.1


