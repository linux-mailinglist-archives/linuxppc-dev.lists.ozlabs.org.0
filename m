Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8844F85D77A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 12:56:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KHnlCIhA;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KHnlCIhA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tfvr035vJz3cgk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 22:56:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KHnlCIhA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KHnlCIhA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfvqD6GvMz2ykt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 22:55:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708516533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PLsLM/ECtgqgj6YScdKuDzdQeO2PVy2fvKFbE23nuA4=;
	b=KHnlCIhA07Nq1bAmW6MedzwqBPuXkFYPzE2sPHYfGZfOA8sAXHRKv5RNAXl8MYZzXTYg09
	/mMEwE05IPR8KFnGwk8+cFg4GfhxE3pyDH8PnU/L2scgOI9NecOL7FW7aBbElZiqyVp2h/
	xiLcsIYfIFcyT/toEZa3EoR0DrEK1f8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708516533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PLsLM/ECtgqgj6YScdKuDzdQeO2PVy2fvKFbE23nuA4=;
	b=KHnlCIhA07Nq1bAmW6MedzwqBPuXkFYPzE2sPHYfGZfOA8sAXHRKv5RNAXl8MYZzXTYg09
	/mMEwE05IPR8KFnGwk8+cFg4GfhxE3pyDH8PnU/L2scgOI9NecOL7FW7aBbElZiqyVp2h/
	xiLcsIYfIFcyT/toEZa3EoR0DrEK1f8=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-ilQpuAneNKSO__dtVzwRmw-1; Wed, 21 Feb 2024 06:55:31 -0500
X-MC-Unique: ilQpuAneNKSO__dtVzwRmw-1
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-5ce9b15f4ccso2844686a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 03:55:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708516530; x=1709121330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLsLM/ECtgqgj6YScdKuDzdQeO2PVy2fvKFbE23nuA4=;
        b=c6HYTzOI+/N7euUTSrtptZb5KdJmki14ADQhK5QPnPAVhVGIe7wHVlODr/V3AMudBZ
         d1K61mW1/7YIp1HjH09TPBAav8+4K8o2IImToxD89s/xxHXzUddGsdz0ROk77NW64m2h
         VZxpvQQJdEUDMOru0dIWnhV5cvVO/8nqivXCxmDpFFTc8gzYshbLOtWyW5bGo/nhoQIt
         1DnvnLBltL6IfGlzF+cwICYkT2j0cIii4gNFOvUWZHqnq3uZVlHPglAWS9ARAv5AM53O
         02Nnw//ISATOUT0hXJ3j5wNDh3sgIHX987awNf3PLtSuvrtW3iTM0etTWfpbol+TaSI9
         UbSg==
X-Forwarded-Encrypted: i=1; AJvYcCX3R1f5b1UsRK71bjVlQ5/YcJfJBTBs9i6IRhgTUNs4vUexOPCYE21lpTkbB/HGRVobKGBbigGItmERUxHlJO0lz0Y1aQY9W3nWSVzYSQ==
X-Gm-Message-State: AOJu0Yxu1R8ikluPA89uH0aAOASI8VHNZ+jyPh6TMg3vzsnxXghLygNj
	FqT6DVT/EAZUQ0sg0QqsKnI8L/OAYZRbHtNilDuRt5ifkkV45GF1T31a4tMsQfoKMJdBptXycsa
	mahe9aFmozEfEfx7SViJJpxCmJOTNaUVoHBlIBkgpb5N4wm1xd1BR88ozYyaR1nc=
X-Received: by 2002:a05:6a21:3397:b0:1a0:cd02:b2f1 with SMTP id yy23-20020a056a21339700b001a0cd02b2f1mr196505pzb.3.1708516530444;
        Wed, 21 Feb 2024 03:55:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRO+9lM9EY5N92dCc9bYoUlt/pUN8sgkXoKwNhU9AZ+BNLKu2lSvew+Aw+SPUl5ZIlIuODvw==
X-Received: by 2002:a05:6a21:3397:b0:1a0:cd02:b2f1 with SMTP id yy23-20020a056a21339700b001a0cd02b2f1mr196492pzb.3.1708516530136;
        Wed, 21 Feb 2024 03:55:30 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id b3-20020a170902a9c300b001dc0955c635sm4149309plr.244.2024.02.21.03.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 03:55:29 -0800 (PST)
Date: Wed, 21 Feb 2024 19:55:17 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 06/13] mm/gup: Drop folio_fast_pin_allowed() in hugepd
 processing
Message-ID: <ZdXkpYEuRAxoLtHI@x1n>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-7-peterx@redhat.com>
 <20240115183748.GR734935@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240115183748.GR734935@nvidia.com>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 15, 2024 at 02:37:48PM -0400, Jason Gunthorpe wrote:
> > Drop that check, not only because it'll never be true for hugepd per any
> > known plan, but also it paves way for reusing the function outside
> > fast-gup.
> 
> I didn't see any other caller of this function in this series? When
> does this re-use happen??

It's reused in patch 12 ("mm/gup: Handle hugepd for follow_page()").

Thanks,

-- 
Peter Xu

