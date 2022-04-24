Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B6350CE31
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Apr 2022 03:17:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Km9Gp0qqxz3bdq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Apr 2022 11:17:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=tongtiangen@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Km9GK4pcpz2yN4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Apr 2022 11:16:41 +1000 (AEST)
Received: from kwepemi500001.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Km9Dj5x1XzfZWc;
 Sun, 24 Apr 2022 09:15:17 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi500001.china.huawei.com (7.221.188.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 24 Apr 2022 09:16:07 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 24 Apr 2022 09:16:06 +0800
Message-ID: <4ee686bc-38d4-7709-30a9-0c807919672a@huawei.com>
Date: Sun, 24 Apr 2022 09:16:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v4 1/7] x86, powerpc: fix function define in
 copy_mc_to_user
To: Michael Ellerman <mpe@ellerman.id.au>, Mark Rutland
 <mark.rutland@arm.com>, James Morse <james.morse@arm.com>, Andrew Morton
 <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Robin Murphy
 <robin.murphy@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
 <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
References: <20220420030418.3189040-1-tongtiangen@huawei.com>
 <20220420030418.3189040-2-tongtiangen@huawei.com>
 <87r15p8n9g.fsf@mpe.ellerman.id.au>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <87r15p8n9g.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Guohanjun <guohanjun@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



在 2022/4/22 17:45, Michael Ellerman 写道:
> Tong Tiangen <tongtiangen@huawei.com> writes:
>> x86/powerpc has it's implementation of copy_mc_to_user but not use #define
>> to declare.
>>
>> This may cause problems, for example, if other architectures open
>> CONFIG_ARCH_HAS_COPY_MC, but want to use copy_mc_to_user() outside the
>> architecture, the code add to include/linux/uaddess.h is as follows:
>>
>>      #ifndef copy_mc_to_user
>>      static inline unsigned long __must_check
>>      copy_mc_to_user(void *dst, const void *src, size_t cnt)
>>      {
>> 	    ...
>>      }
>>      #endif
>       
> The above doesn't exist yet, you add it in patch 3, which is a little
> confusing for a reader of this commit in isolation.
> 
> I think you could safely move that into this patch, and then this patch
> would be ~= "Add generic fallback version of copy_mc_to_user()".
> 
> It's probably not worth doing a whole new version of the series just for
> that, but if you need to do a new version for some other reason I think
> it would be cleaner to introduce the fallback in this commit.
> 

Agreed, will do in next version.

Thanks,
Tong.

>> Then this definition will conflict with the implementation of x86/powerpc
>> and cause compilation errors as follow:
>>
>> Fixes: ec6347bb4339 ("x86, powerpc: Rename memcpy_mcsafe() to copy_mc_to_{user, kernel}()")
>> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
>> ---
>>   arch/powerpc/include/asm/uaccess.h | 1 +
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> 
> cheers
> .
