Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A58574D10D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 11:09:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hfjLiMvn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qzyqs3hvRz3bsW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 19:09:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hfjLiMvn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qzyps6Sypz30Cg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 19:08:37 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36A8hs1S028697;
	Mon, 10 Jul 2023 09:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=6I47qqc5Vkl3hKjR5sH6y/ymC6xY3IFvu3Wy0nPK6v8=;
 b=hfjLiMvnmjttmzh9pdwt2oavXBFDiSq9HyqoBnd9cN3OZQzDV0OVjaC6oqpzKtX9AWXE
 mZgoNrWfzSleqPzUA2n35epIkcg6JGVC+s0/OWWYLpj4FGPUOfGoMGuwDjmvz9B/Y7He
 ovg93HtEuDh2/9K+qZWBzjqpJ6mldvXFMExlqvjfrsOVtLrCs3yq/5zXxy22Jr1s6QCB
 +mF//AIsDeZ3C64dWOCeRfCB4fs1d2Rq519nPvZ9bcKFnZkpjziJa+oD4iMlCIka9lFQ
 SwxplljyzsPMax0k/vdS0GpN/bcGVb/mbHvRwpckcmlqf8Jdirw1N2b0+bA8NIc59UTC XA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rreqsrppf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jul 2023 09:08:11 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36A8isEn030917;
	Mon, 10 Jul 2023 09:08:10 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rreqsrpkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jul 2023 09:08:10 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36A4oQF7031029;
	Mon, 10 Jul 2023 09:08:07 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3rpye594t8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jul 2023 09:08:06 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36A984b441615704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Jul 2023 09:08:04 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C44020040;
	Mon, 10 Jul 2023 09:08:04 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 33D7D2004B;
	Mon, 10 Jul 2023 09:08:04 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Jul 2023 09:08:04 +0000 (GMT)
Message-ID: <ff068ea8-c731-3763-066b-2503ffddd0e8@linux.ibm.com>
Date: Mon, 10 Jul 2023 11:08:03 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 00/10] Introduce SMT level and add PowerPC support
To: "Zhang, Rui" <rui.zhang@intel.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20230705145143.40545-1-ldufour@linux.ibm.com>
 <c66e3e800a7d257ef7a90749fe567f056f4c3ace.camel@intel.com>
Content-Language: en-US
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <c66e3e800a7d257ef7a90749fe567f056f4c3ace.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fxSR7G-W2yRtj5FOOq2Crrc1RbAtqDXy
X-Proofpoint-ORIG-GUID: MtIfwe2cYP4IfnB_g9wKAdATOPbCWP7z
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-10_05,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307100082
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "tglx@linutronix.de" <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/07/2023 à 17:25, Zhang, Rui a écrit :
> Hi, Laurent,
> 
> I ran into a boot hang regression with latest upstream code, and it
> took me a while to bisect the offending commit and workaround it.
> 
> Now I have tested this patch series on an Intel RaptorLake Hybrid
> platform (4 Pcores with HT and 4 Ecores without HT), and it works as
> expected.
> 
> So, for patch 1~7 in this series,
> 
> Tested-by: Zhang Rui <rui.zhang@intel.com>

Thanks Rui!

> thanks,
> rui
> 
> On Wed, 2023-07-05 at 16:51 +0200, Laurent Dufour wrote:
>> I'm taking over the series Michael sent previously [1] which is
>> smartly
>> reviewing the initial series I sent [2].  This series is addressing
>> the
>> comments sent by Thomas and me on the Michael's one.
>>
>> Here is a short introduction to the issue this series is addressing:
>>
>> When a new CPU is added, the kernel is activating all its threads.
>> This
>> leads to weird, but functional, result when adding CPU on a SMT 4
>> system
>> for instance.
>>
>> Here the newly added CPU 1 has 8 threads while the other one has 4
>> threads
>> active (system has been booted with the 'smt-enabled=4' kernel
>> option):
>>
>> ltcden3-lp12:~ # ppc64_cpu --info
>> Core   0:    0*    1*    2*    3*    4     5     6     7
>> Core   1:    8*    9*   10*   11*   12*   13*   14*   15*
>>
>> This mixed SMT level may confused end users and/or some applications.
>>
>> There is no SMT level recorded in the kernel (common code), neither
>> in user
>> space, as far as I know. Such a level is helpful when adding new CPU
>> or
>> when optimizing the energy efficiency (when reactivating CPUs).
>>
>> When SMP and HOTPLUG_SMT are defined, this series is adding a new SMT
>> level
>> (cpu_smt_num_threads) and few callbacks allowing the architecture
>> code to
>> fine control this value, setting a max and a "at boot" level, and
>> controling whether a thread should be onlined or not.
>>
>> v4:
>>    Rebase on top of 6.5's updates
>>    Remove a dependancy against the X86's symbol
>> cpu_primary_thread_mask
>> v3:
>>    Fix a build error in the patch 6/9
>> v2:
>>    As Thomas suggested,
>>      Reword some commit's description
>>      Remove topology_smt_supported()
>>      Remove topology_smt_threads_supported()
>>      Introduce CONFIG_SMT_NUM_THREADS_DYNAMIC
>>      Remove switch() in __store_smt_control()
>>    Update kernel-parameters.txt
>>
>> [1]
>> https://lore.kernel.org/linuxppc-dev/20230524155630.794584-1-mpe@ellerman.id.au/
>> [2]
>> https://lore.kernel.org/linuxppc-dev/20230331153905.31698-1-ldufour@linux.ibm.com/
>>
>>
>> Laurent Dufour (2):
>>    cpu/hotplug: remove dependancy against cpu_primary_thread_mask
>>    cpu/SMT: Remove topology_smt_supported()
>>
>> Michael Ellerman (8):
>>    cpu/SMT: Move SMT prototypes into cpu_smt.h
>>    cpu/SMT: Move smt/control simple exit cases earlier
>>    cpu/SMT: Store the current/max number of threads
>>    cpu/SMT: Create topology_smt_thread_allowed()
>>    cpu/SMT: Allow enabling partial SMT states via sysfs
>>    powerpc/pseries: Initialise CPU hotplug callbacks earlier
>>    powerpc: Add HOTPLUG_SMT support
>>    powerpc/pseries: Honour current SMT state when DLPAR onlining CPUs
>>
>>   .../ABI/testing/sysfs-devices-system-cpu      |   1 +
>>   .../admin-guide/kernel-parameters.txt         |   4 +-
>>   arch/Kconfig                                  |   3 +
>>   arch/powerpc/Kconfig                          |   2 +
>>   arch/powerpc/include/asm/topology.h           |  15 ++
>>   arch/powerpc/kernel/smp.c                     |   8 +-
>>   arch/powerpc/platforms/pseries/hotplug-cpu.c  |  30 ++--
>>   arch/powerpc/platforms/pseries/pseries.h      |   2 +
>>   arch/powerpc/platforms/pseries/setup.c        |   2 +
>>   arch/x86/include/asm/topology.h               |   4 +-
>>   arch/x86/kernel/cpu/common.c                  |   2 +-
>>   arch/x86/kernel/smpboot.c                     |   8 -
>>   include/linux/cpu.h                           |  25 +--
>>   include/linux/cpu_smt.h                       |  33 ++++
>>   kernel/cpu.c                                  | 142 +++++++++++++---
>> --
>>   15 files changed, 196 insertions(+), 85 deletions(-)
>>   create mode 100644 include/linux/cpu_smt.h
>>
> 
