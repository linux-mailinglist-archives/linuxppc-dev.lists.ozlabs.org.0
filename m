Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16581325A98
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 01:12:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmqqX0s0Vz3d7n
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 11:12:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=LPFEZ0ux;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=LPFEZ0ux; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dmqq6042hz3ccP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 11:12:30 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id j24so4817058pfi.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 16:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=z8BTMazGGK2TLctP1ossQ7xBARbK7GuypnBnXjumP3Y=;
 b=LPFEZ0uxh+3GjC75ibd6xRxkgLJFBvqX1tgKt+cnAEx6Uh/ddOgSM+VlVFJF/DGYrc
 5YEDRpbas9sUQR8eSDkn2fwpWnz+PuYLCwyF5Kah9z8u5+O77XSqG08zk0QthMBXgADZ
 qpX5qImlg/O9lsAclmc51Zsz1r+Oc8udH74pY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=z8BTMazGGK2TLctP1ossQ7xBARbK7GuypnBnXjumP3Y=;
 b=O0oRUYP2UaTZ95QnAle41M2taDIpDPRE/+63KO7E+0GARdEOIPNNCN1E3EIw8EhEw7
 wz72s/vGPC5x1kaQGidnzPmoqloIjQdf6AE58IJ644gL6JrUaXX4tB+6aF7G8UeC2mKt
 /iVjvaQpVAbPzt+aKmOGUZgUHGmWScGI5Vgsn952xT2h3U/ZYqEFDz7PSYXYJ49HiKqo
 TzspN6uQ3Dwv6bcLagklddls9UNcLRjvyJPc/H3icw+CJKzFS3W/0YAOC7ebnJjpymD5
 qkP9vDfIwrqyjq+Pw+jlQRPz5GmyOqepbI7rFFXSra4L+ptcaYrMDfgvDsZlwgOoSG0Z
 jGnQ==
X-Gm-Message-State: AOAM531Eyqv14YntWz3P8zMW+ZDiaw0VbWrPKbOytEV++vhnfCa9bpSB
 gjR73ZvWMgxpC+3IQKRhsnq4iQ==
X-Google-Smtp-Source: ABdhPJw3SE8FnXcMtg6jHD28moX8mik6TTf3to5d/w+c1oJA8ufgqBvz5Wo4eT7ZXrvJlUBIqIyYOA==
X-Received: by 2002:a63:4e44:: with SMTP id o4mr447978pgl.46.1614298348205;
 Thu, 25 Feb 2021 16:12:28 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-0af1-7e55-275a-1dc8.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:af1:7e55:275a:1dc8])
 by smtp.gmail.com with ESMTPSA id p11sm6864866pjb.31.2021.02.25.16.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 16:12:27 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [RFC PATCH 4/8] powerpc/ppc_asm: use plain numbers for registers
In-Reply-To: <20210225152547.GE28121@gate.crashing.org>
References: <20210225031006.1204774-1-dja@axtens.net>
 <20210225031006.1204774-5-dja@axtens.net>
 <20210225152547.GE28121@gate.crashing.org>
Date: Fri, 26 Feb 2021 11:12:24 +1100
Message-ID: <87tupzoffb.fsf@dja-thinkpad.axtens.net>
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

> On Thu, Feb 25, 2021 at 02:10:02PM +1100, Daniel Axtens wrote:
>> This is dumb but makes the llvm integrated assembler happy.
>> https://github.com/ClangBuiltLinux/linux/issues/764
>
>> -#define	r0	%r0
>
>> +#define	r0	0
>
> This is a big step back (compare 9a13a524ba37).
>
> If you use a new enough GAS, you can use the -mregnames option and just
> say "r0" directly (so not define it at all, or define it to itself).
>
> ===
>         addi 3,3,3
>         addi r3,r3,3
>         addi %r3,%r3,3
>
>         addi 3,3,3
>         addi r3,r3,r3
>         addi %r3,%r3,%r3
> ===
>
> $ as t.s -o t.o -mregnames
> t.s: Assembler messages:
> t.s:6: Warning: invalid register expression
> t.s:7: Warning: invalid register expression
>
>
> Many people do not like bare numbers.  It is a bit like not wearing
> seatbelts (but so is all assembler code really: you just have to pay
> attention).  A better argument is that it is harder to read for people
> not used to assembler code like this.
>
> We used to have "#define r0 0" etc., and that was quite problematic.
> Like that "addi r3,r3,r3" example, but also, people wrote "r0" where
> only a plain 0 is allowed (like in "lwzx r3,0,r3": "r0" would be
> misleading there!)

So an overarching comment on all of these patches is that they're not
intended to be ready to merge, nor are they necessarily what I think is
the best solution. I'm just swinging a big hammer to see how far towards
LLVM_IAS=1 I can get on powerpc, and I accept I'm going to have to come
back and clean things up.

Anyway, noted, I'll push harder on trying to get llvm to accept %rN:
there was a patch that went in after llvm-11 that should help.

Kind regards,
Daniel
>
>
> Segher
