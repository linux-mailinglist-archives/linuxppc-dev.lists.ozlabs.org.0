Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA7F7F63AE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 17:11:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HM7aL4Ud;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HM7aL4Ud;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbjlR29pcz3vXF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 03:10:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HM7aL4Ud;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HM7aL4Ud;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbjkZ49RKz3cb0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 03:10:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700755805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lyyvUshat2fP97k91On5bJICBhysTXujJ3DjXRepMqQ=;
	b=HM7aL4UdaJPN9kzsTjsx5lIWD5RI+bdsfJ8UVtsa8f+UdCQWXZAvDCN7gCK6wA1arHTo7u
	O6dUWlo0lBbECk7axSFZGdDzO9ElZQdu5z4VIXojQHSMjySUtMxvU15bCUadoSWD9adxdL
	GhOUaWj24Drwyw90iMUzhifIUqJt0J0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700755805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lyyvUshat2fP97k91On5bJICBhysTXujJ3DjXRepMqQ=;
	b=HM7aL4UdaJPN9kzsTjsx5lIWD5RI+bdsfJ8UVtsa8f+UdCQWXZAvDCN7gCK6wA1arHTo7u
	O6dUWlo0lBbECk7axSFZGdDzO9ElZQdu5z4VIXojQHSMjySUtMxvU15bCUadoSWD9adxdL
	GhOUaWj24Drwyw90iMUzhifIUqJt0J0=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-_VKkPCBZNK-WvWGXH9SDYA-1; Thu, 23 Nov 2023 11:10:03 -0500
X-MC-Unique: _VKkPCBZNK-WvWGXH9SDYA-1
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-58737e284f4so175285eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 08:10:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700755803; x=1701360603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyyvUshat2fP97k91On5bJICBhysTXujJ3DjXRepMqQ=;
        b=LzxO2Fe79DJNQAB5OaK94k8KWy4a8xa4LD24J9TM5MjjwHCX0XNTvZI7bfSa3OAb68
         Z37JQtFkjsSVwBUfJFq0OqOYgG0xvu7FaTE5dvOjlpujIfESXi43QVpU8WYnlhy+RUDH
         1UvNzJgq4r8/CGtxmd0TKwZ0SqBg4kCzg20XICN46G2u6cO7RlHPW4S3YVQ8ZCDca6oB
         0wjZqNfJHenucnnBreWBLeDQa7db+Aba1bEl5GFNlTl8Oh4vRbEvAXxreEbg9EFX1GHq
         jNYfyyyow7QdxE6DyShUDtzfaczT4tRwex5UTgytMy+LgDRaXCMlWa5g8T34c1mlg4x6
         ZiVQ==
X-Gm-Message-State: AOJu0YxVLlot2TMMBHU/4nMN8ShjfpARLmSHzQmMlXqO/A7mp1HYeVp1
	smhwHgJDoT9P0fa0fSCHi+jEg74AFPnHROBPKLdqWlvGx2PJQofj95KN7EkVaoeEywL3xghWQTb
	mobX36HGuPn0WWNn/Sy2FJIYlzg==
X-Received: by 2002:a05:6820:e83:b0:58c:ec4c:fcac with SMTP id em3-20020a0568200e8300b0058cec4cfcacmr101165oob.0.1700755803129;
        Thu, 23 Nov 2023 08:10:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmNivlTtEAEu+zMS1dFz7ndggAjtVDuraohs+wBqkFwHApZkIGKcw15xm/6f8/7NUn+ypweg==
X-Received: by 2002:a05:6820:e83:b0:58c:ec4c:fcac with SMTP id em3-20020a0568200e8300b0058cec4cfcacmr101137oob.0.1700755802907;
        Thu, 23 Nov 2023 08:10:02 -0800 (PST)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id a24-20020a0ca998000000b00677a12f11bcsm625712qvb.24.2023.11.23.08.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 08:10:02 -0800 (PST)
Date: Thu, 23 Nov 2023 11:10:00 -0500
From: Peter Xu <peterx@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in
 hugepd processing
Message-ID: <ZV95WMqoZzchrcBY@x1n>
References: <20231116012908.392077-1-peterx@redhat.com>
 <20231116012908.392077-7-peterx@redhat.com>
 <ZVsYMMJpmFV2T/Zc@infradead.org>
 <ZVzT5_3Zn-Y-6xth@x1n>
 <ZV21GCbG48nTLDzn@infradead.org>
 <ZV4co7wcI-_wK91F@x1n>
 <ZV79jpaeiiN2tGm/@infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZV79jpaeiiN2tGm/@infradead.org>
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, James Houghton <jthoughton@google.com>, Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Vlastimil Babka <vbabka@suse.cz>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 22, 2023 at 11:21:50PM -0800, Christoph Hellwig wrote:
> That alone sounds like a good reason to not bother.  So unless more
> qualified people have a different opinion I'm fine with this patch
> as long as you leave a comment in place, and ammend the commit message
> with some of the very useful information from your mail.

Will do, thanks.

This is what I will squash into the same patch in the new version, as the
current plan:

+/*
+ * NOTE: currently hugepd is only used in hugetlbfs file systems on Power,
+ * which does not have issue with folio writeback against GUP updates.
+ * When hugepd will be extended to support non-hugetlbfs or even anonymous
+ * memory, we need to do extra check as what we do with most of the other
+ * folios. See writable_file_mapping_allowed() and folio_fast_pin_allowed()
+ * for more information.
+ */
static int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
                unsigned int pdshift, unsigned long end, unsigned int flags,
                struct page **pages, int *nr)

-- 
Peter Xu

