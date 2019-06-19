Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 479294B93E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 14:59:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TQ5B1ndYzDql9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 22:59:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=radu.rendec@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hLeV4z41"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TQ2d3jn0zDqk7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:57:12 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id s7so37777110iob.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 05:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=fP5qSgJSDgK9U6LJ8lVXJsGqac/WrRbssr2rRHgbGvA=;
 b=hLeV4z41l1xb1l3V6ymmGrRGMXrRmExc6E4GXCoUYnkpdOwp97hOuvt8auVxC1E18x
 wTeaIDZDZ6O15bW2pjJ1B2gqzxn/R1aESBe1ZD5XvVe3hSFDehev6wYBfDoBH8MDZfMn
 LnJ7ExOEKHg0SEv/y1a5qiFlnGmZSiQpwTTwpXnoYBTstyZoTQsOwO+6353aBWDxcNAF
 fiFoMoza2ytmm04vhj7Y8+IFc+QAowmg+srbyHZXOosyzIyzwE99VfPC0AVdQQMk+biR
 FtMwM02DbVmBfmvE8c5FjM+jwz381OrK/juMIzspWRBYIzLwIDXb6O4z4I/w2yOvULPk
 RZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=fP5qSgJSDgK9U6LJ8lVXJsGqac/WrRbssr2rRHgbGvA=;
 b=R0zoGwXIqlrw4PkV6+aTfxtWWaw8oIbd6XWxG6Ss8IePOPSRTeJ/H8T4gUS+ZLGuv0
 mSHWkY0dkZrtu4swFuJx6V8k6PZmItPC9hZasXUwPR1ifgWDZq6Nz+TPH4aqR3TUmgPy
 yFfEMwpPn4ZpVLrZ6a9ka1BWX+ZiBaLTUvHEAU4PJ7NQ9JbLi4CojxtMjCoLiBxhwPBm
 +ebCRcDI/fE7Isj6tmXN0nvMYMj9sJZ3tPzWQQNn8oHVdKYv8VUq424kG0qBO0jFwox/
 Xt5+7c0yPFVYLn5H2co/lbKLuAXwUvTanwxFl8lCMMS0jFvUznFEfVBZB98ZlH4okyps
 7o9Q==
X-Gm-Message-State: APjAAAXkYsB7EeV6qFv2wuwPKdwUpbmSMhnGJ4Zv7GgrFa4n752L2d+6
 fV5smrKfTiDrNXHXU5qpo1Y=
X-Google-Smtp-Source: APXvYqy718WPm+O8VYDj79HVDS0LKIOywyOW+P6ycDrD2y8S3opxXLsC3s2Vgcvm9506WJJUzOH8Ow==
X-Received: by 2002:a5d:948f:: with SMTP id v15mr86373851ioj.93.1560949029486; 
 Wed, 19 Jun 2019 05:57:09 -0700 (PDT)
Received: from bat.mindbit.ro (CPE00fc8d79db03-CM00fc8d79db00.cpe.net.fido.ca.
 [72.140.67.131])
 by smtp.gmail.com with ESMTPSA id c17sm13746913ioo.82.2019.06.19.05.57.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 05:57:09 -0700 (PDT)
Message-ID: <fd936660cde0d5f151b732d0f885ddf0b6ba67eb.camel@gmail.com>
Subject: Re: [PATCH 0/1] PPC32: fix ptrace() access to FPU registers
From: Radu Rendec <radu.rendec@gmail.com>
To: Daniel Axtens <dja@axtens.net>, Andreas Schwab <schwab@linux-m68k.org>
Date: Wed, 19 Jun 2019 08:57:07 -0400
In-Reply-To: <87k1di2yxg.fsf@dja-thinkpad.axtens.net>
References: <20190610232758.19010-1-radu.rendec@gmail.com>
 <87r27t2el0.fsf@dja-thinkpad.axtens.net>
 <5fcdb5767b7cf4c7d5b7496c0032021e43115d39.camel@gmail.com>
 <87muif2y4l.fsf@dja-thinkpad.axtens.net>
 <fbf9f9cbb99fc40c7d7af86fee3984427c61b799.camel__46559.9162316479$1560860409$gmane$org@gmail.com>
 <875zp2rcip.fsf@igel.home> <87k1di2yxg.fsf@dja-thinkpad.axtens.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Oleg Nesterov <oleg@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-06-19 at 10:36 +1000, Daniel Axtens wrote:
