Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68718195DD6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 19:43:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48prNN5msvzDr0R
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 05:43:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=r0rNlhVi; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pr1L4VLlzDrCB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 05:27:18 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id f52so10745417otf.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 11:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=mUgPEhhQcjfKASu4ovKrH+viuyNdfG4nZwjDD1Ymszw=;
 b=r0rNlhVimz1jLFP4LI5uNfJbXruYRsORoEQ0uyvX0mufWuM8CdPFKzLwq4qrJwOWhO
 uFle0oNx9vT9khT+B+CDzwhYESTBUcmysC9xEDxsq2tcOy43loZE7UtmxLjaazwY4rg8
 flx79GrN7yot+qtLDdKrdcF3vxg/xUme2bxdqLfQFInktyLoNg3hfId+VXqV+EHpNJGt
 /gOwF8cuoyzuG18OjUaiz8PH4dM2bgatOd6+7qoAyzxj4QMuic4HYtftQ2/bstRJBI6a
 zLAQEqh3wmcJzDKeyXqkMCi0YWiYm5h6rbvxCjDIUeNFwWVaRA9ZgsKOOoZtsqdklvOP
 BxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=mUgPEhhQcjfKASu4ovKrH+viuyNdfG4nZwjDD1Ymszw=;
 b=uccDgi5+tzebwKTD+m4sU3nNbTUV+5iIj4BDH36nbOHd55mGAP9FAVFu4EViXM88zB
 ViqoEB165D36nUBEPu9imESIwjNY7UCtlhTpn4lDxvwgJXPxf0DA2UwWNxZvT6gauk08
 iC5Zpqla0F2GQXB6EIxts8i3IliFQPDyxLt/2c2PGiTmxeZ26lI8xmDSxDWmpnuI8c+1
 z3akfReTmlO1j6EeeCjNA25KB9QwgdPW8EQdHmICEgPlakbWDYmyNapLXLuc1P3HglcF
 OPBpNIYkHqIGOlGFsw7CO4hIZa04b83j4N8z1JyjWkWp71x1bxv1eAsgagss1lar11Gi
 /2sg==
X-Gm-Message-State: ANhLgQ0vPvUYcWdnlg3Rbe1kJXDrTy8D33gkJhbErX38T9ZL2wVjwv5w
 HjrTtpUqvpg3ok4DpaE2gko=
X-Google-Smtp-Source: ADFU+vtdpg8Fj9qWpoFZDCMJMpqvoI2Km1QbYSGsd9kgZPB7kySBYzo13mltBcCSQCDysnICymSguQ==
X-Received: by 2002:a4a:da48:: with SMTP id f8mr632811oou.44.1585333633780;
 Fri, 27 Mar 2020 11:27:13 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id b2sm2094786oii.20.2020.03.27.11.27.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 27 Mar 2020 11:27:13 -0700 (PDT)
Date: Fri, 27 Mar 2020 11:27:08 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v1] powerpc: Make setjmp/longjump signature standard
Message-ID: <20200327182708.GA13308@ubuntu-m2-xlarge-x86>
References: <20200327100801.161671-1-courbet@google.com>
 <f1b85a2a-1c60-9a12-f547-13ff255f18f0@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1b85a2a-1c60-9a12-f547-13ff255f18f0@c-s.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 Clement Courbet <courbet@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 27, 2020 at 06:45:21PM +0100, Christophe Leroy wrote:
> Subject line, change longjump to longjmp
> 
> Le 27/03/2020 à 11:07, Clement Courbet a écrit :
> > Declaring setjmp()/longjmp() as taking longs makes the signature
> > non-standard, and makes clang complain. In the past, this has been
> > worked around by adding -ffreestanding to the compile flags.
> > 
> > The implementation looks like it only ever propagates the value
> > (in longjmp) or sets it to 1 (in setjmp), and we only call longjmp
> > with integer parameters.
> > 
> > This allows removing -ffreestanding from the compilation flags.
> > 
> > Context:
> > https://lore.kernel.org/patchwork/patch/1214060
> > https://lore.kernel.org/patchwork/patch/1216174
> > 
> > Signed-off-by: Clement Courbet <courbet@google.com>
> > ---
> >   arch/powerpc/include/asm/setjmp.h | 6 ++++--
> >   arch/powerpc/kexec/Makefile       | 3 ---
> >   2 files changed, 4 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/setjmp.h b/arch/powerpc/include/asm/setjmp.h
> > index e9f81bb3f83b..84bb0d140d59 100644
> > --- a/arch/powerpc/include/asm/setjmp.h
> > +++ b/arch/powerpc/include/asm/setjmp.h
> > @@ -7,7 +7,9 @@
> >   #define JMP_BUF_LEN    23
> > -extern long setjmp(long *) __attribute__((returns_twice));
> > -extern void longjmp(long *, long) __attribute__((noreturn));
> > +typedef long *jmp_buf;
> 
> Do we need that new opaque typedef ? Why not just keep long * ?

Yes, otherwise the warning comes back:

In file included from arch/powerpc/kexec/crash.c:25:
arch/powerpc/include/asm/setjmp.h:10:12: error: declaration of built-in function 'setjmp' requires the declaration of the 'jmp_buf' type, commonly provided in the header <setjmp.h>. [-Werror,-Wincomplete-setjmp-declaration]
extern int setjmp(long *env) __attribute__((returns_twice));
           ^
arch/powerpc/include/asm/setjmp.h:11:13: error: declaration of built-in function 'longjmp' requires the declaration of the 'jmp_buf' type, commonly provided in the header <setjmp.h>. [-Werror,-Wincomplete-setjmp-declaration]
extern void longjmp(long *env, int val) __attribute__((noreturn));
            ^
2 errors generated.

> > +
> > +extern int setjmp(jmp_buf env) __attribute__((returns_twice));
> > +extern void longjmp(jmp_buf env, int val) __attribute__((noreturn));
> >   #endif /* _ASM_POWERPC_SETJMP_H */
> > diff --git a/arch/powerpc/kexec/Makefile b/arch/powerpc/kexec/Makefile
> > index 378f6108a414..86380c69f5ce 100644
> > --- a/arch/powerpc/kexec/Makefile
> > +++ b/arch/powerpc/kexec/Makefile
> > @@ -3,9 +3,6 @@
> >   # Makefile for the linux kernel.
> >   #
> > -# Avoid clang warnings around longjmp/setjmp declarations
> > -CFLAGS_crash.o += -ffreestanding
> > -
> >   obj-y				+= core.o crash.o core_$(BITS).o
> >   obj-$(CONFIG_PPC32)		+= relocate_32.o
> > 
> 
> Christophe
