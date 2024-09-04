Return-Path: <linuxppc-dev+bounces-966-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0125A96B52A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 10:42:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzGFT72qsz2yY0;
	Wed,  4 Sep 2024 18:42:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725439325;
	cv=none; b=NCMIpzC63Z1vOK6xbLKMDgF72XsnNZyRotsILQR+QW7XpI5FiOj/A4rKRj7dv4GBOBDyye55sjC5r/AweZOhOyjC75+yPKn+TAJpUGwXpZWfSf70+VGO/K5yQaoh0aCq1IT0sE7CMCBUSneND9rDErMdpgxqkDxgEbWcDcg3uinrG5iAmkO72auGOaMQW8ejOO9BALk70pO9V02E8dLh+iboP60ueKH639IVCTKddES0+aYc0VqgXxQMW1NADRRSxAerQ9eBErEQAaVNYyeJatttXZhdPNYvpPDVvn0+jhX73johyMMNl/h5loV/Bv1yDB/4oM8HT/hxFBJVhMMj4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725439325; c=relaxed/relaxed;
	bh=Y4jsyz9eZnVjuIeNrv9jm5llMD04VewCinfUm/XXhZs=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version; b=M00LLIGdVNjxmR7zaApzUff1xw+w5srzBLhE2w/e4R1cXun3xRfLiGrZLYny93gsrGISt/w8/HLmzSbj0KwJrgCZb/3ZOJsn5CCi4KnaOOCe5M+fBqZ2Ql2QnDaJpfTMErX7Ysv2Kd2fyl+Ccj3JRHDEe2095jHLrp2hc8FAPUmNQOG7odY+fxTS9V0yTIzYaSB9ls35ly4BvuyAC9jUmgO4t+ImjOL+YFFNjmVoXxAgkjcQ1f7wYBVbmoOZRKWQgrh9PKcc088NqvLjVcJHGr9SeY7hCkTaxFJugQqlgDbzyvG8gmlwmHIIh0h+s2ZgrnEVRdsSBo5Jt5pnIYLn0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=l2/DfPUc; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=l2/DfPUc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzGFT5YYdz2yQn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 18:42:05 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7cd830e0711so369082a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 01:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1725439323; x=1726044123; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4jsyz9eZnVjuIeNrv9jm5llMD04VewCinfUm/XXhZs=;
        b=l2/DfPUcXLT9RiWrxIbIdgc3+jydhrP5UIeriDpnBdHSJ7dYAMs7DcN7WL4gIMNloI
         zcjCBQ6yGyl4ipQSqAXif5dkGLjdmef+HsMiytlDmlKlJwfSnGiRtXd1Vd5UkAeKHuOU
         /1I+QuXAEWY0jwsnIteT8f2pLVUIY+kPAoUPN7lE15vBKr91tNoi8vLttlPqWF+VM9eI
         UPQn0HJxeuO5KXmLAdwfOTjrGXooPDe7WWB8CAsGuiDOxqDxYkH/YEom2liqBjwCyQMw
         Kw6NedL5bYqn9ZvDK6RbGX4Pr1NGcwwyZLT19Fcd63sfxUEIlWurKLQ/Ywyfn2QRwAOZ
         3l0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725439323; x=1726044123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4jsyz9eZnVjuIeNrv9jm5llMD04VewCinfUm/XXhZs=;
        b=qWsRecfYJMF9S7lzCLofr0VDSY5fTE69qFvcYr0jfdngdh4jRh73D0FJ0hD33R08F2
         3iWLzmBN4sU3eZTY3fKguXYsYDVwjRhl3217ZkVEAAECr0XKMHHJrq0VUW97XA+rNIwn
         yfr8F0hNiNsWFDcvCgJ7maiDqJYzEzFlxxMWbd2od2+/4n34T7wrLBTUkLwEz6Tv8J+R
         dLIZ3jUL/bmxvibETWSXKT4oBW2VUQ03PjsiEA+r+x2RUgpa6vCcyEXE8NEScnuGJa93
         qoybCs1WeURGsLMPgOoP87H11y2W6n0FeqV6P+gP8mUEIXL3/DjE92fSTby1RKaD2RGr
         3pnA==
X-Forwarded-Encrypted: i=1; AJvYcCWIIU/4gsW7Y844WOuS45T3vfdpoSyLkfngDw6nssUPfIv93i7QCvejWQnVaDiody1AgzwjspG55Qzy1H4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyf60rotOGYN1o8DBNg3iAu5nlbJf353pmXhIy6gt4kRbzaYtoR
	r5rWs2y5MjVODKHRJivxkQad53kzdXCirbYobPvBrzrbyPJIP19JpTHTITY7974=
X-Google-Smtp-Source: AGHT+IGXU/qy5PPe2L4ehUmGkYFpO+LVdbh/09mdfTo5RpVJKjaH3T6TEVRYBI0feUcEJkjAodGgeA==
X-Received: by 2002:a17:902:e545:b0:1fd:6ca4:f987 with SMTP id d9443c01a7336-206b8341fdfmr24676655ad.15.1725439323059;
        Wed, 04 Sep 2024 01:42:03 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae95a51csm9414045ad.117.2024.09.04.01.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 01:42:02 -0700 (PDT)
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
Subject: [PATCH v3 12/14] mm: multi-gen LRU: walk_pte_range() use pte_offset_map_rw_nolock()
Date: Wed,  4 Sep 2024 16:40:20 +0800
Message-Id: <20240904084022.32728-13-zhengqi.arch@bytedance.com>
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

In walk_pte_range(), we may modify the pte entry after holding the ptl, so
convert it to using pte_offset_map_rw_nolock(). At this time, the
pte_same() check is not performed after the ptl held, so we should get
pmdval and do pmd_same() check to ensure the stability of pmd entry.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/vmscan.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index a9b6a8196f958..36b84e46cd7b5 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3375,8 +3375,10 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 	struct pglist_data *pgdat = lruvec_pgdat(walk->lruvec);
 	DEFINE_MAX_SEQ(walk->lruvec);
 	int old_gen, new_gen = lru_gen_from_seq(max_seq);
+	pmd_t pmdval;
 
-	pte = pte_offset_map_nolock(args->mm, pmd, start & PMD_MASK, &ptl);
+	pte = pte_offset_map_rw_nolock(args->mm, pmd, start & PMD_MASK, &pmdval,
+				       &ptl);
 	if (!pte)
 		return false;
 	if (!spin_trylock(ptl)) {
@@ -3384,6 +3386,11 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 		return false;
 	}
 
+	if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
+		pte_unmap_unlock(pte, ptl);
+		return false;
+	}
+
 	arch_enter_lazy_mmu_mode();
 restart:
 	for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
-- 
2.20.1


