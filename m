Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA062433EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 10:00:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PblJ2dlYzDr7x
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 18:00:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="b8Xguc9H"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Pbjb4M8XzDr1c
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 17:59:12 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id c85so11327521pfc.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 00:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=AiQqxw4R/mP5nZJTmbfe+nPv6amYJdmRUzyaWo162aI=;
 b=b8Xguc9HO7ElsXe75nQ9YWSc2eOdY43shQUcAKE6QM8mtkZkBJEm0qXxt32u9hlmgA
 6rNQ2FcBwLQVh4zRKpSrCI1rij9D9lU5Mqb18V/YJp9OV/gdzscFz8Tcxwy2LgkyAnvi
 tWHVgoCNZcF5dDm6Moqaj5nck9TeKMVeb9UBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=AiQqxw4R/mP5nZJTmbfe+nPv6amYJdmRUzyaWo162aI=;
 b=X2fbmLgIEFWrijLXVcId46zzA336DHv7SyTqyF9oHSQ73y0yXfGr+mvXO7MbXnwzQ4
 FjLU77tVxjpxTL9vsZjZ3ynWhMJvPoq3BS2Cpn8X9x+6Vx71TrRnd+YHbcX0G6mZEEeI
 sDugSOWlU7et56joNR4hALzAt0H6fbtcOiZaGOuCBnPYxsR02NHAA4tW5+18F2dx7wKm
 01QCYCd2ROnaDUd+Imo91y1jpw2cTk585DS9GuLa27Kakut1VTZkmnt3/pJww3JG8Z6P
 6+00ZgBQ87oTV2PzmHi+F77cHUXgFlRSnlYYBR5bBJ9IOx4r2CfWIkG8pTDEMoBc/8zc
 Cw+w==
X-Gm-Message-State: APjAAAUOC44JIyY1KEpziQcuYKiSezZj/4ybIBDMzp3Pa3E/W8uwohqS
 q65flWCmov4MlWYoQFU4RHFXXQ==
X-Google-Smtp-Source: APXvYqz5aR8FFtySCqF/Lf+ImGY85JLXiuziOa4LQAfbb1tKqh7097oS0x4Ja3bBf79hNEPzw0cKpQ==
X-Received: by 2002:a63:649:: with SMTP id 70mr29521069pgg.445.1560412748685; 
 Thu, 13 Jun 2019 00:59:08 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id g5sm3165811pfm.54.2019.06.13.00.59.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 00:59:07 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Radu Rendec <radu.rendec@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/1] PPC32: fix ptrace() access to FPU registers
In-Reply-To: <20190610232758.19010-1-radu.rendec@gmail.com>
References: <20190610232758.19010-1-radu.rendec@gmail.com>
Date: Thu, 13 Jun 2019 17:59:03 +1000
Message-ID: <874l4tq5ko.fsf@dja-thinkpad.axtens.net>
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
Cc: Radu Rendec <radu.rendec@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Oleg Nesterov <oleg@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Radu Rendec <radu.rendec@gmail.com> writes:

> Hi Everyone,
>
> I'm following up on the ptrace() problem that I reported a few days ago.
> I believe my version of the code handles all cases correctly. While the
> problem essentially boils down to dividing the fpidx by 2 on PPC32, it
> becomes tricky when the same code must work correctly on both PPC32 and
> PPC64.
>
> One other thing that I believe was handled incorrectly in the previous
> version is the unused half of fpscr on PPC32. Note that while PT_FPSCR
> is defined as (PT_FPR0 + 2*32 + 1), making only the upper half visible,
> PT_FPR0 + 2*32 still corresponds to a possible address that userspace
> can pass. In that case, comparing fpidx to (PT_FPSCR - PT_FPR0) would
> cause an invalid access to the FPU registers array.
>
> I tested the patch on 4.9.179, but that part of the code is identical in
> recent kernels so it should work just the same.

I've been looking into this. Something is definitely up, but I'm not
sure that we want to fix it in exactly the way you identified. I'll keep
you updated.

Regards,
Daniel

