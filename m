Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30578895B41
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 19:59:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UhTNg/XP;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UhTNg/XP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8Fxh6w1hz3vZk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 04:59:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UhTNg/XP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UhTNg/XP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8Fwx0Tdrz3020
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 04:58:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712080702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QbOtfO/Dg9m2AlUnDgJHatWmb8CbT3I2rXBSbFfhdJY=;
	b=UhTNg/XPtc7hgQsz8u4FV1NdMiuxMAnM/F9vzyvMFTahGOWlBYPy2RK1YiDt3E5/r5wvnx
	uU4FBhVU+oM39GSFc9thnjr/lEqz+8k4yBd1NE3QsNCPsH8/vBJJZG0dctaC/Vo6VdOKE9
	8Okvzgp112eqIkOqRtmGjrOA+QgL/eA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712080702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QbOtfO/Dg9m2AlUnDgJHatWmb8CbT3I2rXBSbFfhdJY=;
	b=UhTNg/XPtc7hgQsz8u4FV1NdMiuxMAnM/F9vzyvMFTahGOWlBYPy2RK1YiDt3E5/r5wvnx
	uU4FBhVU+oM39GSFc9thnjr/lEqz+8k4yBd1NE3QsNCPsH8/vBJJZG0dctaC/Vo6VdOKE9
	8Okvzgp112eqIkOqRtmGjrOA+QgL/eA=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-noXfWabtPrm0WYPjghiO5w-1; Tue, 02 Apr 2024 13:58:18 -0400
X-MC-Unique: noXfWabtPrm0WYPjghiO5w-1
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-7e33b4df4ddso367781241.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Apr 2024 10:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712080698; x=1712685498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbOtfO/Dg9m2AlUnDgJHatWmb8CbT3I2rXBSbFfhdJY=;
        b=Wbk9MJBCqftBWY67Q456ykrFFzoQVOHqDuwFRadMa8G+6riAYzTtUm9QZqlmWJBjnX
         bWTGpy/VtAz6jyu+RQFRYfHLLc5Pc/P+f7vJEF++oaFCTygsJIdsNbcpSwi+Rw8QRIdv
         pcXkmnZrUdv9kyTlGaxdbVrRp+9mM6DgOnoJbxn1KSG9P4gaA4d3IHca8mH7pgzjrBt6
         Xblicgq+TfGV3TRvFuG/FLCPth+/PJRexsDigMogYTNIl9sWYNeBBYA0IEk2WFK4lQNo
         70gpFWsIKrSTmsTD0x+THH81NY4h2woU/UKAJYZENmqY8KX844Y1hAUXa/wXFZ1RzyAQ
         /gdw==
X-Forwarded-Encrypted: i=1; AJvYcCXzfIsk7oI/NW9woQwrLw3rWNFCxk0U2o/93ZDhcEnodvPteprzcj0WqHvJuPFnAZP6AG2cM4Ck7/1UvAfQEdE5eMmcMh0siVHbcdUFNA==
X-Gm-Message-State: AOJu0YzgbzrZrUAUmtdM/Nn9e8MhklhKLHRhnXZkwxR1Vnqj7DgwfiJ0
	VeCsmdqps1yWV4EM+pk705UER6Rk8Ko39dA7qQ8PGZT0Y3VujNsUtXy+EQgSTyuWmSJpDzoW9Ze
	xcklBAF0IY7IsZ7bhxaDdxnr1uJREzRyYbF8vj49cxcr8AAzgfDaPqSrDQbtzpGM=
X-Received: by 2002:a05:6102:93:b0:476:e72e:94ef with SMTP id t19-20020a056102009300b00476e72e94efmr9650805vsp.3.1712080697551;
        Tue, 02 Apr 2024 10:58:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8b3uQ69B5cqo+ud6RtEbqNi2TEDMHUU32VESs2Pw1E24CP/zf32LkrpOQk6Mcp1ToEoA3Uw==
X-Received: by 2002:a05:6102:93:b0:476:e72e:94ef with SMTP id t19-20020a056102009300b00476e72e94efmr9650757vsp.3.1712080696946;
        Tue, 02 Apr 2024 10:58:16 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id kk15-20020a056214508f00b00696a78b9cc6sm5720428qvb.53.2024.04.02.10.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 10:58:16 -0700 (PDT)
Date: Tue, 2 Apr 2024 13:58:12 -0400
From: Peter Xu <peterx@redhat.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v4 13/13] mm/gup: Handle hugetlb in the generic
 follow_page_mask code
Message-ID: <ZgxHNKbDnIIs7n2r@x1n>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-14-peterx@redhat.com>
 <adfdd89b-ee56-4758-836e-c66a0be7de25@arm.com>
 <5d9dd9a7-e544-4741-944c-469b79c2c649@redhat.com>
 <ZgwwOq3XXKlS_7LQ@x1n>
 <f4aff3e9-1d78-4bb8-a6f3-2887b9928b54@arm.com>
MIME-Version: 1.0
In-Reply-To: <f4aff3e9-1d78-4bb8-a6f3-2887b9928b54@arm.com>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 02, 2024 at 05:46:57PM +0100, Ryan Roberts wrote:
> I'll leave you to do the testing on this, if that's ok.

Definitely.  I'll test and send formal patches.

> 
> Just to make my config explicit, I have this kernel command line, which reserves
> hugetlbs of all sizes for the tests:
> 
> "transparent_hugepage=madvise earlycon root=/dev/vda2 secretmem.enable
> hugepagesz=1G hugepages=0:2,1:2 hugepagesz=32M hugepages=0:2,1:2
> default_hugepagesz=2M hugepages=0:64,1:64 hugepagesz=64K hugepages=0:2,1:2"

This helps, thanks.

-- 
Peter Xu

