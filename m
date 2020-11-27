Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 316CE2C5E83
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 02:05:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChxHn61nyzDrTD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 12:05:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChxG305d1zDrGs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 12:03:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=JOk1lADl; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ChxG24Zt4z9s1l;
 Fri, 27 Nov 2020 12:03:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606439018;
 bh=hoqIDMkuU2PeBm8mWNl2nlqMx6LB3Iu4CGrcmAqyL/o=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JOk1lADlMP7NcVMzJrCOGK9PfXDtlkTrThV5s+cuHsTYDNeo/9vIn+RQtozMBH4kT
 fTfuC15n5O5W+gCgYy+skK6uXL0ZCHW+NRCAVML+lMHH+QOnywL+iBuP295Ct5g5eq
 uV/ZN+NnZDNmXFAYka93Dav4JFSRMy+gCgm8U2PTDoX9EIKRBcVL0ITE680QxK1qhV
 rOxXEk3FgGDI4rysy26v/UlkmQ4UGWrc3buYPpTsHz3XyK214mKHqitJ1UuLmZYD2a
 0y/HEYlouAlDQNQeQJAxr6g4Juhu41O8qxHl4f3oQeeQ9BTanLOR9kiwmCPcuzfl9o
 +XRC4YXfeor0w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Bill Wendling <morbo@google.com>
Subject: Re: [PATCH v3 3/3] powerpc/64s: feature: Work around inline asm issues
In-Reply-To: <CAGG=3QUSF4UwcZQHhFE-PW6As7GVJknsyGkgVMENDXghABzy5A@mail.gmail.com>
References: <20201118223513.2704722-1-morbo@google.com>
 <20201120224034.191382-1-morbo@google.com>
 <20201120224034.191382-4-morbo@google.com>
 <87d0041vaf.fsf@mpe.ellerman.id.au> <20201123063432.GG2672@gate.crashing.org>
 <CAGG=3QVjSAwU+ebvH=Lk5YVMxW7=ThvkJXGPw+95nYxxuurMig@mail.gmail.com>
 <20201123195622.GI2672@gate.crashing.org>
 <CAGG=3QXR=Yfh8PNa4m-kQLTBP4YKD8OGm_6fSUgeasQ1ar9b2g@mail.gmail.com>
 <20201123200846.GJ2672@gate.crashing.org>
 <CAGG=3QUeXTU+8jqw40W_rhatsHCRiuTboL3enz9bpt_jaJC3TA@mail.gmail.com>
 <87zh37zaf4.fsf@mpe.ellerman.id.au>
 <CAGG=3QUSF4UwcZQHhFE-PW6As7GVJknsyGkgVMENDXghABzy5A@mail.gmail.com>
