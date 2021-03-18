Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3C533FC74
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 02:02:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F17zP4JsGz3bns
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 12:02:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F17z40thVz2xgF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 12:02:05 +1100 (AEDT)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F17w73LVNzmZ6G;
 Thu, 18 Mar 2021 08:59:35 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Thu, 18 Mar 2021 09:01:56 +0800
Subject: Re: [PATCH v2] mm: Move mem_init_print_info() into mm_init()
To: Dave Hansen <dave.hansen@intel.com>, <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <4d488195-7281-9238-b30d-9f89a6100fb9@csgroup.eu>
 <20210317015210.33641-1-wangkefeng.wang@huawei.com>
 <2a7d6e39-b293-7422-87b0-741f1ab0c22c@intel.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <190f5356-f947-d474-a9fe-bc8e622a426e@huawei.com>
Date: Thu, 18 Mar 2021 09:01:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <2a7d6e39-b293-7422-87b0-741f1ab0c22c@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter
 Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2021/3/18 2:48, Dave Hansen wrote:
> On 3/16/21 6:52 PM, Kefeng Wang wrote:
>> mem_init_print_info() is called in mem_init() on each architecture,
>> and pass NULL argument, so using void argument and move it into mm_init().
>>
>> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> It's not a big deal but you might want to say something like:
>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com> # x86 bits
>
> Just to make it clear that I didn't look at the alpha bits at all. :)
Get it, will be careful, thanks.
> .
>
