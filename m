Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CCB60EB61
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 00:00:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MyN6S754bz3cJK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 09:00:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JccIwfub;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JccIwfub;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JccIwfub;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JccIwfub;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MyN5T6YYnz2xl4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 08:59:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666821589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QNXqWwBEWZqwUkNcA15/4+3p4mEEOSR1ir8+lCD/vgI=;
	b=JccIwfubWxZWvH1x7pZIRHDN7gMnx/dTC2gzdDYK4WnojQUDFaMx2zaoInUzU1EHYtmuk2
	Sn+C47yZqU+zXZVMZvyFHJRC/iix9iBwFDvtt33URHQIk9/0Gd3e77rW4nPPX1S0LhAjSV
	6vXfoXm3NvsTWUY5E6OYAq00oE9kBEY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666821589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QNXqWwBEWZqwUkNcA15/4+3p4mEEOSR1ir8+lCD/vgI=;
	b=JccIwfubWxZWvH1x7pZIRHDN7gMnx/dTC2gzdDYK4WnojQUDFaMx2zaoInUzU1EHYtmuk2
	Sn+C47yZqU+zXZVMZvyFHJRC/iix9iBwFDvtt33URHQIk9/0Gd3e77rW4nPPX1S0LhAjSV
	6vXfoXm3NvsTWUY5E6OYAq00oE9kBEY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-218-mwwfk-ZuNbeyZ2nWxqm_9w-1; Wed, 26 Oct 2022 17:59:46 -0400
X-MC-Unique: mwwfk-ZuNbeyZ2nWxqm_9w-1
Received: by mail-qk1-f200.google.com with SMTP id u9-20020a05620a454900b006eeafac8ea4so15190246qkp.19
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Oct 2022 14:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNXqWwBEWZqwUkNcA15/4+3p4mEEOSR1ir8+lCD/vgI=;
        b=Ad3gM3iXVKSSpR6twTnduaFjzqgF0JTGtz4oNsmh31eae9WM1PAfbo/lhhYfc2smPm
         7D2Q4ZcC/0hh1Lm6nvqztL60vpwDB1Q4B5CWmcyaqHYq1+u0mi/22i8EJ72cdr5hX79D
         ySPcJkfDn3osz6uMhGRRtgD7REiWrnB1Y7h+4+V6hFQe+lzEh7fHDNsGAeIg3OMxNSU6
         4bskvc1XAXN29MyrPZTFON4mvZu7Fd7j30Deke5LnCYNrfyUKBvqyLA5qhbwxF1Gu40V
         nHvBjydK05hAfWKsSzXRWPWpwB50+1eEvME/2uyhcLTCM48lbrfH1vp4HBllJhXHqZtA
         4U9A==
X-Gm-Message-State: ACrzQf1qHs4/2SIy4cFPgszsVo8UsG04v73bftanlz6UWQyad6a24URl
	mR7+ljqiOMfvcSw5mTw/Tjfia5UVUwZfKRp2mWHTdIhe++uzVGBcgpr/9YsGQMnqCvtgqGA54AM
	ZifcqfMFEtf6dl2CZhX/4+aAJuQ==
X-Received: by 2002:a05:6214:258f:b0:4bb:96dc:9081 with SMTP id fq15-20020a056214258f00b004bb96dc9081mr3792330qvb.56.1666821585911;
        Wed, 26 Oct 2022 14:59:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6clLhoqa4dyYP9jIEoFLifg0EVVqBR8GsJ2D+FA1fUGq9jZpwSidSVqlrnZh8mjpv+r4IZSQ==
X-Received: by 2002:a05:6214:258f:b0:4bb:96dc:9081 with SMTP id fq15-20020a056214258f00b004bb96dc9081mr3792307qvb.56.1666821585663;
        Wed, 26 Oct 2022 14:59:45 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
        by smtp.gmail.com with ESMTPSA id gd27-20020a05622a5c1b00b0039c37a7914csm2840053qtb.23.2022.10.26.14.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 14:59:45 -0700 (PDT)
Date: Wed, 26 Oct 2022 17:59:43 -0400
From: Peter Xu <peterx@redhat.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH v3] hugetlb: simplify hugetlb handling in follow_page_mask
Message-ID: <Y1mtz7dFAlhGRsAd@x1n>
References: <20220919021348.22151-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20220919021348.22151-1-mike.kravetz@oracle.com>
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

Hi, Mike,

On Sun, Sep 18, 2022 at 07:13:48PM -0700, Mike Kravetz wrote:
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
> +	/*
> +	 * vma lock prevents racing with another thread doing a pmd unshare.
> +	 * This keeps pte as returned by huge_pte_offset valid.
> +	 */
> +	hugetlb_vma_lock_read(vma);

I'm not sure whether it's okay to take a rwsem here, as the code can be
called by e.g. FOLL_NOWAIT?

I'm wondering whether it's fine to just drop this anyway, just always walk
it lockless.  IIUC gup callers should be safe here because the worst case
is the caller will fetch a wrong page, but then it should be invalidated
very soon with mmu notifiers.  One thing worth mention is that pmd unshare
should never free a pgtable page.

IIUC it's also the same as fast-gup - afaiu we don't take the read vma lock
in fast-gup too but I also think it's safe.  But I hope I didn't miss
something.

-- 
Peter Xu

