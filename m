Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B1B87BD11
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 13:54:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GJEzbgW3;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QJv/Em92;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwS5K43bvz3vXP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 23:54:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GJEzbgW3;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QJv/Em92;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwS4b5Dmrz3cV5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 23:54:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710420843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BZxWk5KkUQhQXZEGGdHKASVJGou5PrPdHxO3BmOv5tM=;
	b=GJEzbgW3NvzdmOuKkHmVPPUVsRiQubmNeTj2O/0ogg6WFtLTnxBslrMsm31Rj0ZEXebe27
	qNnmIj3BS0Ix3e20hgLqlk6KYJi/tG1ebFmMp+enVRKY3K21EfZktqbY454EMfuZxG4hva
	8Zsyq8iBpU0qMHJASa6nOiJ07ssAjq8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710420844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BZxWk5KkUQhQXZEGGdHKASVJGou5PrPdHxO3BmOv5tM=;
	b=QJv/Em92EoeIdxHwrQjeYNYWLMyzbZe4njNz8plrFLtr4FJwb6JmY+IqH00Bhjy13R194k
	1SqBG6MD5+bNpd0SRVDNKNEps6pVcNCV+zJDRcXuPsSUcuB+JMXfvZzaeUaxqny2j8WleD
	BvyHJ5mXGX0xZC2a9t82sE8Uj75SdFY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-p_GiDewjPkmDfewDkKkWlw-1; Thu, 14 Mar 2024 08:54:02 -0400
X-MC-Unique: p_GiDewjPkmDfewDkKkWlw-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-690d3f5af86so3182906d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 05:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710420841; x=1711025641;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BZxWk5KkUQhQXZEGGdHKASVJGou5PrPdHxO3BmOv5tM=;
        b=O3TWAVs37umMVH9uX4/1lRvvbCPpDAQqbRom/OcBHX1pDmvEgKX9jWou38oUi8U70k
         /oK9MXRx7XOzzrGQ/V1PUYwqKHGawuGA9QcRu1Kw26NSEYuso2z57LqcAyzgyMsKEHFj
         xOR/rjx9hvAVrcLBoz1DyBjTVh50x27iy1VE1BDeLD1HQUAqAsav3gKK3rV+zQj8XZaS
         Sc9K580d5rFt2HTLxa0JoqKT2OwDxAgRxb5hcNtwYdJxG9lYH6Ij8K5PyJVYEZQrfkrZ
         h6R69vZE7xcpIjS/cMZSjPTzJP/dk+4h9u4mk67kcFRkh3aVpkfGdTiIc37rgxrsb4o0
         ldbA==
X-Forwarded-Encrypted: i=1; AJvYcCXgFdp5daZ35jK10jHFrwhuFtqb7/z3WIqLbjKakygDn9QeBgQ0oUCr9Rs7AwjqEkKnlWwVVpVnxKvLcDkCe6MWXCNRggAOCwnGo7zZuQ==
X-Gm-Message-State: AOJu0YzHO8TEBb8y0mrvY90+LE40EgcIr/cvfZJlB7jjBD1VLqKiRAa6
	rLIYvFzJ5KGR4PB1hfZX1nL0qajpmz9A2CioCKMeh8Q1f8dU7zmo+W27R3/T2YRrEuIBes6eJ90
	92PDEhCjnOY7388PRxu1H2YwWq8Lq+BRm2IGErZuUqtMV9R7XIVl8Nu+5wM7BNcM=
X-Received: by 2002:a05:6214:568b:b0:690:de72:316f with SMTP id qm11-20020a056214568b00b00690de72316fmr1649088qvb.1.1710420841568;
        Thu, 14 Mar 2024 05:54:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDKFAcy0D0RZIBzW/ijnDnKbSAtNbNy7aeKjfEkMPENW2gRJ/JKFObLbnjKUsRDl/qV6I7cQ==
X-Received: by 2002:a05:6214:568b:b0:690:de72:316f with SMTP id qm11-20020a056214568b00b00690de72316fmr1649061qvb.1.1710420841118;
        Thu, 14 Mar 2024 05:54:01 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id kd13-20020a056214400d00b0068ff79d8d97sm409217qvb.41.2024.03.14.05.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 05:54:00 -0700 (PDT)
Date: Thu, 14 Mar 2024 08:53:57 -0400
From: Peter Xu <peterx@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 09/13] mm/powerpc: Redefine pXd_huge() with pXd_leaf()
Message-ID: <ZfLzZekFBp3J6JUy@x1n>
References: <20240313214719.253873-1-peterx@redhat.com>
 <20240313214719.253873-10-peterx@redhat.com>
 <7b7d6ce1-4a3f-4392-951d-a9bd146c954c@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <7b7d6ce1-4a3f-4392-951d-a9bd146c954c@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Muchun Song <muchun.song@linux.dev>, "x86@kernel.org" <x86@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 14, 2024 at 08:45:34AM +0000, Christophe Leroy wrote:
> 
> 
> Le 13/03/2024 à 22:47, peterx@redhat.com a écrit :
> > From: Peter Xu <peterx@redhat.com>
> > 
> > PowerPC book3s 4K mostly has the same definition on both, except pXd_huge()
> > constantly returns 0 for hash MMUs.  As Michael Ellerman pointed out [1],
> > it is safe to check _PAGE_PTE on hash MMUs, as the bit will never be set so
> > it will keep returning false.
> > 
> > As a reference, __p[mu]d_mkhuge() will trigger a BUG_ON trying to create
> > such huge mappings for 4K hash MMUs.  Meanwhile, the major powerpc hugetlb
> > pgtable walker __find_linux_pte() already used pXd_leaf() to check hugetlb
> > mappings.
> > 
> > The goal should be that we will have one API pXd_leaf() to detect all kinds
> > of huge mappings.  AFAICT we need to use the pXd_leaf() impl (rather than
> > pXd_huge() ones) to make sure ie. THPs on hash MMU will also return true.
> 
> All kinds of huge mappings ?
> 
> pXd_leaf() will detect only leaf mappings (like pXd_huge() ). There are 
> also huge mappings through hugepd. On powerpc 8xx we have 8M huge pages 
> and 512k huge pages. A PGD entry covers 4M so pgd_leaf() won't report 
> those huge pages.

Ah yes, I should always mention this is in the context of leaf huge pages
only.  Are the examples you provided all fall into hugepd category?  If so
I can reword the commit message, as:

        As a reference, __p[mu]d_mkhuge() will trigger a BUG_ON trying to
        create such huge mappings for 4K hash MMUs.  Meanwhile, the major
        powerpc hugetlb pgtable walker __find_linux_pte() already used
        pXd_leaf() to check leaf hugetlb mappings.

        The goal should be that we will have one API pXd_leaf() to detect
        all kinds of huge mappings except hugepd.  AFAICT we need to use
        the pXd_leaf() impl (rather than pXd_huge() ones) to make sure
        ie. THPs on hash MMU will also return true.

Does this look good to you?

Thanks,

-- 
Peter Xu

