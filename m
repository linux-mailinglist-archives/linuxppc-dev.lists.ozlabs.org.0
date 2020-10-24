Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 422DF297BD4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Oct 2020 12:31:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CJHSP3VfKzDqvZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Oct 2020 21:31:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CJHNt0RclzDqlR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Oct 2020 21:27:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CJHNs1yYGz9sV1; Sat, 24 Oct 2020 21:27:57 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 mathieu.desnoyers@efficios.com
In-Reply-To: <212d3bc4a52ca71523759517bb9c61f7e477c46a.1603179582.git.christophe.leroy@csgroup.eu>
References: <212d3bc4a52ca71523759517bb9c61f7e477c46a.1603179582.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 1/3] powerpc/uaccess: Don't use "m<>" constraint with
 GCC 4.9
Message-Id: <160353524065.3419015.15517113357931210947.b4-ty@ellerman.id.au>
Date: Sat, 24 Oct 2020 21:27:57 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 20 Oct 2020 07:40:07 +0000 (UTC), Christophe Leroy wrote:
> GCC 4.9 sometimes fails to build with "m<>" constraint in
> inline assembly.
> 
>   CC      lib/iov_iter.o
> In file included from ./arch/powerpc/include/asm/cmpxchg.h:6:0,
>                  from ./arch/powerpc/include/asm/atomic.h:11,
>                  from ./include/linux/atomic.h:7,
>                  from ./include/linux/crypto.h:15,
>                  from ./include/crypto/hash.h:11,
>                  from lib/iov_iter.c:2:
> lib/iov_iter.c: In function 'iovec_from_user.part.30':
> ./arch/powerpc/include/asm/uaccess.h:287:2: error: 'asm' operand has impossible constraints
>   __asm__ __volatile__(    \
>   ^
> ./include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
>  # define unlikely(x) __builtin_expect(!!(x), 0)
>                                           ^
> ./arch/powerpc/include/asm/uaccess.h:583:34: note: in expansion of macro 'unsafe_op_wrap'
>  #define unsafe_get_user(x, p, e) unsafe_op_wrap(__get_user_allowed(x, p), e)
>                                   ^
> ./arch/powerpc/include/asm/uaccess.h:329:10: note: in expansion of macro '__get_user_asm'
>   case 4: __get_user_asm(x, (u32 __user *)ptr, retval, "lwz"); break; \
>           ^
> ./arch/powerpc/include/asm/uaccess.h:363:3: note: in expansion of macro '__get_user_size_allowed'
>    __get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err); \
>    ^
> ./arch/powerpc/include/asm/uaccess.h:100:2: note: in expansion of macro '__get_user_nocheck'
>   __get_user_nocheck((x), (ptr), sizeof(*(ptr)), false)
>   ^
> ./arch/powerpc/include/asm/uaccess.h:583:49: note: in expansion of macro '__get_user_allowed'
>  #define unsafe_get_user(x, p, e) unsafe_op_wrap(__get_user_allowed(x, p), e)
>                                                  ^
> lib/iov_iter.c:1663:3: note: in expansion of macro 'unsafe_get_user'
>    unsafe_get_user(len, &uiov[i].iov_len, uaccess_end);
>    ^
> make[1]: *** [scripts/Makefile.build:283: lib/iov_iter.o] Error 1
> 
> [...]

Patch 1 applied to powerpc/fixes.

[1/3] powerpc/uaccess: Don't use "m<>" constraint with GCC 4.9
      https://git.kernel.org/powerpc/c/592bbe9c505d9a0ef69260f8c8263df47da2698e

cheers
