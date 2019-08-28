Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B85D3A0908
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 19:55:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JYLF6Qd5zDrJp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 03:55:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gkbV6uEU"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JYJC16BbzDr0d
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 03:53:30 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id j11so647421wrp.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 10:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ctwr+81XjxtZjBI+RKeebPhdkGvaIWpze3WikDHHYro=;
 b=gkbV6uEU80/diE3++JDNmX1wcMIg3kYn/u9jPDs8Lhf5QPmsb5N6z0ooqMV3C+kpM8
 8FtT53NgimT5aZUXjLp1BwSgHcC7Q2cHRXkXYjV0j8NKoNsI0tGqWcE7eQJMoShNIjJ8
 LDFsg7n9maVJZnMFor0FW0veP3QDr/0xKq0qRPSBoFp2W5UnMs1SyKUHGYiAhP1HNXxk
 c94GVISeezBd/TmOpNFCv9Jgye3BlaMNBceUSmyYvBWlKxVHsoi11aRaRosRvWM4tDnV
 hE5x8uQ/TyqHmLMw2a4ULrvqtKy4zkP2WzHNAThRIeZ3/7fQx12SVS0jzSK8V8XRC0yK
 B0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ctwr+81XjxtZjBI+RKeebPhdkGvaIWpze3WikDHHYro=;
 b=BeEj/6QKvHLLGfdmqUsvMwjvDTYotEt89IRsKyOed/aglZcirb0uSgGWdwgVGlo6s8
 UPg1IFs61g4iQaRXE+FO/mKqA5Zf4Q9f6+EQZ6Ls0Wz3K71Xb1Lc5tNNjKTPkLH5BTMs
 OS158R7r7ELk75LWofdaFzohaDPJgDfw6LPHQFkYdLptGROsE7WO2uB21pncx8X5hYro
 sqemZHpg9BjDG63cVT1vdE5/d4ZXlje8WlfF1YbjAyhNauyvk0ibqtiNODo1YDHAsWU4
 4gloIJPs9J+Y4Wp1f+DHJp7/9aw/ipPcOuMl4ZLsANydsLsxebYoC17dFvFfOYsXEQC/
 wWVQ==
X-Gm-Message-State: APjAAAXdi9MSK/0wkMdGpehmcpv8GF3vme4xhxubuY6QOi92xQCbx6Ck
 26VDUG+GmQCmwxGQAvPdFfM=
X-Google-Smtp-Source: APXvYqxvNmDaH1yjem5r4S/83Vg1D2RbeIF+UfqytUPsvepRWyCtZKp6p6ALBQ0zWevb7HBr1Ivsog==
X-Received: by 2002:adf:c803:: with SMTP id d3mr6529921wrh.130.1567014804807; 
 Wed, 28 Aug 2019 10:53:24 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id w8sm10456031wmc.1.2019.08.28.10.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 10:53:23 -0700 (PDT)
Date: Wed, 28 Aug 2019 10:53:22 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Avoid clang warnings around setjmp and longjmp
Message-ID: <20190828175322.GA121833@archlinux-threadripper>
References: <20190812023214.107817-1-natechancellor@gmail.com>
 <878srdv206.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878srdv206.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
 stable@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 28, 2019 at 11:43:53PM +1000, Michael Ellerman wrote:
> Nathan Chancellor <natechancellor@gmail.com> writes:
> 
> > Commit aea447141c7e ("powerpc: Disable -Wbuiltin-requires-header when
> > setjmp is used") disabled -Wbuiltin-requires-header because of a warning
> > about the setjmp and longjmp declarations.
> >
> > r367387 in clang added another diagnostic around this, complaining that
> > there is no jmp_buf declaration.
> >
> > In file included from ../arch/powerpc/xmon/xmon.c:47:
> > ../arch/powerpc/include/asm/setjmp.h:10:13: error: declaration of
> > built-in function 'setjmp' requires the declaration of the 'jmp_buf'
> > type, commonly provided in the header <setjmp.h>.
> > [-Werror,-Wincomplete-setjmp-declaration]
> > extern long setjmp(long *);
> >             ^
> > ../arch/powerpc/include/asm/setjmp.h:11:13: error: declaration of
> > built-in function 'longjmp' requires the declaration of the 'jmp_buf'
> > type, commonly provided in the header <setjmp.h>.
> > [-Werror,-Wincomplete-setjmp-declaration]
> > extern void longjmp(long *, long);
> >             ^
> > 2 errors generated.
> >
> > Take the same approach as the above commit by disabling the warning for
> > the same reason, we provide our own longjmp/setjmp function.
> >
> > Cc: stable@vger.kernel.org # 4.19+
> > Link: https://github.com/ClangBuiltLinux/linux/issues/625
> > Link: https://github.com/llvm/llvm-project/commit/3be25e79477db2d31ac46493d97eca8c20592b07
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >
> > It may be worth using -fno-builtin-setjmp and -fno-builtin-longjmp
> > instead as it makes it clear to clang that we are not using the builtin
> > longjmp and setjmp functions, which I think is why these warnings are
> > appearing (at least according to the commit that introduced this waring).
> >
> > Sample patch:
> > https://github.com/ClangBuiltLinux/linux/issues/625#issuecomment-519251372
> 
> Couldn't we just add those flags to CFLAGS for the whole kernel? Rather
> than making them per-file.

Yes, I don't think this would be unreasonable. Are you referring to the
cc-disable-warning flags or the -fno-builtin flags? I personally think
the -fno-builtin flags convey to clang what the kernel is intending to
do better than disabling the warnings outright.

> I mean there's no kernel code that wants to use clang's builtin
> setjmp/longjmp implementation at all right?
> 
> cheers

I did a quick search of the tree and it looks like powerpc and x86/um
are the only architectures that do anything with setjmp/longjmp. x86/um
avoids this by using a define flag to change setjmp to kernel_setjmp:

arch/um/Makefile: -Dlongjmp=kernel_longjmp -Dsetjmp=kernel_setjmp \

Seems like adding those flags should be safe.

Cheers,
Nathan
