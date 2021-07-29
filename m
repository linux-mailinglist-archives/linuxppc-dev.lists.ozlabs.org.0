Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CEC3D9B91
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 04:04:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZv3R6lPSz3cWP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 12:04:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZv360q02z2xfy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 12:04:01 +1000 (AEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GZtvZ3zN8zYhCM;
 Thu, 29 Jul 2021 09:57:30 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 29 Jul 2021 10:03:19 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 29 Jul 2021 10:03:19 +0800
Subject: Re: [PATCH v2 2/7] kallsyms: Fix address-checks for kernel related
 range
To: Steven Rostedt <rostedt@goodmis.org>
References: <20210728081320.20394-1-wangkefeng.wang@huawei.com>
 <20210728081320.20394-3-wangkefeng.wang@huawei.com>
 <20210728104642.7ae75442@oasis.local.home>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <637cd290-ecda-2727-519a-12147a92b01e@huawei.com>
Date: Thu, 29 Jul 2021 10:03:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210728104642.7ae75442@oasis.local.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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
Cc: linux-arch@vger.kernel.org, Petr
 Mladek <pmladek@suse.com>, ryabinin.a.a@gmail.com, arnd@arndb.de,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-kernel@vger.kernel.org,
 ast@kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 mingo@redhat.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2021/7/28 22:46, Steven Rostedt wrote:
> On Wed, 28 Jul 2021 16:13:15 +0800
> Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
>> The is_kernel_inittext/is_kernel_text/is_kernel function should not
>> include the end address(the labels _einittext, _etext and _end) when
>> check the address range, the issue exists since Linux v2.6.12.
>>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
>> Cc: Petr Mladek <pmladek@suse.com>
>> Acked-by: Sergey Senozhatsky <senozhatsky@chromium.org>
>> Reviewed-by: Petr Mladek <pmladek@suse.com>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

Thanks.

>
> -- Steve
>
