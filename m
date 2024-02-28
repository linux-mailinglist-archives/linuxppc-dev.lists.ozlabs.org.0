Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4DF86B149
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 15:08:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZwHMsaBe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlGRb3nLrz3vdQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 01:08:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZwHMsaBe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::ab; helo=out-171.mta1.migadu.com; envelope-from=vadim.fedorenko@linux.dev; receiver=lists.ozlabs.org)
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [IPv6:2001:41d0:203:375::ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlGQn1C6Xz3fQR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 01:07:57 +1100 (AEDT)
Message-ID: <85b78dad-affa-47c3-9cd0-79a4321460b8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709129249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vM/KfHgUOwY2lvB0mjrY169vFxTeITIHZRgep2xkV9c=;
	b=ZwHMsaBeOCPMcixCVbnytMfUemQGQhlm0UygvzwBIDGjehrH3MJkjDwdE90CR6NxSjuhHg
	0kJL2hFNLJ3ccAdj1qETsMhAwKdq6bYZN1/uXnIw/tmlsLvgNN4SwK6oOWvApA2O33I8JU
	/wtd+U6BrFrwyTkSN86fs7iu/4GJ6tM=
Date: Wed, 28 Feb 2024 14:07:21 +0000
MIME-Version: 1.0
Subject: Re: [revert 0d60d8df6f49] [net/net-next] [6.8-rc5] Build Failure
Content-Language: en-US
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 edumazet@google.com
References: <3fcf3a2c-1c1b-42c1-bacb-78fdcd700389@linux.vnet.ibm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <3fcf3a2c-1c1b-42c1-bacb-78fdcd700389@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: venkat88@linux.vnet.ibm.com, "mputtash@linux.vnet.com" <mputtash@linux.vnet.com>, Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>, arkadiusz.kubalewski@intel.com, "sachinp@linux.vnet.com" <sachinp@linux.vnet.com>, "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>, jiri@nvidia.com, kuba@kernel.org, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 28/02/2024 11:09, Tasmiya Nalatwad wrote:
> Greetings,
> 
> [revert 0d60d8df6f49] [net/net-next] [6.8-rc5] Build Failure
> 
> Reverting below commit fixes the issue
> 
> commit 0d60d8df6f493bb46bf5db40d39dd60a1bafdd4e
>      dpll: rely on rcu for netdev_dpll_pin()
> 
> --- Traces ---
> 
> ./include/linux/dpll.h: In function ‘netdev_dpll_pin’:
> ./include/linux/rcupdate.h:439:9: error: dereferencing pointer to 
> incomplete type ‘struct dpll_pin’
>    typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
>           ^
> ./include/linux/rcupdate.h:587:2: note: in expansion of macro 
> ‘__rcu_dereference_check’
>    __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
>    ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/rtnetlink.h:70:2: note: in expansion of macro 
> ‘rcu_dereference_check’
>    rcu_dereference_check(p, lockdep_rtnl_is_held())
>    ^~~~~~~~~~~~~~~~~~~~~
> ./include/linux/dpll.h:175:9: note: in expansion of macro 
> ‘rcu_dereference_rtnl’
>    return rcu_dereference_rtnl(dev->dpll_pin);
>           ^~~~~~~~~~~~~~~~~~~~
> make[4]: *** [scripts/Makefile.build:243: drivers/dpll/dpll_core.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
>    AR      net/mpls/built-in.a
>    AR      net/l3mdev/built-in.a
> In file included from ./include/linux/rbtree.h:24,
>                   from ./include/linux/mm_types.h:11,
>                   from ./include/linux/mmzone.h:22,
>                   from ./include/linux/gfp.h:7,
>                   from ./include/linux/umh.h:4,
>                   from ./include/linux/kmod.h:9,
>                   from ./include/linux/module.h:17,
>                   from drivers/dpll/dpll_netlink.c:9:
> ./include/linux/dpll.h: In function ‘netdev_dpll_pin’:
> ./include/linux/rcupdate.h:439:9: error: dereferencing pointer to 
> incomplete type ‘struct dpll_pin’
>    typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
>           ^
> ./include/linux/rcupdate.h:587:2: note: in expansion of macro 
> ‘__rcu_dereference_check’
>    __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
>    ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/rtnetlink.h:70:2: note: in expansion of macro 
> ‘rcu_dereference_check’
>    rcu_dereference_check(p, lockdep_rtnl_is_held())
>    ^~~~~~~~~~~~~~~~~~~~~
> ./include/linux/dpll.h:175:9: note: in expansion of macro 
> ‘rcu_dereference_rtnl’
>    return rcu_dereference_rtnl(dev->dpll_pin);
>           ^~~~~~~~~~~~~~~~~~~~
> make[4]: *** [scripts/Makefile.build:243: drivers/dpll/dpll_netlink.o] 
> Error 1
> make[3]: *** [scripts/Makefile.build:481: drivers/dpll] Error 2
> make[3]: *** Waiting for unfinished jobs....
> In file included from ./arch/powerpc/include/generated/asm/rwonce.h:1,
>                   from ./include/linux/compiler.h:251,
>                   from ./include/linux/instrumented.h:10,
>                   from ./include/linux/uaccess.h:6,
>                   from net/core/dev.c:71:
> net/core/dev.c: In function ‘netdev_dpll_pin_assign’:
> ./include/linux/rcupdate.h:462:36: error: dereferencing pointer to 
> incomplete type ‘struct dpll_pin’
>   #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
>                                      ^~~~
> ./include/asm-generic/rwonce.h:55:33: note: in definition of macro 
> ‘__WRITE_ONCE’
>    *(volatile typeof(x) *)&(x) = (val);    \
>                                   ^~~
> ./arch/powerpc/include/asm/barrier.h:76:2: note: in expansion of macro 
> ‘WRITE_ONCE’
>    WRITE_ONCE(*p, v);      \
>    ^~~~~~~~~~
> ./include/asm-generic/barrier.h:172:55: note: in expansion of macro 
> ‘__smp_store_release’
>   #define smp_store_release(p, v) do { kcsan_release(); 
> __smp_store_release(p, v); } while (0)
> ^~~~~~~~~~~~~~~~~~~
> ./include/linux/rcupdate.h:503:3: note: in expansion of macro 
> ‘smp_store_release’
>     smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
>     ^~~~~~~~~~~~~~~~~
> ./include/linux/rcupdate.h:503:25: note: in expansion of macro 
> ‘RCU_INITIALIZER’
>     smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
>                           ^~~~~~~~~~~~~~~
> net/core/dev.c:9081:2: note: in expansion of macro ‘rcu_assign_pointer’
>    rcu_assign_pointer(dev->dpll_pin, dpll_pin);
>    ^~~~~~~~~~~~~~~~~~
> make[4]: *** [scripts/Makefile.build:243: net/core/dev.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
>    AR      drivers/net/ethernet/built-in.a
>    AR      drivers/net/built-in.a
>    AR      net/dcb/built-in.a
>    AR      net/netlabel/built-in.a
>    AR      net/strparser/built-in.a
>    AR      net/handshake/built-in.a
>    GEN     lib/test_fortify.log
>    AR      net/8021q/built-in.a
>    AR      net/nsh/built-in.a
>    AR      net/unix/built-in.a
>    CC      lib/string.o
>    AR      net/packet/built-in.a
>    AR      net/switchdev/built-in.a
>    AR      lib/lib.a
>    AR      net/mptcp/built-in.a
>    AR      net/devlink/built-in.a
> In file included from ./include/linux/rbtree.h:24,
>                   from ./include/linux/mm_types.h:11,
>                   from ./include/linux/mmzone.h:22,
>                   from ./include/linux/gfp.h:7,
>                   from ./include/linux/umh.h:4,
>                   from ./include/linux/kmod.h:9,
>                   from ./include/linux/module.h:17,
>                   from net/core/rtnetlink.c:17:
> ./include/linux/dpll.h: In function ‘netdev_dpll_pin’:
> ./include/linux/rcupdate.h:439:9: error: dereferencing pointer to 
> incomplete type ‘struct dpll_pin’
>    typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
>           ^
> ./include/linux/rcupdate.h:587:2: note: in expansion of macro 
> ‘__rcu_dereference_check’
>    __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
>    ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/rtnetlink.h:70:2: note: in expansion of macro 
> ‘rcu_dereference_check’
>    rcu_dereference_check(p, lockdep_rtnl_is_held())
>    ^~~~~~~~~~~~~~~~~~~~~
> ./include/linux/dpll.h:175:9: note: in expansion of macro 
> ‘rcu_dereference_rtnl’
>    return rcu_dereference_rtnl(dev->dpll_pin);
>           ^~~~~~~~~~~~~~~~~~~~
> In file included from net/core/rtnetlink.c:60:
> ./include/linux/dpll.h:179:1: error: control reaches end of non-void 
> function [-Werror=return-type]
>   }
> 

Hi, Eric!

Looks like we have to move struct dpll_pin definition to 
include/linux/dpll.h to have this fixed, right?

