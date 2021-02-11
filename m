Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B9931832A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 02:52:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbflL53GnzDskT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 12:52:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=Jfm5/BTa; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Dbfj73Y0czDwkT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 12:50:35 +1100 (AEDT)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id AB9BA20B6C40;
 Wed, 10 Feb 2021 17:50:31 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AB9BA20B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1613008232;
 bh=vcDxofWnoZw2pmIkFjZcnPLsVS9ccFRA9624EzZW0Z4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Jfm5/BTa85WR6oMiaWJvCSPxwUcGCAbuGohT+l3IsPTLA0/XHJ9XTPrOZ9ouHIiEn
 fqMpr9/Du8pfJ11CBk69Rk/PIDFQQKzbLdevzANiI8pZIB2iCscYOSnEIt73KQIVbd
 0zuc7MvncowulwiTCJHU9W16aZDwG3j99W7njgeU=
Subject: Re: [PATCH v17 04/10] powerpc: Use common
 of_kexec_alloc_and_setup_fdt()
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
References: <20210209182200.30606-1-nramas@linux.microsoft.com>
 <20210209182200.30606-5-nramas@linux.microsoft.com>
 <87sg63nzwc.fsf@manicouagan.localdomain>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <ec6a2a36-bb4d-45b1-9dfb-eba3e01e0d2d@linux.microsoft.com>
Date: Wed, 10 Feb 2021 17:50:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87sg63nzwc.fsf@manicouagan.localdomain>
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
Cc: mark.rutland@arm.com, tao.li@vivo.com, zohar@linux.ibm.com,
 paulus@samba.org, vincenzo.frascino@arm.com, frowand.list@gmail.com,
 sashal@kernel.org, robh@kernel.org, masahiroy@kernel.org, jmorris@namei.org,
 takahiro.akashi@linaro.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, serge@hallyn.com, devicetree@vger.kernel.org,
 pasha.tatashin@soleen.com, will@kernel.org, prsriva@linux.microsoft.com,
 hsinyi@chromium.org, allison@lohutok.net, christophe.leroy@c-s.fr,
 mbrugger@suse.com, balajib@linux.microsoft.com, dmitry.kasatkin@gmail.com,
 linux-kernel@vger.kernel.org, james.morse@arm.com, gregkh@linuxfoundation.org,
 joe@perches.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/10/21 5:42 PM, Thiago Jung Bauermann wrote:
> 
> Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:
> 
>> From: Rob Herring <robh@kernel.org>
>>
>> The code for setting up the /chosen node in the device tree
>> and updating the memory reservation for the next kernel has been
>> moved to of_kexec_alloc_and_setup_fdt() defined in "drivers/of/kexec.c".
>>
>> Use the common of_kexec_alloc_and_setup_fdt() to setup the device tree
>> and update the memory reservation for kexec for powerpc.
>>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>> ---
>>   arch/powerpc/include/asm/kexec.h  |   1 +
>>   arch/powerpc/kexec/elf_64.c       |  29 ++++---
>>   arch/powerpc/kexec/file_load.c    | 132 +-----------------------------
>>   arch/powerpc/kexec/file_load_64.c |   3 +
>>   4 files changed, 25 insertions(+), 140 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
>> index dbf09d2f36d0..bdd0ddb9ac4d 100644
>> --- a/arch/powerpc/include/asm/kexec.h
>> +++ b/arch/powerpc/include/asm/kexec.h
>> @@ -111,6 +111,7 @@ struct kimage_arch {
>>   	unsigned long elf_headers_mem;
>>   	unsigned long elf_headers_sz;
>>   	void *elf_headers;
>> +	void *fdt;
>>   
>>   #ifdef CONFIG_IMA_KEXEC
>>   	phys_addr_t ima_buffer_addr;
>> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
>> index d0e459bb2f05..bfabd06f99b1 100644
>> --- a/arch/powerpc/kexec/elf_64.c
>> +++ b/arch/powerpc/kexec/elf_64.c
>> @@ -19,6 +19,7 @@
>>   #include <linux/kexec.h>
>>   #include <linux/libfdt.h>
>>   #include <linux/module.h>
>> +#include <linux/of.h>
>>   #include <linux/of_fdt.h>
>>   #include <linux/slab.h>
>>   #include <linux/types.h>
>> @@ -29,7 +30,6 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>>   			unsigned long cmdline_len)
>>   {
>>   	int ret;
>> -	unsigned int fdt_size;
>>   	unsigned long kernel_load_addr;
>>   	unsigned long initrd_load_addr = 0, fdt_load_addr;
>>   	void *fdt;
>> @@ -102,19 +102,13 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>>   		pr_debug("Loaded initrd at 0x%lx\n", initrd_load_addr);
>>   	}
>>   
>> -	fdt_size = fdt_totalsize(initial_boot_params) * 2;
>> -	fdt = kmalloc(fdt_size, GFP_KERNEL);
>> +	fdt = of_kexec_alloc_and_setup_fdt(image, initrd_load_addr,
>> +					   initrd_len, cmdline);
>>   	if (!fdt) {
>>   		pr_err("Not enough memory for the device tree.\n");
> 
> This error string can be a bit misleading now, since
> of_kexec_alloc_and_setup_fdt() can fail for reasons other than lack of
> memory. I suggest changing it to the error string from fdt_open_into()
> below:
> 
> 		pr_err("Error setting up the new device tree.\n");
> 
> With this change:
Agreed - I will make this change.

> 
> Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> 
> And also:
> 
> Tested-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> 

Thanks a lot for your help Thiago.

  -lakshmi

