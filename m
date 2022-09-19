Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A853B5BC293
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 07:39:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWD5K6s2rz3bxp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 15:39:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eftX36TL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWD4l6g3qz2xrr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 15:39:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eftX36TL;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MWD4l2T45z4xGZ;
	Mon, 19 Sep 2022 15:39:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1663565943;
	bh=BNw8Kj93vFdHtU4RDsx3vJD7dlfVJXP/v0QQYRC7Fdw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eftX36TL5QnYlyLY/Zobc2FdKVoNox3a/JDQKQQNmwH6Qik7VwDlwBizRnCjxWJSZ
	 2R6b9FCJMmoKMDgCSGcsP6KDtEFKNhRrNRGdxLVIlsFR4R6s1cTRlhQxH/Fn1505Ab
	 xc7i5A+g2nnLKBBdtRo1kJEJkYY0z6fIbB5Ih2OaY1pBUqR9Jb7Dl0B9KLaIYLNA08
	 x+1sS19mxTLFR2IHYD9z1xmAbn3L41QgNX+jfKP+gi1J+817wFbKVgtHvZvtm0PNMQ
	 JtrRZyDUOtj3WgXmM4Md/eHfzhVJFRq79tCyWXbo7T0TNbJ4bAdckswDAxrpb6QzXe
	 eUXKSFxerEcaA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: kernel test robot <lkp@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 3/7] powerpc/build: move got, toc, plt, branch_lt
 sections to read-only
In-Reply-To: <202209180437.4U3soljK-lkp@intel.com>
References: <20220916040755.2398112-4-npiggin@gmail.com>
 <202209180437.4U3soljK-lkp@intel.com>
Date: Mon, 19 Sep 2022 15:39:02 +1000
Message-ID: <87mtavly89.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kernel test robot <lkp@intel.com> writes:
> Hi Nicholas,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on powerpc/next]
> [also build test ERROR on linus/master v6.0-rc5 next-20220916]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Nicholas-Piggin/powerpc-build-linker-improvements/20220916-121310
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> config: powerpc-microwatt_defconfig (https://download.01.org/0day-ci/archive/20220918/202209180437.4U3soljK-lkp@intel.com/config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install powerpc cross compiling tool for clang build
>         # apt-get install binutils-powerpc-linux-gnu
>         # https://github.com/intel-lab-lkp/linux/commit/6c034c08f8d0addb6fecba38c9c428b1c4df7c29
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Nicholas-Piggin/powerpc-build-linker-improvements/20220916-121310
>         git checkout 6c034c08f8d0addb6fecba38c9c428b1c4df7c29
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash
                                                    ^^^^^

> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>>> ld.lld: error: ./arch/powerpc/kernel/vmlinux.lds:46: { expected, but got SPECIAL
>    >>>  .got : AT(ADDR(.got) - (0xc0000000 -0x00000000)) SPECIAL {
>    >>>                                                   ^

I guess SPECIAL is a binutils ld ism?

I can't find it documented anywhere.

Presumably we can just not use it, given we never did before?

cheers
