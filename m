Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CE394958B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 18:27:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=THClXlqs;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jEOQZx4V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wddy732V0z3d88
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 02:27:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=THClXlqs;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jEOQZx4V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WddxR6B29z3c5h
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 02:27:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722961623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dwRzqS6Jrxy/9AqVhW2hvOe8Nx9yRiOYapW2YHF2cyE=;
	b=THClXlqsHi+DT/hXzV4Dl+YA0N5BWhvSIk18PlhY+xd2VbQucpmLIvtOWvbqWhH5ECt0n2
	MamlOJOQ4+NtJ4VnXX8sexcusHyajySnWJ1ar/R3b4etC5uZv5lbJNpXBdOoecQyLGwWFr
	f+h3CEUl3J5W8Q6EKn84yi1UbEIDAh0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722961624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dwRzqS6Jrxy/9AqVhW2hvOe8Nx9yRiOYapW2YHF2cyE=;
	b=jEOQZx4V1x15H/fl3kv/SOuGQFhPb0JGY3QrGDOIRh18rJVG9LOOmRaemnX2oHriTiFhgt
	nqJ6m7T3HYa7cGl1VOUg7HX8Mw/gtLn83UOneaGcYrSCZABBf/+miYDu6B1eA/2A0FpphY
	ah8CwKrFF+vGfH1OoPQpgV7C7rmE2UM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-1f7S93dXMKS9CF5f5dtI7g-1; Tue, 06 Aug 2024 12:27:02 -0400
X-MC-Unique: 1f7S93dXMKS9CF5f5dtI7g-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6b95c005dbcso2663906d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Aug 2024 09:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722961622; x=1723566422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwRzqS6Jrxy/9AqVhW2hvOe8Nx9yRiOYapW2YHF2cyE=;
        b=cbSkNnfaAQHqL3ffriEYP0mwy+PBo8M+qG0JxwSuD80H41QAP+eJknr9S7MzDt85Ta
         hq2R44ucsvGiMlW5Q9TDep6wtf+NSuEeCRFE6vTsSemSgvrGTpAnn01U3RuRf4wGOck9
         VT+1jD2JyzVVVvThMUV4+LYgnN15ACUqs1V7HPGFU+Ede4qwXQNcQqRD1F68wU/Owa/R
         BrjbT3Y5KGMdO+umQApPGstvtOpcBLicq3azSxgdmdhn9F6gazyuWsSUXM3/gdQ7kYC4
         MGYQa4dpg55yGuqb/IuLi4uGH8YGIIaXyUAdZi7SW3mwVrpsL9xFiSHIoLidOB5GVUGB
         R0zg==
X-Forwarded-Encrypted: i=1; AJvYcCXN3MFIXDQnzwZfYpwNz6p7Ok+tcYa98HDnw+bujlz74sSDj5RESbgVRV3Vq+9mNdQpr/HalzttkGQzRsU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxztye+2rYMCu7i2G2OsJhVffk/g7LbHgj7KqnF/1Tcga2qrgUI
	ZCrScwvJ6i3eKqdDZwBYbk1jp95iDvoWJRHFs0it0Xg/o5IlB3M6TljywsnTTqyFi+9QkrIf7t4
	Cjzhp6psOh/a4kWz6xriDPYkPcACt0lu9fi7+mWHX4Lr2H2Ld78a7eiXoq0Cq7as=
X-Received: by 2002:a05:6214:20e9:b0:6b2:af3c:f710 with SMTP id 6a1803df08f44-6bb9831ea8emr105902416d6.2.1722961621804;
        Tue, 06 Aug 2024 09:27:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs199fAKj0/OLiUoJmdO3kvLFiPXK+MPCbBppWbqB/Lo+v3asN98Wu552yOIbw7iXXDStHtA==
X-Received: by 2002:a05:6214:20e9:b0:6b2:af3c:f710 with SMTP id 6a1803df08f44-6bb9831ea8emr105902046d6.2.1722961621365;
        Tue, 06 Aug 2024 09:27:01 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c88421dsm47964496d6.139.2024.08.06.09.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 09:27:00 -0700 (PDT)
Date: Tue, 6 Aug 2024 12:26:57 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 2/8] mm/mprotect: Remove NUMA_HUGE_PTE_UPDATES
Message-ID: <ZrJO0aLVaeRoo8eo@x1n>
References: <20240715192142.3241557-1-peterx@redhat.com>
 <20240715192142.3241557-3-peterx@redhat.com>
 <added2d0-b8be-4108-82ca-1367a388d0b1@redhat.com>
 <Zq-Y3qs5_PZW04bt@x1n>
 <054324a3-bc77-426f-a751-06700aad394e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <054324a3-bc77-426f-a751-06700aad394e@redhat.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Alex Thorlton <athorlton@sgi.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 06, 2024 at 03:02:00PM +0200, David Hildenbrand wrote:
> > Right.
> > 
> > I don't have a reason to change numa_pte_updates semantics yet so far, but
> > here there's the problem where numa_huge_pte_updates can be ambiguous when
> > there is even PUD involved.
> > 
> > In general, I don't know how I should treat this counter in PUD path even
> > if NUMA isn't involved in dax yet; it can be soon involved if we move on
> > with using this same path for hugetlb, or when 1G thp can be possible (with
> > Yu Zhao's TAO?).
> 
> We shouldn't bother about it in the PUD path at all I think. Especially as
> long as NUMA hinting doesn't apply to any of what we would handle on the PUD
> path :)

Hmm, I just noticed that hugetlb was never involved.. but then how about a
potential 1G THP?  Do you mean 1G THP will not be accounted in numa
balancing too even in the future?

The motivation I had this patch in this series is I want to be clear on how
I should treat this counter in pud path if it won't go.  And when people
compare the two paths we'll need to be clear why there's such difference if
I ignore it in pud path.

Per my current read on this counter, it might be an overkill to do that at
all, and it might be simpler we drop it now.

> 
> > 
> > One other thing I can do is I drop this patch, ignore NUMA_HUGE_PTE_UPDATES
> > in PUD dax processing for now.  It'll work for this series, but it'll still
> > be a problem later.  I figured maybe we should simply drop it from now.
> 
> It probably shouldn't block your other fixes and we should likely discuss
> that separately.
> 
> I agree that we should look into dropping that PMD counter completely.

No strong opinion here.  If we prefer keeping that as separate topic, I'll
drop this patch.  You're right, it's not yet relevant to the fix.

Thanks,

-- 
Peter Xu

