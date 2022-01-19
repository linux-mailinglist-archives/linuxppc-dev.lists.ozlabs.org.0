Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EADE5493AB8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 13:58:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jf5L55X3mz3cCg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 23:58:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jf5KZ417tz2yQH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jan 2022 23:58:06 +1100 (AEDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Jf5Hx5S6gz9s5T;
 Wed, 19 Jan 2022 20:56:45 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 19 Jan 2022 20:57:59 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.21; Wed, 19 Jan 2022 20:57:58 +0800
Message-ID: <f0dd59eb-6eb8-5b60-508d-7f4022f655ec@huawei.com>
Date: Wed, 19 Jan 2022 20:57:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/3] mm: vmalloc: Let user to control huge vmalloc
 default behavior
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>
References: <20211227145903.187152-1-wangkefeng.wang@huawei.com>
 <20211227145903.187152-2-wangkefeng.wang@huawei.com>
 <1642473992.qrnqczjfna.astroid@bobo.none>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <1642473992.qrnqczjfna.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme714-chm.china.huawei.com (10.1.199.110) To
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
Cc: Matthew Wilcox <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H.
 Peter Anvin" <hpa@zytor.com>, Paul Mackerras <paulus@samba.org>, Thomas
 Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2022/1/18 10:52, Nicholas Piggin wrote:
> Excerpts from Kefeng Wang's message of December 28, 2021 12:59 am:
>> Introduce HUGE_VMALLOC_DEFAULT_ENABLED and make it default y, this
>> let user to choose whether or not enable huge vmalloc mappings by
>> default.
>>
>> Meanwhile, add new hugevmalloc=on/off parameter to enable or disable
>> this feature at boot time, nohugevmalloc is still supported and
>> equivalent to hugevmalloc=off.
> Runtime options are bad enough, Kconfig and boot options are even worse.

nohugevmalloc is like blacklists, on the other hand, Add a 
HUGE_VMALLOC_DEFAULT_ENABLED

to close hugevmalloc default and enable it only via hugevmalloc=on is 
whiteList.


Only parts of our products wants this feature,  we add some interfaces 
which only

alloc hugevmalloc for them, eg, 
vmap_hugepage/vmalloc_hugepage/remap_vmalloc_hugepage_range..

for our products, but it's not the choice of most products, also add 
nohugevmalloc

for most products is expensive, so this is the reason for adding the patch.

more config/cmdline are more flexible for test/products，

>
> The 'nohugevmalloc' option mirrors 'nohugeiomap' and is not expected to
> ever be understood by an administrator unless a kernel developer is
> working with them to hunt down a regression.
>
> IMO there should be no new options. You could switch it off for
> CONFIG_BASE_SMALL perhaps, and otherwise just try to work on heuristics
> first. Bring in new options once it's proven they're needed.

but yes, this patch is optional， could others give some more comments 
about this way？

Thanks.

> Aside from that, thanks for working on these ports, great work.
>
> Thanks,
> Nick
> .
