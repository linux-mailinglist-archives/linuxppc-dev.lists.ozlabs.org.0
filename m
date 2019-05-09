Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BD41832B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 03:15:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zwQ55nJ8zDqNj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 11:15:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zwNg1tqBzDqJM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 11:14:26 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4917TdS039819
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 8 May 2019 21:14:22 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sc9byj646-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 May 2019 21:14:22 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Thu, 9 May 2019 02:14:20 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 9 May 2019 02:14:17 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x491EGef34472158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 May 2019 01:14:16 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84E2011C052;
 Thu,  9 May 2019 01:14:16 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E680E11C04C;
 Thu,  9 May 2019 01:14:15 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  9 May 2019 01:14:15 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AAD13A01A2;
 Thu,  9 May 2019 11:14:12 +1000 (AEST)
Subject: Re: [PATCH] powerpc/powernv: Move SCOM access code into powernv
 platform
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20190508063401.17463-1-ajd@linux.ibm.com>
 <878svhw2po.fsf@concordia.ellerman.id.au>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Thu, 9 May 2019 11:14:06 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <878svhw2po.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19050901-0012-0000-0000-00000319BB48
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050901-0013-0000-0000-000021523F71
Message-Id: <df0211b9-7513-deae-f2e1-a697a21883a0@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905090004
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

On 8/5/19 10:27 pm, Michael Ellerman wrote:
> Andrew Donnellan <ajd@linux.ibm.com> writes:
> 
>> The powernv platform is the only one that directly accesses SCOMs. Move the
>> support code to platforms/powernv, and get rid of the PPC_SCOM Kconfig
>> option, as SCOM support is always selected when compiling for powernv.
> 
> This code was used on WSP / A2, back in the past which is why it
> originally lived in sysdev.
> 
>> This also means that the Kconfig item for CONFIG_SCOM_DEBUGFS will actually
>> show up in menuconfig, as previously it was the only labelled option in
>> sysdev/Kconfig and wasn't actually in a menu.
>>
>> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/scom.h                   | 4 ++--
> 
> Can't scom.h move into powernv as well?
> 

...looks like it can.

> And do we even need the whole scom_controller abstraction?

Probably not. Looks like there's some completely dead code in there too.

Will send a v2.


