Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CA639EEC9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 08:34:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzgSC29trz306K
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 16:34:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com;
 envelope-from=heying24@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzgRn3hGqz2yjH
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 16:33:38 +1000 (AEST)
Received: from dggeme755-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FzgKw3RSMz1BK3W;
 Tue,  8 Jun 2021 14:28:36 +0800 (CST)
Received: from [10.67.110.136] (10.67.110.136) by
 dggeme755-chm.china.huawei.com (10.3.19.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 8 Jun 2021 14:33:26 +0800
Subject: Re: [PATCH] powerpc: Fix kernel-jump address for ppc64 wrapper boot
To: Oliver O'Halloran <oohall@gmail.com>
References: <20210604092228.199588-1-heying24@huawei.com>
 <CAOSf1CELBh4F334LK6+zy+BPOXKcOm92QZw4g71hQ7oQNa68nw@mail.gmail.com>
From: He Ying <heying24@huawei.com>
Message-ID: <9dc8b323-7846-0975-16f0-6e3e447383a4@huawei.com>
Date: Tue, 8 Jun 2021 14:33:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAOSf1CELBh4F334LK6+zy+BPOXKcOm92QZw4g71hQ7oQNa68nw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.136]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggeme755-chm.china.huawei.com (10.3.19.101)
X-CFilter-Loop: Reflected
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Paul Mackerras <paulus@samba.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

在 2021/6/8 13:26, Oliver O'Halloran 写道:
> On Fri, Jun 4, 2021 at 7:39 PM He Ying <heying24@huawei.com> wrote:
>>  From "64-bit PowerPC ELF Application Binary Interface Supplement 1.9",
>> we know that the value of a function pointer in a language like C is
>> the address of the function descriptor and the first doubleword
>> of the function descriptor contains the address of the entry point
>> of the function.
>>
>> So, when we want to jump to an address (e.g. addr) to execute for
>> PPC-elf64abi, we should assign the address of addr *NOT* addr itself
>> to the function pointer or system will jump to the wrong address.
> How have you tested this?

I tested ppc64-elf big-endian. I changed the Kconfig so that ppc64 
big-endian

selects PPC64_WRAPPER_BOOT. I used qemu to run the cuImage and found

the problem. It made me confused. By applying this patch, I found it works.

I thought it works for ppc64le too. So I upstream this patch.

>
> IIRC the 64bit wrapper is only used for ppc64le builds. For that case
> the current code is work because the LE ABI (ABIv2) doesn't use
> function descriptors. I think even for a BE kernel we need the current
> behaviour because the vmlinux's entry point is screwed up (i.e.
> doesn't point a descriptor) and tools in the wild (probably kexec)
> expect it to be screwed up.

Yes, you're right. PPC64_WRAPPER_BOOT is only used for ppc64le builds 
currently.

LE ABI (ABI v2) doesn't use function descriptors. Is that right? I don't 
test that. If so,

this patch should be dropped. But why does ppc64 have different ABIs? So 
strange.


If the wrapper is built to ppc64be, my patch is tested right. The entry 
point in the ELF

header is always right so you can assign the header->e_entry to the 
function pointer

and then jump to the entry by calling the function. But in the ppc  
wrapper, the address

is intialized to 0 or malloced to be an address later. In this 
situation, I think my patch

should be right for ppc64be.

>
> ABIv2 (LE) reference:
> https://openpowerfoundation.org/?resource_lib=64-bit-elf-v2-abi-specification-power-architecture
> .
