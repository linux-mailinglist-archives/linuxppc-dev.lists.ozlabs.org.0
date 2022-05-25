Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 643FB534876
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 03:57:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7rfd4Klbz3bvZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 11:57:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=cmpxchg-org.20210112.gappssmtp.com header.i=@cmpxchg-org.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=LMEKNyEI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cmpxchg.org (client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com; envelope-from=hannes@cmpxchg.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cmpxchg-org.20210112.gappssmtp.com header.i=@cmpxchg-org.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=LMEKNyEI;
	dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L7W3b5H3jz2yb6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 22:44:24 +1000 (AEST)
Received: by mail-qk1-x734.google.com with SMTP id v11so17212111qkf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 05:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w0F6iR9EKs/zIprBUHWYk0xdfCPICb6b6FOC3ooI/Qg=;
        b=LMEKNyEIRYPV5QWJlwplZCx+Yze+80z3MALcLFPz5jKdddgbR28N/X6bo9Jvgd00MP
         WWkcUcb1+z91voFM8WjtduJpm5pvevvusNqH0PzjaxsPqwHpEmvLG6H17fO8d+8uqQ/c
         xW/rbo+trH8MjL1X/foXOCmesnHHx99Tmug43Nb91EXZFTR7KAdlglnJRYtL1NUTbXz5
         2CGVavB8u5eJ5bdNx8JVu0TNi6KB2NiCnWSVtKfIEdRU3i4wp/Kah2nDHcLAJXmplYfJ
         xzofRGg4rofGSre9mJv/qm1XS4Pms5gIR+r4L8hjS8Owdd3qkT56i/sicOD/din7w+oO
         VJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w0F6iR9EKs/zIprBUHWYk0xdfCPICb6b6FOC3ooI/Qg=;
        b=ekKQSyGANCj9SdC/iari6IhJIihW0OT8xafQlJx3Laf7/HdojPZZ34q4TXAgtTCM4L
         zB07ac9AyZPg2Lh7Rg3EBHi8gKbp62NpU2WumGy7feRILQszEsZwxNDwkBw4tTTyIIU3
         HH8b3WVvHVU3IKCSOXckRKIv3rpEOKfbtx4LBxP3oRTukoXqXEiR3Jzg6R6pytfcXrVy
         SdD89Zmqr+4f/lBC34apTxoOcGyYRUidNuQKZCnwATdhAtaq6wg2Ij9PfEjvTjIwN7p5
         n0Gjel7HpLXNVA6jHXCX9JfWB7bisTf4GqnK+8m86RoIiD1NfNMnmnvnpKZ6G5pPZ2DE
         BoLw==
X-Gm-Message-State: AOAM532eVl90gc0wR9nB1t5ljBdO1IqsVV/UTUqLaH0AEsDUBxP1brfH
	Petl3VzOY+c14rRemrjr28symg==
X-Google-Smtp-Source: ABdhPJx/POKWSCbmzd2neCxXDwISwEb1wGzjcuEavupLeI/smDQTCNVGAU9PwpCoNv+A6qxiW2wj4Q==
X-Received: by 2002:a05:620a:4047:b0:6a0:5dae:ad67 with SMTP id i7-20020a05620a404700b006a05daead67mr19946570qko.530.1653482659851;
        Wed, 25 May 2022 05:44:19 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:741f])
        by smtp.gmail.com with ESMTPSA id g25-20020ac870d9000000b002f9433ed963sm1207797qtp.64.2022.05.25.05.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 05:44:19 -0700 (PDT)
Date: Wed, 25 May 2022 08:44:18 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3] mm: Avoid unnecessary page fault retires on shared
 memory types
Message-ID: <Yo4kojxZfjNiZI7/@cmpxchg.org>
References: <20220524234531.1949-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220524234531.1949-1-peterx@redhat.com>
X-Mailman-Approved-At: Thu, 26 May 2022 11:56:59 +1000
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
 rnel.org, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>, Stafford Horne <shorne@gmail.com>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Andrea Arcangeli <aarcange@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Brian Cain <bcain@quicinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson
  <rth@twiddle.net>, Chris Zankel <chris@zankel.net>, 

Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Guo Ren <guoren@kernel.org>, Borislav Petkov <bp@alien8.de>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 24, 2022 at 07:45:31PM -0400, Peter Xu wrote:
> I observed that for each of the shared file-backed page faults, we're very
> likely to retry one more time for the 1st write fault upon no page.  It's
> because we'll need to release the mmap lock for dirty rate limit purpose
> with balance_dirty_pages_ratelimited() (in fault_dirty_shared_page()).
> 
> Then after that throttling we return VM_FAULT_RETRY.
> 
> We did that probably because VM_FAULT_RETRY is the only way we can return
> to the fault handler at that time telling it we've released the mmap lock.
> 
> However that's not ideal because it's very likely the fault does not need
> to be retried at all since the pgtable was well installed before the
> throttling, so the next continuous fault (including taking mmap read lock,
> walk the pgtable, etc.) could be in most cases unnecessary.
> 
> It's not only slowing down page faults for shared file-backed, but also add
> more mmap lock contention which is in most cases not needed at all.
> 
> To observe this, one could try to write to some shmem page and look at
> "pgfault" value in /proc/vmstat, then we should expect 2 counts for each
> shmem write simply because we retried, and vm event "pgfault" will capture
> that.
> 
> To make it more efficient, add a new VM_FAULT_COMPLETED return code just to
> show that we've completed the whole fault and released the lock.  It's also
> a hint that we should very possibly not need another fault immediately on
> this page because we've just completed it.
> 
> This patch provides a ~12% perf boost on my aarch64 test VM with a simple
> program sequentially dirtying 400MB shmem file being mmap()ed and these are
> the time it needs:
> 
>   Before: 650.980 ms (+-1.94%)
>   After:  569.396 ms (+-1.38%)
> 
> I believe it could help more than that.
> 
> We need some special care on GUP and the s390 pgfault handler (for gmap
> code before returning from pgfault), the rest changes in the page fault
> handlers should be relatively straightforward.
> 
> Another thing to mention is that mm_account_fault() does take this new
> fault as a generic fault to be accounted, unlike VM_FAULT_RETRY.
> 
> I explicitly didn't touch hmm_vma_fault() and break_ksm() because they do
> not handle VM_FAULT_RETRY even with existing code, so I'm literally keeping
> them as-is.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
