Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4688314B4B6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 14:15:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486Rt6420CzDqMB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 00:14:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=fweimer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=f4VU3WzB; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486Rmk4ctMzDqGM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 00:10:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580217006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0TQh1VQ4rJi3aK1/IC/77NF0tZ+JqEUJxpOllUV1B6w=;
 b=f4VU3WzBBwpooHOw9uNihUEz+Zv2ktd7bBJOUNFXTOiyFjlg1ti//rulIK8eRtPC8VlfFI
 rRhUta8NoIe8WtrpELv4fp+XcCQsFQD1s4R6HarEUWCXY/rjVxu5pjYtSDaHXRUO6T/jef
 7v+SeMK2k8yxHjw55tU29QpadJBWz/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-BhZv07wSNw-3rdtfif2IUg-1; Tue, 28 Jan 2020 08:10:02 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51B1910054E3;
 Tue, 28 Jan 2020 13:10:01 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (dhcp-192-227.str.redhat.com
 [10.33.192.227])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A09788883;
 Tue, 28 Jan 2020 13:10:00 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: powerpc Linux scv support and scv system call ABI proposal
References: <1580207907.c96c1lh9t0.astroid@bobo.none>
Date: Tue, 28 Jan 2020 14:09:58 +0100
In-Reply-To: <1580207907.c96c1lh9t0.astroid@bobo.none> (Nicholas Piggin's
 message of "Tue, 28 Jan 2020 20:50:48 +1000")
Message-ID: <87tv4fd8wp.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: BhZv07wSNw-3rdtfif2IUg-1
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
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Nicholas Piggin:

> * Proposal is for PPC_FEATURE2_SCV to indicate 'scv 0' support, all other
>   vectors will return -ENOSYS, and the decision for how to add support fo=
r
>   a new vector deferred until we see the next user.

Seems reasonable.  We don't have to decide this today.

> * Proposal is for scv 0 to provide the standard Linux system call ABI wit=
h some
>   differences:
>
> - LR is volatile across scv calls. This is necessary for support because =
the
>   scv instruction clobbers LR.

I think we can express this in the glibc system call assembler wrapper
generators.  The mcount profiling wrappers already have this property.

But I don't think we are so lucky for the inline system calls.  GCC
recognizes an "lr" clobber with inline asm (even though it is not
documented), but it generates rather strange assembler output as a
result:

long
f (long x)
{
  long y;
  asm ("#" : "=3Dr" (y) : "r" (x) : "lr");
  return y;
}

=09.abiversion 2
=09.section=09".text"
=09.align 2
=09.p2align 4,,15
=09.globl f
=09.type=09f, @function
f:
.LFB0:
=09.cfi_startproc
=09mflr 0
=09.cfi_register 65, 0
#APP
 # 5 "t.c" 1
=09#
 # 0 "" 2
#NO_APP
=09std 0,16(1)
=09.cfi_offset 65, 16
=09ori 2,2,0
=09ld 0,16(1)
=09mtlr 0
=09.cfi_restore 65
=09blr
=09.long 0
=09.byte 0,0,0,1,0,0,0,0
=09.cfi_endproc
.LFE0:
=09.size=09f,.-f


That's with GCC 8.3 at -O2.  I don't understand what the ori is about.

I don't think we can save LR in a regular register around the system
call, explicitly in the inline asm statement, because we still have to
generate proper unwinding information using CFI directives, something
that you cannot do from within the asm statement.

Supporting this in GCC should not be impossible, but someone who
actually knows this stuff needs to look at it.

> - CR1 and CR5-CR7 are volatile. This matches the C ABI and would allow th=
e
>   system call exit to avoid restoring the CR register.

This sounds reasonable, but I don't know what kind of knock-on effects
this has.  The inline system call wrappers can handle this with minor
tweaks.

> - Error handling: use of CR0[SO] to indicate error requires a mtcr / mtoc=
r
>   instruction on the kernel side, and it is currently not implemented wel=
l
>   in glibc, requiring a mfcr (mfocr should be possible and asm goto suppo=
rt
>   would allow a better implementation). Is it worth continuing this style=
 of
>   error handling? Or just move to -ve return means error? Using a differe=
nt
>   bit would allow the kernel to piggy back the CR return code setting wit=
h
>   a test for the error case exit.

GCC does not model the condition registers, so for inline system calls,
we have to produce a value anyway that the subsequence C code can check.
The assembler syscall wrappers do not need to do this, of course, but
I'm not sure which category of interfaces is more important.

But the kernel uses the -errno convention internally, so I think it
would make sense to pass this to userspace and not convert back and
forth.  This would align with what most of the architectures do, and
also avoids the GCC oddity.

> - Should this be for 64-bit only? 'scv 1' could be reserved for 32-bit
>   calls if there was interest in developing an ABI for 32-bit programs.
>   Marginal benefit in avoiding compat syscall selection.

We don't have an ELFv2 ABI for 32-bit.  I doubt it makes sense to
provide an ELFv1 port for this given that it's POWER9-specific.

From the glibc perspective, the major question is how we handle run-time
selection of the system call instruction sequence.  On i386, we use a
function pointer in the TCB to call an instruction sequence in the vDSO.
That's problematic from a security perspective.  I expect that on
POWER9, using a pointer in read-only memory would be equally
non-attractive due to a similar lack of PC-relative addressing.  We
could use the HWCAP bit in the TCB, but that would add another (easy to
predict) conditional branch to every system call.

I don't think it matters whether both system call variants use the same
error convention because we could have different error code extraction
code on the two branches.

Thanks,
Florian

