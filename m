Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A2087F0F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 21:12:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JQm6TZ0X;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dzVkvFdF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz5c066R4z3w0Z
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 07:12:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JQm6TZ0X;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dzVkvFdF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz5RG4d6Zz3dSV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 07:04:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xZurg04juSYF/uW9HtnhgkfMM1C/gArxmrpoVNEgvCQ=;
	b=JQm6TZ0Xyx9LmB28WJTTYDoz+agABGZ9/veAKeQkhn8TMDY1K+wHrKA1jD3iJLmB3zRBCl
	Agn1/P9d+C1/BMkZFymDwAcX6e6kNu1WnayDFDYG2FWnU///Iad6vfT9KWmG0KFd7zV2ja
	ZUOjaDeVW+ugincW7y1+E9KTdFuC0sk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xZurg04juSYF/uW9HtnhgkfMM1C/gArxmrpoVNEgvCQ=;
	b=dzVkvFdFCLAuprbsPVzZQPG5WtMg2+8vltF0LZTyTf0+gLg6wSX6F+jCoDiUp7S98nKGTU
	ApnVTxX8v1gGpHBYNT3xFqpD+hALGS8wratphU2VsmJK34m6aBdpcOTp/j2xE1VIxkekww
	y2aKm6Va9/mTlR7HsiJGFq9QKs5ifLY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-Z594V3T3P6GY-xzYBoQTVw-1; Mon, 18 Mar 2024 16:04:22 -0400
X-MC-Unique: Z594V3T3P6GY-xzYBoQTVw-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-69627b26a51so2058776d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 13:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710792258; x=1711397058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZurg04juSYF/uW9HtnhgkfMM1C/gArxmrpoVNEgvCQ=;
        b=KfTZGQsQk81UEDAHasJmHlS/9HxnUTwu9Vn/3kN1lVfCERw6dXfhA+0YJmj31LPa6V
         Rcvkd4ushXAC+zse+AwtFNhQRK25ZqesaBdokITHcAMynB0Nk0f+isPNoMpcUt4q4qrZ
         64G5vfo4OFEDenSU7lh98TZovPIamJBg26FElSW7fGv7VvlHOqz2gSdVvDnFxKpMCIHH
         sQfvVA0YsiJCnmgiV8vvA9wFlau6QknH/rFiT0yDGeKSOqlcQ5qLnz/KxhUM8OSs8trn
         C/RiYZ3fxO4lpuxM6ztsZU6gEvADBdYjPmTGbKR4eJY1f6QSjaRXxxzxJNg2PoCwUjcy
         uKqw==
X-Forwarded-Encrypted: i=1; AJvYcCXM50yBsFn2e7DV2ZekriM2mZ97IGyYugmC+vkQcIXsjMw63RoWlMfY9yZwnRhK7Xw0Fd+D2sGz3eHgyonl4nqvuxLuNCUaQekxR8GbPw==
X-Gm-Message-State: AOJu0YwD1XYyQzBTMj90ExVQuMJkAuoiZb9B70oMsWnb+7cWg/DhWS6/
	9LseXAB5mZx3ZVVmyzsouISmw9kNRh3PBV3d+twYjQnu+ajViHpzjikfS9ubLKDlmtiJexVEPzK
	x1FgnG9bJjTEeLF5ZpPqWkLzSysYBXsS5mY3/rLe4I/ozLcEfjfK3G75ZWx82Pmo=
X-Received: by 2002:a05:6214:3f85:b0:690:9db6:f410 with SMTP id ow5-20020a0562143f8500b006909db6f410mr462665qvb.3.1710792258403;
        Mon, 18 Mar 2024 13:04:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPMjFRvOQnrQWtPInqAdggXMmLflMtETkazIbCBO67t5p2Mbipn5U9tbb0PWyioZzi1AzvbQ==
X-Received: by 2002:a05:6214:3f85:b0:690:9db6:f410 with SMTP id ow5-20020a0562143f8500b006909db6f410mr462644qvb.3.1710792258055;
        Mon, 18 Mar 2024 13:04:18 -0700 (PDT)
Received: from x1n.. ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hj10-20020a05622a620a00b0042ebbc1196fsm3484491qtb.87.2024.03.18.13.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:04:17 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 08/14] mm/arm64: Merge pXd_huge() and pXd_leaf() definitions
Date: Mon, 18 Mar 2024 16:03:58 -0400
Message-ID: <20240318200404.448346-9-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318200404.448346-1-peterx@redhat.com>
References: <20240318200404.448346-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-arm-kernel@lists.infradead.org, Muchun Song <muchun.song@linux.dev>, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org, Matthew Wilcox <willy@infradead.org>, peterx@redhat.com, Jason Gunthorpe <jgg@nvidia.com>, Mark Salter <msalter@redhat.com>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

Unlike most archs, aarch64 defines pXd_huge() and pXd_leaf() slightly
differently.  Redefine the pXd_huge() with pXd_leaf().

There used to be two traps for old aarch64 definitions over these APIs that
I found when reading the code around, they're:

 (1) 4797ec2dc83a ("arm64: fix pud_huge() for 2-level pagetables")
 (2) 23bc8f69f0ec ("arm64: mm: fix p?d_leaf()")

Define pXd_huge() with the current pXd_leaf() will make sure (2) isn't a
problem (on PROT_NONE checks). To make sure it also works for (1), we move
over the __PAGETABLE_PMD_FOLDED check to pud_leaf(), allowing it to
constantly returning "false" for 2-level pgtables, which looks even safer
to cover both now.

Cc: Muchun Song <muchun.song@linux.dev>
Cc: Mark Salter <msalter@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/arm64/include/asm/pgtable.h | 4 ++++
 arch/arm64/mm/hugetlbpage.c      | 8 ++------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 401087e8a43d..14d24c357c7a 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -704,7 +704,11 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 #define pud_none(pud)		(!pud_val(pud))
 #define pud_bad(pud)		(!pud_table(pud))
 #define pud_present(pud)	pte_present(pud_pte(pud))
+#ifndef __PAGETABLE_PMD_FOLDED
 #define pud_leaf(pud)		(pud_present(pud) && !pud_table(pud))
+#else
+#define pud_leaf(pud)		false
+#endif
 #define pud_valid(pud)		pte_valid(pud_pte(pud))
 #define pud_user(pud)		pte_user(pud_pte(pud))
 #define pud_user_exec(pud)	pte_user_exec(pud_pte(pud))
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 0f0e10bb0a95..1234bbaef5bf 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -81,16 +81,12 @@ bool arch_hugetlb_migration_supported(struct hstate *h)
 
 int pmd_huge(pmd_t pmd)
 {
-	return pmd_val(pmd) && !(pmd_val(pmd) & PMD_TABLE_BIT);
+	return pmd_leaf(pmd);
 }
 
 int pud_huge(pud_t pud)
 {
-#ifndef __PAGETABLE_PMD_FOLDED
-	return pud_val(pud) && !(pud_val(pud) & PUD_TABLE_BIT);
-#else
-	return 0;
-#endif
+	return pud_leaf(pud);
 }
 
 static int find_num_contig(struct mm_struct *mm, unsigned long addr,
-- 
2.44.0

