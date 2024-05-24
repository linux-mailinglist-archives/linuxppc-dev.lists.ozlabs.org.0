Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA8E8CE07E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 06:56:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=paD3jrKn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlswT617hz87s0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 14:47:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=paD3jrKn;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vlsvm3ch2z87c2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 14:47:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1716526018;
	bh=Lsx8n8TfdeBc5jT/DgUGbVF60hkQdqk58hk4W7Gj/N4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=paD3jrKnTyE62MX67uraqx0iJ6R9LHZwCYGsNl1DhIFk2hoURmUhHtaz+3v9Sqvd5
	 deSi032lPBUkourOaqJRLGrgE32hFS1nP6wHE4+18GamlqWCJVbSwlrkL+AGHGusvf
	 5gouHmpmhQv7AUf7GHkbT7mbExy4oNYoD974jskemhyOHLpbkllkMfTgOgZh2iyX+3
	 qWo4Fi/F7Sdh5TyeuSoonwnWaFMBSxiD4o7TbkUXaK0EVOgt8XZub99BKk7WiGy1mJ
	 fLXfaHMdWTevEcy6BdGIhd5cA27GUnBT5pPzLBD3hSoKMkpz5VNC8FIj6/wGOYvLcN
	 tijBRbbBEo2jA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vlsvk2vflz4wcR;
	Fri, 24 May 2024 14:46:58 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Peter Xu <peterx@redhat.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v2 00/20] Reimplement huge pages without hugepd on
 powerpc (8xx, e500, book3s/64)
In-Reply-To: <Zk-bpBZ_yjsj_B2z@x1n>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
 <Zk-bpBZ_yjsj_B2z@x1n>
Date: Fri, 24 May 2024 14:46:58 +1000
Message-ID: <87jzjj4y0t.fsf@mail.lhotse>
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Peter,

Peter Xu <peterx@redhat.com> writes:
> On Fri, May 17, 2024 at 08:59:54PM +0200, Christophe Leroy wrote:
>> This is the continuation of the RFC v1 series "Reimplement huge pages
>> without hugepd on powerpc 8xx". It now get rid of hugepd completely
>> after handling also e500 and book3s/64
>> 
>> Unlike most architectures, powerpc 8xx HW requires a two-level
>> pagetable topology for all page sizes. So a leaf PMD-contig approach
>> is not feasible as such.
....
>
> Great to see this series, thanks again Christophe.
>
> I requested for help on the lsfmm hugetlb unification session, but
> unfortunately I don't think there were Power people around.. I'd like to
> request help from Power developers again here on the list: it will be very
> appreciated if you can help have a look at this series.

Christophe is a powerpc developer :)

I'll help where I can, but I don't know the hugepd code that well, I've
never really worked on it before. Nick will hopefully also be able to
help, he at least knows mm better than me, but he also has other work.

Hopefully we can make this series work, and replace hugepd. But if we
can't make that work then there is the possibility of just dropping
support for 16M/16G pages with HPT/4K pages.

> It's a direct dependent work to the hugetlb refactoring that we'll be
> working on, while it looks like the hugetlb refactoring is something the
> community as a whole would like to see in the near future.
>
> We don't want to add more Power-only CONFIG_ARCH_HAS_HUGEPD checks for
> hugetlb in any new code.

Yes I understand.

cheers
