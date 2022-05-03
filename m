Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1C0517B5E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 03:07:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KshdX2dBDz3bs2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 11:07:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=tongtiangen@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kshd251WNz2ymf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 May 2022 11:07:00 +1000 (AEST)
Received: from kwepemi500005.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Kshb26v1KzfbDB;
 Tue,  3 May 2022 09:05:18 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi500005.china.huawei.com (7.221.188.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 3 May 2022 09:06:20 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 3 May 2022 09:06:18 +0800
Message-ID: <48f2779d-bc62-c7f5-c40e-7238a16b90fb@huawei.com>
Date: Tue, 3 May 2022 09:06:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v4 1/7] x86, powerpc: fix function define in
 copy_mc_to_user
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Mark Rutland
 <mark.rutland@arm.com>, James Morse <james.morse@arm.com>, Andrew Morton
 <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Robin Murphy
 <robin.murphy@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin"
 <hpa@zytor.com>
References: <20220420030418.3189040-1-tongtiangen@huawei.com>
 <20220420030418.3189040-2-tongtiangen@huawei.com>
 <91011a66-b125-b445-1486-bada8e06b994@csgroup.eu>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <91011a66-b125-b445-1486-bada8e06b994@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600017.china.huawei.com (7.193.23.234)
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Xie XiuQi <xiexiuqi@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Guohanjun <guohanjun@huawei.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



在 2022/5/2 22:24, Christophe Leroy 写道:
> 
> 
> Le 20/04/2022 à 05:04, Tong Tiangen a écrit :
>> x86/powerpc has it's implementation of copy_mc_to_user but not use #define
>> to declare.
>>
>> This may cause problems, for example, if other architectures open
>> CONFIG_ARCH_HAS_COPY_MC, but want to use copy_mc_to_user() outside the
>> architecture, the code add to include/linux/uaddess.h is as follows:
>>
>>       #ifndef copy_mc_to_user
>>       static inline unsigned long __must_check
>>       copy_mc_to_user(void *dst, const void *src, size_t cnt)
>>       {
>> 	    ...
>>       }
>>       #endif
>>
>> Then this definition will conflict with the implementation of x86/powerpc
>> and cause compilation errors as follow:
>>
>> Fixes: ec6347bb4339 ("x86, powerpc: Rename memcpy_mcsafe() to copy_mc_to_{user, kernel}()")
> 
> I don't understand, what does it fix really ? What was the
> (existing/real) bug introduced by that patch and that your are fixing ?
> 
> If those defined had been expected and missing, we would have had a
> build failure. If you have one, can you describe it ?

There will be build failure after patch 3 is added, there is a little
confusing for a reader of this commit in isolation.
In the next version, I will put this patch after patch 3.

Thanks,
Tong.
> 
>> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
>> ---
>>    arch/powerpc/include/asm/uaccess.h | 1 +
>>    arch/x86/include/asm/uaccess.h     | 1 +
>>    2 files changed, 2 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
>> index 9b82b38ff867..58dbe8e2e318 100644
>> --- a/arch/powerpc/include/asm/uaccess.h
>> +++ b/arch/powerpc/include/asm/uaccess.h
>> @@ -358,6 +358,7 @@ copy_mc_to_user(void __user *to, const void *from, unsigned long n)
>>    
>>    	return n;
>>    }
>> +#define copy_mc_to_user copy_mc_to_user
>>    #endif
>>    
>>    extern long __copy_from_user_flushcache(void *dst, const void __user *src,
>> diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
>> index f78e2b3501a1..e18c5f098025 100644
>> --- a/arch/x86/include/asm/uaccess.h
>> +++ b/arch/x86/include/asm/uaccess.h
>> @@ -415,6 +415,7 @@ copy_mc_to_kernel(void *to, const void *from, unsigned len);
>>    
>>    unsigned long __must_check
>>    copy_mc_to_user(void *to, const void *from, unsigned len);
>> +#define copy_mc_to_user copy_mc_to_user
>>    #endif
>>    
>>    /*
