Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA09744143C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Nov 2021 08:37:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HjPyT45bBz307W
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Nov 2021 18:37:53 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjPxx5sCkz2xXm
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Nov 2021 18:37:24 +1100 (AEDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.94) with esmtps (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1mhRsb-002sTz-R9; Mon, 01 Nov 2021 08:37:17 +0100
Received: from x4db71ed5.dyn.telefonica.de ([77.183.30.213] helo=[192.168.1.7])
 by inpost2.zedat.fu-berlin.de (Exim 4.94) with esmtpsa (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1mhRsb-001CRF-KQ; Mon, 01 Nov 2021 08:37:17 +0100
Message-ID: <8759057e-170c-3972-997f-a63d88b0e94c@physik.fu-berlin.de>
Date: Mon, 1 Nov 2021 08:37:16 +0100
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
 <c21c7a0e-95f1-e6d2-a04c-fb99d801e8da@physik.fu-berlin.de>
 <878rydac0d.fsf@mpe.ellerman.id.au>
 <73c55cc9-369e-8989-4f6c-6801ce6a4d64@physik.fu-berlin.de>
 <87k0hs8iyq.fsf@mpe.ellerman.id.au>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <87k0hs8iyq.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 77.183.30.213
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

On 11/1/21 07:53, Michael Ellerman wrote:
> Sure, will give that a try.
> 
> I was able to crash my machine over the weekend, building openjdk, but I
> haven't been able to reproduce it for ~24 hours now (I didn't change
> anything).

I made another experiment and upgraded the host to 5.15-rc7 which contains your
fixes and made the guests build gcc-10. Interestingly, this time, the gcc-10
build crashed the guest but didn't manage to crash the host. I will update the
guest to 5.15-rc7 now as well and see how that goes.

> Can you try running your guests with no SMT threads?
> 
> I think one of your guests was using:
> 
>   -smp 32,sockets=1,dies=1,cores=8,threads=4
> 
> Can you change that to:
> 
>   -smp 8,sockets=1,dies=1,cores=8,threads=1
> 
> 
> And something similar for the other guest(s).

Sure. I will try that later. But first I want to switch the guests to 5.15-rc7 as well.

> If the system is stable with those settings that would be useful
> information, and would also mean you could use the system without it
> crashing semi regularly.

Gotcha.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

