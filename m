Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 008A8325AEE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 01:29:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmrBD6dNWz3dGd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 11:29:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=Jrc1ftLr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=Jrc1ftLr; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dmr9p6JSnz3d4J
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 11:28:44 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d12so2327835pfo.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 16:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=9n+XdMotdP9A1xK7A89yGRvTsUAcStJDkovbGy+nQYI=;
 b=Jrc1ftLrCS430EJPjRKnRBu3h20BaqC9EOmWPS/RMjc6SmR4/bdJX7a/UGAAH7ew3K
 H40iNRRlR7x8jbFSm1+RgwugMm9tHSPSIRp6+i80ZVTN628QYbtu35yWJMoi6qLhVWdY
 BTX3hF9cAzXPY0as/I3QTIGbfJV1dWODfkTfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=9n+XdMotdP9A1xK7A89yGRvTsUAcStJDkovbGy+nQYI=;
 b=k1lEF9qWOPzERD3qy5lcDk5vK5zbfVjtsep7iVeFd4WF9jLThlrSGWZkN9rPdyPJ09
 uuKsP0QrToMfcR8zKmPQOhKnAShFQaVsmadI2uTpOuKn6LXUEltInfDjaXA12pS4L2CY
 ohSfQnZ8HpyjLBYbxAznk0TZtsaYIUbC/vwvkbYQ2rrZmZuzikpeznklLJkCiEZ0eVH8
 LF3A7zmfNj9tvo+ZiIdz/JzuphYIvlJ09KyCX+Mv5SNCZjJc0cGPWO6g+HhtQHmsNr46
 ODb2syyd+ED7qmtnkXzvgmaeUI6xJFCyhR+oWp2sL4MC7I9aAUz2A6Cslr1DbmuIdLEU
 yAcg==
X-Gm-Message-State: AOAM5302hFirpgVY0ihkbPpRLf2Xg1dIWhnzzQanOoZxcsvfk4FB6Hcg
 ThRE9adRl4zy1WQRtb+Aja6SPQ==
X-Google-Smtp-Source: ABdhPJwIt6Xw/6vgpJ3Q6Bt/29apD+sBA168x1ampMV6jt1OM9EYYTjxQwQvW7OPfxsXjYxYXTwD/g==
X-Received: by 2002:a65:6417:: with SMTP id a23mr471335pgv.430.1614299321422; 
 Thu, 25 Feb 2021 16:28:41 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-0af1-7e55-275a-1dc8.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:af1:7e55:275a:1dc8])
 by smtp.gmail.com with ESMTPSA id ch15sm1339094pjb.46.2021.02.25.16.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 16:28:41 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [RFC PATCH 8/8] powerpc/64/asm: don't reassign labels
In-Reply-To: <20210225160857.GH28121@gate.crashing.org>
References: <20210225031006.1204774-1-dja@axtens.net>
 <20210225031006.1204774-9-dja@axtens.net>
 <20210225160857.GH28121@gate.crashing.org>
Date: Fri, 26 Feb 2021 11:28:38 +1100
Message-ID: <87lfbboeo9.fsf@dja-thinkpad.axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, llvmlinux@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:

> On Thu, Feb 25, 2021 at 02:10:06PM +1100, Daniel Axtens wrote:
>> The assembler really does not like us reassigning things to the same
>> label:
>> 
>> <instantiation>:7:9: error: invalid reassignment of non-absolute variable 'fs_label'
>> 
>> This happens across a bunch of platforms:
>> https://github.com/ClangBuiltLinux/linux/issues/1043
>> https://github.com/ClangBuiltLinux/linux/issues/1008
>> https://github.com/ClangBuiltLinux/linux/issues/920
>> https://github.com/ClangBuiltLinux/linux/issues/1050
>> 
>> There is no hope of getting this fixed in LLVM, so if we want to build
>> with LLVM_IAS, we need to hack around it ourselves.
>> 
>> For us the big problem comes from this:
>> 
>> \#define USE_FIXED_SECTION(sname)				\
>> 	fs_label = start_##sname;				\
>> 	fs_start = sname##_start;				\
>> 	use_ftsec sname;
>> 
>> \#define USE_TEXT_SECTION()
>> 	fs_label = start_text;					\
>> 	fs_start = text_start;					\
>> 	.text
>> 
>> and in particular fs_label.
>
> The "Setting Symbols" super short chapter reads:
>
> "A symbol can be given an arbitrary value by writing a symbol, followed
> by an equals sign '=', followed by an expression.  This is equivalent
> to using the '.set' directive."
>
> And ".set" has
>
> "Set the value of SYMBOL to EXPRESSION.  This changes SYMBOL's value and
> type to conform to EXPRESSION.  If SYMBOL was flagged as external, it
> remains flagged.
>
> You may '.set' a symbol many times in the same assembly provided that
> the values given to the symbol are constants.  Values that are based on
> expressions involving other symbols are allowed, but some targets may
> restrict this to only being done once per assembly.  This is because
> those targets do not set the addresses of symbols at assembly time, but
> rather delay the assignment until a final link is performed.  This
> allows the linker a chance to change the code in the files, changing the
> location of, and the relative distance between, various different
> symbols.
>
> If you '.set' a global symbol, the value stored in the object file is
> the last value stored into it."
>
> So this really should be fixed in clang: it is basic assembler syntax.

No doubt I have explained this poorly.

LLVM does allow some things, this builds fine for example:

.set foo, 8192
addi %r3, %r3, foo
.set foo, 1234
addi %r3, %r3, foo

However, this does not:

a:
.set foo, a
addi %r3, %r3, foo@l
b:
.set foo, b
addi %r3, %r3, foo-a

clang -target ppc64le -integrated-as  foo.s -o foo.o -c
foo.s:5:11: error: invalid reassignment of non-absolute variable 'foo' in '.set' directive
.set foo, b
          ^

gas otoh, has no issues with reassignment:

$ powerpc64-linux-gnu-as foo.s -c -o foo.o
$ powerpc64-linux-gnu-objdump -dr foo.o

foo.o:     file format elf64-powerpc


Disassembly of section .text:

0000000000000000 <a>:
   0:	38 63 00 00 	addi    r3,r3,0
			2: R_PPC64_ADDR16_LO	.text

0000000000000004 <b>:
   4:	38 63 00 04 	addi    r3,r3,4


It seems the llvm assembler only does a single pass, so they're not keen
on trying to support reassigning labels with non-absolute values.

Kind regards,
Daniel

>
> Segher
