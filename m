Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B33E22957F7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 07:35:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGx034VK4zDqdx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 16:35:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Xu3uB7jt; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGwyZ6sPMzDqNx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 16:33:58 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09M5WqT4170299; Thu, 22 Oct 2020 01:33:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=yU+wIBu86Lz+zZGSYosGKWlq8uIu5lvWkWUze+/geWo=;
 b=Xu3uB7jtgqTnsIRAIFD0IapiPYyM4KLPm1GrPXH1w6GeIALfaPXJhoCuP5+hti8b4zzl
 JYdaiy8F7+DRClJiYlJwFmWlpzfcsLz0TFneand1pgr8TbrUr3rbAdmJfmvpDmgDW6Mn
 hYH9/mRg5qL8ntLpts9N3LAv/hh9tUVwrWb/He4SpJWvBSAund/pzdMb7eh7eEj1czqc
 48jbBKGpslwcGGxQJkLy4Zbpo0eJSGax0LJWdNS4aiFzXe1DKbUenqAY27ocJDgjDNmg
 58Q+GNoIVqzcxXzvOwHp+Dw7AVTdBiBWqKLQ9XPGM/zwdwh7zkvKSAqLXPuAcusHnSzO Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34b07dn666-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Oct 2020 01:33:49 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09M5XKhW172807;
 Thu, 22 Oct 2020 01:33:49 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34b07dn652-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Oct 2020 01:33:48 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09M5Rb2B003492;
 Thu, 22 Oct 2020 05:33:46 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 347r87tmx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Oct 2020 05:33:46 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 09M5XhR229163924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Oct 2020 05:33:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54FEA4C044;
 Thu, 22 Oct 2020 05:33:43 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0E3E4C040;
 Thu, 22 Oct 2020 05:33:40 +0000 (GMT)
Received: from [9.199.32.208] (unknown [9.199.32.208])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Oct 2020 05:33:40 +0000 (GMT)
Subject: Re: [PATCH v2 1/2] powerpc: Introduce POWER10_DD1 feature
To: Jordan Niethe <jniethe5@gmail.com>
References: <20201022034039.330365-1-ravi.bangoria@linux.ibm.com>
 <CACzsE9q2nYN88bupu5Ce4Eb6r5c-_8wRciWx6qZg2RdF3Ar8Yw@mail.gmail.com>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <883e5c02-de09-72a2-21f4-c23075d08ae5@linux.ibm.com>
