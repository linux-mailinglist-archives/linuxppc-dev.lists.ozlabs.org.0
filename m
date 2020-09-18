Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F2F26FC49
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 14:14:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtCSk2xQSzDqpJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 22:14:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HFDeNB+/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtCK24jmGzDqll
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 22:08:06 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08IC1qJe079056; Fri, 18 Sep 2020 08:08:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=bcys/Q15Z6jcYyMt3W4fSFj50TJngtiLt+yy0hXBazc=;
 b=HFDeNB+/G94BHr7OYoOk7QK9HEVpMdwB3n/eA1lWhS0zPIdMM72bh1gNUCyODjVVewuW
 6vf3uvmOt4g/nvOLVw6EW57tNLyKOhSvaM+tSoA5Ikc0HdL5DBdwiH0AWWZ92gp4uiLD
 sGxwaQlAPRVV2mGyHlOu++NmBKFltaAYkTCYBrcPcOfVTe05ycZHmPRF+/UulkU3j5ds
 2IMExCLaGA6clx5D3Lm8FzP+GIEy/7I9HF3jjcAszT5e4EnneM60537mxO5tjKSXUZ8k
 KLalqqkAoORW7oDsGILnBI1SJizM+rczPeYFu1+/h3DKZVpJJFGGMcp1EfEgau9He1f7 AA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33muxt97ng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 08:08:00 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08IC3jiJ087837;
 Fri, 18 Sep 2020 08:08:00 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33muxt97m9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 08:08:00 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08IC7vXC009021;
 Fri, 18 Sep 2020 12:07:57 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 33k65v1m10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 12:07:57 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08IC7tgd26739134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Sep 2020 12:07:55 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6530052051;
 Fri, 18 Sep 2020 12:07:55 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.209.154])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9F7EE5204E;
 Fri, 18 Sep 2020 12:07:53 +0000 (GMT)
Subject: Re: [PATCH 2/3] powerpc/mce: Add debugfs interface to inject MCE
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20200916172228.83271-1-ganeshgr@linux.ibm.com>
 <20200916172228.83271-3-ganeshgr@linux.ibm.com>
 <87a6xnoadk.fsf@mpe.ellerman.id.au>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <5f28c634-d2a8-380a-2ca4-99530ef8d15c@linux.ibm.com>
Date: Fri, 18 Sep 2020 17:37:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87a6xnoadk.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-18_14:2020-09-16,
 2020-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 malwarescore=0 phishscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009180096
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
Cc: mahesh@linux.vnet.ibm.com, msuchanek@suse.de,
 Kees Cook <keescook@chromium.org>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 9/18/20 12:10 PM, Michael Ellerman wrote:
