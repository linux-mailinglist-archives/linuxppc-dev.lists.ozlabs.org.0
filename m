Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF71446336
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 13:16:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hlzxm3Sdxz3bXc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 23:16:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ezFgGhPG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ezFgGhPG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hlzwz4mpBz2yQw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 23:15:30 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A5AkUJ3032543
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 5 Nov 2021 12:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=O/PS4XQ3l0+j9Co3ijw+8d6KE3FXk4KS80OXg1OR8l4=;
 b=ezFgGhPG/aUXCuxO4VbVSzqMfb5v8EEBlJB2iwptNDA+tMk4xD9sBNUKJFzm0BOXGsLX
 Q8ICP+vB8Nrbd1MTfL0eV0h1xLd59PAkJl3HTtl5xClExFVwKkx8qhS9gdsDwvC+i8MU
 +A79stXdzziQbttT7CmYxh5AcCBwf0DFCKHKI0WftMEHRUCKwr98iMriYSjYR9Hn5aqq
 75oc7HSX/kLP/zTLhwIm15RzWhYzsip3ZnNeILNPPSuFbhXN4cGIBUE+ImYnPY5x4ahL
 r0hIVqVdvjL++S4G9hv0boNJDxRMHO+kXcFqyPuhHug5ojpQoMb2OXRKWOwn380a9wd7 VA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c535h1nep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Nov 2021 12:15:27 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A5C3aCv007987
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 5 Nov 2021 12:15:27 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c535h1nea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 12:15:27 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A5CDjCc009001;
 Fri, 5 Nov 2021 12:15:25 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3c4t4kveq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 12:15:25 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A5CFN1X63177188
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Nov 2021 12:15:23 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BDF64C059;
 Fri,  5 Nov 2021 12:15:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21D274C078;
 Fri,  5 Nov 2021 12:15:23 +0000 (GMT)
Received: from pomme.local (unknown [9.145.172.6])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Nov 2021 12:15:23 +0000 (GMT)
Subject: Re: [PATCH v2 1/5] powerpc/watchdog: Fix missed watchdog reset due to
 memory ordering race
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211104161057.1255659-1-npiggin@gmail.com>
 <20211104161057.1255659-2-npiggin@gmail.com>
 <e060e154-a807-d087-a80f-a802a858c13e@linux.ibm.com>
 <1636112623.v4srs2ivuv.astroid@bobo.none>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <33a50334-9e7b-29e7-dc8d-1034d1d7acd9@linux.ibm.com>
