Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1B314BD73
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 17:07:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486WjD4FbQzDqLp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 03:07:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=fweimer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Tnx1OWD8; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486Wff48qVzDqHP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 03:05:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580227508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dXTkPXl/tu7RuX9f4rXynhUljW/M7K4QV/dNrKPLNjo=;
 b=Tnx1OWD8Zk31cmg+aN5NMzdSLX9MA7EVnSyXylbNpObwydhZ0EDZ0YQjc6jRtmS3s9Ei5/
 Srmc/6lxIyZMP2QShQeJ9qG2Hn5iax9OQ/YmVkhBK737kayPY+IkuTGl7TCrDywHN/hr/a
 i8idPAhIi8fayWoobCIuGrlZX3aICH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-tU7QKQR4MvmIbows2bWngw-1; Tue, 28 Jan 2020 11:04:53 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0F35CF992;
 Tue, 28 Jan 2020 16:04:52 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (unknown [10.36.118.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9533648;
 Tue, 28 Jan 2020 16:04:51 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: powerpc Linux scv support and scv system call ABI proposal
References: <1580207907.c96c1lh9t0.astroid@bobo.none>
 <87tv4fd8wp.fsf@oldenburg2.str.redhat.com>
 <1580218232.2tezmthp1x.astroid@bobo.none>
 <20200128154026.GI22482@gate.crashing.org>
Date: Tue, 28 Jan 2020 17:04:49 +0100
In-Reply-To: <20200128154026.GI22482@gate.crashing.org> (Segher Boessenkool's
 message of "Tue, 28 Jan 2020 09:40:26 -0600")
Message-ID: <87o8unbm8u.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: tU7QKQR4MvmIbows2bWngw-1
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

>> > I don't think we can save LR in a regular register around the system
>> > call, explicitly in the inline asm statement, because we still have to
>> > generate proper unwinding information using CFI directives, something
>> > that you cannot do from within the asm statement.
>
> Why not?

As far as I knowm there isn't a CFI directive that allows us to restore
the CFI state at the end of the inline assembly.  If we say that LR is
stored in a different register than what the rest of the function uses,
that would lead to incorrect CFI after the exit of the inline assembler
fragment.

At least that's what I think.  Compilers aren't really my thing.

>
>> >> - Error handling: use of CR0[SO] to indicate error requires a mtcr / =
mtocr
>> >>   instruction on the kernel side, and it is currently not implemented=
 well
>> >>   in glibc, requiring a mfcr (mfocr should be possible and asm goto s=
upport
>> >>   would allow a better implementation). Is it worth continuing this s=
tyle of
>> >>   error handling? Or just move to -ve return means error? Using a dif=
ferent
>> >>   bit would allow the kernel to piggy back the CR return code setting=
 with
>> >>   a test for the error case exit.
>> >=20
>> > GCC does not model the condition registers,
>
> Huh?  It does model the condition register, as 8 registers in GCC's
> internal model (one each for CR0..CR7).

But GCC doesn't expose them as integers to C code, so you can't do much
without them.

>> >> - Should this be for 64-bit only? 'scv 1' could be reserved for 32-bi=
t
>> >>   calls if there was interest in developing an ABI for 32-bit program=
s.
>> >>   Marginal benefit in avoiding compat syscall selection.
>> >=20
>> > We don't have an ELFv2 ABI for 32-bit.  I doubt it makes sense to
>> > provide an ELFv1 port for this given that it's POWER9-specific.
>
> We *do* have a 32-bit LE ABI.  And ELFv1 is not 32-bit either.  Please
> don't confuse these things :-)
>
> The 64-bit LE kernel does not really support 32-bit userland (or BE
> userland), *that* is what you want to say.

Sorry for the confusion.  Is POWER9 running kernels which are not 64-bit
LE really a thing in practice, though?

>> > From the glibc perspective, the major question is how we handle run-ti=
me
>> > selection of the system call instruction sequence.
>
> Well, if it is inlined you don't have this problem either!  :-)

How so?  We would have to put the conditional sequence into all inline
system calls, of course.

Thanks,
Florian

