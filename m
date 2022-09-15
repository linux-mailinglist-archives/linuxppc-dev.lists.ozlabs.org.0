Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FB75B92D3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 04:58:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MShhr0H2Kz3c9K
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 12:58:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MShhP1y7hz2yYj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 12:57:38 +1000 (AEST)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MShb43Vj9zlVvj;
	Thu, 15 Sep 2022 10:53:04 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 15 Sep 2022 10:57:03 +0800
Received: from [10.67.108.67] (10.67.108.67) by dggpemm500013.china.huawei.com
 (7.185.36.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 15 Sep
 2022 10:57:03 +0800
Message-ID: <6a61aa57-141f-039c-5a2d-b2d79fecb8c2@huawei.com>
Date: Thu, 15 Sep 2022 10:56:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [RFC] Objtool toolchain proposal:
 -fannotate-{jump-table,noreturn}
Content-Language: en-US
To: Michael Matz <matz@suse.de>, Borislav Petkov <bp@alien8.de>
References: <20220909180704.jwwed4zhwvin7uyi@treble>
 <Yx8PcldkdOLN8eaw@nazgul.tnic>
 <alpine.LSU.2.20.2209121200120.8265@wotan.suse.de>
From: Chen Zhongjin <chenzhongjin@huawei.com>
In-Reply-To: <alpine.LSU.2.20.2209121200120.8265@wotan.suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.108.67]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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
Cc: Mark
 Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Ard
 Biesheuvel <ardb@kernel.org>, Mark Brown <broonie@kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>, linux-toolchains@vger.kernel.org, Indu Bhagat <indu.bhagat@oracle.com>, live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org, "Jose E. Marchesi" <jemarch@gnu.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 2022/9/12 22:17, Michael Matz wrote:
> Hey,
>
> On Mon, 12 Sep 2022, Borislav Petkov wrote:
>
>> Micha, any opinions on the below are appreciated.
>>
>> On Fri, Sep 09, 2022 at 11:07:04AM -0700, Josh Poimboeuf wrote:
>>> difficult to ensure correctness.  Also, due to kernel live patching, the
>>> kernel relies on 100% correctness of unwinding metadata, whereas the
>>> toolchain treats it as a best effort.
> Unwinding certainly is not best effort.  It's 100% reliable as far as the
> source language or compilation options require.  But as it doesn't
> touch the discussed features I won't belabor that point.
>
> I will mention that objtool's existence is based on mistrust, of persons
> (not correctly annotating stuff) and of tools (not correctly heeding those
> annotations).  The mistrust in persons is understandable and can be dealt
> with by tools, but the mistrust in tools can't be fixed by making tools
> more complicated by emitting even more information; there's no good reason
> to assume that one piece of info can be trusted more than other pieces.
> So, if you mistrust the tools you have already lost.  That's somewhat
> philosophical, so I won't beat that horse much more either.
>
> Now, recovering the CFG.  I'll switch order of your two items:
>
> 2) noreturn function
>
>>>    .pushsection .annotate.noreturn
>>>      .quad func1
>>>      .quad func2
>>>      .quad func3
>>>    .popsection
> This won't work for indirect calls to noreturn functions:
>
>    void (* __attribute__((noreturn)) noretptr)(void);
>    int callnoret (int i)
>    {
>      noretptr();
>      return i + 32;
>    }
>
> The return statement is unreachable (and removed by GCC).  To know that
> you would have to mark the call statements, not the individual functions.
> All schemes that mark functions that somehow indicates a meaningful
> difference in the calling sequence (e.g. the ABI of functions) have the
> same problem: it's part of the call expressions type, not of individual
> decls.
>
> Second problem: it's not extensible.  Today it's noreturn functions you
> want to know, and tomorrow?  So, add a flag word per entry, define bit 0
> for now to be NORETURN, and see what comes.  Add a header with a version
> (and/or identifier) as well and it's properly extensible.  For easy
> linking and identifying the blobs in the linked result include a length in
> the header.  If this were in an allocated section it would be a good idea
> to refer to the symbols in a PC-relative manner, so as to not result in
> runtime relocations.  In this case, as it's within a non-alloc section
> that doesn't matter.  So:
>
> .section .annotate.functions
> .long 1       # version
> .long 0xcafe  # ident
> .long 2f-1f   # length
> 1:
> .quad func1, 1   # noreturn
> .quad func2, 1   # noreturn
> .quad func3, 32  # something_else_but_not_noreturn
> ...
> 2:
> .long 1b-2b   # align and "checksum"
>
> It might be that the length-and-header scheme is cumbersome if you need to
> write those section commands by hand, in which case another scheme might
> be preferrable, but it should somehow be self-delimiting.
>
> For the above problem of indirect calls to noreturns, instead do:
>
>    .text
>    noretcalllabel:
>      call noreturn
>    othercall:
>      call really_special_thing
>    .section .annotate.noretcalls
>    .quad noretcalllabel, 1  # noreturn call
>    .quad othercall, 32      # call to some special(-ABI?) function
>
> Same thoughts re extensibility and self-delimitation apply.
>
> 1) jump tables
>
>>> Create an .annotate.jump_table section which is an array of the
>>> following variable-length structure:
>>>
>>>    struct annotate_jump_table {
>>> 	void *indirect_jmp;
>>> 	long num_targets;
>>> 	void *targets[];
>>>    };
> It's very often the case that the compiler already emits what your
> .targets[] member would encode, just at some unknown place, length and
> encoding.  So you would save space if you instead only remember the
> encoding and places of those jump tables:

