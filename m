Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2487F0A26
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 01:40:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYTFH6FTxz3dFH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 11:40:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=wangkefeng.wang@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYTDn6xGXz3cCH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 11:40:05 +1100 (AEDT)
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SYT825Wf9zsRGy;
	Mon, 20 Nov 2023 08:36:02 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 20 Nov 2023 08:39:28 +0800
Message-ID: <c441db4c-1851-4b09-a344-377a1684e9b5@huawei.com>
Date: Mon, 20 Nov 2023 08:39:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] asm/io: remove unnecessary xlate_dev_mem_ptr() and
 unxlate_dev_mem_ptr()
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20231118100827.1599422-1-wangkefeng.wang@huawei.com>
 <CAMuHMdU+MMiogx6TcBwxFL7AODZYhiAZpVHiafEBfnRsDaXTog@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <CAMuHMdU+MMiogx6TcBwxFL7AODZYhiAZpVHiafEBfnRsDaXTog@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, "James
 E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2023/11/20 3:34, Geert Uytterhoeven wrote:
> On Sat, Nov 18, 2023 at 11:09 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>> The asm-generic/io.h already has default definition, remove unnecessary
>> arch's defination.
>>
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
>> Cc: Russell King <linux@armlinux.org.uk>
>> Cc: Brian Cain <bcain@quicinc.com>
>> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
>> Cc: Rich Felker <dalias@libc.org>
>> Cc: "David S. Miller" <davem@davemloft.net>
>> Cc: Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> 
>>   arch/m68k/include/asm/io_mm.h  | 6 ------
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
>>   arch/sh/include/asm/io.h       | 7 -------
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>


Thanks,
> 
>> --- a/arch/mips/include/asm/io.h
>> +++ b/arch/mips/include/asm/io.h
>> @@ -548,13 +548,6 @@ extern void (*_dma_cache_inv)(unsigned long start, unsigned long size);
>>   #define csr_out32(v, a) (*(volatile u32 *)((unsigned long)(a) + __CSR_32_ADJUST) = (v))
>>   #define csr_in32(a)    (*(volatile u32 *)((unsigned long)(a) + __CSR_32_ADJUST))
>>
>> -/*
>> - * Convert a physical pointer to a virtual kernel pointer for /dev/mem
>> - * access
>> - */
>> -#define xlate_dev_mem_ptr(p)   __va(p)
>> -#define unxlate_dev_mem_ptr(p, v) do { } while (0)
>> -
>>   void __ioread64_copy(void *to, const void __iomem *from, size_t count);
> 
> Missing #include <asm-generic/io.h>, according to the build bot report.

Will check the bot report.

> 
>>   #endif /* _ASM_IO_H */
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
