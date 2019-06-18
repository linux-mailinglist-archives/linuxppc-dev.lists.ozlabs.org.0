Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F0549918
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 08:44:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Sdpx2J5tzDqPM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 16:44:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="a74D8leL"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SdmN4K9dzDqSp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 16:42:11 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id c85so7069996pfc.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 23:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=1NcWq5841L5VeJU6k0iXjB/afaM7a8O12Xs6Mhi8aW8=;
 b=a74D8leLqUbAKzBhSuMkA6kJpoWL52j5douxhCB6e4IPFxf9Zbgkm+hlEl1Op4a6L4
 ZvCNoT+W0oQt16vJlwRv0s0uYibtF88LlHXe9euB8+6SrT/hM9Kthb8BsKd7PHJK0yPI
 2d99YKnxkkcon2NpuWzIoAd79p+nCXr1bnPN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=1NcWq5841L5VeJU6k0iXjB/afaM7a8O12Xs6Mhi8aW8=;
 b=bLZCZrJTvBbnxxaD9mnEIdyeLSYI1OSkAyf8Pe22hYZbTzE6aYa7CtMnE5TS/NDYam
 hRsyEx7PjAOWzX1T6SIHAeB0EZWexpiqPtRhwj4hTIMsy5vyYl4deFReBIZsuZYGj/Tf
 GneJdkqMbFhmMLM0vTwWFp7WQMUUCx0ZSyG24RHV/40fZMfTCtsAuc/BmbPo/fcGDDyg
 shcLntazt95NEVv4jRnbYsipD3xPQjkJbENMXZk50aDZvgRrOxe7WeaX2Fv3lb/MvP0h
 CmxtrB3j9U/Z7ED6qGJyhE8g1JfYcPO4I7iVeA/O/4wMrO2//ViKj04Qtu/ClXu3e/Mf
 ke1w==
X-Gm-Message-State: APjAAAV2tDQgS6xmmgXDPaS97pPvdWpzD54zyANKQGFUlmlHN4EXYaW8
 al69wjzlG2v5s5kSjyncOav6iw==
X-Google-Smtp-Source: APXvYqzdgYUjXJhiaF7a9BwI2j8itBA3oZ6Oz4ZJibxFvGT+M4YHKSSUCWuEQKH4Ig88HOUZ2wxRCA==
X-Received: by 2002:a17:90a:374f:: with SMTP id
 u73mr3391436pjb.4.1560840128715; 
 Mon, 17 Jun 2019 23:42:08 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id p6sm23135542pgs.77.2019.06.17.23.42.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 23:42:07 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Radu Rendec <radu.rendec@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/1] PPC32: fix ptrace() access to FPU registers
In-Reply-To: <5fcdb5767b7cf4c7d5b7496c0032021e43115d39.camel@gmail.com>
References: <20190610232758.19010-1-radu.rendec@gmail.com>
 <87r27t2el0.fsf@dja-thinkpad.axtens.net>
 <5fcdb5767b7cf4c7d5b7496c0032021e43115d39.camel@gmail.com>
Date: Tue, 18 Jun 2019 16:42:02 +1000
Message-ID: <87muif2y4l.fsf@dja-thinkpad.axtens.net>
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
Cc: Paul Mackerras <paulus@samba.org>, Oleg Nesterov <oleg@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Radu Rendec <radu.rendec@gmail.com> writes:

> On Mon, 2019-06-17 at 11:19 +1000, Daniel Axtens wrote:
>> Radu Rendec <
>> radu.rendec@gmail.com
>> > writes:
>> 
>> > Hi Everyone,
>> > 
>> > I'm following up on the ptrace() problem that I reported a few days ago.
>> > I believe my version of the code handles all cases correctly. While the
>> > problem essentially boils down to dividing the fpidx by 2 on PPC32, it
>> > becomes tricky when the same code must work correctly on both PPC32 and
>> > PPC64.
>> > 
>> > One other thing that I believe was handled incorrectly in the previous
>> > version is the unused half of fpscr on PPC32. Note that while PT_FPSCR
>> > is defined as (PT_FPR0 + 2*32 + 1), making only the upper half visible,
>> > PT_FPR0 + 2*32 still corresponds to a possible address that userspace
>> > can pass. In that case, comparing fpidx to (PT_FPSCR - PT_FPR0) would
>> > cause an invalid access to the FPU registers array.
>> > 
>> > I tested the patch on 4.9.179, but that part of the code is identical in
>> > recent kernels so it should work just the same.
>> > 
>> > I wrote a simple test program than can be used to quickly test (on an
>> > x86_64 host) that all cases are handled correctly for both PPC32/PPC64.
>> > The code is included below.
>> > 
>> > I also tested with gdbserver (test patch included below) and verified
>> > that it generates two ptrace() calls for each FPU register, with
>> > addresses between 0xc0 and 0x1bc.
>> 
>> Thanks for looking in to this. I can confirm your issue. What I'm
>> currently wondering is: what is the behaviour with a 32-bit userspace on
>> a 64-bit kernel? Should they also be going down the 32-bit path as far
>> as calculating offsets goes?
>
> Thanks for reviewing this. I haven't thought about the 32-bit userspace
> on a 64-bit kernel, that is a very good question. Userspace passes a
> pointer, so in theory it could go down either path as long as the
> pointer points to the right data type.
>
> I will go back to the gdb source code and try to figure out if that case
> is handled in a special way. If not, it's probably safe to assume that a
> 32-bit userspace should always go down the 32-bit path regardless of the
> kernel bitness (in which case I think I have to change my patch).

