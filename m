Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 508CA30997C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:41:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSshx13B8zDrgS
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 11:41:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PIOgJQZU; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSsfn0NgNzDrbv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 11:40:00 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B98964E1A
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612053594;
 bh=ZARN4/SNMif8pmhvtSYaVaBh/E7PVLrk6k7KSJ+Cbgg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PIOgJQZUx+1+CIY+uUFr3AqjeBFrwk9ryhp+g65Zv5nDG+pIgk1N/r4mSP5BAz/qJ
 wQMg2itlvUY/Y4eRQenumglnlA2SblzxOw8ArHfqgmyYRTbIITjWC1vTcrsXO62gjh
 CAiMWnbH8B47mRo7wSTVqg4YsSNnYSF4R3tLeZ5Nox2xbMZyvruMAPr+CMsXcdN+Qg
 yCxnUose/9kCLov4O5KXuXEvT6QQKnUrvunhz8aUApExv7JPQ7DJwolqGvEVr3AamM
 GOOLJp1AsSd6mqmBcOFoHXrUXpH8x4AQ2A+tdRoYbHyuwgyXJA4koCFCmaLQqp9KCL
 MV5zOeTqz1l8Q==
Received: by mail-ed1-f50.google.com with SMTP id f1so14810088edr.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 16:39:54 -0800 (PST)
X-Gm-Message-State: AOAM533Opsz72yfUPaOaJbvSIcGqeEygKjuIcaEndU6PF3buxTNMt25y
 MkaLCWGtOQyUFGTRGi/rhVYVGoURwjWzvS2GeBjj8Q==
X-Google-Smtp-Source: ABdhPJz2HtR+oWDJm9Im8a9Zc9ILIiNOJ3sJ5fZY04oSx16Isz5PJWJD/yFlp6cyFbiANw2fuD8+l8VdlPb3QxBCnDs=
X-Received: by 2002:a05:6402:3585:: with SMTP id
 y5mr11930169edc.97.1612053592891; 
 Sat, 30 Jan 2021 16:39:52 -0800 (PST)
MIME-Version: 1.0
References: <20210131001132.3368247-1-namit@vmware.com>
In-Reply-To: <20210131001132.3368247-1-namit@vmware.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Sat, 30 Jan 2021 16:39:41 -0800
X-Gmail-Original-Message-ID: <CALCETrUUe_iijSoTYMjibqxUveaYrG3sVTWawbi3HWCjx_ySYg@mail.gmail.com>
Message-ID: <CALCETrUUe_iijSoTYMjibqxUveaYrG3sVTWawbi3HWCjx_ySYg@mail.gmail.com>
Subject: Re: [RFC 00/20] TLB batching consolidation and enhancements
To: Nadav Amit <nadav.amit@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390 <linux-s390@vger.kernel.org>, X86 ML <x86@kernel.org>,
 Yu Zhao <yuzhao@google.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Mel Gorman <mgorman@techsingularity.net>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
 Nadav Amit <namit@vmware.com>, Nick Piggin <npiggin@gmail.com>,
 Andy Lutomirski <luto@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 30, 2021 at 4:16 PM Nadav Amit <nadav.amit@gmail.com> wrote:
>
> From: Nadav Amit <namit@vmware.com>
>
> There are currently (at least?) 5 different TLB batching schemes in the
> kernel:
>
> 1. Using mmu_gather (e.g., zap_page_range()).
>
> 2. Using {inc|dec}_tlb_flush_pending() to inform other threads on the
>    ongoing deferred TLB flush and flushing the entire range eventually
>    (e.g., change_protection_range()).
>
> 3. arch_{enter|leave}_lazy_mmu_mode() for sparc and powerpc (and Xen?).
>
> 4. Batching per-table flushes (move_ptes()).
>
> 5. By setting a flag on that a deferred TLB flush operation takes place,
>    flushing when (try_to_unmap_one() on x86).

Are you referring to the arch_tlbbatch_add_mm/flush mechanism?
