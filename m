Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F076E1F739A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 07:48:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jqWp265zzDr1R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 15:48:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jplp3zrCzDqk8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 15:13:22 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49jplb2vW1z9v0mr;
 Fri, 12 Jun 2020 07:13:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id qopzQPgeMR79; Fri, 12 Jun 2020 07:13:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49jplb1SChz9v0mq;
 Fri, 12 Jun 2020 07:13:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C8848B77C;
 Fri, 12 Jun 2020 07:13:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UVi1GQf-PVlC; Fri, 12 Jun 2020 07:13:16 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 05B688B75B;
 Fri, 12 Jun 2020 07:13:14 +0200 (CEST)
Subject: Re: ppc64le and 32-bit LE userland compatibility
To: Will Springer <skirmisher@protonmail.com>, linuxppc-dev@lists.ozlabs.org
References: <2047231.C4sosBPzcN@sheen>
 <8be94d2e-8e20-52b6-22e6-152b79a94139@csgroup.eu> <2498690.q0ZmV6gNhb@sheen>
 <1787237.g5d078U9FE@sheen>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <e395b07e-c515-9167-0799-32181e767721@csgroup.eu>
Date: Fri, 12 Jun 2020 07:13:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1787237.g5d078U9FE@sheen>
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es, daniel@octaforge.org,
 musl@lists.openwall.com, binutils@sourceware.org, libc-dev@lists.llvm.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/06/2020 à 01:54, Will Springer a écrit :
> On Saturday, May 30, 2020 3:17:24 PM PDT Will Springer wrote:
>> On Saturday, May 30, 2020 8:37:43 AM PDT Christophe Leroy wrote:
>>> There is a series at
>>> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=173231
>>> to switch powerpc to the Generic C VDSO.
>>>
>>> Can you try and see whether it fixes your issue ?
>>>
>>> Christophe
>>
>> Sure thing, I spotted that after making the initial post. Will report
>> back with results.
>>
>> Will [she/her]
> 
> Sorry for the wait, I just sat down to work on this again yesterday.
> 
> Tested this series on top of stable/linux-5.7.y (5.7.0 at the time of
> writing), plus the one-line signal handler patch. Had to rewind to the
> state of powerpc/merge at the time of the mail before the patch would
> apply, then cherry-picked to 5.6 until I realized the patchset used some
> functionality that didn't land until 5.7, so I moved it there.
> 
> Good news is that `date` now works correctly with the vdso call in 32-bit
> LE. Bad news is it seems to have broken things on the 64-bit side—in my
> testing, Void kicks off runit but hangs after starting eudev, and in a
> Debian Stretch system, systemd doesn't get to the point of printing
> anything whatsoever. (I had to `init=/bin/sh` to confirm the date worked
> in ppcle, although in ppc64le running `date` also hung the system when it
> made the vdso call...) Not sure how to approach debugging that, so I'd
> appreciate any pointers.
> 

Does it breaks only ppc64le vdso or also ppc64 (be) vdso ?

I never had a chance to run any test on ppc64 as I only have a kernel 
cross compiler.

Would you have a chance to build and run vdsotest from 
https://github.com/nathanlynch/vdsotest ?

Thanks
Christophe
