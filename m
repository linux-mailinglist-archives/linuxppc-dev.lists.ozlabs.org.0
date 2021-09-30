Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B6C41E058
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 19:48:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HL11L19xFz3c5J
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 03:48:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m0rDM0cn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=m0rDM0cn; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HL10b45Zxz2yxV
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 03:47:24 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id t4so4611272plo.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 10:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+IS0gEgo7hipR9gibsQw5KtPLx6dQXKFRc1+dywoXVA=;
 b=m0rDM0cnK0yrtL29pL81MAGf7w2Yed+jc4KUJF0fL6YCvGOj2OOT/73pX0N1cuLGzf
 ECJdJfF5q+Tu3Vs0H54vg8YCX4POSPt/jTDx97+sRolpUheG7qnd3LACShH3YDUGL+oL
 edpJws/IQ1QQ+9i+FXscZHebVHzxRo9Z53ybE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+IS0gEgo7hipR9gibsQw5KtPLx6dQXKFRc1+dywoXVA=;
 b=VlXx2L9vgKcGaJeMMj/Ky60U5u48CuWsP10HDo3+ATSgEuPJOxmaTpW8lYdou7UeuK
 uDiYWIM40ISSCcjvxJOsIzmKtTOueZeAZvuw3uV7tAiP/pu1f4XXGtbpqUohiA9IPGSh
 O4aQd3Ch41q5t69cHVDJSoW064KoDTU67wvKHCVXJ+OBO4niNofXEH583/zC0gpaCSTb
 eSaUnygXhSY1iiW/xzr0Z49WbVRmwrJWyvnK7nlZBL9M8CFn7FdywNDCDxxb5s3bDPoo
 kUrSGai/GFR0O4IkpNJPwCpW2gfbxWeIbDeTA77CGzY3gp+BiaFx5fPMUNYKRD35j1n5
 gnug==
X-Gm-Message-State: AOAM532Polz1YAk5zIs7SXskCS8FR+puLu5iuTrKbvKe/iMrkxEf+sFZ
 yjR+muNFSuum1pRz13WQ62f6XQ==
X-Google-Smtp-Source: ABdhPJwKcuP6DGDrVJJap2YBfnw9gJ29cZ6T8aj/WEWFIltD4Sz9lDFqVeOwFghXxQzDWleVwS3vJg==
X-Received: by 2002:a17:902:e74d:b0:13e:77cd:a300 with SMTP id
 p13-20020a170902e74d00b0013e77cda300mr2394421plf.80.1633024041447; 
 Thu, 30 Sep 2021 10:47:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id x19sm3606048pfn.105.2021.09.30.10.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 10:47:20 -0700 (PDT)
Date: Thu, 30 Sep 2021 10:47:19 -0700
From: Kees Cook <keescook@chromium.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [RFC PATCH 4/8] powerpc: add CPU field to struct thread_info
Message-ID: <202109301045.15DDDA0B@keescook>
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-5-ardb@kernel.org>
 <CAMj1kXEojbQbNzCP39KT4EzFAyW3J1Tfm_stCZ+fGo8_SO90PA@mail.gmail.com>
 <87ee99lii7.fsf@mpe.ellerman.id.au>
 <87pmst1rn9.fsf@mpe.ellerman.id.au>
 <CAMj1kXFXtbD3=L+QvCnwbyFr-qbWivZ0wRGT0N4LNxANPD8x4g@mail.gmail.com>
 <878rzf0zmb.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878rzf0zmb.fsf@mpe.ellerman.id.au>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Heiko Carstens <hca@linux.ibm.com>, Keith Packard <keithpac@amazon.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 30, 2021 at 08:46:04AM +1000, Michael Ellerman wrote:
> Ard Biesheuvel <ardb@kernel.org> writes:
> > On Tue, 28 Sept 2021 at 02:16, Michael Ellerman <mpe@ellerman.id.au> wrote:
> >>
> >> Michael Ellerman <mpe@ellerman.id.au> writes:
> >> > Ard Biesheuvel <ardb@kernel.org> writes:
> >> >> On Tue, 14 Sept 2021 at 14:11, Ard Biesheuvel <ardb@kernel.org> wrote:
> >> >>>
> >> >>> The CPU field will be moved back into thread_info even when
> >> >>> THREAD_INFO_IN_TASK is enabled, so add it back to powerpc's definition
> >> >>> of struct thread_info.
> >> >>>
> >> >>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >> >>
> >> >> Michael,
> >> >>
> >> >> Do you have any objections or issues with this patch or the subsequent
> >> >> ones cleaning up the task CPU kludge for ppc32? Christophe indicated
> >> >> that he was happy with it.
> >> >
> >> > No objections, it looks good to me, thanks for cleaning up that horror :)
> >> >
> >> > It didn't apply cleanly to master so I haven't tested it at all, if you can point me at a
> >> > git tree with the dependencies I'd be happy to run some tests over it.
> >>
> >> Actually I realised I can just drop the last patch.
> >>
> >> So that looks fine, passes my standard quick build & boot on qemu tests,
> >> and builds with/without stack protector enabled.
> >>
> >
> > Thanks.
> >
> > Do you have any opinion on how this series should be merged? Kees Cook
> > is willing to take them via his cross-arch tree, or you could carry
> > them if you prefer. Taking it via multiple trees at the same time is
> > going to be tricky, or take two cycles, with I'd prefer to avoid.
> 
> I don't really mind. If Kees is happy to take it then that's OK by me.
> 
> If Kees put the series in a topic branch based off rc2 then I could
> merge that, and avoid any conflicts.

I've created:

git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/thread_info/cpu

it includes a --no-ff merge commit, which I'm not sure is desirable? Let
me know if I should adjust this, or if Linus will yell about this if I
send him a PR containing a merge commit? I'm not sure what's right here.

Thanks!

-- 
Kees Cook
