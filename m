Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A66AF8A30B6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 16:31:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XDtYIR1n;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bigicfkY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VGJsv3Hztz3w34
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Apr 2024 00:31:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XDtYIR1n;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bigicfkY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VGJs62wDdz3dWw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Apr 2024 00:31:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712932262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5gvIPcFWYwEFpmmOj32QPWexxorRFZ+mmSvRstzL0kU=;
	b=XDtYIR1n6iSdsHvy27IMipSEjegKy7mTt+VV//kPOF1q4J/Sq/IPfKMz0iSkjgiSZEnDtT
	4lO7VGc8btICl27LRX0UznS986E28Yi8IUpPS6uPqeTLiv3pSJIShmJla3jPTzTu6GJiEH
	MfrvLl2I38HmbD9oqLVy+l2II0R5ciA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712932263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5gvIPcFWYwEFpmmOj32QPWexxorRFZ+mmSvRstzL0kU=;
	b=bigicfkYQxbGmPLRmJYEDakmHHkg52Y7RwFeRguq6zoSD2qojA4l7SKeIWTwRF1FBb/7a8
	Qb3Ix3mlUH+DVoCPLhs0551zl+rhzZfXTXIx/65oFAfepNI+TjygFWaqMSi0dW9xro8ZXY
	xCXOKAe2aePqWxQlz9Vc2hdYVTxmZBo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-QC1EMu_0M2a3MCwzp8rbOg-1; Fri, 12 Apr 2024 10:31:01 -0400
X-MC-Unique: QC1EMu_0M2a3MCwzp8rbOg-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-436507937ecso3033961cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 07:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712932260; x=1713537060;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5gvIPcFWYwEFpmmOj32QPWexxorRFZ+mmSvRstzL0kU=;
        b=dNssjy2t494u4wZ5pm2TOojN8x+lGdEDWhpqYJoyEukw5wWp5mxhRc2V5LHFpcOe7F
         aspAZb1EuKSw3JiHp4V9S1QUQOcdLx6cyHAkh0qFkOsx3Dp/gt1KNUisA26v4V/G2Yxt
         2NECtUfHavUqYND5NCiTWaSqh6c3tkkcdU4cehGHBb53lOtJ+NjNNa1tHrCQZtu0qYL7
         4nVR5epIWyzzYf0NzogLInSne7lX/ZgJ9zUXtLadIn7WVMZgzLuqPYqVakSmEOzgkRf5
         T0yuNZoChlo96oy4S7nC8pHAGsrBRgY5XHkKLXX9unkOymOw4j0tIjmdpzktaIZ6W2//
         CVbg==
X-Forwarded-Encrypted: i=1; AJvYcCVyGRibkFGIxyodC99n26CLQwxuPrivC1V0nkzTaSwWTHdE1XDJKe1BOXHA/+o7qYGZennPiIBTzDvD5RjgqPjpa1fws3sYsCR2ygAsyQ==
X-Gm-Message-State: AOJu0YwjmPTLtYrDLd711taHDHcVFQsPdKdTnk6LH5gW0NKeHQRxutaF
	1aZk2h3Lqvlr3frRR8jQzXj9suGFbYXBHN0g7+rFpF9cHzBV/iAVol9hqeF02i0WD9t6teQyih3
	bcdZfDhUxPoNitSCR4NVfkNhzjzpvyOs/CZYRhhTobo29d/J3qaeMWOthVs86mTM=
X-Received: by 2002:a05:6214:27ec:b0:699:1c74:bd54 with SMTP id jt12-20020a05621427ec00b006991c74bd54mr3044512qvb.3.1712932260282;
        Fri, 12 Apr 2024 07:31:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDgbuVeaiYa+iRpf0cfy8PiIaqZ4WRcM9oHh6Gsf+qbEBfhxoFcZIHBXMGQOqhTvyFuTiFRw==
X-Received: by 2002:a05:6214:27ec:b0:699:1c74:bd54 with SMTP id jt12-20020a05621427ec00b006991c74bd54mr3044473qvb.3.1712932259555;
        Fri, 12 Apr 2024 07:30:59 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id r26-20020a0c9e9a000000b0069b5c6f074bsm514693qvd.112.2024.04.12.07.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 07:30:59 -0700 (PDT)
