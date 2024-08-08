Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1501E94C676
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 23:48:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fMmTWglI;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fMmTWglI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wg0zL733bz2xjL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 07:48:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fMmTWglI;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fMmTWglI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wg0yg476pz2xfT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 07:47:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723153671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y4cQ3dGvl+e98q+IJj301khv7EGPDrAUXWE89nsHh7w=;
	b=fMmTWglIu/fehKMmR18U820CqEY0EUkJ2/NAt0Rq3I1UUyCQX3DjC6NXz4jqCKjGxfn/BE
	BfkVzFAr51ei61I/Nsc7pd9FtUy5Kyop1D2vWkqYhSMXBU7xXNTgNzO9MkNJTII7Mxp6Mt
	0PNYG1doRjTCQAfFf4BQuwp4nXmpwXA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723153671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y4cQ3dGvl+e98q+IJj301khv7EGPDrAUXWE89nsHh7w=;
	b=fMmTWglIu/fehKMmR18U820CqEY0EUkJ2/NAt0Rq3I1UUyCQX3DjC6NXz4jqCKjGxfn/BE
	BfkVzFAr51ei61I/Nsc7pd9FtUy5Kyop1D2vWkqYhSMXBU7xXNTgNzO9MkNJTII7Mxp6Mt
	0PNYG1doRjTCQAfFf4BQuwp4nXmpwXA=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-SEqUL-LcP-iIEh2mZ0ZsBA-1; Thu, 08 Aug 2024 17:47:49 -0400
X-MC-Unique: SEqUL-LcP-iIEh2mZ0ZsBA-1
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-839d660d069so72966241.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2024 14:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723153669; x=1723758469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4cQ3dGvl+e98q+IJj301khv7EGPDrAUXWE89nsHh7w=;
        b=flfTDYQCig8cr5qC82mMuStcOXTxI5cD7blT+jmTl4WO6oIM30VOm6VDEl8rl2MR5S
         FWGAraJwdCxn8hMTyuTTZDLeK783poXXKfE9yb88nZORB0FdyMStX+gLZ9lgDUF8pjsl
         mB7he5I99S2ddbMbno1pPxPbtlKRh/KfOVfr2TpMrcOJSW60TgM8JNaKhfv7tSk/bARS
         LGkc3uwcx/tu2MKCGCPmVTAS3zN7RINX7iEl7MtHcn9aeMAg1rKBC4rPcd3nJOu9UZZG
         xoNRjrhS2IaE74dS8/9ZO8GgEYJxxcydrmEP7UOG/ydXP7Iyqwf0iLahAGiYrQE7i0GR
         76+g==
X-Forwarded-Encrypted: i=1; AJvYcCVEbIY3zos1cfXA0k5QpVQd8JSyjMuptGqIeIpZT/0WnWoP7axHUns3gMP5lKtbuky+YQUv/8q9AXVH4eIlADvRkcgirlJACA8fiuiCGQ==
X-Gm-Message-State: AOJu0YwWdbRzAH7ANglazvp8zNCumMNCBX4SuMpxWf+wgfBVXr5J/opa
	TTqhhGsWsT+7o+GVRzZK+d9f+rZhYOj/cRKG1SuPgQ+YY+8yAyBQdINyAvbF51GgROo4FUxiE7Y
	USNaciYO0036xdR4UF0g9YMwhHNo8McMOKRvFz11tK0oT5Ix5hOomcsL2rpUXtdc=
X-Received: by 2002:a05:6122:1696:b0:4f4:959b:8342 with SMTP id 71dfb90a1353d-4f9028ededfmr2281583e0c.2.1723153669040;
        Thu, 08 Aug 2024 14:47:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBUCPV/3BJaIuZdMerz+8wpoNJAPGodVbwYONTfq25mwe5QVB/HX82z8YwrBUiUNO7Dj9CXg==
X-Received: by 2002:a05:6122:1696:b0:4f4:959b:8342 with SMTP id 71dfb90a1353d-4f9028ededfmr2281559e0c.2.1723153668575;
        Thu, 08 Aug 2024 14:47:48 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a3785e13fdsm198784985a.34.2024.08.08.14.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 14:47:48 -0700 (PDT)
Date: Thu, 8 Aug 2024 17:47:44 -0400
From: Peter Xu <peterx@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v4 2/7] mm/mprotect: Push mmu notifier to PUDs
Message-ID: <ZrU9AJi7-pHT_UWS@x1n>
References: <20240807194812.819412-1-peterx@redhat.com>
 <20240807194812.819412-3-peterx@redhat.com>
 <ZrTlZ4vZ74sK8Ydd@google.com>
 <ZrU20AqADICwwmCy@x1n>
 <ZrU5JyjIa1CwZ_KD@google.com>
