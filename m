Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4686F57F877
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 05:28:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lrlr40R8mz3cFj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 13:28:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Qli62PWl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LrlqS33VCz2xrj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 13:28:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Qli62PWl;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LrlqJ4JqJz4x2c;
	Mon, 25 Jul 2022 13:27:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658719679;
	bh=A3dlRpormEhO28f6h4590b/Lcp+iomzysnEq+1J3zUI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Qli62PWlLtfkcruNXsG+1tXJVDfSdJ9RoE7TOymCZkkfXrOZ88+xe9q4ltmmke0Bx
	 MNoJueQXngwN2gBbxS8Jplqn6WjAn2MMFDWRZvGvdVhTgJeB6G7rHk9KGvlPdFlr+/
	 VzJ12EHGgqwXUnmJrXCrTjJUArBz8C8OtU7Lm8IbIchR7cuAnZSFZ/WmAyZLkNoguB
	 Qn1HyOWZYQu3PoPolFSVERizYUX7wao9m9UM1/nT590VRpTaI0G2bK5Y4LeYoLS+C/
	 MrarpZE3UUxmLOZaHSCMrFsoQRjTi0vokj0qGMbMLsL4wFKSGPzNrP7rv50EzKMznt
	 AWlbGlh1tJf4Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>, Michal =?utf-8?Q?Such?=
 =?utf-8?Q?=C3=A1nek?=
 <msuchanek@suse.de>
Subject: Re: [PATCH] powerpc: Remove the static variable initialisations to 0
In-Reply-To: <20220723192211.GP25951@gate.crashing.org>
References: <20220723092436.7149-1-wangborong@cdjrlc.com>
 <20220723133405.GF17705@kitsune.suse.cz>
 <20220723192211.GP25951@gate.crashing.org>
Date: Mon, 25 Jul 2022 13:27:52 +1000
Message-ID: <87fsipdg7b.fsf@mpe.ellerman.id.au>
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
Cc: lkp@intel.com, linux-kernel@vger.kernel.org, Jason Wang <wangborong@cdjrlc.com>, Julia.Lawall@inria.fr, paulus@samba.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> On Sat, Jul 23, 2022 at 03:34:05PM +0200, Michal Such=C3=A1nek wrote:
>> Hello,
>>=20
>> On Sat, Jul 23, 2022 at 05:24:36PM +0800, Jason Wang wrote:
>> > Initialise global and static variable to 0 is always unnecessary.
>> > Remove the unnecessary initialisations.
>>=20
>> Isn't this change also unnecessary?
>>=20
>> Initializing to 0 does not affect correctness, or even any kind of
>> semantics in any way.
>
> It did make a difference when the kernel was still compiled with
> -fcommon (which used to be the GCC default on most configurations, it is
> traditional on Unix).  No explicit initialiser puts an object in .bss if
> you use -fcommon.  This matters a bit for data layout.

The kernel has built with -fno-common since ~2002.

I think the belief is that an explicit initialiser of 0 forces the
variable into .data, but AFAICS that is not true with any compiler we
support.

cheers
