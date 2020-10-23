Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D54422969B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 08:30:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHZ9G6F3kzDr2N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 17:30:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHZ7v1jgczDqxQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 17:29:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4CHZ7t42F5z8t65
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 17:29:14 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4CHZ7t3g5Vz9sTc; Fri, 23 Oct 2020 17:29:14 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4CHZ7s1TBgz9sTK
 for <linuxppc-dev@ozlabs.org>; Fri, 23 Oct 2020 17:29:04 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CHZ7Z1XvLz9txKQ;
 Fri, 23 Oct 2020 08:28:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5xU1EsiLkadC; Fri, 23 Oct 2020 08:28:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CHZ7Z0XBsz9txKP;
 Fri, 23 Oct 2020 08:28:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E8A988B854;
 Fri, 23 Oct 2020 08:28:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id kEEewvCugbio; Fri, 23 Oct 2020 08:28:58 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7BB828B773;
 Fri, 23 Oct 2020 08:28:58 +0200 (CEST)
Subject: Re: C vdso
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20200916165516.Horde.uocmo3irPb7BMg__NUSqRA9@messagerie.si.c-s.fr>
 <87r1r0oa4o.fsf@mpe.ellerman.id.au>
 <cc532aa8-a9e0-a105-b7b1-ee8d723b7ed6@csgroup.eu>
Message-ID: <be21c7c8-6828-b757-064d-20f74e5c1a31@csgroup.eu>
Date: Fri, 23 Oct 2020 08:28:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <cc532aa8-a9e0-a105-b7b1-ee8d723b7ed6@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

Le 24/09/2020 à 15:17, Christophe Leroy a écrit :
> Hi Michael
> 
> Le 17/09/2020 à 14:33, Michael Ellerman a écrit :
>> Hi Christophe,
>>
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> Hi Michael,
>>>
>>> What is the status with the generic C vdso merge ?
>>> In some mail, you mentionned having difficulties getting it working on
>>> ppc64, any progress ? What's the problem ? Can I help ?
>>
>> Yeah sorry I was hoping to get time to work on it but haven't been able
>> to.
>>
>> It's causing crashes on ppc64 ie. big endian.
>>
> 
>>
>> As you can see from the instruction dump we have jumped into the weeds somewhere.
>>
>> We also had the report from the kbuild robot about rela.opd being
>> discarded, which I think is indicative of a bigger problem. ie. we don't
>> process relocations for the VDSO, but opds require relocations (they
>> contain an absolute pointer).
>>
>> I thought we could get away with that, because the VDSO entry points
>> aren't proper functions (so they don't have opds), and I didn't think
>> we'd be calling via function pointers in the VDSO code (which would
>> require opds). But seems something is not working right.
>>
>> Sorry I haven't got back to you with those details. Things are a bit of
>> a mess inside IBM at the moment (always?), and I've been trying to get
>> everything done before I take a holiday next week.
>>
> 
> 
> Can you tell what defconfig you are using ? I have been able to setup a full glibc PPC64 cross 
> compilation chain and been able to test it under QEMU with success, using Nathan's vdsotest tool.


What config are you using ?

Christophe

> 
> I tested with both ppc64_defconfig and pseries_defconfig.
> 
> The only problem I got is with getcpu, which segfaults but both before and after applying my series, 
> so I guess this is unrelated.
> 
> Not sure we can pay too much attention to the exact measurement as it is a ppc64 QEMU running on a 
> x86 Linux which is running in a Virtual Box on a x86 windows Laptop, but at least it works:
> 
> Without the series:
> 
> clock-getres-monotonic:    vdso: 389 nsec/call
> clock-gettime-monotonic:    vdso: 781 nsec/call
> clock-getres-monotonic-coarse:    vdso: 13715 nsec/call
> clock-gettime-monotonic-coarse:    vdso: 312 nsec/call
> clock-getres-monotonic-raw:    vdso: 13589 nsec/call
> clock-getres-tai:    vdso: 13827 nsec/call
> clock-gettime-tai:    vdso: 14846 nsec/call
> clock-getres-boottime:    vdso: 13596 nsec/call
> clock-gettime-boottime:    vdso: 14758 nsec/call
> clock-getres-realtime:    vdso: 327 nsec/call
> clock-gettime-realtime:    vdso: 717 nsec/call
> clock-getres-realtime-coarse:    vdso: 14102 nsec/call
> clock-gettime-realtime-coarse:    vdso: 299 nsec/call
> gettimeofday:    vdso: 771 nsec/call
> 
> With the series:
> 
> clock-getres-monotonic:    vdso: 350 nsec/call
> clock-gettime-monotonic:    vdso: 726 nsec/call
> clock-getres-monotonic-coarse:    vdso: 356 nsec/call
> clock-gettime-monotonic-coarse:    vdso: 423 nsec/call
> clock-getres-monotonic-raw:    vdso: 349 nsec/call
> clock-getres-tai:    vdso: 419 nsec/call
> clock-gettime-tai:    vdso: 724 nsec/call
> clock-getres-boottime:    vdso: 352 nsec/call
> clock-gettime-boottime:    vdso: 752 nsec/call
> clock-getres-realtime:    vdso: 351 nsec/call
> clock-gettime-realtime:    vdso: 733 nsec/call
> clock-getres-realtime-coarse:    vdso: 356 nsec/call
> clock-gettime-realtime-coarse:    vdso: 367 nsec/call
> gettimeofday:    vdso: 796 nsec/call
> 
> 
> Thanks
> Christophe
