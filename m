Return-Path: <linuxppc-dev+bounces-1540-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E51983CB2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 08:10:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCTxb2Lwcz2xHr;
	Tue, 24 Sep 2024 16:10:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727158243;
	cv=none; b=V7UQV5y5QqcMq2JRN+L1i+KDJtb+wjcX72lhhLv829CIjFO62UACQoFmBGWch+en12Cy623vuB67SbRPsxe8HrL1xa39BYxnMBtbVOwu8p57ZVxOYY3DS2jsi8129wtq77w67sLnhn2iNvZOGLaMfPg3o0eIUQkvqonH42cJ9vtJUoLoWaR7rkmPT9NtLAhoY3YKunicm7R7aT8sgMbgPLKjbKerwx5m4sDphKzXsLknUKaNW2t1cKBk5lVlGbOVWaSAW+qrCjRWDrU4vl2Yr7qBxuo3KtL6AhsaAU46uWJnxQQvbCQTyY1F1LOQgbiZ/d5gcgFzwQwLqPlgXK9hJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727158243; c=relaxed/relaxed;
	bh=7WBwKEY9MWquOlo01BPdpzLz4TZdRIsQgPATlcDwMyk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UyXu40RIIchObBsgwI0KlYqUyXT+f5wh0s94a9iaqAVGOhpqcdHGiL/Amj3lWFDJRK/G21wfArwETYxoCvAfkttdswFpH4b7cuqTcaFWXTaBfyQbL89Ix/3FmuUgJolwElP/XlNgvMAUXiP78UGxT+I7PhilH/EkC3WToRVQQBNBDMuSwwwnCLo3jBWiNxaXRu9JdlV+SmKuhkgUsMWrl2dlAFXUMAHv9nFRSThUyislsKHEiQvRs2Ttrrc3x/jDzHrsIE+1qN60NxyeSHrO7voQv63/I+qFbYYFXN0xtS3HZ8LXI8ZSODb2bzv1dbr43Xk9ZJheckgwwWpgKaOfMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HUj4kdfJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HUj4kdfJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCTxb04GXz2yDY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 16:10:42 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2068acc8a4fso47159375ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 23:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727158240; x=1727763040; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WBwKEY9MWquOlo01BPdpzLz4TZdRIsQgPATlcDwMyk=;
        b=HUj4kdfJXSzxjeoN9dUT88i0H1T0pzAh9hGSE77z1qHsp9ADNK7+ApaWex4PbHQd2s
         MzgPsmvFdJzZKxCmWNNkNIupatif2VSROjPEUoGzGlPp2Yl4lQxunry/JbGSBG23PJEc
         pGaO0mdWWZVLuONAY0YNzoqmxz5UzDujG+1O1ZzMXm2aGZh3ggqvD6hnfgLgXKi9li2G
         q+DH2WPvY9NCxuPz3JORQ3uNDPDBZZlonfSP/ZYGs0YgX2g/DHp0xfQHxZbuCtx75UBI
         gUyIgEpfVmQvatiaOAdTFjIoystyaYWDHMfJHZ6SESCcDcLrp6opoa4bn7PtM9OnrJrt
         d4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727158240; x=1727763040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7WBwKEY9MWquOlo01BPdpzLz4TZdRIsQgPATlcDwMyk=;
        b=DZ3BnBgqk0PTIwirkZi5QVKvzTxt+J08o+wUFUhATjXDa4fBV83MZxRIwFlrbYouBX
         dwZWzZY7eOrcBI9nwzs86Lx5E6wL/jEeY72FGdkdM/ydF++9qMPCFusvp0Su7VbRzXT3
         vLB4eo+m2V+l+KEuFodJvm5BW2JGpiSgE9MDrNBr8kGvuSIhHhwV20UOWAr0ouLBmpk1
         Nw9GdpLfzf1ze0i3nltV16prMf8S7pZAR3awKydu2RgsFL4vl/+Ia5qP0cwnrgaSMnAS
         R7EiD4fkiKmy9G23alkdYSNgdre/sRybyJ5wYGhKE4AzLKDCg2cd4gxmAa8PB9wFvXYR
         NtUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe57tyGm1FEC/2cY4XirK2dCJVlyNgBQNC5/PvvAVtfRCJJDymwSCymioTg5WoyF5pL22CIhCyJL/GRTQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxAMWdTdUFSLDixILExQ/hI0XNIhr9hjdrh5zIXU8WiImpynKYE
	d+03FG0Lb0SV6zVeOuQG51dZIIs3M9cCEB2kQYvESh2Z3eRFtXFim8RYufECb7M=
X-Google-Smtp-Source: AGHT+IElcy6/dcdtPcpdDMoiIIDu5/E2AQfQDwpdj/dfRLSSVL2tlA+KvKWV7BmaFFYnOD/6ZCb7Sg==
X-Received: by 2002:a17:903:2311:b0:206:a935:2f8 with SMTP id d9443c01a7336-208d832a910mr203885105ad.2.1727158240521;
        Mon, 23 Sep 2024 23:10:40 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af17229c9sm4344885ad.85.2024.09.23.23.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 23:10:40 -0700 (PDT)
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
Subject: [PATCH v4 02/13] powerpc: assert_pte_locked() use pte_offset_map_ro_nolock()
Date: Tue, 24 Sep 2024 14:09:54 +0800
Message-Id: <597a93841525dbd58fbebcfdc547f2080694835b.1727148662.git.zhengqi.arch@bytedance.com>
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

In assert_pte_locked(), we just get the ptl and assert if it was already
held, so convert it to using pte_offset_map_ro_nolock().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
---
 arch/powerpc/mm/pgtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 7316396e452d8..61df5aed79894 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -398,7 +398,7 @@ void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
 	 */
 	if (pmd_none(*pmd))
 		return;
-	pte = pte_offset_map_nolock(mm, pmd, addr, &ptl);
+	pte = pte_offset_map_ro_nolock(mm, pmd, addr, &ptl);
 	BUG_ON(!pte);
 	assert_spin_locked(ptl);
 	pte_unmap(pte);
-- 
2.20.1


