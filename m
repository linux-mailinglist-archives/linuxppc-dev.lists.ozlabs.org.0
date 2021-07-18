Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCAB3CCA38
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Jul 2021 20:07:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GSXyB0KKtz30CZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 04:07:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jbhtnjp4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=radu.rendec@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jbhtnjp4; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GSXxb52B1z2yN4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jul 2021 04:07:13 +1000 (AEST)
Received: by mail-qk1-x734.google.com with SMTP id t185so14499106qkd.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jul 2021 11:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=ty75JegD1P7PK3lGjxE6rRjOfvMEUFoRgBKC/+Jw6I4=;
 b=jbhtnjp4uwXVufgYOE9aQoohZITMpMrI/YzUda5mCD9LWGiQKMzpIm9nGbTm2b+2yB
 WGKhSxMLt038J/m7WRm0fS8MTldZqTW77o29GOGLVhN9FaS5hpAWuLFzumkM93g54T5Y
 1y5qXWKgucowXQH8KDKjiLJIQLk57VR5wQc1EKCtUaXQhYM6D0+HI5fLCY2qlwBxw77b
 NNgMUIZXWCixvlpSvwmW/HSqIPtx2goRgcwVuW8yr3RWN1fG8dtDq0Amvu10gJ5O2W/j
 khJCjimvshBGJQ6PT0+n9b02NBhO1JzxBsvHThd7sqbMXBIuaVo/YPzap84E67po8rEc
 ZLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=ty75JegD1P7PK3lGjxE6rRjOfvMEUFoRgBKC/+Jw6I4=;
 b=RDlMmI7eQrFchN8Kn8ypV1FUhxJX57qhO1wuZ+xGyWDNuswKpIFfuBAED8dRtsengt
 Ly9bJTTFtXNEJJSRmzP7sjhlO4KykbDT467gauX3Nb/+nIp15YqhbXA1EKkjaGqd26Fw
 myVnPgGySHbk/Q2z3i/Dwk4xvbrV1L8xU+UdY1FZA98WK34SsBjAf3Qo1NYNyjzNNWFA
 lPrN3w2l4UhskwFWR3XBJoTr4nP1gtIn3ibC2+BmJIbGrCm5S2MICjwdLcGs/VZJrpvZ
 WhfmCK2nsVEQaWYITHvYh65cg8LnQblIVE6ZWOJHYD41PpVEQErS3PCyuikHxuxl20UK
 52IA==
X-Gm-Message-State: AOAM533/c6kYsBPDireTOQh1/P+Dfjh9Dzk3ypRKOOjyAmz+z1nd9Y1F
 EIxs86guh6uWFskXsYpMqrY=
X-Google-Smtp-Source: ABdhPJxbMLeL2lZyjznzhmX6wFSzd+W5SjIX1+vNL37DyBdxdtJfaO8px60KGv/R4v+KmqHqO3JkvQ==
X-Received: by 2002:a37:e109:: with SMTP id c9mr692175qkm.480.1626631629650;
 Sun, 18 Jul 2021 11:07:09 -0700 (PDT)
Received: from bat.mindbit.ro (cpe00fc8d79db03-cm00fc8d79db00.cpe.net.fido.ca.
 [72.137.118.157])
 by smtp.gmail.com with ESMTPSA id o24sm4967076qtt.21.2021.07.18.11.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 11:07:09 -0700 (PDT)
Message-ID: <0c3f35e18b6ceeed0e8a2792f5c76b4fcb0a6c1d.camel@gmail.com>
Subject: Re: [PATCH 0/1] PPC32: fix ptrace() access to FPU registers
From: Radu Rendec <radu.rendec@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Daniel Axtens
 <dja@axtens.net>, Andreas Schwab <schwab@linux-m68k.org>
Date: Sun, 18 Jul 2021 14:07:07 -0400
In-Reply-To: <20b6bdebae736b48814c1d600024546b7c604e3c.camel@gmail.com>
References: <20190610232758.19010-1-radu.rendec@gmail.com>
 <87r27t2el0.fsf@dja-thinkpad.axtens.net>
 <5fcdb5767b7cf4c7d5b7496c0032021e43115d39.camel@gmail.com>
 <87muif2y4l.fsf@dja-thinkpad.axtens.net>
 <fbf9f9cbb99fc40c7d7af86fee3984427c61b799.camel__46559.9162316479$1560860409$gmane$org@gmail.com>
 <875zp2rcip.fsf@igel.home> <87k1di2yxg.fsf@dja-thinkpad.axtens.net>
 <fd936660cde0d5f151b732d0f885ddf0b6ba67eb.camel@gmail.com>
 <39d6eb22-2142-d869-7649-0242cecf5532@csgroup.eu>
 <20b6bdebae736b48814c1d600024546b7c604e3c.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 Oleg Nesterov <oleg@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2021-06-11 at 10:37 -0400, Radu Rendec wrote:
