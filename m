Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9617CF776
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 13:51:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Rmar2YgE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SB5fL0Lqrz3cRY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 22:51:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Rmar2YgE;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SB5dT5s3Lz3cN6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 22:50:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697716249;
	bh=QVNmT0LMj8mt5yv4FZ1LFFQtgL5o7wdHisErTaVs4hE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Rmar2YgEngG8pbe1XRhd/jpc3FiE/6WmFa6NDuRcLlK6yAxHuJMH6qD9lDSfW+6az
	 3wWovzJWSHUNxe5sHAgGmOT7F7cZuePWOnfokLxsY1ulLzAzVBPjEFMECw4Gr0ETwZ
	 1YZ+aboGXQFo+H+gnshFjMoIqfZvlNiezc8WFyFrDnHNlkNlhBb2OoPS7AfRacnTkC
	 EDBqTflVoGwLTRmbNUZvlk7eA3PX/PAuTHG5Ke4fwRxANfX/nr2KMKjmbQZSbvLstA
	 w7axDAUvC56hYILjiXhau9N65HeHs/V7qlBFnwopA+nPzAWUB9wgnYbKg9wfy07EcJ
	 Ao+1wEY0JMulw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SB5dM5p59z4xZm;
	Thu, 19 Oct 2023 22:50:47 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 2/6] powerpc/smp: Enable Asym packing for cores on
 shared processor
In-Reply-To: <20231019074828.GM33217@noisy.programming.kicks-ass.net>
References: <20231018163751.2423181-1-srikar@linux.vnet.ibm.com>
 <20231018163751.2423181-3-srikar@linux.vnet.ibm.com>
 <87v8b35ir3.fsf@mail.lhotse>
 <20231019074828.GM33217@noisy.programming.kicks-ass.net>
Date: Thu, 19 Oct 2023 22:50:43 +1100
Message-ID: <87h6mm6dbg.fsf@mail.lhotse>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Peter Zijlstra <peterz@infradead.org> writes:
> On Thu, Oct 19, 2023 at 03:38:40PM +1100, Michael Ellerman wrote:
>> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
>> > If there are shared processor LPARs, underlying Hypervisor can have more
>> > virtual cores to handle than actual physical cores.
>> >
>> > Starting with Power 9, a core has 2 nearly independent thread groups.
>> 
>> You need to be clearer here that you're talking about "big cores", not
>> SMT4 cores as seen on bare metal systems.
>
> What is a 'big core' ? I'm thinking big.LITTLE, but I didn't think Power
> went that route (yet?).. help?

No it's not big.LITTLE :)

It means we have two SMT4 cores glued together that behave as a single
SMT8 core, a system is either in "big core" mode or it's not, it's never
heterogeneous.

If you grep for "big_core" there's some code in the kernel for dealing
with it, though it's probably not very illuminating.

Possibly we should switch to using the "thread group" terminology, so
that it doesn't confuse folks about big.LITTLE. Also the device tree
property that we use to discover if we're using big cores is called
ibm,thread-groups.

cheers
