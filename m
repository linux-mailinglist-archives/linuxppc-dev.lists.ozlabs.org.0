Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C32925FAFF2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 12:01:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mmrs44s6Nz3dw5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 21:01:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Z1xv0caE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mmrr96sr6z3bP1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 21:00:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Z1xv0caE;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mmrr955PXz4xGl;
	Tue, 11 Oct 2022 21:00:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1665482425;
	bh=jTNpC/83zi25X5OXSPkigIE3/qAhV8pkp82d8ZJjJzA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Z1xv0caEt+B8EgXfs6nTYmrlvbAifLejDN79Xs+1ugUSEmT8OflB/uMXvRcVkSBH0
	 DA6598yUjO7JhNB2YhTPKWrcf5UsewHiyJadFF8GhImyBHxOeVxQEEVyvez2nxSuQA
	 u7y/s1djkRnsT4sfYMSKpqO9zezLSqt1EFJlLDnlcKpkuKfOI9r8WDV/vYSCIxau/a
	 Hn7fczkbiNJwW5On5QyxcuWxgDnvOV9SI8sUkTsibfpFzQHBjf2yczLr6ryBmBvi3D
	 YZKnmtQ13NCqQVqLoEwiKmVdQ4Pjrr2YS6fM6DZ2kiZMtaWduR97/HqOtfOq+ZVQ2c
	 xZy1w2GeIOklA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/kasan/book3s_64: warn when running with hash MMU
In-Reply-To: <8735bvbwgy.fsf@linux.ibm.com>
References: <20221004223724.38707-1-nathanl@linux.ibm.com>
 <874jwhpp6g.fsf@mpe.ellerman.id.au>
 <9b6eb796-6b40-f61d-b9c6-c2e9ab0ced38@csgroup.eu>
 <87h70for01.fsf@mpe.ellerman.id.au> <8735bvbwgy.fsf@linux.ibm.com>
Date: Tue, 11 Oct 2022 21:00:25 +1100
Message-ID: <87v8oqn0hy.fsf@mpe.ellerman.id.au>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, kasan-dev <kasan-dev@googlegroups.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> + KASAN list
>>>
>>> Le 06/10/2022 =C3=A0 06:10, Michael Ellerman a =C3=A9crit=C2=A0:
>>>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>>>> kasan is known to crash at boot on book3s_64 with non-radix MMU. As
>>>>> noted in commit 41b7a347bf14 ("powerpc: Book3S 64-bit outline-only
>>>>> KASAN support"):
>>>>>
>>>>>    A kernel with CONFIG_KASAN=3Dy will crash during boot on a machine
>>>>>    using HPT translation because not all the entry points to the
>>>>>    generic KASAN code are protected with a call to kasan_arch_is_read=
y().
>>>>=20
>>>> I guess I thought there was some plan to fix that.
>>>
>>> I was thinking the same.
>>>
>>> Do we have a list of the said entry points to the generic code that are=
=20
>>> lacking a call to kasan_arch_is_ready() ?
>>>
>>> Typically, the BUG dump below shows that kasan_byte_accessible() is=20
>>> lacking the check. It should be straight forward to add=20
>>> kasan_arch_is_ready() check to kasan_byte_accessible(), shouldn't it ?
>>
>> Yes :)
>>
>> And one other spot, but the patch below boots OK for me. I'll leave it
>> running for a while just in case there's a path I've missed.
>
> It works for me too, thanks (p8 pseries qemu).

It works but I still see the kasan shadow getting mapped, which we would
ideally avoid.

From PTDUMP:

---[ kasan shadow mem start ]---
0xc00f000000000000-0xc00f00000006ffff  0x00000000045e0000       448K       =
  r  w       pte  valid  present        dirty  accessed
0xc00f3ffffffe0000-0xc00f3fffffffffff  0x0000000004d80000       128K       =
  r  w       pte  valid  present        dirty  accessed

I haven't worked out how those are getting mapped.

> This avoids the boot-time oops, but kasan remains unimplemented for hash
> mmu. Raising the question: with the trivial crashes addressed, is the
> current message ('KASAN not enabled as it requires radix!') sufficient
> to notify developers (such as me, a week ago) who mean to use kasan on a
> book3s platform, unaware that it's radix-only? Would a WARN or something
> more prominent still be justified?
>
> I guess people will figure it out as soon as they think to search the
> kernel log for 'KASAN'...

Yeah, I think a warning is a bit too strong. I think that's more likely
to lead to bug reports than anything :)

cheers
