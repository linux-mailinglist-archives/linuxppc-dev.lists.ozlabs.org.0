Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CD9309A18
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 04:32:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSxV71vdTzDrNR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 14:32:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eSCoksJ1; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSxS33kVdzDrdR
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 14:30:56 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id t25so9638141pga.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 19:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=WWtdonkpI96IFBE23zlui93VOmpriWeRuclQpLHiSrQ=;
 b=eSCoksJ1Yzv/0BafKpHiRRXPKnSIvcmu5C8r/mihPZT7sg4H85PPlglIDJW80h3clD
 fd4ivdugrzla49hkbsIq0/rdtSO+B6t0nc6sqXNZECMM4P/dcjvdqKwnLKxwRwZoisSe
 g4gxwXfE3hl2hwxq7/RE3gBz8t2xrU2wWagJLphFtVXBZZPYK5pLYj74Mw9vS8oM4pKU
 6QYwv7XtIFq+X7sjnwKdzr75ZO1pp1ztyUUWwfOF5YJ7ZyntGlW+ujiU9AEN8+j3Zrdg
 j/nxnuRNVYt9tavAg8CtBw8/cQ3AL1zngp18EmiNiGAzmmpMHsfadM9qZ4NZVXJD4hTe
 mAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=WWtdonkpI96IFBE23zlui93VOmpriWeRuclQpLHiSrQ=;
 b=ol5iXsBmXItAaTs0oNg6/CDV/mizepkRvEXOaHzNbvvGF18D+AdfWVwxGDd8bv/I+p
 UFSIC+vzPdM4yKXvqUNeLzLV87aIHmPTi98OuWieV9Xh8BAi4wtk46YfJ/w+LY2PuI8I
 DfYRvdzLmFhVrIFa/SJ6XLSj33UMOYUAC4o1BW/jtZSI4BFt9pSCD3CXuxaZbcfTFYcK
 k3c2HuvCBDLL+zh4CXodtQTZK/hxsGBao7ijRkBJhl77YKzAOy7jEPsTgvjyBnUWTFJa
 uan5vGKuYtXZJbpxsZc1XPWd1HSX+OiSNSN6S1PVfvVJqWb2+fWIpFe9AZE4q5zdmeOQ
 9ePw==
X-Gm-Message-State: AOAM532ar+3khfE7qdFkjSGgPzMPIfEJWZM3v9XBYidkcgDMn1sBmxX5
 /aLHfD7p/YBncqo6iZrrcu0=
X-Google-Smtp-Source: ABdhPJwg/CC1nlE2QXUEo6aPv7AuExcknG2RvU7iKigAxQiaO+plz8rwLHQC/gO7heys0NGdqRr/GA==
X-Received: by 2002:a63:5309:: with SMTP id h9mr11066861pgb.19.1612063852569; 
 Sat, 30 Jan 2021 19:30:52 -0800 (PST)
Received: from localhost
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id d14sm12961544pfo.156.2021.01.30.19.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 19:30:52 -0800 (PST)
Date: Sun, 31 Jan 2021 13:30:45 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC 00/20] TLB batching consolidation and enhancements
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, Nadav Amit
 <nadav.amit@gmail.com>
References: <20210131001132.3368247-1-namit@vmware.com>
In-Reply-To: <20210131001132.3368247-1-namit@vmware.com>
MIME-Version: 1.0
Message-Id: <1612063149.2awdsvvmhj.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org,
 x86@kernel.org, Yu Zhao <yuzhao@google.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Mel Gorman <mgorman@techsingularity.net>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-csky@vger.kernel.org,
 Nadav Amit <namit@vmware.com>, Andy Lutomirski <luto@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nadav Amit's message of January 31, 2021 10:11 am:
> From: Nadav Amit <namit@vmware.com>
>=20
> There are currently (at least?) 5 different TLB batching schemes in the
> kernel:
>=20
> 1. Using mmu_gather (e.g., zap_page_range()).
>=20
> 2. Using {inc|dec}_tlb_flush_pending() to inform other threads on the
>    ongoing deferred TLB flush and flushing the entire range eventually
>    (e.g., change_protection_range()).
>=20
> 3. arch_{enter|leave}_lazy_mmu_mode() for sparc and powerpc (and Xen?).
>=20
> 4. Batching per-table flushes (move_ptes()).
>=20
> 5. By setting a flag on that a deferred TLB flush operation takes place,
>    flushing when (try_to_unmap_one() on x86).
>=20
> It seems that (1)-(4) can be consolidated. In addition, it seems that
> (5) is racy. It also seems there can be many redundant TLB flushes, and
> potentially TLB-shootdown storms, for instance during batched
> reclamation (using try_to_unmap_one()) if at the same time mmu_gather
> defers TLB flushes.
>=20
> More aggressive TLB batching may be possible, but this patch-set does
> not add such batching. The proposed changes would enable such batching
> in a later time.
>=20
> Admittedly, I do not understand how things are not broken today, which
> frightens me to make further batching before getting things in order.
> For instance, why is ok for zap_pte_range() to batch dirty-PTE flushes
> for each page-table (but not in greater granularity). Can't
> ClearPageDirty() be called before the flush, causing writes after
> ClearPageDirty() and before the flush to be lost?

Because it's holding the page table lock which stops page_mkclean from=20
cleaning the page. Or am I misunderstanding the question?

I'll go through the patches a bit more closely when they all come=20
through. Sparc and powerpc of course need the arch lazy mode to get=20
per-page/pte information for operations that are not freeing pages,=20
which is what mmu gather is designed for.

I wouldn't mind using a similar API so it's less of a black box when=20
reading generic code, but it might not quite fit the mmu gather API
exactly (most of these paths don't want a full mmu_gather on stack).

>=20
> This patch-set therefore performs the following changes:
>=20
> 1. Change mprotect, task_mmu and mapping_dirty_helpers to use mmu_gather
>    instead of {inc|dec}_tlb_flush_pending().
>=20
> 2. Avoid TLB flushes if PTE permission is not demoted.
>=20
> 3. Cleans up mmu_gather to be less arch-dependant.
>=20
> 4. Uses mm's generations to track in finer granularity, either per-VMA
>    or per page-table, whether a pending mmu_gather operation is
>    outstanding. This should allow to avoid some TLB flushes when KSM or
>    memory reclamation takes place while another operation such as
>    munmap() or mprotect() is running.
>=20
> 5. Changes try_to_unmap_one() flushing scheme, as the current seems
>    broken to track in a bitmap which CPUs have outstanding TLB flushes
>    instead of having a flag.

Putting fixes first, and cleanups and independent patches (like #2) next
would help with getting stuff merged and backported.

Thanks,
Nick
