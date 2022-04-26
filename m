Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C1450EE36
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 03:45:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnPpY02FFz3bs4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 11:45:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Zr8atUaF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnPnp7535z3bd5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 11:44:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Zr8atUaF; 
 dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix)
 id 4KnPnh5mdZz4xXW; Tue, 26 Apr 2022 11:44:40 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KnPnh4D6sz4x7Y;
 Tue, 26 Apr 2022 11:44:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1650937480;
 bh=VWyDU9G1Ur3JeP1x185c703CLWEY3sKF7Usq0hxceTw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Zr8atUaFLZ+IbyopYD0sGRI9OT3WMvUX6RDzLQn4zd0BVsmS4j83cockIHZ7lTEAo
 TS5vdTth0o6DPUhIvHx07Gfem5Pw01WAXrIxEaE/hiToXKHVPLQLTcu2zeCr63t+mx
 F8MfQokm7klnTY5KSe5iq0eolz7sF1CbmwOj5kw1V9AsHBGQjaIDcBEFsUyCaqR3ke
 JYUxR9reIBbn8XpBc0HixetsF9Dig8yvOnkb8qZZIoKqtnSI6fTW8XEsu2rIxe+PKh
 ZdZ2AVKmhyJx0qszKC3jbUAROjT63XNcmtSdBxYaISP2Uzq4RPJ66KxG4rdDOVhA/f
 m4qNwruSIFcTg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, Mahesh Salgaonkar
 <mahesh@linux.ibm.com>
Subject: Re: [PATCH v5] PCI hotplug: rpaphp: Error out on busy status from
 get-sensor-state
In-Reply-To: <877d7crdn7.fsf@linux.ibm.com>
References: <164684593617.368427.2230609269419942906.stgit@jupiter>
 <877d7crdn7.fsf@linux.ibm.com>
Date: Tue, 26 Apr 2022 11:44:36 +1000
Message-ID: <87ee1k8vp7.fsf@mpe.ellerman.id.au>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Mahesh Salgaonkar <mahesh@linux.ibm.com> writes:
>> When certain PHB HW failure causes phyp to recover PHB, it marks the PE
>> state as temporarily unavailable until recovery is complete. This also
>> triggers an EEH handler in Linux which needs to notify drivers, and perform
>> recovery. But before notifying the driver about the pci error it uses
                                                       PCI

>> get_adapter_state()->get-sesnor-state() operation of the hotplug_slot to
                              ^
                              typo

>> determine if the slot contains a device or not. if the slot is empty, the
>> recovery is skipped entirely.
>>
>> However on certain PHB failures, the rtas call get-sesnor-state() returns
                                                        ^
                                                        typo

>> extended busy error (9902) until PHB is recovered by phyp. Once PHB is
>> recovered, the get-sensor-state() returns success with correct presence
>> status. The rtas call interface rtas_get_sensor() loops over the rtas call
               RTAS

>> on extended delay return code (9902) until the return value is either
>> success (0) or error (-1). This causes the EEH handler to get stuck for ~6
>> seconds before it could notify that the pci error has been detected and
>> stop any active operations. Hence with running I/O traffic, during this 6
>> seconds, the network driver continues its operation and hits a timeout
>> (netdev watchdog). On timeouts, network driver go into ffdc capture mode
>> and reset path assuming the PCI device is in fatal condition. This
>> sometimes causes EEH recovery to fail. This impacts the ssh connection and
>> leads to the system being inaccessible.
>>
>> ------------
>> [52732.244731] DEBUG: ibm_read_slot_reset_state2()
>> [52732.244762] DEBUG: ret = 0, rets[0]=5, rets[1]=1, rets[2]=4000, rets[3]=>
>> [52732.244798] DEBUG: in eeh_slot_presence_check
>> [52732.244804] DEBUG: error state check
>> [52732.244807] DEBUG: Is slot hotpluggable
>> [52732.244810] DEBUG: hotpluggable ops ?
>> [52732.244953] DEBUG: Calling ops->get_adapter_status
>> [52732.244958] DEBUG: calling rpaphp_get_sensor_state
>> [52736.564262] ------------[ cut here ]------------
>> [52736.564299] NETDEV WATCHDOG: enP64p1s0f3 (tg3): transmit queue 0 timed o>
>> [52736.564324] WARNING: CPU: 1442 PID: 0 at net/sched/sch_generic.c:478 dev>
>> [...]
>> [52736.564505] NIP [c000000000c32368] dev_watchdog+0x438/0x440
>> [52736.564513] LR [c000000000c32364] dev_watchdog+0x434/0x440
>> ------------
>>
>> To avoid this issue, fix the pci hotplug driver (rpaphp) to return an error
>> if the slot presence state can not be detected immediately while pe is in
                                                                    PE
>> EEH recovery state. Current implementation uses rtas_get_sensor() API which
>> blocks the slot check state until rtas call returns success. Change
>> rpaphp_get_sensor_state() to invoke rtas_call(get-sensor-state) directly
>> only if the respective pe is in EEH recovery state, and take actions based
>> on rtas return status.
>>
>> In normal cases (non-EEH case) rpaphp_get_sensor_state() will continue to
>> invoke rtas_get_sensor() as it was earlier with no change in existing
>> behavior.
>>
>> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>>
>> ---
>> Change in v5:
>> - Fixup #define macros with parentheses around the values.
>>
>> Change in V4:
>> - Error out on sensor busy only if pe is going through EEH recovery instead
>>   of always error out.
>>
>> Change in V3:
>> - Invoke rtas_call(get-sensor-state) directly from
>>   rpaphp_get_sensor_state() directly and do special handling.
>> - See v2 at
>>   https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-November/237336.html
>>
>> Change in V2:
>> - Alternate approach to fix the EEH issue instead of delaying slot presence
>>   check proposed at
>>   https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-November/236956.html
>>
>> Also refer:
>> https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-November/237027.html
>
> Sorry for the long delay. I think it looks OK now. Does this need to go
> to the PCI list/maintainer?

Yes it needs to be Cc'ed to the PCI list/maintainer, even if we end up
merging it via the powerpc tree.

cheers
