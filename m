Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A84D1D79C7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 15:26:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Qftf6BHGzDqHw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 23:26:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Qfl33gNqzDqWL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 23:20:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=bwhULTYe; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49Qfl1694vz9sTS;
 Mon, 18 May 2020 23:20:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1589808015;
 bh=RloeE0LdmqKAFSvpaXbVeVj8qQSByHsMtpiN5OEN8FA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bwhULTYedxiW3vCTcPq1HpvpTZ/liHivPDSALic6bvBzZec6hbQyS7NnzjoHOCG/I
 3XFfQuQXNzQP02yVygvIzzynBObCLbOcNjLOdFMbdpHhjhAI/JcjWuJ/53kLefYZrU
 pFoeXYTnLUYJEHbOzoEBNLL2Zl1sr5/AT5lbVwSI1cIIafoy3soMr0elcJiCf0mSkc
 1lGqYgY1hWJxzONtuO8S2HH9K+79wds1tzyjnkngLz16OyXPJIqzITYyd7cAxVHBdE
 VeQb7ldLtjKDQyZbe68K2osL/ckc8LgtrqiH1cTw/mGjH+ZJdepen5zpLGYKAnXOKK
 vyU6PWLjzbhyg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <natechancellor@gmail.com>,
 kbuild test robot <lkp@intel.com>
Subject: Remove WALNUT hacks in serio/i8042 (was Re: ld.lld: error: undefined
 symbol: kb_cs)
In-Reply-To: <20200514030149.GA1841966@ubuntu-s3-xlarge-x86>
References: <202005140845.lthaPgxR%lkp@intel.com>
 <20200514030149.GA1841966@ubuntu-s3-xlarge-x86>
Date: Mon, 18 May 2020 23:20:30 +1000
Message-ID: <87a7254bxd.fsf@mpe.ellerman.id.au>
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
Cc: clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[ Cc += linuxppc-dev ]

Nathan Chancellor <natechancellor@gmail.com> writes:
> On Thu, May 14, 2020 at 08:13:48AM +0800, kbuild test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   24085f70a6e1b0cb647ec92623284641d8270637
>> commit: 5990cdee689c6885b27c6d969a3d58b09002b0bc lib/mpi: Fix building for powerpc with clang
>
> I am certain that this patch did nothing to cause this... Maybe exposed
> it but not the root cause.
>
>> date:   3 weeks ago
>> config: powerpc-randconfig-r034-20200514 (attached as .config)
>> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 310d32cb80a611e6384a921e85607fea05841f26)
>> reproduce:
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # install powerpc cross compiling tool for clang build
>>         # apt-get install binutils-powerpc-linux-gnu
>>         git checkout 5990cdee689c6885b27c6d969a3d58b09002b0bc
>>         # save the attached .config to linux build tree
>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc 
>> 
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kbuild test robot <lkp@intel.com>
>> 
>> All errors (new ones prefixed by >>):
>> 
>> >> ld.lld: error: undefined symbol: kb_cs
>> >>> referenced by i8042-ppcio.h:28 (drivers/input/serio/i8042-ppcio.h:28)
>> >>> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
>> >>> referenced by i8042-ppcio.h:28 (drivers/input/serio/i8042-ppcio.h:28)
>> >>> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
>> >>> referenced by i8042-ppcio.h:28 (drivers/input/serio/i8042-ppcio.h:28)
>> >>> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
>> >>> referenced 45 more times
>> --
>> >> ld.lld: error: undefined symbol: kb_data
>> >>> referenced by i8042.c:309 (drivers/input/serio/i8042.c:309)
>> >>> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
>> >>> referenced by i8042-ppcio.h:33 (drivers/input/serio/i8042-ppcio.h:33)
>> >>> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
>> >>> referenced by i8042.c:319 (drivers/input/serio/i8042.c:319)
>> >>> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
>> >>> referenced 15 more times
>
> kb_cs and kb_data are declared as extern void pointers when
> CONFIG_WALNUT is set, which this config does. However, it looks like
> the definitions of these variables were removed in
> commit  917f0af9e5a9 ("powerpc: Remove arch/ppc and include/asm-ppc"),
> way back in 2.6.27-rc1... So presumably, this has been broken for 12
> years and nobody noticed?