Date: Thu, 22 Oct 2020 11:03:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CACzsE9q2nYN88bupu5Ce4Eb6r5c-_8wRciWx6qZg2RdF3Ar8Yw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-22_01:2020-10-20,
 2020-10-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010220033
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Michael Neuling <mikey@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 maddy@linux.ibm.com, Paul Mackerras <paulus@samba.org>,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/22/20 10:41 AM, Jordan Niethe wrote:
> On Thu, Oct 22, 2020 at 2:40 PM Ravi Bangoria
> <ravi.bangoria@linux.ibm.com> wrote:
>>
>> POWER10_DD1 feature flag will be needed while adding
>> conditional code that applies only for Power10 DD1.
>>
>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/cputable.h | 8 ++++++--
>>   arch/powerpc/kernel/dt_cpu_ftrs.c   | 3 +++
>>   arch/powerpc/kernel/prom.c          | 9 +++++++++
>>   3 files changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
>> index 93bc70d4c9a1..d486f56c0d33 100644
>> --- a/arch/powerpc/include/asm/cputable.h
>> +++ b/arch/powerpc/include/asm/cputable.h
>> @@ -216,6 +216,7 @@ static inline void cpu_feature_keys_init(void) { }
>>   #define CPU_FTR_P9_RADIX_PREFETCH_BUG  LONG_ASM_CONST(0x0002000000000000)
>>   #define CPU_FTR_ARCH_31                        LONG_ASM_CONST(0x0004000000000000)
>>   #define CPU_FTR_DAWR1                  LONG_ASM_CONST(0x0008000000000000)
>> +#define CPU_FTR_POWER10_DD1            LONG_ASM_CONST(0x0010000000000000)
>>
>>   #ifndef __ASSEMBLY__
>>
>> @@ -479,6 +480,7 @@ static inline void cpu_feature_keys_init(void) { }
>>              CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
>>              CPU_FTR_TM_COMP | CPU_FTR_ARCH_300 | CPU_FTR_ARCH_31 | \
>>              CPU_FTR_DAWR | CPU_FTR_DAWR1)
>> +#define CPU_FTRS_POWER10_DD1   (CPU_FTRS_POWER10 | CPU_FTR_POWER10_DD1)
>>   #define CPU_FTRS_CELL  (CPU_FTR_LWSYNC | \
>>              CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | \
>>              CPU_FTR_ALTIVEC_COMP | CPU_FTR_MMCRA | CPU_FTR_SMT | \
>> @@ -497,14 +499,16 @@ static inline void cpu_feature_keys_init(void) { }
>>   #define CPU_FTRS_POSSIBLE      \
>>              (CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | CPU_FTRS_POWER8 | \
>>               CPU_FTR_ALTIVEC_COMP | CPU_FTR_VSX_COMP | CPU_FTRS_POWER9 | \
>> -            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10)
>> +            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10 | \
>> +            CPU_FTRS_POWER10_DD1)
>>   #else
>>   #define CPU_FTRS_POSSIBLE      \
>>              (CPU_FTRS_PPC970 | CPU_FTRS_POWER5 | \
>>               CPU_FTRS_POWER6 | CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | \
>>               CPU_FTRS_POWER8 | CPU_FTRS_CELL | CPU_FTRS_PA6T | \
>>               CPU_FTR_VSX_COMP | CPU_FTR_ALTIVEC_COMP | CPU_FTRS_POWER9 | \
>> -            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10)
>> +            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10 | \
>> +            CPU_FTRS_POWER10_DD1)
>>   #endif /* CONFIG_CPU_LITTLE_ENDIAN */
>>   #endif
>>   #else
>> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
>> index 1098863e17ee..b2327f2967ff 100644
>> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
>> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
>> @@ -811,6 +811,9 @@ static __init void cpufeatures_cpu_quirks(void)
>>          }
>>
>>          update_tlbie_feature_flag(version);
>> +
>> +       if ((version & 0xffffffff) == 0x00800100)
>> +               cur_cpu_spec->cpu_features |= CPU_FTR_POWER10_DD1;
>>   }
>>
>>   static void __init cpufeatures_setup_finished(void)
>> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
>> index c1545f22c077..c778c81284f7 100644
>> --- a/arch/powerpc/kernel/prom.c
>> +++ b/arch/powerpc/kernel/prom.c
>> @@ -305,6 +305,14 @@ static void __init check_cpu_feature_properties(unsigned long node)
>>          }
>>   }
>>
>> +static void __init fixup_cpu_features(void)
>> +{
>> +       unsigned long version = mfspr(SPRN_PVR);
>> +
>> +       if ((version & 0xffffffff) == 0x00800100)
>> +               cur_cpu_spec->cpu_features |= CPU_FTR_POWER10_DD1;
>> +}
>> +
> I am just wondering why this is needed here, but the same thing is not
> done for, say, CPU_FTR_POWER9_DD2_1?

When we don't use DT cpu_features (PowerVM / kvm geusts), we call
identify_cpu() twice. First with Real PVR which sets "raw" cpu_spec
as cur_cpu_spec and then 2nd time with Logical PVR (0x0f...) which
(mostly) overwrites the cur_cpu_spec with "architected" mode cpu_spec.
I don't see DD version specific entries for "architected" mode in
cpu_specs[] for any previous processors. So I've introduced this
function to tweak cpu_features.

Though, I don't know why we don't have similar thing for
CPU_FTR_POWER9_DD2_1. I've to check that.

> And should we get a /* Power10 DD 1 */ added to cpu_specs[]?

IIUC, we don't need such entry. For PowerVM / kvm guests, we overwrite
cpu_spec, so /* Power10 */ "raw" entry is sufficient. And For baremetal,
we don't use cpu_specs[] at all.

> 
>>   static int __init early_init_dt_scan_cpus(unsigned long node,
>>                                            const char *uname, int depth,
>>                                            void *data)
>> @@ -378,6 +386,7 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
>>
>>                  check_cpu_feature_properties(node);
>>                  check_cpu_pa_features(node);
>> +               fixup_cpu_features();
>>          }
>>
>>          identical_pvr_fixup(node);
>> --
>> 2.25.1
>>
