Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7066E20A6E6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 22:40:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tBjD50S1zDqwy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 06:40:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tBgb47xnzDqgr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 06:38:51 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05PKXOdu102795; Thu, 25 Jun 2020 16:38:42 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31vxqkg4he-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 16:38:42 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05PKZi1K012651;
 Thu, 25 Jun 2020 20:38:41 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 31uurtam63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 20:38:41 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05PKcc829634114
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Jun 2020 20:38:38 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 235F8BE054;
 Thu, 25 Jun 2020 20:38:40 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42ED8BE04F;
 Thu, 25 Jun 2020 20:38:39 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.126.221])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 25 Jun 2020 20:38:39 +0000 (GMT)
Subject: Re: [PATCH] powerpc: Warn about use of smt_snooze_delay
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Joel Stanley <joel@jms.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20200625100349.2408899-1-joel@jms.id.au>
 <189c0339-da57-9df7-4774-4fe97db7ce52@csgroup.eu>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <76841047-89a0-d420-7526-f78fe9c35dad@linux.ibm.com>
Date: Thu, 25 Jun 2020 13:38:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <189c0339-da57-9df7-4774-4fe97db7ce52@csgroup.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-25_16:2020-06-25,
 2020-06-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 priorityscore=1501 cotscore=-2147483648
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006250120
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
Cc: ego@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/25/20 3:29 AM, Christophe Leroy wrote:
> 
> 
> Le 25/06/2020 à 12:03, Joel Stanley a écrit :
>> It's not done anything for a long time. Save the percpu variable, and
>> emit a warning to remind users to not expect it to do anything.
> 
> Why not just drop the file entirely  if it is useless ?

Userspace tooling that hasn't learned its useless yet. Joel has also submitted a
pull request for the ppc64_util tool in question to drop using this interface.

-Tyrel

> 
> Christophe
> 
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>   arch/powerpc/kernel/sysfs.c | 41 +++++++++++++------------------------
>>   1 file changed, 14 insertions(+), 27 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
>> index 571b3259697e..530ae92bc46d 100644
>> --- a/arch/powerpc/kernel/sysfs.c
>> +++ b/arch/powerpc/kernel/sysfs.c
>> @@ -32,29 +32,25 @@
>>     static DEFINE_PER_CPU(struct cpu, cpu_devices);
>>   -/*
>> - * SMT snooze delay stuff, 64-bit only for now
>> - */
>> -
>>   #ifdef CONFIG_PPC64
>>   -/* Time in microseconds we delay before sleeping in the idle loop */
>> -static DEFINE_PER_CPU(long, smt_snooze_delay) = { 100 };
>> +/*
>> + * Snooze delay has not been hooked up since 3fa8cad82b94
>> ("powerpc/pseries/cpuidle:
>> + * smt-snooze-delay cleanup.") and has been broken even longer. As was
>> foretold in
>> + * 2014:
>> + *
>> + *  "ppc64_util currently utilises it. Once we fix ppc64_util, propose to clean
>> + *  up the kernel code."
>> + *
>> + * At some point in the future this code should be removed.
>> + */
>>     static ssize_t store_smt_snooze_delay(struct device *dev,
>>                         struct device_attribute *attr,
>>                         const char *buf,
>>                         size_t count)
>>   {
>> -    struct cpu *cpu = container_of(dev, struct cpu, dev);
>> -    ssize_t ret;
>> -    long snooze;
>> -
>> -    ret = sscanf(buf, "%ld", &snooze);
>> -    if (ret != 1)
>> -        return -EINVAL;
>> -
>> -    per_cpu(smt_snooze_delay, cpu->dev.id) = snooze;
>> +    WARN_ON_ONCE("smt_snooze_delay sysfs file has no effect\n");
>>       return count;
>>   }
>>   @@ -62,9 +58,9 @@ static ssize_t show_smt_snooze_delay(struct device *dev,
>>                        struct device_attribute *attr,
>>                        char *buf)
>>   {
>> -    struct cpu *cpu = container_of(dev, struct cpu, dev);
>> +    WARN_ON_ONCE("smt_snooze_delay sysfs file has no effect\n");
>>   -    return sprintf(buf, "%ld\n", per_cpu(smt_snooze_delay, cpu->dev.id));
>> +    return sprintf(buf, "100\n");
>>   }
>>     static DEVICE_ATTR(smt_snooze_delay, 0644, show_smt_snooze_delay,
>> @@ -72,16 +68,7 @@ static DEVICE_ATTR(smt_snooze_delay, 0644,
>> show_smt_snooze_delay,
>>     static int __init setup_smt_snooze_delay(char *str)
>>   {
>> -    unsigned int cpu;
>> -    long snooze;
>> -
>> -    if (!cpu_has_feature(CPU_FTR_SMT))
>> -        return 1;
>> -
>> -    snooze = simple_strtol(str, NULL, 10);
>> -    for_each_possible_cpu(cpu)
>> -        per_cpu(smt_snooze_delay, cpu) = snooze;
>> -
>> +    WARN_ON_ONCE("smt-snooze-delay command line option has no effect\n");
>>       return 1;
>>   }
>>   __setup("smt-snooze-delay=", setup_smt_snooze_delay);
>>