Date: Fri, 5 Nov 2021 13:15:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1636112623.v4srs2ivuv.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ybI3-i9Ae20LngL15BQFBkVnwATeEtsa
X-Proofpoint-GUID: 40asDoj8q4XH6AZH5awV-8fjNt1yFhre
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-05_01,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111050071
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 05/11/2021 à 12:46, Nicholas Piggin a écrit :
> Excerpts from Laurent Dufour's message of November 5, 2021 7:20 pm:
>> Le 04/11/2021 à 17:10, Nicholas Piggin a écrit :
>>> It is possible for all CPUs to miss the pending cpumask becoming clear,
>>> and then nobody resetting it, which will cause the lockup detector to
>>> stop working. It will eventually expire, but watchdog_smp_panic will
>>> avoid doing anything if the pending mask is clear and it will never be
>>> reset.
>>>
>>> Order the cpumask clear vs the subsequent test to close this race.
>>>
>>> Add an extra check for an empty pending mask when the watchdog fires and
>>> finds its bit still clear, to try to catch any other possible races or
>>> bugs here and keep the watchdog working. The extra test in
>>> arch_touch_nmi_watchdog is required to prevent the new warning from
>>> firing off.
>>>
>>> Debugged-by: Laurent Dufour <ldufour@linux.ibm.com>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>    arch/powerpc/kernel/watchdog.c | 36 +++++++++++++++++++++++++++++++++-
>>>    1 file changed, 35 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
>>> index f9ea0e5357f9..be80071336a4 100644
>>> --- a/arch/powerpc/kernel/watchdog.c
>>> +++ b/arch/powerpc/kernel/watchdog.c
>>> @@ -135,6 +135,10 @@ static void set_cpumask_stuck(const struct cpumask *cpumask, u64 tb)
>>>    {
>>>    	cpumask_or(&wd_smp_cpus_stuck, &wd_smp_cpus_stuck, cpumask);
>>>    	cpumask_andnot(&wd_smp_cpus_pending, &wd_smp_cpus_pending, cpumask);
>>> +	/*
>>> +	 * See wd_smp_clear_cpu_pending()
>>> +	 */
>>> +	smp_mb();
>>>    	if (cpumask_empty(&wd_smp_cpus_pending)) {
>>>    		wd_smp_last_reset_tb = tb;
>>>    		cpumask_andnot(&wd_smp_cpus_pending,
>>> @@ -215,13 +219,39 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
>>>    
>>>    			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
>>>    			wd_smp_unlock(&flags);
>>> +		} else {
>>> +			/*
>>> +			 * The last CPU to clear pending should have reset the
>>> +			 * watchdog, yet we find it empty here. This should not
>>> +			 * happen but we can try to recover and avoid a false
>>> +			 * positive if it does.
>>> +			 */
>>> +			if (WARN_ON_ONCE(cpumask_empty(&wd_smp_cpus_pending)))
>>> +				goto none_pending;
>>
>> I run a stress on my victim node on top of this patch and hit that warning:
>>
>> [  C475] ------------[ cut here ]------------
>> [  C475] WARNING: CPU: 475 PID: 0 at
>> /home/laurent/src/linux-ppc/arch/powerpc/kernel/watchdog.c:260
>> wd_smp_clear_cpu_pending+0x320/0x4b0
>> [  C475] Modules linked in: rpadlpar_io rpaphp xt_tcpudp iptable_filter
>> ip_tables x_tables xfs pseries_rng rng_core vmx_crypto gf128mul be2net fuse
>> btrfs blake2b_generic libcrc32c xor zstd_compress lzo_compress raid6_pq
>> dm_service_time crc32c_vpmsum lpfc crc_t10dif crct10dif_generic crct10dif_common
>> dm_mirror dm_region_hash dm_log dm_multipath scsi_dh_rdac scsi_dh_alua autofs4
>> [  C475] CPU: 475 PID: 0 Comm: swapper/475 Kdump: loaded Not tainted
>> 5.15.0-rc2-ppc-bz192129+ #72
>> [  C475] NIP:  c00000000003d710 LR: c00000000003d478 CTR: c00000000003e2e0
>> [  C475] REGS: c00006b16026f420 TRAP: 0700   Not tainted  (5.15.0-rc2-ppc-bz192129+)
>> [  C475] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 22000222  XER: 20000000
>> [  C475] CFAR: c00000000003d480 IRQMASK: 3
>> [  C475] GPR00: c00000000003e3bc c00006b16026f6c0 c000000001b28700 0000000000000800
>> [  C475] GPR04: 0000000000000000 0000000000000800 0000000000000800 0000000000000000
>> [  C475] GPR08: 0000000000000000 0000000000000000 00000000000000f8 00013f06986272e7
>> [  C475] GPR12: c00000000003e2e0 c000000007d3df00 0000000000000000 000000001f043b60
>> [  C475] GPR16: c00006b1601b7b00 0000000000000000 c00000000003e2e0 0000000000000001
>> [  C475] GPR20: 0000347411d4cf28 c00007adbdb0a898 0000000000000001 0000000000000000
>> [  C475] GPR24: 0000000000000000 0000000000000003 c000000001b6d7d0 00013f0698627d84
>> [  C475] GPR28: c000000001bd05c8 c000000001bd05b8 c000000001bd06c8 00000000000001db
>> [  C475] NIP [c00000000003d710] wd_smp_clear_cpu_pending+0x320/0x4b0
>> [  C475] LR [c00000000003d478] wd_smp_clear_cpu_pending+0x88/0x4b0
>> [  C475] Call Trace:
>> [  C475] [c00006b16026f6c0] [0000000000000001] 0x1 (unreliable)
>> [  C475] [c00006b16026f770] [c00000000003e3bc] watchdog_timer_fn+0xdc/0x5a0
>> [  C475] [c00006b16026f840] [c000000000245a4c] __hrtimer_run_queues+0x49c/0x700
>> [  C475] [c00006b16026f8f0] [c000000000246c20] hrtimer_interrupt+0x110/0x310
>> [  C475] [c00006b16026f9a0] [c0000000000292f8] timer_interrupt+0x1e8/0x5a0
>> [  C475] [c00006b16026fa00] [c000000000009a00] decrementer_common_virt+0x210/0x220
>> [  C475] --- interrupt: 900 at plpar_hcall_norets_notrace+0x18/0x2c
>> [  C475] NIP:  c0000000000e5dd0 LR: c000000000c18f04 CTR: 0000000000000000
>> [  C475] REGS: c00006b16026fa70 TRAP: 0900   Not tainted  (5.15.0-rc2-ppc-bz192129+)
>> [  C475] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 22000824  XER: 20000000
>> [  C475] CFAR: 0000000000000c00 IRQMASK: 0
>> [  C475] GPR00: 0000000000000000 c00006b16026fd10 c000000001b28700 0000000000000000
>> [  C475] GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> [  C475] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000001
>> [  C475] GPR12: 000000000000ffff c000000007d3df00 0000000000000000 000000001f043b60
>> [  C475] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> [  C475] GPR20: 0000000000000000 0000000000000000 0000000000000000 c000000001a46cd0
>> [  C475] GPR24: c000000001b68e38 000034738d859946 0000000000000000 0000000000000001
>> [  C475] GPR28: 0000000000000000 0000000000000001 c000000001472360 c000000001472368
>> [  C475] NIP [c0000000000e5dd0] plpar_hcall_norets_notrace+0x18/0x2c
>> [  C475] LR [c000000000c18f04] check_and_cede_processor.part.2+0x24/0x70
>> [  C475] --- interrupt: 900
>> [  C475] [c00006b16026fd10] [c00007adbdb0a880] 0xc00007adbdb0a880 (unreliable)
>> [  C475] [c00006b16026fd70] [c000000000c194f4] dedicated_cede_loop+0x174/0x200
>> [  C475] [c00006b16026fdb0] [c000000000c15b2c] cpuidle_enter_state+0x3ac/0x6d0
>> [  C475] [c00006b16026fe20] [c000000000c15ef0] cpuidle_enter+0x50/0x70
>> [  C475] [c00006b16026fe60] [c0000000001a7f9c] call_cpuidle+0x4c/0x90
>> [  C475] [c00006b16026fe80] [c0000000001a84f0] do_idle+0x310/0x3c0
>> [  C475] [c00006b16026ff00] [c0000000001a8948] cpu_startup_entry+0x38/0x50
>> [  C475] [c00006b16026ff30] [c00000000005fb5c] start_secondary+0x2bc/0x2f0
>> [  C475] [c00006b16026ff90] [c00000000000d254] start_secondary_prolog+0x10/0x14
>> [  C475] Instruction dump:
>> [  C475] 48eb7049 60000000 e8610068 4bfffee4 392d0918 7c20492a 482c54f1 60000000
>> [  C475] 4bfffe4c 60000000 60000000 60000000 <0fe00000> fb210078 fb410080 fb610088
>> [  C475] irq event stamp: 0
>> [  C475] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
>> [  C475] hardirqs last disabled at (0): [<c00000000014342c>]
>> copy_process+0x76c/0x1e00
>> [  C475] softirqs last  enabled at (0): [<c00000000014342c>]
>> copy_process+0x76c/0x1e00
>> [  C475] softirqs last disabled at (0): [<0000000000000000>] 0x0
>> [  C475] ---[ end trace 6e8311d1692d057b ]---
>>
>> I guess there is a possible race here between watchdog_timer_interrupt() and
>> another CPU watchdog_smp_panic().
> 
> Hmm, yeah of course there would be. May have to just remove that warn.

Yes I do agree, it should be removed.

Cheers,
Laurent.
