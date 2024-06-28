Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 929BD91BE0E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 14:02:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=I7UOV2xN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9YwD0gCRz3cYw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 22:02:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=I7UOV2xN;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9YvT4d2pz3cPK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 22:01:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1719576117;
	bh=WVjYDwn3UJEIGo/7AkzmjmcOPcEK3IkFmuOVjJHiGgE=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=I7UOV2xNBamBedgcOI9zZVKP+XOub/Y8Vc5NWgQjJ7i1t4b/6L7I/MwSUu409KFIX
	 HxzaSAqQkXU3C6+aKRXfo+o7kyjOzryOYanrxLpQq219NNxZs+sRcG/TioX8uEIc0V
	 FBSLT6mXRX89468d3vyDo/NWTQpJ+34bgFXq+IqE84CiIttL3PIBVBN0obrFTIaTvz
	 EjLwdsmpE/gopyPNAk9KHhVXCDXohth5zocUQJ29gMwrWj70kpeGlEPeBb/Q0A3YgD
	 mPmAelWCfQrWfh0gCdxlOuOC1sV4p7UJiM17Ch2z0M6v8KU3Z5NTxLj9dfPgLoAARj
	 VCfLT8HJCbPyA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W9YvT0cYSz4w2K;
	Fri, 28 Jun 2024 22:01:56 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, Nicholas Piggin
 <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries: Fix scv instruction crash with kexec
In-Reply-To: <3b4b2943-49ad-4619-b195-bc416f1d1409@linux.ibm.com>
References: <20240625134047.298759-1-npiggin@gmail.com>
 <87sex0oxym.fsf@mail.lhotse>
 <3b4b2943-49ad-4619-b195-bc416f1d1409@linux.ibm.com>
Date: Fri, 28 Jun 2024 22:01:56 +1000
Message-ID: <87bk3ll1hn.fsf@mail.lhotse>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sourabh Jain <sourabhjain@linux.ibm.com> writes:
> On 26/06/24 14:57, Michael Ellerman wrote:
>> Nicholas Piggin <npiggin@gmail.com> writes:
>>> kexec on pseries disables AIL (reloc_on_exc), required for scv
>>> instruction support, before other CPUs have been shut down. This means
>>> they can execute scv instructions after AIL is disabled, which causes an
>>> interrupt at an unexpected entry location that crashes the kernel.
>>>
>>> Change the kexec sequence to disable AIL after other CPUs have been
>>> brought down.
>>>
>>> As a refresher, the real-mode scv interrupt vector is 0x17000, and the
>>> fixed-location head code probably couldn't easily deal with implementing
>>> such high addresses so it was just decided not to support that interrupt
>>> at all.
>>>
>>> Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>   
>> Was this reported publicly? I don't remember it.
>
> No, I didn't report this issue publicly.

OK. It's always nice to have a public report so if someone else hits it,
either at the same time, or in the future, they can search the archive
and see that it's been reported.

But this now counts as a public report, so I'll just point the link at
this thread :)

cheers
