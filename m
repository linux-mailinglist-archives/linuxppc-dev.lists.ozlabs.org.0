Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F4C499D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 09:04:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SfFw4HlvzDqY6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 17:04:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="j4C7A8Sb"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Sf9h6cNwzDqXd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 17:00:40 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 6A5A57F6DA;
 Tue, 18 Jun 2019 02:00:07 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1560841207; bh=rP06JeWTpW1z0Kz8ysokhyqV7Kp3+b8O0tqRwV7tGCk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=j4C7A8Sb3Mp5eA4Uc82D1LruLni4cn7WgjdfxMMUX62HIpCMgSzvGuyAO6XLutoEA
 kdS6o1BmjJ0a9oyrQlyDcoyp3wjapP4BMxy3thx2YDLGlh+ZBRs5YfB2ADSa7OXI7g
 xpXCkdfpCObz1eadH/FQs0yg0FCCiZLwMZIkiCDiPE2COTyQLW7TDDOTHtsxh4097L
 CvKKtzMbWKx6t4W/1MFdduO3P5DEcJMooCopxqcXfk3PnOaUcuKpBIvhWWB6vA8HD0
 U/BKyS+fWhJ4dPQmB9k5rSm4h3Lu5vQohPie6l+VWMjq9A3QlW59RBtUTC0ZcfiHfF
 ktSqCAbE/V6yA==
Subject: Re: [PATCH kernel v3 0/3] powerpc/ioda2: Yet another attempt to allow
 DMA masks between 32 and 59
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20190530070355.121802-1-aik@ozlabs.ru>
 <deb34b5f-9472-2156-e58d-8dbcb0a38979@anastas.io>
 <1e3de274-aec4-6e69-5e37-be15ea888deb@anastas.io>
 <5ad2a281-6b31-a990-ea9c-06d4c331cd23@ozlabs.ru>
 <382353e8-591c-1ec6-21d5-c81811efb097@anastas.io>
 <57d69807-a31d-da21-b401-701389fe885b@anastas.io>
 <d4a8d06e-aa5b-dab7-4b20-d1aa77b5304a@ozlabs.ru>
From: Shawn Anastasio <shawn@anastas.io>
Message-ID: <553b21c2-c57f-2b27-3210-a957158d22dc@anastas.io>
Date: Tue, 18 Jun 2019 02:00:06 -0500
MIME-Version: 1.0
In-Reply-To: <d4a8d06e-aa5b-dab7-4b20-d1aa77b5304a@ozlabs.ru>
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

On 6/18/19 1:39 AM, Alexey Kardashevskiy wrote:
> 
> 
> On 18/06/2019 14:26, Shawn Anastasio wrote:
>> On 6/12/19 2:15 PM, Shawn Anastasio wrote:
>>> On 6/12/19 2:07 AM, Alexey Kardashevskiy wrote:
>>>>
>>>>
>>>> On 12/06/2019 15:05, Shawn Anastasio wrote:
>>>>> On 6/5/19 11:11 PM, Shawn Anastasio wrote:
>>>>>> On 5/30/19 2:03 AM, Alexey Kardashevskiy wrote:
>>>>>>> This is an attempt to allow DMA masks between 32..59 which are not
>>>>>>> large
>>>>>>> enough to use either a PHB3 bypass mode or a sketchy bypass.
>>>>>>> Depending
>>>>>>> on the max order, up to 40 is usually available.
>>>>>>>
>>>>>>>
>>>>>>> This is based on v5.2-rc2.
>>>>>>>
>>>>>>> Please comment. Thanks.
>>>>>>
>>>>>> I have tested this patch set with an AMD GPU that's limited to <64bit
>>>>>> DMA (I believe it's 40 or 42 bit). It successfully allows the card to
>>>>>> operate without falling back to 32-bit DMA mode as it does without
>>>>>> the patches.
>>>>>>
>>>>>> Relevant kernel log message:
>>>>>> ```
>>>>>> [    0.311211] pci 0033:01     : [PE# 00] Enabling 64-bit DMA bypass
>>>>>> ```
>>>>>>
>>>>>> Tested-by: Shawn Anastasio <shawn@anastas.io>
>>>>>
>>>>> After a few days of further testing, I've started to run into stability
>>>>> issues with the patch applied and used with an AMD GPU. Specifically,
>>>>> the system sometimes spontaneously crashes. Not just EEH errors either,
>>>>> the whole system shuts down in what looks like a checkstop.
>>>>>
>>>>> Perhaps some subtle corruption is occurring?
>>>>
>>>> Have you tried this?
>>>>
>>>> https://patchwork.ozlabs.org/patch/1113506/
>>>
>>> I have not. I'll give it a shot and try it out for a few days to see
>>> if I'm able to reproduce the crashes.
>>
>> A few days later and I was able to reproduce the checkstop while
>> watching a video in mpv. At this point the system had ~4 day
>> uptime and this wasn't the first video I watched during that time.
>>
>> This is with https://patchwork.ozlabs.org/patch/1113506/ applied, too.
> 
> 
> Any logs left? What was the reason for the checkstop and what is the
> hardware? "lscpu" and "lspci -vv" for the starter would help. Thanks,

The machine is a Talos II with 2x 8 core DD2.2 Sforza modules.
I've added the output of lscpu and lspci below. As for logs,
it doesn't seem there are any kernel logs of the event.
The opal-gard utility shows some error records which I have
also included below.

opal-gard:
```
$ sudo ./opal-gard show 1
Record ID:    0x00000001
========================
Error ID:     0x9000000b
Error Type:   Fatal (0xe3)
Path Type: physical
 >Sys, Instance #0
  >Node, Instance #0
   >Proc, Instance #1
    >EQ, Instance #0
     >EX, Instance #0

$ sudo ./opal-gard show 2
Record ID:    0x00000002
========================
Error ID:     0x90000021
Error Type:   Fatal (0xe3)
Path Type: physical
 >Sys, Instance #0
  >Node, Instance #0
   >Proc, Instance #1
    >EQ, Instance #2
     >EX, Instance #1

```

lscpu:
```
Architecture:        ppc64le
Byte Order:          Little Endian
CPU(s):              52
On-line CPU(s) list: 0-3,8-31,36-47,52-63
Thread(s) per core:  4
Core(s) per socket:  6
Socket(s):           2
NUMA node(s):        2
Model:               2.2 (pvr 004e 1202)
Model name:          POWER9, altivec supported
CPU max MHz:         3800.0000
CPU min MHz:         2154.0000
L1d cache:           32K
L1i cache:           32K
L2 cache:            512K
L3 cache:            10240K
NUMA node0 CPU(s):   0-3,8-31
NUMA node8 CPU(s):   36-47,52-63

```

lspci -vv:
Output at: https://upaste.anastas.io/IwVQzt
