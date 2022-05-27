Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 250575359AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 08:52:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8b8x0DCyz3c1r
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 16:52:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WLF0ZKcK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::31; helo=mail-oa1-x31.google.com; envelope-from=jcmvbkbc@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WLF0ZKcK;
	dkim-atps=neutral
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8YXQ2gxKz2xDY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 15:39:33 +1000 (AEST)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-edeb6c3642so4696485fac.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 22:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2j31mgyTy2/RMpvPafIuRR/7M5aCsOn5pH1JxQKELh0=;
        b=WLF0ZKcKkqyL/2e9Vrm4jJIU7Iq70SjWVWeR4mG+diJpadGhfuylwbDWHZVjDdFbuq
         Hxc+zHrNjRLjtRhI1yhC+nolDKLNrwOV2/oaWTaoh4VCK67BB0z5yPlcOmnthCOgtmez
         8jkwQgYPNLUuG0ZEbUiSy7uVEpWFtrO5L4UM+4mbtXpWMiQIVZp0eLdp45xYgN9Jmvmc
         aulsD6JeO/TIOhvHj+bALfaW9BR7tPWEUeyaMI8bJbO4wOxVeH/I0lrHRJ+FP9F521BK
         /lEKp/SRZycKZGHLE0LZwkZV2trusLGaniTNIWTP9EnU7l+Xe/n5XI3K1uCmL30r4C8o
         Jgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2j31mgyTy2/RMpvPafIuRR/7M5aCsOn5pH1JxQKELh0=;
        b=0zTF0wTEDaChzxnouD1tdFmvU94qW3MSbUSjcuurEAHQZL4Wq2jO2OJZReeWflN+ln
         CkvPKDgsZqR3ak5bCsTUGxErcC0/pltTKVasOttwqyPT/fyAxOPkrHD/nN46yPN+kAHO
         IEvg931Fl74RDf2MCUasvK19M6s+xS69IarLCYm2LcUgSxwFkjbdYDKT0E43qNzYswUv
         k5Iv1wNIYBqUF+vN211xH+DL4Par+m6uXBH89ENiv/T7v2DV2PGp1rF87yksVxEzU7pM
         xetFOnwcmdPWDRlhN7+mLkyrtIqXxFtaX+Aly93biBNKR3hjHI8UE36sPOO6IBpoVTNu
         7WyA==
X-Gm-Message-State: AOAM530HhdFsIMelb+64034gEQ/gL3MKeuFH+R4kTJZsPGqDJlrWBPY/
	vsCd3PlUKKJ49bLotlks1jJUuXiVDPKl79tnvRA=
X-Google-Smtp-Source: ABdhPJy8+6PjRSs5xseRfaJdStvLUZHZV5vQKgs4hS+3gJJgloJJ42WfwmBmCJpVr7XfQyeK+DIvF8/HIUAjs0cVwxU=
X-Received: by 2002:a05:6870:5ba6:b0:f1:5840:f38e with SMTP id
 em38-20020a0568705ba600b000f15840f38emr3323758oab.210.1653629967367; Thu, 26
 May 2022 22:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220524234531.1949-1-peterx@redhat.com>
In-Reply-To: <20220524234531.1949-1-peterx@redhat.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 26 May 2022 22:39:15 -0700
Message-ID: <CAMo8BfJWzUnwPyWKsBsW2-x7t=Go5Mwb643kXm5BfpVDAeaeWA@mail.gmail.com>
Subject: Re: [PATCH v3] mm: Avoid unnecessary page fault retires on shared
 memory types
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 27 May 2022 16:52:17 +1000
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
Cc: "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Linux Memory Management List <linux-mm@kvack.org>, Rich Felker <dalias@libc.org>, Paul Mackerras <paulus@samba.org>, "H . Peter Anvin" <hpa@zytor.com>, "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>, "open list:IA64 \(Itanium\) PL..." <linux-ia64@vger.kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Jonas Bonn <jonas@southpole.se>, linux-s390 <linux-s390@vger.kernel.org>, linux-snps-arc@lists.infradead.org, Yoshinori Sato <ysato@users.sourceforge.jp>, "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>, "o
 pen list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, Helge Deller <deller@gmx.de>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, "open list:SUPERH" <linux-sh@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>, Stafford Horne <shorne@gmail.com>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Andrea Arcangeli <aarcange@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Brian Cain <bcain@quicinc.com>, Heiko Carstens <hca@linux.ibm.com>, Johannes Weiner <hannes@cmpxchg.org>, linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Richard Weinberger <richard@nod.at>, "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>, openrisc@li
 sts.librecores.org, Ivan Kokshaysky <ink@jurassic.par

k.msu.ru>, Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Guo Ren <guoren@kernel.org>, Borislav Petkov <bp@alien8.de>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 24, 2022 at 4:45 PM Peter Xu <peterx@redhat.com> wrote:
>
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
> ---
>
> v3:
> - Rebase to akpm/mm-unstable
> - Copy arch maintainers
> ---

For xtensa:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
