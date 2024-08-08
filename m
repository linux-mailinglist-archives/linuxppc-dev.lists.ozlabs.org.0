Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F7F94C642
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 23:22:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eH3c45AG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KVO7WLvV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wg0Nr6Rv8z2yGk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 07:22:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eH3c45AG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KVO7WLvV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wg0N95gzHz2xG5
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 07:21:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723152086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=646kYxDCmIPDI121m97IwwsmhjY653tF83ZSDiyw6zM=;
	b=eH3c45AGdMlHVvGGkhpcdVTzzrjgW1pwJBdrhrjqJZSgr/r9lb3l9r4r4yvi97EXZCo1sG
	xNQ98uZv1gnqifnVcSDIeBbuceMkr/LDjk4lhR4qwarzAfaxJiVu7xWu1ha+8kPmqIGM5m
	YLV7oUdPR+5zNAyZTlKOniryQvwWlzk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723152087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=646kYxDCmIPDI121m97IwwsmhjY653tF83ZSDiyw6zM=;
	b=KVO7WLvVt39aM28QJFWE3s3WV1ZyTdISfKsRBKHnxxXPmwdFU2TFpoYrrvZ21UIDiC3/bf
	cZvoPAwmZj9MR1cwiHFwmXPh1dfTViEmA4vQOnEfCDpRUlKYjENCz92p7cB31R1+Tlm4Ry
	3x0eIoOeRyqUiWnZ6n+TJ0r2+kWaZ3s=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-p77tkqzqPFmTFOTi6mIQYg-1; Thu, 08 Aug 2024 17:21:25 -0400
X-MC-Unique: p77tkqzqPFmTFOTi6mIQYg-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6b79ccc1504so2105546d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2024 14:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723152085; x=1723756885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=646kYxDCmIPDI121m97IwwsmhjY653tF83ZSDiyw6zM=;
        b=olBb6/YZR/wgpbN1oy/+1vqZa3PY+NsHOW6KpYmhhpCDQZZuFurG0eIhaaaH9HdOBm
         Vb5lNnPzBGgbL6Q9+R2uJLxlxSSGd370Bff2MNlLYtyv56wOq57duOEWx891RblJIACe
         ASwPfAx1/zdaqXATN7afn6H3woyVZvdmioBbBZSrcuVXCG1MTL8aNoJlYjgmUMKTGG1f
         q0T2B9cROFGAVkEZ2yY6W0s8YJdRuZgBZ1+0sZtnSXtguN/wfzIsPG7cduuYQXrG2U6i
         yCXWkSqGmRsjo8oGyoDXU67Gxy8MiW3zIzIxn1LcrqKKeOTUX9JcSW/fTY5vYWcADlkA
         PNVA==
X-Forwarded-Encrypted: i=1; AJvYcCXx62DV6ECtZdMd6caFLW+sPpfhP7y7ab5ZntmuwIxmGvjvmja3ubtkpFs7T4atKYwj9zUgioiaCmt6sUKTbhWuvei9/lqEFJCXOBSl3A==
X-Gm-Message-State: AOJu0Yxo4yNtQel5Yk1dBUcNpdCg48XsLIoY3umPD/PsVV36hg0NJqJV
	3ajb+/9OEvkLNtoKkgwNghJ4kVFiUfYOoE0/858eUkOMyfWdvD0lDf3P7sMeijTz+s20ufZnwtT
	LLJf4N/9gHIJtPc6skawN3Ul+33B+SD2wz1NA1J6ffpYPNsqxe2c3utS/Wfj1PdM=
X-Received: by 2002:a05:6214:e48:b0:6b7:586c:2cf9 with SMTP id 6a1803df08f44-6bd6bda328fmr22227706d6.8.1723152084729;
        Thu, 08 Aug 2024 14:21:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfLm9br531QtX5McSAepTFClX/i/YyLNfV9BZkuLTVq/qPkXnmRVEyjeA/AUTE6Y8mdpCcjg==
X-Received: by 2002:a05:6214:e48:b0:6b7:586c:2cf9 with SMTP id 6a1803df08f44-6bd6bda328fmr22227426d6.8.1723152084258;
        Thu, 08 Aug 2024 14:21:24 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c797dbdsm70021666d6.52.2024.08.08.14.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 14:21:23 -0700 (PDT)
Date: Thu, 8 Aug 2024 17:21:20 -0400
From: Peter Xu <peterx@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v4 2/7] mm/mprotect: Push mmu notifier to PUDs
Message-ID: <ZrU20AqADICwwmCy@x1n>
References: <20240807194812.819412-1-peterx@redhat.com>
 <20240807194812.819412-3-peterx@redhat.com>
 <ZrTlZ4vZ74sK8Ydd@google.com>
