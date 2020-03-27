Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D68195B9E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 17:52:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pnwJ3zq5zDrGv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 03:52:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=maskray@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=YxmyRPWu; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pntH1wxkzDr4m
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 03:51:01 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id 23so4787232pfj.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 09:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FbILndaH9wxcdro/tpy0ww74A376uNHQB+w1NC7sjnM=;
 b=YxmyRPWu9yb31zgaJ36FisBzMWPtlMw7/Gwwzi9dALdtE9d97gPjPfz+XmDIxgb2bI
 AvYBvVRxFvJKyMSvE11dfwtEe2MpSLA+Zsag5z7p2Lt6z93C4jUR7Ps3Fli1q30Cbaa0
 /Xu13uf7O0RfWDbf5wehXfUnMKcYrZrl4/Yx3t5V1+DzZPMTK81GftpEsvWnm8FIcit3
 Z7u9unB7EqxIbL6KQ0lIacw21eBp4L8dSrTNM3qL+/0RnOvBvPjs1CO59R1/GCJvHlJT
 7Y6+gi3O9IzvzPHBu42HOgGlCQ9ailLl4/OqDodfs5yWW9RnhJrObZaVuqJ/fPJVk4zu
 /C+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FbILndaH9wxcdro/tpy0ww74A376uNHQB+w1NC7sjnM=;
 b=P5XU5NYXt6YCpJq5dN16QxLdc7lcuxQ/qwM4foGMVlS0pHd+28QlebluHIoHH3z4kA
 torW9DVp1VyA8Htl24MrMu2E/3lWoH7aWfRKJYGrk1ZWmWQltARRTqGgDdmgJH/QtsQc
 9ENmCrfvuEItlB23u50AKZaS+LZwSWQZwrr4ng6yiZIcOiqZFWuGtoDigVHR3zL2id8Y
 hTofGXO4hPu2JB4G6cs1zHhWX8PyVkMyiLMQw4IJyDDw1m9EbQfPj8yuidd+19YQ/ZbR
 O0bcm+z1PkUkCaG/oMWV5zSrMFLCR64fQ+2Qf14vPRaPLYOyFBaA/4TZHD11LC1fthnt
 FDzg==
X-Gm-Message-State: ANhLgQ1HbcMCJNY/+q/W5LYU1vZiQfFgl45IqlFMd6p3fZR0ITJjJE7S
 AUzMCYKXqnMQJt+U5uwoI4GHxg==
X-Google-Smtp-Source: ADFU+vsX8KgchzkWbRsBCR9awMtrEOo1aoz9FPzVyuKCfghz/LTbUqBoACGF/eqLth6qgbDVYjKKjw==
X-Received: by 2002:a63:1e4f:: with SMTP id p15mr243620pgm.28.1585327857879;
 Fri, 27 Mar 2020 09:50:57 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:0:9efe:9f1:9267:2b27])
 by smtp.gmail.com with ESMTPSA id e26sm4498196pfj.61.2020.03.27.09.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 09:50:57 -0700 (PDT)
Date: Fri, 27 Mar 2020 09:50:54 -0700
From: Fangrui Song <maskray@google.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2] powerpc/boot: Delete unneeded .globl _zimage_start
Message-ID: <20200327165054.67pzzjwtg3dc7hx2@google.com>
References: <20200325164257.170229-1-maskray@google.com>
 <20200326221625.GA22482@gate.crashing.org>
 <20200326222612.zbbiyi75emq6npzn@google.com>
 <20200327152428.GF22482@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200327152428.GF22482@gate.crashing.org>
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
Cc: Alan Modra <amodra@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux@googlegroups.com, Joel Stanley <joel@jms.id.au>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-03-27, Segher Boessenkool wrote:
>On Thu, Mar 26, 2020 at 03:26:12PM -0700, Fangrui Song wrote:
>> On 2020-03-26, Segher Boessenkool wrote:
>> >On Wed, Mar 25, 2020 at 09:42:57AM -0700, Fangrui Song wrote:
>> >>.globl sets the symbol binding to STB_GLOBAL while .weak sets the
>> >>binding to STB_WEAK. GNU as let .weak override .globl since binutils-gdb
>> >>5ca547dc2399a0a5d9f20626d4bf5547c3ccfddd (1996). Clang integrated
>> >>assembler let the last win but it may error in the future.
>> >
>> >GNU AS works for more than just ELF.  The way the assembler language
>> >is defined, it is not .weak overriding .globl -- instead, .weak sets a
>> >symbol attribute.  On an existing symbol (but it creates on if there is
>> >none yet).
>> >
>> >Clang is buggy if it does not allow valid (and perfectly normal)
>> >assembler code like this.
>>
>> https://sourceware.org/pipermail/binutils/2020-March/110399.html
>>
>> Alan: "I think it is completely fine for you to make the llvm assembler
>> error on inconsistent binding, or the last directive win.  Either of
>> those behaviours is logical and good, but you quite possibly will run
>> into a need to fix more user assembly.
>
>This would be fine and consistent behaviour, of course.  But it is not
>appropriate if you want to pretend to be compatible to GNU toolchains.

We aim for compatibility with GNU in many aspects to make it easier for
people to switch over. However, just because there is a subtle behavior
in GNU toolchain does not mean we need to emulate that behavior. With
all due respect, there are a large quantity of legacy behaviors we don't
want to support. Quite interestingly, many times such behaviors turn out
to be not well tested - they are documented by git blame/log.

Building kernel with another mature toolchain is a good way to shake out
code that relies on undefined/subtle behaviors. The efforts improve
health of the kernel.

It may be a bit more off-topic now. I am more confident on linker/binary
utilities side. Not emulating traditional behaviors turns out to be a
great success for lld (LLVM linker). We managed to create a linker with
23+k lines of code which is able to build a majority of software. In
FreeBSD ports, 32k pieces of software just work, 130+ packages are
marked as LLD_UNSAFE, but many should be safe (need developers' testing)
as of lld 9.

>Which is exactly why you want this kernel patch at all.  And the kernel
>can (in this case) accommodate your buggy assembler, sure, but are you
>going to "fix" all other programs with this "problem" as well?
>
>Segher

For this particularly case, A "blanked write privs" binutils maintainer
acknowledged clang integrated assembler's behavior. Another "blanked
write privs" (but inactive) binutils maintainer does not feel strong
about his decision made 24 years ago.  With respect, I should mention
that our design decisions do not need their approval.  That said, we
will be careful with the these decisions because the choices may affect
several companies and several larger code bases.

This is why I mentioned in my previous message that I want to
experiment. I will try out the error on some large code bases.  Nick may
be able to help on Android side. Additionally, we may get help from
FreeBSD folks.

If you subscribe to binutils@sourceware.org, you may find in recent
months I am quite active there. I am a very tiny contributor there but I
try to communicate clang/LLVM binary utilities/lld's discrepancy (in
terms of traditional behaviors) and report issues to binutils. Hope
clang's success can give incentive to improve binutils code health as
well.


Cheers,
Fangrui
