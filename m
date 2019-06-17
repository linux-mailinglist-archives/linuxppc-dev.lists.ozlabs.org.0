Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3234782E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 04:28:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45RwBV0qyQzDqZG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 12:28:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=radu.rendec@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="C5qy3G12"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Rw8m1f6wzDqWp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 12:27:19 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id s7so17816167iob.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jun 2019 19:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=T+RYPhlLZx57XntGpoiqSZqErva7JslOzJfSjTfaank=;
 b=C5qy3G12gsN99h64hqVVFAAg+D8JFSpxrSE906OnyMj65LpZwkIIBfqejUPbEN1eD6
 Jg7gCud49mJfaoAzA22PuOB1s1Nd7diEPT5860peJkhRUitLuq5cIawc5vLP2tqKiI4X
 kgkpUcPXoY4DQCWaSAPupf66UNgUrEC0wcf7jH93arwZShfkXp36yMGw7diOZIL50Z1h
 HNJXsOqJMUD9kXSP0Ks9I8R+8WJ3miZKo2spG7xhoF0gMJKpFd5undAXQifcrXJvcLAl
 z9KOTxgUGlkmV6HQerXgdlXmtF7H3EKOjtjk+t5hCCiIOFnMwHCC7/Bd8c7zhe1h1Ybd
 C99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=T+RYPhlLZx57XntGpoiqSZqErva7JslOzJfSjTfaank=;
 b=Z/E0Lug0FLIgaLFZoxIm8ETaH4NOZAOAsOwI3nznoUp34Hn0Xubzf3OLpB6x3sXbQ2
 cp5fBRjqaVoQTl9xdlYjbOqRlJ313omLd41pjVcmKrtEbbtNRTm5OnHK3b3oPWr1dWwS
 asNJt3nwBq9pVyu+L5vD07NgetHVT6zI2qbs0hUckojNNQCrRN03SUPrzXwhoegb5XkK
 brL0QQsI3GvEcYFQpF6fAUIWwbsuK3SQxQlxukO/GELzWBcyOVJHXSzTaRlXgYy+pImP
 ZLRNcizUhrn59IOts/ksxIpdR0ih4CnxmeoS5cNnZD3kHtkLHs+CO1plAAs1YJWqvhVd
 nwTA==
X-Gm-Message-State: APjAAAX/ohuEQyy3d0PuigUxOccVmEPqlSYumHScfyenYoYkKkxov4T9
 JiYYKFKQxWuH/yrNtkVAkI8=
X-Google-Smtp-Source: APXvYqzfvsjU8wUiMzTZBFboihyaXSIWmvGEGR/Yvwhv3NGUvOuuW3nGIBEy1saJ40t8TauC5TC1DA==
X-Received: by 2002:a02:b710:: with SMTP id g16mr62114586jam.88.1560738436224; 
 Sun, 16 Jun 2019 19:27:16 -0700 (PDT)
Received: from bat.mindbit.ro (CPE00fc8d79db03-CM00fc8d79db00.cpe.net.fido.ca.
 [72.140.67.131])
 by smtp.gmail.com with ESMTPSA id t14sm6579457ioi.60.2019.06.16.19.27.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 16 Jun 2019 19:27:15 -0700 (PDT)
Message-ID: <5fcdb5767b7cf4c7d5b7496c0032021e43115d39.camel@gmail.com>
Subject: Re: [PATCH 0/1] PPC32: fix ptrace() access to FPU registers
From: Radu Rendec <radu.rendec@gmail.com>
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
Date: Sun, 16 Jun 2019 22:27:13 -0400
In-Reply-To: <87r27t2el0.fsf@dja-thinkpad.axtens.net>
References: <20190610232758.19010-1-radu.rendec@gmail.com>
 <87r27t2el0.fsf@dja-thinkpad.axtens.net>
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
Cc: Paul Mackerras <paulus@samba.org>, Oleg Nesterov <oleg@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-06-17 at 11:19 +1000, Daniel Axtens wrote:
> Radu Rendec <
> radu.rendec@gmail.com
> > writes:
> 
> > Hi Everyone,
> > 
> > I'm following up on the ptrace() problem that I reported a few days ago.
> > I believe my version of the code handles all cases correctly. While the
> > problem essentially boils down to dividing the fpidx by 2 on PPC32, it
> > becomes tricky when the same code must work correctly on both PPC32 and
> > PPC64.
> > 
> > One other thing that I believe was handled incorrectly in the previous
> > version is the unused half of fpscr on PPC32. Note that while PT_FPSCR
> > is defined as (PT_FPR0 + 2*32 + 1), making only the upper half visible,
> > PT_FPR0 + 2*32 still corresponds to a possible address that userspace
> > can pass. In that case, comparing fpidx to (PT_FPSCR - PT_FPR0) would
> > cause an invalid access to the FPU registers array.
> > 
> > I tested the patch on 4.9.179, but that part of the code is identical in
> > recent kernels so it should work just the same.
> > 
> > I wrote a simple test program than can be used to quickly test (on an
> > x86_64 host) that all cases are handled correctly for both PPC32/PPC64.
> > The code is included below.
> > 
> > I also tested with gdbserver (test patch included below) and verified
> > that it generates two ptrace() calls for each FPU register, with
> > addresses between 0xc0 and 0x1bc.
> 
> Thanks for looking in to this. I can confirm your issue. What I'm
> currently wondering is: what is the behaviour with a 32-bit userspace on
> a 64-bit kernel? Should they also be going down the 32-bit path as far
> as calculating offsets goes?

