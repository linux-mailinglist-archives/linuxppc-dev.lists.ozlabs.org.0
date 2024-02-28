Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ED786A83B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 07:08:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=HzqEYi+b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tl3n331R9z3dTt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 17:08:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=HzqEYi+b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.99; helo=out30-99.freemail.mail.aliyun.com; envelope-from=yaoma@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tl3mJ4vP5z3c2C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 17:07:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1709100440; h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
	bh=VTjKIhOK3qM69jCegJqoVI39eQmDbxUQOTEPlMd6XqI=;
	b=HzqEYi+b3N0uSJLVbYlO6sgrPn75zCPFIKORn8BC+/A3dSpgLupv2xYlIvtF0punLHrhwjauWbEMu6InbOUNruIyDlQfY8/jmvJpVJCeurxb0Lylm4K6DHQkB0CuBe9RYLHCBjh4eTCLb6y2al3ZUEXnCxSrQ8AxQ2VPRO4HV+8=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R641e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=yaoma@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0W1OnNtY_1709100436;
Received: from 30.178.67.139(mailfrom:yaoma@linux.alibaba.com fp:SMTPD_---0W1OnNtY_1709100436)
          by smtp.aliyun-inc.com;
          Wed, 28 Feb 2024 14:07:18 +0800
Message-ID: <1606230b-83af-4f5f-b1ef-6ae8f73841f5@linux.alibaba.com>
Date: Wed, 28 Feb 2024 14:07:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bitao Hu <yaoma@linux.alibaba.com>
Subject: Re: [PATCHv10 3/4] genirq: Avoid summation loops for /proc/interrupts
To: Thomas Gleixner <tglx@linutronix.de>, dianders@chromium.org,
 liusong@linux.alibaba.com, akpm@linux-foundation.org, pmladek@suse.com,
 kernelfans@gmail.com, deller@gmx.de, npiggin@gmail.com,
 tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
 jan.kiszka@siemens.com
References: <20240226020939.45264-1-yaoma@linux.alibaba.com>
 <20240226020939.45264-4-yaoma@linux.alibaba.com> <87le769s0w.ffs@tglx>
 <e78357ae-7b00-446c-b010-3bd770892c9e@linux.alibaba.com>
 <87a5nlapc2.ffs@tglx>
Content-Language: en-US
In-Reply-To: <87a5nlapc2.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: yaoma@linux.alibaba.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2024/2/27 23:39, Thomas Gleixner wrote:
> On Tue, Feb 27 2024 at 19:20, Bitao Hu wrote:
>> On 2024/2/27 17:26, Thomas Gleixner wrote:
>>>
>>> and then let kstat_irqs() and show_interrupts() use it. See?
>>
>> I have a concern. kstat_irqs() uses for_each_possible_cpu() for
>> summation. However, show_interrupts() uses for_each_online_cpu(),
>> which means it only outputs interrupt statistics for online cpus.
>> If we use for_each_possible_cpu() in show_interrupts() to calculate
>> 'any_count', there could be a problem with the following scenario:
>> If an interrupt has a count of zero on online cpus but a non-zero
>> count on possible cpus, then 'any_count' would not be zero, and the
>> statistics for that interrupt would be output, which is not the
>> desired behavior for show_interrupts(). Therefore, I think it's not
>> good to have kstat_irqs() and show_interrupts() both use the same
>> logic. What do you think?
> 
> Good point. But you simply can have
> 
> unsigned int kstat_irq_desc(struct irq_desc *desc, const struct cpumask *mask)
> 
> and hand in the appropriate cpumask, which still shares the code, no?
> 
Alright, that is a good approach.
