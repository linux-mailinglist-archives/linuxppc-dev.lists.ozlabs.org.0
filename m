Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECE53636F3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 19:15:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNc623Cjrz3bxg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 03:15:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=X46WcepC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=X46WcepC; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNc5Y1kY6z2yxS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 03:15:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=aY80PP37B2z3w6kpNc6Y6xNgTVaXV4qginCwMz3VuA8=; b=X46WcepCJJWF/04qCy4h16rwMj
 ZLmwlrSMUCZmYmj4T4VyiMGRKSn7FJv7iHYd16u+f1u6AywRyDzvlnz3esrcZNMJrFApRQu4V6iyD
 P4x8UDxPQjxDv3PGZwLXgiyTRXhfJYZgyVvHO57S3bKQ4DwyjlrArFHu8agA9e0Oo+5yfnqTrKlXM
 LmlHbNeGxlTQm30VTt6HbPjnM8bRQBJjG+PwzeWzIPWc2aXVhS76YYO0+kKZ6Aw7xKsIBwb2Z7EFz
 luDatl0OaFuZCsU7K4PToVDY18q9+7///lSHb0jQLlXRA+Zkw++pAJNk3MwGCxWL9w2BhGrr3nP8B
 luuEQEIA==;
Received: from [2601:1c0:6280:3f0::df68]
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lYB0m-008Lfg-D2; Sun, 18 Apr 2021 17:15:08 +0000
Subject: Re: mmu.c:undefined reference to `patch__hash_page_A0'
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 kernel test robot <lkp@intel.com>
References: <202102271820.WlZCxtzY-lkp@intel.com>
 <06227600-c5c5-3da7-a495-ae0b0849b62d@infradead.org>
 <ab9d4f9e-add6-900b-9fa7-83d5f7d1108b@csgroup.eu>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0a301d17-136c-df65-17cc-3c9ddbe06de8@infradead.org>
Date: Sun, 18 Apr 2021 10:15:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <ab9d4f9e-add6-900b-9fa7-83d5f7d1108b@csgroup.eu>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 4/18/21 3:43 AM, Christophe Leroy wrote:
> 
> 
> Le 18/04/2021 à 02:02, Randy Dunlap a écrit :
>> HI--
>>
>> I no longer see this build error.
> 
> Fixed by https://github.com/torvalds/linux/commit/acdad8fb4a1574323db88f98a38b630691574e16
> 
>> However:
>>
>> On 2/27/21 2:24 AM, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>> head:   3fb6d0e00efc958d01c2f109c8453033a2d96796
>>> commit: 259149cf7c3c6195e6199e045ca988c31d081cab powerpc/32s: Only build hash code when CONFIG_PPC_BOOK3S_604 is selected
>>> date:   4 weeks ago
>>> config: powerpc64-randconfig-r013-20210227 (attached as .config)
>>
>> ktr/lkp, this is a PPC32 .config file that is attached, not PPC64.
>>
>> Also:
>>
>>> compiler: powerpc-linux-gcc (GCC) 9.3.0
> 
> ...
> 
>>
>> I do see this build error:
>>
>> powerpc-linux-ld: arch/powerpc/boot/wrapper.a(decompress.o): in function `partial_decompress':
>> decompress.c:(.text+0x1f0): undefined reference to `__decompress'
>>
>> when either
>> CONFIG_KERNEL_LZO=y
>> or
>> CONFIG_KERNEL_LZMA=y
>>
>> but the build succeeds when either
>> CONFIG_KERNEL_GZIP=y
>> or
>> CONFIG_KERNEL_XZ=y
>>
>> I guess that is due to arch/powerpc/boot/decompress.c doing this:
>>
>> #ifdef CONFIG_KERNEL_GZIP
>> #    include "decompress_inflate.c"
>> #endif
>>
>> #ifdef CONFIG_KERNEL_XZ
>> #    include "xz_config.h"
>> #    include "../../../lib/decompress_unxz.c"
>> #endif
>>
>>
>> It would be nice to require one of KERNEL_GZIP or KERNEL_XZ
>> to be set/enabled (maybe unless a uImage is being built?).
> 
> 
> Can you test by https://patchwork.ozlabs.org/project/linuxppc-dev/patch/a74fce4dfc9fa32da6ce3470bbedcecf795de1ec.1591189069.git.christophe.leroy@csgroup.eu/ ?

Hi Christophe,

I get build errors for both LZO and LZMA:

for CONFIG_KERNEL_LZO=y:

In file included from ../lib/decompress_unlzo.c:26:
../include/linux/lzo.h:24:48: error: unknown type name 'size_t'
   24 | int lzo1x_1_compress(const unsigned char *src, size_t src_len,
      |                                                ^~~~~~
../include/linux/lzo.h:1:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
  +++ |+#include <stddef.h>
    1 | /* SPDX-License-Identifier: GPL-2.0 */
../include/linux/lzo.h:25:28: error: unknown type name 'size_t'
   25 |        unsigned char *dst, size_t *dst_len, void *wrkmem);
      |                            ^~~~~~
../include/linux/lzo.h:25:28: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
../include/linux/lzo.h:28:51: error: unknown type name 'size_t'
   28 | int lzorle1x_1_compress(const unsigned char *src, size_t src_len,
      |                                                   ^~~~~~
../include/linux/lzo.h:28:51: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
../include/linux/lzo.h:29:28: error: unknown type name 'size_t'
   29 |        unsigned char *dst, size_t *dst_len, void *wrkmem);
      |                            ^~~~~~
../include/linux/lzo.h:29:28: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
../include/linux/lzo.h:32:53: error: unknown type name 'size_t'
   32 | int lzo1x_decompress_safe(const unsigned char *src, size_t src_len,
      |                                                     ^~~~~~
../include/linux/lzo.h:32:53: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
../include/linux/lzo.h:33:26: error: unknown type name 'size_t'
   33 |      unsigned char *dst, size_t *dst_len);
      |                          ^~~~~~
../include/linux/lzo.h:33:26: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
  CC      drivers/char/tpm/tpm2-space.o
  CC [M]  drivers/regulator/da9121-regulator.o
  AR      drivers/iommu/built-in.a
../lib/decompress_unlzo.c: In function 'unlzo':
../lib/decompress_unlzo.c:237:8: error: implicit declaration of function 'lzo1x_decompress_safe' [-Werror=implicit-function-declaration]
  237 |    r = lzo1x_decompress_safe((u8 *) in_buf, src_len,
      |        ^~~~~~~~~~~~~~~~~~~~~

In file included from ../arch/powerpc/boot/ops.h:15,
                 from ../arch/powerpc/boot/decompress.c:12:
../arch/powerpc/boot/types.h:50:15: error: expected identifier before numeric constant
   50 | #define false 0
      |               ^
../include/linux/stddef.h:11:2: note: in expansion of macro 'false'
   11 |  false = 0,
      |  ^~~~~
In file included from ../include/linux/kasan-checks.h:5,
                 from ../include/asm-generic/rwonce.h:26,
                 from ./arch/powerpc/include/generated/asm/rwonce.h:1,
                 from ../include/linux/compiler.h:248,
                 from ../arch/powerpc/boot/../../../lib/decompress_unlzo.c:32,
                 from ../arch/powerpc/boot/decompress.c:43:
../include/linux/types.h:30:17: error: conflicting types for 'bool'
   30 | typedef _Bool   bool;
      |                 ^~~~
In file included from ../arch/powerpc/boot/ops.h:15,
                 from ../arch/powerpc/boot/decompress.c:12:
../arch/powerpc/boot/types.h:43:13: note: previous declaration of 'bool' was here
   43 | typedef int bool;
      |             ^~~~
In file included from ./arch/powerpc/include/generated/asm/rwonce.h:1,
                 from ../include/linux/compiler.h:248,
                 from ../arch/powerpc/boot/../../../lib/decompress_unlzo.c:32,
                 from ../arch/powerpc/boot/decompress.c:43:
../include/asm-generic/rwonce.h:64:31: error: expected ';' before 'unsigned'
   64 | static __no_sanitize_or_inline
      |                               ^
      |                               ;
   65 | unsigned long __read_once_word_nocheck(const void *addr)
      | ~~~~~~~~                       
../include/asm-generic/rwonce.h:82:28: error: expected ';' before 'unsigned'
   82 | static __no_kasan_or_inline
      |                            ^
      |                            ;
   83 | unsigned long read_word_at_a_time(const void *addr)
      | ~~~~~~~~                    
In file included from ../arch/powerpc/boot/decompress.c:43:
../arch/powerpc/boot/../../../lib/decompress_unlzo.c: In function 'parse_header':
../arch/powerpc/boot/../../../lib/decompress_unlzo.c:48:5: warning: variable 'level' set but not used [-Wunused-but-set-variable]
   48 |  u8 level = 0;
      |     ^~~~~


and for CONFIG_KERNEL_LZMA=y:
(this looks odd to me since it says "unlzo", but I repeated it
after a 'make clean' and got the same errors.)

In file included from ../lib/decompress_unlzo.c:26:
../include/linux/lzo.h:24:48: error: unknown type name 'size_t'
   24 | int lzo1x_1_compress(const unsigned char *src, size_t src_len,
      |                                                ^~~~~~
../include/linux/lzo.h:1:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
  +++ |+#include <stddef.h>
    1 | /* SPDX-License-Identifier: GPL-2.0 */
../include/linux/lzo.h:25:28: error: unknown type name 'size_t'
   25 |        unsigned char *dst, size_t *dst_len, void *wrkmem);
      |                            ^~~~~~
../include/linux/lzo.h:25:28: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
../include/linux/lzo.h:28:51: error: unknown type name 'size_t'
   28 | int lzorle1x_1_compress(const unsigned char *src, size_t src_len,
      |                                                   ^~~~~~
../include/linux/lzo.h:28:51: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
../include/linux/lzo.h:29:28: error: unknown type name 'size_t'
   29 |        unsigned char *dst, size_t *dst_len, void *wrkmem);
      |                            ^~~~~~
../include/linux/lzo.h:29:28: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
../include/linux/lzo.h:32:53: error: unknown type name 'size_t'
   32 | int lzo1x_decompress_safe(const unsigned char *src, size_t src_len,
      |                                                     ^~~~~~
../include/linux/lzo.h:32:53: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
../include/linux/lzo.h:33:26: error: unknown type name 'size_t'
   33 |      unsigned char *dst, size_t *dst_len);
      |                          ^~~~~~
../include/linux/lzo.h:33:26: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
../lib/decompress_unlzo.c: In function 'unlzo':
../lib/decompress_unlzo.c:237:8: error: implicit declaration of function 'lzo1x_decompress_safe' [-Werror=implicit-function-declaration]
  237 |    r = lzo1x_decompress_safe((u8 *) in_buf, src_len,
      |        ^~~~~~~~~~~~~~~~~~~~~


-- 
~Randy