Thanks for reviewing this. I haven't thought about the 32-bit userspace
on a 64-bit kernel, that is a very good question. Userspace passes a
pointer, so in theory it could go down either path as long as the
pointer points to the right data type.

I will go back to the gdb source code and try to figure out if that case
is handled in a special way. If not, it's probably safe to assume that a
32-bit userspace should always go down the 32-bit path regardless of the
kernel bitness (in which case I think I have to change my patch).

Best regards,
Radu

> > 8<--------------- Makefile ---------------------------------------------
> > .PHONY: all clean
> > 
> > all: ptrace-fpregs-32 ptrace-fpregs-64
> > 
> > ptrace-fpregs-32: ptrace-fpregs.c
> > 	$(CC) -o ptrace-fpregs-32 -Wall -O2 -m32 ptrace-fpregs.c
> > 
> > ptrace-fpregs-64: ptrace-fpregs.c
> > 	$(CC) -o ptrace-fpregs-64 -Wall -O2 ptrace-fpregs.c
> > 
> > clean:
> > 	rm -f ptrace-fpregs-32 ptrace-fpregs-64
> > 8<--------------- ptrace-fpregs.c --------------------------------------
> > #include <stdio.h>
> > #include <errno.h>
> > 
> > #define PT_FPR0	48
> > 
> > #ifndef __x86_64
> > 
> > #define PT_FPR31 (PT_FPR0 + 2*31)
> > #define PT_FPSCR (PT_FPR0 + 2*32 + 1)
> > 
> > #else
> > 
> > #define PT_FPSCR (PT_FPR0 + 32)
> > 
> > #endif
> > 
> > int test_access(unsigned long addr)
> > {
> > 	int ret;
> > 
> > 	do {
> > 		unsigned long index, fpidx;
> > 
> > 		ret = -EIO;
> > 
> > 		/* convert to index and check */
> > 		index = addr / sizeof(long);
> > 		if ((addr & (sizeof(long) - 1)) || (index > PT_FPSCR))
> > 			break;
> > 
> > 		if (index < PT_FPR0) {
> > 			ret = printf("ptrace_put_reg(%lu)", index);
> > 			break;
> > 		}
> > 
> > 		ret = 0;
> > #ifndef __x86_64
> > 		if (index == PT_FPSCR - 1) {
> > 			/* corner case for PPC32; do nothing */
> > 			printf("corner_case");
> > 			break;
> > 		}
> > #endif
> > 		if (index == PT_FPSCR) {
> > 			printf("fpscr");
> > 			break;
> > 		}
> > 
> > 		/*
> > 		 * FPR is always 64-bit; on PPC32, userspace does two 32-bit
> > 		 * accesses. Add bit2 to allow accessing the upper half on
> > 		 * 32-bit; on 64-bit, bit2 is always 0 (we validate it above).
> > 		 */
> > 		fpidx = (addr - PT_FPR0 * sizeof(long)) / 8;
> > 		printf("TS_FPR[%lu] + %lu", fpidx, addr & 4);
> > 		break;
> > 	} while (0);
> > 
> > 	return ret;
> > }
> > 
> > int main(void)
> > {
> > 	unsigned long addr;
> > 	int rc;
> > 
> > 	for (addr = 0; addr < PT_FPSCR * sizeof(long) + 16; addr++) {
> > 		printf("0x%04lx: ", addr);
> > 		rc = test_access(addr);
> > 		if (rc < 0)
> > 			printf("!err!");
> > 		printf("\t<%d>\n", rc);
> > 	}
> > 
> > 	return 0;
> > }
> > 8<--------------- gdb.patch --------------------------------------------
> > --- gdb/gdbserver/linux-low.c.orig	2019-06-10 11:45:53.810882669 -0400
> > +++ gdb/gdbserver/linux-low.c	2019-06-10 11:49:32.272929766 -0400
> > @@ -4262,6 +4262,8 @@ store_register (struct regcache *regcach
> >    pid = lwpid_of (get_thread_lwp (current_inferior));
> >    for (i = 0; i < size; i += sizeof (PTRACE_XFER_TYPE))
> >      {
> > +      printf("writing register #%d offset %d at address %#x\n",
> > +             regno, i, (unsigned int)regaddr);
> >        errno = 0;
> >        ptrace (PTRACE_POKEUSER, pid,
> >  	    /* Coerce to a uintptr_t first to avoid potential gcc warning
> > 8<----------------------------------------------------------------------
> > 
> > Radu Rendec (1):
> >   PPC32: fix ptrace() access to FPU registers
> > 
> >  arch/powerpc/kernel/ptrace.c | 85 ++++++++++++++++++++++--------------
> >  1 file changed, 52 insertions(+), 33 deletions(-)
> > 
> > -- 
> > 2.20.1

