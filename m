Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF995F73F5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 07:32:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkH4q4Zl4z3bk4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 16:32:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RjbUR3Li;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkH3v5BlBz305M
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 16:31:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RjbUR3Li;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MkH3m73V2z4x1R;
	Fri,  7 Oct 2022 16:31:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1665120693;
	bh=hZjbLctkfqpcbBfwnfbJm1TRSfkadNUweBxkhRoqmH8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RjbUR3LieWshzd2mciLDapk/VAKuDBkBjkJLAEF1nqx3oW1i+MgWYI8207O8J1MAT
	 rJuXgXb+hTCKa6/n4wZ94lq7zoliegMiAs8OzfikZV94N1+KamyKr4R+gPSHxjKiyo
	 80anmu0CwgkUKYabD6n+zq7OaCmRraLanEp/ATgjYcOVGZuSjK3iSO1tcSyXusr04j
	 mqOA18tXD31GxxpugkixShF3UOwNxa7KtLadUpcCRz03CdsjjG4gdJIKoRPrDLBCxT
	 Kh+DLLED7afpOTSrkc2jjJbpG6BR5F6lkxaF3vwatrNOUwAkO2ahZpvrYvcIv2pJe+
	 DHy415BpfA5ig==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Segher Boessenkool
 <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/64s: POWER10 CPU Kconfig build option
In-Reply-To: <CNF91RLXUENG.32NIZ5S1R3UCZ@bobo>
References: <20220923033004.536127-1-npiggin@gmail.com>
 <20221006195411.GS25951@gate.crashing.org>
 <CNF6C5XSIE75.3R12NULNLHEN2@bobo>
 <20221006232345.GW25951@gate.crashing.org>
 <CNF91RLXUENG.32NIZ5S1R3UCZ@bobo>
Date: Fri, 07 Oct 2022 16:31:28 +1100
Message-ID: <87wn9cnqrz.fsf@mpe.ellerman.id.au>
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

"Nicholas Piggin" <npiggin@gmail.com> writes:
> On Fri Oct 7, 2022 at 9:23 AM AEST, Segher Boessenkool wrote:
>> On Fri, Oct 07, 2022 at 07:56:09AM +1000, Nicholas Piggin wrote:
>> > On Fri Oct 7, 2022 at 5:54 AM AEST, Segher Boessenkool wrote:
>> > > On Fri, Sep 23, 2022 at 01:30:04PM +1000, Nicholas Piggin wrote:
...
>> > > > +# No AltiVec or VSX or MMA instructions when building kernel
>> > > >  KBUILD_CFLAGS += $(call cc-option,-mno-altivec)
>> > > >  KBUILD_CFLAGS += $(call cc-option,-mno-vsx)
>> > > > +KBUILD_CFLAGS += $(call cc-option,-mno-mma)
>> > >
>> > > MMA code is never generated unless the code asks for it explicitly.
>> > > This is fundamental, not just an implementations side effect.
>> > 
>> > Well, now it double won't be generated :)
>>
>> Yeah, but there are many other things you can unnecessarily disable as
>> well!  :-)
>>
>> VMX and VSX are disabled here because the compiler *will* use those
>> registers if it feels like it (that is, if it thinks that will be
>> faster).  MMA is a very different beast: the compiler can never know if
>> it will be faster, to start with.
>
> True, but now I don't have to find the exact clause and have my lawyer
> confirm that it definitely probably won't change in future and break
> things.

Right. If someone asks "does the kernel ever use MMA instructions?" we
can just point at that line and we have a definite answer. No need to
audit the behaviour of all GCC and Clang versions ever released.

cheers
