Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4080E6D3ED3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Apr 2023 10:21:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PqkPr17TRz3cd9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Apr 2023 18:21:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p1P6YJA0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p1P6YJA0;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PqkNv652yz3bh0
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Apr 2023 18:20:47 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3336MUvI029408;
	Mon, 3 Apr 2023 08:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Ce/uY5Qmt35O+FB4LSWe+febTzoDDvEq+TyyRMt2hXA=;
 b=p1P6YJA0LRKr3xgI8XfZhikG/9hvrqh3YQ0mGIWf4C4AZ2bKizlqKfqa/20ZrlpDTNLP
 fSl0/UgAkELV/+KOIgsIxnEkbUvZ/PU5g4d+RF2WeRJHOIh+dANkUj3jkRzijk34fv8y
 42xPazb1NZPAoXf2XgDHYgBVVR9uGuBrlCcsrtk5lIuMpHh587HMNx5OoWqgUk6eq5Xu
 qX8itXzN292WL34JOj20s6uSd1e9CZlf9TDJ0q4ombtnGed+WzWJp7i+bu3G1EZmXZhV
 pRYMi5JDTzbQwuAL5dW0x9J4Myyyhb0GlGsg1EeFhKPJbVxCbiDzXmR1P1aC2CxTo+en wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ppxfph6jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Apr 2023 08:20:37 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3338BHKJ032740;
	Mon, 3 Apr 2023 08:20:36 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ppxfph6j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Apr 2023 08:20:36 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 332NlPYe004036;
	Mon, 3 Apr 2023 08:20:34 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3ppbvg1ehe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Apr 2023 08:20:34 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3338KWDq43319808
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Apr 2023 08:20:32 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5481B20043;
	Mon,  3 Apr 2023 08:20:32 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 035AE20049;
	Mon,  3 Apr 2023 08:20:32 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Apr 2023 08:20:31 +0000 (GMT)
Message-ID: <6417d5ef-1fb6-7d6b-689d-39699b50af4e@linux.ibm.com>
Date: Mon, 3 Apr 2023 10:20:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] pseries/smp: export the smt level in the SYS FS.
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>, mpe@ellerman.id.au
References: <20230331153905.31698-1-ldufour@linux.ibm.com>
 <20230331153905.31698-2-ldufour@linux.ibm.com>
 <20230331160527.GA3132@kitsune.suse.cz>
Content-Language: en-US
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20230331160527.GA3132@kitsune.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FphzzPNg81fB6LJPdYbgriT8f_ZuLIuz
X-Proofpoint-GUID: BtTOKYnDXr_o_G8__RKT8Yr2jvBDuL7r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_04,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304030062
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
Cc: nathanl@linux.ibm.com, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 31/03/2023 18:05:27, Michal Suchánek wrote:
> Hello,
> 
> On Fri, Mar 31, 2023 at 05:39:04PM +0200, Laurent Dufour wrote:
>> There is no SMT level recorded in the kernel neither in user space.
>> Indeed there is no real constraint about that and mixed SMT levels are
>> allowed and system is working fine this way.
>>
>> However when new CPU are added, the kernel is onlining all the threads
>> which is leading to mixed SMT levels and confuse end user a bit.
>>
>> To prevent this exports a SMT level from the kernel so user space
>> application like the energy daemon, could read it to adjust their settings.
>> There is no action unless recording the value when a SMT value is written
>> into the new sysfs entry. User space applications like ppc64_cpu should
>> update the sysfs when changing the SMT level to keep the system consistent.
>>
>> Suggested-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>> ---
>>  arch/powerpc/platforms/pseries/pseries.h |  3 ++
>>  arch/powerpc/platforms/pseries/smp.c     | 39 ++++++++++++++++++++++++
>>  2 files changed, 42 insertions(+)
>>
>> diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
>> index f8bce40ebd0c..af0a145af98f 100644
>> --- a/arch/powerpc/platforms/pseries/pseries.h
>> +++ b/arch/powerpc/platforms/pseries/pseries.h
>> @@ -23,7 +23,9 @@ extern int pSeries_machine_check_exception(struct pt_regs *regs);
>>  extern long pseries_machine_check_realmode(struct pt_regs *regs);
>>  void pSeries_machine_check_log_err(void);
>>  
>> +
>>  #ifdef CONFIG_SMP
>> +extern int pseries_smt;
>>  extern void smp_init_pseries(void);
>>  
>>  /* Get state of physical CPU from query_cpu_stopped */
>> @@ -34,6 +36,7 @@ int smp_query_cpu_stopped(unsigned int pcpu);
>>  #define QCSS_HARDWARE_ERROR -1
>>  #define QCSS_HARDWARE_BUSY -2
>>  #else
>> +#define pseries_smt 1
> 
> Is this really needed for anything?
> 
> The code using pseries_smt would not compile with a define, and would be
> only compiled with SMP enabled anyway so we should not need this.
> 

Hi Michal,

I do agree, the pseries code is implying SMP.

When writing that code, I found that SMP conditional block and just add
this define to be sure the code will compile in the case SMP is not
defined, but that's probably useless.

Instead of resending a new series, Michael, could you please remove that
line when applying the patch to your tree?

Thanks,
Laurent.

> Thanks
> 
> Michal
> 
>>  static inline void smp_init_pseries(void) { }
>>  #endif
>>  
>> diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
>> index c597711ef20a..6c382922f8f3 100644
>> --- a/arch/powerpc/platforms/pseries/smp.c
>> +++ b/arch/powerpc/platforms/pseries/smp.c
>> @@ -21,6 +21,7 @@
>>  #include <linux/device.h>
>>  #include <linux/cpu.h>
>>  #include <linux/pgtable.h>
>> +#include <linux/sysfs.h>
>>  
>>  #include <asm/ptrace.h>
>>  #include <linux/atomic.h>
>> @@ -45,6 +46,8 @@
>>  
>>  #include "pseries.h"
>>  
>> +int pseries_smt;
>> +
>>  /*
>>   * The Primary thread of each non-boot processor was started from the OF client
>>   * interface by prom_hold_cpus and is spinning on secondary_hold_spinloop.
>> @@ -280,3 +283,39 @@ void __init smp_init_pseries(void)
>>  
>>  	pr_debug(" <- smp_init_pSeries()\n");
>>  }
>> +
>> +static ssize_t pseries_smt_store(struct class *class,
>> +			 struct class_attribute *attr,
>> +			 const char *buf, size_t count)
>> +{
>> +	int smt;
>> +
>> +	if (kstrtou32(buf, 0, &smt) || !smt || smt > (u32) threads_per_core) {
>> +		pr_err("Invalid pseries_smt specified.\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	pseries_smt = smt;
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t pseries_smt_show(struct class *class, struct class_attribute *attr,
>> +			  char *buf)
>> +{
>> +	return sysfs_emit(buf, "%d\n", pseries_smt);
>> +}
>> +
>> +static CLASS_ATTR_RW(pseries_smt);
>> +
>> +static int __init pseries_smt_init(void)
>> +{
>> +	int rc;
>> +
>> +	pseries_smt = smt_enabled_at_boot;
>> +	rc = sysfs_create_file(kernel_kobj, &class_attr_pseries_smt.attr);
>> +	if (rc)
>> +		pr_err("Can't create pseries_smt sysfs/kernel entry.\n");
>> +	return rc;
>> +}
>> +machine_device_initcall(pseries, pseries_smt_init);
>> -- 
>> 2.40.0
>>