We have found some anonymous information on x86 in .rodata.

I'm not sure if those are *all* of Josh wanted on x86, however for arm64 
we did not found that in the same section so it is a problem on arm64 now.

Does the compiler will emit these for all arches? At lease I tried and 
didn't find anything meaningful (maybe I omitted it).


Best,

Chen

> struct {
>    void *indirect_jump;
>    long num_tables;
>    struct {
>      unsigned num_entries;
>      unsigned encoding;
>      void *start_of_table;
>    } tables[];
> };
>
> The usual encodings are: direct, PC-relative, relative-to-start-of-table.
> Usually for a specific jump instruction there's only one table, so
> optimizing for that makes sense.  For strange unthought-of cases it's
> probably a good idea to have your initial scheme as fallback, which could
> be indicated by a special .encoding value.
>
>>> For example, given the following switch statement code:
>>>
>>>    .Lswitch_jmp:
>>> 	// %rax is .Lcase_1 or .Lcase_2
>>> 	jmp %rax
> So, usually %rax would point into a table (somewhere in .rodata/.text)
> that looks like so:
>
> .Ljump_table:
>   .quad .Lcase_1 - .Ljump_table
>   .quad .Lcase_2 - .Ljump_table
>
> (for position-independend code)
>
> and hence you would emit this as annotation:
>
> .quad .Lswitch_jmp
> .quad 1                   # only a single table
> .long 2                   # with two entries
> .long RELATIVE_TO_START   # all entries are X - start_of_table
> .quad .Ljump_table
>
> In this case you won't save anything of course, but as soon as there's a
> meaningful number of cases you will.
>
> Again, if that info would be put into an allocated section you would want
> to use relative encodings of the addresses to avoid runtime relocs.  And
> the remarks about self-delimitation and extensibility also apply here.
>
>>> Alternatives
>>> ------------
>>>
>>> Another idea which has been floated in the past is for objtool to read
>>> DWARF (or .eh_frame) to help it figure out the control flow.  That
>>> hasn't been tried yet, but would be considerably more difficult and
>>> fragile IMO.
> While noreturn functions are marked in the debug info, noreturn
> function types currently aren't quite correct.  And jump-tables aren't
> marked at all, so that would lose.
>
>
> Ciao,
> Michael.
