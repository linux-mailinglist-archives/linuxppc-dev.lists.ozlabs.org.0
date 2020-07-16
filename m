Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D47222A7D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 19:53:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B721Z5n0kzDqsq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 03:53:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B71zZ5l6wzDqJl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 03:52:10 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06GHUn94090213; Thu, 16 Jul 2020 13:51:40 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 329r213dxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 13:51:40 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06GHUqo3090481;
 Thu, 16 Jul 2020 13:51:39 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 329r213dx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 13:51:39 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06GHoZEX009663;
 Thu, 16 Jul 2020 17:51:37 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 328ux7q581-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 17:51:37 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06GHpaWu52101480
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jul 2020 17:51:36 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 455A7BE053;
 Thu, 16 Jul 2020 17:51:36 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 589D3BE04F;
 Thu, 16 Jul 2020 17:51:28 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.8.110])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 16 Jul 2020 17:51:28 +0000 (GMT)
References: <20200618071045.471131-1-prsriva@linux.microsoft.com>
 <20200618071045.471131-2-prsriva@linux.microsoft.com>
 <87o8per3m0.fsf@morokweng.localdomain>
 <1385c8bb-cd25-8dc4-7224-8e27135f3356@linux.microsoft.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Prakhar Srivastava <prsriva@linux.microsoft.com>
Subject: Re: [V2 PATCH 1/3] Refactoring powerpc code for carrying over IMA
 measurement logs, to move non architecture specific code to security/ima.
In-reply-to: <1385c8bb-cd25-8dc4-7224-8e27135f3356@linux.microsoft.com>
Date: Thu, 16 Jul 2020 14:51:24 -0300
Message-ID: <87blkfcpr7.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-16_07:2020-07-16,
 2020-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 lowpriorityscore=0
 bulkscore=0 adultscore=0 spamscore=100 mlxscore=100 phishscore=0
 malwarescore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 mlxlogscore=-1000 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007160125
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
Cc: kstewart@linuxfoundation.org, mark.rutland@arm.com,
 gregkh@linuxfoundation.org, bhsharma@redhat.com, tao.li@vivo.com,
 zohar@linux.ibm.com, paulus@samba.org, vincenzo.frascino@arm.com,
 will@kernel.org, nramas@linux.microsoft.com, frowand.list@gmail.com,
 masahiroy@kernel.org, jmorris@namei.org, takahiro.akashi@linaro.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 serge@hallyn.com, devicetree@vger.kernel.org, pasha.tatashin@soleen.com,
 robh+dt@kernel.org, hsinyi@chromium.org, tusharsu@linux.microsoft.com,
 tglx@linutronix.de, allison@lohutok.net, christophe.leroy@c-s.fr,
 mbrugger@suse.com, balajib@linux.microsoft.com, dmitry.kasatkin@gmail.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 james.morse@arm.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hello Prakhar,

Prakhar Srivastava <prsriva@linux.microsoft.com> writes:

> On 6/19/20 5:19 PM, Thiago Jung Bauermann wrote:
>>
>> Prakhar Srivastava <prsriva@linux.microsoft.com> writes:
>>
>>> Powerpc has support to carry over the IMA measurement logs. Refatoring the
>>> non-architecture specific code out of arch/powerpc and into security/ima.
>>>
>>> The code adds support for reserving and freeing up of memory for IMA measurement
>>> logs.
>>
>> Last week, Mimi provided this feedback:
>>
>> "From your patch description, this patch should be broken up.  Moving
>> the non-architecture specific code out of powerpc should be one patch.
>>   Additional support should be in another patch.  After each patch, the
>> code should work properly."
>>
>> That's not what you do here. You move the code, but you also make other
>> changes at the same time. This has two problems:
>>
>> 1. It makes the patch harder to review, because it's very easy to miss a
>>     change.
>>
>> 2. If in the future a git bisect later points to this patch, it's not
>>     clear whether the problem is because of the code movement, or because
>>     of the other changes.
>>
>> When you move code, ideally the patch should only make the changes
>> necessary to make the code work at its new location. The patch which
>> does code movement should not cause any change in behavior.
>>
>> Other changes should go in separate patches, either before or after the
>> one moving the code.
>>
>> More comments below.
>>
> Hi Thiago,
>
> Apologies for the delayed response i was away for a few days.
> I am working on breaking up the changes so that its easier to review and update
> as well.

No problem.

