Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC40D5F0244
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 03:35:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mdt8m64CJz3cd7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 11:35:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mdt8N5L6dz2xWx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 11:35:10 +1000 (AEST)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mdt495RgTzpSwb;
	Fri, 30 Sep 2022 09:31:37 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 09:34:35 +0800
Message-ID: <8ca0a577-67b1-a51e-2657-5a55e395d4d3@huawei.com>
Date: Fri, 30 Sep 2022 09:34:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next] powerpc/mpic_msgr: fix cast removes address space
 of expression warnings
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<joel@jms.id.au>, <Julia.Lawall@inria.fr>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
References: <20220901085416.204378-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <20220901085416.204378-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ping.

On 2022/9/1 16:54, ruanjinjie wrote:
> When build Linux kernel, encounter the following warnings:
> 
> ./arch/powerpc/sysdev/mpic_msgr.c:230:38: warning: cast removes address space '__iomem' of expression
> ./arch/powerpc/sysdev/mpic_msgr.c:230:27: warning: incorrect type in assignment (different address spaces)
> 
> The data type of msgr->mer and msgr->base are 'u32 __iomem *', but
> converted to 'u32 *' and 'u8 *' directly and cause above warnings, now
> recover their data types to fix these warnings.
> 
> Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
> ---
>  arch/powerpc/sysdev/mpic_msgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/sysdev/mpic_msgr.c b/arch/powerpc/sysdev/mpic_msgr.c
> index 698fefaaa6dd..cbb0d24f15ba 100644
> --- a/arch/powerpc/sysdev/mpic_msgr.c
> +++ b/arch/powerpc/sysdev/mpic_msgr.c
> @@ -227,7 +227,7 @@ static int mpic_msgr_probe(struct platform_device *dev)
>  
>  		reg_number = block_number * MPIC_MSGR_REGISTERS_PER_BLOCK + i;
>  		msgr->base = msgr_block_addr + i * MPIC_MSGR_STRIDE;
> -		msgr->mer = (u32 *)((u8 *)msgr->base + MPIC_MSGR_MER_OFFSET);
> +		msgr->mer = (u32 __iomem *)((u8 __iomem *)msgr->base + MPIC_MSGR_MER_OFFSET);
>  		msgr->in_use = MSGR_FREE;
>  		msgr->num = i;
>  		raw_spin_lock_init(&msgr->lock);
