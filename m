Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BE15F5DF0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 02:40:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjXfk2NBHz3bn4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 11:40:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=idaYoGc2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjXdm3PKJz2xWx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 11:39:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=idaYoGc2;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MjXdj1qk7z4x1R;
	Thu,  6 Oct 2022 11:39:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1665016795;
	bh=VgKyTetjBIj7t4bxbJTxgwzXjrZ/qT4U2yn9jPLKO/I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=idaYoGc29O9AQ/WnIHughfZP/tIMSGzVi3G0CCDwO4vUPJ4sMqEPwaKbUX6n0dbNu
	 5eA1nGksWNRgrg8xDYlWh6T3TDf5csS0YZUfEcpWQVmmfJ6UD7/DjxFyZghkj+nQ2H
	 FMHhwfVmScm15kswukTEVcRTDNaxRQZIne49tA9ep9StUe7X2+7sKbRT9YT6pWet3v
	 3rxYrPMy9maw+1kewL4plIh8WoS+oVWUGmiAMdMLo0shdz2NnQYMhqWeyyhPtE9v10
	 2opqblb+5kVMJQboTvdPgqyyuMSEmgvGi39UebyPO2fA5QfnGZm1o4bS3umHajoQ/p
	 6XNa6LOj2+qlA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Gray
 <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v3 5/6] powerpc/64: Add support for out-of-line static
 calls
In-Reply-To: <b76d122b-5487-b677-11e1-58e53a6b521f@csgroup.eu>
References: <20221005053234.29312-1-bgray@linux.ibm.com>
 <20221005053234.29312-6-bgray@linux.ibm.com>
 <b76d122b-5487-b677-11e1-58e53a6b521f@csgroup.eu>
Date: Thu, 06 Oct 2022 11:39:50 +1100
Message-ID: <878rltpyy1.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "ardb@kernel.org" <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 05/10/2022 =C3=A0 07:32, Benjamin Gray a =C3=A9crit=C2=A0:
>> Implement static call support for 64 bit V2 ABI. This requires making
>> sure the TOC is kept correct across kernel-module boundaries. As a
>> secondary concern, it tries to use the local entry point of a target
>> wherever possible. It does so by checking if both tramp & target are
>> kernel code, and falls back to detecting the common global entry point
>> patterns if modules are involved. Detecting the global entry point is
>> also required for setting the local entry point as the trampoline
>> target: if we cannot detect the local entry point, then we need to
>> convservatively initialise r12 and use the global entry point.
>>=20
>> The trampolines are marked with `.localentry NAME, 1` to make the
>> linker save and restore the TOC on each call to the trampoline. This
>> allows the trampoline to safely target functions with different TOC
>> values.
>>=20
>> However this directive also implies the TOC is not initialised on entry
>> to the trampoline. The kernel TOC is easily found in the PACA, but not
>> an arbitrary module TOC. Therefore the trampoline implementation depends
>> on whether it's in the kernel or not. If in the kernel, we initialise
>> the TOC using the PACA. If in a module, we have to initialise the TOC
>> with zero context, so it's quite expensive.
>>=20
>> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
>
> This looks good to me
>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>
> However, thinking out loudly, I'm wondering, could we make things any=20
> simpler when CONFIG_MODULES is not selected, or is that a too much=20
> corner case on PPC64 ?

I'd say it's mostly a corner case.

Obviously no distros ship with modules disabled.=20

AFAIK even the stripped down kernels we use in CPU bringup have modules
enabled.

So I think it's probably not worth worrying about, unless there's an
obvious and fairly simple optimisation.

cheers
