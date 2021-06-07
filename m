Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2121639D773
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 10:31:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fz65p3lk4z3btx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 18:31:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fz65N6GFpz2yRD
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 18:30:48 +1000 (AEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Fz61l5hvdz6wPm;
 Mon,  7 Jun 2021 16:27:39 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 16:30:41 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 16:30:40 +0800
Subject: Re: [PATCH v2 00/15] init_mm: cleanup ARCH's text/data/brk setup code
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Mike Rapoport
 <rppt@kernel.org>
References: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
 <YL0+Jargm+y9aqx1@kernel.org>
 <481056ab-686e-9f42-3b8a-b31941f58af6@huawei.com>
 <006eb573-5a20-1ac7-6234-338d11346a08@csgroup.eu>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <f6051a1c-f7c3-6665-2d0a-5a3bf872fdb1@huawei.com>
Date: Mon, 7 Jun 2021 16:30:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <006eb573-5a20-1ac7-6234-338d11346a08@csgroup.eu>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, Andrew
 Morton <akpm@linux-foundation.org>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2021/6/7 13:48, Christophe Leroy wrote:
> Hi Kefeng,
>
> Le 07/06/2021 à 02:55, Kefeng Wang a écrit :
>>
>> On 2021/6/7 5:29, Mike Rapoport wrote:
>>> Hello Kefeng,
>>>
>>> On Fri, Jun 04, 2021 at 03:06:18PM +0800, Kefeng Wang wrote:
>>>> Add setup_initial_init_mm() helper, then use it
>>>> to cleanup the text, data and brk setup code.
>>>>
>>>> v2:
>>>> - change argument from "char *" to "void *" setup_initial_init_mm()
>>>>    suggested by Geert Uytterhoeven
>>>> - use NULL instead of (void *)0 on h8300 and m68k
>>>> - collect ACKs
>>>>
>>>> Cc: linux-snps-arc@lists.infradead.org
>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>> Cc: linux-csky@vger.kernel.org
>>>> Cc: uclinux-h8-devel@lists.sourceforge.jp
>>>> Cc: linux-m68k@lists.linux-m68k.org
>>>> Cc: openrisc@lists.librecores.org
>>>> Cc: linuxppc-dev@lists.ozlabs.org
>>>> Cc: linux-riscv@lists.infradead.org
>>>> Cc: linux-sh@vger.kernel.org
>>>> Cc: linux-s390@vger.kernel.org
>>>> Kefeng Wang (15):
>>>>    mm: add setup_initial_init_mm() helper
>>>>    arc: convert to setup_initial_init_mm()
>>>>    arm: convert to setup_initial_init_mm()
>>>>    arm64: convert to setup_initial_init_mm()
>>>>    csky: convert to setup_initial_init_mm()
>>>>    h8300: convert to setup_initial_init_mm()
>>>>    m68k: convert to setup_initial_init_mm()
>>>>    nds32: convert to setup_initial_init_mm()
>>>>    nios2: convert to setup_initial_init_mm()
>>>>    openrisc: convert to setup_initial_init_mm()
>>>>    powerpc: convert to setup_initial_init_mm()
>>>>    riscv: convert to setup_initial_init_mm()
>>>>    s390: convert to setup_initial_init_mm()
>>>>    sh: convert to setup_initial_init_mm()
>>>>    x86: convert to setup_initial_init_mm()
>>> I might be missing something, but AFAIU the init_mm.start_code and 
>>> other
>>> fields are not used really early so the new setup_initial_init_mm()
>>> function can be called in the generic code outside setup_arch(), e.g in
>>> mm_init().
>>
>> Hi Mike， each architecture has their own value, not the same, eg m68K 
>> and
>>
>> h8300, also the name of the text/code/brk is different in some arch, 
>> so I keep
>>
>> unchanged.
>
> What you could do is to define a __weak function that architectures 
> can override and call that function from mm_init() as suggested by Mike,
>
> Something like:
>
> void __weak setup_initial_init_mm(void)
> {
>     init_mm.start_code = (unsigned long)_stext;
>     init_mm.end_code = (unsigned long)_etext;
>     init_mm.end_data = (unsigned long)_edata;
>     init_mm.brk = (unsigned long)_end;
> }
>
> Then only the few architecture that are different would override it.
>
> I see a few archictectures are usigne PAGE_OFFSET to set .start_code, 
> but it is likely that this is equivalent to _stext.


Yes,  the __weak function is option, but the change is only covered 14 
archs, there are 7 other archs（alpha  hexagon  ia64

microblaze  mips sparc  um xtensa）without related setup code. Also like 
x86, it has own brk , maybe there are some

other different in some arch, so I think let's keep unchanged for now,  
thanks.

>
> Christophe
> .
>