>
> I wrote a simple test program than can be used to quickly test (on an
> x86_64 host) that all cases are handled correctly for both PPC32/PPC64.
> The code is included below.
>
> I also tested with gdbserver (test patch included below) and verified
> that it generates two ptrace() calls for each FPU register, with
> addresses between 0xc0 and 0x1bc.
>
> 8<--------------- Makefile ---------------------------------------------
> .PHONY: all clean
>
> all: ptrace-fpregs-32 ptrace-fpregs-64
>
> ptrace-fpregs-32: ptrace-fpregs.c
> 	$(CC) -o ptrace-fpregs-32 -Wall -O2 -m32 ptrace-fpregs.c
>
> ptrace-fpregs-64: ptrace-fpregs.c
> 	$(CC) -o ptrace-fpregs-64 -Wall -O2 ptrace-fpregs.c
>
> clean:
> 	rm -f ptrace-fpregs-32 ptrace-fpregs-64
> 8<--------------- ptrace-fpregs.c --------------------------------------
> #include <stdio.h>
> #include <errno.h>
>
> #define PT_FPR0	48
>
> #ifndef __x86_64
>
> #define PT_FPR31 (PT_FPR0 + 2*31)
> #define PT_FPSCR (PT_FPR0 + 2*32 + 1)
>
> #else
>
> #define PT_FPSCR (PT_FPR0 + 32)
>
> #endif
>
> int test_access(unsigned long addr)
> {
> 	int ret;
>
> 	do {
> 		unsigned long index, fpidx;
>
> 		ret = -EIO;
>
> 		/* convert to index and check */
> 		index = addr / sizeof(long);
> 		if ((addr & (sizeof(long) - 1)) || (index > PT_FPSCR))
> 			break;
>
> 		if (index < PT_FPR0) {
> 			ret = printf("ptrace_put_reg(%lu)", index);
> 			break;
> 		}
>
> 		ret = 0;
> #ifndef __x86_64
> 		if (index == PT_FPSCR - 1) {
> 			/* corner case for PPC32; do nothing */
> 			printf("corner_case");
> 			break;
> 		}
> #endif
> 		if (index == PT_FPSCR) {
> 			printf("fpscr");
> 			break;
> 		}
>
> 		/*
> 		 * FPR is always 64-bit; on PPC32, userspace does two 32-bit
> 		 * accesses. Add bit2 to allow accessing the upper half on
> 		 * 32-bit; on 64-bit, bit2 is always 0 (we validate it above).
> 		 */
> 		fpidx = (addr - PT_FPR0 * sizeof(long)) / 8;
> 		printf("TS_FPR[%lu] + %lu", fpidx, addr & 4);
> 		break;
> 	} while (0);
>
> 	return ret;
> }
>
> int main(void)
> {
> 	unsigned long addr;
> 	int rc;
>
> 	for (addr = 0; addr < PT_FPSCR * sizeof(long) + 16; addr++) {
> 		printf("0x%04lx: ", addr);
> 		rc = test_access(addr);
> 		if (rc < 0)
> 			printf("!err!");
> 		printf("\t<%d>\n", rc);
> 	}
>
> 	return 0;
> }
> 8<--------------- gdb.patch --------------------------------------------
> --- gdb/gdbserver/linux-low.c.orig	2019-06-10 11:45:53.810882669 -0400
> +++ gdb/gdbserver/linux-low.c	2019-06-10 11:49:32.272929766 -0400
> @@ -4262,6 +4262,8 @@ store_register (struct regcache *regcach
>    pid = lwpid_of (get_thread_lwp (current_inferior));
>    for (i = 0; i < size; i += sizeof (PTRACE_XFER_TYPE))
>      {
> +      printf("writing register #%d offset %d at address %#x\n",
> +             regno, i, (unsigned int)regaddr);
>        errno = 0;
>        ptrace (PTRACE_POKEUSER, pid,
>  	    /* Coerce to a uintptr_t first to avoid potential gcc warning
> 8<----------------------------------------------------------------------
>
> Radu Rendec (1):
>   PPC32: fix ptrace() access to FPU registers
>
>  arch/powerpc/kernel/ptrace.c | 85 ++++++++++++++++++++++--------------
>  1 file changed, 52 insertions(+), 33 deletions(-)
>
> -- 
> 2.20.1