Date: Fri, 12 Apr 2024 10:30:58 -0400
From: Peter Xu <peterx@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH 0/8] Reimplement huge pages without hugepd on powerpc
 8xx
Message-ID: <ZhlFokakZo3c90C6@x1n>
References: <cover.1711377230.git.christophe.leroy@csgroup.eu>
 <20240325163840.GF6245@nvidia.com>
 <ZhgMqF7SNaISrYMJ@x1n>
 <d236ce4a-1dde-4ee9-8cef-fe96242c2f4b@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <d236ce4a-1dde-4ee9-8cef-fe96242c2f4b@csgroup.eu>
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 12, 2024 at 02:08:03PM +0000, Christophe Leroy wrote:
> 
> 
> Le 11/04/2024 à 18:15, Peter Xu a écrit :
> > On Mon, Mar 25, 2024 at 01:38:40PM -0300, Jason Gunthorpe wrote:
> >> On Mon, Mar 25, 2024 at 03:55:53PM +0100, Christophe Leroy wrote:
> >>> This series reimplements hugepages with hugepd on powerpc 8xx.
> >>>
> >>> Unlike most architectures, powerpc 8xx HW requires a two-level
> >>> pagetable topology for all page sizes. So a leaf PMD-contig approach
> >>> is not feasible as such.
> >>>
> >>> Possible sizes are 4k, 16k, 512k and 8M.
> >>>
> >>> First level (PGD/PMD) covers 4M per entry. For 8M pages, two PMD entries
> >>> must point to a single entry level-2 page table. Until now that was
> >>> done using hugepd. This series changes it to use standard page tables
> >>> where the entry is replicated 1024 times on each of the two pagetables
> >>> refered by the two associated PMD entries for that 8M page.
> >>>
> >>> At the moment it has to look into each helper to know if the
> >>> hugepage ptep is a PTE or a PMD in order to know it is a 8M page or
> >>> a lower size. I hope this can me handled by core-mm in the future.
> >>>
> >>> There are probably several ways to implement stuff, so feedback is
> >>> very welcome.
> >>
> >> I thought it looks pretty good!
> > 
> > I second it.
> > 
> > I saw the discussions in patch 1.  Christophe, I suppose you're exploring
> > the big hammer over hugepd, and perhaps went already with the 32bit pmd
> > solution for nohash/32bit challenge you mentioned?
> > 
> > I'm trying to position my next step; it seems like at least I should not
> > adding any more hugepd code, then should I go with ARCH_HAS_HUGEPD checks,
> > or you're going to have an RFC soon then I can base on top?
> 
> Depends on what you expect by "soon".
> 
> I sure won't be able to send any RFC before end of April.
> 
> Should be possible to have something during May.

That's good enough, thanks.  I'll see what is the best I can do.

Then do you think I can leave p4d/pgd leaves alone?  Please check the other
email where I'm not sure whether pgd leaves ever existed for any of
PowerPC.  That's so far what I plan to do, on teaching pgtable walkers
recognize pud and lower for all leaves.  Then if Power can switch from
hugepd to this it should just work.

Even if pgd exists (then something I overlooked..), I'm wondering whether
we can push that downwards to be either pud/pmd (and looks like we all
agree p4d is never used on Power).  That may involve some pgtable
operations moving from pgd level to lower, e.g. my pure imagination would
look like starting with:

#define PTE_INDEX_SIZE	PTE_SHIFT
#define PMD_INDEX_SIZE	0
#define PUD_INDEX_SIZE	0
#define PGD_INDEX_SIZE	(32 - PGDIR_SHIFT)

To:

#define PTE_INDEX_SIZE	PTE_SHIFT
#define PMD_INDEX_SIZE	(32 - PMD_SHIFT)
#define PUD_INDEX_SIZE	0
#define PGD_INDEX_SIZE	0

And the rest will need care too.  I hope moving downward is easier
(e.g. the walker should always exist for lower levels but not always for
higher levels), but I actually have little idea on whether there's any
other implications, so please bare with me on stupid mistakes.

I just hope pgd leaves don't exist already, then I think it'll be simpler.

Thanks,

-- 
Peter Xu

