Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E99A96FB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 01:19:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P0BR6yXWzDr27
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 09:18:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="E0hH/5KZ"; 
 dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P0763fPkzDqyp
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 09:16:02 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id k1so546227wmi.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2019 16:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=D+jh77ZLgNensDYPn2dN2wL4k27PJ6BpfuVV6pgmL7g=;
 b=E0hH/5KZPUbuapqt3Z57/i+myQE/X/8+9T1h7ZwzooTZFrauoJKpwhyX2YG21HRAly
 5ZPac6JEX2A0gPXuwBVMuX4LbTwVUws7ZdBidSR5KDozTQXQYfMwl88kRfMHS/OkTMq0
 cotN8RM2UrUFC8JZpSkMJm6h4cCwj8lL0cZJF7Z+6vyPR9I2a5lHJ8ltH8gTtqM/a9qk
 fUR4h3x3Nk03WFcUmF633tW7lJGnGNZx8EoMnrK/hphQ6mCIaQd/sURbEX/UdRfl47L8
 6WAGON3hJk4HT+fv5HhYXo3BC/w9GTdUPEBETmCLkHQclpPvFkxikQQVE0EQk8MW3m4V
 U6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=D+jh77ZLgNensDYPn2dN2wL4k27PJ6BpfuVV6pgmL7g=;
 b=nFGXkDSencefi2puHHOgwjmfU30csGFRssBzLJUW/OaxLHa+IugY4Lp5+hDhs9m8oX
 H80p83255FS7svsxJY7s12n5HzaqI/+sw32SvLNmY6Z2zztfWfDWbEnipsQnaGK2blK/
 DSnEF1WGFxsG/umoydStMpo/NXM10giQenNnYXcfELc/VC2bRfi0JcCSn8D93644oYI7
 ZI5qbN67UYjk/2q2t4HBcvX1geB12/XSGm3h8lND9TdQW/r/1ROnJ7Gj9ZZIl2gWC7RZ
 gvX0yGZloLFf+zIfuYsz/phkot5mvC4WCi+4T5J2wCHh7sZ70g/Aonj8syllPyZjgOZ3
 iRoA==
X-Gm-Message-State: APjAAAXYGYWsTC4RbLZATeZDWUo4V9xYg5AkejdVim3Rqdtlyphz1G+N
 lbcSymnb1STMacSX51S+rCU=
X-Google-Smtp-Source: APXvYqznil+fqfMulqs43QZJNRB7vW35OcADELC0oZ/vgbpO2vg2C3b20RkPKZ41YzhNwbmyWSb20A==
X-Received: by 2002:a7b:c766:: with SMTP id x6mr514054wmk.51.1567638957553;
 Wed, 04 Sep 2019 16:15:57 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id z189sm788009wmc.25.2019.09.04.16.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 16:15:56 -0700 (PDT)
Date: Wed, 4 Sep 2019 16:15:54 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Avoid clang warnings around setjmp and longjmp
Message-ID: <20190904231554.GA42450@archlinux-threadripper>
References: <878srdv206.fsf@mpe.ellerman.id.au>
 <20190828175322.GA121833@archlinux-threadripper>
 <CAKwvOdmXbYrR6n-cxKt3XxkE4Lmj0sSoZBUtHVb0V2LTUFHmug@mail.gmail.com>
 <20190828184529.GC127646@archlinux-threadripper>
 <6801a83ed6d54d95b87a41c57ef6e6b0@AcuMS.aculab.com>
 <20190903055553.GC60296@archlinux-threadripper>
 <20190903193128.GC9749@gate.crashing.org>
 <20190904002401.GA70635@archlinux-threadripper>
 <1bcd7086f3d24dfa82eec03980f30fbc@AcuMS.aculab.com>
 <20190904130135.GN9749@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904130135.GN9749@gate.crashing.org>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, "# 3.4.x" <stable@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 David Laight <David.Laight@aculab.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 04, 2019 at 08:01:35AM -0500, Segher Boessenkool wrote:
> On Wed, Sep 04, 2019 at 08:16:45AM +0000, David Laight wrote:
> > From: Nathan Chancellor [mailto:natechancellor@gmail.com]
> > > Fair enough so I guess we are back to just outright disabling the
> > > warning.
> > 
> > Just disabling the warning won't stop the compiler generating code
> > that breaks a 'user' implementation of setjmp().
> 
> Yeah.  I have a patch (will send in an hour or so) that enables the
> "returns_twice" attribute for setjmp (in <asm/setjmp.h>).  In testing
> (with GCC trunk) it showed no difference in code generation, but
> better save than sorry.
> 
> It also sets "noreturn" on longjmp, and that *does* help, it saves a
> hundred insns or so (all in xmon, no surprise there).
> 
> I don't think this will make LLVM shut up about this though.  And
> technically it is right: the C standard does say that in hosted mode
> setjmp is a reserved name and you need to include <setjmp.h> to access
> it (not <asm/setjmp.h>).

It does not fix the warning, I tested your patch.

> So why is the kernel compiled as hosted?  Does adding -ffreestanding
> hurt anything?  Is that actually supported on LLVM, on all relevant
> versions of it?  Does it shut up the warning there (if not, that would
> be an LLVM bug)?

It does fix this warning because -ffreestanding implies -fno-builtin,
which also solves the warning. LLVM has supported -ffreestanding since
at least 3.0.0. There are some parts of the kernel that are compiled
with this and it probably should be used in more places but it sounds
like there might be some good codegen improvements that are disabled
with it:

https://lore.kernel.org/lkml/CAHk-=wi-epJZfBHDbKKDZ64us7WkF=LpUfhvYBmZSteO8Q0RAg@mail.gmail.com/

Cheers,
Nathan
