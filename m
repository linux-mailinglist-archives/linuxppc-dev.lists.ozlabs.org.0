Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 372DF4F8CF6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 06:17:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZQ2d1nzcz3bbp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 14:17:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=USlpGx1t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZQ224HZ0z2xBv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 14:17:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=USlpGx1t; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KZQ205Sr9z4xYM;
 Fri,  8 Apr 2022 14:17:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649391434;
 bh=+0mz5/6ccyYrJwsyIan2Rv2K8PJmRz01AUp5rFy9q2c=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=USlpGx1tBA9iIs4Q2LQ35OtgE9MxSPMBZMdejToJ/HKg0u4IIUapwwfZTUc9RHRS2
 kJXvZiA1v99zXPlFmI4pF1FoucRYgJLk51lH3fDpnikZ8L6iZtBJfKPvUptqIqv6XQ
 7qBORcccG/DIs8go+zMdZFziiomZ2eKbr4aCx3XzOaL7o+l9cz2ln0vQR9Qz+N473n
 0KRdOKdSB8R6lZqSDnCtPzFsgUXXYLcXkGtnut1deS1htngyjkErdb4HXBhgzvJz5r
 Cb2UFe40ja9ZAezUX8YflBzlrmWlU9ws3oachrlRNcpke1xQaDlizRJHvGoIPB6ph3
 wZGCWRMikGC8A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 00/14] Convert powerpc to default topdown mmap layout
 (v8)
In-Reply-To: <20220310204917.3d42e6cf3088f7cf1c7fe7a6@linux-foundation.org>
References: <cover.1646847561.git.christophe.leroy@csgroup.eu>
 <ddfed61b-e387-4554-eb88-6654b391d1a4@csgroup.eu>
 <877d91m7wd.fsf@mpe.ellerman.id.au>
 <20220310204917.3d42e6cf3088f7cf1c7fe7a6@linux-foundation.org>
Date: Fri, 08 Apr 2022 14:17:12 +1000
Message-ID: <87v8vk6wfr.fsf@mpe.ellerman.id.au>
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
Cc: "alex@ghiti.fr" <alex@ghiti.fr>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Morton <akpm@linux-foundation.org> writes:
> On Fri, 11 Mar 2022 15:26:42 +1100 Michael Ellerman <mpe@ellerman.id.au> wrote:
>
>> > What will be the merge strategy ? I guess it's a bit late to get it 
>> > through powerpc tree, so I was just wondering whether we could get 
>> > patches 2 to 5 in mm this cycle, and the powerpc ones next cycle ?
>> 
>> Yeah I didn't pick it up because the mm changes don't have many acks and
>> I'm always nervous about carrying generic mm changes.
>> 
>> It would be my preference if Andrew could take 2-5 through mm for v5.18,
>> but it is quite late, so I'm not sure how he will feel about that.
>
> 5.18 isn't a problem.  Perhaps you meant 5.17, which would be real tough.

Sorry, missed your reply.

> Can we take a look after 5.18-rc1?

Yes :)

cheers
