Return-Path: <linuxppc-dev+bounces-3150-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A6E9C7A64
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 18:56:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpWFD1kCQz2yNt;
	Thu, 14 Nov 2024 04:56:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731520608;
	cv=none; b=jLWVup64rHiu1sN4WH02VxJyjJZ7glAkgRrfwYFTMibTKE7YgJP/p7jFIQicNwooU/C56bc40I+Kqnf1MJYtXjPf1Xjqg6DM+Rl0XPZxwpr9xeLrfKDPFaBXxzb4SsDSIvfIH9xD5RpKHZT+gcmoB2a7HO2ZqoXUcKQccusYQBFSZC1D1weBSzSMV4fLiCuchWTyTYydQvozkQ8QjXrqLEDOCgmjXSD2q7WXsLA9WleT7eLnn2EWqq9KBQMh66//lZWcLWCWfk869w/I7V6s7navkiLJabWdRsiLjwBR7SxOO641LE7Wj1PqAGfb9eFWA271I6pIHRg5gE0G2CFm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731520608; c=relaxed/relaxed;
	bh=ED4P6NsWli087xm4vi4x4cRp52cJJf0X5FBYEB8bznw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=i4cB6FqsZRGtnLZJqHCfR+4IOOHPn/GCmGowBDY2FC43bBuI7mhfEDOm0F0ZYXWCuQAU1x5LTKcOnpyNkOK4toOtqDcRRU2o9IQC1A1mtt1tjT938j0BBxQ4GAbZgFZHOwSom1S/RJIS/O9KLBO5FMpwnQsR7prD7m+nFjQHMuIAJLUSkJFzkDveAePvQnrJ7d08aRzSPYgMkZFQYNZ5MykXrhtvWWlv+N5Mp8SjRRkngQSjnNIGrjd/CLikqN3sa4809vdWox7tvvFr/HCRKcZLT9ZZizzdHLEX6wBfQCOcqN8WTeTKsODBAtztzEnh+t2C0nJDHpBnOtiHRIzVUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TAaWg5ew; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TAaWg5ew; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TAaWg5ew;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TAaWg5ew;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpWFB75Hjz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 04:56:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731520600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ED4P6NsWli087xm4vi4x4cRp52cJJf0X5FBYEB8bznw=;
	b=TAaWg5ewln8sVuRDckm3um/XMD7aDxQuBznmat5LzD8jBzZnskuflnBWXo1gCcJbW4VxkN
	8X1zPGqyfRIbQ6Bsv4L3pVZuxgiqnYOm/pY6hLmgrNtoattRkuvOY7imNs/4/fhkP7huQO
	NWMDfGBmKy+dbUJa41laCMZOkQGTpa8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731520600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ED4P6NsWli087xm4vi4x4cRp52cJJf0X5FBYEB8bznw=;
	b=TAaWg5ewln8sVuRDckm3um/XMD7aDxQuBznmat5LzD8jBzZnskuflnBWXo1gCcJbW4VxkN
	8X1zPGqyfRIbQ6Bsv4L3pVZuxgiqnYOm/pY6hLmgrNtoattRkuvOY7imNs/4/fhkP7huQO
	NWMDfGBmKy+dbUJa41laCMZOkQGTpa8=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-madH65YKNx-mE89ETzKUhQ-1; Wed, 13 Nov 2024 12:56:36 -0500
X-MC-Unique: madH65YKNx-mE89ETzKUhQ-1
X-Mimecast-MFC-AGG-ID: madH65YKNx-mE89ETzKUhQ
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3e7a1f72eadso3430583b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 09:56:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731520596; x=1732125396;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ED4P6NsWli087xm4vi4x4cRp52cJJf0X5FBYEB8bznw=;
        b=nMfCL77xUHx7kMc281IZ5orgR6NHFO3IqhNgprCawChcVOJFt7+/7qGXu7zqSZ3BXk
         4wKesvyJ+VhkhH551c8vD3sKWXJOJtdJkXkFHu0FPiZZDmRb1jVJrA/sLPMqsUdp92EM
         jsZVqmarUPuJDwEAumYdfrlupgVuHCTs7lN/W/nMpGTEbWnqx86ifA+g/DbrNLsc9Ptk
         BrWdilxaJLwodWhRZCHvXYxWP9/xH3Oj8+agcQGPDaIqQf2gyolSFQKZ+I1tZR7Xe7FF
         qk1XP1z3XoZcIoufsNjdTQtN4WtCdG56cogvVKrnyHntymGPi89v9rgUHcHuzE4TLN29
         LOGw==
