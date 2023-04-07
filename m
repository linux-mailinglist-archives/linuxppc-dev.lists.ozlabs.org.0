Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7D86DB6E7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 01:09:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtYwq36CLz3fWS
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 09:09:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=AhzIPIoW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=AhzIPIoW;
	dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PtYvx16qNz3c7s
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 09:08:59 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id l184so15964025pgd.11
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Apr 2023 16:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680908936; x=1683500936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/A9yoOa2sBpUnZIMrQVqmsVGIbqBmbp6pkbYZ4l6UU=;
        b=AhzIPIoWtUHXfiZAGqj7Rh0bGux7x12APDYsEuR6hOMdIkSo29jtI/VJ/WdcMY6r9u
         N4rZMnqz+lp6KnK7yOPo2xAhLDgFMWl9isRqcqS2ZoJCGuftfrOehqNHqpok3HslgeIR
         /4h+nNK/8QEzWQ1QzmGerO22l/rADw49EZtQhWeBI+d+1jcetYxSBT3DjjNEnkkxTU05
         U+isNCl6gov9gwbOkThLeDfxwkemOFhSEoxF6rmIFY3MdKyo7jygNnFPumxBne9tiTRK
         Po2nDkrACosdwk/prT78kKxhApms5YMGxsJfZe3pXbXbeJcO9d8RCsmjp5HpDdMcoWTa
         GiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680908936; x=1683500936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/A9yoOa2sBpUnZIMrQVqmsVGIbqBmbp6pkbYZ4l6UU=;
        b=TpNOjgjg6vJsfKjeKgiZ755HTfg2DClmqNeKnA4qDD+j9JqnwrzOY2ZJ/jwrMk7afL
         MNYjucxmxxoKjsZcKdGgo/UD2s9ArJuFajVES2U7CN0MV9WMA7NjQTbahgys+0lGH0el
         Iu9fsERDmW07XB+KjRr52aM1YARCSyNvA3hU/0ayTjzKsCkIqf1KsLP9+xtib496qVID
         SylJ03r+KGfv5nwLb0qQoOO/ikt3rCF3pnksIL7XEjieZirS5ijn6WEC+eMxvASiBltv
         5rJaB29ALLiYmcVUsjK8pI+Qytqqcy2Ws6AmprvfspwM+iPgSgXXfXodxmomeRnYu85C
         iaXQ==
X-Gm-Message-State: AAQBX9f77+of4CgqxYEkOQuzKAF3OkMgWrvs6iQh3V6C0XZMM+m2qo2p
	0oJxfZLVKHXyw+lA2yrybKD1ZrjbO9NThEK6rX4NKg==
X-Google-Smtp-Source: AKy350a96OQojp02wkoJRuAsojor0z+CMD9evmEOlOj7kP5JYN9cUpHiLLD6TzRymSJO3R5M4Z/6MncmZRZ3WPdVAzQ=
X-Received: by 2002:a65:6201:0:b0:4fc:2058:fa29 with SMTP id
 d1-20020a656201000000b004fc2058fa29mr782408pgv.1.1680908935492; Fri, 07 Apr
 2023 16:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <202304050954.yskLdczH-lkp@intel.com>
In-Reply-To: <202304050954.yskLdczH-lkp@intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 16:08:43 -0700
Message-ID: <CAKwvOdmXTOaK+JALp+fr4Q_MtVgi23Te9RvLPF8-Sisc3qWQ=A@mail.gmail.com>
Subject: Re: arch/powerpc/kvm/../kernel/head_booke.h:20:6: warning:
 "THREAD_SHIFT" is not defined, evaluates to 0
To: Masahiro Yamada <masahiroy@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Nathan Chancellor <nathan@kernel.org>, kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 4, 2023 at 6:29=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Masahiro,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   76f598ba7d8e2bfb4855b5298caedd5af0c374a8
> commit: 80b6093b55e31c2c40ff082fb32523d4e852954f kbuild: add -Wundef to K=
BUILD_CPPFLAGS for W=3D1 builds
> date:   4 months ago
> config: powerpc-buildonly-randconfig-r003-20230405 (https://download.01.o=
rg/0day-ci/archive/20230405/202304050954.yskLdczH-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D80b6093b55e31c2c40ff082fb32523d4e852954f
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 80b6093b55e31c2c40ff082fb32523d4e852954f
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dpowerpc olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dpowerpc SHELL=3D/bin/bash arch/powerpc/kernel=
/ arch/powerpc/kvm/ virt/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304050954.yskLdczH-lkp@i=
ntel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from arch/powerpc/kvm/bookehv_interrupts.S:26:
> >> arch/powerpc/kvm/../kernel/head_booke.h:20:6: warning: "THREAD_SHIFT" =
is not defined, evaluates to 0 [-Wundef]
>       20 | #if (THREAD_SHIFT < 15)
>          |      ^~~~~~~~~~~~

Should arch/powerpc/kernel/head_booke.h be #include'ing
asm/thread_info.h before using THREAD_SHIFT?

>
>
> vim +/THREAD_SHIFT +20 arch/powerpc/kvm/../kernel/head_booke.h
>
> 1a4b739bbb4f88 Christophe Leroy 2019-04-30  10
> 63dafe5728e735 Becky Bruce      2006-01-14  11  /*
> 63dafe5728e735 Becky Bruce      2006-01-14  12   * Macros used for common=
 Book-e exception handling
> 63dafe5728e735 Becky Bruce      2006-01-14  13   */
> 63dafe5728e735 Becky Bruce      2006-01-14  14
> 63dafe5728e735 Becky Bruce      2006-01-14  15  #define SET_IVOR(vector_n=
umber, vector_label)           \
> 63dafe5728e735 Becky Bruce      2006-01-14  16                  li      r=
26,vector_label@l;             \
> 63dafe5728e735 Becky Bruce      2006-01-14  17                  mtspr   S=
PRN_IVOR##vector_number,r26;   \
> 63dafe5728e735 Becky Bruce      2006-01-14  18                  sync
> 63dafe5728e735 Becky Bruce      2006-01-14  19
> e12401222f749c Yuri Tikhonov    2009-01-29 @20  #if (THREAD_SHIFT < 15)
> e12401222f749c Yuri Tikhonov    2009-01-29  21  #define ALLOC_STACK_FRAME=
(reg, val)                     \
> e12401222f749c Yuri Tikhonov    2009-01-29  22          addi reg,reg,val
> e12401222f749c Yuri Tikhonov    2009-01-29  23  #else
> e12401222f749c Yuri Tikhonov    2009-01-29  24  #define ALLOC_STACK_FRAME=
(reg, val)                     \
> e12401222f749c Yuri Tikhonov    2009-01-29  25          addis   reg,reg,v=
al@ha;                         \
> e12401222f749c Yuri Tikhonov    2009-01-29  26          addi    reg,reg,v=
al@l
> e12401222f749c Yuri Tikhonov    2009-01-29  27  #endif
> e12401222f749c Yuri Tikhonov    2009-01-29  28
>
> :::::: The code at line 20 was first introduced by commit
> :::::: e12401222f749c37277a313d631dc024bbfd3b00 powerpc/44x: Support for =
256KB PAGE_SIZE
>
> :::::: TO: Yuri Tikhonov <yur@emcraft.com>
> :::::: CC: Josh Boyer <jwboyer@linux.vnet.ibm.com>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests



--=20
Thanks,
~Nick Desaulniers
