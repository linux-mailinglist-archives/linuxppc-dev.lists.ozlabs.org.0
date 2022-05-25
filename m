Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99599533B46
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 13:08:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7SxJ3hf6z3c8B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 21:08:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.181;
 helo=mail-qt1-f181.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7NrQ27mzz3029
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 18:04:21 +1000 (AEST)
Received: by mail-qt1-f181.google.com with SMTP id g3so16416893qtb.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 01:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AP6YAmjuideizUL7mupGqzQ5PgkASmXHUBF+HT7ISso=;
 b=NQvL89RAPItDT/nFOW/7hz6avmzW6OR7Y2zfChnu9JK3WRHGjOLkZQ3Pym6T6x0zPL
 GMxLseNZWESoUWZXtEH4m3G+3w/e+GLUX0XiztLm7vywCChxup8KmPCOBFAad3SfN3PY
 BixpYwXQBErwVF5k/o+FAWU7HRu82QoZqsIsUZBC4iM78+9/23eMz9x19qjF45viEUDN
 /xm8+0B7SFvOZl+Vv9J/ACCurSIJbTJx9NhUxqG+wV3nZ/l+vuTzNYQmOPPVq0DSalJo
 bP8674jpsRAfXOhALsLVirlGMzSnXVKcryAHuzs9QWHv6hPrF/CtBTI3PlQlXCE9yvPa
 BuvQ==
X-Gm-Message-State: AOAM533sLf6xYxMCDknfkNEPtgiQMwRnuDEwkkKm2KGSdlmW7//ZGc04
 U1aEbF1gEebJsnVgmqD1WUxqbBu2gs0qmQ==
X-Google-Smtp-Source: ABdhPJzHEz77DwQzbMjwrUlC0vXkeWd07a1AeYIaBjUnptgUCeao3u/cnNVkrTFwPLtTifuVfauQgw==
X-Received: by 2002:a05:622a:1998:b0:2f9:4415:49e6 with SMTP id
 u24-20020a05622a199800b002f9441549e6mr4834294qtc.423.1653465856682; 
 Wed, 25 May 2022 01:04:16 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 j23-20020ac85517000000b002f939be4868sm974216qtq.19.2022.05.25.01.04.16
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 01:04:16 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id t26so34929890ybt.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 01:04:16 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr30228977ybu.604.1653465845434; Wed, 25
 May 2022 01:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220524234531.1949-1-peterx@redhat.com>
In-Reply-To: <20220524234531.1949-1-peterx@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 May 2022 10:03:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWpCUGXn=KzfpfZqResRR41XkBKZiQQVo_O_Hq+KMcDKg@mail.gmail.com>
Message-ID: <CAMuHMdWpCUGXn=KzfpfZqResRR41XkBKZiQQVo_O_Hq+KMcDKg@mail.gmail.com>
Subject: Re: [PATCH v3] mm: Avoid unnecessary page fault retires on shared
 memory types
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 25 May 2022 21:08:31 +1000
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
Cc: x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Linux MM <linux-mm@kvack.org>, Rich Felker <dalias@libc.org>,
 Paul Mackerras <paulus@samba.org>, "H . Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-ia64@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-xtensa@linux-xtensa.org,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 linux-sh@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>,
 Stafford Horne <shorne@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Andrea Arcangeli <aarcange@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Brian Cain <bcain@quicinc.com>,
 Heiko Carstens <hca@linux.ibm.com>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Sven Schnelle <svens@linux.ibm.com>, Guo Ren <guoren@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Johannes Berg <johannes@sipsolutions.net>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 25, 2022 at 1:45 AM Peter Xu <peterx@redhat.com> wrote:
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

>  arch/m68k/mm/fault.c          |  4 ++++

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
