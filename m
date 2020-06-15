Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E071F8C16
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 03:37:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lYpq4DxrzDqS9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 11:37:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=yanaijie@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lYmv1TMNzDqRj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 11:35:21 +1000 (AEST)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 334B27D8576459A523DB;
 Mon, 15 Jun 2020 09:19:03 +0800 (CST)
Received: from [127.0.0.1] (10.166.213.7) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Mon, 15 Jun 2020
 09:19:01 +0800
Subject: Re: [PATCH] powerpc/fsl_booke/32: fix build with CONFIG_RANDOMIZE_BASE
To: Arseny Solokha <asolokha@kb.kras.ru>, Michael Ellerman
 <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>
References: <20200613162801.1946619-1-asolokha@kb.kras.ru>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <48e8cd6c-9128-e8f0-6fd6-0f93b84629ca@huawei.com>
Date: Mon, 15 Jun 2020 09:19:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200613162801.1946619-1-asolokha@kb.kras.ru>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.166.213.7]
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
Cc: Scott Wood <oss@buserror.net>, Christophe Leroy <christophe.leroy@c-s.fr>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


ÔÚ 2020/6/14 0:28, Arseny Solokha Ð´µÀ:
> Building the current 5.8 kernel for a e500 machine with
> CONFIG_RANDOMIZE_BASE set yields the following failure:
> 
>    arch/powerpc/mm/nohash/kaslr_booke.c: In function 'kaslr_early_init':
>    arch/powerpc/mm/nohash/kaslr_booke.c:387:2: error: implicit declaration
> of function 'flush_icache_range'; did you mean 'flush_tlb_range'?
> [-Werror=implicit-function-declaration]
> 
> Indeed, including asm/cacheflush.h into kaslr_booke.c fixes the build.
> 
> The issue dates back to the introduction of that file and probably went
> unnoticed because there's no in-tree defconfig with CONFIG_RANDOMIZE_BASE
> set.
> 
> Fixes: 2b0e86cc5de6 ("powerpc/fsl_booke/32: implement KASLR infrastructure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arseny Solokha <asolokha@kb.kras.ru>
> ---
>   arch/powerpc/mm/nohash/kaslr_booke.c | 1 +
>   1 file changed, 1 insertion(+)
> 

Reviewed-by: Jason Yan <yanaijie@huawei.com>

