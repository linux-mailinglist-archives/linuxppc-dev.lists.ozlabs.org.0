Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAE390AEF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 00:28:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 469HyM3TsgzDsFV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 08:27:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 469HvG3Y1pzDrvF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2019 08:25:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 469HvF2Wcpz9sBF;
 Sat, 17 Aug 2019 08:25:13 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: kbuild test robot <lkp@intel.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 09/44] powerpc/64s/pseries: machine check convert to
 use common event code
In-Reply-To: <201908081219.GBBn7JtE%lkp@intel.com>
References: <20190802105709.27696-10-npiggin@gmail.com>
 <201908081219.GBBn7JtE%lkp@intel.com>
Date: Sat, 17 Aug 2019 08:25:08 +1000
Message-ID: <875zmw7np7.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@01.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kbuild test robot <lkp@intel.com> writes:
> Hi Nicholas,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on linus/master]
> [cannot apply to v5.3-rc3 next-20190807]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Nicholas-Piggin/powerpc-64s-exception-cleanup-and-macrofiy/20190802-222211
> config: powerpc-defconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=powerpc 
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    arch/powerpc/platforms/pseries/ras.c: In function 'mce_handle_error':
>>> arch/powerpc/platforms/pseries/ras.c:563:28: error: this statement may fall through [-Werror=implicit-fallthrough=]
>        mce_err.u.ue_error_type = MCE_UE_ERROR_IFETCH;
>        ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/platforms/pseries/ras.c:564:3: note: here
>       case MC_ERROR_UE_PAGE_TABLE_WALK_IFETCH:
>       ^~~~
>    arch/powerpc/platforms/pseries/ras.c:565:28: error: this statement may fall through [-Werror=implicit-fallthrough=]
>        mce_err.u.ue_error_type = MCE_UE_ERROR_PAGE_TABLE_WALK_IFETCH;
>        ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/platforms/pseries/ras.c:566:3: note: here
>       case MC_ERROR_UE_LOAD_STORE:
>       ^~~~
>    arch/powerpc/platforms/pseries/ras.c:567:28: error: this statement may fall through [-Werror=implicit-fallthrough=]
>        mce_err.u.ue_error_type = MCE_UE_ERROR_LOAD_STORE;
>        ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/platforms/pseries/ras.c:568:3: note: here
>       case MC_ERROR_UE_PAGE_TABLE_WALK_LOAD_STORE:
>       ^~~~
>    arch/powerpc/platforms/pseries/ras.c:569:28: error: this statement may fall through [-Werror=implicit-fallthrough=]
>        mce_err.u.ue_error_type = MCE_UE_ERROR_PAGE_TABLE_WALK_LOAD_STORE;
>        ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/platforms/pseries/ras.c:570:3: note: here
>       case MC_ERROR_UE_INDETERMINATE:
>       ^~~~
>    cc1: all warnings being treated as errors

I think you meant to break in all these cases?

cheers
