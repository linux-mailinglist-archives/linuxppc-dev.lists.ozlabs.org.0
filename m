Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA3A7067E5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 14:20:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLsd409Cxz3fBQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 22:20:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HhOSXK3l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLscF3PSdz3bh0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 22:19:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HhOSXK3l;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QLscF25mBz4x41;
	Wed, 17 May 2023 22:19:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1684325981;
	bh=reA2yTRbCZa5cBx4zwA3xw7gGraSBbw1ULKxkJZz4cE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HhOSXK3lUJm6kcEU4hfcYysOCsQmW52JHS1NvsKKd560JNTF/HD0UeCnPqkLXPDWr
	 EK423RagxR39BkHioUCbEEKXYL9mW7M7uT9+VLKtX+e7ADBFW1xDm9+Fty4dJwJgdR
	 AlKMWAMS32A8ZFSllnGAlTA2mv0lp7WoCMazVBw/6j25z58eBdBSEoc9Rb7rbmr9jq
	 E/WLgTD9fdmovVL3GoOZS7jhm+/w0CagzTYJGlWSvTtfeCptVKajRVbJPk9l7iTMtB
	 DK+Ituc8bKiLjGluc4V2pj0JasLAbyTPKMWcLavFtSkXdVLsOw/tnYdGOG7HMS0Cie
	 FHi6TlD1Sjoig==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gaurav Batra <gbatra@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/iommu: limit number of TCEs to 512 for
 H_STUFF_TCE hcall
In-Reply-To: <ad7517b3-02f2-436a-4c31-878031630c25@linux.vnet.ibm.com>
References: <20230509220549.23946-1-gbatra@linux.vnet.ibm.com>
 <875y8yl1k5.fsf@mail.lhotse>
 <ad7517b3-02f2-436a-4c31-878031630c25@linux.vnet.ibm.com>
Date: Wed, 17 May 2023 22:19:40 +1000
Message-ID: <87r0rfywtf.fsf@mail.lhotse>
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
Cc: brking@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, gjoyce@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gaurav Batra <gbatra@linux.vnet.ibm.com> writes:
> Hello Michael,
>
> System test hit the crash. I believe, it was PHYP that resulted in it 
> due to number of TCEs passed in to be >512.

OK. It's always good to spell out in the change log whether it's a
theoretical/unlikely bug, or one that's actually been hit in testing or
the field.

> I was wondering about the Fixes tag as well. But, this interface, in 
> it's current form, is there from the day the file was created. So, in 
> this case, should I mention the first commit which created this source file?

If it really goes back to the origin commit, then it's probably better
to just say so and tag it for stable, rather than pointing to 1da177e4.

I wonder though is there something else that changed that means this bug
is now being hit but wasn't before? Or maybe it's just that we are
testing on systems with large enough amounts of memory to hit this but
which aren't using a direct mapping?

cheers