> 
> If we ever have another platform that needs it we can always bring it
> back.
> 
> cheers
> 
>>   arch/powerpc/platforms/powernv/Kconfig            | 5 ++++-
>>   arch/powerpc/platforms/powernv/Makefile           | 2 +-
>>   arch/powerpc/{sysdev => platforms/powernv}/scom.c | 0
>>   arch/powerpc/sysdev/Kconfig                       | 7 -------
>>   arch/powerpc/sysdev/Makefile                      | 2 --
>>   6 files changed, 7 insertions(+), 13 deletions(-)
>>   rename arch/powerpc/{sysdev => platforms/powernv}/scom.c (100%)
>>
>> diff --git a/arch/powerpc/include/asm/scom.h b/arch/powerpc/include/asm/scom.h
>> index f5cde45b1161..acc6532a9a9e 100644
>> --- a/arch/powerpc/include/asm/scom.h
>> +++ b/arch/powerpc/include/asm/scom.h
>> @@ -23,7 +23,7 @@
>>   
>>   #ifdef __KERNEL__
>>   #ifndef __ASSEMBLY__
>> -#ifdef CONFIG_PPC_SCOM
>> +#ifdef CONFIG_PPC_POWERNV
>>   
>>   /*
>>    * The SCOM bus is a sideband bus used for accessing various internal
>> @@ -161,7 +161,7 @@ static inline int scom_write(scom_map_t map, u64 reg, u64 value)
>>   }
>>   
>>   
>> -#endif /* CONFIG_PPC_SCOM */
>> +#endif /* CONFIG_PPC_POWERNV */
>>   #endif /* __ASSEMBLY__ */
>>   #endif /* __KERNEL__ */
>>   #endif /* _ASM_POWERPC_SCOM_H */
>> diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
>> index 850eee860cf2..938803eab0ad 100644
>> --- a/arch/powerpc/platforms/powernv/Kconfig
>> +++ b/arch/powerpc/platforms/powernv/Kconfig
>> @@ -12,7 +12,6 @@ config PPC_POWERNV
>>   	select EPAPR_BOOT
>>   	select PPC_INDIRECT_PIO
>>   	select PPC_UDBG_16550
>> -	select PPC_SCOM
>>   	select ARCH_RANDOM
>>   	select CPU_FREQ
>>   	select PPC_DOORBELL
>> @@ -47,3 +46,7 @@ config PPC_VAS
>>   	  VAS adapters are found in POWER9 based systems.
>>   
>>   	  If unsure, say N.
>> +
>> +config SCOM_DEBUGFS
>> +	bool "Expose SCOM controllers via debugfs"
>> +	depends on DEBUG_FS
>> diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
>> index da2e99efbd04..4b1644150135 100644
>> --- a/arch/powerpc/platforms/powernv/Makefile
>> +++ b/arch/powerpc/platforms/powernv/Makefile
>> @@ -4,12 +4,12 @@ obj-y			+= idle.o opal-rtc.o opal-nvram.o opal-lpc.o opal-flash.o
>>   obj-y			+= rng.o opal-elog.o opal-dump.o opal-sysparam.o opal-sensor.o
>>   obj-y			+= opal-msglog.o opal-hmi.o opal-power.o opal-irqchip.o
>>   obj-y			+= opal-kmsg.o opal-powercap.o opal-psr.o opal-sensor-groups.o
>> +obj-y			+= opal-xscom.o scom.o
>>   
>>   obj-$(CONFIG_SMP)	+= smp.o subcore.o subcore-asm.o
>>   obj-$(CONFIG_PCI)	+= pci.o pci-ioda.o npu-dma.o pci-ioda-tce.o
>>   obj-$(CONFIG_CXL_BASE)	+= pci-cxl.o
>>   obj-$(CONFIG_EEH)	+= eeh-powernv.o
>> -obj-$(CONFIG_PPC_SCOM)	+= opal-xscom.o
>>   obj-$(CONFIG_MEMORY_FAILURE)	+= opal-memory-errors.o
>>   obj-$(CONFIG_OPAL_PRD)	+= opal-prd.o
>>   obj-$(CONFIG_PERF_EVENTS) += opal-imc.o
>> diff --git a/arch/powerpc/sysdev/scom.c b/arch/powerpc/platforms/powernv/scom.c
>> similarity index 100%
>> rename from arch/powerpc/sysdev/scom.c
>> rename to arch/powerpc/platforms/powernv/scom.c
>> diff --git a/arch/powerpc/sysdev/Kconfig b/arch/powerpc/sysdev/Kconfig
>> index e0dbec780fe9..7808d279ff1d 100644
>> --- a/arch/powerpc/sysdev/Kconfig
>> +++ b/arch/powerpc/sysdev/Kconfig
>> @@ -28,13 +28,6 @@ config PPC_MSI_BITMAP
>>   source "arch/powerpc/sysdev/xics/Kconfig"
>>   source "arch/powerpc/sysdev/xive/Kconfig"
>>   
>> -config PPC_SCOM
>> -	bool
>> -
>> -config SCOM_DEBUGFS
>> -	bool "Expose SCOM controllers via debugfs"
>> -	depends on PPC_SCOM && DEBUG_FS
>> -
>>   config GE_FPGA
>>   	bool
>>   
>> diff --git a/arch/powerpc/sysdev/Makefile b/arch/powerpc/sysdev/Makefile
>> index aaf23283ba0c..35d52d1d2fc0 100644
>> --- a/arch/powerpc/sysdev/Makefile
>> +++ b/arch/powerpc/sysdev/Makefile
>> @@ -51,8 +51,6 @@ ifdef CONFIG_SUSPEND
>>   obj-$(CONFIG_PPC_BOOK3S_32)	+= 6xx-suspend.o
>>   endif
>>   
>> -obj-$(CONFIG_PPC_SCOM)		+= scom.o
>> -
>>   obj-$(CONFIG_PPC_EARLY_DEBUG_MEMCONS)	+= udbg_memcons.o
>>   
>>   obj-$(CONFIG_PPC_XICS)		+= xics/
>> -- 
>> 2.20.1
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

