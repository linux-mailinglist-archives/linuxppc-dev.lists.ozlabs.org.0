Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E72A67E249
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 11:53:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3Dvg0Bb1z3fGr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 21:53:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gNVZkfaf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3Dth6RXXz3fDT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 21:52:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gNVZkfaf;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P3Dtd620gz4xGq;
	Fri, 27 Jan 2023 21:52:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1674816762;
	bh=QDCzctob2hZHnjNozBUiQhZ3c3ZIA5hUvy/sWV7Il00=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gNVZkfafjj2MpgzETy//HzY37m8ZEoLJYzM81q+qE82zMDjKzSTib1kQlCEWeD74x
	 TbA1AJAUzh3UF1b5tIvdicaCY2B8X01OR7xZ+m53Vy0nOtJ3LUefqcxOGiX0TbLzXA
	 FpQsTEBfIY6ln8br4aEbGhYCfvHI2Wk46905hzvGFT43HVNg3I805NGwAjRxWwHRl9
	 ciLHepcbgn/Ugqz751JfDEzRYwbKTR7RwnvTILKfsIiP/YeV8O7KVE1eCo7xwgRE4m
	 oSO3tekfSTlDRy5WvqPzKwaZSDNgEJN4FzrYuWbIZD/efUVviZaorDQh40DV8VzXAt
	 Uy3JBixutSBJQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v4 02/24] powerpc/pseries: Fix alignment of PLPKS
 structures and buffers
In-Reply-To: <20230126171925.GN25951@gate.crashing.org>
References: <20230120074306.1326298-1-ajd@linux.ibm.com>
 <20230120074306.1326298-3-ajd@linux.ibm.com>
 <87pmb2pxpa.fsf@mpe.ellerman.id.au>
 <20230126171925.GN25951@gate.crashing.org>
Date: Fri, 27 Jan 2023 21:52:31 +1100
Message-ID: <871qngtfkg.fsf@mpe.ellerman.id.au>
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
Cc: gjoyce@linux.ibm.com, Andrew Donnellan <ajd@linux.ibm.com>, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, sudhakar@linux.ibm.com, ruscur@russell.cc, joel@jms.id.au, bgray@linux.ibm.com, linux-integrity@vger.kernel.org, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> On Thu, Jan 26, 2023 at 12:09:53AM +1100, Michael Ellerman wrote:
>> Andrew Donnellan <ajd@linux.ibm.com> writes:
>> > A number of structures and buffers passed to PKS hcalls have alignment
>> > requirements, which could on occasion cause problems:
>> >
>> > - Authorisation structures must be 16-byte aligned and must not cross a
>> >   page boundary
>> >
>> > - Label structures must not cross page boundaries
>> >
>> > - Password output buffers must not cross page boundaries
>> >
>> > Round up the allocations of these structures/buffers to the next power of
>> > 2 to make sure this happens.
>> 
>> It's not the *next* power of 2, it's the *nearest* power of 2, including
>> the initial value if it's already a power of 2.
>
> It's not the nearest either, the nearest power of two to 65 is 64.  You
> could say "but, round up" to which I would say "round?"  :-P

OK you got me there :)

The function name makes it pretty clear that it will round *up* to the
nearest power of 2 but you're right the comment should also make that
clear.

> "Adjust the allocation size to be the smallest power of two greater than
> or equal to the given size."
>
> "Pad to a power of two" in shorthand.  "Padded to a power of two if
> necessary" if you want to emphasise it can be a no-op.

The initial wording implied that it would always over-allocate so yes I
think it's important to make it clear that it doesn't round up if it
doesn't need to.

cheers
