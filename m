Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0883B43C84C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 13:10:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfQvn6q3jz3bnq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 22:10:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66;
 helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de;
 receiver=<UNKNOWN>)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfQvM4j7Lz2xCy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 22:09:50 +1100 (AEDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.94) with esmtps (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1mfgoW-000n9o-7D; Wed, 27 Oct 2021 13:09:48 +0200
Received: from suse-laptop.physik.fu-berlin.de ([160.45.32.140])
 by inpost2.zedat.fu-berlin.de (Exim 4.94) with esmtpsa (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1mfgoV-002WZH-UY; Wed, 27 Oct 2021 13:09:48 +0200
Message-ID: <c21c7a0e-95f1-e6d2-a04c-fb99d801e8da@physik.fu-berlin.de>
Date: Wed, 27 Oct 2021 13:09:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Linux kernel: powerpc: KVM guest can trigger host crash on Power8
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>
References: <87pmrtbbdt.fsf@mpe.ellerman.id.au>
 <05b88724-90b6-a38a-bb3b-7392f85c1934@physik.fu-berlin.de>
 <878ryfavaz.fsf@mpe.ellerman.id.au>
 <04864fe5-fdd0-74b2-2bad-0303e4c2b15a@physik.fu-berlin.de>
 <874k92bubv.fsf@mpe.ellerman.id.au>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <874k92bubv.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 160.45.32.140
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
Cc: oss-security@lists.openwall.com,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael!

On 10/27/21 13:06, Michael Ellerman wrote:
> John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> writes:
>> Hi Michael!
>>
>> On 10/27/21 07:30, Michael Ellerman wrote:
>>> I did test the repro case you gave me before (in the bugzilla), which
>>> was building glibc, that passes for me with a patched host.
>>
>> Did you manage to crash the unpatched host?
> 
> Yes, the parallel builds of glibc you described crashed the unpatched
> host 100% reliably for me.

OK, that is very good news!

> I also have a standalone reproducer I'll send you.

Thanks, that would be helpful!

>> Also, I'll try a kernel from git with Debian's config.
>>
>>> I guess we have yet another bug.
>>>
>>> I tried the following in a debian BE VM and it completed fine:
>>>
>>>  $ dget -u http://ftp.debian.org/debian/pool/main/g/git/git_2.33.1-1.dsc
>>>  $ sbuild -d sid --arch=powerpc --no-arch-all git_2.33.1-1.dsc
>>>
>>> Same for ppc64.
>>>
>>> And I also tried both at once, repeatedly in a loop.
>>
>> Did you try building gcc-11 for powerpc and ppc64 both at once?
> 
> No, I will try that now.

OK, great!

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

