Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA1A9128C6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 17:02:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fk7gGsY0;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fk7gGsY0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5LF76QY1z3cYk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 01:02:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fk7gGsY0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fk7gGsY0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5LDP6QKHz3bNs
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2024 01:01:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718982115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=REVMzCf9KPJKxppAPyYl2jD1cpXtxvVGJIDHyR5KKbs=;
	b=fk7gGsY0cgBTPHPqq+7cxogb54B8scrd0CUMHH+O3xfT768A5B7lO37qxu7zv6QJ2KSpbQ
	Mrz+qQkSIVY43r4adAOMQzP98YKtowW2BjnVZlf0Yh37nDhM1Gwxw7Rg33DOdC23pvGnVy
	ll+Z0IXU37jfidnNDd1+JPXfYacG4v4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718982115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=REVMzCf9KPJKxppAPyYl2jD1cpXtxvVGJIDHyR5KKbs=;
	b=fk7gGsY0cgBTPHPqq+7cxogb54B8scrd0CUMHH+O3xfT768A5B7lO37qxu7zv6QJ2KSpbQ
	Mrz+qQkSIVY43r4adAOMQzP98YKtowW2BjnVZlf0Yh37nDhM1Gwxw7Rg33DOdC23pvGnVy
	ll+Z0IXU37jfidnNDd1+JPXfYacG4v4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-CIWcDmDPOnOsQEulA2DgaA-1; Fri, 21 Jun 2024 11:01:53 -0400
X-MC-Unique: CIWcDmDPOnOsQEulA2DgaA-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-797a903cf8fso22276385a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 08:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718982113; x=1719586913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REVMzCf9KPJKxppAPyYl2jD1cpXtxvVGJIDHyR5KKbs=;
        b=EPZ7/KPJ3y1GLEvm5H2qPuz6kL4/Uj1ZPwdl/NBPP5q0/jPXKVQoI0TSK9nQaC7Wx/
         Xhfdyr+M53z140sHIeO51xMbi8XBT2KaatMS781IBiAqg6o0eJ89RLS/BNvIznomCRua
         rbuo090JqVBie/Q0Pk81Liitpz2JQ5GsclfPYMpA1Ib3xNKm56fA4NfFTZxw4B8PWUZo
         i+auQfsT03IznDVkDVrkiLB2ZzyHqxM5XHZG5XqCgaLvHI06OvCJkNH48yuz2UfZ2nx2
         CAq8QlSej+ET9htorB/GVV2BiPx0i4NLWqmuziAh9tDWSMKBgMNKlN9WhNsbHiUvUHZZ
         szxA==
X-Forwarded-Encrypted: i=1; AJvYcCU+fksZtjFZ/BNUIghFjf6DwjsqfO3UYaPJIVsrsxnApbG21Efr90t2lrRz5DC31ZpDYPxPY2TyOQprUuN6l8iTCJPztyprBEimUHFHmQ==
X-Gm-Message-State: AOJu0YyT/H/LZmCO02mihTmAymDfmlOSVbGdrw1yyinUy8NwhDD/IlL9
	OP655y72ClB3mbI6g7YKjl+5JhguQbEbox9HfAy2sTLpDyN7wlsgduWFCWpeeyM03lbPjNEUv32
	F8DVYBJwGZsuuiExumrDT8wi+/BfcBqNdtBBdsCyDuYfHHhCl0A1ii7srmHGsth4=
X-Received: by 2002:a05:622a:2cc:b0:441:581b:c111 with SMTP id d75a77b69052e-444a7a153ffmr95993461cf.1.1718982112680;
        Fri, 21 Jun 2024 08:01:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGy/M4tB0NsmwFw2Vc1r8qkgVlJcFixEuuYKG9UASFE/pxP8aIpWiptz9iA6cfjIHrhSLs9OQ==
X-Received: by 2002:a05:622a:2cc:b0:441:581b:c111 with SMTP id d75a77b69052e-444a7a153ffmr95992901cf.1.1718982112163;
        Fri, 21 Jun 2024 08:01:52 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-444c2c3d946sm11823491cf.74.2024.06.21.08.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 08:01:51 -0700 (PDT)
Date: Fri, 21 Jun 2024 11:01:47 -0400
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 4/7] mm/powerpc: Add missing pud helpers
Message-ID: <ZnWV2-YBFKXjLA9v@x1n>
References: <20240621142504.1940209-1-peterx@redhat.com>
 <20240621142504.1940209-5-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240621142504.1940209-5-peterx@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Huang Ying <ying.huang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Dave Jiang <dave.jiang@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Rik van Riel <riel@surriel.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Mel Gorman <mgorman@techsingularity.net>, Matthew Wilcox <willy@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 21, 2024 at 10:25:01AM -0400, Peter Xu wrote:
> +pmd_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
> +		      pud_t *pudp)
> +{
> +	unsigned long old_pud;
> +
> +	VM_WARN_ON_ONCE(!pmd_present(*pmdp));
> +	old_pmd = pmd_hugepage_update(vma->vm_mm, address, pmdp, _PAGE_PRESENT, _PAGE_INVALID);
> +	flush_pmd_tlb_range(vma, address, address + HPAGE_PMD_SIZE);
> +	return __pmd(old_pmd);
> +}

I'll need an amend at least here, and my test harness won't catch it even
if it's a mistake as silly as it could be..  My apologies for such noise.
Below is what I plan to squash into this patch when I repost v2.

===8<===
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index c6ae969020e0..ea2c83634434 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -176,15 +176,15 @@ pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
        return __pmd(old_pmd);
 }
 
-pmd_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
+pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
                      pud_t *pudp)
 {
        unsigned long old_pud;
 
-       VM_WARN_ON_ONCE(!pmd_present(*pmdp));
-       old_pmd = pmd_hugepage_update(vma->vm_mm, address, pmdp, _PAGE_PRESENT, _PAGE_INVALID);
-       flush_pmd_tlb_range(vma, address, address + HPAGE_PMD_SIZE);
-       return __pmd(old_pmd);
+       VM_WARN_ON_ONCE(!pud_present(*pudp));
+       old_pud = pud_hugepage_update(vma->vm_mm, address, pudp, _PAGE_PRESENT, _PAGE_INVALID);
+       flush_pud_tlb_range(vma, address, address + HPAGE_PUD_SIZE);
+       return __pud(old_pud);
 }
 
 pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
===8<===

-- 
Peter Xu

