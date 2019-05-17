Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAD421A71
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 17:19:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 455Blh436KzDqST
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 01:19:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 455BkG1NXDzDqN0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2019 01:17:57 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4HF7eeS028658
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 11:17:55 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2shwdqe27b-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 11:17:55 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Fri, 17 May 2019 16:17:54 +0100
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 17 May 2019 16:17:51 +0100
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4HFHoPi18350418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 May 2019 15:17:50 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 601856E04C;
 Fri, 17 May 2019 15:17:50 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 952746E050;
 Fri, 17 May 2019 15:17:48 +0000 (GMT)
Received: from [9.199.59.156] (unknown [9.199.59.156])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 17 May 2019 15:17:48 +0000 (GMT)
Subject: Re: [PATCH] mm/nvdimm: Pick the right alignment default when creating
 dax devices
To: Vaibhav Jain <vaibhav@linux.vnet.ibm.com>, dan.j.williams@intel.com
References: <20190514025449.9416-1-aneesh.kumar@linux.ibm.com>
 <875zq9m8zx.fsf@vajain21.in.ibm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Fri, 17 May 2019 20:47:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <875zq9m8zx.fsf@vajain21.in.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19051715-0012-0000-0000-000017382F49
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011112; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01204664; UDB=6.00632425; IPR=6.00985599; 
 MB=3.00026933; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-17 15:17:52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051715-0013-0000-0000-0000574DF97B
