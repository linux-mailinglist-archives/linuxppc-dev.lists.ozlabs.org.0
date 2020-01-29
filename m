Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D8D14CE24
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 17:21:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4877yn1dRMzDqS7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 03:21:21 +1100 (AEDT)
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
 header.s=mimecast20190719 header.b=d8vnsjmX; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4877wm42cqzDqKH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 03:19:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580314769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2VkQ3tEdy4vHa8eFvUQhVX0TV/1PtAbYiDJF3BSsmvY=;
 b=d8vnsjmXcIUPrk3Xd1sukNpyeFr+M85dSv6JW5vDPeHs3C4zDR6TZ0UC72PwfgCUXZuKPr
 qDxpt7iE8YpGH0WglBKpoG3RwgJCxKPKsqBCNv5kUlHoeoD12tjIeKYDHPgfB0msDrDixC
 wsf2VMHf0bqASev82BkdIQHFAs3fQo8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-H-6tDBQuPDGVZcGZLRPJiw-1; Wed, 29 Jan 2020 11:19:25 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A52710509C3;
 Wed, 29 Jan 2020 16:19:22 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (dhcp-192-227.str.redhat.com
 [10.33.192.227])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5F6D1001B05;
 Wed, 29 Jan 2020 16:19:20 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: powerpc Linux scv support and scv system call ABI proposal
References: <1580207907.c96c1lh9t0.astroid@bobo.none>
 <87tv4fd8wp.fsf@oldenburg2.str.redhat.com>
 <1580218232.2tezmthp1x.astroid@bobo.none>
 <20200128154026.GI22482@gate.crashing.org>
 <87o8unbm8u.fsf@oldenburg2.str.redhat.com>
 <20200128200133.GJ22482@gate.crashing.org>
Date: Wed, 29 Jan 2020 17:19:19 +0100
In-Reply-To: <20200128200133.GJ22482@gate.crashing.org> (Segher Boessenkool's
 message of "Tue, 28 Jan 2020 14:01:33 -0600")
Message-ID: <87wo9a8cc8.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: H-6tDBQuPDGVZcGZLRPJiw-1
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

> On Tue, Jan 28, 2020 at 05:04:49PM +0100, Florian Weimer wrote:
>> * Segher Boessenkool:
>>=20
>> >> > I don't think we can save LR in a regular register around the syste=
m
>> >> > call, explicitly in the inline asm statement, because we still have=
 to
>> >> > generate proper unwinding information using CFI directives, somethi=
ng
>> >> > that you cannot do from within the asm statement.
>> >
>> > Why not?
>>=20
>> As far as I knowm there isn't a CFI directive that allows us to restore
>> the CFI state at the end of the inline assembly.  If we say that LR is
>> stored in a different register than what the rest of the function uses,
>> that would lead to incorrect CFI after the exit of the inline assembler
>> fragment.
>>=20
>> At least that's what I think.  Compilers aren't really my thing.
>
> .cfi_restore?  Or .cfi_remember_state / .cfi_restore_state, that is
> probably easiest in inline assembler.

Oh, right, .cfi_remember_state and .cfi_restore_state should work, as
long as -fno-dwarf2-cfi-asm isn't used (but that's okay given that we
need this only for the glibc build).

But it looks like we can use an explicit "lr" clobber, so we should be
good anyway.

>> >> > GCC does not model the condition registers,
>> >
>> > Huh?  It does model the condition register, as 8 registers in GCC's
>> > internal model (one each for CR0..CR7).
>>=20
>> But GCC doesn't expose them as integers to C code, so you can't do much
>> without them.
>
> Sure, it doesn't expose any other registers directly, either.

I can use r0 & 1 with a register variable r0 to check a bit.  I don't
think writing a similar check against a condition register is possible
today.

Thanks,
Florian