> Hi Ganesh,
>
> Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
>> To test machine check handling, add debugfs interface to inject
>> slb multihit errors.
>>
>> To inject slb multihit:
>>   #echo 1 > /sys/kernel/debug/powerpc/mce_error_inject/inject_slb_multihit
> Rather than creating a new ad-hoc way to trigger this, can you please
> integrate it into drivers/misc/lkdtm.
>
> There's enough code here that I think you should create
> drivers/misc/lkdtm/powerpc.c and put the code in there. Then add an
> LKDTM entry point for this, maybe called PPC_SLB_MULTIHIT.
>
> Please Cc Kees when you repost.
Sure, Thanks
> cheers
>
>
>>   arch/powerpc/Kconfig.debug             |   9 ++
>>   arch/powerpc/sysdev/Makefile           |   2 +
>>   arch/powerpc/sysdev/mce_error_inject.c | 148 +++++++++++++++++++++++++
>>   3 files changed, 159 insertions(+)
>>   create mode 100644 arch/powerpc/sysdev/mce_error_inject.c
>>
>> diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
>> index b88900f4832f..61db133f2f0d 100644
>> --- a/arch/powerpc/Kconfig.debug
>> +++ b/arch/powerpc/Kconfig.debug
>> @@ -398,3 +398,12 @@ config KASAN_SHADOW_OFFSET
>>   	hex
>>   	depends on KASAN
>>   	default 0xe0000000
>> +
>> +config MCE_ERROR_INJECT
>> +	bool "Enable MCE error injection through debugfs"
>> +	depends on DEBUG_FS
>> +	default y
>> +	help
>> +	  This option creates an mce_error_inject directory in the
>> +	  powerpc debugfs directory that allows limited injection of
>> +	  Machine Check Errors (MCEs).
>> diff --git a/arch/powerpc/sysdev/Makefile b/arch/powerpc/sysdev/Makefile
>> index 026b3f01a991..7fc102222b77 100644
>> --- a/arch/powerpc/sysdev/Makefile
>> +++ b/arch/powerpc/sysdev/Makefile
>> @@ -52,3 +52,5 @@ obj-$(CONFIG_PPC_XICS)		+= xics/
>>   obj-$(CONFIG_PPC_XIVE)		+= xive/
>>   
>>   obj-$(CONFIG_GE_FPGA)		+= ge/
>> +
>> +obj-$(CONFIG_MCE_ERROR_INJECT)	+= mce_error_inject.o
>> diff --git a/arch/powerpc/sysdev/mce_error_inject.c b/arch/powerpc/sysdev/mce_error_inject.c
>> new file mode 100644
>> index 000000000000..ca4726bfa2d9
>> --- /dev/null
>> +++ b/arch/powerpc/sysdev/mce_error_inject.c
>> @@ -0,0 +1,148 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Machine Check Exception injection code
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/slab.h>
>> +#include <linux/vmalloc.h>
>> +#include <linux/fs.h>
>> +#include <linux/debugfs.h>
>> +#include <asm/debugfs.h>
>> +
>> +static inline unsigned long get_slb_index(void)
>> +{
>> +	unsigned long index;
>> +
>> +	index = get_paca()->stab_rr;
>> +
>> +	/*
>> +	 * simple round-robin replacement of slb starting at SLB_NUM_BOLTED.
>> +	 */
>> +	if (index < (mmu_slb_size - 1))
>> +		index++;
>> +	else
>> +		index = SLB_NUM_BOLTED;
>> +	get_paca()->stab_rr = index;
>> +	return index;
>> +}
>> +
>> +#define slb_esid_mask(ssize)	\
>> +	(((ssize) == MMU_SEGSIZE_256M) ? ESID_MASK : ESID_MASK_1T)
>> +
>> +static inline unsigned long mk_esid_data(unsigned long ea, int ssize,
>> +					 unsigned long slot)
>> +{
>> +	return (ea & slb_esid_mask(ssize)) | SLB_ESID_V | slot;
>> +}
>> +
>> +#define slb_vsid_shift(ssize)	\
>> +	((ssize) == MMU_SEGSIZE_256M ? SLB_VSID_SHIFT : SLB_VSID_SHIFT_1T)
>> +
>> +static inline unsigned long mk_vsid_data(unsigned long ea, int ssize,
>> +					 unsigned long flags)
>> +{
>> +	return (get_kernel_vsid(ea, ssize) << slb_vsid_shift(ssize)) | flags |
>> +		((unsigned long)ssize << SLB_VSID_SSIZE_SHIFT);
>> +}
>> +
>> +static void insert_slb_entry(char *p, int ssize)
>> +{
>> +	unsigned long flags, entry;
>> +	struct paca_struct *paca;
>> +
>> +	flags = SLB_VSID_KERNEL | mmu_psize_defs[MMU_PAGE_64K].sllp;
>> +
>> +	preempt_disable();
>> +
>> +	paca = get_paca();
>> +
>> +	entry = get_slb_index();
>> +	asm volatile("slbmte %0,%1" :
>> +			: "r" (mk_vsid_data((unsigned long)p, ssize, flags)),
>> +			  "r" (mk_esid_data((unsigned long)p, ssize, entry))
>> +			: "memory");
>> +
>> +	entry = get_slb_index();
>> +	asm volatile("slbmte %0,%1" :
>> +			: "r" (mk_vsid_data((unsigned long)p, ssize, flags)),
>> +			  "r" (mk_esid_data((unsigned long)p, ssize, entry))
>> +			: "memory");
>> +	preempt_enable();
>> +	p[0] = '!';
>> +}
>> +
>> +static void inject_vmalloc_slb_multihit(void)
>> +{
>> +	char *p;
>> +
>> +	p = vmalloc(2048);
>> +	if (!p)
>> +		return;
>> +
>> +	insert_slb_entry(p, MMU_SEGSIZE_1T);
>> +	vfree(p);
>> +}
>> +
>> +static void inject_kmalloc_slb_multihit(void)
>> +{
>> +	char *p;
>> +
>> +	p = kmalloc(2048, GFP_KERNEL);
>> +	if (!p)
>> +		return;
>> +
>> +	insert_slb_entry(p, MMU_SEGSIZE_1T);
>> +	kfree(p);
>> +}
>> +
>> +static ssize_t inject_slb_multihit(const char __user *u_buf, size_t count)
>> +{
>> +	char buf[32];
>> +	size_t buf_size;
>> +
>> +	buf_size = min(count, (sizeof(buf) - 1));
>> +	if (copy_from_user(buf, u_buf, buf_size))
>> +		return -EFAULT;
>> +	buf[buf_size] = '\0';
>> +
>> +	if (buf[0] != '1')
>> +		return -EINVAL;
>> +
>> +	inject_vmalloc_slb_multihit();
>> +	inject_kmalloc_slb_multihit();
>> +	return count;
>> +}
>> +
>> +static ssize_t inject_write(struct file *file, const char __user *buf,
>> +			    size_t count, loff_t *ppos)
>> +{
>> +	static ssize_t (*func)(const char __user *, size_t);
>> +
>> +	func = file->f_inode->i_private;
>> +	return func(buf, count);
>> +}
>> +
>> +static const struct file_operations inject_fops = {
>> +	.write		= inject_write,
>> +	.llseek		= default_llseek,
>> +};
>> +
>> +static int mce_error_inject_setup(void)
>> +{
>> +	struct dentry *mce_error_inject_dir;
>> +
>> +	mce_error_inject_dir = debugfs_create_dir("mce_error_inject",
>> +						  powerpc_debugfs_root);
>> +
>> +	if (mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
>> +		(void)debugfs_create_file("inject_slb_multihit", 0200,
>> +					  mce_error_inject_dir,
>> +					  &inject_slb_multihit,
>> +					  &inject_fops);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +device_initcall(mce_error_inject_setup);
>> -- 
>> 2.26.2
