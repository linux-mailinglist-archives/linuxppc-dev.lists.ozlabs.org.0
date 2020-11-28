Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9883E2C703E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 18:57:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjzjF4NCYzDrq9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 04:57:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=epX46Lo5; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjzgY5Y4MzDrdM
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 04:55:53 +1100 (AEDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C7C98246E8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 17:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606586151;
 bh=ZZhMRxdkDiUtjJhs9EzGkFNzkESkUN3IT5oRokS68Qo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=epX46Lo5gyxVc+A48tcBI9o2KY5N0B8LeGVmlne+5FIJLCKzXxKJbO8s5nD3xgFEq
 X4i5sPbFp4pWFdxVxrkkA2Zo+E6LU8KzScdnd4wUs/DuAJxVyePHnhRMsXt1NPg65k
 bczZ20BbxsSWXKhjoKXb+3UfQFkWGyoh+eDumXHw=
Received: by mail-wm1-f51.google.com with SMTP id x22so7886583wmc.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 09:55:50 -0800 (PST)
X-Gm-Message-State: AOAM533bNhhQiLKJ/CoGIwKZ2pWHXBhHvcOltlKr015tLPdbM/aKvw6r
 sEKaMW/o5IKtS2GcCN0tI1L7RpgoKpu7Gq+MfXo8pQ==
X-Google-Smtp-Source: ABdhPJzaqB8K8IiW/9cIJ/CJ9BqnrVUcLDZBaHBUttYrz8GGSHowF+hWwUHxhG80vPrg9fActeSCQFpfFgxQjqhRUUg=
X-Received: by 2002:a1c:7e90:: with SMTP id z138mr436606wmc.49.1606586149355; 
 Sat, 28 Nov 2020 09:55:49 -0800 (PST)
MIME-Version: 1.0
References: <20201128160141.1003903-1-npiggin@gmail.com>
 <20201128160141.1003903-3-npiggin@gmail.com>
In-Reply-To: <20201128160141.1003903-3-npiggin@gmail.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Sat, 28 Nov 2020 09:55:37 -0800
X-Gmail-Original-Message-ID: <CALCETrXYkbuJJnDv9ijfT+5tLQ2FOvvN1Ugoh5NwOy+zHp9HXA@mail.gmail.com>
Message-ID: <CALCETrXYkbuJJnDv9ijfT+5tLQ2FOvvN1Ugoh5NwOy+zHp9HXA@mail.gmail.com>
Subject: Re: [PATCH 2/8] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 28, 2020 at 8:02 AM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> And get rid of the generic sync_core_before_usermode facility. This is
> functionally a no-op in the core scheduler code, but it also catches
>
> This helper is the wrong way around I think. The idea that membarrier
> state requires a core sync before returning to user is the easy one
> that does not need hiding behind membarrier calls. The gap in core
> synchronization due to x86's sysret/sysexit and lazy tlb mode, is the
> tricky detail that is better put in x86 lazy tlb code.
>
> Consider if an arch did not synchronize core in switch_mm either, then
> membarrier_mm_sync_core_before_usermode would be in the wrong place
> but arch specific mmu context functions would still be the right place.
> There is also a exit_lazy_tlb case that is not covered by this call, which
> could be a bugs (kthread use mm the membarrier process's mm then context
> switch back to the process without switching mm or lazy mm switch).
>
> This makes lazy tlb code a bit more modular.

I have a couple of membarrier fixes that I want to send out today or
tomorrow, and they might eliminate the need for this patch.  Let me
think about this a little bit.  I'll cc you.  The existing code is way
to subtle and the comments are far too confusing for me to be quickly
confident about any of my conclusions :)
