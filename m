Return-Path: <linuxppc-dev+bounces-3162-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5CD9C8058
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 03:01:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xpk0Y5Q4Hz2yFQ;
	Thu, 14 Nov 2024 13:01:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731549693;
	cv=none; b=DCN+OucdnPIQquYL9h44VcCLR9t2EJfLGcAqtvs3+Z+smSU+hKqAb1FpljUjGH1pLAGtR0t3SF5rUgMTtuOE7UV4k3PrcAr7rBUiBj+ktTqsLsiu4i2P3XqmH7osPr7DmIhUUb2NCKxLv7IkDhE8czwQysL/QqY1aYSb6clxPB5SLcC6Usj+XeCSHPEvNEjbkGMZzARQR9p5EXdcALkwoRT7BnBvzyxQLzDb9okRHBcjt7mfs1MWQ2A9lfbQYA2s/wxJYr6U7VTpETxIHPueNw63R4sVUc3pzcBoFP2zDRxdWbuv5lFkuozDLL/NetFi/Zmcw9H6z5s9BjBvDFUb9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731549693; c=relaxed/relaxed;
	bh=VgxfHan4ibP4AC8pjrjxkAg6/1BZbxzGeV5qGbYQ3ns=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UGPtOXaxstEZvj7D7zpmFua6e6R3PWqtcAoxYbWsuSVN8hhz05sK47S6lVIYiL7oOUC9HsyRCpWfliM78Wwshts4imzVc6NSx3tvLsyxzExXsIGBQ7SU3YOx3ryFUkrRGt71yoeCGRwbGL5YSL0rmZ/dsN/aFkrPFbakhCr3vyJCLEfvdPABgfxigg4qiGtYHkG3JAizyUl6pTiaFaTBXqxDqrS1wPfYgeWcecIMJ+gt0sXy2MV8jXbTmZuY7jNUo/JZHlOHLs7fFydMHs5GPUR4la9XoU8a1R21J3KPp85n/J8xcDMPlts0lEYw1FctOOCoVb2nNXxV+YdgPbnRcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=T4QAN1bV; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=T4QAN1bV;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xpk0X4ZhHz2y8d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 13:01:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731549688;
	bh=VgxfHan4ibP4AC8pjrjxkAg6/1BZbxzGeV5qGbYQ3ns=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=T4QAN1bVWbsNolhMLF76SleNUY1gmJNDQwjzKD4jkNSO9qmw+WHdubTxlaFuhhoFV
	 GCgM9uTxUaoajIB6MBGeqXdLPHbbWlOvceeToPkJKzlrKjF8WXa1ZeqTmCg/MGwbSt
	 NCudE0lNLXEf7bf4UPAjsG2lgD/6AH5ABQNpymXj8HBu5qRe3MW/lNLKSXctULROfY
	 JqM98BkCaxjpRpeF4kpQtiB83Q1zYwqiKKyUPPWhGAQkVTFwRFj4l1+GyJmgglBAFN
	 X7/V4n/9N7YF+508bgJXng1/G+WXIZzbryaFzoFcFtTRcNKxNK0iA7ckP2/rMQtkPY
	 dTzHmQWtgxoPA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xpk0R3p1lz4x7X;
	Thu, 14 Nov 2024 13:01:27 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, maddy@linux.ibm.com,
 christophe.leroy@csgroup.eu, peterz@infradead.org,
 ankur.a.arora@oracle.com
Subject: Re: [PATCH] powerpc: Add preempt lazy support
In-Reply-To: <054a79d6-85a4-4c02-a361-d8e4b34ca674@linux.ibm.com>
References: <20241108101853.277808-1-sshegde@linux.ibm.com>
 <20241108105031.Uq8MV60I@linutronix.de>
 <054a79d6-85a4-4c02-a361-d8e4b34ca674@linux.ibm.com>
Date: Thu, 14 Nov 2024 13:01:29 +1100
Message-ID: <877c96vaiu.fsf@mpe.ellerman.id.au>
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
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Shrikanth Hegde <sshegde@linux.ibm.com> writes:
> Thank you Sebastian for taking a look and rwb tag.
>
>> On 2024-11-08 15:48:53 [+0530], Shrikanth Hegde wrote:
>>> Define preempt lazy bit for Powerpc. Use bit 9 which is free and within
>>> 16 bit range of NEED_RESCHED, so compiler can issue single andi.
>>>
>>> Since Powerpc doesn't use the generic entry/exit, add lazy check at exit
>>> to user. CONFIG_PREEMPTION is defined for lazy/full/rt so use it for
>>> return to kernel.
>>>
>>> Ran a few benchmarks and db workload on Power10. Performance is close to
>>> preempt=none/voluntary. It is possible that some patterns would
>>> differ in lazy[2]. More details of preempt lazy is here [1]
>>>
>>> Since Powerpc system can have large core count and large memory,
>>> preempt lazy is going to be helpful in avoiding soft lockup issues.
>>>
>>> [1]: https://lore.kernel.org/lkml/20241007074609.447006177@infradead.org/
>>> [2]: https://lore.kernel.org/all/1a973dda-c79e-4d95-935b-e4b93eb077b8@linux.ibm.com/
>> 
>> The lazy bits are only in tip.
>
> Hi Michael, I sent it to powerpc tree since all the changes were in 
> arch/powerpc. Please let me know if i have send it to tip tree instead.

I think I'd like it to have a full cycle of testing in next before going
into mainline. So I'll plan to take this via the powerpc tree for the
next cycle.

I assume you haven't tested 32-bit at all?

cheers