>
> Thanks,
> Prakhar Srivastava
>
>>>
>>> ---
>>>   arch/powerpc/include/asm/ima.h     |  10 ---
>>>   arch/powerpc/kexec/ima.c           | 126 ++---------------------------
>>>   security/integrity/ima/ima_kexec.c | 116 ++++++++++++++++++++++++++
>>>   3 files changed, 124 insertions(+), 128 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/ima.h b/arch/powerpc/include/asm/ima.h
>>> index ead488cf3981..c29ec86498f8 100644
>>> --- a/arch/powerpc/include/asm/ima.h
>>> +++ b/arch/powerpc/include/asm/ima.h
>>> @@ -4,15 +4,6 @@
>>>
>>>   struct kimage;
>>>
>>> -int ima_get_kexec_buffer(void **addr, size_t *size);
>>> -int ima_free_kexec_buffer(void);
>>> -
>>> -#ifdef CONFIG_IMA
>>> -void remove_ima_buffer(void *fdt, int chosen_node);
>>> -#else
>>> -static inline void remove_ima_buffer(void *fdt, int chosen_node) {}
>>> -#endif
>>> -
>>>   #ifdef CONFIG_IMA_KEXEC
>>>   int arch_ima_add_kexec_buffer(struct kimage *image, unsigned long load_addr,
>>>   			      size_t size);
>>> @@ -22,7 +13,6 @@ int setup_ima_buffer(const struct kimage *image, void *fdt, int chosen_node);
>>>   static inline int setup_ima_buffer(const struct kimage *image, void *fdt,
>>>   				   int chosen_node)
>>>   {
>>> -	remove_ima_buffer(fdt, chosen_node);
>>>   	return 0;
>>>   }
>>
>> This is wrong. Even if the currently running kernel doesn't have
>> CONFIG_IMA_KEXEC, it should remove the IMA buffer property and memory
>> reservation from the FDT that is being prepared for the next kernel.
>>
>> This is because the IMA kexec buffer is useless for the next kernel,
>> regardless of whether the current kernel supports CONFIG_IMA_KEXEC or
>> not. Keeping it around would be a waste of memory.
>>
> I will keep it in my next revision.
> My understanding was the reserved memory is freed and property removed when IMA
> loads the logs on init.

If CONFIG_IMA_KEXEC is set, then yes. If it isn't then that needs to
happen in the function above.

