Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3767E195CFB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 18:38:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ppxK2VZfzDrJq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 04:38:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::144;
 helo=mail-il1-x144.google.com; envelope-from=hjl.tools@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=o2lMZSVr; dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ppvg0q9KzDrCX
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 04:37:14 +1100 (AEDT)
Received: by mail-il1-x144.google.com with SMTP id a6so9526877ilr.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 10:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2OgNwLq6KbW4jebD9K/lSkSXgzLNFD+IZy1kWWcXkPI=;
 b=o2lMZSVrfmsw5NoBPM/IBHukmjtU1LSjJcQ/8XRpfomzjgri0Q45CrX95gdlZlXP40
 waq/+KviIBb2g866NOCnuKr1PloSeMJXIhzCcjrF8kO3AUILiYM+SPQ0ZK+NX+1vM92J
 r9bkVg+fS42NgMfzX6oNVwwKI37QY2171/D0glk/cjduznOnfw84IvCZODq3s2uxetLI
 wNbpLjaM1QhHn6sWRFSaCPmRuT3alBKCUBN1YQjCoS53I7xIFRlUsEPBNtQFs2ZudS8e
 Hzy4AIIl+AQcwK0Yq9kiymicoHfcdzInpYOjm/uat1QKtKk9ITZ91ZCPMAYWXT0a+wnJ
 SdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2OgNwLq6KbW4jebD9K/lSkSXgzLNFD+IZy1kWWcXkPI=;
 b=WVN+7CTkwYbxJmFhemWbmvlOCoHkLJgkC3Bk0uxbgHpTMYZxkIvTtMuOtYVTCe3RJb
 GU8i/WBRrgc++XQm8WYdUuPnP83wbEoKTuJiJJkFu3NPhtULc/S+vI8xZ7/l6hJ3SqBU
 ha1WyRy4mWdSxGUbUJZ+FYdP58HqUc6U/FZ9ZBUVIuTGmHLCDORwI0ta/kUa9S/ySg2b
 4HwEtr9xXzVUIJgwGikdfjo0NT0p0auz4uNLuXhs1pRpTxkLj+b2SEyd5/IKi+RamlKf
 Qp60ZoWLD+HHQKAPnXeHrXIlNVjtcMuQtbVgTXYlvffVHduFSu+6QFUqkehI+NfPPQy4
 i/EA==
X-Gm-Message-State: ANhLgQ3FvMWHwlJNpiGMPpsi5WgGQYj2MkqFtA1dWbMa8Yh/DgMlqXIM
 R8ot46rJQ7ipJx11f9r+/fW+y7Xq8gNQ1Ml+M3A=
X-Google-Smtp-Source: ADFU+vuDSlvcsYRqAt0U7J4RsS53P+lcw4vee19feIkniHFeWsbGnAjQCqf6tjxLfsGgG4a46kIXg80lHkS0hvHLPtg=
X-Received: by 2002:a92:c00a:: with SMTP id q10mr202050ild.151.1585330631911; 
 Fri, 27 Mar 2020 10:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <202002050743.dc2PtIsm%lkp@intel.com>
 <CAMe9rOrJEVL8Qw3fgm9FeDjwGZNxGoZ-OO6bfmV=gtK=g68cvQ@mail.gmail.com>
 <87wo901jm0.fsf@mpe.ellerman.id.au>
 <CAMe9rOrFV0E9N8f-NZeOP+=SSERK-ptUoZrJiS3wgxqjpLhP3Q@mail.gmail.com>
 <d10b81d0c4f97140bf3e2a96967ebc2711042d3b.camel@intel.com>
