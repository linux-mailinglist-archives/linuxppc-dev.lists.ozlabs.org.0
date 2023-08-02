Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D48C276CE05
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 15:11:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Xsrb5ntA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGC605ghwz3cJR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 23:11:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Xsrb5ntA;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGC542PXwz2yDL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Aug 2023 23:10:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1690981813;
	bh=cpwtW/MaqspPAnGP6aR9fUGr987e5Q5U7unL+CgXiLk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Xsrb5ntAsjLVpz6x9Xi2qb8Tv97P5Lw1Jga05K0cWoYI3K0I+v9gnr/xFyGFeyEPQ
	 0EOEloUeHduekHuWKF9cS0xLYt6OBRVzlqwhC9s5BHdo9F2qLF0y0MP2rrJHkzmst1
	 g7lnn69RFEmYfeoAnFhBCGLisFsd8vopeeyi04szIAaqN24KIkK/atXu8WK6eUkPHj
	 lJdV3ALQsezx9IN9X7ZEDtlTG9Imv+CsgvmdbZeNRVDMuOXPHHiP5/JYhxkpDloLwb
	 lkyprxlGN8+1Y/Gov1rZoXFRjgs8l0tn0C7zJUzOjq7nTF2S283acWjCoqhfzXhMP7
	 WeU0RTDVwqy1A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RGC513Klbz4wb8;
	Wed,  2 Aug 2023 23:10:13 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/powermac: Use early_* IO variants in
 via_calibrate_decr
In-Reply-To: <643ebc8519d22e0ed869989490f39780c1bde09d.camel@linux.ibm.com>
References: <20230706010816.72682-1-bgray@linux.ibm.com>
 <643ebc8519d22e0ed869989490f39780c1bde09d.camel@linux.ibm.com>
Date: Wed, 02 Aug 2023 23:10:10 +1000
Message-ID: <87y1itzj2l.fsf@mail.lhotse>
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Benjamin Gray <bgray@linux.ibm.com> writes:
> On Thu, 2023-07-06 at 11:08 +1000, Benjamin Gray wrote:
>> The issue is pre-existing, but is surfaced by commit 721255b9826b
>> ("genirq: Use a maple tree for interrupt descriptor management").
>> It's not clear to me why this causes it to surface.
>
> From the thread chain in [1], it looks like the maple tree
> implementation just has different allocation behaviour, which follows a
> pre-existing code path to kmem_cache_alloc_bulk(), which
> unconditionally enables interrupts.

That was a bug that was fixed before the series was merged.

See:
  f5451547b831 ("mm, slab/slub: Ensure kmem_cache_alloc_bulk() is available early")


It looks like the trigger here is that the maple tree code uses
call_rcu() in ma_free_rcu(), and call_rcu() can cause TIF_NEED_RESCHED
to be set, which causes cond_resched() to actually reschedule, enabling
interrupts.

cheers


> (thanks Jordan Niethe for finding this thread)
>
> [1]: https://lore.kernel.org/all/87o7qdzfay.ffs@tglx/
