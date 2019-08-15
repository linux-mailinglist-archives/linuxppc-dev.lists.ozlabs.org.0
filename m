Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C37D58E605
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 10:17:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468K7L1thQzDq6B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 18:17:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.59.63; helo=4.mo68.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 4.mo68.mail-out.ovh.net (4.mo68.mail-out.ovh.net [46.105.59.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468K5T00LGzDr0v
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 18:15:36 +1000 (AEST)
Received: from player797.ha.ovh.net (unknown [10.109.143.72])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id F06871400C2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 10:15:31 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player797.ha.ovh.net (Postfix) with ESMTPSA id 8DC168F83BE8;
 Thu, 15 Aug 2019 08:15:26 +0000 (UTC)
Subject: Re: [PATCH 1/3] powerpc/xmon: Check for HV mode when dumping XIVE
 info from OPAL
To: Jordan Niethe <jniethe5@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20190814154754.23682-1-clg@kaod.org>
 <20190814154754.23682-2-clg@kaod.org>
 <21746c620de5ac0b9489a10cdc1f584f94d592fd.camel@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <294237fc-13eb-a0eb-3c28-db4141140e8d@kaod.org>
Date: Thu, 15 Aug 2019 10:15:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <21746c620de5ac0b9489a10cdc1f584f94d592fd.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1487032305732455363
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudefuddgtdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15/08/2019 09:30, Jordan Niethe wrote:
> On Wed, 2019-08-14 at 17:47 +0200, Cédric Le Goater wrote:
>> Currently, the xmon 'dx' command calls OPAL to dump the XIVE state in
>> the OPAL logs and also outputs some of the fields of the internal
>> XIVE
>> structures in Linux. The OPAL calls can only be done on baremetal
>> (PowerNV) and they crash a pseries machine. Fix by checking the
>> hypervisor feature of the CPU.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  arch/powerpc/xmon/xmon.c | 17 ++++++++++-------
>>  1 file changed, 10 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
>> index 14e56c25879f..25d4adccf750 100644
>> --- a/arch/powerpc/xmon/xmon.c
>> +++ b/arch/powerpc/xmon/xmon.c
>> @@ -2534,13 +2534,16 @@ static void dump_pacas(void)
>>  static void dump_one_xive(int cpu)
>>  {
>>  	unsigned int hwid = get_hard_smp_processor_id(cpu);
>> -
>> -	opal_xive_dump(XIVE_DUMP_TM_HYP, hwid);
>> -	opal_xive_dump(XIVE_DUMP_TM_POOL, hwid);
>> -	opal_xive_dump(XIVE_DUMP_TM_OS, hwid);
>> -	opal_xive_dump(XIVE_DUMP_TM_USER, hwid);
>> -	opal_xive_dump(XIVE_DUMP_VP, hwid);
>> -	opal_xive_dump(XIVE_DUMP_EMU_STATE, hwid);
>> +	bool hv = cpu_has_feature(CPU_FTR_HVMODE);
>> +
>> +	if (hv) {
>> +		opal_xive_dump(XIVE_DUMP_TM_HYP, hwid);
>> +		opal_xive_dump(XIVE_DUMP_TM_POOL, hwid);
>> +		opal_xive_dump(XIVE_DUMP_TM_OS, hwid);
>> +		opal_xive_dump(XIVE_DUMP_TM_USER, hwid);
>> +		opal_xive_dump(XIVE_DUMP_VP, hwid);
>> +		opal_xive_dump(XIVE_DUMP_EMU_STATE, hwid);
>> +	}
>>  
>>  	if (setjmp(bus_error_jmp) != 0) {
>>  		catch_memory_errors = 0;
> dump_one_xive() / other xive functions are guarded by #ifdef
> CONFIG_PPC_POWERNV in xmon.c aren't they? With this series would it be
> that these guards can be removed?

One could compile without CONFIG_PPC_POWERNV but we would still want 
these commands to be available for pseries. I missed that.

I think we should move the opal_xive_dump calls to some other command, 
dxo for 'dump_xive_opal' may be, as they only output in the OPAL logs.

This needs some rework.

Thanks,

C.