In-Reply-To: <d10b81d0c4f97140bf3e2a96967ebc2711042d3b.camel@intel.com>
From: "H.J. Lu" <hjl.tools@gmail.com>
Date: Fri, 27 Mar 2020 10:36:36 -0700
Message-ID: <CAMe9rOpKPYe55=9c1smGwBZBhRbk8PjpdJZ-xQ7RDXjN81gKug@mail.gmail.com>
Subject: RFA [PPC kernel] Avoid upcoming PPC kernel build failure
To: Yu-cheng Yu <yu-cheng.yu@intel.com>
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
Cc: Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 27, 2020 at 7:54 AM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> On Thu, 2020-02-06 at 04:55 -0800, H.J. Lu wrote:
> > On Wed, Feb 5, 2020 at 7:26 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> > > "H.J. Lu" <hjl.tools@gmail.com> writes:
> > > > On Tue, Feb 4, 2020 at 3:37 PM kbuild test robot <lkp@intel.com> wrote:
> > > > > tree:   https://github.com/yyu168/linux_cet.git cet
> > > > > head:   bba707cc4715c1036b6561ab38b16747f9c49cfa
> > > > > commit: 71bb971dd76eeacd351690f28864ad5c5bec3691 [55/58] Discard .note.gnu.property sections in generic NOTES
> > > > > config: powerpc-rhel-kconfig (attached as .config)
> > > > > compiler: powerpc64le-linux-gcc (GCC) 7.5.0
> > > > > reproduce:
> > > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > > > >         chmod +x ~/bin/make.cross
> > > > >         git checkout 71bb971dd76eeacd351690f28864ad5c5bec3691
> > > > >         # save the attached .config to linux build tree
> > > > >         GCC_VERSION=7.5.0 make.cross ARCH=powerpc
> > > > >
> > > > > If you fix the issue, kindly add following tag
> > > > > Reported-by: kbuild test robot <lkp@intel.com>
> > > > >
> > > > > All warnings (new ones prefixed by >>):
> > > > >
> > > > >    powerpc64le-linux-ld: warning: discarding dynamic section .rela___ksymtab_gpl+__wait_rcu_gp
> > > >
> > > > arch/powerpc/kernel/vmlinux.lds.S has
> > > >
> > > >  .rela.dyn : AT(ADDR(.rela.dyn) - (0xc000000000000000 -0x00000000))
> > > >  {
> > > >   __rela_dyn_start = .;
> > > >   *(.rela*) <<<<<<<< Keep .rela* sections
> > > >  }
> > >
> > > The above is inside #ifdef CONFIG_RELOCATABLE
> > >
> > > > ...
> > > >  /DISCARD/ : {
> > > >   *(*.EMB.apuinfo)
> > > >   *(.glink .iplt .plt .rela* .comment)
> > > >                            ^^^^ Discard  .rela* sections.  But it is ignored.
> > > >   *(.gnu.version*)
> > > >   *(.gnu.attributes)
> > > >   *(.eh_frame)
> > > >  }
> > >
> > > But that is not #ifdef'ed at all.
> > >
> > > > With my
> > > >
> > > > ommit 71bb971dd76eeacd351690f28864ad5c5bec3691
> > > > Author: H.J. Lu <hjl.tools@gmail.com>
> > > > Date:   Thu Jan 30 12:39:09 2020 -0800
> > > >
> > > >     Discard .note.gnu.property sections in generic NOTES
> > > >
> > > >     With the command-line option, -mx86-used-note=yes, the x86 assembler
> > > >     in binutils 2.32 and above generates a program property note in a note
> > > >     section, .note.gnu.property, to encode used x86 ISAs and features.  But
> > > >     kernel linker script only contains a single NOTE segment:
> > > >
> > > > /DISCARD/ : { *(.note.gnu.property) }
> > > >
> > > > is placed before
> > > >
> > > > .rela.dyn : AT(ADDR(.rela.dyn) - (0xc000000000000000 -0x00000000))
> > > >  {
> > > >   __rela_dyn_start = .;
> > > >   *(.rela*) <<<<<<<< Keep .rela* sections
> > > >  }
> > > >
> > > > Then .rela* in
> > > >
> > > >  /DISCARD/ : {
> > > >   *(*.EMB.apuinfo)
> > > >   *(.glink .iplt .plt .rela* .comment)
> > > >   *(.gnu.version*)
> > > >   *(.gnu.attributes)
> > > >   *(.eh_frame)
> > > >  }
> > > >
> > > > is honored.  Can someone from POWERPC comment on it?
> > >
> > > Hmm OK. I'm not really a toolchain person.
> > >
> > > The comment on DISCARDS says:
> > >
> > >    * Some archs want to discard exit text/data at runtime rather than
> > >    * link time due to cross-section references such as alt instructions,
> > >    * bug table, eh_frame, etc.  DISCARDS must be the last of output
> > >    * section definitions so that such archs put those in earlier section
> > >    * definitions.
> > >    */
> > >
> > > But I guess you're changing those semantics in your series.
> > >
> > > This seems to fix the warning for me?
> > >
> > > diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
> > > index b4c89a1acebb..076b3e8a849d 100644
> > > --- a/arch/powerpc/kernel/vmlinux.lds.S
> > > +++ b/arch/powerpc/kernel/vmlinux.lds.S
> > > @@ -365,9 +365,12 @@ SECTIONS
> > >         DISCARDS
> > >         /DISCARD/ : {
> > >                 *(*.EMB.apuinfo)
> > > -               *(.glink .iplt .plt .rela* .comment)
> > > +               *(.glink .iplt .plt .comment)
> > >                 *(.gnu.version*)
> > >                 *(.gnu.attributes)
> > >                 *(.eh_frame)
> > > +#ifndef CONFIG_RELOCATABLE
> > > +               *(.rela*)
> > > +#endif
> > >         }
> > >  }
> > >
> > >
> > > cheers
> >
> > This looks correct me.
> >
> > Reviewed-by: H.J. Lu <hjl.tools@gmail.com>
> >
> > Thanks.
> >
>
> Has this been merged into any branch yet?  I just checked the tip tree and did
> not see it.
>

FYI, my patches have been queued on x86/build branch.   Could someone
from PPC community add this patch to PPC kernel to avoid upcoming PPC
kernel build failure?

Thanks.

-- 
H.J.
