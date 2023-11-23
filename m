Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0897F67A2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 20:38:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JRpJH915;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JRpJH915;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbpLX5JpVz3vdZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 06:38:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JRpJH915;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JRpJH915;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbpKj36DRz3cTS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 06:37:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700768244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xmOn5+FX7gFongPnnuombqlFZm27jJX8g7knRz4U4Fc=;
	b=JRpJH915LvZV3k6P/yvqkT07vG0tiVukGWX6HH1p9pISqqN6bPmJy9pRHcE0pE1VwImC2I
	9T18VLafmGk4Co62E3SSDhR23PKm5v9LzAOLvedhfxad+xZhLaMLST2/tmAhwOLZCIAx+Z
	bwsHiJqJkjlQURVuOWRuyy2Ilwo1roE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700768244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xmOn5+FX7gFongPnnuombqlFZm27jJX8g7knRz4U4Fc=;
	b=JRpJH915LvZV3k6P/yvqkT07vG0tiVukGWX6HH1p9pISqqN6bPmJy9pRHcE0pE1VwImC2I
	9T18VLafmGk4Co62E3SSDhR23PKm5v9LzAOLvedhfxad+xZhLaMLST2/tmAhwOLZCIAx+Z
	bwsHiJqJkjlQURVuOWRuyy2Ilwo1roE=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-W5_8usCeNpW2r_npHNXZjQ-1; Thu, 23 Nov 2023 14:37:22 -0500
X-MC-Unique: W5_8usCeNpW2r_npHNXZjQ-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-1f9efc41382so459fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 11:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700768242; x=1701373042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmOn5+FX7gFongPnnuombqlFZm27jJX8g7knRz4U4Fc=;
        b=e/xQlRUIl4Tse6hlHfziaUhJGtICJXeNoWCgVYrXhzYFKUB42PGHBPXz5Eylr4AfWm
         7CTcjZhvqn1ZxbUd27glPcyeiSn2kDqtQaRagUKcxf94bE7a+yW5lXRESOPs30y1zVlE
         Ke6MvYzGGIPWd+S5dhQtY0TpgoUjm+NdUI+FmDTTb/Xav6tOGB1hQgmzdfsoZNF4Pyp2
         6HlVDTza/LsUFcfbSi4n0Syo8OJpZh/UhGNUGJVG+75w9DUV1Faskp6LqFDeraAY9wdo
         OasjaVdggMH7KH5iF7kT6isMY6HPHJo4mwxKRveXHAIJoxFDbrmvzQQtfo7Yp0zFqFPw
         iUHQ==
X-Gm-Message-State: AOJu0YxL3T2b3IdkC3Pt1X5Mi/Q9XVCRLjRa2f66UWH7ImLXFK8MV3VJ
	aPz6rvzGvDlB1XhmEUC0Ao3CM+ObKuVTJZjU2fLOtlCHsgaixOwKVvV4y/htpvM0+Y516IfppNd
	3Lx934YgTlrcZ+orDzZuqxM15nA==
X-Received: by 2002:a05:6870:d0a:b0:1f9:5346:2121 with SMTP id mk10-20020a0568700d0a00b001f953462121mr357567oab.4.1700768241806;
        Thu, 23 Nov 2023 11:37:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkKmRMwIRaB3Ih9vdlTMJmgge2PoiF567J/ze233V1+FMKyortqkbCHa/MQ2E7l3VCDMjKhQ==
X-Received: by 2002:a05:6870:d0a:b0:1f9:5346:2121 with SMTP id mk10-20020a0568700d0a00b001f953462121mr357535oab.4.1700768241485;
        Thu, 23 Nov 2023 11:37:21 -0800 (PST)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id kd26-20020a05622a269a00b00421b14f7e7csm690038qtb.48.2023.11.23.11.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 11:37:21 -0800 (PST)
Date: Thu, 23 Nov 2023 14:37:18 -0500
From: Peter Xu <peterx@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in
 hugepd processing
Message-ID: <ZV-p7haI5SmIYACs@x1n>
References: <20231116012908.392077-1-peterx@redhat.com>
 <20231116012908.392077-7-peterx@redhat.com>
 <ZVsYMMJpmFV2T/Zc@infradead.org>
 <ZVzT5_3Zn-Y-6xth@x1n>
 <ZV21GCbG48nTLDzn@infradead.org>
 <ZV4co7wcI-_wK91F@x1n>
 <57be0ed0-f1d7-4583-9a5f-3ed7deb0ea97@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <57be0ed0-f1d7-4583-9a5f-3ed7deb0ea97@csgroup.eu>
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, James Houghton <jthoughton@google.com>, Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Vlastimil Babka <vbabka@suse.cz>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 23, 2023 at 06:22:33PM +0000, Christophe Leroy wrote:
> > For fast-gup I think the hugepd code is in use, however for walk_page_*
> > apis hugepd code shouldn't be reached iiuc as we have the hugetlb specific
> > handling (walk_hugetlb_range()), so anything within walk_pgd_range() to hit
> > a hugepd can be dead code to me (but note that this "dead code" is good
> > stuff to me, if one would like to merge hugetlb instead into generic mm).
> 
> Not sure what you mean here. What do you mean by "dead code" ?
> A hugepage directory can be plugged at any page level, from PGD to PMD.
> So the following bit in walk_pgd_range() is valid and not dead:
> 
> 		if (is_hugepd(__hugepd(pgd_val(*pgd))))
> 			err = walk_hugepd_range((hugepd_t *)pgd, addr, next, walk, PGDIR_SHIFT);

IMHO it boils down to the question on whether hugepd is only used in
hugetlbfs.  I think I already mentioned that above, but I can be more
explicit; what I see is that from higher stack in __walk_page_range():

	if (is_vm_hugetlb_page(vma)) {
		if (ops->hugetlb_entry)
			err = walk_hugetlb_range(start, end, walk);
	} else
		err = walk_pgd_range(start, end, walk);

It means to me as long as the vma is hugetlb, it'll not trigger any code in
walk_pgd_range(), but only walk_hugetlb_range().  Do you perhaps mean
hugepd is used outside hugetlbfs?

Thanks,

-- 
Peter Xu

