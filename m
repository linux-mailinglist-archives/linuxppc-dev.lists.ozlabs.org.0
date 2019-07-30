Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E184E7B1FE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 20:30:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ylVk38fhzDqV1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 04:30:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.222.196; helo=mail-qk1-f196.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ylNF3tCYzDqTF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 04:25:17 +1000 (AEST)
Received: by mail-qk1-f196.google.com with SMTP id g18so47300638qkl.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 11:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hgkfIZTZT31YAwT292CElgRNymWNb2JeX6gELGSJ0g8=;
 b=awD56wgKw00EctmAA5mA0fsyLrgzsRrj7acBIIRvnklNe083Kpe4vegCWGPoMUkNOp
 pP99vxvK/E2giCz8jtoANyJ9TuGc5IMVL2B9F7nk7Ij/+S8NfbM9mkmePfbCOAxYP13t
 TkCC9ogdonSgVl0G5ZqzirHP9LtxNziNLiJdZtNbYiZnsHgQeEFFVvGy9XniAZmVKfO6
 dDJW9hSo5oFgMiwiHWlotkh+FmH6IYal42No0UURcyu44OpSY07/JzFqBWX4GKmR1HhZ
 X4lvlgQudUFLdLx6bllKINpL5b7E2M0bClxCZxD3AY9RvHFTLquWQDBoHJ9UIzRmy+Oa
 F3Cg==
X-Gm-Message-State: APjAAAXiz5h/fFelotpAlxfEnvG+hgyPvh6quwHjfSX8xUxQ87QXWl5f
 8henln0W0jKgG2SynE/Ek7Ab4QFmjvFbk2pIBWk=
X-Google-Smtp-Source: APXvYqzFirM6D707r7849pKu3mn8W9JDE1PQUJxlpX8j1dY4OgVkWtzE1LzAAxSPeGNSezpGWMOaXX5pMloR0DGpBHM=
X-Received: by 2002:a05:620a:b:: with SMTP id
 j11mr43867129qki.352.1564511114607; 
 Tue, 30 Jul 2019 11:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190729202542.205309-1-ndesaulniers@google.com>
 <20190729203246.GA117371@archlinux-threadripper>
 <20190729215200.GN31406@gate.crashing.org>
 <CAK8P3a1GQSyCj1L8fFG4Pah8dr5Lanw=1yuimX1o+53ARzOX+Q@mail.gmail.com>
 <20190730134856.GO31406@gate.crashing.org>
 <CAK8P3a2755_6xq453C2AePLW8BeQk_Jg=HfjB_F-zyVMnQDfdg@mail.gmail.com>
 <20190730161637.GP31406@gate.crashing.org>
 <20190730170728.GQ31406@gate.crashing.org>
In-Reply-To: <20190730170728.GQ31406@gate.crashing.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 30 Jul 2019 20:24:58 +0200
Message-ID: <CAK8P3a2mT7S4VkxqhzsH_3A8HWs6PHQFO8AinLEaHmvAmT8Kug@mail.gmail.com>
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

On Tue, Jul 30, 2019 at 7:07 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Tue, Jul 30, 2019 at 11:16:37AM -0500, Segher Boessenkool wrote:
> > in_le32 and friends?  Yeah, huh.  If LLVM copies that to the stack as
> > well, its (not byte reversing) read will be atomic just fine, so things
> > will still work correctly.
> >
> > The things defined with DEF_MMIO_IN_D (instead of DEF_MMIO_IN_X) do not
> > look like they will work correctly if an update form address is chosen,
> > but that won't happen because the constraint is "m" instead of "m<>",
> > making the %Un pretty useless (it will always be the empty string).
>
> Btw, this is true since GCC 4.8; before 4.8, plain "m" *could* have an
> automodify (autoinc, autodec, etc.) side effect.  What is the minimum
> GCC version required, these days?

gcc-4.6, but an architecture can require a higher version.

         Arnd
