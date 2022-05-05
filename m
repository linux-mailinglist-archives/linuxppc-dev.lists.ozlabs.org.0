Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA3F51B536
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 03:21:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktws86Jn3z3c8n
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 11:21:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ktwrk4jKwz2yS3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 11:21:23 +1000 (AEST)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KtwnK3MHbzGpTN;
 Thu,  5 May 2022 09:18:29 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 5 May 2022 09:21:12 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 5 May 2022 09:21:11 +0800
Message-ID: <83e5bbe7-0880-3534-897a-156a4d2b4451@huawei.com>
Date: Thu, 5 May 2022 09:21:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH -next v4 1/7] x86, powerpc: fix function define in
 copy_mc_to_user
Content-Language: en-US
To: Tong Tiangen <tongtiangen@huawei.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Mark Rutland <mark.rutland@arm.com>, "James
 Morse" <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Robin Murphy <robin.murphy@arm.com>, "Dave
 Hansen" <dave.hansen@linux.intel.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, 
 "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
References: <20220420030418.3189040-1-tongtiangen@huawei.com>
 <20220420030418.3189040-2-tongtiangen@huawei.com>
 <91011a66-b125-b445-1486-bada8e06b994@csgroup.eu>
 <48f2779d-bc62-c7f5-c40e-7238a16b90fb@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <48f2779d-bc62-c7f5-c40e-7238a16b90fb@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
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
Cc: Xie XiuQi <xiexiuqi@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Guohanjun <guohanjun@huawei.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2022/5/3 9:06, Tong Tiangen wrote:
>
>
> 在 2022/5/2 22:24, Christophe Leroy 写道:
>>
>>
>> Le 20/04/2022 à 05:04, Tong Tiangen a écrit :
>>> x86/powerpc has it's implementation of copy_mc_to_user but not use 
>>> #define
>>> to declare.
>>>
>>> This may cause problems, for example, if other architectures open
>>> CONFIG_ARCH_HAS_COPY_MC, but want to use copy_mc_to_user() outside the
>>> architecture, the code add to include/linux/uaddess.h is as follows:
>>>
>>>       #ifndef copy_mc_to_user
>>>       static inline unsigned long __must_check
>>>       copy_mc_to_user(void *dst, const void *src, size_t cnt)
>>>       {
>>>         ...
>>>       }
>>>       #endif
>>>
>>> Then this definition will conflict with the implementation of 
>>> x86/powerpc
>>> and cause compilation errors as follow:
>>>
>>> Fixes: ec6347bb4339 ("x86, powerpc: Rename memcpy_mcsafe() to 
>>> copy_mc_to_{user, kernel}()")
>>
>> I don't understand, what does it fix really ? What was the
>> (existing/real) bug introduced by that patch and that your are fixing ?
>>
>> If those defined had been expected and missing, we would have had a
>> build failure. If you have one, can you describe it ?
>
It could prevent future problems when patch3 is introduced， and yes，for 
now，

this patch won't fix any issue，we could drop the fix tag, and update the 
changelog.


> There will be build failure after patch 3 is added, there is a little
> confusing for a reader of this commit in isolation.
> In the next version, I will put this patch after patch 3.
This is an alternative.
>
> Thanks,
> Tong.
> .
