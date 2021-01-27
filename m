Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D3B3062E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jan 2021 19:01:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQryn1ZKZzDqTD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 05:01:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=I8l5HtBl; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DQrwF4RH8zDqfv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 04:59:41 +1100 (AEDT)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 8887120B7192;
 Wed, 27 Jan 2021 09:59:38 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8887120B7192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1611770379;
 bh=u6YDtCnPbqCR0gis78ss8Y7oDmOQBhIrTOjdneH59BY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=I8l5HtBlTBedrIQBGerHNcZYLR35V9yPxqkGcZTZfVC0F5ANK7kYqJko9VbWh+e4B
 WyL8zYfK6cVs+7f5JIUpGAoDBqNXBX/k77L3StP9OpEO0arTI6RNBm0OBKhV02U7da
 3QrrsCCB5/Mu3bh4h0E8igoAVJJmAiIbLxoo4p9A=
Subject: Re: [PATCH v15 09/10] arm64: Call kmalloc() to allocate DTB buffer
To: Will Deacon <will@kernel.org>
References: <20210115173017.30617-1-nramas@linux.microsoft.com>
 <20210115173017.30617-10-nramas@linux.microsoft.com>
 <20210127165208.GA358@willie-the-truck>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <d3330793-6054-6e59-b727-44bf8e5653cd@linux.microsoft.com>
Date: Wed, 27 Jan 2021 09:59:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210127165208.GA358@willie-the-truck>
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
Cc: mark.rutland@arm.com, bhsharma@redhat.com, tao.li@vivo.com,
 zohar@linux.ibm.com, paulus@samba.org, vincenzo.frascino@arm.com,
 frowand.list@gmail.com, sashal@kernel.org, robh@kernel.org,
 masahiroy@kernel.org, jmorris@namei.org, takahiro.akashi@linaro.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 serge@hallyn.com, devicetree@vger.kernel.org, pasha.tatashin@soleen.com,
 prsriva@linux.microsoft.com, hsinyi@chromium.org, allison@lohutok.net,
 christophe.leroy@c-s.fr, mbrugger@suse.com, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com, linux-kernel@vger.kernel.org, james.morse@arm.com,
 gregkh@linuxfoundation.org, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/27/21 8:52 AM, Will Deacon wrote:

Hi Will,

> On Fri, Jan 15, 2021 at 09:30:16AM -0800, Lakshmi Ramasubramanian wrote:
>> create_dtb() function allocates kernel virtual memory for
>> the device tree blob (DTB).  This is not consistent with other
>> architectures, such as powerpc, which calls kmalloc() for allocating
>> memory for the DTB.
>>
>> Call kmalloc() to allocate memory for the DTB, and kfree() to free
>> the allocated memory.
>>
>> Co-developed-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
>> Signed-off-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
>> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>> ---
>>   arch/arm64/kernel/machine_kexec_file.c | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
>> index 7de9c47dee7c..51c40143d6fa 100644
>> --- a/arch/arm64/kernel/machine_kexec_file.c
>> +++ b/arch/arm64/kernel/machine_kexec_file.c
>> @@ -29,7 +29,7 @@ const struct kexec_file_ops * const kexec_file_loaders[] = {
>>   
>>   int arch_kimage_file_post_load_cleanup(struct kimage *image)
>>   {
>> -	vfree(image->arch.dtb);
>> +	kfree(image->arch.dtb);
>>   	image->arch.dtb = NULL;
>>   
>>   	vfree(image->arch.elf_headers);
>> @@ -59,19 +59,21 @@ static int create_dtb(struct kimage *image,
>>   			+ cmdline_len + DTB_EXTRA_SPACE;
>>   
>>   	for (;;) {
>> -		buf = vmalloc(buf_size);
>> +		buf = kmalloc(buf_size, GFP_KERNEL);
> 
> Is there a functional need for this patch? I build the 'dtbs' target just
> now and sdm845-db845c.dtb is approaching 100K, which feels quite large
> for kmalloc().

Changing the allocation from vmalloc() to kmalloc() would help us 
further consolidate the DTB setup code for powerpc and arm64.

thanks,
  -lakshmi