MIME-Version: 1.0
In-Reply-To: <ZrU5JyjIa1CwZ_KD@google.com>
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
Cc: James Houghton <jthoughton@google.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, David Rientjes <rientjes@google.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 08, 2024 at 02:31:19PM -0700, Sean Christopherson wrote:
> On Thu, Aug 08, 2024, Peter Xu wrote:
> > Hi, Sean,
> > 
> > On Thu, Aug 08, 2024 at 08:33:59AM -0700, Sean Christopherson wrote:
> > > On Wed, Aug 07, 2024, Peter Xu wrote:
> > > > mprotect() does mmu notifiers in PMD levels.  It's there since 2014 of
> > > > commit a5338093bfb4 ("mm: move mmu notifier call from change_protection to
> > > > change_pmd_range").
> > > > 
> > > > At that time, the issue was that NUMA balancing can be applied on a huge
> > > > range of VM memory, even if nothing was populated.  The notification can be
> > > > avoided in this case if no valid pmd detected, which includes either THP or
> > > > a PTE pgtable page.
> > > > 
> > > > Now to pave way for PUD handling, this isn't enough.  We need to generate
> > > > mmu notifications even on PUD entries properly.  mprotect() is currently
> > > > broken on PUD (e.g., one can easily trigger kernel error with dax 1G
> > > > mappings already), this is the start to fix it.
> > > > 
> > > > To fix that, this patch proposes to push such notifications to the PUD
> > > > layers.
> > > > 
> > > > There is risk on regressing the problem Rik wanted to resolve before, but I
> > > > think it shouldn't really happen, and I still chose this solution because
> > > > of a few reasons:
> > > > 
> > > >   1) Consider a large VM that should definitely contain more than GBs of
> > > >   memory, it's highly likely that PUDs are also none.  In this case there
> > > 
> > > I don't follow this.  Did you mean to say it's highly likely that PUDs are *NOT*
> > > none?
> > 
> > I did mean the original wordings.
> > 
> > Note that in the previous case Rik worked on, it's about a mostly empty VM
> > got NUMA hint applied.  So I did mean "PUDs are also none" here, with the
> > hope that when the numa hint applies on any part of the unpopulated guest
> > memory, it'll find nothing in PUDs. Here it's mostly not about a huge PUD
> > mapping as long as the guest memory is not backed by DAX (since only DAX
> > supports 1G huge pud so far, while hugetlb has its own path here in
> > mprotect, so it must be things like anon or shmem), but a PUD entry that
> > contains pmd pgtables.  For that part, I was trying to justify "no pmd
> > pgtable installed" with the fact that "a large VM that should definitely
> > contain more than GBs of memory", it means the PUD range should hopefully
> > never been accessed, so even the pmd pgtable entry should be missing.
> 
> Ah, now I get what you were saying.
> 
> Problem is, walking the rmaps for the shadow MMU doesn't benefit (much) from
> empty PUDs, because KVM needs to blindly walk the rmaps for every gfn covered by
> the PUD to see if there are any SPTEs in any shadow MMUs mapping that gfn.  And
> that walk is done without ever yielding, which I suspect is the source of the
> soft lockups of yore.
> 
> And there's no way around that conundrum (walking rmaps), at least not without a
> major rewrite in KVM.  In a nested TDP scenario, KVM's stage-2 page tables (for
> L2) key off of L2 gfns, not L1 gfns, and so the only way to find mappings is
> through the rmaps.

I think the hope here is when the whole PUDs being hinted are empty without
pgtable installed, there'll be no mmu notifier to be kicked off at all.

To be explicit, I meant after this patch applied, the pud loop for numa
hints look like this:

        FOR_EACH_PUD() {
                ...
                if (pud_none(pud))
                        continue;

                if (!range.start) {
                        mmu_notifier_range_init(&range,
                                                MMU_NOTIFY_PROTECTION_VMA, 0,
                                                vma->vm_mm, addr, end);
                        mmu_notifier_invalidate_range_start(&range);
                }
                ...
        }

So the hope is that pud_none() is always true for the hinted area (just
like it used to be when pmd_none() can be hopefully true always), then we
skip the mmu notifier as a whole (including KVM's)!

Thanks,

-- 
Peter Xu

