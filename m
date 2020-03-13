Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D65C2183F21
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 03:30:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dqRs57FKzDqDF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 13:30:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dqQM0V76zDqDF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 13:29:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hnJJALzx; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48dqQL0vqFz9sQx;
 Fri, 13 Mar 2020 13:29:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584066554;
 bh=2e/6wSc8zzk17MFeEl7Gx3ZqzTPsNlvlfrLU0pTq/IU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=hnJJALzxbjcVHeUz13ZZILJonUThisqRVsruPLa9geydSxkgzE3OY5fEQQzjUruSq
 LO4/SHKtfvBmPMgkb4JYfUAqs49jxjt+aW411xiswDn9N6mXxr2bCi4/CEmDHueCqV
 02AfzTcKZyN6dnWnHzbU81ndovwjgBMuSr2ScFnlfypi1trlzwmdhKpL3BH0tYYKXx
 nzhZPrkItSqaeGuI6nUz8Lrj7xXvPY4OHfG9O23k6FVqVPxoKZettJlIAdUw1SQrq6
 JMNykIjndrnBuUyVBN/fjixNAFtz3v2vhn1OldQdJMQqmNwIe9nWPAkgX1SP0zbl27
 YhLg8rwOnPfwQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: fix of_read_drc_info_cell() to point at
 next record
In-Reply-To: <87r1xx36u5.fsf@linux.ibm.com>
References: <20200307024547.5748-1-tyreld@linux.ibm.com>
 <87tv2w2kc2.fsf@linux.ibm.com>
 <e99f5e39-4788-a9ef-30d7-8096df7ee36e@linux.ibm.com>
 <87imjai0wp.fsf@mpe.ellerman.id.au> <87r1xx36u5.fsf@linux.ibm.com>
Date: Fri, 13 Mar 2020 13:29:13 +1100
Message-ID: <87h7ytxa12.fsf@mpe.ellerman.id.au>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, mwb@linux.vnet.ibm.com,
 msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>>
>> It would also be *really* nice if we had some unit tests for this
>> parsing code, it's demonstrably very bug prone.
>
> Can you say more about what form unit tests could take? Like some self
> tests that run at boot time, or is there a way to run the code in a user
> space test harness?

It depends.

A userspace selftest is ideal as it's the easiest option for people to
run, ie. they just have to build a user program. There's also CI systems
setup to run the kernel selftests automatically.

See eg. tools/testing/selftests/powerpc/vphn/vphn.c

We also have boot time tests, they are good for code that we want to
test in the kernel proper, or that are hard to extract into a userspace
program. Most of those are configurable, so testing them requires
someone to enable the appropriate CONFIG_FOO and build & boot that
kernel. That reduces coverage obviously.

See eg. arch/powerpc/lib/code-patching.c

These days there's also kunit, which is a "proper" way to do kernel unit
tests. They get built into the kernel but then there's some support for
running those like a user program using UML on x86. On powerpc we'd have
to boot the kunit enabled kernel on hardware or in qemu to exercise the
tests. So they're essentially just boot time tests but with some nicer
infrastructure vs doing it all by hand like we used to.

In this case the actual function we want to test could be trivially
built into a userspace program, but the underlying device tree helpers
probably can't be.

eg. drivers/of/property.c is quite large and contains quite a few
things, we'd need to shim quite a bit to get that building in userspace
I suspect, which then becomes a maintenance burden.

So this is probably a good candidate for a kunit test, though I haven't
personally written/converted any tests to kunit so I can't say exactly
how easy that is.

cheers
