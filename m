Return-Path: <linuxppc-dev+bounces-11903-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51127B4A14A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 07:41:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLXjn44l4z3054;
	Tue,  9 Sep 2025 15:41:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757396461;
	cv=none; b=hRn8W2t93tSM0aKO4anyEpHCVVqCplBRpGoVaT5SeezjVTbecmEzmLZ4YFNOl/sX00KQEFTdVwJ0CqgzIQXXn7u1drBS2jLaClEqZiT/E5QxQjfSmlYSHVRM1t+9rWM6AFyb5lYCrTiaWKD3TINOeEs9EbGCtQkux1eRUazE99GdnsF92osjiU92U86y+9CfiklXj35hYn3ioj5KciQ0TElGXsVlaoKR0hnzJ3OQMk2shbVIhCDp0z5IOWRo+PXYQMTymC9KfYqQoLVb+Bn6+cGr3Nir/eCYyADR0T7UdHD7BT2bSyToIspfXGbcWZkYlTP7UgAPADQQrWgBxd+Q/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757396461; c=relaxed/relaxed;
	bh=8KmKkYBxC3+WkfQjTVbcdSGXS2QmvvZ1sudg0GtusV0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CEnObfswhFyO1ihCWPXMS0l7PQ5R7OPvkeU8ep8C5Zq0h2364FcwSoZkVt85tZKfhSmzqgWf99vWAEGEp9dWzaXW72gKVlabk+TTZCBLoO3G36gCC0GuDKDPmsCzAIWdEzuQL9hWSZo0bELai5P81rn+6grHr+0On66dYCqtLY3Dj9VWnI0cZCLIUHLR98yP0h4WyZFWbTR+7MMgW/+9upVnWZKZBU0DllnGXR20z4QAJWFlNx1W+qx6FEFOOnfjSg0YN8Y+7DPb36VtmQy3ocsMQ1Uxr4/Y+YyJfqX2CAxTPyGpcHhNMiaiB03bJQu8w+Cei4AzUxQSLjXkAs3DTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=ac3AtU0M; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=ac3AtU0M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLXjl61Jdz2ySY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 15:40:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BE5E601EF;
	Tue,  9 Sep 2025 05:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0D0C4CEF4;
	Tue,  9 Sep 2025 05:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1757396455;
	bh=fLT6sZq3hOuocdqB+Er3MIxGIa7A226lDCyWybWeKb0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ac3AtU0MqGUoC9Eky+9KyLtx9biLH0jbhomUAhOb9ruR7c2j0fSSNnyF7J5pqgv3k
	 foKu3tqX/cVrmmALEDgQok2HJxXlYlCuqYu52g6qJkaq/U2HxlfxN2JIs/wIPe9xj/
	 lJgOpn+VQzJMFZkYputFzcFbXsTrbwF4GLqtj+KE=
Date: Mon, 8 Sep 2025 22:40:54 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, Alexander Gordeev
 <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar
 <mingo@redhat.com>, Jann Horn <jannh@google.com>, Juergen Gross
 <jgross@suse.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko
 <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Nicholas Piggin
 <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Ryan Roberts
 <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>, Thomas
 Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Will
 Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
Message-Id: <20250908224054.0a1969b493d8a837addd782e@linux-foundation.org>
In-Reply-To: <20250908073931.4159362-3-kevin.brodsky@arm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
	<20250908073931.4159362-3-kevin.brodsky@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon,  8 Sep 2025 08:39:26 +0100 Kevin Brodsky <kevin.brodsky@arm.com> wrote:

> arch_{enter,leave}_lazy_mmu_mode() currently have a stateless API
> (taking and returning no value). This is proving problematic in
> situations where leave() needs to restore some context back to its
> original state (before enter() was called). In particular, this
> makes it difficult to support the nesting of lazy_mmu sections -
> leave() does not know whether the matching enter() call occurred
> while lazy_mmu was already enabled, and whether to disable it or
> not.
> 
> This patch gives all architectures the chance to store local state
> while inside a lazy_mmu section by making enter() return some value,
> storing it in a local variable, and having leave() take that value.
> That value is typed lazy_mmu_state_t - each architecture defining
> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is free to define it as it sees fit.
> For now we define it as int everywhere, which is sufficient to
> support nesting.
> 
> The diff is unfortunately rather large as all the API changes need
> to be done atomically. Main parts:

This has a build error:

  CC      arch/x86/kernel/asm-offsets.s
In file included from ./arch/x86/include/asm/irqflags.h:102,
                 from ./include/linux/irqflags.h:18,
                 from ./include/linux/spinlock.h:59,
                 from ./include/linux/swait.h:7,
                 from ./include/linux/completion.h:12,
                 from ./include/linux/crypto.h:15,
                 from arch/x86/kernel/asm-offsets.c:9:
./arch/x86/include/asm/paravirt.h: In function 'arch_enter_lazy_mmu_mode':
./arch/x86/include/asm/paravirt.h:534:16: error: 'LAZY_MMU_DEFAULT' undeclared (first use in this function)
  534 |         return LAZY_MMU_DEFAULT;
      |                ^~~~~~~~~~~~~~~~
./arch/x86/include/asm/paravirt.h:534:16: note: each undeclared identifier is re

which gets fixed up later in the series.

