Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 104B79495EC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 18:52:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QJeb4wwN;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GyCocrS6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdfVk6XfYz3ck4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 02:52:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QJeb4wwN;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GyCocrS6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdfV20ljWz3cQH
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 02:51:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722963109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/mCJXCJjs2Oa+lqZWj1oOLjxdvcWGqBpryPUVus180I=;
	b=QJeb4wwNrGJbUFf7trdNi8T+d/9fD15nrFfKvwGFOUMkyIUMZgporbMJu8y++rqf+2CAND
	RSt6LngCb+cxT4Zl74VoeDpFX0RKdHYEAi9hxbuuQcuUY6snNnyeIyH5pdjOlMuKnYxG9W
	PEvjBafDmJq6vFLnJmlR4eF+ZdCkBlc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722963110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/mCJXCJjs2Oa+lqZWj1oOLjxdvcWGqBpryPUVus180I=;
	b=GyCocrS69DJOG2HWZ08y74OSPpg/dyPCc/qzH5J0dtczybMskyHemydVK45HmOr8rFFVCG
	vDSDd7YjMXw/mROALWLj2tzXZg5WzAjkosPJyduN9T6TjuJMqEDrVAQXo33hv0o4eVPyes
	84QyAkf+OVH2ttkmoQiSlSFAKcVpv60=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-VsB5PmgOP76ht_-txIYH5A-1; Tue, 06 Aug 2024 12:51:48 -0400
X-MC-Unique: VsB5PmgOP76ht_-txIYH5A-1
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-709376e8668so166727a34.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Aug 2024 09:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722963107; x=1723567907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mCJXCJjs2Oa+lqZWj1oOLjxdvcWGqBpryPUVus180I=;
        b=D4WXL+zPGk0AgxwNCEjka6AWhBwSpBu0NUZBtVpc4qRM2z0wfnnua8lCGgBv3Hkkvc
         qpap+joRHw7vbOo4u/XacuP7YjsoNNRRFXT8oe8EMV9L5AVQvK1D0tgZMuQWbudLvjbB
         Wvp7TqC6/OSSmjImxedJWbDaA8jemEq2BpDcoYJTo1EYDOsnN4/zVGoQSXwX1NFRtoEU
         I9om5emTCnC3GSWQsjYPaOHN7XNvrH+1hzr2jaSEuSU370c/1kfR5Gd3ZvRnpu4Mt4vL
         mbU96E7cgJxVm8Q7m6HHzUbMf6eZjvKBilSSM4MoJWChm2yOySbgaFMfW2NWHez22O2Y
         +dEg==
X-Forwarded-Encrypted: i=1; AJvYcCXg3PNAwRUdHNDyv44D7RPgwzYh6BR9zp9REZgCbrLrnu3jG9/WpN6WLKHatamM8G6V5Tw7skkqj84Cr2U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwLVGH8dqTa3kZN2ObFtAW5z2/wWBuqylNev+vgOc3JoNSjJzTW
	a4gGGqwTTmGhSmVBaLXbMuGZUZXyVjmaRPnG3V2msOwBb4D1r2chiXvq+aT1mgnMdWSTSucWfWk
	hf9UuSZt6yRzBfBM0vZ/yMBbl4TyDgPcml8g8iZ1UTsYv/RHEWCrizTANYM8KCtY=
X-Received: by 2002:a4a:b80c:0:b0:5c6:6029:1568 with SMTP id 006d021491bc7-5d6455f39d2mr8735126eaf.0.1722963107390;
        Tue, 06 Aug 2024 09:51:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbwac9k+Zg/Ro5fMGPCeM4WfaEKkODNlqWaBpva+fIizYSSXt9HO+Y9Im0OPLjbfFmriUNWQ==
X-Received: by 2002:a4a:b80c:0:b0:5c6:6029:1568 with SMTP id 006d021491bc7-5d6455f39d2mr8735112eaf.0.1722963106982;
        Tue, 06 Aug 2024 09:51:46 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c83a236sm47898606d6.92.2024.08.06.09.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 09:51:46 -0700 (PDT)
Date: Tue, 6 Aug 2024 12:51:43 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 2/8] mm/mprotect: Remove NUMA_HUGE_PTE_UPDATES
Message-ID: <ZrJUn3IhYDsHSADT@x1n>
References: <20240715192142.3241557-1-peterx@redhat.com>
 <20240715192142.3241557-3-peterx@redhat.com>
 <added2d0-b8be-4108-82ca-1367a388d0b1@redhat.com>
 <Zq-Y3qs5_PZW04bt@x1n>
 <054324a3-bc77-426f-a751-06700aad394e@redhat.com>
 <ZrJO0aLVaeRoo8eo@x1n>
 <a149ee8e-e53a-4978-b5af-dbf43c99cf7b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a149ee8e-e53a-4978-b5af-dbf43c99cf7b@redhat.com>
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

On Tue, Aug 06, 2024 at 06:32:10PM +0200, David Hildenbrand wrote:
> On 06.08.24 18:26, Peter Xu wrote:
> > On Tue, Aug 06, 2024 at 03:02:00PM +0200, David Hildenbrand wrote:
> > > > Right.
> > > > 
> > > > I don't have a reason to change numa_pte_updates semantics yet so far, but
> > > > here there's the problem where numa_huge_pte_updates can be ambiguous when
> > > > there is even PUD involved.
> > > > 
> > > > In general, I don't know how I should treat this counter in PUD path even
> > > > if NUMA isn't involved in dax yet; it can be soon involved if we move on
> > > > with using this same path for hugetlb, or when 1G thp can be possible (with
> > > > Yu Zhao's TAO?).
> > > 
> > > We shouldn't bother about it in the PUD path at all I think. Especially as
> > > long as NUMA hinting doesn't apply to any of what we would handle on the PUD
> > > path :)
> > 
> > Hmm, I just noticed that hugetlb was never involved.. but then how about a
> > potential 1G THP?  Do you mean 1G THP will not be accounted in numa
> > balancing too even in the future?
> 
> My best guess is that you would want a separate counter for that. The old
> one was just badly named ...
> 
> 72403b4a0fbd even spells out "NUMA huge PMD updates".
> 
> 
> "NUMA huge PMD updates were the number of THP  updates which in combination
> can be used to calculate how many ptes were updated from userspace."
> 
> ... which doesn't make sense if you don't know how "huge" the huge actually
> was. :)
> 
> > 
> > The motivation I had this patch in this series is I want to be clear on how
> > I should treat this counter in pud path if it won't go.  And when people
> > compare the two paths we'll need to be clear why there's such difference if
> > I ignore it in pud path.
> > 
> > Per my current read on this counter, it might be an overkill to do that at
> > all, and it might be simpler we drop it now.
> 
> Fine with me. But I would send that out separately, not buried in this
> series. The we might actually get Mel to review (was he CCed?).

Yes he is.

Fair point, let's do this separately. It's just that when split I don't
feel strongly to push that patch alone..  no reason for me to push dropping
a counter that maybe some people can still use even if I don't.  More
important to me is how I should move on with PUD, then at least this is
fully discussed and ignoring is the option I'm ok.

I'll respin with this patch dropped as of now, then I'll add a comment in
the PUD patch mention this counter is ignored.

Thanks,

-- 
Peter Xu

