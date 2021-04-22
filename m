Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A53367749
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 04:16:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQgz60lWYz30BJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 12:16:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=F777hQDb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=F777hQDb; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQgyf1Rmlz2yQq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 12:16:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=JuQAmZqUk3bRNh1XZwrWFpM3HTNgjK1ts7jiO0LN48c=; b=F777hQDbPDuiwIs+waU1S9C5+L
 GpkOWCurFKa85QLdjS7vbpkS0e0K1ZTM3/tsgOmM3RPY+HQuALOiCu3yZB/pAxHlUTwOtTFmMsK/E
 MQGXlT35VrZGI96F7+HEyUdwjsU2BnpQ1JuZW4xvvAEkfn99IvHVJK7c17ByrWuIYAhRydSvXR/rE
 q8MDIsSTCvBZUyOr4yRlbNcbCwky9aRcxVV1waGaAL5qMZqWr6aGS1wEzWmBB50PTx5opG/bJzcUZ
 43lkYfB0WP4Cx3GXnrEwn2mP7hRZeSoXVMDWLB4rMd/lSquSnfWOD1HYIsI1NO5sZ7P0RCdUXQxPp
 3Vsa/e3A==;
Received: from [2601:1c0:6280:3f0::df68]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lZOsy-00HK4T-D3; Thu, 22 Apr 2021 02:16:12 +0000
Subject: Re: mmu.c:undefined reference to `patch__hash_page_A0'
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 kernel test robot <lkp@intel.com>
References: <202102271820.WlZCxtzY-lkp@intel.com>
 <06227600-c5c5-3da7-a495-ae0b0849b62d@infradead.org>
 <ab9d4f9e-add6-900b-9fa7-83d5f7d1108b@csgroup.eu>
 <0a301d17-136c-df65-17cc-3c9ddbe06de8@infradead.org>
 <fce1f2a1-a4ea-03d1-20ab-f0c716884819@csgroup.eu>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <bcc70465-78fa-3b2e-6506-2b9917f21e0d@infradead.org>
Date: Wed, 21 Apr 2021 19:16:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <fce1f2a1-a4ea-03d1-20ab-f0c716884819@csgroup.eu>
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

On 4/21/21 1:43 AM, Christophe Leroy wrote:
> 
> 
> Le 18/04/2021 à 19:15, Randy Dunlap a écrit :
>> On 4/18/21 3:43 AM, Christophe Leroy wrote:
>>>
>>>
>>> Le 18/04/2021 à 02:02, Randy Dunlap a écrit :
>>>> HI--
>>>>
>>>> I no longer see this build error.
>>>
>>> Fixed by https://github.com/torvalds/linux/commit/acdad8fb4a1574323db88f98a38b630691574e16
>>>
>>>> However:
>>>>

...

>>>>
>>>> I do see this build error:
>>>>
>>>> powerpc-linux-ld: arch/powerpc/boot/wrapper.a(decompress.o): in function `partial_decompress':
>>>> decompress.c:(.text+0x1f0): undefined reference to `__decompress'
>>>>
>>>> when either
>>>> CONFIG_KERNEL_LZO=y
>>>> or
>>>> CONFIG_KERNEL_LZMA=y
>>>>
>>>> but the build succeeds when either
>>>> CONFIG_KERNEL_GZIP=y
>>>> or
>>>> CONFIG_KERNEL_XZ=y
>>>>
>>>> I guess that is due to arch/powerpc/boot/decompress.c doing this:
>>>>
>>>> #ifdef CONFIG_KERNEL_GZIP
>>>> #    include "decompress_inflate.c"
>>>> #endif
>>>>
>>>> #ifdef CONFIG_KERNEL_XZ
>>>> #    include "xz_config.h"
>>>> #    include "../../../lib/decompress_unxz.c"
>>>> #endif
>>>>
>>>>
>>>> It would be nice to require one of KERNEL_GZIP or KERNEL_XZ
>>>> to be set/enabled (maybe unless a uImage is being built?).
>>>
>>>
>>> Can you test by https://patchwork.ozlabs.org/project/linuxppc-dev/patch/a74fce4dfc9fa32da6ce3470bbedcecf795de1ec.1591189069.git.christophe.leroy@csgroup.eu/ ?
>>
>> Hi Christophe,
>>
>> I get build errors for both LZO and LZMA:
>>
> 
> Can you check with the following changes on top of my patch:
> 
> diff --git a/lib/decompress_unlzo.c b/lib/decompress_unlzo.c
> index a8dbde4b32d4..f06f925385c0 100644
> --- a/lib/decompress_unlzo.c
> +++ b/lib/decompress_unlzo.c
> @@ -23,13 +23,15 @@
>  #include <linux/decompress/unlzo.h>
>  #endif
> 
> -#include <linux/lzo.h>
>  #ifdef __KERNEL__
>  #include <linux/types.h>
> +#endif
> +#include <linux/lzo.h>
> +#ifdef __KERNEL__
>  #include <linux/decompress/mm.h>
> +#include <linux/compiler.h>
>  #endif
> 
> -#include <linux/compiler.h>
>  #include <asm/unaligned.h>
> 
>  static const unsigned char lzop_magic[] = {

Hi Christophe,
Sorry for the delay -- it's been a very busy day here.

For CONFIG_KERNEL_LZMA=y, I get a couple of warnings:

  BOOTCC  arch/powerpc/boot/decompress.o
In file included from ../arch/powerpc/boot/decompress.c:38:
../arch/powerpc/boot/../../../lib/decompress_unlzma.c: In function 'unlzma':
../arch/powerpc/boot/../../../lib/decompress_unlzma.c:582:21: warning: pointer targets in passing argument 3 of 'rc_init' differ in signedness [-Wpointer-sign]
  582 |  rc_init(&rc, fill, inbuf, in_len);
      |                     ^~~~~
      |                     |
      |                     unsigned char *
../arch/powerpc/boot/../../../lib/decompress_unlzma.c:107:18: note: expected 'char *' but argument is of type 'unsigned char *'
  107 |            char *buffer, long buffer_size)
      |            ~~~~~~^~~~~~


and for CONFIG_KERNEL_LZO=y, this one warning:

  BOOTCC  arch/powerpc/boot/decompress.o
In file included from ../arch/powerpc/boot/decompress.c:43:
../arch/powerpc/boot/../../../lib/decompress_unlzo.c: In function 'parse_header':
../arch/powerpc/boot/../../../lib/decompress_unlzo.c:51:5: warning: variable 'level' set but not used [-Wunused-but-set-variable]
   51 |  u8 level = 0;
      |     ^~~~~

Note: the patch above did not apply cleanly for me so any problems
above could be due to my mangling the patch.
The patch that I used is below.

Thanks.
---
---
 lib/decompress_unlzo.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

--- linux-next-20210421.orig/lib/decompress_unlzo.c
+++ linux-next-20210421/lib/decompress_unlzo.c
@@ -23,13 +23,16 @@
 #include <linux/decompress/unlzo.h>
 #endif
 
-#include <linux/lzo.h>
 #ifdef __KERNEL__
 #include <linux/types.h>
-#include <linux/decompress/mm.h>
 #endif
+#include <linux/lzo.h>
 
+#ifdef __KERNEL__
+#include <linux/decompress/mm.h>
 #include <linux/compiler.h>
+#endif
+
 #include <asm/unaligned.h>
 
 static const unsigned char lzop_magic[] = {