>On Fri, 2021-06-11 at 08:02 +0200, Christophe Leroy wrote:
>>Le 19/06/2019 à 14:57, Radu Rendec a écrit :
>>> On Wed, 2019-06-19 at 10:36 +1000, Daniel Axtens wrote:
>>>> Andreas Schwab <
>>>> schwab@linux-m68k.org
>>>>> writes:
>>>>
>>>>> On Jun 18 2019, Radu Rendec <
>>>>> radu.rendec@gmail.com
>>>>>> wrote:
>>>>>
>>>>>> Since you already have a working setup, it would be nice if you could
>>>>>> add a printk to arch_ptrace() to print the address and confirm what I
>>>>>> believe happens (by reading the gdb source code).
>>>>>
>>>>> A ppc32 ptrace syscall goes through compat_arch_ptrace.
>>>
>>> Right. I completely overlooked that part.
>>>
>>>> Ah right, and that (in ptrace32.c) contains code that will work:
>>>>
>>>>
>>>> 			/*
>>>> 			 * the user space code considers the floating point
>>>> 			 * to be an array of unsigned int (32 bits) - the
>>>> 			 * index passed in is based on this assumption.
>>>> 			 */
>>>> 			tmp = ((unsigned int *)child->thread.fp_state.fpr)
>>>> 				[FPRINDEX(index)];
>>>>
>>>> FPRINDEX is defined above to deal with the various manipulations you
>>>> need to do.
>>>
>>> Correct. Basically it does the same that I did in my patch: it divides
>>> the index again by 2 (it's already divided by 4 in compat_arch_ptrace()
>>> so it ends up divided by 8), then takes the least significant bit and
>>> adds it to the index. I take bit 2 of the original address, which is the
>>> same thing (because in FPRHALF() the address is already divided by 4).
>>>
>>> So we have this in ptrace32.c:
>>>
>>> #define FPRNUMBER(i) (((i) - PT_FPR0) >> 1)
>>> #define FPRHALF(i) (((i) - PT_FPR0) & 1)
>>> #define FPRINDEX(i) TS_FPRWIDTH * FPRNUMBER(i) * 2 + FPRHALF(i)
>>>
>>> index = (unsigned long) addr >> 2;
>>> (unsigned int *)child->thread.fp_state.fpr)[FPRINDEX(index)]
>>>
>>>
>>> And we have this in my patch:
>>>
>>> fpidx = (addr - PT_FPR0 * sizeof(long)) / 8;
>>> (void *)&child->thread.TS_FPR(fpidx) + (addr & 4)
>>>
>>>> Radu: I think we want to copy that working code back into ptrace.c.
>>>
>>> I'm not sure that would work. There's a subtle difference: the code in
>>> ptrace32.c is always compiled on a 64-bit kernel and the user space
>>> calling it is always 32-bit; on the other hand, the code in ptrace.c can
>>> be compiled on either a 64-bit kernel or a 32-bit kernel and the user
>>> space calling it always has the same "bitness" as the kernel.
>>>
>>> One difference is the size of the CPU registers. On 64-bit they are 8
>>> byte long and user space knows that and generates 8-byte aligned
>>> addresses. So you have to divide the address by 8 to calculate the CPU
>>> register index correctly, which compat_arch_ptrace() currently doesn't.
>>>
>>> Another difference is that on 64-bit `long` is 8 bytes, so user space
>>> can read a whole FPU register in a single ptrace call.
>>>
>>> Now that we are all aware of compat_arch_ptrace() (which handles the
>>> special case of a 32-bit process running on a 64-bit kernel) I would say
>>> the patch is correct and does the right thing for both 32-bit and 64-bit
>>> kernels and processes.
>>>
>>>> The challenge will be unpicking the awful mess of ifdefs in ptrace.c
>>>> and making it somewhat more comprehensible.
>>>
>>> I'm not sure what ifdefs you're thinking about. The only that are used
>>> inside arch_ptrace() are PT_FPR0, PT_FPSCR and TS_FPR, which seem to be
>>> correct.
>>>
>>> But perhaps it would be useful to change my patch and add a comment just
>>> before arch_ptrace() that explains how the math is done and that the
>>> code must work on both 32-bit and 64-bit, the user space address
>>> assumptions, etc.
>>>
>>> By the way, I'm not sure the code in compat_arch_ptrace() handles
>>> PT_FPSCR correctly. It might (just because fpscr is right next to fpr[]
>>> in memory - and that's a hack), but I can't figure out if it accesses
>>> the right half.
>>>
>>
>>Does the issue still exists ? If yes, the patch has to be rebased.
>
>Hard to say. I'm still using 4.9 (stable) on the systems that I created
>the patch for. I tried to rebase, and the patch no longer applies. It
>looks like there have been some changes around that area, notably your
>commit e009fa433542, so it could actually be fixed now.
>
>It's been exactly two years since I sent the patch and I don't remember
>all the details. I will have to go back and look. Also, running a recent
>kernel on my PPC32 systems is not an option because there are a bunch of
>custom patches that would have to be ported. I will try in a VM and get
>back to you, hopefully early next week.

I finally had time to test everything properly. I can now confirm that
the original problem no longer exists, so the patch doesn't need to be
rebased.

I tested all three variants: 32-bit program on 32-bit kernel, 32-bit
program on 64-bit kernel and 64-bit program on 64-bit kernel.

Best regards,
Radu


