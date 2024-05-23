Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id BF20A8CD125
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 13:21:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TrAFcD/0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlQZD2BMyz79LP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 21:15:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TrAFcD/0;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlQXq0hYkz3vy5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 21:14:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1716462840;
	bh=RQkvd78utY4Ja+S0DO/1Mye5FaeMmZbhGPyeP5EJKQQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TrAFcD/0oCSj4bONcbgtSXsgS11T7S6E6WEE0gffpW7ra3PdygToDHYnWt9FP325X
	 Ulu0bqi0OxVHifCazgqTPTcv/aaBzA/83J1DT67GuP6P4kjWTmxYpR3k5d8QUw5SLX
	 KaBhSbgX+yGymHJf39ImQ6bnlzCPqhwGCGOmHgS0sHnNQgFIAZ6faJ7xj1yh2/HfZ9
	 /Z9LFLWzTrGlhqhCpc9jNxdoVnW04Z3oqkCtkFgdgatmkjO7vuIyMxPYAtcwoYLtH4
	 NkZDz2N+aA5I64TWM3LiovfgstkBhV29OKuQ0ghCtOqMnTp1QDGg0kge9VdLNWKmjf
	 eyL0seoYf1YEg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VlQXk23Vyz4wcK;
	Thu, 23 May 2024 21:13:58 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Eric Chanudet <echanude@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter
 Anvin" <hpa@zytor.com>, Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, Nick Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH v2] mm/mm_init: use node's number of cpus in
 deferred_page_init_max_threads
In-Reply-To: <20240522203758.626932-4-echanude@redhat.com>
References: <20240522203758.626932-4-echanude@redhat.com>
Date: Thu, 23 May 2024 21:13:55 +1000
Message-ID: <87jzjk3hn0.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Eric Chanudet <echanude@redhat.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Eric Chanudet <echanude@redhat.com> writes:
> x86_64 is already using the node's cpu as maximum threads. Make that the
> default for all archs setting DEFERRED_STRUCT_PAGE_INIT.
>
> This returns to the behavior prior making the function arch-specific
> with commit ecd096506922 ("mm: make deferred init's max threads
> arch-specific").
>
> Signed-off-by: Eric Chanudet <echanude@redhat.com>
>
> ---
> Setting DEFERRED_STRUCT_PAGE_INIT and testing on a few arm64 platforms
> shows faster deferred_init_memmap completions:
>
> |         | x13s        | SA8775p-ride | Ampere R137-P31 | Ampere HR330 |
> |         | Metal, 32GB | VM, 36GB     | VM, 58GB        | Metal, 128GB |
> |         | 8cpus       | 8cpus        | 8cpus           | 32cpus       |
> |---------|-------------|--------------|-----------------|--------------|
> | threads |  ms     (%) | ms       (%) |  ms         (%) |  ms      (%) |
> |---------|-------------|--------------|-----------------|--------------|
> | 1       | 108    (0%) | 72      (0%) | 224        (0%) | 324     (0%) |
> | cpus    |  24  (-77%) | 36    (-50%) |  40      (-82%) |  56   (-82%) |
>
> - v1: https://lore.kernel.org/linux-arm-kernel/20240520231555.395979-5-echanude@redhat.com
> - Changes since v1:
>  - Make the generic function return the number of cpus of the node as
>    max threads limit instead overriding it for arm64.
> - Drop Baoquan He's R-b on v1 since the logic changed.
> - Add CCs according to patch changes (ppc and s390 set
>   DEFERRED_STRUCT_PAGE_INIT by default).
>
>  arch/x86/mm/init_64.c | 12 ------------
>  mm/mm_init.c          |  2 +-
>  2 files changed, 1 insertion(+), 13 deletions(-)

On a machine here (1TB, 40 cores, 4KB pages) the existing code gives:

  [    0.500124] node 2 deferred pages initialised in 210ms
  [    0.515790] node 3 deferred pages initialised in 230ms
  [    0.516061] node 0 deferred pages initialised in 230ms
  [    0.516522] node 7 deferred pages initialised in 230ms
  [    0.516672] node 4 deferred pages initialised in 230ms
  [    0.516798] node 6 deferred pages initialised in 230ms
  [    0.517051] node 5 deferred pages initialised in 230ms
  [    0.523887] node 1 deferred pages initialised in 240ms

vs with the patch:

  [    0.379613] node 0 deferred pages initialised in 90ms
  [    0.380388] node 1 deferred pages initialised in 90ms
  [    0.380540] node 4 deferred pages initialised in 100ms
  [    0.390239] node 6 deferred pages initialised in 100ms
  [    0.390249] node 2 deferred pages initialised in 100ms
  [    0.390786] node 3 deferred pages initialised in 110ms
  [    0.396721] node 5 deferred pages initialised in 110ms
  [    0.397095] node 7 deferred pages initialised in 110ms

Which is a nice speedup.

Tested-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
