Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2585368C8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 00:27:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8zv00BHvz3c8W
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 08:27:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WIfUgyR3;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HQ26E/8H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WIfUgyR3;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HQ26E/8H;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8mPX1MKwz3bjM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 23:49:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653659352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u3wM6LMtd0WRKF0TJX2qWAIusndSWh4uKD1DEnhNev8=;
	b=WIfUgyR3uI44SncvgBDlloIPoiJ4oXFvi9DEgchlJnH8B6ElLV28aWiCXlx8I+6a+Z4vaF
	LFU9xvV+BoUctq7RW0jtgPCK5pygZEAMbz7NO/ATulJonl2lmngzyy4++phiD6DrwfWiTG
	9/0IKLhjzZbwABUmolaMt2lmreFZbhM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653659353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u3wM6LMtd0WRKF0TJX2qWAIusndSWh4uKD1DEnhNev8=;
	b=HQ26E/8HE7O/HRA1lyEaJHfmaroRGyQP8JKqOBfQQKAPspEDD1GBZDax+Uw8b7AqZCf8+b
	DUZ/A8rpcQ78fWynizmogQZq65+tMQf6t6fpgNGKTd8QDdK92gTRvwHPsWlKzBtSGcrAfb
	sQ6+snXta8+QlnEZme4oMg46TsbQ9fk=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-f4CZ58xsOMWOwWkntkwn1g-1; Fri, 27 May 2022 09:49:08 -0400
X-MC-Unique: f4CZ58xsOMWOwWkntkwn1g-1
Received: by mail-il1-f197.google.com with SMTP id i9-20020a056e021d0900b002d1f6f8960aso2926566ila.9
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 06:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u3wM6LMtd0WRKF0TJX2qWAIusndSWh4uKD1DEnhNev8=;
        b=75YSpcavvELBPLBvQxS9w2G6xk5IyoF8tUW7kdixDusy9SWQ5ndnMs0h9/JnJbOh0V
         ajNTPvQpgRB4vYqMcF2I930+6ZVb4PMxII0xBtm6oRncAUJEr548GBmRc/qUsjwuvClh
         tYfwVQqqKs2HCzLSZu49hmIWp89Tba6IoT3TU2pdozRMp4zmtkDrpbwSrPp9Lwx03gxM
         IXt8Fbx2BCg7o6K61tVI56bIgLPjdrhBRju/47hWLNhdTKEGVpMnvkxI2xijratw8La/
         ndwzrlvbW9jgzN7AXrj8BFen4i2EjlNEvKxnfaNm1vIKyD17R36OcEsjSM/qZG2Xpps2
         8RSg==
X-Gm-Message-State: AOAM533sF3f7+7H45p37wFPPu/kuLNIipblTILLyhTYOcPfr/9XRCa5f
	YGbuSTW4UuLlrTwldfYNH6SrxQGU83hUSSabqfHKB6bG9UtwrPhbyG23vV31+7wcxKYA0ymPM4K
	f/LEjjvMg50xPQ2hV7Si6g03eAQ==
X-Received: by 2002:a05:6602:1584:b0:664:ab0f:5339 with SMTP id e4-20020a056602158400b00664ab0f5339mr10502586iow.146.1653659347417;
        Fri, 27 May 2022 06:49:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCqN3qwLLuYZMqrMI7aGsb6Zn5OHs31WIJQ3aUgDc8PhP19ReX/GZlaKbEBJ1PdD9YunS6AA==
X-Received: by 2002:a05:6602:1584:b0:664:ab0f:5339 with SMTP id e4-20020a056602158400b00664ab0f5339mr10502527iow.146.1653659347005;
        Fri, 27 May 2022 06:49:07 -0700 (PDT)
