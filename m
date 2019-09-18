Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AECB624A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 13:33:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YHsx6ffGzDr2N
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 21:33:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YHqs5WkFzF3mY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 21:31:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="Qvm2wNP/"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46YHqs1QHVz9s4Y;
 Wed, 18 Sep 2019 21:31:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1568806297;
 bh=bFi1/DiI56B9Yq5YZTtjn4LDQu+PhsudNKthRAcRdVg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Qvm2wNP/H00fKpCKhZS3NS0MN/rPbzBfBZQSPGN8K9S4W3FJdS01+gzK2YK+N9qhN
 ljTQ583mPYTrFq5CqrvKsTkjpgXXrmvytc80c0MbesAPr2B9piU0JMA+6VAAV1Kz98
 5/N/lk1mBikm5lsOKRr+l95AlSlaMNFy36Fggu/n+0P+JFkV3x95G90NJZKfthIBDN
 gmHnwdz/d94fj6tm+H/eGUAclsPawFDyxQ/YwsBqtg3kKpMLAhgJWkn5b6wZxgB8He
 tm0QZgigj3JJpCrmV5JIKfSz3eO0hBiZTCkzSuO4vK31OARiOm5LjQwg8VWNCR1obk
 ZXitzcrQn1xhg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Nathan Lynch <nathanl@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH 0/2] pseries/hotplug: Change the default behaviour of
 cede_offline
In-Reply-To: <1568788924.kxcnnog4r7.naveen@linux.ibm.com>
References: <1568284541-15169-1-git-send-email-ego@linux.vnet.ibm.com>
 <87r24ew5i0.fsf@mpe.ellerman.id.au>
 <1568788924.kxcnnog4r7.naveen@linux.ibm.com>
Date: Wed, 18 Sep 2019 21:31:35 +1000
Message-ID: <877e65x2lk.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Kamalesh Babulal <kamaleshb@in.ibm.com>,
 linux-kernel@vger.kernel.org,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
> Michael Ellerman wrote:
>> "Gautham R. Shenoy" <ego@linux.vnet.ibm.com> writes:
>>> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
>>>
>>> Currently on Pseries Linux Guests, the offlined CPU can be put to one
>>> of the following two states:
>>>    - Long term processor cede (also called extended cede)
>>>    - Returned to the Hypervisor via RTAS "stop-self" call.
>>>
>>> This is controlled by the kernel boot parameter "cede_offline=on/off".
>>>
>>> By default the offlined CPUs enter extended cede.
>> 
>> Since commit 3aa565f53c39 ("powerpc/pseries: Add hooks to put the CPU into an appropriate offline state") (Nov 2009)
>> 
>> Which you wrote :)
>> 
>> Why was that wrong?
>> 
>>> The PHYP hypervisor considers CPUs in extended cede to be "active"
>>> since the CPUs are still under the control fo the Linux Guests. Hence, when we change the
>>> SMT modes by offlining the secondary CPUs, the PURR and the RWMR SPRs
>>> will continue to count the values for offlined CPUs in extended cede
>>> as if they are online.
>>>
>>> One of the expectations with PURR is that the for an interval of time,
>>> the sum of the PURR increments across the online CPUs of a core should
>>> equal the number of timebase ticks for that interval.
>>>
>>> This is currently not the case.
>> 
>> But why does that matter? It's just some accounting stuff, does it
>> actually break something meaningful?
>
> Yes, this broke lparstat at the very least (though its quite unfortunate 
> we took so long to notice).

By "so long" you mean 10 years?

Also I've never heard of lparstat, but I assume it's one of these tools
that's meant to behave like the AIX equivalent?

If it's been "broken" for 10 years and no one noticed, I'd argue the
current behaviour is now "correct" and fixing it would actually be a
breakage :)

> With SMT disabled, and under load:
>   $ sudo lparstat 1 10
>
>   System Configuration
>   type=Shared mode=Uncapped smt=Off lcpu=2 mem=7759616 kB cpus=6 ent=1.00 
>
>   %user  %sys %wait    %idle    physc %entc lbusy  vcsw phint
>   ----- ----- -----    -----    ----- ----- ----- ----- -----
>   100.00  0.00  0.00     0.00     1.10 110.00 100.00 128784460     0
>   100.00  0.00  0.00     0.00     1.07 107.00 100.00 128784860     0
>   100.00  0.00  0.00     0.00     1.07 107.00 100.00 128785260     0
>   100.00  0.00  0.00     0.00     1.07 107.00 100.00 128785662     0
>   100.00  0.00  0.00     0.00     1.07 107.00 100.00 128786062     0
>   100.00  0.00  0.00     0.00     1.07 107.00 100.00 128786462     0
>   100.00  0.00  0.00     0.00     1.07 107.00 100.00 128786862     0
>   100.00  0.00  0.00     0.00     1.07 107.00 100.00 128787262     0
>   100.00  0.00  0.00     0.00     1.07 107.00 100.00 128787664     0
>   100.00  0.00  0.00     0.00     1.07 107.00 100.00 128788064     0

What about that is wrong?

> With cede_offline=off:
>   $ sudo lparstat 1 10
>
>   System Configuration
>   type=Shared mode=Uncapped smt=Off lcpu=2 mem=7759616 kB cpus=6 ent=1.00 
>
>   %user  %sys %wait    %idle    physc %entc lbusy  vcsw phint
>   ----- ----- -----    -----    ----- ----- ----- ----- -----
>   100.00  0.00  0.00     0.00     1.94 194.00 100.00 128961588     0
>   100.00  0.00  0.00     0.00     1.91 191.00 100.00 128961988     0
>   100.00  0.00  0.00     0.00      inf   inf 100.00 128962392     0
>   100.00  0.00  0.00     0.00     1.91 191.00 100.00 128962792     0
>   100.00  0.00  0.00     0.00     1.91 191.00 100.00 128963192     0
>   100.00  0.00  0.00     0.00     1.91 191.00 100.00 128963592     0
>   100.00  0.00  0.00     0.00     1.91 191.00 100.00 128963992     0
>   100.00  0.00  0.00     0.00     1.91 191.00 100.00 128964392     0
>   100.00  0.00  0.00     0.00     1.91 191.00 100.00 128964792     0
>   100.00  0.00  0.00     0.00     1.91 191.00 100.00 128965194     0
>
> [The 'inf' values there show a different bug]
>
> Also, since we expose [S]PURR through sysfs, any tools that make use of 
> that directly are also affected due to this.

But again if we've had the current behaviour for 10 years then arguably
that's now the correct behaviour.

cheers
