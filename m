Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 328B45BE3C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 12:51:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWyyT3Lvgz304J
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 20:51:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lS3GgcAs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lS3GgcAs;
	dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWyxr29cFz2yxc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 20:50:38 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id t190so2155961pgd.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 03:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=HUkaSAo1IOya4d3G9FGaOCxDJgEIAR+69OEJGr38Qv4=;
        b=lS3GgcAsa8leQ5Eu/gRsAwvX6RGOCXTqjk+gdslL4wHU2H02QXBITBuR/2QPjeR/59
         gT580JPk6dsFQLT4N3mkFH/fzNzKDok9oTa2frhwGm5yLmRWEp2k1x6wJHfOGdibxsrr
         nX0eON7rUtxL1C90gwb3qic2OWV4MehjrSUKi9+1QVuYa3dJkgHbxhY332FsP5onQ7rt
         2yNG6tgywdKhUYubPrCFIkyUxK7kKfx0y9VjX4X+rGJdm2n5lmhp8aXJ3GuS1Q+W2pZf
         tsS4uSn4uu0JF8qMJ/1mqe6BZpxSwy+/P7zlmCJJE3CGREl4o3HLFvufKTsRydZsuVuG
         7wbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=HUkaSAo1IOya4d3G9FGaOCxDJgEIAR+69OEJGr38Qv4=;
        b=NVeCIscjl9s/ZTheEz9z82vV8QEXPR2BI8kKWdJY5NticqCciihjaOsLSUvCUgPxui
         kOjs+T3rudpdYuLusjbnLp0jLltoEVbnJ14ezjHZrNNNcvnhJtKRbVI9yX/NhuJ74sFs
         AJNzTtCdxBGQl+wQgBPa1LjTLBRgN8lEhI7w7NRR5sr9jjtAxERsuilpXIhrICem9aT6
         coYGntNe7bwhMPPNiZ/IazLeJ4IStVehMTIMOPtN+QPp/G5wX5kS2ml3Kk6x2LXusues
         9TRJk5OEtQeij/K3l2SoH0JYZTtq1b3THe3Bqg9XIu9w+X7xPkeBXQaws1bZgQGKBeSB
         7now==
X-Gm-Message-State: ACrzQf2Z3n8Dj2gm9LJMNI+a7Nmmol+TzZ7vPQJlliuOp6625ko5gG9V
	nXxLlXrl0NuWIcoLyrd1ipY=
X-Google-Smtp-Source: AMsMyM6PSDM8zqBavSIxknz7nTi4i25IiINMsUGzoFoc9Qv3bV++N9hjffneKGZnizCU2te8KuzwvQ==
X-Received: by 2002:a63:3381:0:b0:439:ef53:fedc with SMTP id z123-20020a633381000000b00439ef53fedcmr11725414pgz.140.1663671036041;
        Tue, 20 Sep 2022 03:50:36 -0700 (PDT)
Received: from localhost ([203.219.227.147])
        by smtp.gmail.com with ESMTPSA id n2-20020a170902d2c200b0017839e5abfasm1105772plc.263.2022.09.20.03.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 03:50:34 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Sep 2022 20:50:28 +1000
Message-Id: <CN165RJCKFUQ.1ZE3WP9S8Q5FF@bobo>
To: "Michael Ellerman" <mpe@ellerman.id.au>, "kernel test robot"
 <lkp@intel.com>, <linuxppc-dev@lists.ozlabs.org>, "Christophe Leroy"
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 3/7] powerpc/build: move got, toc, plt, branch_lt
 sections to read-only
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.11.0
References: <20220916040755.2398112-4-npiggin@gmail.com>
 <202209180437.4U3soljK-lkp@intel.com> <87mtavly89.fsf@mpe.ellerman.id.au>
In-Reply-To: <87mtavly89.fsf@mpe.ellerman.id.au>
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
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Sep 19, 2022 at 3:39 PM AEST, Michael Ellerman wrote:
> kernel test robot <lkp@intel.com> writes:
> > Hi Nicholas,
> >
> > I love your patch! Yet something to improve:
> >
> > [auto build test ERROR on powerpc/next]
> > [also build test ERROR on linus/master v6.0-rc5 next-20220916]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Nicholas-Piggin/=
powerpc-build-linker-improvements/20220916-121310
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.g=
it next
> > config: powerpc-microwatt_defconfig (https://download.01.org/0day-ci/ar=
chive/20220918/202209180437.4U3soljK-lkp@intel.com/config)
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 79=
1a7ae1ba3efd6bca96338e10ffde557ba83920)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install powerpc cross compiling tool for clang build
> >         # apt-get install binutils-powerpc-linux-gnu
> >         # https://github.com/intel-lab-lkp/linux/commit/6c034c08f8d0add=
b6fecba38c9c428b1c4df7c29
> >         git remote add linux-review https://github.com/intel-lab-lkp/li=
nux
> >         git fetch --no-tags linux-review Nicholas-Piggin/powerpc-build-=
linker-improvements/20220916-121310
> >         git checkout 6c034c08f8d0addb6fecba38c9c428b1c4df7c29
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
W=3D1 O=3Dbuild_dir ARCH=3Dpowerpc SHELL=3D/bin/bash
>                                                     ^^^^^
>
> > If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >>> ld.lld: error: ./arch/powerpc/kernel/vmlinux.lds:46: { expected, but =
got SPECIAL
> >    >>>  .got : AT(ADDR(.got) - (0xc0000000 -0x00000000)) SPECIAL {
> >    >>>                                                   ^
>
> I guess SPECIAL is a binutils ld ism?
>
> I can't find it documented anywhere.
>
> Presumably we can just not use it, given we never did before?

Yeah that's what it is, oops I just took it from the linker script.

I think we can drop it, I think it selects either old or new plt
sections that are created with --secure-plt, I guess depending on
some link options and copmatibility concerns. Doesn't look like
ppc32 uses --secure-plt.

Thanks,
Nick