Received: from xz-m1.local (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
        by smtp.gmail.com with ESMTPSA id x25-20020a029719000000b0032b3a7817d6sm563254jai.154.2022.05.27.06.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 06:49:06 -0700 (PDT)
Date: Fri, 27 May 2022 09:49:01 -0400
From: Peter Xu <peterx@redhat.com>
To: Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [PATCH v3] mm: Avoid unnecessary page fault retires on shared
 memory types
Message-ID: <YpDWzX8dyh1259Mo@xz-m1.local>
References: <20220524234531.1949-1-peterx@redhat.com>
 <YpDCzvLER9AYJJc8@osiris>
MIME-Version: 1.0
In-Reply-To: <YpDCzvLER9AYJJc8@osiris>
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
Cc: x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, Rich Felker <dalias@libc.org>, Paul Mackerras <paulus@samba.org>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-ia64@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Janosch Frank <frankja@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, linux-csky
 @vger.kernel.org, linux-alpha@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>, Stafford Horne <shorne@gmail.com>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Andrea Arcangeli <aarcange@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Brian Cain <bcain@quicinc.com>, linux-xtensa@linux-xtensa.org, Johannes Weiner <hannes@cmpxchg.org>, linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil 
 Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddl

e.net>, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Guo Ren <guoren@kernel.org>, Borislav Petkov <bp@alien8.de>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, Heiko,

On Fri, May 27, 2022 at 02:23:42PM +0200, Heiko Carstens wrote:
> On Tue, May 24, 2022 at 07:45:31PM -0400, Peter Xu wrote:
> > I observed that for each of the shared file-backed page faults, we're very
> > likely to retry one more time for the 1st write fault upon no page.  It's
> > because we'll need to release the mmap lock for dirty rate limit purpose
> > with balance_dirty_pages_ratelimited() (in fault_dirty_shared_page()).
> > 
> > Then after that throttling we return VM_FAULT_RETRY.
> > 
> > We did that probably because VM_FAULT_RETRY is the only way we can return
> > to the fault handler at that time telling it we've released the mmap lock.
> > 
> > However that's not ideal because it's very likely the fault does not need
> > to be retried at all since the pgtable was well installed before the
> > throttling, so the next continuous fault (including taking mmap read lock,
> > walk the pgtable, etc.) could be in most cases unnecessary.
> > 
> > It's not only slowing down page faults for shared file-backed, but also add
> > more mmap lock contention which is in most cases not needed at all.
> > 
> > To observe this, one could try to write to some shmem page and look at
> > "pgfault" value in /proc/vmstat, then we should expect 2 counts for each
> > shmem write simply because we retried, and vm event "pgfault" will capture
> > that.
> > 
> > To make it more efficient, add a new VM_FAULT_COMPLETED return code just to
> > show that we've completed the whole fault and released the lock.  It's also
> > a hint that we should very possibly not need another fault immediately on
> > this page because we've just completed it.
> > 
> > This patch provides a ~12% perf boost on my aarch64 test VM with a simple
> > program sequentially dirtying 400MB shmem file being mmap()ed and these are
> > the time it needs:
> > 
> >   Before: 650.980 ms (+-1.94%)
> >   After:  569.396 ms (+-1.38%)
> > 
> > I believe it could help more than that.
> > 
> > We need some special care on GUP and the s390 pgfault handler (for gmap
> > code before returning from pgfault), the rest changes in the page fault
> > handlers should be relatively straightforward.
> > 
> > Another thing to mention is that mm_account_fault() does take this new
> > fault as a generic fault to be accounted, unlike VM_FAULT_RETRY.
> > 
> > I explicitly didn't touch hmm_vma_fault() and break_ksm() because they do
> > not handle VM_FAULT_RETRY even with existing code, so I'm literally keeping
> > them as-is.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> ...
> > diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
> > index e173b6187ad5..9503a7cfaf03 100644
> > --- a/arch/s390/mm/fault.c
> > +++ b/arch/s390/mm/fault.c
> > @@ -339,6 +339,7 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
> >  	unsigned long address;
> >  	unsigned int flags;
> >  	vm_fault_t fault;
> > +	bool need_unlock = true;
> >  	bool is_write;
> >  
> >  	tsk = current;
> > @@ -433,6 +434,13 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
> >  			goto out_up;
> >  		goto out;
> >  	}
> > +
> > +	/* The fault is fully completed (including releasing mmap lock) */
> > +	if (fault & VM_FAULT_COMPLETED) {
> > +		need_unlock = false;
> > +		goto out_gmap;
> > +	}
> > +
> >  	if (unlikely(fault & VM_FAULT_ERROR))
> >  		goto out_up;
> >  
> > @@ -452,6 +460,7 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
> >  		mmap_read_lock(mm);
> >  		goto retry;
> >  	}
> > +out_gmap:
> >  	if (IS_ENABLED(CONFIG_PGSTE) && gmap) {
> >  		address =  __gmap_link(gmap, current->thread.gmap_addr,
> >  				       address);
> > @@ -466,7 +475,8 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
> >  	}
> >  	fault = 0;
> >  out_up:
> > -	mmap_read_unlock(mm);
> > +	if (need_unlock)
> > +		mmap_read_unlock(mm);
> >  out:
> 
> This seems to be incorrect. __gmap_link() requires the mmap_lock to be
> held. Christian, Janosch, or David, could you please check?

Thanks for pointing that out.  Indeed I see the clue right above the
comment of __gmap_link():

/*
 * ...
 * The mmap_lock of the mm that belongs to the address space must be held
 * when this function gets called.
 */
int __gmap_link(struct gmap *gmap, unsigned long gaddr, unsigned long vmaddr)

A further fact is it'll walk the pgtable right afterwards, assuming
gmap->mm will definitely be the current mm or it'll definitely go wrong.

I'll change s390 to retake the lock with the new COMPLETE retcode, so at
least it'll avoid one pgtable work procedure even if the lock overhead was
kept.

With that, one more possible further optimization for s390 only will be
conditionally not taking that lock when !CONFIG_PGSTE, but I have totally
no idea whether that'll be a common use case, so I plan to leave that for
later in all cases.

Actually after doing that the whole changeset of s390 is even more
straightforward:

---8<---
diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
index e173b6187ad5..4608cc962ecf 100644
--- a/arch/s390/mm/fault.c
+++ b/arch/s390/mm/fault.c
@@ -433,6 +433,17 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
                        goto out_up;
                goto out;
        }
+
+       /* The fault is fully completed (including releasing mmap lock) */
+       if (fault & VM_FAULT_COMPLETED) {
+               /*
+                * Gmap will need the mmap lock again, so retake it.  TODO:
+                * only conditionally take the lock when CONFIG_PGSTE set.
+                */
+               mmap_read_lock(mm);
+               goto out_gmap;
+       }
+
        if (unlikely(fault & VM_FAULT_ERROR))
                goto out_up;
 
@@ -452,6 +463,7 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
                mmap_read_lock(mm);
                goto retry;
        }
+out_gmap:
        if (IS_ENABLED(CONFIG_PGSTE) && gmap) {
                address =  __gmap_link(gmap, current->thread.gmap_addr,
                                       address);
---8<---

Thanks,

-- 
Peter Xu

