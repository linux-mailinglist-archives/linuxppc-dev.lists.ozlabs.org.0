Return-Path: <linuxppc-dev+bounces-958-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C2D96B515
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 10:41:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzGDS1PjZz2yRD;
	Wed,  4 Sep 2024 18:41:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725439272;
	cv=none; b=c8e6zL1NzoiRAsWgh2t3bc74xL4XGGdYu+GD1RoEjCndIFVA+WFxYlzFuI3RBRaIPVaix47ROsmau5lhGsdpAKZk6IHhDfHUVK1eO0rYZcLzgr2PNy+9de8yY2F2iVYgHoMGzROr/o8LwUdiRZ28lkqzbqHAEbaw/ptTYCKntZuCHjocNazNVdPmmDvdMgZDBknzIF7tNRa/Gv05mQbe7GkF5bL/NJ3pq4qvtJkEEhY7gMiRmkFEJpH+eISu69gPC0d/70z/YtCNrN7gRb/yFM0oiike7mNble8tTnifEZAiNOtpHHX3S64X+KZdFS7m91t6TtCjl8K/emuSG0a+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725439272; c=relaxed/relaxed;
	bh=Mwcb7WVpeL59BmxGU8FtBVb/FvaDY4mjrVacU9l97yw=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version; b=cBpH8A+E4C1UYyDGTFA6oaxhEt/vwcEtzcqKNonVqzumxbO32ZQsMzBN0zOUyxcVglnVudiQF5fKKr8RC19ThiUwl95WSaBmuJWUqoeomZAz+9r38zD0dMgnQf37JzItKijDqHGRYhWCS7tf7F3iTgwxiOR4wbTUh69ZPRH64xN1Bd2rO5zVao851dH6V8pqkxqTh7n/dgmA1oxiOxbK+rOm0qymJzVkdzzy75ah+G3yARyXl8nA95yhBuLDQLilPjfnV7aL6TXuUedtfER6Tj+nBJyYLKAlwDeHiI12oQp2EentWcrDxJOGum+MYjhpuAyoKqys+yBHdlG73x0ppg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=dpqv6db6; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=dpqv6db6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzGDR73NQz2yDx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 18:41:11 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-206b9455460so3336465ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 01:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1725439269; x=1726044069; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mwcb7WVpeL59BmxGU8FtBVb/FvaDY4mjrVacU9l97yw=;
        b=dpqv6db6gtl8aYHNYRRYNml2d9iqTUZP/eJMcY4FBDLBN+qGrTNStfYPnbdxRUdcTb
         7qTTS5N5XXSnLhm9XzXyBQBBxoRSBVttwRhzq8g9Z1ruFCk5IwpYl5JQMcFBa2PD0Tcv
         jHI6AVXM72krHX98tLvMWOodwMWQDcPGgzF8T/ZGqCEopnHfydSPOgoDP6evyr2n6ioU
         D+P0k89+NA4iI36dH37a+VqP+uj14PLPYm2/d0Dp3/SCAE/HZluKXVnOF7KKvzSt8cEm
         ouM6Wg3oo5H+09zR0i3vet5t8LrdDQaolMQjnCyIfg9Hgaat6hXVpkYvknMCr0dHVUcV
         yqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725439269; x=1726044069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mwcb7WVpeL59BmxGU8FtBVb/FvaDY4mjrVacU9l97yw=;
        b=lgKsWAENNfnDlIijRthnATA2S3Xz0ge14DP7E9/SLMIkwJfSHpw8n7o/nhEcq8bp6a
         fasHNCUA8EovPuFFj+6R1RTjcGA0d8/v3E1YoPIyPnbibP6f5RCEwMeNMBK0qsCOfmTl
         FAq1W8cLyAVWeNef7S3hYEww5Vo/u+pApgu/4THZV0hea/YmTKTUGVbmwIxXHsizJZQa
         1DpGl3p6xFkxlSS7XhUti53hZPX86W5as057ESMrXJQDF0YXFz/yXzoWNbI4erR7bvkP
         I0VWJQthW++iXkqiqmSyjEUdqFMA3g2qvaoi7hRgWS2rnQQiSTX/OANyMWqTBei6MTxl
         uJCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSNPndotYimf1p0RArgn/s1Tvgk8g9XcLNvYq5nbm6W+ORKew0pp5QF6/YX0rKUJIJb8nMBG37WCjEOF4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyScVVrXAkEkI4fjrkHTN3SJV/TLmYVbI9bIQ4wSH1ITCJRkCp6
	keKAbBV0AZ3xvhVPODzfcespeM/UmK6gBxW/ORxx5iUnz0Bmpt2z8/PRChCPIHI=
X-Google-Smtp-Source: AGHT+IHVi0h+YpQWstt2F+C2N++FuREpmzHqlVlqHX+adh/zaJT2MbahvdDpXAnk4gZu2G3FJSfhgA==
X-Received: by 2002:a17:902:f60b:b0:206:9dfb:3e9e with SMTP id d9443c01a7336-206b832146bmr25150715ad.10.1725439269514;
        Wed, 04 Sep 2024 01:41:09 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae95a51csm9414045ad.117.2024.09.04.01.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 01:41:09 -0700 (PDT)
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
Subject: [PATCH v3 04/14] mm: filemap: filemap_fault_recheck_pte_none() use pte_offset_map_ro_nolock()
Date: Wed,  4 Sep 2024 16:40:12 +0800
Message-Id: <20240904084022.32728-5-zhengqi.arch@bytedance.com>
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

In filemap_fault_recheck_pte_none(), we just do pte_none() check, so
convert it to using pte_offset_map_ro_nolock().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
---
 mm/filemap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 20346df53df3b..216405ba497ea 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3251,8 +3251,8 @@ static vm_fault_t filemap_fault_recheck_pte_none(struct vm_fault *vmf)
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


