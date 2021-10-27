Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4D043C874
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 13:22:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfR9b6PQYz2yb7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 22:22:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pJM+SS2i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfR916W5yz2xsm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 22:21:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=pJM+SS2i; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HfR911HlKz4xbr;
 Wed, 27 Oct 2021 22:21:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1635333701;
 bh=mxhJiJHxAE3DqN+NxMq3fawT9A/Z2lD9DWzQe94QgD8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pJM+SS2ik7o+BzLNcB0GdrKDSrYG6qQUlvRlcWVfQprhCc23GZGzjXApzNnuK27vY
 H6+CwoBbUI5rq/StD16Wp9gLljy66Cy2t1jK3Hn44FR9N2KdvtBIFLoT1hFu4x3NzI
 0DcVej+SunyHb6jgahrvrhYStINA0rxGAy5hLsMiFKQkxf2zp2OMHMWL86MkeQWF+g
 +iwf8tAa7zpys+KMBOWAR00iKDWgB537E6fqe68rp350GFh9bjAgIhaPgwgA7915cj
 eW8VYeG1ESHe+3XrHVMfY+XNXIOtyGk06ZCOTjBHlJbYmldAPWbWTCx2FFJFX4AvFR
 7+zM4Ead586dg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] powerpc/vas: Fix potential NULL pointer dereference
In-Reply-To: <20211026224016.GA1488461@embeddedor>
References: <20211015050345.GA1161918@embeddedor>
 <97c42e43-15b9-5db6-d460-dbb16f31954d@linux.ibm.com>
 <20211026184201.GB1457721@embeddedor> <87h7d3beqq.fsf@mpe.ellerman.id.au>
 <20211026224016.GA1488461@embeddedor>
Date: Wed, 27 Oct 2021 22:21:39 +1100
Message-ID: <87v91iaf24.fsf@mpe.ellerman.id.au>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Haren Myneni <haren@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@samba.org>, linux-hardening@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Gustavo A. R. Silva" <gustavoars@kernel.org> writes:
> On Wed, Oct 27, 2021 at 09:30:53AM +1100, Michael Ellerman wrote:
> [..]
>> > I think I'll take this in my tree.
>> 
>> I've already put it in powerpc/next:
>> 
>>   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next&id=61cb9ac66b30374c7fd8a8b2a3c4f8f432c72e36
>
> Oh, great. :)
>
>> If you need to pick it up as well for some reason that's fine.
>
> I just didn't  want it to get lost somehow. I'll drop it from tree now.

No worries, sorry I've been so slow lately.

cheers
