Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7961B50C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 13:36:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452f0B073PzDqJt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 21:36:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452dym3JfgzDqDf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 21:34:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 452dym04Vvz9s4Y;
 Mon, 13 May 2019 21:34:55 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH] powerpc/64/ftrace: mprofile-kernel patch out mflr
In-Reply-To: <1557729790.fw18xf9mdt.naveen@linux.ibm.com>
References: <20190413015940.31170-1-npiggin@gmail.com>
 <871s13ujcf.fsf@concordia.ellerman.id.au>
 <1557729790.fw18xf9mdt.naveen@linux.ibm.com>
Date: Mon, 13 May 2019 21:34:55 +1000
Message-ID: <87tvdytwo0.fsf@concordia.ellerman.id.au>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Naveen N. Rao" <naveen.n.rao@linux.ibm.com> writes:
> Michael Ellerman wrote:
>> Nicholas Piggin <npiggin@gmail.com> writes:
>>> The new mprofile-kernel mcount sequence is
>>>
>>>   mflr	r0
>>>   bl	_mcount
>>>
>>> Dynamic ftrace patches the branch instruction with a noop, but leaves
>>> the mflr. mflr is executed by the branch unit that can only execute one
>>> per cycle on POWER9 and shared with branches, so it would be nice to
>>> avoid it where possible.
>>>
>>> This patch is a hacky proof of concept to nop out the mflr. Can we do
>>> this or are there races or other issues with it?
>> 
>> There's a race, isn't there?
>> 
>> We have a function foo which currently has tracing disabled, so the mflr
>> and bl are nop'ed out.
>> 
>>   CPU 0			CPU 1
>>   ==================================
>>   bl foo
>>   nop (ie. not mflr)
>>   -> interrupt
>>   something else	enable tracing for foo
>>   ...			patch mflr and branch
>>   <- rfi
>>   bl _mcount
>> 
>> So we end up in _mcount() but with r0 not populated.
>
> Good catch! Looks like we need to patch the mflr with a "b +8" similar 
> to what we do in __ftrace_make_nop().

Would that actually make it any faster though? Nick?

cheers
