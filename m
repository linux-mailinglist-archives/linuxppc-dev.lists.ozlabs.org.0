Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3F03D9B69
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 04:01:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZv0601Ycz3cTr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 12:01:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZtzf0s6Wz2yNG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 12:00:57 +1000 (AEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GZtv72w4zz81YK;
 Thu, 29 Jul 2021 09:57:07 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 29 Jul 2021 10:00:53 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 29 Jul 2021 10:00:51 +0800
Subject: Re: [PATCH v2 5/7] kallsyms: Rename is_kernel() and is_kernel_text()
To: Steven Rostedt <rostedt@goodmis.org>
References: <20210728081320.20394-1-wangkefeng.wang@huawei.com>
 <20210728081320.20394-6-wangkefeng.wang@huawei.com>
 <20210728112836.289865f5@oasis.local.home>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <1551f9cc-eaf8-efef-0590-e2549eebe4ae@huawei.com>
Date: Thu, 29 Jul 2021 10:00:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210728112836.289865f5@oasis.local.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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
Cc: linux-arch@vger.kernel.org, ryabinin.a.a@gmail.com,
 Daniel Borkmann <daniel@iogearbox.net>, arnd@arndb.de,
 linux-kernel@vger.kernel.org, ast@kernel.org,
 Nathan Chancellor <nathan@kernel.org>, mingo@redhat.com, paulus@samba.org,
 Sami Tolvanen <samitolvanen@google.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2021/7/28 23:28, Steven Rostedt wrote:
> On Wed, 28 Jul 2021 16:13:18 +0800
> Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
>> The is_kernel[_text]() function check the address whether or not
>> in kernel[_text] ranges, also they will check the address whether
>> or not in gate area, so use better name.
> Do you know what a gate area is?
>
> Because I believe gate area is kernel text, so the rename just makes it
> redundant and more confusing.

Yes, the gate area(eg, vectors part on ARM32, similar on x86/ia64) is 
kernel text.

I want to keep the 'basic' section boundaries check, which only check 
the start/end

of sections, all in section.h,  could we use 'generic' or 'basic' or 
'core' in the naming?

  * is_kernel_generic_data()	--- come from core_kernel_data() in kernel.h
  * is_kernel_generic_text()

The old helper could remain unchanged, any suggestion, thanks.

>
> -- Steve
> .
>
