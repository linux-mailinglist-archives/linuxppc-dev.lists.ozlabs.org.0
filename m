Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 358C720EABF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 03:18:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wmhp2SsMzDqVR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 11:18:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wmg06XL0zDqLC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 11:17:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=kDtop+xD; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49wmfz2qYRz9sDX;
 Tue, 30 Jun 2020 11:17:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1593479835;
 bh=c1L8DnWKBEK734+NRCMwarazgG4eaw4rI7iix+fR1fM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=kDtop+xDEp6QqlXkx0SzTxPfqSZeaL8NAwcqTcjv6q34IAtCPjulKUhhnD+7SnUFj
 6woeh33FoYTtI5Rd9M5jonIDa+nbkhTKULpPQ/XjloHpjsVMpNakgC96oS3KmmI74a
 y5j0ZZNyacS46inOgRddJS7op0JOxbQc5nrAcHPzFbax0A5KX5Mdk46P2PPz0zR6SP
 0E7Td3Cs41zmvcYGpYbbI0N5Hlkv2HZd+OrBxphVRpmm3IX0C3e0EinfIokcfq/BuM
 lAYkckZwFbZfYIPagygrZ9AZin/b0DoRct0tdVRTR8J9WZ1NppEaXJlTOxKn80dNfB
 5Vktad6YByV0w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, npiggin@gmail.com,
 segher@kernel.crashing.org
Subject: Re: [PATCH v2] powerpc/uaccess: Use flexible addressing with
 __put_user()/__get_user()
In-Reply-To: <878sg6862r.fsf@mpe.ellerman.id.au>
References: <c2addbd9d76212242d3d8554a2f7ff849fb08b85.1587040754.git.christophe.leroy@c-s.fr>
 <7b916759-1683-b4df-0d4b-b04b3fcd9a02@csgroup.eu>
 <878sg6862r.fsf@mpe.ellerman.id.au>
Date: Tue, 30 Jun 2020 11:19:29 +1000
Message-ID: <875zb98i5a.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Hi Michael,
>>
>> I see this patch is marked as "defered" in patchwork, but I can't see 
>> any related discussion. Is it normal ?
>
> Because it uses the "m<>" constraint which didn't work on GCC 4.6.
>
> https://github.com/linuxppc/issues/issues/297
>
> So we should be able to pick it up for v5.9 hopefully.

It seems to break the build with the kernel.org 4.9.4 compiler and
corenet64_smp_defconfig:

+ make -s CC=powerpc64-linux-gnu-gcc -j 160
In file included from /linux/include/linux/uaccess.h:11:0,
                 from /linux/include/linux/sched/task.h:11,
                 from /linux/include/linux/sched/signal.h:9,
                 from /linux/include/linux/rcuwait.h:6,
                 from /linux/include/linux/percpu-rwsem.h:7,
                 from /linux/include/linux/fs.h:33,
                 from /linux/include/linux/huge_mm.h:8,
                 from /linux/include/linux/mm.h:675,
                 from /linux/arch/powerpc/kernel/signal_32.c:17:
/linux/arch/powerpc/kernel/signal_32.c: In function 'save_user_regs.isra.14.constprop':
/linux/arch/powerpc/include/asm/uaccess.h:161:2: error: 'asm' operand has impossible constraints
  __asm__ __volatile__(     \
  ^
/linux/arch/powerpc/include/asm/uaccess.h:197:12: note: in expansion of macro '__put_user_asm'
    case 4: __put_user_asm(x, ptr, retval, "stw"); break; \
            ^
/linux/arch/powerpc/include/asm/uaccess.h:206:2: note: in expansion of macro '__put_user_size_allowed'
  __put_user_size_allowed(x, ptr, size, retval);  \
  ^
/linux/arch/powerpc/include/asm/uaccess.h:220:2: note: in expansion of macro '__put_user_size'
  __put_user_size(__pu_val, __pu_addr, __pu_size, __pu_err); \
  ^
/linux/arch/powerpc/include/asm/uaccess.h:96:2: note: in expansion of macro '__put_user_nocheck'
  __put_user_nocheck((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
  ^
/linux/arch/powerpc/kernel/signal_32.c:120:7: note: in expansion of macro '__put_user'
   if (__put_user((unsigned int)gregs[i], &frame->mc_gregs[i]))
       ^
/linux/scripts/Makefile.build:280: recipe for target 'arch/powerpc/kernel/signal_32.o' failed
make[3]: *** [arch/powerpc/kernel/signal_32.o] Error 1
make[3]: *** Waiting for unfinished jobs....
In file included from /linux/include/linux/uaccess.h:11:0,
                 from /linux/include/linux/sched/task.h:11,
                 from /linux/include/linux/sched/signal.h:9,
                 from /linux/include/linux/rcuwait.h:6,
                 from /linux/include/linux/percpu-rwsem.h:7,
                 from /linux/include/linux/fs.h:33,
                 from /linux/include/linux/huge_mm.h:8,
                 from /linux/include/linux/mm.h:675,
                 from /linux/arch/powerpc/kernel/signal_64.c:12:
/linux/arch/powerpc/kernel/signal_64.c: In function '__se_sys_swapcontext':
/linux/arch/powerpc/include/asm/uaccess.h:319:2: error: 'asm' operand has impossible constraints
  __asm__ __volatile__(    \
  ^
/linux/arch/powerpc/include/asm/uaccess.h:359:10: note: in expansion of macro '__get_user_asm'
  case 1: __get_user_asm(x, (u8 __user *)ptr, retval, "lbz"); break; \
          ^
/linux/arch/powerpc/include/asm/uaccess.h:370:2: note: in expansion of macro '__get_user_size_allowed'
  __get_user_size_allowed(x, ptr, size, retval);  \
  ^
/linux/arch/powerpc/include/asm/uaccess.h:393:3: note: in expansion of macro '__get_user_size'
   __get_user_size(__gu_val, __gu_addr, __gu_size, __gu_err); \
   ^
/linux/arch/powerpc/include/asm/uaccess.h:94:2: note: in expansion of macro '__get_user_nocheck'
  __get_user_nocheck((x), (ptr), sizeof(*(ptr)), true)
  ^
/linux/arch/powerpc/kernel/signal_64.c:672:9: note: in expansion of macro '__get_user'
      || __get_user(tmp, (u8 __user *) new_ctx + ctx_size - 1))
         ^
/linux/scripts/Makefile.build:280: recipe for target 'arch/powerpc/kernel/signal_64.o' failed
make[3]: *** [arch/powerpc/kernel/signal_64.o] Error 1
/linux/scripts/Makefile.build:497: recipe for target 'arch/powerpc/kernel' failed
make[2]: *** [arch/powerpc/kernel] Error 2
/linux/Makefile:1756: recipe for target 'arch/powerpc' failed
make[1]: *** [arch/powerpc] Error 2
Makefile:185: recipe for target '__sub-make' failed
make: *** [__sub-make] Error 2


cheers
