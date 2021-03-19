Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D299341BD9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 12:57:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F22SR2mhRz3c4L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 22:57:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XIt5LAND;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XIt5LAND; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F22S310w9z2ym4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 22:56:50 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F22S06R4Mz9sWF;
 Fri, 19 Mar 2021 22:56:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1616155009;
 bh=FFBDbhj524f1tcZX2VRewGPMggp9zP78aFLQ85whC+8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=XIt5LAND7s+z+7Y6HSWAT4NNCGgEudc+2SBKmb7KbsWhQ66NCKFOwIDtsR9AdE8k2
 PzbPDfDqhxmCizHozQS3be3zbau3zHw5wY31z4zVDxnt2n5azYI+APrPnHLnvmBj9Q
 16cOdGpWiID2+G8fWhhYHIha/5QvqE+Jlw04Xyat9bO66Ec7vGjz25EF6UkdeV5vY2
 kMUuuOK+vLReWAwaqiCWH8jfCnnDiIwYr2NRamF8s6ucJTFXFQMhfsr8MXs63fYeO2
 Jr/d765wS1BzQzZijOXD+8f4MQ5dlLySfYKnHfeXoc5adiQ9qAz5uT0a/btRMmTY9H
 KH9Ugf9tVKYHg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/6] powerpc/mm/64s/hash: Add real-mode
 change_memory_range() for hash LPAR
In-Reply-To: <87h7m8pyk5.fsf@dja-thinkpad.axtens.net>
References: <20210211135130.3474832-1-mpe@ellerman.id.au>
 <20210211135130.3474832-5-mpe@ellerman.id.au>
 <87h7m8pyk5.fsf@dja-thinkpad.axtens.net>
Date: Fri, 19 Mar 2021 22:56:47 +1100
Message-ID: <871rcb8igw.fsf@mpe.ellerman.id.au>
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
Cc: aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>
>> When we enabled STRICT_KERNEL_RWX we received some reports of boot
>> failures when using the Hash MMU and running under phyp. The crashes
>> are intermittent, and often exhibit as a completely unresponsive
>> system, or possibly an oops.
>>
>> One example, which was caught in xmon:
>>
>>   [   14.068327][    T1] devtmpfs: mounted
>>   [   14.069302][    T1] Freeing unused kernel memory: 5568K
>>   [   14.142060][  T347] BUG: Unable to handle kernel instruction fetch
>>   [   14.142063][    T1] Run /sbin/init as init process
>>   [   14.142074][  T347] Faulting instruction address: 0xc000000000004400
>>   cpu 0x2: Vector: 400 (Instruction Access) at [c00000000c7475e0]
>>       pc: c000000000004400: exc_virt_0x4400_instruction_access+0x0/0x80
>>       lr: c0000000001862d4: update_rq_clock+0x44/0x110
>>       sp: c00000000c747880
>>      msr: 8000000040001031
>>     current = 0xc00000000c60d380
>>     paca    = 0xc00000001ec9de80   irqmask: 0x03   irq_happened: 0x01
>>       pid   = 347, comm = kworker/2:1
>>   ...
>>   enter ? for help
>>   [c00000000c747880] c0000000001862d4 update_rq_clock+0x44/0x110 (unreliable)
>>   [c00000000c7478f0] c000000000198794 update_blocked_averages+0xb4/0x6d0
>>   [c00000000c7479f0] c000000000198e40 update_nohz_stats+0x90/0xd0
>>   [c00000000c747a20] c0000000001a13b4 _nohz_idle_balance+0x164/0x390
>>   [c00000000c747b10] c0000000001a1af8 newidle_balance+0x478/0x610
>>   [c00000000c747be0] c0000000001a1d48 pick_next_task_fair+0x58/0x480
>>   [c00000000c747c40] c000000000eaab5c __schedule+0x12c/0x950
>>   [c00000000c747cd0] c000000000eab3e8 schedule+0x68/0x120
>>   [c00000000c747d00] c00000000016b730 worker_thread+0x130/0x640
>>   [c00000000c747da0] c000000000174d50 kthread+0x1a0/0x1b0
>>   [c00000000c747e10] c00000000000e0f0 ret_from_kernel_thread+0x5c/0x6c
>>
>> This shows that CPU 2, which was idle, woke up and then appears to
>> randomly take an instruction fault on a completely valid area of
>> kernel text.
>>
>> The cause turns out to be the call to hash__mark_rodata_ro(), late in
>> boot. Due to the way we layout text and rodata, that function actually
>> changes the permissions for all of text and rodata to read-only plus
>> execute.
>>
>> To do the permission change we use a hypervisor call, H_PROTECT. On
>> phyp that appears to be implemented by briefly removing the mapping of
>> the kernel text, before putting it back with the updated permissions.
>> If any other CPU is executing during that window, it will see spurious
>> faults on the kernel text and/or data, leading to crashes.
>
> Jordan asked why we saw this on phyp but not under KVM? We had a look at
> book3s_hv_rm_mmu.c but the code is a bit too obtuse for me to reason
> about!
>
> Nick suggests that the KVM hypervisor is invalidating the HPTE, but
> because we run guests in VPM mode, the hypervisor would catch the page
> fault and not reflect it down to the guest. It looks like Linux-as-a-HV
> will take HPTE_V_HVLOCK, and then because it's running in VPM mode, the
> hypervisor will catch the fault and not pass it to the guest.

Yep.

> But if phyp runs with VPM mode off, the guest will see the fault
> before the hypervisor. (we think this is what's going on anyway.)

Yeah. I assumed phyp always ran with VPM=1, but apparently it can run
with it off or on, depending on various configuration settings.

So I'm fairly sure what we're hitting here is VPM=0, where the faults go
straight to the guest.

cheers
