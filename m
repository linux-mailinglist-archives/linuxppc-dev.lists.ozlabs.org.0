Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EDF7AB23
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 16:35:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yfHB00tGzDqPW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 00:35:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.193; helo=mail-qt1-f193.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yf9j197BzDqWq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 00:30:48 +1000 (AEST)
Received: by mail-qt1-f193.google.com with SMTP id h18so63231536qtm.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 07:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S6k3LBxNyc8SfDfnGl8aFZmpFQ+XfoOprX/ZJ6nWfjo=;
 b=pUPj7nwEnXi4fq3xKbrq9nTq1Ns6VJGdkr+/5sUzS53KiEqsCAQoaj/Y5py0fHBtqb
 CzWKfcgnW+1sLNE4fbXvfbVYo2e2j+FB2FHWY63Ii3zu6nFgkbEyOJgctQm5Xi/mLf6R
 EdlwV5Lh8Q3SmkQc6TjJJAwVpuNjLLkmXebufP+eRjR5C0sCuyqq+nGrixf1QuFfEZG3
 ZyywsCExo4zJojrKR7dP1i7HzhffzVqChQIN6QUgSgQXOg2+4qLkv87X4fZw0HCAgjiF
 S2cMEFWCmte0rmCjuGD5ux8P9R4HlhZIxUUOQJQtKWohkgz+JrDWgmIMbxeuESSMBofL
 ZXgg==
X-Gm-Message-State: APjAAAUpOoDVIb+j9LqEUO0xfwyT/lWXiW4qGtIp2AK0Aad2xn0s27UV
 07rEOYwGJwIKngKbm9Wx9fTn+unYERHR5y6MF18=
X-Google-Smtp-Source: APXvYqzUviZRVY2WfETwauJWgNpE5wRBn/5f9gVf7X+Z0FC6TvIsPiZ0akUTChtLPGAi8VVnDWCMuxwfI9B5fg4E1E8=
X-Received: by 2002:aed:33a4:: with SMTP id v33mr79757414qtd.18.1564497045891; 
 Tue, 30 Jul 2019 07:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190729202542.205309-1-ndesaulniers@google.com>
 <20190729203246.GA117371@archlinux-threadripper>
 <20190729215200.GN31406@gate.crashing.org>
 <CAK8P3a1GQSyCj1L8fFG4Pah8dr5Lanw=1yuimX1o+53ARzOX+Q@mail.gmail.com>
 <20190730134856.GO31406@gate.crashing.org>
In-Reply-To: <20190730134856.GO31406@gate.crashing.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 30 Jul 2019 16:30:29 +0200
Message-ID: <CAK8P3a2755_6xq453C2AePLW8BeQk_Jg=HfjB_F-zyVMnQDfdg@mail.gmail.com>
Subject: Re: [PATCH] powerpc: workaround clang codegen bug in dcbz
To: Segher Boessenkool <segher@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kbuild test robot <lkp@intel.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 30, 2019 at 3:49 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Tue, Jul 30, 2019 at 09:34:28AM +0200, Arnd Bergmann wrote:
> > Upon a second look, I think the issue is that the "Z" is an input argument
> > when it should be an output. clang decides that it can make a copy of the
> > input and pass that into the inline asm. This is not the most efficient
> > way, but it seems entirely correct according to the constraints.
>
> Most dcb* (and all icb*) do not change the memory pointed to.  The
> memory is an input here, logically as well, and that is obvious.

Ah, right. I had only thought of dcbz here, but you are right that using
an output makes little sense for the others.

readl() is another example where powerpc currently uses "Z" for an
input, which illustrates this even better.

> > Changing it to an output "=Z" constraint seems to make it work:
> >
> > https://godbolt.org/z/FwEqHf
> >
> > Clang still doesn't use the optimum form, but it passes the correct pointer.
>
> As I said many times already, LLVM does not seem to treat all asm
> operands as lvalues.  That is a bug.  And it is critical for memory
> operands for example, as should be obvious if you look at at for a few
> seconds (you pass *that* memory, not a copy of it).  The thing you pass
> has an identity.  It's an lvalue.  This is true for *all* inline asm
> operands, not just output operands and memory operands, but it is most
> obvious there.

From experimentation, I would guess that llvm handles "m" correctly, but
not "Z". See https://godbolt.org/z/uqfDx_ for another example.

> Or, LLVM might have a bug elsewhere.
>
> Either way, the asm is fine, and it has worked fine in GCC since
> forever.  Changing this constraint to be an output constraint would
> just be obfuscation (we could change *all* operands to *everything* to
> be inout ("+") constraints, and it won't affect correctness, just the
> reader's sanity).

I would still argue that for dcbz specifically, an output makes more
sense than an input, but as you say that does not solve the others.

        Arnd
