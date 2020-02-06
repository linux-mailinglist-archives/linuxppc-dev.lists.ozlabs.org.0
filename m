Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7295C154467
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 13:59:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Cz6K3DV2zDqY4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 23:59:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235;
 helo=mail-oi1-x235.google.com; envelope-from=hjl.tools@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tma3Bnnj; dkim-atps=neutral
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Cz2K14PxzDqTm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2020 23:56:06 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id b18so4468618oie.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Feb 2020 04:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iFDimWUOs+etk/maMIdhSMArM7igXuY8xRIyfGH6gZg=;
 b=tma3BnnjO9au/IyHGCJViLzVsDMfVLDsswhybWnZzm1ihxZ6StHjBVol06sQu27gWb
 YeFp/TM+qG2yiDPyepiMU3CHpY/9dsb3je1P7dz87+Y1T31P37vu3PYjpcf08elvhshB
 n79a/uh4ChDqv8YrNatftwRrUVdVVMsNHu6xPquBqHBe72jyTscDZGdl+PmPeZHe40D3
 tl8lHM0pV0NOaoPm41PCOX0vUaUVmAzNceMwDVjTUmY4LepASqqMYSTfrcZ6hcosyEJt
 oHJTTeska6yEByZaHkekB5QVxIHkXCSJUkuh+zrtDOrdGNI7c0KbD/e6zKxHmM1XV5le
 PO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iFDimWUOs+etk/maMIdhSMArM7igXuY8xRIyfGH6gZg=;
 b=PKv61hsRPNhbc8sALLnmKLSh6qFWr8biiVfGrLn++CURpFTPjmrPUok04LwmvO5AFk
 3HOT9m7gxykkv9uMAAYDutGdXzjJks8uIlGGwSGFbkBjQjFFEVBHY3MCk88ZZXBcbPsj
 n+F4ia31X8TTSd4rQaRKxBUNzd2YcONkEZmEpQrGKXft9+CrJtvQxgUKj+Vy8Wn3Zybm
 YiutVxf8BMZz3kFfqc87x/aGS0/5GPZBw+nPDC0efidFf9O4HtJoSKjfENdlH7wkGF9h
 wqyXixfT0sDYgrFN9+h5EraeEAnVeR8NKrRZ1EmoNh2LocHsuo6UzY35uZJ8AuCJuWzU
 c4Rw==
X-Gm-Message-State: APjAAAVap4u4sQHXCpIQh/uoBOmDrauFxZM5lFSX+Tlp7olxYpUeePdV
 R0AWlBgvoGpDsJ/PCJ9jVFSDoZ9HxDAK1X/+0/0=
X-Google-Smtp-Source: APXvYqwsocTTXOjNKvZ8aGQwqnFOA+WFWYnEAWUrfvMZBGfaU7Ted+e33WZJo5i6T78i708Bx5vfQeREx/U/qwgF8NM=
X-Received: by 2002:aca:1b17:: with SMTP id b23mr6959440oib.95.1580993762975; 
 Thu, 06 Feb 2020 04:56:02 -0800 (PST)
MIME-Version: 1.0
References: <202002050743.dc2PtIsm%lkp@intel.com>
 <CAMe9rOrJEVL8Qw3fgm9FeDjwGZNxGoZ-OO6bfmV=gtK=g68cvQ@mail.gmail.com>
 <87wo901jm0.fsf@mpe.ellerman.id.au>
In-Reply-To: <87wo901jm0.fsf@mpe.ellerman.id.au>
From: "H.J. Lu" <hjl.tools@gmail.com>
Date: Thu, 6 Feb 2020 04:55:27 -0800
Message-ID: <CAMe9rOrFV0E9N8f-NZeOP+=SSERK-ptUoZrJiS3wgxqjpLhP3Q@mail.gmail.com>
Subject: Re: [yyu168-linux_cet:cet 55/58] powerpc64le-linux-ld: warning:
 discarding dynamic section .rela___ksymtab+jiffies_to_timeval
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Yu-cheng Yu <yu-cheng.yu@intel.com>, kbuild-all@lists.01.org,
 Kees Cook <keescook@chromium.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 5, 2020 at 7:26 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> "H.J. Lu" <hjl.tools@gmail.com> writes:
