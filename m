Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E453BB6231
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 13:24:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YHh8023xzF4Wy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 21:24:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YHdr65DlzF4GS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 21:22:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="ALX8RLdt"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46YHdr1F4vz9s4Y;
 Wed, 18 Sep 2019 21:22:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1568805776;
 bh=ILKmzZXrfr3fMZnlqpP4MMgJ1vT3VGYx6l0dH3b3CHI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ALX8RLdtTR3NI1OKoBrGeTCNBDr8f/WrIHjSiLvO0x467j2BPunPXhi7MW3YIWsIn
 kVmLMmJEn3ypXOSdIwWCpMv7sUXYG4wtIEGmNNcXacAttDekDFTQyA0ITYB6JunwUh
 5oUm5jNi4vbeUtW733WmCLSXZKWd4EpaANfeMTEdSL2aZaK8UCXlla1jn2/oVYr1vh
 k5nmd+wFL+z4YBJIzlLthXzkpm0gFY9AhNbhH0WSvMYg14aI+3TSTxvWbDlZ4+LcAg
 uyiwc9fYWCK7OcfdGqX6HUVEwsdFb0j5CqPHBswLyStvPMlJqFRTNLsuyPyJorMDaz
 8zygAiL5LPAmA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Pingfan Liu <kernelfans@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/crashkernel: take mem option into account
In-Reply-To: <CAFgQCTvKpPEP1UywcGcC2Mo4mzzZR+ff7M3L9QN_U+hfk31ijQ@mail.gmail.com>
References: <1568256617-14030-1-git-send-email-kernelfans@gmail.com>
 <CAFgQCTvKpPEP1UywcGcC2Mo4mzzZR+ff7M3L9QN_U+hfk31ijQ@mail.gmail.com>
Date: Wed, 18 Sep 2019 21:22:52 +1000
Message-ID: <87a7b1x303.fsf@mpe.ellerman.id.au>
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
Cc: Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pingfan Liu <kernelfans@gmail.com> writes:
> Cc Kexec list. And keep the original content.
>
> On Thu, Sep 12, 2019 at 10:50 AM Pingfan Liu <kernelfans@gmail.com> wrote:
>>
>> 'mem=" option is an easy way to put high pressure on memory during some
>> test. Hence in stead of total mem, the effective usable memory size
               ^                          ^
               instead                    "actual" would be clearer

I think adding: "after applying the memory limit" 

would help here.

>> should be considered when reserving mem for crashkernel. Otherwise
>> the boot up may experience oom issue.
                              ^
                              OOM
>>
>> E.g passing
>> crashkernel="2G-4G:384M,4G-16G:512M,16G-64G:1G,64G-128G:2G,128G-:4G", and
>> mem=5G on a 256G machine.

Spelling out the behaviour before and after would help here, eg:

.. "would reserve 4G prior to the change and 512M afterward."


>> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> To: linuxppc-dev@lists.ozlabs.org
>> ---
>> v1 -> v2: fix the printk info about the total mem
>>  arch/powerpc/kernel/machine_kexec.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/machine_kexec.c b/arch/powerpc/kernel/machine_kexec.c
>> index c4ed328..eec96dc 100644
>> --- a/arch/powerpc/kernel/machine_kexec.c
>> +++ b/arch/powerpc/kernel/machine_kexec.c
>> @@ -114,11 +114,12 @@ void machine_kexec(struct kimage *image)
>>
>>  void __init reserve_crashkernel(void)
>>  {
>> -       unsigned long long crash_size, crash_base;
>> +       unsigned long long crash_size, crash_base, total_mem_sz;
>>         int ret;
>>
>> +       total_mem_sz = memory_limit ? memory_limit : memblock_phys_mem_size();
>>         /* use common parsing */
>> -       ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
>> +       ret = parse_crashkernel(boot_command_line, total_mem_sz,
>>                         &crash_size, &crash_base);

I think this change makes sense. But we have multiple arches that
implement similar logic, and I wonder if we should keep them all the
same.

eg:

  arch/arm/kernel/setup.c:                ret = parse_crashkernel(boot_command_line, total_mem,
  arch/arm64/mm/init.c:                   ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
  arch/ia64/kernel/setup.c:               ret = parse_crashkernel(boot_command_line, total,
  arch/mips/kernel/setup.c:               ret = parse_crashkernel(boot_command_line, total_mem,
  arch/powerpc/kernel/fadump.c:           ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
  arch/powerpc/kernel/machine_kexec.c:    ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
  arch/s390/kernel/setup.c:               rc = parse_crashkernel(boot_command_line, memory_end, &crash_size,
  arch/sh/kernel/machine_kexec.c:         ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
  arch/x86/kernel/setup.c:                ret = parse_crashkernel(boot_command_line, total_mem, &crash_size, &crash_base);


From a quick glance most of them don't seem to take the memory limit
into account.

So I guess the question is do we want all arches to implement the same
behaviour or do we think it doesn't matter if they differ in details
like this?

cheers
