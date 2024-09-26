Return-Path: <linuxppc-dev+bounces-1606-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB19986CC1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 08:47:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDkff6h5Kz2yVb;
	Thu, 26 Sep 2024 16:47:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::836"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727333226;
	cv=none; b=fsqjbsTBU588/3lTyO0tu88xAJgwfsgiPcGUYXht+yWEXoQJ3/dAbySuxDV6IsM2jK+3EPmsUYqBn4wi1hDDkplOqqBM6Jtf22rkkwQbskhMKUNdZ91laRpp3wvFkT3xGP30XxQdNXYabMw76LWK72EL/iMKOEhsM5LY2jO+J9jwZntVzrUhHAkivrXdf+mM65kxUdhXAIFSL5yfuc9faPNS6JUABbgv4dK+ZLj/NGjjUMYPnY2B3IhdUMZcDA/fAKCAKtSsQriAwItIOgdSb2fSs7sL7yfzmNuuv8LFYb6b/DdtLKYos4MF8GthhCRVr7Z6Zh7pE1rEGJGHJsL6IA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727333226; c=relaxed/relaxed;
	bh=7WBwKEY9MWquOlo01BPdpzLz4TZdRIsQgPATlcDwMyk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YP7FbR0ACqWCDz7MQ3VWA1ZyOxBmBjJN05uyLPtsJnwADP9g6xPqf9aXDXG8uIpYMTqhsQAE0Ee+pj3UCdZpHhP5ipXqATnbY99XQj0zSGtrFO5Spaj0I9tb507oVjD0T7eyCZUY5C8JZf0wTU8TAbxqff0bDQUSt0CiWLSYFY9/mvOa7b5vLabnbtBBDIy7QAaD04BQW7aaHeWomcfZa33Eig7wrEM/IJGLak1SlwUVGyBJcCxvpL6sNGF13I4EmthAO7R+ZHwzeAWlTUTLFi7KTB870DTyOwgl+QY1jhlJq35wrzNO9feKLqAWdiOAQRCb0EkCQAusiPy7+IEunA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=e4BGEqGB; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=e4BGEqGB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDkff3bnKz2yGL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 16:47:06 +1000 (AEST)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4583068795eso4781491cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 23:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727333223; x=1727938023; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WBwKEY9MWquOlo01BPdpzLz4TZdRIsQgPATlcDwMyk=;
        b=e4BGEqGBD9qmba2OgcAyhE5xxM/ZHF7ZRpBNi0WM2kXiaGMkhbKPTdbT1TAIXgMkVD
         g1O2nvprAli1CPB+fTXADySdNAgLsF61KXobqH/RuayQBfjz3wezbFtRMMHi1qbyi6ox
         7TB86fCDa7+0wOwv5T5bGOYrfq00785yxjh2Qmgq7veHdE6ZXg7N6P06hNzIHmgd8A6k
         bPXRQwJ+93Ky0fguy6mrBf1rJ4v/VAD7X+qrzJwBn4ihwz7/B/zDlcpnR/S3687Syg4n
         IKgehF9v1xYK+zRevUwfF1am9o+Z6uzXkGkufZeuirYItp62G2hg4/iGAwJxL3Fdna6R
         WJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333223; x=1727938023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7WBwKEY9MWquOlo01BPdpzLz4TZdRIsQgPATlcDwMyk=;
        b=X00mESReNV4JODlZ281hb9+FX152fOv4qknd4lcY2VN0QsqNAC/Fb8Yd3f+0kw1pyU
         cVq/lqzlOt714tlVJDEQHYHMtWNpPgU2EuIf09d6+eVobVtHDulLqnII2nwiPajUf5Vh
         4WNNKTY2FP8gWV/YhxeLp0lyeOYzdUhOpUXepTvtZyCNfaIcUjs2oW4hE1uc2Hzew82/
         /2qszMVNFzJhrrDAytWgqdGcgU+B6CWCgVeWRBaBwRLGlo2yJG8Nq64vLUmD92W4VUAi
         w5dEZODx6Z1m6vAxTK7MWeXYXfx0x5pXJ9TwPfLepaytl90sZ3GjktO1lCYBKOVeLShn
         TXPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs72Oc7Z9QSY2io9orlm3hOlLpisTxpgoMIkM2VOwtTsJjN8teivf7aBcdXt544oPeiugsTyO/MD1rw9c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzpbAaDhp4GKw5HliQBikOAxZitR1u/rHPsS69EaUuNCvnppRwa
	gAEZa/QWhbJ9DntMrmAm0pxFDF6PobUx0jzr36xJgYqs0VHR/chrzCKZCciX2xo=
X-Google-Smtp-Source: AGHT+IHKcdRFC9q2GD6595fUPe4NgxH7f7bGHM/1jVFUOYjtanMZU2hJPsIx01XdKDMweQg9NQ43+w==
X-Received: by 2002:a05:622a:105:b0:458:4c86:4564 with SMTP id d75a77b69052e-45b5e0952b0mr82475131cf.37.1727333223424;
        Wed, 25 Sep 2024 23:47:03 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b5257ff1esm23024611cf.38.2024.09.25.23.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 23:47:03 -0700 (PDT)
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
Subject: [PATCH v5 02/13] powerpc: assert_pte_locked() use pte_offset_map_ro_nolock()
Date: Thu, 26 Sep 2024 14:46:15 +0800
Message-Id: <42559e042eb6fc3129a40f710d671712030646b4.1727332572.git.zhengqi.arch@bytedance.com>
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


