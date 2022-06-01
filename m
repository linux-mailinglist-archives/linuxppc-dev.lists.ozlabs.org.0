Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EBD53A2E5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 12:43:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCm3260sLz3bs9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 20:43:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SGK4Jueb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCm2P0BlJz303H
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 20:43:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SGK4Jueb;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LCm2K1bPjz4xD3;
	Wed,  1 Jun 2022 20:43:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1654080185;
	bh=iUKIUrhMHK4ttrOOu57fetqNzVkHyhKlyYv1yueBWls=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SGK4Juebxf3g8m3c4rLVuRws25FkxlZ5eveJHAkUcrMgTGt9UaAX0DrNYbFHzL5i2
	 23NF7xtrf3xYrRo5er78BniCWkHmv8pjJuHWUMiI30YbuEI6JHmQPGckciddvrI84c
	 x5a+abFo7tJDwTMkHH3M5IXuySY7h0TPWYaGEf9wm63hHceTtQj9bWUrUjD6OmHBME
	 knNCq4zvFUTRI4fy2TdCHKFlFJdrEzw1jqG4XtxTPJEKHLs4l4QR4qYVU4ALyKiO9f
	 M1ByahG/XXWBj6KhJQUp1OBA/Bh6aUXYavw8unwQsoIaSSAeSCVDmi6dqcidJwYC+u
	 UAMFOYfFMJIGA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/64: Drop ppc_inst_as_str()
In-Reply-To: <20220531222715.GT25951@gate.crashing.org>
References: <20220531065936.3674348-1-mpe@ellerman.id.au>
 <20220531222715.GT25951@gate.crashing.org>
Date: Wed, 01 Jun 2022 20:43:01 +1000
Message-ID: <87fskopsui.fsf@mpe.ellerman.id.au>
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
Cc: jniethe5@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> Hi!
>
> On Tue, May 31, 2022 at 04:59:36PM +1000, Michael Ellerman wrote:
>> More problematically it doesn't compile at all with GCC 12, due to the
>> fact that it returns the char buffer declared inside the macro:
>
> It returns a pointer to a buffer on stack.  It is not valid C to access
> that buffer after the function has returned (and indeed it does not
> work, in general).

It's a statement expression though, not a function. So it doesn't return
as such, that would be obviously wrong.

But I'm not a language lawyer, so presumably it's not valid to refer to
the variable after it's gone out of scope.

Although we do use that same pattern in many places where the value of
the expression is a scalar type.

>> A simpler solution is to just print the value as an unsigned long. For
>> normal instructions the output is identical. For prefixed instructions
>> the value is printed as a single 64-bit quantity, whereas previously the
>> low half was printed first. But that is good enough for debug output,
>> especially as prefixed instructions will be rare in practice.
>
> Prefixed insns might be somewhat rare currently, but it will not stay
> that way.

These are all printing kernel instructions, not userspace. I should have
said that in the change log.

The kernel doesn't build for -mcpu=power10 because we haven't done any
changes for pcrel.

We will do that one day, but not soon.

> It is not hard to fix the problem here?  The only tricky part is that
> ppc_inst_as_ulong swaps the two halves for LE, for as far as I can see
> no reason at all :-(
>
> If it didn't it would be easy to detect prefixed insns (because they
> then are guaranteed to be > 0xffffffff), and it is easy to print them
> with a space between the two opcodes, with a utility function:
>
> void print_insn_bytes_nicely(unsigned long insn)
> {
> 	if (insn > 0xffffffff)
> 		printf("%08x ", insn >> 32);
> 	printf("%08x", insn & 0xffffffff);
> }

We don't want to do that because it can lead to interleaving messages
between different CPUs in the kernel log.

In the medium term there's some changes to printk that might land soon
(printbuf), which would mean we could more easily define a custom printk
formatter for printing prefixed instructions.

cheers
