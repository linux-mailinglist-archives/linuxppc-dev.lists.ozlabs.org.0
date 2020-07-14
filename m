Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCF221E8C4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 09:01:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5Wds0MC5zDqZw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 17:01:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5Wbc4dCZzDqRp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 16:59:37 +1000 (AEST)
Received: from [192.168.0.6] (ip5f5af29b.dynamic.kabel-deutschland.de
 [95.90.242.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 6BEA6206466EA;
 Tue, 14 Jul 2020 08:59:31 +0200 (CEST)
Subject: Re: /sys/kernel/debug/kmemleak empty despite kmemleak reports
To: Catalin Marinas <catalin.marinas@arm.com>
References: <070dd6b7-1ee6-8090-8973-1eb0240f6948@molgen.mpg.de>
 <20200709175705.GD6579@gaia>
 <276e4bce-3e21-8020-9a1c-729a6cafcdd3@molgen.mpg.de>
 <20200713182735.GH15829@gaia>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <b84ccca2-3c5d-b3b9-e097-6932592b3bc9@molgen.mpg.de>
Date: Tue, 14 Jul 2020 08:59:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200713182735.GH15829@gaia>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Catalin,


Am 13.07.20 um 20:27 schrieb Catalin Marinas:
> On Thu, Jul 09, 2020 at 11:08:52PM +0200, Paul Menzel wrote:
>> Am 09.07.20 um 19:57 schrieb Catalin Marinas:
>>> On Thu, Jul 09, 2020 at 04:37:10PM +0200, Paul Menzel wrote:
>>>> Despite Linux 5.8-rc4 reporting memory leaks on the IBM POWER 8 S822LC, the
>>>> file does not contain more information.
>>>>
>>>>> $ dmesg
>>>>> […] > [48662.953323] perf: interrupt took too long (2570 > 2500), lowering kernel.perf_event_max_sample_rate to 77750
>>>>> [48854.810636] perf: interrupt took too long (3216 > 3212), lowering kernel.perf_event_max_sample_rate to 62000
>>>>> [52300.044518] perf: interrupt took too long (4244 > 4020), lowering kernel.perf_event_max_sample_rate to 47000
>>>>> [52751.373083] perf: interrupt took too long (5373 > 5305), lowering kernel.perf_event_max_sample_rate to 37000
>>>>> [53354.000363] perf: interrupt took too long (6793 > 6716), lowering kernel.perf_event_max_sample_rate to 29250
>>>>> [53850.215606] perf: interrupt took too long (8672 > 8491), lowering kernel.perf_event_max_sample_rate to 23000
>>>>> [57542.266099] perf: interrupt took too long (10940 > 10840), lowering kernel.perf_event_max_sample_rate to 18250
>>>>> [57559.645404] perf: interrupt took too long (13714 > 13675), lowering kernel.perf_event_max_sample_rate to 14500
>>>>> [61608.697728] Can't find PMC that caused IRQ
>>>>> [71774.463111] kmemleak: 12 new suspected memory leaks (see /sys/kernel/debug/kmemleak)
>>>>> [92372.044785] process '@/usr/bin/gnatmake-5' started with executable stack
>>>>> [92849.380672] FS-Cache: Loaded
>>>>> [92849.417269] FS-Cache: Netfs 'nfs' registered for caching
>>>>> [92849.595974] NFS: Registering the id_resolver key type
>>>>> [92849.596000] Key type id_resolver registered
>>>>> [92849.596000] Key type id_legacy registered
>>>>> [101808.079143] kmemleak: 1 new suspected memory leaks (see /sys/kernel/debug/kmemleak)
>>>>> [106904.323471] Can't find PMC that caused IRQ
>>>>> [129416.391456] kmemleak: 1 new suspected memory leaks (see /sys/kernel/debug/kmemleak)
>>>>> [158171.604221] kmemleak: 34 new suspected memory leaks (see /sys/kernel/debug/kmemleak)
>>>>> $ sudo cat /sys/kernel/debug/kmemleak
>>>
>>> When they are no longer present, they are most likely false positives.
>>
>> How can this be? Shouldn’t the false positive also be logged in
>> `/sys/kernel/debug/kmemleak`?
> 
> Sorry, I wasn't clear. It can be a transient false positive. At a
> subsequent scan, kmemleak found pointer referring the previously
> reported objects and no longer shows them.

Interesting. Is it possible to print a message in that case to avoid 
confusion?

>>> Was this triggered during boot? Or under some workload?
>>
>>  From the timestamps it looks like under some load.
> 
> Was it during boot? I put a delay of 60s to avoid this but, depending on
> the platform, it can still trigger.

No, it happened after several hours of runtime.


Kind regards,

Paul
