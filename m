Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEE03632C2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 02:02:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FN9B86y9Qz3bvt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 10:02:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=JTEG1RVX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=JTEG1RVX; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FN99g1T12z2yqD
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Apr 2021 10:02:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=jan+rayNZyuIvP7QAc319+FzdNIqlXIptjr7wP5+bDc=; b=JTEG1RVXhAIPzHRdppONmKOM1M
 6Hu0T6cJeOc0qfV/x6M8grdlevWQ6/tP0GcxkCUppgLkFEJexK79Smh0+008xgc0iPtt1aIajFhgS
 Kl14LifAW9efM5E+wMxYmoA93W/YCEhNoYR8V85SRmuJH3bcROwh/SJQ09lIm0+7nYg3yqB9QBzpm
 f6v8GoANNp4IxXZNMZ+gyLtfYKhpHF6pGoROGtk9IQ52lJr56eDgeIkTJmc2pG9mh8lOh/5gGRaIh
 mZkeyANN4CaGTdV8JNM8NIut/FG/7CsuYlq4ClnpHApHoS3ycxaRJFtlNxKKFY5pNMRHxsa5ftVZm
 MmAM6dgQ==;
Received: from [2601:1c0:6280:3f0::df68]
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lXut5-006dnd-Jb; Sun, 18 Apr 2021 00:02:08 +0000
Subject: Re: mmu.c:undefined reference to `patch__hash_page_A0'
To: kernel test robot <lkp@intel.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <202102271820.WlZCxtzY-lkp@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <06227600-c5c5-3da7-a495-ae0b0849b62d@infradead.org>
Date: Sat, 17 Apr 2021 17:02:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <202102271820.WlZCxtzY-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

HI--

I no longer see this build error.
However:

On 2/27/21 2:24 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   3fb6d0e00efc958d01c2f109c8453033a2d96796
> commit: 259149cf7c3c6195e6199e045ca988c31d081cab powerpc/32s: Only build hash code when CONFIG_PPC_BOOK3S_604 is selected
> date:   4 weeks ago
> config: powerpc64-randconfig-r013-20210227 (attached as .config)

ktr/lkp, this is a PPC32 .config file that is attached, not PPC64.

Also:

> compiler: powerpc-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=259149cf7c3c6195e6199e045ca988c31d081cab
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 259149cf7c3c6195e6199e045ca988c31d081cab
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    powerpc-linux-ld: arch/powerpc/mm/book3s32/mmu.o: in function `MMU_init_hw_patch':
>>> mmu.c:(.init.text+0x75e): undefined reference to `patch__hash_page_A0'
>>> powerpc-linux-ld: mmu.c:(.init.text+0x76a): undefined reference to `patch__hash_page_A0'
>>> powerpc-linux-ld: mmu.c:(.init.text+0x776): undefined reference to `patch__hash_page_A1'
>    powerpc-linux-ld: mmu.c:(.init.text+0x782): undefined reference to `patch__hash_page_A1'
>>> powerpc-linux-ld: mmu.c:(.init.text+0x78e): undefined reference to `patch__hash_page_A2'
>    powerpc-linux-ld: mmu.c:(.init.text+0x79a): undefined reference to `patch__hash_page_A2'
>>> powerpc-linux-ld: mmu.c:(.init.text+0x7aa): undefined reference to `patch__hash_page_B'
>    powerpc-linux-ld: mmu.c:(.init.text+0x7b6): undefined reference to `patch__hash_page_B'
>>> powerpc-linux-ld: mmu.c:(.init.text+0x7c2): undefined reference to `patch__hash_page_C'
>    powerpc-linux-ld: mmu.c:(.init.text+0x7ce): undefined reference to `patch__hash_page_C'
>>> powerpc-linux-ld: mmu.c:(.init.text+0x7da): undefined reference to `patch__flush_hash_A0'
>    powerpc-linux-ld: mmu.c:(.init.text+0x7e6): undefined reference to `patch__flush_hash_A0'
>>> powerpc-linux-ld: mmu.c:(.init.text+0x7f2): undefined reference to `patch__flush_hash_A1'
>    powerpc-linux-ld: mmu.c:(.init.text+0x7fe): undefined reference to `patch__flush_hash_A1'
>>> powerpc-linux-ld: mmu.c:(.init.text+0x80a): undefined reference to `patch__flush_hash_A2'
>    powerpc-linux-ld: mmu.c:(.init.text+0x816): undefined reference to `patch__flush_hash_A2'
>>> powerpc-linux-ld: mmu.c:(.init.text+0x83e): undefined reference to `patch__flush_hash_B'
>    powerpc-linux-ld: mmu.c:(.init.text+0x84e): undefined reference to `patch__flush_hash_B'
>    powerpc-linux-ld: arch/powerpc/mm/book3s32/mmu.o: in function `update_mmu_cache':
>>> mmu.c:(.text.update_mmu_cache+0xa0): undefined reference to `add_hash_page'

I do see this build error:

powerpc-linux-ld: arch/powerpc/boot/wrapper.a(decompress.o): in function `partial_decompress':
decompress.c:(.text+0x1f0): undefined reference to `__decompress'

when either
CONFIG_KERNEL_LZO=y
or
CONFIG_KERNEL_LZMA=y

but the build succeeds when either
CONFIG_KERNEL_GZIP=y
or
CONFIG_KERNEL_XZ=y

I guess that is due to arch/powerpc/boot/decompress.c doing this:

#ifdef CONFIG_KERNEL_GZIP
#	include "decompress_inflate.c"
#endif

#ifdef CONFIG_KERNEL_XZ
#	include "xz_config.h"
#	include "../../../lib/decompress_unxz.c"
#endif


It would be nice to require one of KERNEL_GZIP or KERNEL_XZ
to be set/enabled (maybe unless a uImage is being built?).

ta.
-- 
~Randy

