Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA64564386B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 23:51:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQzKx69L0z3bhV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 09:51:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=sBNn/PWD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQzK05Zl2z3bSp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Dec 2022 09:50:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=sBNn/PWD;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NQzJx3NtCz4xP9;
	Tue,  6 Dec 2022 09:50:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1670280611;
	bh=FNsUgJ4FY4mftzXnZsxTHw8V/RkJzfvhTQjoxw+A9u8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sBNn/PWDAk5aGDHOQQNW1NEGjnuKVmBDghLBo+OS97RfnE9Y49J4BQvAzkLvi5XE6
	 UXOy6IZMJCfhCyRP9N5oFPnb4ooxy+m+MtJazKxH4va1fIFJUIeOTlNCNia4zPhQPy
	 nA69eP4m0wz6AbNVR697lJK821TSPTvzorKgRkEbsp4t95knr8VPw+18W+yZjjZJcS
	 ghNbSyKQqgiXnpEmoQd1NGQO+O6O4BIuoCxzJ5kopp0rnbhSDyXGM0FnZ6W1KXkkpS
	 8PeAEjbeRLgZ3ltZjP5BJNCDan2h2qYAEMT1gdFg5SUlRgccqy6Xf5dA0momIcWAvY
	 n/TfJUdI8GRLw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michael Jeanson <mjeanson@efficios.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] powerpc/ftrace: fix syscall tracing on PPC64_ELF_ABI_V1
In-Reply-To: <dfe0b9ba-828d-e1a5-f9a3-416c6b5b1cf3@efficios.com>
References: <20221201161442.2127231-1-mjeanson@efficios.com>
 <87pmcys9ae.fsf@mpe.ellerman.id.au>
 <d5dd1491-5d59-7987-9b5b-83f5fb1b29ee@efficios.com>
 <219580de-7473-f142-5ef2-1ed40e41d13d@csgroup.eu>
 <323f83c7-38fe-8a12-d77a-0a7249aad316@efficios.com>
 <dfe0b9ba-828d-e1a5-f9a3-416c6b5b1cf3@efficios.com>
Date: Tue, 06 Dec 2022 09:50:08 +1100
Message-ID: <87mt81sbxb.fsf@mpe.ellerman.id.au>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Masami Hiramatsu <mhiramat@kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Michal Suchanek <msuchanek@suse.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Jeanson <mjeanson@efficios.com> writes:
> On 2022-12-05 15:11, Michael Jeanson wrote:
>>>>> Michael Jeanson <mjeanson@efficios.com> writes:
>>>>>> In v5.7 the powerpc syscall entry/exit logic was rewritten in C, on
>>>>>> PPC64_ELF_ABI_V1 this resulted in the symbols in the syscall table
>>>>>> changing from their dot prefixed variant to the non-prefixed ones.
>>>>>>
>>>>>> Since ftrace prefixes a dot to the syscall names when matching them to
>>>>>> build its syscall event list, this resulted in no syscall events being
>>>>>> available.
>>>>>>
>>>>>> Remove the PPC64_ELF_ABI_V1 specific version of
>>>>>> arch_syscall_match_sym_name to have the same behavior across all powerpc
>>>>>> variants.
>>>>>
>>>>> This doesn't seem to work for me.
>>>>>
>>>>> Event with it applied I still don't see anything in
>>>>> /sys/kernel/debug/tracing/events/syscalls
>>>>>
>>>>> Did we break it in some other way recently?
>>>>>
>>>>> cheers
>
> I did some further testing, my config also enabled KALLSYMS_ALL, when I remove 
> it there is indeed no syscall events.

Aha, OK that explains it I guess.

I was using ppc64_guest_defconfig which has ABI_V1 and FTRACE_SYSCALLS,
but does not have KALLSYMS_ALL. So I guess there's some other bug
lurking in there.

cheers
