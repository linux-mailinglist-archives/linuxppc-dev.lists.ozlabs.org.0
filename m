Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD452B69F8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 17:24:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbB8g6mhrzDqRb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 03:24:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aJlDOBsA; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbB6w3rrrzDqRL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 03:22:30 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id 199so20897476qkg.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 08:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9JS/uYKk8GrJCTbc2FAe05O+XJ9e/pB4+Xwp7tXwPZ0=;
 b=aJlDOBsATEWSe1rlycoHMeV4ei94yuVwrrm65Xysp4oVHYz7irZb27aTwZ7IgeMrMO
 rwVNaVpE25sjKuSTnOO7NmkzBWOBSTx4fb3R/DCWK4SogrXa2AC7enZkjLsyuNjXxuvM
 NTnekDgslWYIalrCbTxJ86SdaNtQP3cHwjrypdeVUFonoFUCuScqV6kG/ZkGwOFtl6yH
 GGnqDGXXV/Rp0vgelpRy+c9ngWmBiSSV1q/ABKAKx6pMiIrVNRaIq9LBAGHm9r1XHYPX
 JJd8Mz5c3TX5hRrGoRqUPlThTtb3gM5hidlGyqicc9LqyBTLzcNk5GjMNiGQAYvcDs09
 OmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9JS/uYKk8GrJCTbc2FAe05O+XJ9e/pB4+Xwp7tXwPZ0=;
 b=X9rgaTBZ16xaHD2UENhcbCA8Sv2E2ZuW/mE/Im84L2Q6419OB8FTZQx+oi5F1pI24p
 TXBWngofdFTaHadebBFHtI36StlCujnZ3gL0Dwn/EiteNwqPL00vARWRyEnjqhQb/crE
 LMvJbQRm5YSuW+cXTa5+C+gnEms7fPZIaB+ckn7E0+t5p88aAZ63PZTrTkEAdNOSt5A7
 2xiahg1uPUhewwyE1V5nfcETWmI5k+y9InxCkIa+iBRqaT/F61OP3daWLWxF9S0ObFZo
 XcI8wI2nKvLSU1pWtuDl8nsEGsRVWab/nzZ8nVvb/KmQn2ygRy81HzVyuswfjGcnf7+a
 tkCA==
X-Gm-Message-State: AOAM530fsImPudlfWCJWmdPXMzbMyZvg5Ie9KXAUKd5LqLB0Vfh/OFH2
 E2AjMGndSUJFE7DQlx7ZM90=
X-Google-Smtp-Source: ABdhPJxFV05KKJ6XDlOOAOJnsbl9Wf8WKTjRzQrKCSJ0EvUBlKv7/HeKNXgdCIuMoNy2WooiBd+UYw==
X-Received: by 2002:a37:8542:: with SMTP id h63mr366329qkd.102.1605630146479; 
 Tue, 17 Nov 2020 08:22:26 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id v16sm15074576qka.72.2020.11.17.08.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:22:25 -0800 (PST)
Date: Tue, 17 Nov 2020 09:22:23 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] kbuild: Hoist '--orphan-handling' into Kconfig
Message-ID: <20201117162223.GA1428250@ubuntu-m3-large-x86>
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <87tuto2qke.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tuto2qke.fsf@mpe.ellerman.id.au>
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
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>,
 linux-kbuild@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Arvind Sankar <nivedita@alum.mit.edu>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 clang-built-linux@googlegroups.com, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 17, 2020 at 10:03:29PM +1100, Michael Ellerman wrote:
> Nathan Chancellor <natechancellor@gmail.com> writes:
> > Currently, '--orphan-handling=warn' is spread out across four different
> > architectures in their respective Makefiles, which makes it a little
> > unruly to deal with in case it needs to be disabled for a specific
> > linker version (in this case, ld.lld 10.0.1).
> >
> > To make it easier to control this, hoist this warning into Kconfig and
> > the main Makefile so that disabling it is simpler, as the warning will
> > only be enabled in a couple places (main Makefile and a couple of
> > compressed boot folders that blow away LDFLAGS_vmlinx) and making it
> > conditional is easier due to Kconfig syntax. One small additional
> > benefit of this is saving a call to ld-option on incremental builds
> > because we will have already evaluated it for CONFIG_LD_ORPHAN_WARN.
> >
> > To keep the list of supported architectures the same, introduce
> > CONFIG_ARCH_WANT_LD_ORPHAN_WARN, which an architecture can select to
> > gain this automatically after all of the sections are specified and size
> > asserted. A special thanks to Kees Cook for the help text on this
> > config.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1187
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >  Makefile                          | 6 ++++++
> >  arch/Kconfig                      | 9 +++++++++
> >  arch/arm/Kconfig                  | 1 +
> >  arch/arm/Makefile                 | 4 ----
> >  arch/arm/boot/compressed/Makefile | 4 +++-
> >  arch/arm64/Kconfig                | 1 +
> >  arch/arm64/Makefile               | 4 ----
> >  arch/powerpc/Kconfig              | 1 +
> >  arch/powerpc/Makefile             | 1 -
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> 
> 
> >  arch/x86/Kconfig                  | 1 +
> >  arch/x86/Makefile                 | 3 ---
> >  arch/x86/boot/compressed/Makefile | 4 +++-
> >  init/Kconfig                      | 3 +++
> >  13 files changed, 28 insertions(+), 14 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 008aba5f1a20..c443afd61886 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -984,6 +984,12 @@ ifeq ($(CONFIG_RELR),y)
> >  LDFLAGS_vmlinux	+= --pack-dyn-relocs=relr
> >  endif
> >  
> > +# We never want expected sections to be placed heuristically by the
> > +# linker. All sections should be explicitly named in the linker script.
> > +ifeq ($(CONFIG_LD_ORPHAN_WARN),y)
> > +LDFLAGS_vmlinux += --orphan-handling=warn
> > +endif
> 
> This is a nit, but you can use ifdef with bool CONFIG symbols in
> Makefiles, which reads a bit nicer, eg:
> 
> ifdef CONFIG_LD_ORPHAN_WARN
> LDFLAGS_vmlinux += --orphan-handling=warn
> endif

That is indeed cleaner, I did not realize I could do that as long as the
config was a boolean. I will use that in v2, which I will send along
within the next few days to give Masahiro some time to comment.

Cheers,
Nathan