> During setup_fdt in kexec, a duplicate copy of the dt is
> used, but memory still needs to be allocated, thus the property itself indicats
> presence of reserved memory.
> 
>>> @@ -179,13 +64,18 @@ int setup_ima_buffer(const struct kimage *image, void *fdt, int chosen_node)
>>>   	int ret, addr_cells, size_cells, entry_size;
>>>   	u8 value[16];
>>>
>>> -	remove_ima_buffer(fdt, chosen_node);
>>
>> This is wrong, for the same reason stated above.
>>
>>>   	if (!image->arch.ima_buffer_size)
>>>   		return 0;
>>>
>>> -	ret = get_addr_size_cells(&addr_cells, &size_cells);
>>> -	if (ret)
>>> +	ret = fdt_address_cells(fdt, chosen_node);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +	addr_cells = ret;
>>> +
>>> +	ret = fdt_size_cells(fdt, chosen_node);
>>> +	if (ret < 0)
>>>   		return ret;
>>> +	size_cells = ret;
>>>
>>>   	entry_size = 4 * (addr_cells + size_cells);
>>>
>>
>> I liked this change. Thanks! I agree it's better to use
>> fdt_address_cells() and fdt_size_cells() here.
>>
>> But it should be in a separate patch. Either before or after the one
>> moving the code.
>>
>>> diff --git a/security/integrity/ima/ima_kexec.c b/security/integrity/ima/ima_kexec.c
>>> index 121de3e04af2..e1e6d6154015 100644
>>> --- a/security/integrity/ima/ima_kexec.c
>>> +++ b/security/integrity/ima/ima_kexec.c
>>> @@ -10,8 +10,124 @@
>>>   #include <linux/seq_file.h>
>>>   #include <linux/vmalloc.h>
>>>   #include <linux/kexec.h>
>>> +#include <linux/of.h>
>>> +#include <linux/memblock.h>
>>> +#include <linux/libfdt.h>
>>>   #include "ima.h"
>>>
>>> +static int get_addr_size_cells(int *addr_cells, int *size_cells)
>>> +{
>>> +	struct device_node *root;
>>> +
>>> +	root = of_find_node_by_path("/");
>>> +	if (!root)
>>> +		return -EINVAL;
>>> +
>>> +	*addr_cells = of_n_addr_cells(root);
>>> +	*size_cells = of_n_size_cells(root);
>>> +
>>> +	of_node_put(root);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int do_get_kexec_buffer(const void *prop, int len, unsigned long *addr,
>>> +			       size_t *size)
>>> +{
>>> +	int ret, addr_cells, size_cells;
>>> +
>>> +	ret = get_addr_size_cells(&addr_cells, &size_cells);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if (len < 4 * (addr_cells + size_cells))
>>> +		return -ENOENT;
>>> +
>>> +	*addr = of_read_number(prop, addr_cells);
>>> +	*size = of_read_number(prop + 4 * addr_cells, size_cells);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/**
>>> + * ima_get_kexec_buffer - get IMA buffer from the previous kernel
>>> + * @addr:	On successful return, set to point to the buffer contents.
>>> + * @size:	On successful return, set to the buffer size.
>>> + *
>>> + * Return: 0 on success, negative errno on error.
>>> + */
>>> +int ima_get_kexec_buffer(void **addr, size_t *size)
>>> +{
>>> +	int ret, len;
>>> +	unsigned long tmp_addr;
>>> +	size_t tmp_size;
>>> +	const void *prop;
>>> +
>>> +	prop = of_get_property(of_chosen, "linux,ima-kexec-buffer", &len);
>>> +	if (!prop)
>>> +		return -ENOENT;
>>> +
>>> +	ret = do_get_kexec_buffer(prop, len, &tmp_addr, &tmp_size);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	*addr = __va(tmp_addr);
>>> +	*size = tmp_size;
>>> +
>>> +	return 0;
>>> +}
>>
>> The functions above were moved without being changed. Good.
>>
>>> +/**
>>> + * ima_free_kexec_buffer - free memory used by the IMA buffer
>>> + */
>>> +int ima_free_kexec_buffer(void)
>>> +{
>>> +	int ret;
>>> +	unsigned long addr;
>>> +	size_t size;
>>> +	struct property *prop;
>>> +
>>> +	prop = of_find_property(of_chosen, "linux,ima-kexec-buffer", NULL);
>>> +	if (!prop)
>>> +		return -ENOENT;
>>> +
>>> +	ret = do_get_kexec_buffer(prop->value, prop->length, &addr, &size);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = of_remove_property(of_chosen, prop);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	return memblock_free(__pa(addr), size);
>>
>> Here you added a __pa() call. Do you store a virtual address in
>> linux,ima-kexec-buffer property? Doesn't it make more sense to store a
>> physical address?
>>
> trying to minimize the changes here as do_get_kexec_buffer return the va.
> I will refactor this to remove the double translation.

In the powerpc version, do_get_kexec_buffer() returns the pa, and one of
its callers does the va translation. I think that worked well.

>> Even if making this change is the correct thing to do, it should be a
>> separate patch, unless it can't be avoided. And if that is the case,
>> then it should be explained in the commit message.
>>
>>> +
>>> +}
>>> +
>>> +/**
>>> + * remove_ima_buffer - remove the IMA buffer property and reservation from @fdt
>>> + *
>>> + * The IMA measurement buffer is of no use to a subsequent kernel, so we always
>>> + * remove it from the device tree.
>>> + */
>>> +void remove_ima_buffer(void *fdt, int chosen_node)
>>> +{
>>> +	int ret, len;
>>> +	unsigned long addr;
>>> +	size_t size;
>>> +	const void *prop;
>>> +
>>> +	prop = fdt_getprop(fdt, chosen_node, "linux,ima-kexec-buffer", &len);
>>> +	if (!prop)
>>> +		return;
>>> +
>>> +	do_get_kexec_buffer(prop, len, &addr, &size);
>>> +	ret = fdt_delprop(fdt, chosen_node, "linux,ima-kexec-buffer");
>>> +	if (ret < 0)
>>> +		return;
>>> +
>>> +	memblock_free(addr, size);
>>> +}
>>
>> Here is another function that changed when moved. This one I know to be
>> wrong. You're confusing the purposes of remove_ima_buffer() and
>> ima_free_kexec_buffer().
>>
>> You did send me a question about them nearly three weeks ago which I
>> only answered today, so I apologize. Also, their names could more
>> clearly reflect their differences, so it's bad naming on my part.
>>
>> With IMA kexec buffers, there are two kernels (and thus their two
>> respective, separate device trees) to be concerned about:
>>
>> 1. the currently running kernel, which uses the live device tree
>> (accessed with the of_* functions) and the memblock subsystem;
>>
>> 2. the kernel which is being loaded by kexec, which will use the FDT
>> blob being passed around as argument to these functions, and the memory
>> reservations in the memory reservation table of the FDT blob.
>>
>> ima_free_kexec_buffer() is used by IMA in the currently running kernel.
>> Therefore the device tree it is concerned about is the live one, and
>> thus uses the of_* functions to access it. And uses memblock to change
>> the memory reservation.
>>
>> remove_ima_buffer() on the other hand is used by the kexec code to
>> prepare an FDT blob for the kernel that is being loaded. It should not
>> make any changes to live device tree, nor to memblock allocations. It
>> should only make changes to the FDT blob.
>>
> Thank you for this, greatly appreciate clearing my misunderstandings.

You're welcome. Sorry again for not answering your question before you
sent this patch series.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
