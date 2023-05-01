Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD4A6F3898
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 21:56:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9DVD1PMhz3fHM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 05:56:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YCg1YMo/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YCg1YMo/;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9CvP3890z3cNF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 05:29:21 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1a69f686345so21088515ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 May 2023 12:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969361; x=1685561361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSVYEUhM0zGHlDR1yqa5KIpwwPynV1rh1Z3AvIT239o=;
        b=YCg1YMo/xitXPr8EH+7i7/M0wYddD4PRgw+Xim9LG20m92WUdC9kOQT3fMeSkFJ8bz
         2xW9Qv874by/73QMdHiVk+wqz4B7HUYL6Uj2zbe5cOYZkoH3JAXPoFdQlYFWToTwzHn7
         dFfF9W+SZdFlY3dKNimMml0EcpIP5K8qP91gmqtjuJ3sBzpu94RZheVZlyc0ZtXP5Kh9
         Ho0HyuApLfDJnfV0KIWHGVL4xeGycAgKdLMplPIR2oWrmLtc//uxDTAq/yAuqmVSMzMJ
         fvK8MGrkhlBYA+kuhjIoxK7FCwuGLTfgfMGFdrbgTVFBoKNwWCi+6p4VuuSzDnIOEdqU
         o3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969361; x=1685561361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSVYEUhM0zGHlDR1yqa5KIpwwPynV1rh1Z3AvIT239o=;
        b=LA699Ac04XNxDowvD/+eWXXZilOg8UAkbfoYkukPi5pQNv0kAHNFJRlDsCKhtQ17B4
         rAfZDF6LFM5pTMXNM2Q9RjddsJxEovcgiCkAWJa1+5N/HXpQJKGK3qIGKYdM0ezQOBjj
         dOO/DDfcH4dnPGre7mHgrkny+evaX5Wi61Bb1At8rPOQFm+5YSJAf62N7o5l99jcI68V
         9YqzAaqBEtM8dhaYAfmdZj2DXprBTRAxztMUa7ssgDhT2BggQutepmDYZSw3D1tmeTKN
         zk7B4u5jkyHXyEpVMpwUVUOoturUCcd7HE0hgSBjTZBXGiD7Ck7CwShfZ8q3dmtl7kCT
         lttQ==
X-Gm-Message-State: AC+VfDzOxCoNM9I91xw0BhjicS8dtKpYevfbxEeAyFCe24KXlcQ0P9Ki
	HoN34HCSNCcgiQLYKiHymBw=
X-Google-Smtp-Source: ACHHUZ6yreaxJl7mf5rX62OpE7ktDECZCzzaxE5NqOb8jR7RBUIdxZHYmi631H3wh4Z5BZGAmm3BhA==
X-Received: by 2002:a17:902:c712:b0:1ab:3ba:d2c1 with SMTP id p18-20020a170902c71200b001ab03bad2c1mr1428915plp.44.1682969360924;
        Mon, 01 May 2023 12:29:20 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:29:20 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v2 32/34] sparc: Convert pgtable_pte_page_{ctor, dtor}() to ptdesc equivalents
Date: Mon,  1 May 2023 12:28:27 -0700
Message-Id: <20230501192829.17086-33-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of the conversions to replace pgtable pte constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/sparc/mm/srmmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 13f027afc875..964938aa7b88 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -355,7 +355,8 @@ pgtable_t pte_alloc_one(struct mm_struct *mm)
 		return NULL;
 	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
 	spin_lock(&mm->page_table_lock);
-	if (page_ref_inc_return(page) == 2 && !pgtable_pte_page_ctor(page)) {
+	if (page_ref_inc_return(page) == 2 &&
+			!ptdesc_pte_ctor(page_ptdesc(page))) {
 		page_ref_dec(page);
 		ptep = NULL;
 	}
@@ -371,7 +372,7 @@ void pte_free(struct mm_struct *mm, pgtable_t ptep)
 	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
 	spin_lock(&mm->page_table_lock);
 	if (page_ref_dec_return(page) == 1)
-		pgtable_pte_page_dtor(page);
+		ptdesc_pte_dtor(page_ptdesc(page));
 	spin_unlock(&mm->page_table_lock);
 
 	srmmu_free_nocache(ptep, SRMMU_PTE_TABLE_SIZE);
-- 
2.39.2

