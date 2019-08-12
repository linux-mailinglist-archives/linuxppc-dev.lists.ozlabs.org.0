Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 701C189DB4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 14:10:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466ZRj0MRczDqdd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 22:10:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466ZPC1JbwzDqQm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 22:08:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 466ZP80TPMz9sPT; Mon, 12 Aug 2019 22:08:12 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 466ZP7286pz9sPP;
 Mon, 12 Aug 2019 22:08:11 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: kbuild test robot <lkp@intel.com>,
 "Christopher M. Riedl" <cmr@informatik.wtf>
Subject: Re: [PATCH v3 1/3] powerpc/spinlocks: Refactor SHARED_PROCESSOR
In-Reply-To: <201908120917.L7bXpUsz%lkp@intel.com>
References: <20190806030112.15232-2-cmr@informatik.wtf>
 <201908120917.L7bXpUsz%lkp@intel.com>
Date: Mon, 12 Aug 2019 22:08:12 +1000
Message-ID: <878srysi1f.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org, kbuild-all@01.org,
 Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kbuild test robot <lkp@intel.com> writes:
> Hi "Christopher,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on linus/master]
> [cannot apply to v5.3-rc4 next-20190809]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Christopher-M-Riedl/Fix-oops-in-shared-processor-spinlocks/20190806-204502
> config: powerpc-powernv_defconfig (attached as .config)
> compiler: powerpc64le-linux-gcc (GCC) 7.4.0
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
>    In file included from include/linux/spinlock.h:89:0,
>                     from include/linux/seqlock.h:36,
>                     from include/linux/time.h:6,
>                     from include/linux/compat.h:10,
>                     from arch/powerpc/kernel/asm-offsets.c:14:
>    arch/powerpc/include/asm/spinlock.h: In function 'is_shared_processor':
>>> arch/powerpc/include/asm/spinlock.h:119:34: error: 'struct paca_struct' has no member named 'lppaca_ptr'; did you mean 'slb_cache_ptr'?
>       lppaca_shared_proc(local_paca->lppaca_ptr));
>                                      ^~~~~~~~~~
>                                      slb_cache_ptr
>    make[2]: *** [arch/powerpc/kernel/asm-offsets.s] Error 1
>    make[2]: Target '__build' not remade because of errors.
>    make[1]: *** [prepare0] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [sub-make] Error 2
>    7 real  4 user  3 sys  110.24% cpu 	make prepare
>
> vim +119 arch/powerpc/include/asm/spinlock.h
>
>    110	
>    111	static inline bool is_shared_processor(void)
>    112	{
>    113	/*
>    114	 * LPPACA is only available on BOOK3S so guard anything LPPACA related to
>    115	 * allow other platforms (which include this common header) to compile.
>    116	 */
>    117	#ifdef CONFIG_PPC_BOOK3S

I think you should use PPC_PSERIES here and that will fix it.

cheers

>    118		return (IS_ENABLED(CONFIG_PPC_SPLPAR) &&
>  > 119			lppaca_shared_proc(local_paca->lppaca_ptr));
>    120	#else
>    121		return false;
>    122	#endif
>    123	}
>    124	
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
