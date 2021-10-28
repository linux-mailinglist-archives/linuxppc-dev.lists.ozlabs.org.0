Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7010043DB4E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 08:40:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hfwsw2SY0z2ywV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 17:40:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Z3LRTgxV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfwsK2GPgz2xZg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 17:39:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Z3LRTgxV; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HfwsJ1CPpz4xbG;
 Thu, 28 Oct 2021 17:39:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1635403188;
 bh=6wVz/A4J4PFhe61AUA4JLJUcmjUln4No7uxrAJbBELU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Z3LRTgxV5/PH+lUIDnttJZibcEngUOLHJBMRa/mq/M1UaUgXXex8b2gJEZJPdrI0l
 4ns/b1U5D9iVoGSIfoM9Gtb1hK2dzIxNMIQi0ylm7YiwtxvapwlVpYa0qqlnei+6U8
 k/1qpta/A9vubDJ9p1BrGXId6iZTlac+cnrAWaOzhtfYQOpMKD83wU7QkeVHivme+N
 0O5KvBQ1vfe4MPSqVTvvLPT/O4W9YjrMnhsxI5TMbnbVmGkXD+bMQTdE7l3lPphos0
 jFhphwFsm4lE9/YZL/EEtTdPES4KxWnQT9malQIsM596jseL1tZGb/B3ck6FHFi40U
 WeIZnItbIJCyA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Linux kernel: powerpc: KVM guest can trigger host crash on Power8
In-Reply-To: <c21c7a0e-95f1-e6d2-a04c-fb99d801e8da@physik.fu-berlin.de>
References: <87pmrtbbdt.fsf@mpe.ellerman.id.au>
 <05b88724-90b6-a38a-bb3b-7392f85c1934@physik.fu-berlin.de>
 <878ryfavaz.fsf@mpe.ellerman.id.au>
 <04864fe5-fdd0-74b2-2bad-0303e4c2b15a@physik.fu-berlin.de>
 <874k92bubv.fsf@mpe.ellerman.id.au>
 <c21c7a0e-95f1-e6d2-a04c-fb99d801e8da@physik.fu-berlin.de>
Date: Thu, 28 Oct 2021 17:39:46 +1100
Message-ID: <878rydac0d.fsf@mpe.ellerman.id.au>
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

[ Dropping oss-security from Cc]

John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> writes:
> On 10/27/21 13:06, Michael Ellerman wrote:
>> John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> writes:
>>> On 10/27/21 07:30, Michael Ellerman wrote:
>>>> I did test the repro case you gave me before (in the bugzilla), which
>>>> was building glibc, that passes for me with a patched host.
>>>
>>> Did you manage to crash the unpatched host?
>> 
>> Yes, the parallel builds of glibc you described crashed the unpatched
>> host 100% reliably for me.
>
> OK, that is very good news!
>
>> I also have a standalone reproducer I'll send you.
>
> Thanks, that would be helpful!
>
>>> Also, I'll try a kernel from git with Debian's config.
>>>
>>>> I guess we have yet another bug.
>>>>
>>>> I tried the following in a debian BE VM and it completed fine:
>>>>
>>>>  $ dget -u http://ftp.debian.org/debian/pool/main/g/git/git_2.33.1-1.dsc
>>>>  $ sbuild -d sid --arch=powerpc --no-arch-all git_2.33.1-1.dsc
>>>>
>>>> Same for ppc64.
>>>>
>>>> And I also tried both at once, repeatedly in a loop.
>>>
>>> Did you try building gcc-11 for powerpc and ppc64 both at once?
>> 
>> No, I will try that now.

That completed fine on my BE VM here.

I ran these in two tmux windows:
  $ sbuild -d sid --arch=powerpc --no-arch-all gcc-11_11.2.0-10.dsc
  $ sbuild -d sid --arch=ppc64 --no-arch-all gcc-11_11.2.0-10.dsc


The VM has 32 CPUs, with 4 threads per core:

  $ ppc64_cpu --info
  Core   0:    0*    1*    2*    3*
  Core   1:    4*    5*    6*    7*
  Core   2:    8*    9*   10*   11*
  Core   3:   12*   13*   14*   15*
  Core   4:   16*   17*   18*   19*
  Core   5:   20*   21*   22*   23*
  Core   6:   24*   25*   26*   27*
  Core   7:   28*   29*   30*   31*


cheers
