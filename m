Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C6D24239E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 03:09:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRBSF5xynzDqWK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 11:09:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=huawei.com;
 envelope-from=lizefan@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRBQl0KcbzDqQP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 11:08:10 +1000 (AEST)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D453732FD42127E7D3BA;
 Wed, 12 Aug 2020 09:08:02 +0800 (CST)
Received: from [10.174.178.86] (10.174.178.86) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 12 Aug
 2020 09:07:44 +0800
Subject: Re: [PATCH v3 0/8] huge vmalloc mappings
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Nicholas Piggin
 <npiggin@gmail.com>
References: <20200810022732.1150009-1-npiggin@gmail.com>
 <20200811173217.0000161e@huawei.com>
From: Zefan Li <lizefan@huawei.com>
Message-ID: <d457aabc-9f58-f47e-f5fa-9539618b2759@huawei.com>
Date: Wed, 12 Aug 2020 09:07:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200811173217.0000161e@huawei.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.86]
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
Cc: linux-arch@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Catalin
 Marinas <catalin.marinas@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020/8/12 0:32, Jonathan Cameron wrote:
> On Mon, 10 Aug 2020 12:27:24 +1000
> Nicholas Piggin <npiggin@gmail.com> wrote:
> 
>> Not tested on x86 or arm64, would appreciate a quick test there so I can
>> ask Andrew to put it in -mm. Other option is I can disable huge vmallocs
>> for them for the time being.
> 
> Hi Nicholas,
> 
> For arm64 testing with a Kunpeng920.
> 
> I ran a quick sanity test with this series on top of mainline (yes mid merge window
> so who knows what state is...).  Could I be missing some dependency?
> 
> Without them it boots, with them it doesn't.  Any immediate guesses?
> 

I've already reported this bug in v2, and yeah I also tested it on arm64
(not Kunpeng though), so looks like it still hasn't been fixed.

...
>>
>> Since v2:
>> - Rebased on vmalloc cleanups, split series into simpler pieces.
>> - Fixed several compile errors and warnings
>> - Keep the page array and accounting in small page units because
>>   struct vm_struct is an interface (this should fix x86 vmap stack debug
>>   assert). [Thanks Zefan]

though the changelog says it's fixed for x86.

