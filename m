Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A13315387E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 19:53:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CW1B3WK6zDqTX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 05:53:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=hjl.tools@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=isgBFcKo; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CVzn0QQ1zDqR5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2020 05:52:17 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id i6so2938129otr.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Feb 2020 10:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3aoJL06fSGb5A06dlkDHuU+UUCGfR+HTV+83FDox/UU=;
 b=isgBFcKomY7kWKbLgf4DfjPBR4xx6pdH2Puu+QVB70dYG3ezpf0WHsl8sDMZM0SrZL
 XBWfnMPXwKcQWjZfNtZfcAi/0qvo5KMebRNaEAjFASKKkbPjgpsT653AsGzTJthBv8Kf
 gOA5MiDOy5dRaCOzMD0b/CBRmgaqg9rwylK4beki75swzWKRxVDB3QUYZ6tc54UWOilW
 fkvPpHL/bGI1+adC27WQAYlZbUE+22K+YUWa4VGazq7zeoBWfMSB6RK3Le6Bk2CEMO4t
 u1JwGpB0/vmKf0mewFSY7r+rTSTwT+kI3U8c+04/zpBAtT0oRprRD4Vv210FLEOzA0ub
 cc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3aoJL06fSGb5A06dlkDHuU+UUCGfR+HTV+83FDox/UU=;
 b=COtNW+jQPb9trD7TFgA4JQj/uUEoef/Lu8NlXDb7nRA24JOrWP78JN7q5wym3GFC1R
 m/fvqQl+8jZo+sApXzaUg8C5AtqteOJkIW/m/zlbgNrwaubljyArhJbLqyQnv3uR1POJ
 Z/DDQPQznksiYgyFxvWMZVKAiNAUmBfFsDXlCWQjwex5UQ1dkzryv+1h09YHaYfkFlpj
 9q1JdNF4Zmt9nxznJBuwVecoGX7hd7B2P2tP1zFwSZFSJULprsbUSmAxQGgy6MxZffTs
 I5whFbnonQ6ITEYMDO15RtNibTZBGhUFg2vukpOwIr3pOW5rPDubMGLFY/jJK61ONqJW
 lFVw==
X-Gm-Message-State: APjAAAVksBiAVltiCGi8MaarvVnpdZlIcdRlcRNAc9VKZxm7Cyi+cPGf
 iQx22Qhhi1efW7or6rD2ZUPignleRCGfH3x5GDY=
X-Google-Smtp-Source: APXvYqwZ/36nQpN7EEbQK5DSDZAFaQKFZwqP1ZlDtf+BkPCZZDtyyGNKispBc09oUy4Z+l+QTtd1eHxmByDCkXQNiPM=
X-Received: by 2002:a9d:7590:: with SMTP id s16mr25529544otk.89.1580928734294; 
 Wed, 05 Feb 2020 10:52:14 -0800 (PST)
MIME-Version: 1.0
References: <202002050743.dc2PtIsm%lkp@intel.com>
In-Reply-To: <202002050743.dc2PtIsm%lkp@intel.com>
From: "H.J. Lu" <hjl.tools@gmail.com>
Date: Wed, 5 Feb 2020 10:51:38 -0800
Message-ID: <CAMe9rOrJEVL8Qw3fgm9FeDjwGZNxGoZ-OO6bfmV=gtK=g68cvQ@mail.gmail.com>
Subject: Re: [yyu168-linux_cet:cet 55/58] powerpc64le-linux-ld: warning:
 discarding dynamic section .rela___ksymtab+jiffies_to_timeval
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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
 Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 4, 2020 at 3:37 PM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://github.com/yyu168/linux_cet.git cet
> head:   bba707cc4715c1036b6561ab38b16747f9c49cfa
> commit: 71bb971dd76eeacd351690f28864ad5c5bec3691 [55/58] Discard .note.gnu.property sections in generic NOTES
> config: powerpc-rhel-kconfig (attached as .config)
> compiler: powerpc64le-linux-gcc (GCC) 7.5.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 71bb971dd76eeacd351690f28864ad5c5bec3691
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.5.0 make.cross ARCH=powerpc
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    powerpc64le-linux-ld: warning: discarding dynamic section .rela___ksymtab_gpl+__wait_rcu_gp

arch/powerpc/kernel/vmlinux.lds.S has

 .rela.dyn : AT(ADDR(.rela.dyn) - (0xc000000000000000 -0x00000000))
 {
  __rela_dyn_start = .;
  *(.rela*) <<<<<<<< Keep .rela* sections
 }
...
 /DISCARD/ : {
  *(*.EMB.apuinfo)
  *(.glink .iplt .plt .rela* .comment)
                           ^^^^ Discard  .rela* sections.  But it is ignored.
  *(.gnu.version*)
  *(.gnu.attributes)
  *(.eh_frame)
 }

With my

ommit 71bb971dd76eeacd351690f28864ad5c5bec3691
Author: H.J. Lu <hjl.tools@gmail.com>
Date:   Thu Jan 30 12:39:09 2020 -0800

    Discard .note.gnu.property sections in generic NOTES

    With the command-line option, -mx86-used-note=yes, the x86 assembler
    in binutils 2.32 and above generates a program property note in a note
    section, .note.gnu.property, to encode used x86 ISAs and features.  But
    kernel linker script only contains a single NOTE segment:

/DISCARD/ : { *(.note.gnu.property) }

is placed before

.rela.dyn : AT(ADDR(.rela.dyn) - (0xc000000000000000 -0x00000000))
 {
  __rela_dyn_start = .;
  *(.rela*) <<<<<<<< Keep .rela* sections
 }

Then .rela* in

 /DISCARD/ : {
  *(*.EMB.apuinfo)
  *(.glink .iplt .plt .rela* .comment)
  *(.gnu.version*)
  *(.gnu.attributes)
  *(.eh_frame)
 }

is honored.  Can someone from POWERPC comment on it?


-- 
H.J.
