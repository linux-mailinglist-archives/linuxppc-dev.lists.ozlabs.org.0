Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E8191B9BD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 10:24:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9T4116Qkz3clb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 18:24:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=114.132.58.6; helo=bg1.exmail.qq.com; envelope-from=jialong.yang@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.58.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9T3c0C3wz30W2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 18:23:39 +1000 (AEST)
X-QQ-mid: bizesmtp77t1719562896t2sg8m4v
X-QQ-Originating-IP: wW6Te52tLfIZhGbAIwW7ZTTx5j6Cem2c75vdERYyR2A=
Received: from [198.18.0.1] ( [223.112.234.130])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Jun 2024 16:21:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16955004016337450842
Message-ID: <2CCFA0BD64E5F2E0+e4c7fc43-47b1-4788-a7d2-44f6a33cff66@shingroup.cn>
Date: Fri, 28 Jun 2024 16:21:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] powerpc/mmiotrace: Add MMIO Tracing tool for
 PowerPC
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
References: <2bf90acf7d29641ba6643934ff8dbba897dbd2d9.1718873074.git.jialong.yang@shingroup.cn>
 <87h6ddlfc7.fsf@mail.lhotse>
From: =?UTF-8?B?WWFuZyBKaWFsb25nIOadqOS9s+m+mQ==?= <jialong.yang@shingroup.cn>
In-Reply-To: <87h6ddlfc7.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-0
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
Cc: luming.yu@shingroup.cn, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Karol Herbst <karolherbst@gmail.com>, shenghui.qu@shingroup.cn, Pekka Paalanen <ppaalanen@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2024/6/28 15:02, Michael Ellerman 写道:
> Jialong Yang <jialong.yang@shingroup.cn> writes:
>> mmiotrace is a useful tool to trace MMIO accesses. Nowadays, it only
>> supported on x86 and x86_64 platforms.
> I've never used mmiotrace, and don't know it well.
>
> I'm not necessarily opposed to merging it, but AFAIK it was mostly used
> for reverse engineering proprietary drivers, where the driver itself
> couldn't be easily instrumented. Is that what you're using it for?

Yes. Just like you think. We have used it for network stack debug in 
ppc64le.


>
> For drivers where we have the source wouldn't it be easier to just use
> tracepoints in the MMIO accessors?


Tracepoints need pre-defined. And in some big driver, it's not easy to 
overwrite

all points where access registers in io area. And tracepoint is C 
function level filter.

mmiotrace is similar to set tracepoints in writel/readl... But it can do 
deeperly.

mmiotrace is a asm level filter tool. It doesn't care what have done in 
C level. It will

only find what have done by asm, such as stw(store word)/lw(load word),  
just like standing

in the view of device.


>
> Is it still in-use/maintained on the x86 side?


Here is some core file patches number in x86:

|      | mmio_mod.c | kmmio.c | pf_in.* | testmmiotrace.c |
|------+------------+---------+---------+-----------------|
| 2022 |               1 |            3 | |                  |
| 2021 |               2 |            1 |               |         |
| 2020 |               4 |            4 | |               1 |
| 2019 |               2 |            1 |            1 |               4 |
| 2018 |                  |            2 |               |          |
| 2017 |               2 |            2 | |               1 |
| 2016 |               1 |            2 |            1 |        |
| 2014 |                  |            1 |               |          |
| 2013 |               1 |               |               |          |
| 2012 |               1 |               | |                  |
| 2011 |               3 |               |            1 |         |
| 2010 |               1 |            3 |            2 |               1 |
| 2009 |               4 |          19 | |               3 |
| 2008 |             13 |            5 |            2 |               3 |

>
>> Here is a support for powerpc.
>> The manual is located at Documentation/trace/mmiotrace.rst which means
>> I have not changed user API. People will be easy to use it.
>> Almost all files are copied from x86/mm, there are only some
>> differences from hardware and architectures software.
>>
>> LINK: https://lore.kernel.org/lkml/20080127195536.50809974@daedalus.pq.iki.fi/
>>
>> Signed-off-by: Jialong Yang <jialong.yang@shingroup.cn>
>> ---
>>   arch/powerpc/Kconfig.debug       |   3 +
>>   arch/powerpc/mm/Makefile         |   1 +
>>   arch/powerpc/mm/kmmio.c          | 649 +++++++++++++++++++++++++++++++
>>   arch/powerpc/mm/mmio-mod.c       | 414 ++++++++++++++++++++
>>   arch/powerpc/mm/mmiotrace_arch.c | 149 +++++++
>>   arch/powerpc/mm/mmiotrace_arch.h |  25 ++
>>   arch/powerpc/mm/pf_in.c          | 185 +++++++++
>>   arch/powerpc/mm/pf_in.h          |  33 ++
>>   8 files changed, 1459 insertions(+)
>    
> At a glance most of that code could be shared between arches. I don't
> think I can merge that as-is, without some attempt to split the generic
> parts out.


Right.

I just copy them from arch/x86/mm. There are many code not arch specific.


> cheers
>