It doesn't seem to reproduce on a 64-bit kernel with 32-bit
userspace. Couldn't tell you why - if you can figure it out from the gdb
source code I'd love to know! I have, however, tried it - and all the fp
registers look correct and KASAN doesn't pick up any memory corruption.

Regards,
Daniel
>
> Best regards,
> Radu
>
>> > 8<--------------- Makefile ---------------------------------------------
>> > .PHONY: all clean
>> > 
>> > all: ptrace-fpregs-32 ptrace-fpregs-64
>> > 
>> > ptrace-fpregs-32: ptrace-fpregs.c
>> > 	$(CC) -o ptrace-fpregs-32 -Wall -O2 -m32 ptrace-fpregs.c
>> > 
>> > ptrace-fpregs-64: ptrace-fpregs.c
>> > 	$(CC) -o ptrace-fpregs-64 -Wall -O2 ptrace-fpregs.c
>> > 
>> > clean:
>> > 	rm -f ptrace-fpregs-32 ptrace-fpregs-64
>> > 8<--------------- ptrace-fpregs.c --------------------------------------
>> > #include <stdio.h>
>> > #include <errno.h>
>> > 
>> > #define PT_FPR0	48
>> > 
>> > #ifndef __x86_64
>> > 
>> > #define PT_FPR31 (PT_FPR0 + 2*31)
>> > #define PT_FPSCR (PT_FPR0 + 2*32 + 1)
>> > 
>> > #else
>> > 
>> > #define PT_FPSCR (PT_FPR0 + 32)
>> > 
>> > #endif
>> > 
>> > int test_access(unsigned long addr)
>> > {
>> > 	int ret;
>> > 
>> > 	do {
>> > 		unsigned long index, fpidx;
>> > 
>> > 		ret = -EIO;
>> > 
>> > 		/* convert to index and check */
>> > 		index = addr / sizeof(long);
>> > 		if ((addr & (sizeof(long) - 1)) || (index > PT_FPSCR))
>> > 			break;
>> > 
>> > 		if (index < PT_FPR0) {
>> > 			ret = printf("ptrace_put_reg(%lu)", index);
>> > 			break;
>> > 		}
>> > 
>> > 		ret = 0;
>> > #ifndef __x86_64
>> > 		if (index == PT_FPSCR - 1) {
>> > 			/* corner case for PPC32; do nothing */
>> > 			printf("corner_case");
>> > 			break;
>> > 		}
>> > #endif
>> > 		if (index == PT_FPSCR) {
>> > 			printf("fpscr");
>> > 			break;
>> > 		}
>> > 
>> > 		/*
>> > 		 * FPR is always 64-bit; on PPC32, userspace does two 32-bit
>> > 		 * accesses. Add bit2 to allow accessing the upper half on
>> > 		 * 32-bit; on 64-bit, bit2 is always 0 (we validate it above).
>> > 		 */
>> > 		fpidx = (addr - PT_FPR0 * sizeof(long)) / 8;
>> > 		printf("TS_FPR[%lu] + %lu", fpidx, addr & 4);
>> > 		break;
>> > 	} while (0);
>> > 
>> > 	return ret;
>> > }
>> > 
>> > int main(void)
>> > {
>> > 	unsigned long addr;
>> > 	int rc;
>> > 
>> > 	for (addr = 0; addr < PT_FPSCR * sizeof(long) + 16; addr++) {
>> > 		printf("0x%04lx: ", addr);
>> > 		rc = test_access(addr);
>> > 		if (rc < 0)
>> > 			printf("!err!");
>> > 		printf("\t<%d>\n", rc);
>> > 	}
>> > 
>> > 	return 0;
>> > }
>> > 8<--------------- gdb.patch --------------------------------------------
>> > --- gdb/gdbserver/linux-low.c.orig	2019-06-10 11:45:53.810882669 -0400
>> > +++ gdb/gdbserver/linux-low.c	2019-06-10 11:49:32.272929766 -0400
>> > @@ -4262,6 +4262,8 @@ store_register (struct regcache *regcach
>> >    pid = lwpid_of (get_thread_lwp (current_inferior));
>> >    for (i = 0; i < size; i += sizeof (PTRACE_XFER_TYPE))
>> >      {
>> > +      printf("writing register #%d offset %d at address %#x\n",
>> > +             regno, i, (unsigned int)regaddr);
>> >        errno = 0;
>> >        ptrace (PTRACE_POKEUSER, pid,
>> >  	    /* Coerce to a uintptr_t first to avoid potential gcc warning
>> > 8<----------------------------------------------------------------------
>> > 
>> > Radu Rendec (1):
>> >   PPC32: fix ptrace() access to FPU registers
>> > 
>> >  arch/powerpc/kernel/ptrace.c | 85 ++++++++++++++++++++++--------------
>> >  1 file changed, 52 insertions(+), 33 deletions(-)
>> > 
>> > -- 
>> > 2.20.1
