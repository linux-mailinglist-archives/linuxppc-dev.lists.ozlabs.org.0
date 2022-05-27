Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8909D5368C9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 00:27:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8zvk3DyKz3cjG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 08:27:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZUWXkMma;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZUWXkMma;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZUWXkMma;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZUWXkMma;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8nqz71Z7z3bNk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 00:53:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653663225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uLEQbfXieXddbws3ZtMPUo3kSGjUH1tIUFKal4fFd0k=;
	b=ZUWXkMmaLR/WV6SaN23An4IjuzAIza1QX1t8JzsMALCVYB77n5xLXUBVTeDmXG4i9Rz8In
	93SdTNCn3lvYQKzM1zI+gr5m3+U3u6Q3xuOoj9aE3GpQX8tvfmVao021lGneA/iU37e0Wi
	G7M7d7KrJBIJ1UlhRAr3ZuYKmDOg12A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653663225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uLEQbfXieXddbws3ZtMPUo3kSGjUH1tIUFKal4fFd0k=;
	b=ZUWXkMmaLR/WV6SaN23An4IjuzAIza1QX1t8JzsMALCVYB77n5xLXUBVTeDmXG4i9Rz8In
	93SdTNCn3lvYQKzM1zI+gr5m3+U3u6Q3xuOoj9aE3GpQX8tvfmVao021lGneA/iU37e0Wi
	G7M7d7KrJBIJ1UlhRAr3ZuYKmDOg12A=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-_R4PRIgzMd2vhXDKeuKxjg-1; Fri, 27 May 2022 10:53:44 -0400
X-MC-Unique: _R4PRIgzMd2vhXDKeuKxjg-1
Received: by mail-io1-f71.google.com with SMTP id z19-20020a05660200d300b0066583f8cf2eso2922573ioe.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 07:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uLEQbfXieXddbws3ZtMPUo3kSGjUH1tIUFKal4fFd0k=;
        b=nb7ptcH25tU8nX8PjO4Vxp4bM6hEDzj86jeBNKlcmF9zQJhH4p3FhqScXF2VncrI1W
         EqBt2ZO+eqO3FWnxaZwR2Y86qHW+hqZSz9FhFvUwgTenPp3iyMkyMTcoV3VOK76Amgam
         uH34TdRxqXvKIeOzN6PiUvZMgik9c03/DUJezgH8N4evvLiYEVhS6/4ip+TzjoOsoqL4
         P3xj1hmUXD6raxQqbyXMQQNeWxN6klOxg3XnDBL1NG4v/18c/+bdulGL0DTmQIylPdDc
         b5e7ZZwLqg4tZRQiju8Lemi4lDVAEKCJeYGaxs8dC/8eS+pSwuUz0g3iFKrGNRsBGbw7
         lvJg==
X-Gm-Message-State: AOAM532Mj4r7uGxPoz5OMQhswHlCw0ehYpeBMmHsW91q7qzI3EHg7N0W
	NnLoKymzCL0VZAQcl174ADnigBNAnvD3gMhnaqsIhwPq9u9pvhUlBVTaLFojHhm5idgzqYty4RX
	Dj0W6IkMWC/iCMCYVfdVT82jiCw==
X-Received: by 2002:a05:6e02:1a61:b0:2cf:8a90:7396 with SMTP id w1-20020a056e021a6100b002cf8a907396mr22761923ilv.256.1653663223402;
        Fri, 27 May 2022 07:53:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxG97+4KBIU6l93iytV0+qRm43dQQLHa2a/K8HbhfEtxo7G4J9rDpss95rHRYaCYZkQNmDyjQ==
X-Received: by 2002:a05:6e02:1a61:b0:2cf:8a90:7396 with SMTP id w1-20020a056e021a6100b002cf8a907396mr22761868ilv.256.1653663222806;
        Fri, 27 May 2022 07:53:42 -0700 (PDT)
