Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 018B1691856
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 07:08:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCjwS5hcrz3f3g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 17:08:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HrF9zP3+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCjvX3qgQz3bg1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 17:07:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HrF9zP3+;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PCjvX1dTqz4y0H;
	Fri, 10 Feb 2023 17:07:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1676009272;
	bh=N/NZBkPp4JgRmlI9Ax8g9PQ0hHC0iISKLl4ipQtQJX8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HrF9zP3+EMXcnUDIU7WEUgz2Nj69ycBzMr5ZxSJ7xVt8eOGegzZluP1Tu389AIDdu
	 sGwBZVvUtQDxSGClRRmORCFnAuB8nLNC28k3gu0WFjB/BzibhNW+FbtJ70HoWsVlRb
	 GXz7hm5Y9Cg3Y8wC495cbwpb305n80HL9dVb87VAOvfs+wni4j7fahlJLjzv5e/cny
	 hsG09aelyl45izqeRjieQOeoJ8Y6PlWsFRnhZXF5aiqluosPmoKxX/LewCx3yKwLm9
	 BAiLiCUIL87q1DaB62swHmHjBUjMRDXaB8ZJuDP7N77AB8GMt1o/u4++4vzJDMW5UR
	 mmlMRd021E1fg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, Nathan Lynch via B4 Submission
 Endpoint <devnull+nathanl.linux.ibm.com@kernel.org>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Kajol
 Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, Mahesh
 J Salgaonkar <mahesh@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Nick Child <nnac123@linux.ibm.com>
Subject: Re: [PATCH v2 11/19] powerpc/rtas: add work area allocator
In-Reply-To: <87r0v0nrha.fsf@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
 <20230125-b4-powerpc-rtas-queue-v2-11-9aa6bd058063@linux.ibm.com>
 <87o7q4wera.fsf@mpe.ellerman.id.au> <87r0v0nrha.fsf@linux.ibm.com>
Date: Fri, 10 Feb 2023 17:07:51 +1100
Message-ID: <877cwqvyrs.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Nathan Lynch via B4 Submission Endpoint
>> <devnull+nathanl.linux.ibm.com@kernel.org> writes:
...
>>> +struct rtas_work_area * __ref rtas_work_area_alloc(size_t size)
>>> +{
>>> +	struct rtas_work_area *area;
>>> +	unsigned long addr;
>>> +
>>> +	might_sleep();
>>> +
>>> +	WARN_ON(size > RTAS_WORK_AREA_MAX_ALLOC_SZ);
>>> +	size = min_t(size_t, size, RTAS_WORK_AREA_MAX_ALLOC_SZ);
>>
>> This seems unsafe.
>>
>> If you return a buffer smaller than the caller asks for they're likely
>> to read/write past the end of it and corrupt memory.
>
> OK, let's figure out another way to handle this.
>
>> AFAIK genalloc doesn't have guard pages or anything fancy to save us
>> from that - but maybe I'm wrong, I've never used it.
>
> Yeah we would have to build our own thing on top of it. And I don't
> think it could be something that traps on access, it would have to be a
> check in rtas_work_area_free(), after the fact.

I *think* we could use the MMU. We'd just have to allocate whole pages,
and then vmap() them (create a mapping in vmalloc space), and then give
the vmalloc space address back to the caller. They'd then operate on
that address, meaning any overflow would trap. You already have
rtas_work_area_phys() for passing the phys address to RTAS.

But that would be a lot more complicated than your suggestion below.

>> There's only three callers in the end, seems like we should just return
>> NULL if the size is too large and have callers check the return value.
>
> There are more conversions to do, and a property I hope to maintain is
> that requests can't fail. Existing users of rtas_data_buf don't have
> error paths for failure to acquire the buffer.
>
> I believe the allocation size passed to rtas_work_area_alloc() can be
> known at build time in all cases. Maybe we could prevent inappropriate
> requests from being built with a compile-time assertion (untested):
>
> /* rtas-work-area.h */
>
> static inline struct rtas_work_area *rtas_work_area_alloc(size_t sz)
> {
> 	static_assert(sz < RTAS_WORK_AREA_MAX_ALLOC_SZ);
>         return __rtas_work_area_alloc(sz);
> }
>
> I think this would be OK? If I can't make it work I'll fall back to
> returning NULL as you suggest, but it will make for more churn (and
> risk) in the conversions.

Yeah if the sizes are always known at compile time that is a much better
solution.

cheers