Message-Id: <de5cbe7d-bd47-6793-1f1a-2274c5c59eb5@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-17_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905170093
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/17/19 8:19 PM, Vaibhav Jain wrote:
> Hi Aneesh,
> 
> Apart from a minor review comment for changes to nd_pfn_validate() the
> patch looks good to me.
> 
> Also, I Tested this patch on a PPC64 qemu guest with virtual nvdimm and
> verified that default alignment of newly created devdax namespace was
> 64KiB instead of 16MiB. Below are the test results:
> 
> * Without the patch creating a devdax namespace results in namespace
>    with 16MiB default alignment. Using daxio to zero out the dax device
>    results in a SIGBUS and a hashing failure.
> 
>    $ sudo ndctl create-namespace --mode=devdax  | grep align
>      "align":16777216,
>    "align":16777216
> 
>    $ sudo cat /sys/devices/ndbus0/region0/dax0.0/supported_alignments
>    65536 16777216
> 
>    $ sudo daxio.static-debug  -z -o /dev/dax0.0
>    Bus error (core dumped)
> 
>    $ dmesg | tail
>    [  438.738958] lpar: Failed hash pte insert with error -4
>    [  438.739412] hash-mmu: mm: Hashing failure ! EA=0x7fff17000000 access=0x8000000000000006 current=daxio
>    [  438.739760] hash-mmu:     trap=0x300 vsid=0x22cb7a3 ssize=1 base psize=2 psize 10 pte=0xc000000501002b86
>    [  438.740143] daxio[3860]: bus error (7) at 7fff17000000 nip 7fff973c007c lr 7fff973bff34 code 2 in libpmem.so.1.0.0[7fff973b0000+20000]
>    [  438.740634] daxio[3860]: code: 792945e4 7d494b78 e95f0098 7d494b78 f93f00a0 4800012c e93f0088 f93f0120
>    [  438.741015] daxio[3860]: code: e93f00a0 f93f0128 e93f0120 e95f0128 <f9490000> e93f0088 39290008 f93f0110
> 
> * With the patch creating a devdax namespace results in namespace
>    with 64KiB default alignment. Using daxio to zero out the dax device
>    succeeds:
>    
>    $ sudo ndctl create-namespace --mode=devdax  | grep align
>      "align":65536,
>    "align":65536
> 
>    $ sudo cat /sys/devices/ndbus0/region0/dax0.0/supported_alignments
>    65536
> 
>    $ daxio -z -o /dev/dax0.0
>    daxio: copied 2130706432 bytes to device "/dev/dax0.0"
> 
> Hence,
> 
> Tested-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> 
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> 
>> Allow arch to provide the supported alignments and use hugepage alignment only
>> if we support hugepage. Right now we depend on compile time configs whereas this
>> patch switch this to runtime discovery.
>>
>> Architectures like ppc64 can have THP enabled in code, but then can have
>> hugepage size disabled by the hypervisor. This allows us to create dax devices
>> with PAGE_SIZE alignment in this case.
>>
>> Existing dax namespace with alignment larger than PAGE_SIZE will fail to
>> initialize in this specific case. We still allow fsdax namespace initialization.
>>
>> With respect to identifying whether to enable hugepage fault for a dax device,
>> if THP is enabled during compile, we default to taking hugepage fault and in dax
>> fault handler if we find the fault size > alignment we retry with PAGE_SIZE
>> fault size.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/libnvdimm.h |  9 ++++++++
>>   arch/powerpc/mm/Makefile             |  1 +
>>   arch/powerpc/mm/nvdimm.c             | 34 ++++++++++++++++++++++++++++
>>   arch/x86/include/asm/libnvdimm.h     | 19 ++++++++++++++++
>>   drivers/nvdimm/nd.h                  |  6 -----
>>   drivers/nvdimm/pfn_devs.c            | 32 +++++++++++++++++++++++++-
>>   include/linux/huge_mm.h              |  7 +++++-
>>   7 files changed, 100 insertions(+), 8 deletions(-)
>>   create mode 100644 arch/powerpc/include/asm/libnvdimm.h
>>   create mode 100644 arch/powerpc/mm/nvdimm.c
>>   create mode 100644 arch/x86/include/asm/libnvdimm.h
>>
>> diff --git a/arch/powerpc/include/asm/libnvdimm.h b/arch/powerpc/include/asm/libnvdimm.h
>> new file mode 100644
>> index 000000000000..d35fd7f48603
>> --- /dev/null
>> +++ b/arch/powerpc/include/asm/libnvdimm.h
>> @@ -0,0 +1,9 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _ASM_POWERPC_LIBNVDIMM_H
>> +#define _ASM_POWERPC_LIBNVDIMM_H
>> +
>> +#define nd_pfn_supported_alignments nd_pfn_supported_alignments
>> +extern unsigned long *nd_pfn_supported_alignments(void);
>> +extern unsigned long nd_pfn_default_alignment(void);
>> +
>> +#endif
>> diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
>> index 0f499db315d6..42e4a399ba5d 100644
>> --- a/arch/powerpc/mm/Makefile
>> +++ b/arch/powerpc/mm/Makefile
>> @@ -20,3 +20,4 @@ obj-$(CONFIG_HIGHMEM)		+= highmem.o
>>   obj-$(CONFIG_PPC_COPRO_BASE)	+= copro_fault.o
>>   obj-$(CONFIG_PPC_PTDUMP)	+= ptdump/
>>   obj-$(CONFIG_KASAN)		+= kasan/
>> +obj-$(CONFIG_NVDIMM_PFN)		+= nvdimm.o
>> diff --git a/arch/powerpc/mm/nvdimm.c b/arch/powerpc/mm/nvdimm.c
>> new file mode 100644
>> index 000000000000..a29a4510715e
>> --- /dev/null
>> +++ b/arch/powerpc/mm/nvdimm.c
>> @@ -0,0 +1,34 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include <asm/pgtable.h>
>> +#include <asm/page.h>
>> +
>> +#include <linux/mm.h>
>> +/*
>> + * We support only pte and pmd mappings for now.
>> + */
>> +const unsigned long *nd_pfn_supported_alignments(void)
>> +{
>> +	static unsigned long supported_alignments[3];
>> +
>> +	supported_alignments[0] = PAGE_SIZE;
>> +
>> +	if (has_transparent_hugepage())
>> +		supported_alignments[1] = HPAGE_PMD_SIZE;
>> +	else
>> +		supported_alignments[1] = 0;
>> +
>> +	supported_alignments[2] = 0;
>> +	return supported_alignments;
>> +}
>> +
>> +/*
>> + * Use pmd mapping if supported as default alignment
>> + */
>> +unsigned long nd_pfn_default_alignment(void)
>> +{
>> +
>> +	if (has_transparent_hugepage())
>> +		return HPAGE_PMD_SIZE;
>> +	return PAGE_SIZE;
>> +}
>> diff --git a/arch/x86/include/asm/libnvdimm.h b/arch/x86/include/asm/libnvdimm.h
>> new file mode 100644
>> index 000000000000..3d5361db9164
>> --- /dev/null
>> +++ b/arch/x86/include/asm/libnvdimm.h
>> @@ -0,0 +1,19 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _ASM_X86_LIBNVDIMM_H
>> +#define _ASM_X86_LIBNVDIMM_H
>> +
>> +static inline unsigned long nd_pfn_default_alignment(void)
>> +{
>> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>> +	return HPAGE_PMD_SIZE;
>> +#else
>> +	return PAGE_SIZE;
>> +#endif
>> +}
>> +
>> +static inline unsigned long nd_altmap_align_size(unsigned long nd_align)
>> +{
>> +	return PMD_SIZE;
>> +}
>> +
>> +#endif
>> diff --git a/drivers/nvdimm/nd.h b/drivers/nvdimm/nd.h
>> index a5ac3b240293..44fe923b2ee3 100644
>> --- a/drivers/nvdimm/nd.h
>> +++ b/drivers/nvdimm/nd.h
>> @@ -292,12 +292,6 @@ static inline struct device *nd_btt_create(struct nd_region *nd_region)
>>   struct nd_pfn *to_nd_pfn(struct device *dev);
>>   #if IS_ENABLED(CONFIG_NVDIMM_PFN)
>>
>> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>> -#define PFN_DEFAULT_ALIGNMENT HPAGE_PMD_SIZE
>> -#else
>> -#define PFN_DEFAULT_ALIGNMENT PAGE_SIZE
>> -#endif
>> -
>>   int nd_pfn_probe(struct device *dev, struct nd_namespace_common *ndns);
>>   bool is_nd_pfn(struct device *dev);
>>   struct device *nd_pfn_create(struct nd_region *nd_region);
>> diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
>> index 01f40672507f..347cab166376 100644
>> --- a/drivers/nvdimm/pfn_devs.c
>> +++ b/drivers/nvdimm/pfn_devs.c
>> @@ -18,6 +18,7 @@
>>   #include <linux/slab.h>
>>   #include <linux/fs.h>
>>   #include <linux/mm.h>
>> +#include <asm/libnvdimm.h>
>>   #include "nd-core.h"
>>   #include "pfn.h"
>>   #include "nd.h"
>> @@ -111,6 +112,8 @@ static ssize_t align_show(struct device *dev,
>>   	return sprintf(buf, "%ld\n", nd_pfn->align);
>>   }
>>
>> +#ifndef nd_pfn_supported_alignments
>> +#define nd_pfn_supported_alignments nd_pfn_supported_alignments
>>   static const unsigned long *nd_pfn_supported_alignments(void)
>>   {
>>   	/*
>> @@ -133,6 +136,7 @@ static const unsigned long *nd_pfn_supported_alignments(void)
>>
>>   	return data;
>>   }
>> +#endif
>>
>>   static ssize_t align_store(struct device *dev,
>>   		struct device_attribute *attr, const char *buf, size_t len)
>> @@ -310,7 +314,7 @@ struct device *nd_pfn_devinit(struct nd_pfn *nd_pfn,
>>   		return NULL;
>>
>>   	nd_pfn->mode = PFN_MODE_NONE;
>> -	nd_pfn->align = PFN_DEFAULT_ALIGNMENT;
>> +	nd_pfn->align = nd_pfn_default_alignment();
>>   	dev = &nd_pfn->dev;
>>   	device_initialize(&nd_pfn->dev);
>>   	if (ndns && !__nd_attach_ndns(&nd_pfn->dev, ndns, &nd_pfn->ndns)) {
>> @@ -420,6 +424,20 @@ static int nd_pfn_clear_memmap_errors(struct nd_pfn *nd_pfn)
>>   	return 0;
>>   }
>>
>> +static bool nd_supported_alignment(unsigned long align)
>> +{
>> +	int i;
>> +	const unsigned long *supported = nd_pfn_supported_alignments();
>> +
>> +	if (align == 0)
>> +		return false;
>> +
>> +	for (i = 0; supported[i]; i++)
>> +		if (align == supported[i])
>> +			return true;
>> +	return false;
>> +}
>> +
>>   int nd_pfn_validate(struct nd_pfn *nd_pfn, const char *sig)
>>   {
>>   	u64 checksum, offset;
>> @@ -474,6 +492,18 @@ int nd_pfn_validate(struct nd_pfn *nd_pfn, const char *sig)
>>   		align = 1UL << ilog2(offset);
>>   	mode = le32_to_cpu(pfn_sb->mode);
>>
>> +	/*
>> +	 * Check whether the we support the alignment. For Dax if the
>> +	 * superblock alignment is not matching, we won't initialize
>> +	 * the device.
>> +	 */
>> +	if (!nd_supported_alignment(align) &&
>> +	    memcmp(pfn_sb->signature, DAX_SIG, PFN_SIG_LEN)) {
> Suggestion to change this check to:
> 
> if (memcmp(pfn_sb->signature, DAX_SIG, PFN_SIG_LEN) &&
>     !nd_supported_alignment(align))
> 
> It would look  a bit more natural i.e. "If the device has dax signature and alignment is
> not supported".
> 

I guess that should be !memcmp()? . I will send an updated patch with 
the hash failure details in the commit message.

-aneesh

