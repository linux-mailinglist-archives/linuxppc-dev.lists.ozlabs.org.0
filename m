Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2677D824051
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jan 2024 12:08:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T5P3N5yDDz3cDT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jan 2024 22:08:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ghiti.fr (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T5P2w3nj7z3byh
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jan 2024 22:08:24 +1100 (AEDT)
Received: from relay2-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::222])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 8A4E4C3F30
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jan 2024 11:08:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A524C40009;
	Thu,  4 Jan 2024 11:07:51 +0000 (UTC)
Message-ID: <752c11ea-7172-40ff-a821-c78aeb6c5518@ghiti.fr>
Date: Thu, 4 Jan 2024 12:07:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: KVM: Require HAVE_KVM
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
References: <20240104104307.16019-2-ajones@ventanamicro.com>
 <20240104-d5ebb072b91a6f7abbb2ac76@orel>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240104-d5ebb072b91a6f7abbb2ac76@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: alex@ghiti.fr
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
Cc: sfr@canb.auug.org.au, aou@eecs.berkeley.edu, anup@brainfault.org, rdunlap@infradead.org, npiggin@gmail.com, palmer@dabbelt.com, paul.walmsley@sifive.com, atishp@atishpatra.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04/01/2024 11:52, Andrew Jones wrote:
> This applies to linux-next, but I forgot to append -next to the PATCH
> prefix.


Shoudn't this go to -fixes instead? With a Fixes tag?


>
> On Thu, Jan 04, 2024 at 11:43:08AM +0100, Andrew Jones wrote:
>> KVM requires EVENTFD, which is selected by HAVE_KVM. Other KVM
>> supporting architectures select HAVE_KVM and then their KVM
>> Kconfigs ensure its there with a depends on HAVE_KVM. Make RISCV
>> consistent with that approach which fixes configs which have KVM
>> but not EVENTFD, as was discovered with a randconfig test.
>>
>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>> Closes: https://lore.kernel.org/all/44907c6b-c5bd-4e4a-a921-e4d3825539d8@infradead.org/
> I think powerpc may need a patch like this as well, since I don't see
> anything ensuring EVENTFD is selected for it anymore either.
>
> Thanks,
> drew
>
>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
>> ---
>>   arch/riscv/Kconfig     | 1 +
>>   arch/riscv/kvm/Kconfig | 2 +-
>>   2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index a935a5f736b9..daba06a3b76f 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -128,6 +128,7 @@ config RISCV
>>   	select HAVE_KPROBES if !XIP_KERNEL
>>   	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
>>   	select HAVE_KRETPROBES if !XIP_KERNEL
>> +	select HAVE_KVM
>>   	# https://github.com/ClangBuiltLinux/linux/issues/1881
>>   	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
>>   	select HAVE_MOVE_PMD
>> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
>> index 1fd76aee3b71..36fa8ec9e5ba 100644
>> --- a/arch/riscv/kvm/Kconfig
>> +++ b/arch/riscv/kvm/Kconfig
>> @@ -19,7 +19,7 @@ if VIRTUALIZATION
>>   
>>   config KVM
>>   	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
>> -	depends on RISCV_SBI && MMU
>> +	depends on HAVE_KVM && RISCV_SBI && MMU
>>   	select HAVE_KVM_IRQCHIP
>>   	select HAVE_KVM_IRQ_ROUTING
>>   	select HAVE_KVM_MSI
>> -- 
>> 2.43.0
>>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
