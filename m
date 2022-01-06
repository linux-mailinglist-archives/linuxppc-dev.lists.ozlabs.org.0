Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4B648634F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 11:58:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JV3Hj5SRkz30MK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 21:58:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=h5UqH/px;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JV3H52CQ2z2ybH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 21:58:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=h5UqH/px; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JV3H511dTz4xd4;
 Thu,  6 Jan 2022 21:58:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1641466689;
 bh=QMxy/0fx4M+0SYr2DE0+gD29IHL2WpzOm9ELjfNQZcE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=h5UqH/pxy4kzz+WYNE4VKUmLfAqHkYEFZ5TBMZphKJeSbf7yKT/IJZrNe0BxDoW1j
 /qehEKLFrZu7hPLetvAYiRHsNPssYUvn4Cd1lPhQxyyKNc43cEABDJJi8G1p9yhNhQ
 6qZSBYcr5VQXDv/bOH9NNfo3HzaJESGoLxd61Tl/CgtTuxfVL4EdZkQbUhkiPg6VUt
 mWdDi6YdQxx1mX3OvhQjIrr4j2GWb2QVIbsvm2XMZvmwByXHNhSgGJ/hiB0yhAMqZt
 1zcjvayf4KfL6o5Es3bACfMnAiDeHttzyrF3ir3Cv6Io19GigWjHz7WQkQLOWf0Xmg
 slvnbfU2ceg7Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Linux kernel: powerpc: KVM guest can trigger host crash on Power8
In-Reply-To: <fca7cf14-b598-d25a-8f71-8d1c16a84e5f@physik.fu-berlin.de>
References: <87pmrtbbdt.fsf@mpe.ellerman.id.au>
 <05b88724-90b6-a38a-bb3b-7392f85c1934@physik.fu-berlin.de>
 <878ryfavaz.fsf@mpe.ellerman.id.au>
 <04864fe5-fdd0-74b2-2bad-0303e4c2b15a@physik.fu-berlin.de>
 <874k92bubv.fsf@mpe.ellerman.id.au>
 <c21c7a0e-95f1-e6d2-a04c-fb99d801e8da@physik.fu-berlin.de>
 <878rydac0d.fsf@mpe.ellerman.id.au>
 <73c55cc9-369e-8989-4f6c-6801ce6a4d64@physik.fu-berlin.de>
 <87k0hs8iyq.fsf@mpe.ellerman.id.au>
 <fca7cf14-b598-d25a-8f71-8d1c16a84e5f@physik.fu-berlin.de>
Date: Thu, 06 Jan 2022 21:58:05 +1100
Message-ID: <87ilux2ksi.fsf@mpe.ellerman.id.au>
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
Cc: "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> writes:
> Hi Michael!
>
> Sorry for the long time without any responses. Shall we continue debugging this?

Yes!

Sorry also that I haven't been able to fix it yet, I had to stop chasing
this bug and work on other things before the end of the year.

> We're currently running 5.15.x on the host system and the guests and the testsuite
> for gcc-9 still reproducibly kills the KVM host.

Have you been able to try the different -smp options I suggested?

Can you separately test with (on the host):

 # echo 0 > /sys/module/kvm_hv/parameters/dynamic_mt_modes


cheers

> On 11/1/21 07:53, Michael Ellerman wrote:
>> Sure, will give that a try.
>> 
>> I was able to crash my machine over the weekend, building openjdk, but I
>> haven't been able to reproduce it for ~24 hours now (I didn't change
>> anything).
>> 
>> 
>> Can you try running your guests with no SMT threads?
>> 
>> I think one of your guests was using:
>> 
>>   -smp 32,sockets=1,dies=1,cores=8,threads=4
>> 
>> Can you change that to:
>> 
>>   -smp 8,sockets=1,dies=1,cores=8,threads=1
>> 
>> 
>> And something similar for the other guest(s).
>> 
>> If the system is stable with those settings that would be useful
>> information, and would also mean you could use the system without it
>> crashing semi regularly.
>> 
>> cheers
> -- 
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer - glaubitz@debian.org
> `. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
