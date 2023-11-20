Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD5A7F0C78
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 08:06:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYdpT5MMwz3dK5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 18:06:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=wangkefeng.wang@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYdny4D4hz2ydW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 18:05:54 +1100 (AEDT)
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SYdhg3CDpzsRJy;
	Mon, 20 Nov 2023 15:01:23 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 20 Nov 2023 15:04:49 +0800
Message-ID: <1f013eda-b82f-4ae0-99ad-0eec70d45146@huawei.com>
Date: Mon, 20 Nov 2023 15:04:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] asm/io: remove unnecessary xlate_dev_mem_ptr() and
 unxlate_dev_mem_ptr()
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>
References: <20231118100827.1599422-1-wangkefeng.wang@huawei.com>
 <CAMuHMdU+MMiogx6TcBwxFL7AODZYhiAZpVHiafEBfnRsDaXTog@mail.gmail.com>
 <c441db4c-1851-4b09-a344-377a1684e9b5@huawei.com>
 <2a7bff92-8e25-4cf7-acf1-8ed054691fd8@app.fastmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <2a7bff92-8e25-4cf7-acf1-8ed054691fd8@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100001.china.huawei.com (7.185.36.93)
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, Brian Cain <bcain@quicinc.com>, Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, linux-mips@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Russell King <linux@armlinux.org.uk>, "James
 E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2023/11/20 14:40, Arnd Bergmann wrote:
> On Mon, Nov 20, 2023, at 01:39, Kefeng Wang wrote:
>> On 2023/11/20 3:34, Geert Uytterhoeven wrote:
>>> On Sat, Nov 18, 2023 at 11:09 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>>>>
>>>> -/*
>>>> - * Convert a physical pointer to a virtual kernel pointer for /dev/mem
>>>> - * access
>>>> - */
>>>> -#define xlate_dev_mem_ptr(p)   __va(p)
>>>> -#define unxlate_dev_mem_ptr(p, v) do { } while (0)
>>>> -
>>>>    void __ioread64_copy(void *to, const void __iomem *from, size_t count);
>>>
>>> Missing #include <asm-generic/io.h>, according to the build bot report.
>>
>> Will check the bot report.
> 
> I had planned to pick up the series from
> 
> https://lore.kernel.org/lkml/20230921110424.215592-3-bhe@redhat.com/

Good to see it.

> 
> for v6.7 but didn't make it in the end. I'll try to do it now
> for v6.8 and apply your v1 patch with the Acks on top.

Thanks.

> 
>      Arnd
