Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C14A847792
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 03:21:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Rthl3KtHzDqbg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 11:21:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="Q4laYTsq"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Rtfq6mT2zDqXD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 11:19:46 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id v9so4780324pgr.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jun 2019 18:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=+a8aH3dzJzfU6JF2w8Lb5Gh8y1mV4Zs/Nt/+MffjJYQ=;
 b=Q4laYTsqVhXdLFQj04BV+Kkb2Q97or6ehFtWrYqXD/HNwKTQ+7rsAvPvp332RM3I4L
 76E5RJJ31kbE2fv5a8uwmabj9Jvh2DcF694Yd13Ky+MeRrrwi+OEjdocPy+gLqqUoyex
 Sh4N//M+NiIZ2gObc3B/HHUxS7+YkbfcVHt6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=+a8aH3dzJzfU6JF2w8Lb5Gh8y1mV4Zs/Nt/+MffjJYQ=;
 b=MExIzaOrtmWm8L7Kje01RfSXhTnPTbYJwhiLqCPVMqCRusFK8Tws8HX0q0T8zQNo1n
 uXR62jfa+530zWGWEnsiTERv/CSu0yvTkdn4ZN6jwzRY6eE0njPZwZ556dE5UGMAl1lK
 CcOrbQDCmwzMt5fNIU96yw7SwnfJsuMdLA1rPbbIsVWfPmr9lTEgcG2MOa8fMy3/imJU
 1XkkKcJSKkFqx2zb+V+sY5bdMVQqBGViTCTI9n6Pr6ND0QtjqYg0BxRNuDgnyCYg8FiP
 C1shuCRsHYEXmEhUPi6WP2ZAkAtVK/YQ+w2DoLeoTzn6EcvRN15M7QNyjdqFk7dD8Dwc
 N0RA==
X-Gm-Message-State: APjAAAW5XHdB+TRv+O6p6uguYcocUCDMQq6K9ML67QF0EGmIKIHP8o62
 A8aqkgtq7dgquLrvDL1XX9N2hA==
X-Google-Smtp-Source: APXvYqw3RdoLYEYltHXGoGHuYjbUL/jkWIH295bY6eGCpisoIs5BywhaD9AezcVL+IKLveu/JCysUg==
X-Received: by 2002:a62:1c5:: with SMTP id 188mr47032834pfb.26.1560734384792; 
 Sun, 16 Jun 2019 18:19:44 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id g8sm8805707pfi.8.2019.06.16.18.19.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 16 Jun 2019 18:19:43 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Radu Rendec <radu.rendec@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/1] PPC32: fix ptrace() access to FPU registers
In-Reply-To: <20190610232758.19010-1-radu.rendec@gmail.com>
References: <20190610232758.19010-1-radu.rendec@gmail.com>
Date: Mon, 17 Jun 2019 11:19:39 +1000
Message-ID: <87r27t2el0.fsf@dja-thinkpad.axtens.net>
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
>
> I wrote a simple test program than can be used to quickly test (on an
> x86_64 host) that all cases are handled correctly for both PPC32/PPC64.
> The code is included below.
>
> I also tested with gdbserver (test patch included below) and verified
> that it generates two ptrace() calls for each FPU register, with
> addresses between 0xc0 and 0x1bc.

Thanks for looking in to this. I can confirm your issue. What I'm
currently wondering is: what is the behaviour with a 32-bit userspace on
a 64-bit kernel? Should they also be going down the 32-bit path as far
as calculating offsets goes?

Regards,
Daniel

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
