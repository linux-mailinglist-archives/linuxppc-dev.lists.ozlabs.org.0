Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE4A42FC9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 21:16:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PGnv1FzczDr30
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 05:16:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="h0Sb92fU"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PGlw0yTzzDqyl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 05:15:07 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id E63457F6C7;
 Wed, 12 Jun 2019 14:14:34 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1560366875; bh=29SGjY8pBVEnY3447aaZaOxYhHhpUdRGCrjebhFhyPc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=h0Sb92fUymKO6cgeqRtkRDA7XgbFs7C1WTyuCjyCi7vGOrRs2liWAvOB114gtrcT3
 hHii3D6zqnKLOuG6pTHpZILK6Vwcjp33HW9qrgFFh8vD+Lm1KdewaWMM7mSPATWlat
 XW2f2C2f/KDfJs6XsowsYH1n4/Z58j15P10k6341spvl/cWAlloX0gF93oQg8fbsw+
 TK0f8+iyt3+/olFXFp0u6PcbpvVySsHum+iCooTR7zFVcIoDuQu9wXD9I6q66N/2/w
 /JnXa+HKpsusQNsG5z+Gnd9uKSQQ2ha4YoxGk6qWrEri6mtGR37FplGqZuC2Fs2m0U
 jq6llLU2c6hkw==
Subject: Re: [PATCH kernel v3 0/3] powerpc/ioda2: Yet another attempt to allow
 DMA masks between 32 and 59
To: Oliver O'Halloran <oohall@gmail.com>
References: <20190530070355.121802-1-aik@ozlabs.ru>
 <deb34b5f-9472-2156-e58d-8dbcb0a38979@anastas.io>
 <1e3de274-aec4-6e69-5e37-be15ea888deb@anastas.io>
 <CAOSf1CEoEgWwD2qmBHiCG0B4JjmS0g=SUqm+OEYsbvv11QSARw@mail.gmail.com>
From: Shawn Anastasio <shawn@anastas.io>
Message-ID: <eef72f17-0d6f-9fe2-b966-787f29d8f8f1@anastas.io>
Date: Wed, 12 Jun 2019 14:14:32 -0500
MIME-Version: 1.0
In-Reply-To: <CAOSf1CEoEgWwD2qmBHiCG0B4JjmS0g=SUqm+OEYsbvv11QSARw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Alistair Popple <alistair@popple.id.au>, Sam Bobroff <sbobroff@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/12/19 1:16 AM, Oliver O'Halloran wrote:
> On Wed, Jun 12, 2019 at 3:06 PM Shawn Anastasio <shawn@anastas.io> wrote:
>>
>> On 6/5/19 11:11 PM, Shawn Anastasio wrote:
>>> On 5/30/19 2:03 AM, Alexey Kardashevskiy wrote:
>>>> This is an attempt to allow DMA masks between 32..59 which are not large
>>>> enough to use either a PHB3 bypass mode or a sketchy bypass. Depending
>>>> on the max order, up to 40 is usually available.
>>>>
>>>>
>>>> This is based on v5.2-rc2.
>>>>
>>>> Please comment. Thanks.
>>>
>>> I have tested this patch set with an AMD GPU that's limited to <64bit
>>> DMA (I believe it's 40 or 42 bit). It successfully allows the card to
>>> operate without falling back to 32-bit DMA mode as it does without
>>> the patches.
>>>
>>> Relevant kernel log message:
>>> ```
>>> [    0.311211] pci 0033:01     : [PE# 00] Enabling 64-bit DMA bypass
>>> ```
>>>
>>> Tested-by: Shawn Anastasio <shawn@anastas.io>
>>
>> After a few days of further testing, I've started to run into stability
>> issues with the patch applied and used with an AMD GPU. Specifically,
>> the system sometimes spontaneously crashes. Not just EEH errors either,
>> the whole system shuts down in what looks like a checkstop.
> 
> Any specific workload? Checkstops are harder to debug without a system
> in the failed state so we'd need to replicate that locally to get a
> decent idea what's up.

I haven't been able to pinpoint the exact cause. The first time it
happened was after about 4 days of uptime while playing a 1080p
video in mpv. The second time was about 5 minutes after booting up
while restoring a firefox session.
