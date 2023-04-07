Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9EE6DB710
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 01:15:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtZ3s1NBtz3fTR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 09:15:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ByBI9RNP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ByBI9RNP;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PtZ2z2QvBz3chb
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 09:15:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0C91965549;
	Fri,  7 Apr 2023 23:15:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187AAC433EF;
	Fri,  7 Apr 2023 23:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680909302;
	bh=eVPMrVHJu8S6/AV9JoIyXesIKaGwbrhFt6Aeyu8JnC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ByBI9RNPnH/VZd+G7KFu2un4q2UzvQdABlt08r22ZeBJfq/eck31eQXZA5747D3LK
	 PTdt5dqFr84muP7tva6/V7KcEEGDCNF6R7tEw1puEFitkPw4Mn3bKNiuqtTrZYwwLA
	 BymZnTGmzYLa3UJCXZZD6pwVBUs/NFfXC7RrK7XY4uR5gDLdU4XNUn+AwsdaNeJdiF
	 OcNkRJtK/JM2TFtspLumgbeYT/jVNlbDVjr3ESpxd+HpJVbXBJzD5+X+/z/skQYMLs
	 nTS2sNz6mbe8mCznT64v9r8SXliA05v1zQS85iCqyu3oq1US5mE+U8esF9svexREUc
	 rmC4rPAhB3f4g==
Date: Fri, 7 Apr 2023 16:15:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: arch/powerpc/kvm/../kernel/head_booke.h:20:6: warning:
 "THREAD_SHIFT" is not defined, evaluates to 0
Message-ID: <20230407231500.GA2598451@dev-arch.thelio-3990X>
References: <202304050954.yskLdczH-lkp@intel.com>
 <CAKwvOdmXTOaK+JALp+fr4Q_MtVgi23Te9RvLPF8-Sisc3qWQ=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdmXTOaK+JALp+fr4Q_MtVgi23Te9RvLPF8-Sisc3qWQ=A@mail.gmail.com>
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
Cc: kernel test robot <lkp@intel.com>, Masahiro Yamada <masahiroy@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 07, 2023 at 04:08:43PM -0700, Nick Desaulniers wrote:
> On Tue, Apr 4, 2023 at 6:29 PM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Masahiro,
> >
> > FYI, the error/warning still remains.
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   76f598ba7d8e2bfb4855b5298caedd5af0c374a8
> > commit: 80b6093b55e31c2c40ff082fb32523d4e852954f kbuild: add -Wundef to KBUILD_CPPFLAGS for W=1 builds
> > date:   4 months ago
> > config: powerpc-buildonly-randconfig-r003-20230405 (https://download.01.org/0day-ci/archive/20230405/202304050954.yskLdczH-lkp@intel.com/config)
> > compiler: powerpc-linux-gcc (GCC) 12.1.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=80b6093b55e31c2c40ff082fb32523d4e852954f
> >         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout 80b6093b55e31c2c40ff082fb32523d4e852954f
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/ arch/powerpc/kvm/ virt/
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202304050954.yskLdczH-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    In file included from arch/powerpc/kvm/bookehv_interrupts.S:26:
> > >> arch/powerpc/kvm/../kernel/head_booke.h:20:6: warning: "THREAD_SHIFT" is not defined, evaluates to 0 [-Wundef]
> >       20 | #if (THREAD_SHIFT < 15)
> >          |      ^~~~~~~~~~~~
> 
> Should arch/powerpc/kernel/head_booke.h be #include'ing
> asm/thread_info.h before using THREAD_SHIFT?

I think so, sorry for not cc'ing you on
https://lore.kernel.org/linuxppc-dev/20230406-wundef-thread_shift_booke-v1-1-8deffa4d84f9@kernel.org/

> >
> >
> > vim +/THREAD_SHIFT +20 arch/powerpc/kvm/../kernel/head_booke.h
> >
> > 1a4b739bbb4f88 Christophe Leroy 2019-04-30  10
> > 63dafe5728e735 Becky Bruce      2006-01-14  11  /*
> > 63dafe5728e735 Becky Bruce      2006-01-14  12   * Macros used for common Book-e exception handling
> > 63dafe5728e735 Becky Bruce      2006-01-14  13   */
> > 63dafe5728e735 Becky Bruce      2006-01-14  14
> > 63dafe5728e735 Becky Bruce      2006-01-14  15  #define SET_IVOR(vector_number, vector_label)           \
> > 63dafe5728e735 Becky Bruce      2006-01-14  16                  li      r26,vector_label@l;             \
> > 63dafe5728e735 Becky Bruce      2006-01-14  17                  mtspr   SPRN_IVOR##vector_number,r26;   \
> > 63dafe5728e735 Becky Bruce      2006-01-14  18                  sync
> > 63dafe5728e735 Becky Bruce      2006-01-14  19
> > e12401222f749c Yuri Tikhonov    2009-01-29 @20  #if (THREAD_SHIFT < 15)
> > e12401222f749c Yuri Tikhonov    2009-01-29  21  #define ALLOC_STACK_FRAME(reg, val)                     \
> > e12401222f749c Yuri Tikhonov    2009-01-29  22          addi reg,reg,val
> > e12401222f749c Yuri Tikhonov    2009-01-29  23  #else
> > e12401222f749c Yuri Tikhonov    2009-01-29  24  #define ALLOC_STACK_FRAME(reg, val)                     \
> > e12401222f749c Yuri Tikhonov    2009-01-29  25          addis   reg,reg,val@ha;                         \
> > e12401222f749c Yuri Tikhonov    2009-01-29  26          addi    reg,reg,val@l
> > e12401222f749c Yuri Tikhonov    2009-01-29  27  #endif
> > e12401222f749c Yuri Tikhonov    2009-01-29  28
> >
> > :::::: The code at line 20 was first introduced by commit
> > :::::: e12401222f749c37277a313d631dc024bbfd3b00 powerpc/44x: Support for 256KB PAGE_SIZE
> >
> > :::::: TO: Yuri Tikhonov <yur@emcraft.com>
> > :::::: CC: Josh Boyer <jwboyer@linux.vnet.ibm.com>
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests
> 
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers
