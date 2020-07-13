Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EF021E178
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 22:32:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5Fh53vM7zDqXq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 06:32:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=prsriva@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=HKGa5xri; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4B5FfK1fN3zDqXY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 06:31:04 +1000 (AEST)
Received: from [10.0.0.249] (c-24-19-135-168.hsd1.wa.comcast.net
 [24.19.135.168])
 by linux.microsoft.com (Postfix) with ESMTPSA id 3468820B4908;
 Mon, 13 Jul 2020 13:31:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3468820B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1594672261;
 bh=/alYulr7TfHdtnQcnR5ksYNOj4rEKwjLZlm8tyeN/ig=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=HKGa5xriPaJtfUMOGKAdDEmNm530YOlnYSEACRiZ3qek6FvrL/gO2JzOlCjjVpaES
 wr6E6LV/9mSxj+YP7UlkZ8qn3zs9VPhh9ADbVFJKR8LajLESGVLVlMgtnguuVmFup0
 Kmtw0sgUMtC7d96W9/rPiy8/xnK4YEXPkWFcs8aE=
Subject: Re: [V2 PATCH 1/3] Refactoring powerpc code for carrying over IMA
 measurement logs, to move non architecture specific code to security/ima.
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
References: <20200618071045.471131-1-prsriva@linux.microsoft.com>
 <20200618071045.471131-2-prsriva@linux.microsoft.com>
 <87o8per3m0.fsf@morokweng.localdomain>
From: Prakhar Srivastava <prsriva@linux.microsoft.com>
Message-ID: <1385c8bb-cd25-8dc4-7224-8e27135f3356@linux.microsoft.com>
Date: Mon, 13 Jul 2020 13:30:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87o8per3m0.fsf@morokweng.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 6/19/20 5:19 PM, Thiago Jung Bauermann wrote:
> 
> Prakhar Srivastava <prsriva@linux.microsoft.com> writes:
> 
>> Powerpc has support to carry over the IMA measurement logs. Refatoring the
>> non-architecture specific code out of arch/powerpc and into security/ima.
>>
>> The code adds support for reserving and freeing up of memory for IMA measurement
>> logs.
> 
> Last week, Mimi provided this feedback:
> 
> "From your patch description, this patch should be broken up.  Moving
> the non-architecture specific code out of powerpc should be one patch.
>   Additional support should be in another patch.  After each patch, the
> code should work properly."
> 
> That's not what you do here. You move the code, but you also make other
> changes at the same time. This has two problems:
> 
> 1. It makes the patch harder to review, because it's very easy to miss a
>     change.
> 
> 2. If in the future a git bisect later points to this patch, it's not
>     clear whether the problem is because of the code movement, or because
>     of the other changes.
> 
> When you move code, ideally the patch should only make the changes
> necessary to make the code work at its new location. The patch which
> does code movement should not cause any change in behavior.
> 
> Other changes should go in separate patches, either before or after the
> one moving the code.
> 
> More comments below.
> 
Hi Thiago,

Apologies for the delayed response i was away for a few days.
I am working on breaking up the changes so that its easier to review and 
update as well.

Thanks,
Prakhar Srivastava

>>
>> ---
>>   arch/powerpc/include/asm/ima.h     |  10 ---
>>   arch/powerpc/kexec/ima.c           | 126 ++---------------------------
>>   security/integrity/ima/ima_kexec.c | 116 ++++++++++++++++++++++++++
>>   3 files changed, 124 insertions(+), 128 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/ima.h b/arch/powerpc/include/asm/ima.h
>> index ead488cf3981..c29ec86498f8 100644
>> --- a/arch/powerpc/include/asm/ima.h
>> +++ b/arch/powerpc/include/asm/ima.h
>> @@ -4,15 +4,6 @@
>>
>>   struct kimage;
>>
>> -int ima_get_kexec_buffer(void **addr, size_t *size);
>> -int ima_free_kexec_buffer(void);
>> -
>> -#ifdef CONFIG_IMA
>> -void remove_ima_buffer(void *fdt, int chosen_node);
>> -#else
>> -static inline void remove_ima_buffer(void *fdt, int chosen_node) {}
>> -#endif
>> -
>>   #ifdef CONFIG_IMA_KEXEC
>>   int arch_ima_add_kexec_buffer(struct kimage *image, unsigned long load_addr,
>>   			      size_t size);
>> @@ -22,7 +13,6 @@ int setup_ima_buffer(const struct kimage *image, void *fdt, int chosen_node);
>>   static inline int setup_ima_buffer(const struct kimage *image, void *fdt,
>>   				   int chosen_node)
>>   {
>> -	remove_ima_buffer(fdt, chosen_node);
>>   	return 0;
>>   }
> 
> This is wrong. Even if the currently running kernel doesn't have
> CONFIG_IMA_KEXEC, it should remove the IMA buffer property and memory
> reservation from the FDT that is being prepared for the next kernel.
> 
> This is because the IMA kexec buffer is useless for the next kernel,
> regardless of whether the current kernel supports CONFIG_IMA_KEXEC or
> not. Keeping it around would be a waste of memory.
> 
I will keep it in my next revision.
My understanding was the reserved memory is freed and property removed 
when IMA loads the logs on init. During setup_fdt in kexec, a duplicate 
copy of the dt is used, but memory still needs to be allocated, thus the 
property itself indicats presence of reserved memory.


>> @@ -179,13 +64,18 @@ int setup_ima_buffer(const struct kimage *image, void *fdt, int chosen_node)
>>   	int ret, addr_cells, size_cells, entry_size;
>>   	u8 value[16];
>>
>> -	remove_ima_buffer(fdt, chosen_node);
> 
> This is wrong, for the same reason stated above.
> 
>>   	if (!image->arch.ima_buffer_size)
>>   		return 0;
>>
>> -	ret = get_addr_size_cells(&addr_cells, &size_cells);
>> -	if (ret)
>> +	ret = fdt_address_cells(fdt, chosen_node);
>> +	if (ret < 0)
>> +		return ret;
>> +	addr_cells = ret;
>> +
>> +	ret = fdt_size_cells(fdt, chosen_node);
>> +	if (ret < 0)
>>   		return ret;
>> +	size_cells = ret;
>>
>>   	entry_size = 4 * (addr_cells + size_cells);
>>
> 
> I liked this change. Thanks! I agree it's better to use
> fdt_address_cells() and fdt_size_cells() here.
> 
> But it should be in a separate patch. Either before or after the one
> moving the code.
> 
>> diff --git a/security/integrity/ima/ima_kexec.c b/security/integrity/ima/ima_kexec.c
>> index 121de3e04af2..e1e6d6154015 100644
>> --- a/security/integrity/ima/ima_kexec.c
>> +++ b/security/integrity/ima/ima_kexec.c
>> @@ -10,8 +10,124 @@
>>   #include <linux/seq_file.h>
>>   #include <linux/vmalloc.h>
>>   #include <linux/kexec.h>
>> +#include <linux/of.h>
>> +#include <linux/memblock.h>
>> +#include <linux/libfdt.h>
>>   #include "ima.h"
>>
>> +static int get_addr_size_cells(int *addr_cells, int *size_cells)
>> +{
>> +	struct device_node *root;
>> +
>> +	root = of_find_node_by_path("/");
>> +	if (!root)
>> +		return -EINVAL;
>> +
>> +	*addr_cells = of_n_addr_cells(root);
>> +	*size_cells = of_n_size_cells(root);
>> +
>> +	of_node_put(root);
>> +
>> +	return 0;
>> +}
>> +
>> +static int do_get_kexec_buffer(const void *prop, int len, unsigned long *addr,
>> +			       size_t *size)
>> +{
>> +	int ret, addr_cells, size_cells;
>> +
>> +	ret = get_addr_size_cells(&addr_cells, &size_cells);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (len < 4 * (addr_cells + size_cells))
>> +		return -ENOENT;
>> +
>> +	*addr = of_read_number(prop, addr_cells);
>> +	*size = of_read_number(prop + 4 * addr_cells, size_cells);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * ima_get_kexec_buffer - get IMA buffer from the previous kernel
>> + * @addr:	On successful return, set to point to the buffer contents.
>> + * @size:	On successful return, set to the buffer size.
>> + *
>> + * Return: 0 on success, negative errno on error.
>> + */
>> +int ima_get_kexec_buffer(void **addr, size_t *size)
>> +{
>> +	int ret, len;
>> +	unsigned long tmp_addr;
>> +	size_t tmp_size;
>> +	const void *prop;
>> +
>> +	prop = of_get_property(of_chosen, "linux,ima-kexec-buffer", &len);
>> +	if (!prop)
>> +		return -ENOENT;
>> +
>> +	ret = do_get_kexec_buffer(prop, len, &tmp_addr, &tmp_size);
>> +	if (ret)
>> +		return ret;
>> +
>> +	*addr = __va(tmp_addr);
>> +	*size = tmp_size;
>> +
>> +	return 0;
>> +}
> 
> The functions above were moved without being changed. Good.
> 
>> +/**
>> + * ima_free_kexec_buffer - free memory used by the IMA buffer
>> + */
>> +int ima_free_kexec_buffer(void)
>> +{
>> +	int ret;
>> +	unsigned long addr;
>> +	size_t size;
>> +	struct property *prop;
>> +
>> +	prop = of_find_property(of_chosen, "linux,ima-kexec-buffer", NULL);
>> +	if (!prop)
>> +		return -ENOENT;
>> +
>> +	ret = do_get_kexec_buffer(prop->value, prop->length, &addr, &size);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = of_remove_property(of_chosen, prop);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return memblock_free(__pa(addr), size);
> 
> Here you added a __pa() call. Do you store a virtual address in
> linux,ima-kexec-buffer property? Doesn't it make more sense to store a
> physical address?
> 
trying to minimize the changes here as do_get_kexec_buffer return the va.
I will refactor this to remove the double translation.

> Even if making this change is the correct thing to do, it should be a
> separate patch, unless it can't be avoided. And if that is the case,
> then it should be explained in the commit message.
> 
>> +
>> +}
>> +
>> +/**
>> + * remove_ima_buffer - remove the IMA buffer property and reservation from @fdt
>> + *
>> + * The IMA measurement buffer is of no use to a subsequent kernel, so we always
>> + * remove it from the device tree.
>> + */
>> +void remove_ima_buffer(void *fdt, int chosen_node)
>> +{
>> +	int ret, len;
>> +	unsigned long addr;
>> +	size_t size;
>> +	const void *prop;
>> +
>> +	prop = fdt_getprop(fdt, chosen_node, "linux,ima-kexec-buffer", &len);
>> +	if (!prop)
>> +		return;
>> +
>> +	do_get_kexec_buffer(prop, len, &addr, &size);
>> +	ret = fdt_delprop(fdt, chosen_node, "linux,ima-kexec-buffer");
>> +	if (ret < 0)
>> +		return;
>> +
>> +	memblock_free(addr, size);
>> +}
> 
> Here is another function that changed when moved. This one I know to be
> wrong. You're confusing the purposes of remove_ima_buffer() and
> ima_free_kexec_buffer().
> 
> You did send me a question about them nearly three weeks ago which I
> only answered today, so I apologize. Also, their names could more
> clearly reflect their differences, so it's bad naming on my part.
> 
> With IMA kexec buffers, there are two kernels (and thus their two
> respective, separate device trees) to be concerned about:
> 
> 1. the currently running kernel, which uses the live device tree
> (accessed with the of_* functions) and the memblock subsystem;
> 
> 2. the kernel which is being loaded by kexec, which will use the FDT
> blob being passed around as argument to these functions, and the memory
> reservations in the memory reservation table of the FDT blob.
> 
> ima_free_kexec_buffer() is used by IMA in the currently running kernel.
> Therefore the device tree it is concerned about is the live one, and
> thus uses the of_* functions to access it. And uses memblock to change
> the memory reservation.
> 
> remove_ima_buffer() on the other hand is used by the kexec code to
> prepare an FDT blob for the kernel that is being loaded. It should not
> make any changes to live device tree, nor to memblock allocations. It
> should only make changes to the FDT blob.
> 
Thank you for this, greatly appreciate clearing my misunderstandings.
> --
> Thiago Jung Bauermann
> IBM Linux Technology Center
> 
