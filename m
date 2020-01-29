Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5A014CF0E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 18:04:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4878wJ3pcbzDqVQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 04:04:16 +1100 (AEDT)
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
 header.s=mimecast20190719 header.b=GtxhSoyH; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4878tZ4BKXzDqSY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 04:02:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580317362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A3ihoOnIqWcAoVzfXlJM1E4TPmFzn4RtlOnPSwdBbgc=;
 b=GtxhSoyHa2ZVV/s6KblxsyGJvq+fSkwQB6PrlS/cn02GrvcwTR8dVB53YtbujpyR+qigg3
 LQG7Hn56byPsl6eZRQ5gbPdh0zeJTknlqKXXSngkFcfem7P67f0HnfsmGeqJE5r88pYDaS
 x6KDtBFKoWvdmhPHNQl6YsG5NIacqZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-qlXFv4i6PUuc6DxcfyzdEw-1; Wed, 29 Jan 2020 12:02:38 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15BF38F329A;
 Wed, 29 Jan 2020 17:02:37 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (dhcp-192-227.str.redhat.com
 [10.33.192.227])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFC7587B02;
 Wed, 29 Jan 2020 17:02:35 +0000 (UTC)
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
Date: Wed, 29 Jan 2020 18:02:34 +0100
In-Reply-To: <20200129162947.GN22482@gate.crashing.org> (Segher Boessenkool's
 message of "Wed, 29 Jan 2020 10:29:47 -0600")
Message-ID: <87imku8ac5.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: qlXFv4i6PUuc6DxcfyzdEw-1
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

> On Wed, Jan 29, 2020 at 05:19:19PM +0100, Florian Weimer wrote:
>> * Segher Boessenkool:
>> >> But GCC doesn't expose them as integers to C code, so you can't do mu=
ch
>> >> without them.
>> >
>> > Sure, it doesn't expose any other registers directly, either.
>>=20
>> I can use r0 & 1 with a register variable r0 to check a bit.
>
> That is not reliable, or supported, and it *will* break.  This is
> explicit for local register asm, and global register asm is
> underdefined.

Ugh.  I did not know that.  And neither did the person who wrote
powerpc64/sysdep.h because it uses register variables in regular C
expressions. 8-(  Other architectures are affected as well.

One set of issues is less of a problem if system call arguments are
variables and not complex expressions, so that side effects do not
clobber registers in the initialization:

=09register long __a0 asm ("$4") =3D (long) (arg1);

But I wasn't aware of that constraint on the macro users at all.

Thanks,
Florian

