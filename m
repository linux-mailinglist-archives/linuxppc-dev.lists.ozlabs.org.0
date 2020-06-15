Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C01421F9B21
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 16:57:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lvZX6304zDqTm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 00:57:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d44;
 helo=mail-io1-xd44.google.com; envelope-from=brgerst@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PRxkgdzs; dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lvNG3G3QzDqFt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 00:48:42 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id t9so18109223ioj.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 07:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CFYHq9QU1VF3rchooKVX3EvDkFFGgQYVgoX+nSdXTuc=;
 b=PRxkgdzs6hj4NpKjLdU4+mZo+kiLgpl3v8qO3FUtkLItVntqN/v1UtTbvyh1fAkJDQ
 /r/QUNFX0i3kNhar6p3HMQRIc0/hnPpxSyfCSOk/7QGhSriP8dugDYCbD3NVmr3r39T+
 L0RU8h1FEoVzRUIqiHPXWetm4KkkvOZ8sZuPa8pJIZPJbfJz9/qmImf4Haoxykq/U+Wm
 z0McY86vBdXb73lWVCJytm+tusWr8I6JfrKJ++433fcbFQ7IdZZfKn+gl9mRtO93JHfb
 KS+ugwQDy31DiZDXPTjkRurzgAFvHZ4Gbe2s6FFN7LQGjbdA1Klosmt+SwHoidzFhQqC
 XkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CFYHq9QU1VF3rchooKVX3EvDkFFGgQYVgoX+nSdXTuc=;
 b=iVm/G4F+B7j8JdczgyKdsqVlEmgIfPd8FMGURYOwC5+EYjaIEkg7zSK6kmcjc51w/8
 Gi+DHQ32zzFcQGNfwU0XqFgOYTqNtLUaV90VnGtCpk6PfCsx+Arkhu9V6nBL+rXFDg6O
 Unn/nJRkaaEtAyRfWp6k2vkJwi85Jf4FYA3bjdhhGFqdB3hCu4mJ76P5kiMgm2x24oQP
 bq5r6eCEsZNsG5Wv6ra5VBrYZOvezFUMXl82jMqdMPXgfwjSrKlerRe1FSHLKLUmPdE/
 /SYDdUNx1sDu3SkdMx7Q+gOtlAOSQ8lvg4o8OCvSLKyXWdhc0CYvEqXcuSMc7dv1ZaB7
 CWCw==
X-Gm-Message-State: AOAM530OoH/dZgUikeuF2+84aAdxAq1ademfzv9ZPLVq0mrchh2rxdVI
 sCbjh2sPZOV6h7n0847ue5phi2wyQW73R/ImZQ==
X-Google-Smtp-Source: ABdhPJyd6RZmdZpxGVu6c3gRb+Y3l0bsTdnHuSOZYnX1P537cI9jfkNEPZLpydEoTLgL6kUKfHIZe+3b9Hy/JybhE4I=
X-Received: by 2002:a02:3501:: with SMTP id k1mr6072971jaa.133.1592232518583; 
 Mon, 15 Jun 2020 07:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200615130032.931285-1-hch@lst.de>
 <20200615130032.931285-3-hch@lst.de>
 <CAK8P3a0bRD3RzE_X6Tjzu9Tj+OhHhP+S=k6+VYODBGko8oQhew@mail.gmail.com>
 <20200615141239.GA12951@lst.de>
In-Reply-To: <20200615141239.GA12951@lst.de>
From: Brian Gerst <brgerst@gmail.com>
Date: Mon, 15 Jun 2020 10:48:26 -0400
Message-ID: <CAMzpN2heSzZzg16ws3yQkd7YZwmPPx_4RFCpb9JYfFWJ9gfPhA@mail.gmail.com>
Subject: Re: [PATCH 2/6] exec: simplify the compat syscall handling
To: Christoph Hellwig <hch@lst.de>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 15, 2020 at 10:13 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Jun 15, 2020 at 03:31:35PM +0200, Arnd Bergmann wrote:
> > >  #ifdef CONFIG_COMPAT
> > > -       if (unlikely(argv.is_compat)) {
> > > +       if (in_compat_syscall()) {
> > > +               const compat_uptr_t __user *compat_argv =
> > > +                       compat_ptr((unsigned long)argv);
> > >                 compat_uptr_t compat;
> > >
> > > -               if (get_user(compat, argv.ptr.compat + nr))
> > > +               if (get_user(compat, compat_argv + nr))
> > >                         return ERR_PTR(-EFAULT);
> > >
> > >                 return compat_ptr(compat);
> > >         }
> > >  #endif
> >
> > I would expect that the "#ifdef CONFIG_COMPAT" can be removed
> > now, since compat_ptr() and in_compat_syscall() are now defined
> > unconditionally. I have not tried that though.
>
> True, I'll give it a spin.
>
> > > +/*
> > > + * x32 syscalls are listed in the same table as x86_64 ones, so we need to
> > > + * define compat syscalls that are exactly the same as the native version for
> > > + * the syscall table machinery to work.  Sigh..
> > > + */
> > > +#ifdef CONFIG_X86_X32
> > >  COMPAT_SYSCALL_DEFINE3(execve, const char __user *, filename,
> > > -       const compat_uptr_t __user *, argv,
> > > -       const compat_uptr_t __user *, envp)
> > > +                      const char __user *const __user *, argv,
> > > +                      const char __user *const __user *, envp)
> > >  {
> > > -       return do_compat_execve(AT_FDCWD, getname(filename), argv, envp, 0);
> > > +       return do_execveat(AT_FDCWD, getname(filename), argv, envp, 0, NULL);
> > >  }
> >
> > Maybe move it to arch/x86/kernel/process_64.c or arch/x86/entry/syscall_x32.c
> > to keep it out of the common code if this is needed.
>
> I'd rather keep it in common code as that allows all the low-level
> exec stuff to be marked static, and avoid us growing new pointless
> compat variants through copy and paste.
> smart compiler to d
>
> > I don't really understand
> > the comment, why can't this just use this?
>
> That errors out with:
>
> ld: arch/x86/entry/syscall_x32.o:(.rodata+0x1040): undefined reference to
> `__x32_sys_execve'
> ld: arch/x86/entry/syscall_x32.o:(.rodata+0x1108): undefined reference to
> `__x32_sys_execveat'
> make: *** [Makefile:1139: vmlinux] Error 1

I think I have a fix for this, by modifying the syscall wrappers to
add an alias for the __x32 variant to the native __x64_sys_foo().
I'll get back to you with a patch.

--
Brian Gerst