Date: Fri, 27 Nov 2020 12:03:38 +1100
Message-ID: <87ft4vy5jp.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bill Wendling <morbo@google.com> writes:
> On Mon, Nov 23, 2020 at 7:44 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>> Bill Wendling <morbo@google.com> writes:
>> > On Mon, Nov 23, 2020 at 12:10 PM Segher Boessenkool
>> > <segher@kernel.crashing.org> wrote:
>> >> On Mon, Nov 23, 2020 at 12:01:01PM -0800, Bill Wendling wrote:
>> >> > On Mon, Nov 23, 2020 at 11:58 AM Segher Boessenkool
>> >> > <segher@kernel.crashing.org> wrote:
>> >> > > > On Sun, Nov 22, 2020 at 10:36 PM Segher Boessenkool
>> >> > > > <segher@kernel.crashing.org> wrote:
>> >> > > > > "true" (as a result of a comparison) in as is -1, not 1.
>> >> > >
>> >> > > On Mon, Nov 23, 2020 at 11:43:11AM -0800, Bill Wendling wrote:
>> >> > > > What Segher said. :-) Also, if you reverse the comparison, you'll get
>> >> > > > a build error.
>> >> > >
>> >> > > But that means your patch is the wrong way around?
>> >> > >
>> >> > > -       .ifgt (label##4b- label##3b)-(label##2b- label##1b);    \
>> >> > > -       .error "Feature section else case larger than body";    \
>> >> > > -       .endif;                                                 \
>> >> > > +       .org . - ((label##4b-label##3b) > (label##2b-label##1b)); \
>> >> > >
>> >> > > It should be a + in that last line, not a -.
>> >> >
>> >> > I said so in a follow up email.
>> >>
>> >> Yeah, and that arrived a second after I pressed "send" :-)
>> >>
>> > Michael, I apologize for the churn with these patches. I believe the
>> > policy is to resend the match as "v4", correct?
>> >
>> > I ran tests with the change above. It compiled with no error. If I
>> > switch the labels around to ".org . + ((label##2b-label##1b) >
>> > (label##4b-label##3b))", then it fails as expected.
>>
>> I wanted to retain the nicer error reporting for gcc builds, so I did it
>> like this:
>>
>> diff --git a/arch/powerpc/include/asm/feature-fixups.h b/arch/powerpc/include/asm/feature-fixups.h
>> index b0af97add751..c4ad33074df5 100644
>> --- a/arch/powerpc/include/asm/feature-fixups.h
>> +++ b/arch/powerpc/include/asm/feature-fixups.h
>> @@ -36,6 +36,24 @@ label##2:                                            \
>>         .align 2;                                       \
>>  label##3:
>>
>> +
>> +#ifndef CONFIG_CC_IS_CLANG
>> +#define CHECK_ALT_SIZE(else_size, body_size)                   \
>> +       .ifgt (else_size) - (body_size);                        \
>> +       .error "Feature section else case larger than body";    \
>> +       .endif;
>> +#else
>> +/*
>> + * If we use the ifgt syntax above, clang's assembler complains about the
>> + * expression being non-absolute when the code appears in an inline assembly
>> + * statement.
>> + * As a workaround use an .org directive that has no effect if the else case
>> + * instructions are smaller than the body, but fails otherwise.
>> + */
>> +#define CHECK_ALT_SIZE(else_size, body_size)                   \
>> +       .org . + ((else_size) > (body_size));
>> +#endif
>> +
>>  #define MAKE_FTR_SECTION_ENTRY(msk, val, label, sect)          \
>>  label##4:                                                      \
>>         .popsection;                                            \
>> @@ -48,9 +66,7 @@ label##5:                                                     \
>>         FTR_ENTRY_OFFSET label##2b-label##5b;                   \
>>         FTR_ENTRY_OFFSET label##3b-label##5b;                   \
>>         FTR_ENTRY_OFFSET label##4b-label##5b;                   \
>> -       .ifgt (label##4b- label##3b)-(label##2b- label##1b);    \
>> -       .error "Feature section else case larger than body";    \
>> -       .endif;                                                 \
>> +       CHECK_ALT_SIZE((label##4b-label##3b), (label##2b-label##1b)); \
>>         .popsection;
>>
>>
>>
>> I've pushed a branch with all your patches applied to:
>>
>>   https://github.com/linuxppc/linux/commits/next-test
>>
> This works for me. Thanks!

Great.

>> Are you able to give that a quick test? It builds clean with clang for
>> me, but we must be using different versions of clang because my branch
>> already builds clean for me even without your patches.
>>
> You may need to set LLVM_IAS=1 to get the behavior I'm seeing. That
> turns on clang's integrated assembler, which I think is disabled by
> default.

Yep that does it.

But then I get:
  clang: error: unsupported argument '-mpower4' to option 'Wa,'
  clang: error: unsupported argument '-many' to option 'Wa,'

So I guess I'm still missing something?

> Note that with clang's integrated assembler, arch/powerpc/boot/util.S
> fails to compile. Alan Modra mentioned that he sent you a patch to
> "modernize" the file so that clang can compile it.

Ah you're right he did, it didn't go to patchwork so I missed it. Have
grabbed it now.

cheers
