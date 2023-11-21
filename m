Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4FF7F32FF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 17:00:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ElJWlHaH;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CrAFxo+y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZTcL3wn0z3c82
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 03:00:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ElJWlHaH;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CrAFxo+y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZTbP1CvKz3c82
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 02:59:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700582380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JLQMSJj5cT+I2UqS+X9OetiKtxPgKmgg9Mky3rgL5p8=;
	b=ElJWlHaHuSZy71M7B3dOQp8J/2OzWUhKuFd8uKuMe8cujuldou89HalsmJdmj4TLGCuZNm
	BPjf4A3MspR6oe8b7koLqdrzIbMjiGtkLzsAlk3WWZABSntPrnsbxbUj6JICU+TgwhwMfu
	4iVkQeoDOPNnX3OQXhFgZWSg2kNrAvE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700582381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JLQMSJj5cT+I2UqS+X9OetiKtxPgKmgg9Mky3rgL5p8=;
	b=CrAFxo+ydw8C6CbTxUbBIaihHmYR6ig8k/MtfOpRtrd0RljEr+Ya2KItvfoyWQHbsGdFtN
	h2noGDl4792ZLDm2wOTIapJbDdaB7q9k1gDawGnwsUJY0g1HMu2vLOKe0bGvy8PMMPFRSu
	2THHOi/MDiY/3nxa2HMeRhO6qNkJ++A=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-rbsngHtjMVWkpo5o_HBmIg-1; Tue, 21 Nov 2023 10:59:39 -0500
X-MC-Unique: rbsngHtjMVWkpo5o_HBmIg-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6716c2696c7so15014376d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 07:59:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582379; x=1701187179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLQMSJj5cT+I2UqS+X9OetiKtxPgKmgg9Mky3rgL5p8=;
        b=NmyYBxUdgQItJRF6Sy4eNfVv6FE/N+paaWzm88cXlkVxYB+U03svv2gnKVDMiDMNhl
         3GYB9cdkSULnQ4mcxvMmYgjARi9i/R9y/WoW6Z5xVHSh+eHsmP3FA7te0dB7sTiLSQhv
         exYACrrg4umseWbdH/r78tvl8hc1OYPsAEwsVoQE9LqLIJKVdsqXcMFnkZNd8FzzGVBG
         yRqWMxR/cifWFcTbELAjUzq4y/qewVzN5Ar/2tpruFINtrwjmGp8qMxA05fY72tJkfU0
         Ej2ij1g3cSo1Wp0+MsDVxF8zfDr+dwpnJZMaqj93GJ0+EPdiVmDDxgEANGJXgHQInZxU
         zWJA==
X-Gm-Message-State: AOJu0YyzYAj5lXMyPYEca008yxxSrfW3Gs58FohSjwq6jhkx4gQakDDE
	DQfbkH2ArQF0UG8lYqe3hwPz3/ex/7hi2/WX++jtXE4swFzUjC6jjSo9Io8q5yOOufvApemdE6/
	DT+OV6SBwW4a6t0rZIluTlkHurQ==
X-Received: by 2002:a0c:c582:0:b0:66d:1012:c16a with SMTP id a2-20020a0cc582000000b0066d1012c16amr10534479qvj.1.1700582378974;
        Tue, 21 Nov 2023 07:59:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9jPSayCUuCFnqS3WxavS9ST6O5WwQE1cldTJjdWqW9XI/Aaj5okJ+Mn7wuuqXunOLRSa0AQ==
X-Received: by 2002:a0c:c582:0:b0:66d:1012:c16a with SMTP id a2-20020a0cc582000000b0066d1012c16amr10534438qvj.1.1700582378610;
        Tue, 21 Nov 2023 07:59:38 -0800 (PST)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id a12-20020a0562140c2c00b00679d9547310sm2051153qvd.31.2023.11.21.07.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 07:59:38 -0800 (PST)
Date: Tue, 21 Nov 2023 10:59:35 -0500
From: Peter Xu <peterx@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in
 hugepd processing
Message-ID: <ZVzT5_3Zn-Y-6xth@x1n>
References: <20231116012908.392077-1-peterx@redhat.com>
 <20231116012908.392077-7-peterx@redhat.com>
 <ZVsYMMJpmFV2T/Zc@infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZVsYMMJpmFV2T/Zc@infradead.org>
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

On Mon, Nov 20, 2023 at 12:26:24AM -0800, Christoph Hellwig wrote:
> On Wed, Nov 15, 2023 at 08:29:02PM -0500, Peter Xu wrote:
> > Hugepd format is only used in PowerPC with hugetlbfs.  In commit
> > a6e79df92e4a ("mm/gup: disallow FOLL_LONGTERM GUP-fast writing to
> > file-backed mappings"), we added a check to fail gup-fast if there's
> > potential risk of violating GUP over writeback file systems.  That should
> > never apply to hugepd.
> >
> > Drop that check, not only because it'll never be true for hugepd, but also
> > it paves way for reusing the function outside fast-gup.
> 
> What prevents us from ever using hugepd with file mappings?  I think
> it would naturally fit in with how large folios for the pagecache work.
> 
> So keeping this check and generalizing it seems like the better idea to
> me.

But then it means we're still keeping that dead code for fast-gup even if
we know that fact..  Or do we have a plan to add that support very soon, so
this code will be destined to add back?

The other option is I can always add a comment above gup_huge_pd()
explaining this special bit, so that when someone is adding hugepd support
to file large folios we'll hopefully not forget it?  But then that
generalization work will only happen when the code will be needed.

Thanks,

-- 
Peter Xu

