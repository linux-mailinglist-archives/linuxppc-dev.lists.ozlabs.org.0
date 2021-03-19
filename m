Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0C23412A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 03:15:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1nYn3tzrz3c3Q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 13:15:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Pa8NHg97;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Pa8NHg97; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1nYK3WQ8z2y6F
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 13:15:32 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso4080084pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 19:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=5Ku1iLHmVJKs9JYVZH7W21UFerjKVCttF9nIckB9gao=;
 b=Pa8NHg97dPAvvdMilIRJAAiB677IMee0DeGyTk6MkLLfR7uYxzzMKb/fl5xv+qMQZs
 Sx/1+XM/R0fpE10/6s+9fiPgFELIcjcm3Hib0KEmJR8Aw5xtCPR4P/T/VbOS+ZxGVVhj
 ohKYKfxXVHPiLLZdB9rNTpf5PxmE7nizYLZTQzgSJitKc3yCl4x1ehKLT9ChZczALaqo
 NdrLH2qAgQpsLhPjVpMAAjcATkRhikD6wFW/5y7f+PCLwlBNzgwX8jNp+Z5dGLxCadeE
 dQIc1mmBDN4JBr8I8XOOF3hZXq7mAlvz/hPDKznzlPyGJEA8uB3oA1MyRdJag+DJ3nOz
 n4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=5Ku1iLHmVJKs9JYVZH7W21UFerjKVCttF9nIckB9gao=;
 b=WsAVbVN30CGwECCu3yvCMq0PSkhh14p8z9uOObO4QVz+mn9Q57InNjP/NHrVvpbfoc
 bhwC1s6cJJgSN+NkVGxy2Hop0YHqy/OxsOJXnJH7E5gh5/RuSmVcgmgWBcdX56MjcQiu
 0XOGeeyX09mfXutgNr9rYKpvb34x3n4ITkBacHwAuy6cbI1TzU0yFrkl6CJgZwap6Kpz
 CV/9LhEUFqTd4NbvAB+x9ZDfC9p79It4d8xQHgEVOXnYlxaawEcOfyiBLJi1ouUzfym2
 3OWuHAhi2tm6wDNNUc0I+mesxeSmSusSZXW13KbdRN595f3HrReUaqVN2RZpJe53kgfo
 8vGQ==
X-Gm-Message-State: AOAM533b6M8Zs/0IGfTp2HytiXllhWUHCoWqu77PB0MFiMVrGnAMf90o
 q0rvvMGfpw2iPSeQsnTj68Z3IJ3/nFI=
X-Google-Smtp-Source: ABdhPJxSNeeOVtoOtv9C7rJACxYlOSLSkxkjaFFWrSTNoTyO6OclLruD55HmxX5CfIcnmCRgw18Prw==
X-Received: by 2002:a17:90b:686:: with SMTP id m6mr7173059pjz.26.1616120129604; 
 Thu, 18 Mar 2021 19:15:29 -0700 (PDT)
Received: from localhost ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id i4sm3714144pfo.14.2021.03.18.19.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 19:15:29 -0700 (PDT)
Date: Fri, 19 Mar 2021 12:15:23 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 8/8] powerpc/64/asm: don't reassign labels
To: Daniel Axtens <dja@axtens.net>, Segher Boessenkool
 <segher@kernel.crashing.org>
References: <20210225031006.1204774-1-dja@axtens.net>
 <20210225031006.1204774-9-dja@axtens.net>
 <20210225160857.GH28121@gate.crashing.org>
 <87lfbboeo9.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <87lfbboeo9.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Message-Id: <1616119819.nbj5blkf7y.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: llvmlinux@lists.linuxfoundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Daniel Axtens's message of February 26, 2021 10:28 am:
> Segher Boessenkool <segher@kernel.crashing.org> writes:
>=20
>> On Thu, Feb 25, 2021 at 02:10:06PM +1100, Daniel Axtens wrote:
>>> The assembler really does not like us reassigning things to the same
>>> label:
>>>=20
>>> <instantiation>:7:9: error: invalid reassignment of non-absolute variab=
le 'fs_label'
>>>=20
>>> This happens across a bunch of platforms:
>>> https://github.com/ClangBuiltLinux/linux/issues/1043
>>> https://github.com/ClangBuiltLinux/linux/issues/1008
>>> https://github.com/ClangBuiltLinux/linux/issues/920
>>> https://github.com/ClangBuiltLinux/linux/issues/1050
>>>=20
>>> There is no hope of getting this fixed in LLVM, so if we want to build
>>> with LLVM_IAS, we need to hack around it ourselves.
>>>=20
>>> For us the big problem comes from this:
>>>=20
>>> \#define USE_FIXED_SECTION(sname)				\
>>> 	fs_label =3D start_##sname;				\
>>> 	fs_start =3D sname##_start;				\
>>> 	use_ftsec sname;
>>>=20
>>> \#define USE_TEXT_SECTION()
>>> 	fs_label =3D start_text;					\
>>> 	fs_start =3D text_start;					\
>>> 	.text
>>>=20
>>> and in particular fs_label.
>>
>> The "Setting Symbols" super short chapter reads:
>>
>> "A symbol can be given an arbitrary value by writing a symbol, followed
>> by an equals sign '=3D', followed by an expression.  This is equivalent
>> to using the '.set' directive."
>>
>> And ".set" has
>>
>> "Set the value of SYMBOL to EXPRESSION.  This changes SYMBOL's value and
>> type to conform to EXPRESSION.  If SYMBOL was flagged as external, it
>> remains flagged.
>>
>> You may '.set' a symbol many times in the same assembly provided that
>> the values given to the symbol are constants.  Values that are based on
>> expressions involving other symbols are allowed, but some targets may
>> restrict this to only being done once per assembly.  This is because
>> those targets do not set the addresses of symbols at assembly time, but
>> rather delay the assignment until a final link is performed.  This
>> allows the linker a chance to change the code in the files, changing the
>> location of, and the relative distance between, various different
>> symbols.
>>
>> If you '.set' a global symbol, the value stored in the object file is
>> the last value stored into it."
>>
>> So this really should be fixed in clang: it is basic assembler syntax.
>=20
> No doubt I have explained this poorly.
>=20
> LLVM does allow some things, this builds fine for example:
>=20
> .set foo, 8192
> addi %r3, %r3, foo
> .set foo, 1234
> addi %r3, %r3, foo
>=20
> However, this does not:
>=20
> a:
> .set foo, a
> addi %r3, %r3, foo@l
> b:
> .set foo, b
> addi %r3, %r3, foo-a
>=20
> clang -target ppc64le -integrated-as  foo.s -o foo.o -c
> foo.s:5:11: error: invalid reassignment of non-absolute variable 'foo' in=
 '.set' directive
> .set foo, b
>           ^

So that does seem to be allowed by the specification.

I don't have a huge problem with the patch actually, doesn't seem too=20
bad.

Thanks,
Nick
