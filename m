Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4399C14BD69
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 17:02:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486WZs62sMzDqL9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 03:01:57 +1100 (AEDT)
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
 header.s=mimecast20190719 header.b=J6csyWz0; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486WVh2hpZzDqFY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 02:58:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580227096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pYCCjdJVin5tCmfj5Arg5VBSoeAkRf5PcJ3xHUAHOfQ=;
 b=J6csyWz0Bgywc8MwJosSlPq/h+WXuCYn8Bmw+1X/fKwiTqFF92N8xxZZV10qqEMmkkjzeF
 HWnDKhOpEgVee3wH/LDBmcLpZgxULjSwgt1IE/RbC8O2DqKF4C3k278tFcOTaY3xiDx9qr
 3iaFlUQXiHY9whh6oEbbMk8hYvNNnrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-b9-OAgwuNDeuxSCDvefXpQ-1; Tue, 28 Jan 2020 10:58:11 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B321800D4E;
 Tue, 28 Jan 2020 15:58:09 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (unknown [10.36.118.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 194078702F;
 Tue, 28 Jan 2020 15:58:07 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: powerpc Linux scv support and scv system call ABI proposal
References: <1580207907.c96c1lh9t0.astroid@bobo.none>
 <87tv4fd8wp.fsf@oldenburg2.str.redhat.com>
 <1580218232.2tezmthp1x.astroid@bobo.none>
Date: Tue, 28 Jan 2020 16:58:06 +0100
In-Reply-To: <1580218232.2tezmthp1x.astroid@bobo.none> (Nicholas Piggin's
 message of "Wed, 29 Jan 2020 00:05:40 +1000")
Message-ID: <87sgjzbmk1.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: b9-OAgwuNDeuxSCDvefXpQ-1
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 libc-alpha@sourceware.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Nicholas Piggin:

> That gets the LR save/restore right when we're also using r0.

Yes, I agree it looks good.  Nice.

>> But the kernel uses the -errno convention internally, so I think it
>> would make sense to pass this to userspace and not convert back and
>> forth.  This would align with what most of the architectures do, and
>> also avoids the GCC oddity.
>
> Yes I would be interested in opinions for this option. It seems like
> matching other architectures is a good idea. Maybe there are some
> reasons not to.

If there were a POWER-specific system call that uses all result bits and
doesn't have room for the 4096 error states (or an error number that's
outside that range), that would be a blocker.  I can't find such a
system call wrapped in the glibc sources.  musl's inline syscalls always
convert the errno state to -errno, so it's not possible to use such a
system call there.

>>> - Should this be for 64-bit only? 'scv 1' could be reserved for 32-bit
>>>   calls if there was interest in developing an ABI for 32-bit programs.
>>>   Marginal benefit in avoiding compat syscall selection.
>>=20
>> We don't have an ELFv2 ABI for 32-bit.  I doubt it makes sense to
>> provide an ELFv1 port for this given that it's POWER9-specific.
>
> Okay. There's no reason not to enable this for BE, at least for the
> kernel it's no additional work so it probably remains enabled (unless
> there is something really good we could do with the ABI if we exclude
> ELFv1 but I don't see anything).
>
> But if glibc only builds for ELFv2 support that's probably reasonable.

To be clear, we still support ELFv1 for POWER, but given that this
feature is POWER9 and later, I expect the number of users benefiting
from 32-bit support (or ELFv1 and thus big-endian support) to be quite
small.

Especially if we go the conditional branch route, I would restrict this
to ELFv2 in glibc, at least for default builds.

>> From the glibc perspective, the major question is how we handle run-time
>> selection of the system call instruction sequence.  On i386, we use a
>> function pointer in the TCB to call an instruction sequence in the vDSO.
>> That's problematic from a security perspective.  I expect that on
>> POWER9, using a pointer in read-only memory would be equally
>> non-attractive due to a similar lack of PC-relative addressing.  We
>> could use the HWCAP bit in the TCB, but that would add another (easy to
>> predict) conditional branch to every system call.
>
> I would have to defer to glibc devs on this. Conditional branch
> should be acceptable I think, scv improves speed as much as several
> mispredicted branches (about 90 cycles).

But we'd have to pay for that branch (and likely the LR clobber) on
legacy POWER, and that's something to consider, too.

Is there an additional performance hit if a process uses both the old
and new system call sequence?

Thanks,
Florian

