Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 978F77EC1B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 12:54:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ha7pusum;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVhRR3dglz3cmV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 22:54:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ha7pusum;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVhQZ3wwzz2yVR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 22:53:58 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AFBCgtE002120
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 11:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=1yRoE5Zj8vcc7OUrfiIrxX4Emzp1SK+htOP4B440DlE=;
 b=ha7pusumt+DnilZSnj3rQosFR0FxXiLjScRjVxi01k5JoHQ3lDI2sDryGvQWDB2s9FYP
 bpMGIX1/IV7oO/olU/bKy6JgG0tNc8FHNrj3cX9JQnHzbBpZJUOlXCyw8F3UTORfmPbK
 rZX1sQoVlXIJMKzk60H1ZzNRLWlrPbJm6rZMZ2uZeE/3GrM7iDxdPtIz6wT8EJt2rT8W
 cQdAfjIhWioJ9Btb8w2ZlVQLOFxCFAP9M7tF9J4x5J7On58pCkT/0mQCMhi4bSz227ID
 Mf7a+Jxj9GDzdbm8n8rXAE65bg3jK8GN3U8zybSNQi1YzuFZ2Wk9Uboq9eAe034kJ3f7 Sg== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ucvwkh8w5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 11:53:54 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AFAusp6023948
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 11:53:53 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uamayf3h8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 11:53:53 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AFBrqIB23462638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Nov 2023 11:53:52 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40DBC5805E;
	Wed, 15 Nov 2023 11:53:52 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C0DE5805A;
	Wed, 15 Nov 2023 11:53:51 +0000 (GMT)
Received: from [9.171.65.177] (unknown [9.171.65.177])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Nov 2023 11:53:51 +0000 (GMT)
Message-ID: <ecc9d34a-4960-4540-802e-d35ee4f5259b@linux.ibm.com>
Date: Wed, 15 Nov 2023 17:23:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: Restrict ARCH_HIBERNATION_POSSIBLE to supported
 configurations
Content-Language: en-US
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org
References: <20231114082046.6018-1-vishalc@linux.ibm.com>
 <87sf57zbcd.fsf@linux.ibm.com>
From: Vishal Chourasia <vishalc@linux.ibm.com>
In-Reply-To: <87sf57zbcd.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SIhnT6wk8GStyvJ2Uydbts_h7KwEvMk5
X-Proofpoint-GUID: SIhnT6wk8GStyvJ2Uydbts_h7KwEvMk5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_10,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 mlxlogscore=885 impostorscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311150091
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 15/11/23 1:39 pm, Aneesh Kumar K.V wrote:
> Vishal Chourasia <vishalc@linux.ibm.com> writes:
>
>> This patch modifies the ARCH_HIBERNATION_POSSIBLE option to ensure that it
>> correctly depends on these PowerPC configurations being enabled. As a result,
>> it prevents the HOTPLUG_CPU from being selected when the required dependencies
>> are not satisfied.
>>
>> This change aligns the dependency tree with the expected hardware support for
>> CPU hot-plugging under PowerPC architectures, ensuring that the kernel
>> configuration steps do not lead to inconsistent states.
>>
>> Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
>> ---
>> During the configuration process with 'make randconfig' followed by
>> 'make olddefconfig', we observed a warning indicating an unmet direct
>> dependency for the HOTPLUG_CPU option. The dependency in question relates to
>> various PowerPC configurations (PPC_PSERIES, PPC_PMAC, PPC_POWERNV,
>> FSL_SOC_BOOKE) which were not enabled, yet the HOTPLUG_CPU was being
>> erroneously selected due to an implicit assumption by the PM_SLEEP_SMP option.
>> This misalignment in dependencies could potentially lead to inconsistent kernel
>> configuration states, especially when considering the necessary hardware
>> support for CPU hot-plugging on PowerPC platforms. The patch aims to correct
>> this by ensuring that ARCH_HIBERNATION_POSSIBLE is contingent upon the
>> appropriate PowerPC configurations being active.
>>
>> steps to reproduce (before applying the patch):
>>
>> Run 'make pseries_le_defconfig'
>> Run 'make menuconfig'
>> Enable hibernation [ Kernel options -> Hibernation (aka 'suspend to disk') ] 
>> Disable [ Platform support -> IBM PowerNV (Non-Virtualized) platform support ]
>> Disable [ Platform support -> IBM pSeries & new (POWER5-based) iSeries ]
>> Enable SMP [ Processor support -> Symmetric multi-processing support ]
>> Save the config
>> Run 'make olddefconfig'
>>
>>  arch/powerpc/Kconfig | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 6f105ee4f3cf..bf99ff9869f6 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -380,8 +380,9 @@ config DEFAULT_UIMAGE
>>  	  Used to allow a board to specify it wants a uImage built by default
>>  
>>  config ARCH_HIBERNATION_POSSIBLE
>> -	bool
>> -	default y
>> +	def_bool y
>> +	depends on PPC_PSERIES || \
>> +		PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE
>>  
>>  config ARCH_SUSPEND_POSSIBLE
>>  	def_bool y
>>
> I am wondering whether it should be switched to using select from
> config PPC? 

selecting ARCH_HIBERNATION_POSSIBLE based on value of config PPC
will not guarantee config PPC_PSERIES being set

PPC_PSERIES can be set to N, even when config PPC is set.

grep -A 5 -i "config ppc_pseries" arch/powerpc/platforms/pseries/Kconfig
config PPC_PSERIES
        depends on PPC64 && PPC_BOOK3S
        bool "IBM pSeries & new (POWER5-based) iSeries"
        select HAVE_PCSPKR_PLATFORM
        select MPIC
        select OF_DYNAMIC

>
> -aneesh
