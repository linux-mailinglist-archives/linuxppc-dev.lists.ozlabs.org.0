Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6F41DCDA6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 15:03:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SVCt4ZNyzDqZP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 23:03:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SV89466nzDqfN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 22:59:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=paErik3v; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49SV876KwXz9sPK;
 Thu, 21 May 2020 22:59:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590065992;
 bh=/5PV7XD/ISCv0WTomgPx4NeTOZP69LZyLNEmfK9wn1I=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=paErik3vFK/L2ORhleEaSq7nRFVByC51XCtnZD59c3UPhJApxklDQYmFckiLdsuBv
 7nImaFohWZOWkTYrKz7y0G30b3wfxuzDBOGQo2mzpEURFkEMZYweqTS8MLIS5VuFog
 T/Sjxypqf6DMk/+6b2YvpA6R6ckqHgDjLnZckDqzCKRoWcApnxk1v1rPloSWnpyPiw
 CFBUpzIEJyjRVowJfkqvb49ytoXUbTHYHzXcqMTP2QDccy//ABPWRbhlCGRN1fVRjP
 +eQwtelCeYnC/AxZzAdfey/9DLxoTtNRSo0aPFYSCCtVpvYSMFA9LLHHMQCM40w1nI
 fm9YTKbfklEVQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: Fwd: [CRON] Broken: ClangBuiltLinux/continuous-integration#1432
 (master - 0aceafc)
In-Reply-To: <20200520010148.GA3327346@ubuntu-s3-xlarge-x86>
References: <ClangBuiltLinux/continuous-integration+164415390+broken@travis-ci.com>
 <5eb43a0c8d43d_13fb5db924ca0104770@travis-pro-tasks-6cc9887df6-4zmjd.mail>
 <CAKwvOdmendjEgurRBAyi4R0rDZRdwfHjddS_pfOQ6761XiiFMA@mail.gmail.com>
 <87d07fcdee.fsf@mpe.ellerman.id.au>
 <CAKwvOdn0Spc15v3WUE_rdrb5UvaTXmOvjEJOsD7ahktQOwQk+A@mail.gmail.com>
 <20200520010148.GA3327346@ubuntu-s3-xlarge-x86>
Date: Thu, 21 May 2020 23:00:12 +1000
Message-ID: <87r1vdh28z.fsf@mpe.ellerman.id.au>
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Chancellor <natechancellor@gmail.com> writes:
> On Tue, May 19, 2020 at 05:56:32PM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
>> Looks like our CI is still red from this:
>> 
>> https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/builds/166854584
>> 
>> Filing a bug to follow up on:
>> https://github.com/ClangBuiltLinux/linux/issues/1031
>> 
>> On Thu, May 7, 2020 at 8:29 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>> >
>> > Nick Desaulniers <ndesaulniers@google.com> writes:
>> > > Looks like ppc64le powernv_defconfig is suddenly failing the locking
>> > > torture tests, then locks up?
>> > > https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/329211572#L3111-L3167
>> > > Any recent changes related here in -next?  I believe this is the first
>> > > failure, so I'll report back if we see this again.
>> >
>> > Thanks for the report.
>> >
>> > There's nothing newly in next-20200507 that seems related.
...
>
> This is probably still a manifestation of
> https://github.com/ClangBuiltLinux/continuous-integration/issues/262
> because rekicking the tests usually fixes it.

Oh yep.

I was looking at the RCU warning, which I still don't understand, but
the lockup is presumably the same problem you hit with interrupts being
lost.

> We should probably just disable the torture tests like we do for x86_64
> for CI because we do not have access to QEMU 5.0.0 where this should be
> fixed. I believe it is slated for 4.2.1 as well but we still have to
> wait for that to be updated and packaged in Ubuntu.

You just need to start building Qemu HEAD as part of your CI ;)

cheers