Received: from xz-m1.local (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
        by smtp.gmail.com with ESMTPSA id d6-20020a023f06000000b00330efaf1161sm596380jaa.148.2022.05.27.07.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 07:53:42 -0700 (PDT)
Date: Fri, 27 May 2022 10:53:36 -0400
From: Peter Xu <peterx@redhat.com>
To: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v3] mm: Avoid unnecessary page fault retires on shared
 memory types
Message-ID: <YpDl8IM0FF6GeJ4B@xz-m1.local>
References: <20220524234531.1949-1-peterx@redhat.com>
 <YpCsBwFArieTpvg2@gmail.com>
MIME-Version: 1.0
In-Reply-To: <YpCsBwFArieTpvg2@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Mailman-Approved-At: Sat, 28 May 2022 08:25:59 +1000
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
Cc: x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, Rich Felker <dalias@libc.org>, Paul Mackerras <paulus@samba.org>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-ia64@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-xtensa@linux-xtensa.org, linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, linux-sh@vger.ke
 rnel.org, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>, Stafford Horne <shorne@gmail.com>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Andrea Arcangeli <aarcange@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Brian Cain <bcain@quicinc.com>, Heiko Carstens <hca@linux.ibm.com>, Johannes Weiner <hannes@cmpxchg.org>, linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Bab
 ka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.n

et>, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Guo Ren <guoren@kernel.org>, Borislav Petkov <bp@alien8.de>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 27, 2022 at 12:46:31PM +0200, Ingo Molnar wrote:
> 
> * Peter Xu <peterx@redhat.com> wrote:
> 
> > This patch provides a ~12% perf boost on my aarch64 test VM with a simple
> > program sequentially dirtying 400MB shmem file being mmap()ed and these are
> > the time it needs:
> >
> >   Before: 650.980 ms (+-1.94%)
> >   After:  569.396 ms (+-1.38%)
> 
> Nice!
> 
> >  arch/x86/mm/fault.c           |  4 ++++
> 
> Reviewed-by: Ingo Molnar <mingo@kernel.org>
> 
> Minor comment typo:
> 
> > +		/*
> > +		 * We should do the same as VM_FAULT_RETRY, but let's not
> > +		 * return -EBUSY since that's not reflecting the reality on
> > +		 * what has happened - we've just fully completed a page
> > +		 * fault, with the mmap lock released.  Use -EAGAIN to show
> > +		 * that we want to take the mmap lock _again_.
> > +		 */
> 
> s/reflecting the reality on what has happened
>  /reflecting the reality of what has happened

Will fix.

> 
> >  	ret = handle_mm_fault(vma, address, fault_flags, NULL);
> > +
> > +	if (ret & VM_FAULT_COMPLETED) {
> > +		/*
> > +		 * NOTE: it's a pity that we need to retake the lock here
> > +		 * to pair with the unlock() in the callers. Ideally we
> > +		 * could tell the callers so they do not need to unlock.
> > +		 */
> > +		mmap_read_lock(mm);
> > +		*unlocked = true;
> > +		return 0;
> 
> Indeed that's a pity - I guess more performance could be gained here, 
> especially in highly parallel threaded workloads?

Yes I think so.

The patch avoids the page fault retry, including the mmap lock/unlock side.
Now if we retake the lock for fixup_user_fault() we still safe time for
pgtable walks but the lock overhead will be somehow kept, just with smaller
critical sections.

Some fixup_user_fault() callers won't be affected as long as unlocked==NULL
is passed - e.g. the futex code path (fault_in_user_writeable).  After all
they never needed to retake the lock before/after this patch.

It's about the other callers, and they may need some more touch-ups case by
case.  Examples are follow_fault_pfn() in vfio and hva_to_pfn_remapped() in
KVM: both of them returns -EAGAIN when *unlocked==true.  We need to teach
them to know "*unlocked==true" does not necessarily mean a retry attempt.

I think I can look into them if this patch can be accepted as a follow up.

Thanks for taking a look!

-- 
Peter Xu

