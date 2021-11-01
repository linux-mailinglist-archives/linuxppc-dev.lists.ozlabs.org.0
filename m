Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 311A04413ED
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Nov 2021 07:54:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HjP0S0yM2z2yPs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Nov 2021 17:54:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Px1NyT7n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjNzm1rNVz2xXt
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Nov 2021 17:53:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Px1NyT7n; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HjNzk2gCCz4xbd;
 Mon,  1 Nov 2021 17:53:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1635749634;
 bh=AFOKTYaT07wRuxTdOPz9+5nLId5YC/MScL0BPQYwcAg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Px1NyT7nsDeJYqwA4v7iC7FbytwBQ8GRGzUia+pwam9cMseUtTstKqUXL07+YVD3N
 k7iVGT29EsBgj7Axe9Z6jWp4afZUpyNk63R3JKch9Ag0qSCaa10FXze+9vV66Q8gYW
 2jw2uInX75bLt0cqU/S5zunKS5uk2SilJhI8Yud6yIkoGlpWPo1CrYsQ4Hb2m6IThg
 qyPK9d05rprcP5DPcMjxFd5gK7ji/B3YeKTogm274x4xNbeIKRIcCdq1HCslOMaHA4
 gspDDPJ2A6xQ1O6XHdWQ0Op9yla+fJlnRXIuvSvKAZJDpwAePYeiXclZPdTtBKQxig
 pNyv79c565MCQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Linux kernel: powerpc: KVM guest can trigger host crash on Power8
In-Reply-To: <73c55cc9-369e-8989-4f6c-6801ce6a4d64@physik.fu-berlin.de>
References: <87pmrtbbdt.fsf@mpe.ellerman.id.au>
 <05b88724-90b6-a38a-bb3b-7392f85c1934@physik.fu-berlin.de>
 <878ryfavaz.fsf@mpe.ellerman.id.au>
 <04864fe5-fdd0-74b2-2bad-0303e4c2b15a@physik.fu-berlin.de>
 <874k92bubv.fsf@mpe.ellerman.id.au>
 <c21c7a0e-95f1-e6d2-a04c-fb99d801e8da@physik.fu-berlin.de>
 <878rydac0d.fsf@mpe.ellerman.id.au>
 <73c55cc9-369e-8989-4f6c-6801ce6a4d64@physik.fu-berlin.de>
Date: Mon, 01 Nov 2021 17:53:49 +1100
Message-ID: <87k0hs8iyq.fsf@mpe.ellerman.id.au>
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
> On 10/28/21 08:39, Michael Ellerman wrote:
>> That completed fine on my BE VM here.
>> 
>> I ran these in two tmux windows:
>>   $ sbuild -d sid --arch=powerpc --no-arch-all gcc-11_11.2.0-10.dsc
>>   $ sbuild -d sid --arch=ppc64 --no-arch-all gcc-11_11.2.0-10.dsc
>
> Could you try gcc-10 instead? It's testsuite has crashed the host for me
> with a patched kernel twice now.
>
> $ dget -u https://deb.debian.org/debian/pool/main/g/gcc-10/gcc-10_10.3.0-12.dsc
> $ sbuild -d sid --arch=powerpc --no-arch-all gcc-10_10.3.0-12.dsc
> $ sbuild -d sid --arch=ppc64 --no-arch-all gcc-10_10.3.0-12.dsc

Sure, will give that a try.

I was able to crash my machine over the weekend, building openjdk, but I
haven't been able to reproduce it for ~24 hours now (I didn't change
anything).


Can you try running your guests with no SMT threads?

I think one of your guests was using:

  -smp 32,sockets=1,dies=1,cores=8,threads=4

Can you change that to:

  -smp 8,sockets=1,dies=1,cores=8,threads=1


And something similar for the other guest(s).

If the system is stable with those settings that would be useful
information, and would also mean you could use the system without it
crashing semi regularly.

cheers