Hmm, nice. 12 years is a pretty typical time frame for finding bugs in
the powerpc tree ... o_O

Our ppc40x_defconfig has CONFIG_SERIO=m, but explicitly disables
CONFIG_SERIO_I8042. And walnut_defconfig disables CONFIG_SERIO.

So I guess it has a PS2 controller but most folks didn't use it?

> Probably means there is a good amount of dead
> code that can be removed, or we could just avoid ever selecting this
> driver with CONFIG_WALNUT (if it does not actually work without the
> special handling from i8042-ppcio.h) while removing the dead code.

I'm inclined to let the driver be selected, rather than carry a wart for
it. I doubt anyone will ever turn it on explicitly, and if they do they
can have fun debugging it.

> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 924c541a9260..59b2f655e39e 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -138,7 +138,7 @@ config PPC
>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>  	select ARCH_KEEP_MEMBLOCK
>  	select ARCH_MIGHT_HAVE_PC_PARPORT
> -	select ARCH_MIGHT_HAVE_PC_SERIO
> +	select ARCH_MIGHT_HAVE_PC_SERIO if !WALNUT
>  	select ARCH_OPTIONAL_KERNEL_RWX		if ARCH_HAS_STRICT_KERNEL_RWX
>  	select ARCH_SUPPORTS_ATOMIC_RMW
>  	select ARCH_USE_BUILTIN_BSWAP

So I'd drop this hunk.

> diff --git a/drivers/input/serio/i8042-ppcio.h b/drivers/input/serio/i8042-ppcio.h
> deleted file mode 100644
> index 391f94d9e47d..000000000000
> --- a/drivers/input/serio/i8042-ppcio.h
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -#ifndef _I8042_PPCIO_H
> -#define _I8042_PPCIO_H
> -
> -
> -#if defined(CONFIG_WALNUT)
> -
> -#define I8042_KBD_IRQ 25
> -#define I8042_AUX_IRQ 26
> -
> -#define I8042_KBD_PHYS_DESC "walnutps2/serio0"
> -#define I8042_AUX_PHYS_DESC "walnutps2/serio1"
> -#define I8042_MUX_PHYS_DESC "walnutps2/serio%d"
> -
> -extern void *kb_cs;
> -extern void *kb_data;
> -
> -#define I8042_COMMAND_REG (*(int *)kb_cs)
> -#define I8042_DATA_REG (*(int *)kb_data)
> -
> -static inline int i8042_read_data(void)
> -{
> -	return readb(kb_data);
> -}
> -
> -static inline int i8042_read_status(void)
> -{
> -	return readb(kb_cs);
> -}
> -
> -static inline void i8042_write_data(int val)
> -{
> -	writeb(val, kb_data);
> -}
> -
> -static inline void i8042_write_command(int val)
> -{
> -	writeb(val, kb_cs);
> -}
> -
> -static inline int i8042_platform_init(void)
> -{
> -	i8042_reset = I8042_RESET_ALWAYS;
> -	return 0;
> -}
> -
> -static inline void i8042_platform_exit(void)
> -{
> -}
> -
> -#else
> -
> -#include "i8042-io.h"
> -
> -#endif
> -
> -#endif /* _I8042_PPCIO_H */
> diff --git a/drivers/input/serio/i8042.h b/drivers/input/serio/i8042.h
> index 38dc27ad3c18..eb376700dfff 100644
> --- a/drivers/input/serio/i8042.h
> +++ b/drivers/input/serio/i8042.h
> @@ -17,8 +17,6 @@
>  #include "i8042-ip22io.h"
>  #elif defined(CONFIG_SNI_RM)
>  #include "i8042-snirm.h"
> -#elif defined(CONFIG_PPC)
> -#include "i8042-ppcio.h"
>  #elif defined(CONFIG_SPARC)
>  #include "i8042-sparcio.h"
>  #elif defined(CONFIG_X86) || defined(CONFIG_IA64)

#elif defined(CONFIG_UNICORE32)
#include "i8042-unicore32io.h"
#else
#include "i8042-io.h"
#endif

The rest of the context is ^

Which makes it clear that your removal of the entire file results in no
change when WALNUT=n.

I'm not sure if anyone really maintains that code, but this is all PPC
really so I think we could merge it.

Do you want to send a proper SOB'ed patch?

cheers
