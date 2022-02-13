Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2B74B3C8B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 18:27:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxZ6n2L8dz3cTG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 04:27:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JxZ6J1w08z2xtb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 04:27:01 +1100 (AEDT)
Received: from [192.168.0.2] (ip5f5aee62.dynamic.kabel-deutschland.de
 [95.90.238.98])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7352161E64846;
 Sun, 13 Feb 2022 18:26:54 +0100 (CET)
Message-ID: <18464474-77e9-1a53-265f-b9718d43e8cd@molgen.mpg.de>
Date: Sun, 13 Feb 2022 18:26:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: BUG: sleeping function called from invalid context at
 include/linux/sched/mm.h:256
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
References: <244218af-df6a-236e-0a52-268247dd8271@molgen.mpg.de>
 <20220212234802.GR4285@paulmck-ThinkPad-P17-Gen-1>
 <3fa9ec7e-0bc1-b972-c21b-473a9ef2e15f@molgen.mpg.de>
 <20220213144542.GT4285@paulmck-ThinkPad-P17-Gen-1>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220213144542.GT4285@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, rcu@vger.kernel.org, linux-mm@kvack.org,
 Jason Baron <jbaron@akamai.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Paul,


Am 13.02.22 um 15:45 schrieb Paul E. McKenney:
> On Sun, Feb 13, 2022 at 08:39:13AM +0100, Paul Menzel wrote:

>> Am 13.02.22 um 00:48 schrieb Paul E. McKenney:
>>> On Sun, Feb 13, 2022 at 12:05:50AM +0100, Paul Menzel wrote:
>>
>> […]
>>
>>>> Running rcutorture on the POWER8 system IBM S822LC with Ubuntu 20.10, it
>>>> found the bug below. I more or less used rcu/dev (0ba8896d2fd7
>>>> (lib/irq_poll: Declare IRQ_POLL softirq vector as ksoftirqd-parking safe))
>>>> [1]. The bug manifested for the four configurations below.
>>>>
>>>> 1.  results-rcutorture-kasan/SRCU-T
>>>> 2.  results-rcutorture-kasan/TINY02
>>>> 3.  results-rcutorture/SRCU-T
>>>> 4.  results-rcutorture/TINY02
>>>
>>> Adding Frederic on CC...
>>>
>>> I am dropping these three for the moment:
>>>
>>> 0ba8896d2fd75 lib/irq_poll: Declare IRQ_POLL softirq vector as ksoftirqd-parking safe
>>> efa8027149a1f tick/rcu: Stop allowing RCU_SOFTIRQ in idle
>>> d338d22b9d338 tick/rcu: Remove obsolete rcu_needs_cpu() parameters
>>>
>>> Though it might be that these are victims of circumstance, in other
>>> words, that the original bug that Paul Menzel reported was caused by
>>> something else.
>>
>> Even without these three patches, the issue is reproducible. I tested commit
>> 7a935b7ac61b (tools/nolibc/stdlib: implement abort()).
> 
> Ah, I thought you were saying that the issue was caused by them.
> 
> I will put them back.  And apologies to Frederic for kicking his
> patches out!

Sorry for being unclear.

> Are you able to bisect to see what commit introduced the problem?

I have not checked yet, if it’s a regression. I am going to test it next 
week.

[…]


Kind regards,