MIME-Version: 1.0
In-Reply-To: <ZrTlZ4vZ74sK8Ydd@google.com>
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

Hi, Sean,

On Thu, Aug 08, 2024 at 08:33:59AM -0700, Sean Christopherson wrote:
> On Wed, Aug 07, 2024, Peter Xu wrote:
> > mprotect() does mmu notifiers in PMD levels.  It's there since 2014 of
> > commit a5338093bfb4 ("mm: move mmu notifier call from change_protection to
> > change_pmd_range").
> > 
> > At that time, the issue was that NUMA balancing can be applied on a huge
> > range of VM memory, even if nothing was populated.  The notification can be
> > avoided in this case if no valid pmd detected, which includes either THP or
> > a PTE pgtable page.
> > 
> > Now to pave way for PUD handling, this isn't enough.  We need to generate
> > mmu notifications even on PUD entries properly.  mprotect() is currently
> > broken on PUD (e.g., one can easily trigger kernel error with dax 1G
> > mappings already), this is the start to fix it.
> > 
> > To fix that, this patch proposes to push such notifications to the PUD
> > layers.
> > 
> > There is risk on regressing the problem Rik wanted to resolve before, but I
> > think it shouldn't really happen, and I still chose this solution because
> > of a few reasons:
> > 
> >   1) Consider a large VM that should definitely contain more than GBs of
> >   memory, it's highly likely that PUDs are also none.  In this case there
> 
> I don't follow this.  Did you mean to say it's highly likely that PUDs are *NOT*
> none?

I did mean the original wordings.

Note that in the previous case Rik worked on, it's about a mostly empty VM
got NUMA hint applied.  So I did mean "PUDs are also none" here, with the
hope that when the numa hint applies on any part of the unpopulated guest
memory, it'll find nothing in PUDs. Here it's mostly not about a huge PUD
mapping as long as the guest memory is not backed by DAX (since only DAX
supports 1G huge pud so far, while hugetlb has its own path here in
mprotect, so it must be things like anon or shmem), but a PUD entry that
contains pmd pgtables.  For that part, I was trying to justify "no pmd
pgtable installed" with the fact that "a large VM that should definitely
contain more than GBs of memory", it means the PUD range should hopefully
never been accessed, so even the pmd pgtable entry should be missing.

With that, we should hopefully keep avoiding mmu notifications after this
patch, just like it used to be when done in pmd layers.

> 
> >   will have no regression.
> > 
> >   2) KVM has evolved a lot over the years to get rid of rmap walks, which
> >   might be the major cause of the previous soft-lockup.  At least TDP MMU
> >   already got rid of rmap as long as not nested (which should be the major
> >   use case, IIUC), then the TDP MMU pgtable walker will simply see empty VM
> >   pgtable (e.g. EPT on x86), the invalidation of a full empty region in
> >   most cases could be pretty fast now, comparing to 2014.
> 
> The TDP MMU will indeed be a-ok.  It only zaps leaf SPTEs in response to
> mmu_notifier invalidations, and checks NEED_RESCHED after processing each SPTE,
> i.e. KVM won't zap an entire PUD and get stuck processing all its children.
> 
> I doubt the shadow MMU will fair much better than it did years ago though, AFAICT
> the relevant code hasn't changed.  E.g. when zapping a large range in response to
> an mmu_notifier invalidation, KVM never yields even if blocking is allowed.  That 
> said, it is stupidly easy to fix the soft lockup problem in the shadow MMU.  KVM
> already has an rmap walk path that plays nice with NEED_RESCHED *and* zaps rmaps,
> but because of how things grew organically over the years, KVM never adopted the
> cond_resched() logic for the mmu_notifier path.
> 
> As a bonus, now the .change_pte() is gone, the only other usage of x86's
> kvm_handle_gfn_range() is for the aging mmu_notifiers, and I want to move those
> to their own flow too[*], i.e. kvm_handle_gfn_range() in its current form can
> be removed entirely.
> 
> I'll post a separate series, I don't think it needs to block this work, and I'm
> fairly certain I can get this done for 6.12 (shouldn't be a large or scary series,
> though I may tack on my lockless aging idea as an RFC).

Great, and thanks for all these information! Glad to know.

I guess it makes me feel more confident that this patch shouldn't have any
major side effect at least on KVM side.

Thanks,

> 
> https://lore.kernel.org/all/Zo137P7BFSxAutL2@google.com
> 

-- 
Peter Xu

