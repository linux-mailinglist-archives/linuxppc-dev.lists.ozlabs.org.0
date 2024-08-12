Return-Path: <linuxppc-dev+bounces-31-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA6C94F96E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 00:13:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jnn7w6n0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jnn7w6n0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjTLJ2Q84z2xdL;
	Tue, 13 Aug 2024 08:13:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jnn7w6n0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jnn7w6n0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjN0X5SzQz2xQG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 04:12:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723486361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=51AsM4wPs8z1MhF0DnEEQJIHR/NiBzvmhfDXZZK2UA8=;
	b=Jnn7w6n0gwtjJfI2DZ8EB0wjG/1sqPNoKtV3FWMJBvINwdiupXN9WDMrfk37pxCBGCF/wf
	hWQJILdqi8jzaQxDY2lPygYHsPbfh4OPj9ob3aqYdmK3doRD3eNtzPmvI905lSkHVFDLHL
	XbeVrMvl7Qx5N+/qtl2XQt/65bs9x7A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723486361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=51AsM4wPs8z1MhF0DnEEQJIHR/NiBzvmhfDXZZK2UA8=;
	b=Jnn7w6n0gwtjJfI2DZ8EB0wjG/1sqPNoKtV3FWMJBvINwdiupXN9WDMrfk37pxCBGCF/wf
	hWQJILdqi8jzaQxDY2lPygYHsPbfh4OPj9ob3aqYdmK3doRD3eNtzPmvI905lSkHVFDLHL
	XbeVrMvl7Qx5N+/qtl2XQt/65bs9x7A=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-unuaNwi6NYqeGF3_E83jug-1; Mon, 12 Aug 2024 14:12:38 -0400
X-MC-Unique: unuaNwi6NYqeGF3_E83jug-1
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-4929d50431bso219672137.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 11:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723486358; x=1724091158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51AsM4wPs8z1MhF0DnEEQJIHR/NiBzvmhfDXZZK2UA8=;
        b=pAqXATdXNxWINgbgn6slyRkoZ4Luv1a0iYy1tcvtTTuCRflK5FilIpC4Z2QQJKxaal
         g7lArcYFM5TvrtSWMNhoF0NGffTSSQlTIH68M+8F/zkWSo9Fbw+OdTApAeQULWNQaoCY
         LRNrCFUgskOHDTtAo//usahEAEjPpAQJvFz6EriEukoCMX1cPnS/u8KjKSrH7ebt03wa
         JdVuPpde8ntRYneD7ufP5Oy2YUR+CpTgJECqDGZLPNxJ7gv/X5lenD5qpDnJ20AewQX8
         kMNiljG3eVmCXuwWdbJIRdsbx3lvmcpNZWpm1zLhfVY2k/oK4phazMjRsqh/+B4TS7sT
         9q1w==
X-Forwarded-Encrypted: i=1; AJvYcCXwKyXDY/Yo/c9LejhqSmxBUdYiUU2zVhmiWfZZskam0o9Vt1vAD7xLfBdghnN61scFzbq4j6h4+vHiY48=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy+6Q4uwb9QBEqiL9tHRvmeFzgZJiy407eMGa3qnKwzDCgF/qhA
	Xkjao9kNuGTFXhNLr9cZ092SP3MJX2sAhFVJClMR1rcx0vmalEosXrz3jU6H8GjncA77LfqnKNk
	9g8HZahIXQxonYDRArHPNvkg/FCIJINAjEf3IiSF/zU7YQ9R298rjI6jcQkxom4U=
X-Received: by 2002:a05:6102:3ecb:b0:48f:1db0:e268 with SMTP id ada2fe7eead31-49743b3bcadmr808469137.3.1723486358028;
        Mon, 12 Aug 2024 11:12:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqoB9/0mESDqYSEBNTj9AtHyzcMfWYv34FSY6okF36kkcu051ygwC1i1HRAV7+0kWzcEuDbQ==
X-Received: by 2002:a05:6102:3ecb:b0:48f:1db0:e268 with SMTP id ada2fe7eead31-49743b3bcadmr808432137.3.1723486357628;
        Mon, 12 Aug 2024 11:12:37 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7dee013sm268663985a.84.2024.08.12.11.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 11:12:37 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: "Kirill A . Shutemov" <kirill@shutemov.name>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	Huang Ying <ying.huang@intel.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	peterx@redhat.com,
	Vlastimil Babka <vbabka@suse.cz>,
	Rick P Edgecombe <rick.p.edgecombe@intel.com>,
	Hugh Dickins <hughd@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Rik van Riel <riel@surriel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linuxppc-dev@lists.ozlabs.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Oscar Salvador <osalvador@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v5 4/7] mm/x86: Make pud_leaf() only care about PSE bit
Date: Mon, 12 Aug 2024 14:12:22 -0400
Message-ID: <20240812181225.1360970-5-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240812181225.1360970-1-peterx@redhat.com>
References: <20240812181225.1360970-1-peterx@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

When working on mprotect() on 1G dax entries, I hit an zap bad pud
error when zapping a huge pud that is with PROT_NONE permission.

Here the problem is x86's pud_leaf() requires both PRESENT and PSE bits
set to report a pud entry as a leaf, but that doesn't look right, as
it's not following the pXd_leaf() definition that we stick with so far,
where PROT_NONE entries should be reported as leaves.

To fix it, change x86's pud_leaf() implementation to only check against
PSE bit to report a leaf, irrelevant of whether PRESENT bit is set.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/x86/include/asm/pgtable.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index e39311a89bf4..a2a3bd4c1bda 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1078,8 +1078,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
 #define pud_leaf pud_leaf
 static inline bool pud_leaf(pud_t pud)
 {
-	return (pud_val(pud) & (_PAGE_PSE | _PAGE_PRESENT)) ==
-		(_PAGE_PSE | _PAGE_PRESENT);
+	return pud_val(pud) & _PAGE_PSE;
 }
 
 static inline int pud_bad(pud_t pud)
-- 
2.45.0