> > On Tue, Feb 4, 2020 at 3:37 PM kbuild test robot <lkp@intel.com> wrote:
> >>
> >> tree:   https://github.com/yyu168/linux_cet.git cet
> >> head:   bba707cc4715c1036b6561ab38b16747f9c49cfa
> >> commit: 71bb971dd76eeacd351690f28864ad5c5bec3691 [55/58] Discard .note.gnu.property sections in generic NOTES
> >> config: powerpc-rhel-kconfig (attached as .config)
> >> compiler: powerpc64le-linux-gcc (GCC) 7.5.0
> >> reproduce:
> >>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >>         chmod +x ~/bin/make.cross
> >>         git checkout 71bb971dd76eeacd351690f28864ad5c5bec3691
> >>         # save the attached .config to linux build tree
> >>         GCC_VERSION=7.5.0 make.cross ARCH=powerpc
> >>
> >> If you fix the issue, kindly add following tag
> >> Reported-by: kbuild test robot <lkp@intel.com>
> >>
> >> All warnings (new ones prefixed by >>):
> >>
> >>    powerpc64le-linux-ld: warning: discarding dynamic section .rela___ksymtab_gpl+__wait_rcu_gp
> >
> > arch/powerpc/kernel/vmlinux.lds.S has
> >
> >  .rela.dyn : AT(ADDR(.rela.dyn) - (0xc000000000000000 -0x00000000))
> >  {
> >   __rela_dyn_start = .;
> >   *(.rela*) <<<<<<<< Keep .rela* sections
> >  }
>
> The above is inside #ifdef CONFIG_RELOCATABLE
>
> > ...
> >  /DISCARD/ : {
> >   *(*.EMB.apuinfo)
> >   *(.glink .iplt .plt .rela* .comment)
> >                            ^^^^ Discard  .rela* sections.  But it is ignored.
> >   *(.gnu.version*)
> >   *(.gnu.attributes)
> >   *(.eh_frame)
> >  }
>
> But that is not #ifdef'ed at all.
>
> > With my
> >
> > ommit 71bb971dd76eeacd351690f28864ad5c5bec3691
> > Author: H.J. Lu <hjl.tools@gmail.com>
> > Date:   Thu Jan 30 12:39:09 2020 -0800
> >
> >     Discard .note.gnu.property sections in generic NOTES
> >
> >     With the command-line option, -mx86-used-note=yes, the x86 assembler
> >     in binutils 2.32 and above generates a program property note in a note
> >     section, .note.gnu.property, to encode used x86 ISAs and features.  But
> >     kernel linker script only contains a single NOTE segment:
> >
> > /DISCARD/ : { *(.note.gnu.property) }
> >
> > is placed before
> >
> > .rela.dyn : AT(ADDR(.rela.dyn) - (0xc000000000000000 -0x00000000))
> >  {
> >   __rela_dyn_start = .;
> >   *(.rela*) <<<<<<<< Keep .rela* sections
> >  }
> >
> > Then .rela* in
> >
> >  /DISCARD/ : {
> >   *(*.EMB.apuinfo)
> >   *(.glink .iplt .plt .rela* .comment)
> >   *(.gnu.version*)
> >   *(.gnu.attributes)
> >   *(.eh_frame)
> >  }
> >
> > is honored.  Can someone from POWERPC comment on it?
>
> Hmm OK. I'm not really a toolchain person.
>
> The comment on DISCARDS says:
>
>    * Some archs want to discard exit text/data at runtime rather than
>    * link time due to cross-section references such as alt instructions,
>    * bug table, eh_frame, etc.  DISCARDS must be the last of output
>    * section definitions so that such archs put those in earlier section
>    * definitions.
>    */
>
> But I guess you're changing those semantics in your series.
>
> This seems to fix the warning for me?
>
> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
> index b4c89a1acebb..076b3e8a849d 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -365,9 +365,12 @@ SECTIONS
>         DISCARDS
>         /DISCARD/ : {
>                 *(*.EMB.apuinfo)
> -               *(.glink .iplt .plt .rela* .comment)
> +               *(.glink .iplt .plt .comment)
>                 *(.gnu.version*)
>                 *(.gnu.attributes)
>                 *(.eh_frame)
> +#ifndef CONFIG_RELOCATABLE
> +               *(.rela*)
> +#endif
>         }
>  }
>
>
> cheers

This looks correct me.

Reviewed-by: H.J. Lu <hjl.tools@gmail.com>

Thanks.

-- 
H.J.
