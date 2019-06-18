Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A81F149856
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 06:29:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SZpt16sczDqXG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 14:29:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="iJ7GhOtk"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SZmg09r4zDqV6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 14:27:14 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id D7B4C7F33A;
 Mon, 17 Jun 2019 23:26:41 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1560832002; bh=FnbJXY13NicETRa0h60ON2ChfZXuKVu0ncBD26TN8uc=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=iJ7GhOtkdtQOtYOx19f1TJMpF4ZgVvO8P3xOqtgW4dSNKNhkuvcVZo+e9qFpvM3tA
 DMbtqPNfx3pmaavZ5yAaT4Jh+AHr6aMXrArs8r8yxXrBax4ZRTs4eJvwQg07DRvqZH
 ayrYruZXyaKVr3LcCtbW0c7XtyZ0Mx/vO6zh4Vq4Etfli3ObFxdskSYB5vVd1l3AZq
 7QbugvvBdlHN1y1ZUgHGj9TIhmkEVo+P5dQnE6mTxJGo/02oIMp+vHSuOmQpM+e4aa
 4kad4IV0sMmge+oTjo0iqkc0URfJzzNE9rBZ6/FrxTw1Far3rUz5ymIjehJRj0OPQw
 X7kXcAbRu+BEA==
Subject: Re: [PATCH kernel v3 0/3] powerpc/ioda2: Yet another attempt to allow
 DMA masks between 32 and 59
From: Shawn Anastasio <shawn@anastas.io>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20190530070355.121802-1-aik@ozlabs.ru>
 <deb34b5f-9472-2156-e58d-8dbcb0a38979@anastas.io>
 <1e3de274-aec4-6e69-5e37-be15ea888deb@anastas.io>
 <5ad2a281-6b31-a990-ea9c-06d4c331cd23@ozlabs.ru>
 <382353e8-591c-1ec6-21d5-c81811efb097@anastas.io>
Message-ID: <57d69807-a31d-da21-b401-701389fe885b@anastas.io>
Date: Mon, 17 Jun 2019 23:26:38 -0500
MIME-Version: 1.0
In-Reply-To: <382353e8-591c-1ec6-21d5-c81811efb097@anastas.io>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, Oliver O'Halloran <oohall@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/12/19 2:15 PM, Shawn Anastasio wrote:
> On 6/12/19 2:07 AM, Alexey Kardashevskiy wrote:
>>
>>
>> On 12/06/2019 15:05, Shawn Anastasio wrote:
>>> On 6/5/19 11:11 PM, Shawn Anastasio wrote:
>>>> On 5/30/19 2:03 AM, Alexey Kardashevskiy wrote:
>>>>> This is an attempt to allow DMA masks between 32..59 which are not 
>>>>> large
>>>>> enough to use either a PHB3 bypass mode or a sketchy bypass. Depending
>>>>> on the max order, up to 40 is usually available.
>>>>>
>>>>>
>>>>> This is based on v5.2-rc2.
>>>>>
>>>>> Please comment. Thanks.
>>>>
>>>> I have tested this patch set with an AMD GPU that's limited to <64bit
>>>> DMA (I believe it's 40 or 42 bit). It successfully allows the card to
>>>> operate without falling back to 32-bit DMA mode as it does without
>>>> the patches.
>>>>
>>>> Relevant kernel log message:
>>>> ```
>>>> [    0.311211] pci 0033:01     : [PE# 00] Enabling 64-bit DMA bypass
>>>> ```
>>>>
>>>> Tested-by: Shawn Anastasio <shawn@anastas.io>
>>>
>>> After a few days of further testing, I've started to run into stability
>>> issues with the patch applied and used with an AMD GPU. Specifically,
>>> the system sometimes spontaneously crashes. Not just EEH errors either,
>>> the whole system shuts down in what looks like a checkstop.
>>>
>>> Perhaps some subtle corruption is occurring?
>>
>> Have you tried this?
>>
>> https://patchwork.ozlabs.org/patch/1113506/
> 
> I have not. I'll give it a shot and try it out for a few days to see
> if I'm able to reproduce the crashes.

A few days later and I was able to reproduce the checkstop while
watching a video in mpv. At this point the system had ~4 day
uptime and this wasn't the first video I watched during that time.

This is with https://patchwork.ozlabs.org/patch/1113506/ applied, too.
