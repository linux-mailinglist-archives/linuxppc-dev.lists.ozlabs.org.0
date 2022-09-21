Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E705BF437
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 05:17:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXNr74sSQz3c4S
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 13:17:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXNqg4P7pz30M8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 13:16:42 +1000 (AEST)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MXNk65L9gzlWhP;
	Wed, 21 Sep 2022 11:11:58 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 11:16:05 +0800
Received: from [10.67.108.67] (10.67.108.67) by dggpemm500013.china.huawei.com
 (7.185.36.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 21 Sep
 2022 11:16:05 +0800
Message-ID: <f7df65b0-ae41-8cce-01aa-84349efc387a@huawei.com>
Date: Wed, 21 Sep 2022 11:16:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [RFC] Objtool toolchain proposal:
 -fannotate-{jump-table,noreturn}
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>
References: <20220909180704.jwwed4zhwvin7uyi@treble>
 <Yx8PcldkdOLN8eaw@nazgul.tnic>
 <alpine.LSU.2.20.2209121200120.8265@wotan.suse.de>
 <6a61aa57-141f-039c-5a2d-b2d79fecb8c2@huawei.com>
 <YyLmhUxTUaNzaieC@hirez.programming.kicks-ass.net>
 <CAMj1kXGa7D6TLOQruYF+0czWwxcRxN7k1rWTrhB2xnjTQ32c9Q@mail.gmail.com>
From: Chen Zhongjin <chenzhongjin@huawei.com>
In-Reply-To: <CAMj1kXGa7D6TLOQruYF+0czWwxcRxN7k1rWTrhB2xnjTQ32c9Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.108.67]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500013.china.huawei.com (7.185.36.172)
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Sathvika Vasireddy <sv@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Michael Matz <matz@suse.de>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, linux-toolchains@vger.kernel.org, Indu
 Bhagat <indu.bhagat@oracle.com>, live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>, Will
 Deacon <will@kernel.org>, Josh
 Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org, "Jose E. Marchesi" <jemarch@gnu.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 2022/9/21 0:49, Ard Biesheuvel wrote:
> On Thu, 15 Sept 2022 at 10:47, Peter Zijlstra <peterz@infradead.org> wrote:
>> On Thu, Sep 15, 2022 at 10:56:58AM +0800, Chen Zhongjin wrote:
>>
>>> We have found some anonymous information on x86 in .rodata.
>> Well yes, but that's still a bunch of heuristics on our side.
>>
>>> I'm not sure if those are *all* of Josh wanted on x86, however for arm64 we
>>> did not found that in the same section so it is a problem on arm64 now.
>> Nick found Bolt managed the ARM64 jumptables:
>>
>>    https://github.com/llvm/llvm-project/blob/main/bolt/lib/Target/AArch64/AArch64MCPlusBuilder.cpp#L484
>>
>> But that does look like a less than ideal solution too.
>>
>>> Does the compiler will emit these for all arches? At lease I tried and
>>> didn't find anything meaningful (maybe I omitted it).
>> That's the question; can we get the compiler to help us here in a well
>> defined manner.
> Do BTI landing pads help at all here? I.e., I assume that objtool just
> treats any indirect call as a dangling edge in the control flow graph,
> and the problem is identifying the valid targets. In the BTI case,
> those will all start with a 'BTI J' instruction.

Maybe not enough, I guess.

For switch jump tables we need to know its *own* jump targets so that we 
can go through all its branches. If there are more than one indirect 
jump inside one function, only marks targets with BTI J can't help 
matching the entry and its targets.


Anyway I think this job is more for compiler. Switch jump tables is 
different from other indirect jump/call. It have fixed control flow just 
as if/else flow and the indirect jump table is just a compiler 
optimization which hide this.


Best,

Chen

