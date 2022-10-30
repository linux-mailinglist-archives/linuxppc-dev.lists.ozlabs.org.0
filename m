Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDB1612C7F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 20:46:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N0mx55N94z3cCl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 06:46:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PoClh2O5;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PoClh2O5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PoClh2O5;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PoClh2O5;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N0mw91pGrz3cKW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 06:45:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667159106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bT5+mtm9SvOiSWB+WL0RWSIeohhjPs4i/ZgPi5EI8zo=;
	b=PoClh2O51ymkJ5489xkzu+7JK9d3cRC2g34qs5bZO8zQARzP7TQ98l2rCJBR/fkY5cFB3+
	vCDGOj5PvuxlZWMqZJMPmfZWVfAAMnue3wdBB111cPeOoexnj+OlYOtW9RMFfMm1rD9O8B
	GQceIGxVsqSxLbPjTc7NdxZyIiBFuXU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667159106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bT5+mtm9SvOiSWB+WL0RWSIeohhjPs4i/ZgPi5EI8zo=;
	b=PoClh2O51ymkJ5489xkzu+7JK9d3cRC2g34qs5bZO8zQARzP7TQ98l2rCJBR/fkY5cFB3+
	vCDGOj5PvuxlZWMqZJMPmfZWVfAAMnue3wdBB111cPeOoexnj+OlYOtW9RMFfMm1rD9O8B
	GQceIGxVsqSxLbPjTc7NdxZyIiBFuXU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-154-wqk-wi8tPTG8qa9un5cuoA-1; Sun, 30 Oct 2022 15:45:05 -0400
X-MC-Unique: wqk-wi8tPTG8qa9un5cuoA-1
Received: by mail-qk1-f199.google.com with SMTP id x22-20020a05620a259600b006b552a69231so7877564qko.18
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 12:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bT5+mtm9SvOiSWB+WL0RWSIeohhjPs4i/ZgPi5EI8zo=;
        b=fzj+p6EVqgjBg80TiNnPZ5wdEr4lyk8DXcVgwLlASkCwo8K8donWdhLB20Vlr0j4f4
         st4iVHDJdGH4xiu1koSUUc3B/tujmJ27KLfW/m3sP8VD+TsvUWwlOZovJqMiqgkekqEt
         RhGiWgTppLAOUMt02z51sMiI75JblNZQVIh1/neJyY/USKunfkTBx/At3qcCY1kdXGeY
         kmeigNm8FnFstaQ+XbUdgM8l59vjLUvmA7viZ4c7LuT4b2gZtE6W+CJmJ6A/SFKYqmaT
         NuNTzX9rZ243eGngeqcQoGI9V8xDBhk8gqNMomXWxN0XhSQ174uB+ohV5zG1fcXLJmZS
         PNgg==
X-Gm-Message-State: ACrzQf0wjndQZlUk0gzfOkFCRA1sBB9BdOQ5CA/gYg9G1SsMxkF3+WMV
	hz7q5wHnO1BH9+fdhopMLXWb1aHueKUOmu+bx/oyNxSFlf5FYfuBfpdrCuEeHoK/1CMcmyCOfTm
	clFz4/iR8D+r2ii4O7nfbq3S0wg==
X-Received: by 2002:ac8:5b05:0:b0:399:9b82:77b4 with SMTP id m5-20020ac85b05000000b003999b8277b4mr7916914qtw.681.1667159104707;
        Sun, 30 Oct 2022 12:45:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7DGRAbhY7ngHol5WrR3s5q5A6o6BjH1ZsifAnGgA9PVQrmUO3jQvhvJGCv8i15sQG8OQjvCA==
X-Received: by 2002:ac8:5b05:0:b0:399:9b82:77b4 with SMTP id m5-20020ac85b05000000b003999b8277b4mr7916896qtw.681.1667159104500;
        Sun, 30 Oct 2022 12:45:04 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
        by smtp.gmail.com with ESMTPSA id fu38-20020a05622a5da600b0039953dcc480sm2596227qtb.88.2022.10.30.12.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 12:45:03 -0700 (PDT)
Date: Sun, 30 Oct 2022 15:45:02 -0400
From: Peter Xu <peterx@redhat.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH v4] hugetlb: simplify hugetlb handling in follow_page_mask
Message-ID: <Y17UPk9CBjPumcz6@x1n>
References: <20221028181108.119432-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20221028181108.119432-1-mike.kravetz@oracle.com>
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
Cc: Naoya Horiguchi <naoya.horiguchi@linux.dev>, linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Muchun Song <songmuchun@bytedance.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 28, 2022 at 11:11:08AM -0700, Mike Kravetz wrote:
> +struct page *hugetlb_follow_page_mask(struct vm_area_struct *vma,
> +				unsigned long address, unsigned int flags)
> +{
> +	struct hstate *h = hstate_vma(vma);
> +	struct mm_struct *mm = vma->vm_mm;
> +	unsigned long haddr = address & huge_page_mask(h);
> +	struct page *page = NULL;
> +	spinlock_t *ptl;
> +	pte_t *pte, entry;
> +
> +	/*
> +	 * FOLL_PIN is not supported for follow_page(). Ordinary GUP goes via
> +	 * follow_hugetlb_page().
> +	 */
> +	if (WARN_ON_ONCE(flags & FOLL_PIN))
> +		return NULL;
> +
> +retry:
> +	pte = huge_pte_offset(mm, haddr, huge_page_size(h));
> +	if (!pte)
> +		return NULL;
> +
> +	ptl = huge_pte_lock(h, mm, pte);
> +	entry = huge_ptep_get(pte);
> +	if (pte_present(entry)) {
> +		page = pte_page(entry) +
> +				((address & ~huge_page_mask(h)) >> PAGE_SHIFT);
> +		/*
> +		 * Note that page may be a sub-page, and with vmemmap
> +		 * optimizations the page struct may be read only.
> +		 * try_grab_page() will increase the ref count on the
> +		 * head page, so this will be OK.
> +		 *
> +		 * try_grab_page() should always succeed here, because we hold
> +		 * the ptl lock and have verified pte_present().
> +		 */
> +		if (WARN_ON_ONCE(!try_grab_page(page, flags))) {
> +			page = NULL;
> +			goto out;
> +		}
> +	} else {
> +		if (is_hugetlb_entry_migration(entry)) {
> +			spin_unlock(ptl);
> +			hugetlb_vma_unlock_read(vma);

Just noticed it when pulled the last mm-unstable: this line seems to be a
left-over of v3, while not needed now?

> +			__migration_entry_wait_huge(pte, ptl);
> +			goto retry;
> +		}
> +		/*
> +		 * hwpoisoned entry is treated as no_page_table in
> +		 * follow_page_mask().
> +		 */
> +	}
> +out:
> +	spin_unlock(ptl);
> +	return page;
> +}

-- 
Peter Xu

