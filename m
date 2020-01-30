Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4369914D936
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 11:44:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487cRd2LRvzDqYY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 21:44:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=fweimer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=d+Ixtu1J; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487cQ12vcLzDqXP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 21:43:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580380978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a6Ginh0j5d7XoUqTZZ2aGUPtIjlN67TMT+PMSjfhxdo=;
 b=d+Ixtu1JgPNTDL4WQwQ0Cb9t92anw8R8hDFPaSnaWrndB/Tv5JTTUMq/k+W7uuBZdO0y0x
 P4CPXKulADkNjNp669lp0659QvLv64jBcFYCUi8aLthnibWmhrAsyaxvfZTGyRaWnI1cMB
 Dnbbn7k2mPpMDzPrMeWKJZfzjgSzVd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-eALbzks0ObO4fGREEnG1AQ-1; Thu, 30 Jan 2020 05:42:56 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9F431005513;
 Thu, 30 Jan 2020 10:42:54 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-116-29.ams2.redhat.com
 [10.36.116.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 215E487B13;
 Thu, 30 Jan 2020 10:42:52 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: powerpc Linux scv support and scv system call ABI proposal
References: <1580207907.c96c1lh9t0.astroid@bobo.none>
 <87tv4fd8wp.fsf@oldenburg2.str.redhat.com>
 <1580218232.2tezmthp1x.astroid@bobo.none>
 <20200128154026.GI22482@gate.crashing.org>
 <87o8unbm8u.fsf@oldenburg2.str.redhat.com>
 <20200128200133.GJ22482@gate.crashing.org>
 <87wo9a8cc8.fsf@oldenburg2.str.redhat.com>
 <20200129162947.GN22482@gate.crashing.org>
 <87imku8ac5.fsf@oldenburg2.str.redhat.com>
 <20200129175104.GO22482@gate.crashing.org>
Date: Thu, 30 Jan 2020 11:42:51 +0100
In-Reply-To: <20200129175104.GO22482@gate.crashing.org> (Segher Boessenkool's
 message of "Wed, 29 Jan 2020 11:51:04 -0600")
Message-ID: <87k1595iok.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: eALbzks0ObO4fGREEnG1AQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: libc-alpha@sourceware.org,
 Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Segher Boessenkool:

> On Wed, Jan 29, 2020 at 06:02:34PM +0100, Florian Weimer wrote:
>> * Segher Boessenkool:
>>=20
>> > On Wed, Jan 29, 2020 at 05:19:19PM +0100, Florian Weimer wrote:
>> >> * Segher Boessenkool:
>> >> >> But GCC doesn't expose them as integers to C code, so you can't do=
 much
>> >> >> without them.
>> >> >
>> >> > Sure, it doesn't expose any other registers directly, either.
>> >>=20
>> >> I can use r0 & 1 with a register variable r0 to check a bit.
>> >
>> > That is not reliable, or supported, and it *will* break.  This is
>> > explicit for local register asm, and global register asm is
>> > underdefined.
>>=20
>> Ugh.  I did not know that.  And neither did the person who wrote
>> powerpc64/sysdep.h because it uses register variables in regular C
>> expressions. 8-(  Other architectures are affected as well.
>
> Where?  I don't see any?  Ah, the other one, heh (there are two).
>
> No, that *is* supported: as input to or output from an asm, a local
> register asm variable *is* guaranteed to live in the specified register.
> This is the *only* supported use.  Other uses may sometimes still work,
> but they never worked reliably, and it cannot be made reliable; it has
> been documented as not supported since ages, and it will not work at all
> anymore some day.

I must say I find this situation *very* confusing.

You said that r0 & 1 is undefined.  I *assumed* that I would still get
the value of r0 (the register) from the associated extended asm in this
expression, even if it may now be a different register.  Your comment
made me think that this is undefined.  But then the syscall wrappers use
this construct:

    __asm__ __volatile__=09=09=09=09=09=09\
      ("sc\n\t"=09=09=09=09=09=09=09=09\
       "mfcr  %0\n\t"=09=09=09=09=09=09=09\
       "0:"=09=09=09=09=09=09=09=09\
       : "=3D&r" (r0),=09=09=09=09=09=09=09\
         "=3D&r" (r3), "=3D&r" (r4), "=3D&r" (r5),=09=09=09=09\
         "=3D&r" (r6), "=3D&r" (r7), "=3D&r" (r8)=09=09=09=09\
       : ASM_INPUT_##nr=09=09=09=09=09=09=09\
       : "r9", "r10", "r11", "r12",=09=09=09=09=09\
         "cr0", "ctr", "memory");=09=09=09=09=09\
=09  err =3D r0;  \
    r3;  \

That lone r3 at the end would be equally undefined because it is not
used in an input or output operand of an extended asm statement.

The GCC documentation has this warning:

|  _Warning:_ In the above example, be aware that a register (for
| example 'r0') can be call-clobbered by subsequent code, including
| function calls and library calls for arithmetic operators on other
| variables (for example the initialization of 'p2').

On POWER, the LOADARGS macros attempt to deal with this by using
non-register temporaries.  However, I don't know how effective this is
if the compiler really doesn't deal with call-clobbered registers
properly.

For the extended asm use case (to express register assignments that
cannot be listed in constraints), I would expect that these variables
retain their values according to the C specification (so they are never
clobbered by calls), but that they only reside in their designated
registers when used as input or output operands in extended asm
statements.

However, this is incompatible with other (ab)uses of local and global
register variables, which may well expect that they are clobbered by
calls.  It looks like GCC uses the same construct for two unrelated
things.

Thanks,
Florian

