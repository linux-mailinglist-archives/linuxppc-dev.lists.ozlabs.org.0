Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 649D843E30B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 16:06:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg6mF2YHJz3cDC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 01:06:05 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg6lr1kKSz2yK6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 01:05:44 +1100 (AEDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.94) with esmtps (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1mg62H-002loB-KT; Thu, 28 Oct 2021 16:05:41 +0200
Received: from p57bd9736.dip0.t-ipconnect.de ([87.189.151.54]
 helo=[192.168.178.81]) by inpost2.zedat.fu-berlin.de (Exim 4.94)
 with esmtpsa (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1mg62H-0010bR-E2; Thu, 28 Oct 2021 16:05:41 +0200
Message-ID: <9ed788c0-b99b-f327-0814-a2d92db6bd8b@physik.fu-berlin.de>
Date: Thu, 28 Oct 2021 16:05:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Linux kernel: powerpc: KVM guest can trigger host crash on Power8
Content-Language: en-US
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <87pmrtbbdt.fsf@mpe.ellerman.id.au>
 <05b88724-90b6-a38a-bb3b-7392f85c1934@physik.fu-berlin.de>
 <878ryfavaz.fsf@mpe.ellerman.id.au>
 <04864fe5-fdd0-74b2-2bad-0303e4c2b15a@physik.fu-berlin.de>
 <874k92bubv.fsf@mpe.ellerman.id.au>
 <c21c7a0e-95f1-e6d2-a04c-fb99d801e8da@physik.fu-berlin.de>
 <878rydac0d.fsf@mpe.ellerman.id.au>
 <87b1404f-7805-da29-4899-6ab9459e5364@physik.fu-berlin.de>
In-Reply-To: <87b1404f-7805-da29-4899-6ab9459e5364@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.151.54
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

Hi Michael!

On 10/28/21 13:20, John Paul Adrian Glaubitz wrote:
> It seems I also can no longer reproduce the issue, even when building the most problematic
> packages and I think we should consider it fixed for now. I will keep monitoring the server,
> of course, and will let you know in case the problem shows again.

The host machine is stuck again but I'm not 100% sure what triggered the problem:

[194817.984249] watchdog: BUG: soft lockup - CPU#80 stuck for 246s! [CPU 2/KVM:1836]
[194818.012248] watchdog: BUG: soft lockup - CPU#152 stuck for 246s! [CPU 3/KVM:1837]
[194825.960164] watchdog: BUG: soft lockup - CPU#24 stuck for 246s! [khugepaged:318]
[194841.983991] watchdog: BUG: soft lockup - CPU#80 stuck for 268s! [CPU 2/KVM:1836]
[194842.011991] watchdog: BUG: soft lockup - CPU#152 stuck for 268s! [CPU 3/KVM:1837]
[194849.959906] watchdog: BUG: soft lockup - CPU#24 stuck for 269s! [khugepaged:318]
[194865.983733] watchdog: BUG: soft lockup - CPU#80 stuck for 291s! [CPU 2/KVM:1836]
[194866.011733] watchdog: BUG: soft lockup - CPU#152 stuck for 291s! [CPU 3/KVM:1837]
[194873.959648] watchdog: BUG: soft lockup - CPU#24 stuck for 291s! [khugepaged:318]
[194889.983475] watchdog: BUG: soft lockup - CPU#80 stuck for 313s! [CPU 2/KVM:1836]
[194890.011475] watchdog: BUG: soft lockup - CPU#152 stuck for 313s! [CPU 3/KVM:1837]
[194897.959390] watchdog: BUG: soft lockup - CPU#24 stuck for 313s! [khugepaged:318]
[194913.983218] watchdog: BUG: soft lockup - CPU#80 stuck for 335s! [CPU 2/KVM:1836]
[194914.011217] watchdog: BUG: soft lockup - CPU#152 stuck for 335s! [CPU 3/KVM:1837]
[194921.959133] watchdog: BUG: soft lockup - CPU#24 stuck for 336s! [khugepaged:318]

The following packages were being built at the same time:

- guest 1: virtuoso-opensource and openturns
- guest 2: llvm-toolchain-13

I really did a lot of testing today with no issues and just after I sent my report
to oss-security that the machine seems to be stable again, the issue showed up :(.

Sorry,
Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