X-Forwarded-Encrypted: i=1; AJvYcCWcq4RMiJKuYPsmTDYCk1Jt0XdYrdanjAlyOVlKjxLDw7HN35wDipMTNsOOISODPVpCKRMKma8I92ngyhQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwxwQH/Tb8Bez+Sy5Skoky56hz4Rfpye9I203KpkeeRMdxNkV9M
	nKlX71/hQiLW3T+y0Znz6LznJ7345bPQo+8u1FJeGaZJf0hxHoQG7puR1edQRGHLTg6q7up8Ocz
	ODSpfBV6EVhuhWS5wblseJThczP7/RgCT4c2QvXrG2eU4MyoSnNcGv0Cry123aro=
X-Received: by 2002:a05:6808:210b:b0:3e5:fc09:7f51 with SMTP id 5614622812f47-3e7b0a6ecb1mr3667593b6e.9.1731520596159;
        Wed, 13 Nov 2024 09:56:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4VBL0HBnl2w17tqrXf/BlWXKTcO2I1zi+/iAk9osNVNVd0ENy5K0Fn0z3PGUlANNI5aIeog==
X-Received: by 2002:a05:6808:210b:b0:3e5:fc09:7f51 with SMTP id 5614622812f47-3e7b0a6ecb1mr3667559b6e.9.1731520595819;
        Wed, 13 Nov 2024 09:56:35 -0800 (PST)
Received: from x1n (pool-99-254-114-190.cpe.net.cable.rogers.com. [99.254.114.190])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3cf934d85sm24269446d6.33.2024.11.13.09.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 09:56:34 -0800 (PST)
Date: Wed, 13 Nov 2024 12:56:31 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, "Kirill A . Shutemov" <kirill@shutemov.name>,
	Nicholas Piggin <npiggin@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	Huang Ying <ying.huang@intel.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Rick P Edgecombe <rick.p.edgecombe@intel.com>,
	Hugh Dickins <hughd@google.com>, Borislav Petkov <bp@alien8.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Rik van Riel <riel@surriel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Mel Gorman <mgorman@techsingularity.net>, x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>, linuxppc-dev@lists.ozlabs.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Oscar Salvador <osalvador@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 0/7] mm/mprotect: Fix dax puds
Message-ID: <ZzToT6kkN0kkh-ww@x1n>
References: <20240812181225.1360970-1-peterx@redhat.com>
 <CAG48ez0NNph0Zp2aZ+c1T+U940CvwxcQ+jyEhp3KYZLSWPSrNw@mail.gmail.com>
 <ZzTWQqr-zFQz0HHY@x1n>
 <07ba2a86-f22b-43aa-a542-f1a182656b63@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
In-Reply-To: <07ba2a86-f22b-43aa-a542-f1a182656b63@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g6fBDOzfMYlwVCSlvd64b8c1ZPmZ9sQvYCUyZ53IiSI_1731520596
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Nov 13, 2024 at 05:42:15PM +0100, David Hildenbrand wrote:
> On 13.11.24 17:39, Peter Xu wrote:
> > On Mon, Nov 11, 2024 at 10:20:59PM +0100, Jann Horn wrote:
> > > On Mon, Aug 12, 2024 at 8:12 PM Peter Xu <peterx@redhat.com> wrote:
> > > > Dax supports pud pages for a while, but mprotect on puds was missing since
> > > > the start.  This series tries to fix that by providing pud handling in
> > > > mprotect().  The goal is to add more types of pud mappings like hugetlb or
> > > > pfnmaps.  This series paves way for it by fixing known pud entries.
> > > 
> > > Do people actually use hardware where they can use PUD THP mappings
> > > for DAX? I thought that was just some esoteric feature that isn't
> > > actually usable on almost any system.
> > > Was I wrong about that?
> > 
> > I did run it with a qemu emulated nvdimm device.  Though in reality I've no
> > idea on how many people are using it..
> 
> I wonder if we still have to support it ... or could disable it+rip it out.

Note that in my previous email, I also mentioned mremap() for PMD on dax
too.  If that's a real problem, it won't be fixed even if dropping dax PUD
support.

And we definitely want to understand whether there're still users on pud
dax to consider dropping anything.. it could still be that both mprotect()
and mremap() are not yet used in the current use cases.

Thanks,

-- 
Peter Xu


