Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E630519231D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 09:47:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nMDp1w5KzDqPQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 19:47:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=amodra@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fA5u9yV7; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nMBG4VsKzDqNd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 19:44:54 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id g18so566500plq.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 01:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=j+vG1UzSN+cmn11wCzXbf4rcMUTrByAymyJuG/unRl4=;
 b=fA5u9yV7a/kldwVHIKeRzReGOChDSk7hohi4Gv4/vnQWhM3/0FmYbDDnlV+ZRuvshH
 iScW4B9PY+poU7nuWc0fxkjo8hSwgAzwBtX8Czl/sPPT79axmx4bhKSXCciqJebgihFu
 o6ialME5Mj5tJqsgxnIp1lISMyCnroRQcRK6AXaZX5L5I8HB77HjfMNcIgJUtNbTwf2G
 26b/mHgjInyDpLl2/nq1OIkWebaGHdOQ79IaKny4DqzOkTGc82Vq15x54uxlf29NvyC5
 TNFDbjv7lRcx+shIIFmS3J0E3viSh/bddnFuwXi3WfaRec73Keh6aJqLVrhKWcKIhBaa
 stbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=j+vG1UzSN+cmn11wCzXbf4rcMUTrByAymyJuG/unRl4=;
 b=t3sfCS56f3ujAOE0pUyRQsul7d20+/mgzr54sctHBxqeAOF8FysBWM9mRYiPUqCcm/
 HN/JCktFU7iwsCns0wBretTa/nMVYeDvxHC7VQ/BZykHcKlstecYPrNtcGSnVB4lFTVp
 G7+GSMhyQ48EuaDsTPDYbETYK4L1CtUPSJjk3adQg3B7GOuIAUODZx8kZYeqOp3ch7Gm
 bY1qO3WVAZUMKIb4yqBawU3HIyigxBngq+ufDuvsUcFLimWKHKOw6iAPKwoZ91ezTf5N
 P1bJ1Aau+mH3YT7iYVO5u7886Su3meqzATNVrIOgsv84rAckLhjtxD4u7Gx+6IoTl2kb
 PqBg==
X-Gm-Message-State: ANhLgQ1yBksqU2cCLYjaFs2iFr3gYucnbtoYclhbEGJYsn3cPeGiTaiZ
 aAU55zKJHibSdcb7VR1iiRbWYYO85IM=
X-Google-Smtp-Source: ADFU+vucdON9jneqRPHRudFripSA41tZIAvV5Uvt5tfrA5j9bLENmdT+v8WTgHZG0+HB4qS7bSJIWw==
X-Received: by 2002:a17:902:9a03:: with SMTP id
 v3mr2140241plp.272.1585125426829; 
 Wed, 25 Mar 2020 01:37:06 -0700 (PDT)
Received: from bubble.grove.modra.org
 ([2406:3400:51d:8cc0:b4e4:c6d8:e68c:70f7])
 by smtp.gmail.com with ESMTPSA id t15sm10267297pgv.61.2020.03.25.01.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 01:37:06 -0700 (PDT)
Received: by bubble.grove.modra.org (Postfix, from userid 1000)
 id 70A4780D35; Wed, 25 Mar 2020 19:07:02 +1030 (ACDT)
Date: Wed, 25 Mar 2020 19:07:02 +1030
From: Alan Modra <amodra@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] powerpc/boot: Delete unneeded .globl _zimage_start
Message-ID: <20200325083702.GE4583@bubble.grove.modra.org>
References: <20200325051820.163253-1-maskray@google.com>
 <CACPK8Xf70Yq2szW110G_2f2Q3J6inVqQY4Y-y0tggkVmT7tmfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xf70Yq2szW110G_2f2Q3J6inVqQY4Y-y0tggkVmT7tmfw@mail.gmail.com>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linuxppc-dev@lists.ozlabs.org,
 Fangrui Song <maskray@google.com>, clang-built-linux@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 25, 2020 at 05:22:31AM +0000, Joel Stanley wrote:
> On Wed, 25 Mar 2020 at 05:19, Fangrui Song <maskray@google.com> wrote:
> >
> > .globl sets the symbol binding to STB_GLOBAL while .weak sets the
> > binding to STB_WEAK. They should not be used together. It is accidetal
> > rather then intentional that GNU as let .weak override .globl while
> > clang integrated assembler let the last win.

No, it isn't accidental.  gas deliberately lets .weak override .globl.
Since 1996-07-26, git commit 5ca547dc239

I'm fine with the patch so far as it is true that there is no need for
both .globl and .weak (and it looks silly to have both), but the
explanation isn't true.  The patch is needed because the clang
assembler is incompatible with gas in this detail.

> > Fixes: cd197ffcf10b "[POWERPC] zImage: Cleanup and improve zImage entry point"
> > Fixes: ee9d21b3b358 "powerpc/boot: Ensure _zimage_start is a weak symbol"
> > Link: https://github.com/ClangBuiltLinux/linux/issues/937
> > Signed-off-by: Fangrui Song <maskray@google.com>
> > Cc: Joel Stanley <joel@jms.id.au>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > Cc: clang-built-linux@googlegroups.com
> > ---
> >  arch/powerpc/boot/crt0.S | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/arch/powerpc/boot/crt0.S b/arch/powerpc/boot/crt0.S
> > index 92608f34d312..1d83966f5ef6 100644
> > --- a/arch/powerpc/boot/crt0.S
> > +++ b/arch/powerpc/boot/crt0.S
> > @@ -44,9 +44,6 @@ p_end:                .long   _end
> >  p_pstack:      .long   _platform_stack_top
> >  #endif
> >
> > -       .globl  _zimage_start
> > -       /* Clang appears to require the .weak directive to be after the symbol
> > -        * is defined. See https://bugs.llvm.org/show_bug.cgi?id=38921  */
> >         .weak   _zimage_start
> >  _zimage_start:
> 
> Your explanation makes sense to me. I've added Alan to cc for his review.
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> Thanks for the patch.
> 
> Cheers,
> 
> Joel
> 
> >         .globl  _zimage_start_lib
> > --
> > 2.25.1.696.g5e7596f4ac-goog

-- 
Alan Modra
Australia Development Lab, IBM