> Andreas Schwab <
> schwab@linux-m68k.org
> > writes:
> 
> > On Jun 18 2019, Radu Rendec <
> > radu.rendec@gmail.com
> > > wrote:
> > 
> > > Since you already have a working setup, it would be nice if you could
> > > add a printk to arch_ptrace() to print the address and confirm what I
> > > believe happens (by reading the gdb source code).
> > 
> > A ppc32 ptrace syscall goes through compat_arch_ptrace.

Right. I completely overlooked that part.

> Ah right, and that (in ptrace32.c) contains code that will work:
> 
> 
> 			/*
> 			 * the user space code considers the floating point
> 			 * to be an array of unsigned int (32 bits) - the
> 			 * index passed in is based on this assumption.
> 			 */
> 			tmp = ((unsigned int *)child->thread.fp_state.fpr)
> 				[FPRINDEX(index)];
> 
> FPRINDEX is defined above to deal with the various manipulations you
> need to do.

Correct. Basically it does the same that I did in my patch: it divides
the index again by 2 (it's already divided by 4 in compat_arch_ptrace()
so it ends up divided by 8), then takes the least significant bit and
adds it to the index. I take bit 2 of the original address, which is the
same thing (because in FPRHALF() the address is already divided by 4).

So we have this in ptrace32.c:

#define FPRNUMBER(i) (((i) - PT_FPR0) >> 1)
#define FPRHALF(i) (((i) - PT_FPR0) & 1)
#define FPRINDEX(i) TS_FPRWIDTH * FPRNUMBER(i) * 2 + FPRHALF(i)

index = (unsigned long) addr >> 2;
(unsigned int *)child->thread.fp_state.fpr)[FPRINDEX(index)]


And we have this in my patch:

fpidx = (addr - PT_FPR0 * sizeof(long)) / 8;
(void *)&child->thread.TS_FPR(fpidx) + (addr & 4)

> Radu: I think we want to copy that working code back into ptrace.c. 

I'm not sure that would work. There's a subtle difference: the code in
ptrace32.c is always compiled on a 64-bit kernel and the user space
calling it is always 32-bit; on the other hand, the code in ptrace.c can
be compiled on either a 64-bit kernel or a 32-bit kernel and the user
space calling it always has the same "bitness" as the kernel.

One difference is the size of the CPU registers. On 64-bit they are 8
byte long and user space knows that and generates 8-byte aligned
addresses. So you have to divide the address by 8 to calculate the CPU
register index correctly, which compat_arch_ptrace() currently doesn't.

Another difference is that on 64-bit `long` is 8 bytes, so user space
can read a whole FPU register in a single ptrace call. 

Now that we are all aware of compat_arch_ptrace() (which handles the
special case of a 32-bit process running on a 64-bit kernel) I would say
the patch is correct and does the right thing for both 32-bit and 64-bit 
kernels and processes.

> The challenge will be unpicking the awful mess of ifdefs in ptrace.c
> and making it somewhat more comprehensible.

I'm not sure what ifdefs you're thinking about. The only that are used
inside arch_ptrace() are PT_FPR0, PT_FPSCR and TS_FPR, which seem to be
correct.

But perhaps it would be useful to change my patch and add a comment just
before arch_ptrace() that explains how the math is done and that the
code must work on both 32-bit and 64-bit, the user space address
assumptions, etc.

By the way, I'm not sure the code in compat_arch_ptrace() handles
PT_FPSCR correctly. It might (just because fpscr is right next to fpr[]
in memory - and that's a hack), but I can't figure out if it accesses
the right half.

Radu


