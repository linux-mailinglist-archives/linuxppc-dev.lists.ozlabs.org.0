Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA73116B8A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 11:55:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Wg7h04tGzDqQl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 21:54:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Wg5m2RCkzDqGZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 21:53:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="J4L8Im/v"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47Wg5l45Wvz9sP6;
 Mon,  9 Dec 2019 21:53:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1575888796;
 bh=Sx8iWlX5fXNNlqxjgYMOs3SvPENuiEFrugWvdXWYq5o=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=J4L8Im/vg/Tt++EhvqfFa7Bo1cQsG4hCAPfpeP2fg44UAP67R/2X7N0oTcZHNRpWj
 oVJIHl24WiU8flkmL4B/x/bmIjVnPQHFYMPPxtC+4Zahmt162zCOWwzYIqDCIsMWOw
 LQF07hgKMnLUlSeXMIty4R9ZIL6VBU6mPLEMMufnGZSLg6hoQwlDUGzT/yWsmfbLzA
 A7fr4MWpjDvvR2rWKrmrz4HD0hhTDufo4iXGgumnh1XR18Tc017OCuf6wb1nd2sST3
 8os8Hx7trY8PNyubwVGnBZjAAS3smHHf2sjXQ9i/+bBQmP4lZPeMM2PGxURE+MSWlU
 zD64Hn9ejlcFw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v4 2/2] powerpc/irq: inline call_do_irq() and
 call_do_softirq()
In-Reply-To: <20191207174057.GY3152@gate.crashing.org>
References: <20191121101552.GR16031@gate.crashing.org>
 <87y2w49rgo.fsf@mpe.ellerman.id.au> <20191125142556.GU9491@gate.crashing.org>
 <5fdb1c92-8bf4-01ca-f81c-214870c33be3@c-s.fr>
 <20191127145958.GG9491@gate.crashing.org>
 <2072e066-1ffb-867e-60ec-04a6bb9075c1@c-s.fr>
 <20191129184658.GR9491@gate.crashing.org>
 <ebc67964-e5a9-acd0-0011-61ba23692f7e@c-s.fr>
 <20191206205953.GQ3152@gate.crashing.org>
 <2a22feca-d6d6-6cb0-6c76-035234fa8742@c-s.fr>
 <20191207174057.GY3152@gate.crashing.org>
Date: Mon, 09 Dec 2019 21:53:11 +1100
Message-ID: <878snlrcrs.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> On Sat, Dec 07, 2019 at 10:42:28AM +0100, Christophe Leroy wrote:
>> Le 06/12/2019 =C3=A0 21:59, Segher Boessenkool a =C3=A9crit=C2=A0:
>> >If the compiler can see the callee wants the same TOC as the caller has,
>> >it does not arrange to set (and restore) it, no.  If it sees it may be
>> >different, it does arrange for that (and the linker then will check if
>> >it actually needs to do anything, and do that if needed).
>> >
>> >In this case, the compiler cannot know the callee wants the same TOC,
>> >which complicates thing a lot -- but it all works out.
>>=20
>> Do we have a way to make sure which TOC the functions are using ? Is=20
>> there several TOC at all in kernel code ?
>
> Kernel modules have their own TOC, I think?

Yes.

>> >I think things can still go wrong if any of this is inlined into a kern=
el
>> >module?  Is there anything that prevents this / can this not happen for
>> >some fundamental reason I don't see?
>>=20
>> This can't happen can it ?
>> do_softirq_own_stack() is an outline function, defined in powerpc irq.c
>> Its only caller is do_softirq() which is an outline function defined in=
=20
>> kernel/softirq.c
>>=20
>> That prevents inlining, doesn't it ?
>
> Hopefully, sure.  Would be nice if it was clearer that this works...  It
> is too much like working by chance, the way it is :-(

There's no way any of that code can end up in a module. Or at least if
there is, that's a bug.

>> Anyway, until we clarify all this I'll limit my patch to PPC32 which is=
=20
>> where the real benefit is I guess.
>>=20
>> At the end, maybe the solution should be to switch to IRQ stack=20
>> immediately in the exception entry as x86_64 do ?

Yeah that might be cleaner.

cheers
