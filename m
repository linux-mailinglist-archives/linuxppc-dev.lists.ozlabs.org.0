Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 881E310CEE8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 20:31:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P7783lQTzDr8R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 06:31:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p00-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5300::4;
 helo=mo6-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="EAyoXOHU"; 
 dkim-atps=neutral
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P74l5RNjzDr7g
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 06:29:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574969370;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:Message-Id:Subject:Date:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=CvtnadvGqL2BCJUMbOEPy9nNnzHCpkdMOTTcC8t10lw=;
 b=EAyoXOHUnYjDMJzPtMWwsqEVnVOGXb7QjrevaXGr8LsmQj1NlHYREK9Cy5sRqyJZe1
 aNkAl/TwuYT6tAaOWyFuoUcLW/Mp+cZVdfAreQIGHXfmSk+jOGwJ5UOMXOspu7T0FC/W
 XHyFVOZ/ymff5BOcD3cq4WVo+gmZ+Z0aO3uZV6lEKjXpoC+Oute9gkfKJs3FIqWwQDG7
 /L9hhNSTy/Kv9U5F9pmTzysQVpSx5nUllSLja0ROvlpDBdz4qxmY2mqZdUF9VoT+Yn48
 Q70/Y7k0SAwT5QpFtDn1Oi56VRAQAkUVHh4XInaNDOggcm22BZGceVlaJfDg90ob0arl
 B7GA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7NWZ52bo2wXfknY5v9dWftnsnRexkcNBgqH0lksoR"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:818b:c516:c1bb:4ed9:fda8:bd96]
 by smtp.strato.de (RZmta 46.0.0 AUTH) with ESMTPSA id n05ae1vASJTS9z3
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate)
 for <linuxppc-dev@lists.ozlabs.org>;
 Thu, 28 Nov 2019 20:29:28 +0100 (CET)
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Date: Thu, 28 Nov 2019 20:29:27 +0100
Subject: soc: fsl patches
Message-Id: <368499EF-F9F7-4128-9F04-19C01AFED9E5@xenosoft.de>
To: linuxppc-dev@lists.ozlabs.org
X-Mailer: iPhone Mail (16G102)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Rasmus,

I have seen a lot of fsl soc patches from you.

Could you please post what you have modified? Did you test your patches on FS=
L SoC machines?

Thanks,
Christian

Sent from my iPhone

> On 28. Nov 2019, at 16:00, linuxppc-dev-request@lists.ozlabs.org wrote:
>=20
> Send Linuxppc-dev mailing list submissions to
>    linuxppc-dev@lists.ozlabs.org
>=20
> To subscribe or unsubscribe via the World Wide Web, visit
>    https://lists.ozlabs.org/listinfo/linuxppc-dev
> or, via email, send a message with subject or body 'help' to
>    linuxppc-dev-request@lists.ozlabs.org
>=20
> You can reach the person managing the list at
>    linuxppc-dev-owner@lists.ozlabs.org
>=20
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of Linuxppc-dev digest..."
>=20
>=20
> Today's Topics:
>=20
>   1. [PATCH v6 36/49] soc: fsl: qe: make cpm_muram_free() return
>      void (Rasmus Villemoes)
>   2. [PATCH v6 37/49] soc: fsl: qe: make cpm_muram_free() ignore a
>      negative offset (Rasmus Villemoes)
>   3. [PATCH v6 38/49] soc: fsl: qe: drop broken lazy call of
>      cpm_muram_init() (Rasmus Villemoes)
>   4. [PATCH v6 39/49] soc: fsl: qe: refactor
>      cpm_muram_alloc_common to prevent BUG on error path (Rasmus Villemoes=
)
>   5. [PATCH v6 40/49] soc: fsl: qe: avoid IS_ERR_VALUE in
>      ucc_slow.c (Rasmus Villemoes)
>=20
>=20
> ----------------------------------------------------------------------
>=20
> Message: 1
> Date: Thu, 28 Nov 2019 15:55:41 +0100
> From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
>    Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: linuxppc-dev@lists.ozlabs.org,
>    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
>    Scott Wood <oss@buserror.net>, Timur Tabi <timur@kernel.org>, Rasmus
>    Villemoes <linux@rasmusvillemoes.dk>
> Send Linuxppc-dev mailing list submissions to
>    linuxppc-dev@lists.ozlabs.org
>=20
> To subscribe or unsubscribe via the World Wide Web, visit
>    https://lists.ozlabs.org/listinfo/linuxppc-dev
> or, via email, send a message with subject or body 'help' to
>    linuxppc-dev-request@lists.ozlabs.org
>=20
> You can reach the person managing the list at
>    linuxppc-dev-owner@lists.ozlabs.org
>=20
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of Linuxppc-dev digest..."
>=20
>=20
> Today's Topics:
>=20
>   1. [PATCH v6 36/49] soc: fsl: qe: make cpm_muram_free() return
>      void (Rasmus Villemoes)
>   2. [PATCH v6 37/49] soc: fsl: qe: make cpm_muram_free() ignore a
>      negative offset (Rasmus Villemoes)
>   3. [PATCH v6 38/49] soc: fsl: qe: drop broken lazy call of
>      cpm_muram_init() (Rasmus Villemoes)
>   4. [PATCH v6 39/49] soc: fsl: qe: refactor
>      cpm_muram_alloc_common to prevent BUG on error path (Rasmus Villemoes=
)
>   5. [PATCH v6 40/49] soc: fsl: qe: avoid IS_ERR_VALUE in
>      ucc_slow.c (Rasmus Villemoes)
>=20
>=20
> ----------------------------------------------------------------------
>=20
> Message: 1
> Date: Thu, 28 Nov 2019 15:55:41 +0100
> From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
>    Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: linuxppc-dev@lists.ozlabs.org,
>    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
>    Scott Wood <oss@buserror.net>, Timur Tabi <timur@kernel.org>, Rasmus
>    Villemoes <linux@rasmusvillemoes.dk>
> Subject: [PATCH v6 36/49] soc: fsl: qe: make cpm_muram_free() return
>    void
> Message-ID: <20191128145554.1297-37-linux@rasmusvillemoes.dk>
>=20
> Nobody uses the return value from cpm_muram_free, and functions that
> free resources usually return void. One could imagine a use for a "how
> much have I allocated" a la ksize(), but knowing how much one had
> access to after the fact is useless.
>=20
> Reviewed-by: Timur Tabi <timur@kernel.org>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
> drivers/soc/fsl/qe/qe_common.c | 3 +--
> include/soc/fsl/qe/qe.h        | 5 ++---
> 2 files changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/soc/fsl/qe/qe_common.c b/drivers/soc/fsl/qe/qe_common=
.c
> index 84c90105e588..962835488f66 100644
> --- a/drivers/soc/fsl/qe/qe_common.c
> +++ b/drivers/soc/fsl/qe/qe_common.c
> @@ -170,7 +170,7 @@ EXPORT_SYMBOL(cpm_muram_alloc);
>  * cpm_muram_free - free a chunk of multi-user ram
>  * @offset: The beginning of the chunk as returned by cpm_muram_alloc().
>  */
> -int cpm_muram_free(s32 offset)
> +void cpm_muram_free(s32 offset)
> {
>    unsigned long flags;
>    int size;
> @@ -188,7 +188,6 @@ int cpm_muram_free(s32 offset)
>    }
>    gen_pool_free(muram_pool, offset + GENPOOL_OFFSET, size);
>    spin_unlock_irqrestore(&cpm_muram_lock, flags);
> -    return size;
> }
> EXPORT_SYMBOL(cpm_muram_free);
>=20
> diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
> index f589ae3f1216..e282ac01ec08 100644
> --- a/include/soc/fsl/qe/qe.h
> +++ b/include/soc/fsl/qe/qe.h
> @@ -99,7 +99,7 @@ int cpm_muram_init(void);
>=20
> #if defined(CONFIG_CPM) || defined(CONFIG_QUICC_ENGINE)
> s32 cpm_muram_alloc(unsigned long size, unsigned long align);
> -int cpm_muram_free(s32 offset);
> +void cpm_muram_free(s32 offset);
> s32 cpm_muram_alloc_fixed(unsigned long offset, unsigned long size);
> void __iomem *cpm_muram_addr(unsigned long offset);
> unsigned long cpm_muram_offset(void __iomem *addr);
> @@ -111,9 +111,8 @@ static inline s32 cpm_muram_alloc(unsigned long size,
>    return -ENOSYS;
> }
>=20
> -static inline int cpm_muram_free(s32 offset)
> +static inline void cpm_muram_free(s32 offset)
> {
> -    return -ENOSYS;
> }
>=20
> static inline s32 cpm_muram_alloc_fixed(unsigned long offset,
> --=20
> 2.23.0
>=20
>=20
>=20
> ------------------------------
>=20
> Message: 2
> Date: Thu, 28 Nov 2019 15:55:42 +0100
> From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
>    Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: linuxppc-dev@lists.ozlabs.org,
>    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
>    Scott Wood <oss@buserror.net>, Timur Tabi <timur@kernel.org>, Rasmus
>    Villemoes <linux@rasmusvillemoes.dk>
> Subject: [PATCH v6 37/49] soc: fsl: qe: make cpm_muram_free() ignore a
>    negative offset
> Message-ID: <20191128145554.1297-38-linux@rasmusvillemoes.dk>
>=20
> This allows one to simplify callers since they can store a negative
> value as a sentinel to indicate "this was never allocated" (or store
> the -ENOMEM from an allocation failure) and then call cpm_muram_free()
> unconditionally.
>=20
> Reviewed-by: Timur Tabi <timur@kernel.org>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
> drivers/soc/fsl/qe/qe_common.c | 3 +++
> 1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/soc/fsl/qe/qe_common.c b/drivers/soc/fsl/qe/qe_common=
.c
> index 962835488f66..48c77bb92846 100644
> --- a/drivers/soc/fsl/qe/qe_common.c
> +++ b/drivers/soc/fsl/qe/qe_common.c
> @@ -176,6 +176,9 @@ void cpm_muram_free(s32 offset)
>    int size;
>    struct muram_block *tmp;
>=20
> +    if (offset < 0)
> +        return;
> +
>    size =3D 0;
>    spin_lock_irqsave(&cpm_muram_lock, flags);
>    list_for_each_entry(tmp, &muram_block_list, head) {
> --=20
> 2.23.0
>=20
>=20
>=20
> ------------------------------
>=20
> Message: 3
> Date: Thu, 28 Nov 2019 15:55:43 +0100
> From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
>    Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: linuxppc-dev@lists.ozlabs.org,
>    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
>    Scott Wood <oss@buserror.net>, Timur Tabi <timur@kernel.org>, Rasmus
>    Villemoes <linux@rasmusvillemoes.dk>
> Subject: [PATCH v6 38/49] soc: fsl: qe: drop broken lazy call of
>    cpm_muram_init()
> Message-ID: <20191128145554.1297-39-linux@rasmusvillemoes.dk>
>=20
> cpm_muram_alloc_common() tries to support a kind of lazy
> initialization - if the muram_pool has not been created yet, it calls
> cpm_muram_init(). Now, cpm_muram_alloc_common() is always called under
>=20
>    spin_lock_irqsave(&cpm_muram_lock, flags);
>=20
> and cpm_muram_init() does gen_pool_create() (which implies a
> GFP_KERNEL allocation) and ioremap(), not to mention the fun that
> ensues from cpm_muram_init() doing
>=20
>    spin_lock_init(&cpm_muram_lock);
>=20
> In other words, this has never worked, so nobody can have been relying
> on it.
>=20
> cpm_muram_init() is called from a subsys_initcall (either from
> cpm_init() in arch/powerpc/sysdev/cpm_common.c or, via qe_reset(),
> from qe_init() in drivers/soc/fsl/qe/qe.c).
>=20
> Reviewed-by: Timur Tabi <timur@kernel.org>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
> drivers/soc/fsl/qe/qe_common.c | 3 ---
> 1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/soc/fsl/qe/qe_common.c b/drivers/soc/fsl/qe/qe_common=
.c
> index 48c77bb92846..dcb267567d76 100644
> --- a/drivers/soc/fsl/qe/qe_common.c
> +++ b/drivers/soc/fsl/qe/qe_common.c
> @@ -119,9 +119,6 @@ static s32 cpm_muram_alloc_common(unsigned long size,
>    struct muram_block *entry;
>    s32 start;
>=20
> -    if (!muram_pool && cpm_muram_init())
> -        goto out2;
> -
>    start =3D gen_pool_alloc_algo(muram_pool, size, algo, data);
>    if (!start)
>        goto out2;
> --=20
> 2.23.0
>=20
>=20
>=20
> ------------------------------
>=20
> Message: 4
> Date: Thu, 28 Nov 2019 15:55:44 +0100
> From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
>    Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: linuxppc-dev@lists.ozlabs.org,
>    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
>    Scott Wood <oss@buserror.net>, Timur Tabi <timur@kernel.org>, Rasmus
>    Villemoes <linux@rasmusvillemoes.dk>
> Subject: [PATCH v6 39/49] soc: fsl: qe: refactor
>    cpm_muram_alloc_common to prevent BUG on error path
> Message-ID: <20191128145554.1297-40-linux@rasmusvillemoes.dk>
>=20
> If the kmalloc() fails, we try to undo the gen_pool allocation we've
> just done. Unfortunately, start has already been modified to subtract
> the GENPOOL_OFFSET bias, so we're freeing something that very likely
> doesn't exist in the gen_pool, meaning we hit the
>=20
> kernel BUG at lib/genalloc.c:399!
> Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
> ...
> [<803fd0e8>] (gen_pool_free) from [<80426bc8>] (cpm_muram_alloc_common+0xb=
0/0xc8)
> [<80426bc8>] (cpm_muram_alloc_common) from [<80426c28>] (cpm_muram_alloc+0=
x48/0x80)
> [<80426c28>] (cpm_muram_alloc) from [<80428214>] (ucc_slow_init+0x110/0x4f=
0)
> [<80428214>] (ucc_slow_init) from [<8044a718>] (qe_uart_request_port+0x3c/=
0x1d8)
>=20
> (this was tested by just injecting a random failure by adding
> "|| (get_random_int()&7) =3D=3D 0" to the "if (!entry)" condition).
>=20
> Refactor the code so we do the kmalloc() first, meaning that's the
> thing that needs undoing in case gen_pool_alloc_algo() then
> fails. This allows a later cleanup to move the locking from the
> callers into the _common function, keeping the kmalloc() out of the
> critical region and then, hopefully (if all the muram_alloc callers
> allow) change it to a GFP_KERNEL allocation.
>=20
> Reviewed-by: Timur Tabi <timur@kernel.org>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
> drivers/soc/fsl/qe/qe_common.c | 16 +++++++---------
> 1 file changed, 7 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/soc/fsl/qe/qe_common.c b/drivers/soc/fsl/qe/qe_common=
.c
> index dcb267567d76..a81a1a79f1ca 100644
> --- a/drivers/soc/fsl/qe/qe_common.c
> +++ b/drivers/soc/fsl/qe/qe_common.c
> @@ -119,23 +119,21 @@ static s32 cpm_muram_alloc_common(unsigned long size=
,
>    struct muram_block *entry;
>    s32 start;
>=20
> +    entry =3D kmalloc(sizeof(*entry), GFP_ATOMIC);
> +    if (!entry)
> +        return -ENOMEM;
>    start =3D gen_pool_alloc_algo(muram_pool, size, algo, data);
> -    if (!start)
> -        goto out2;
> +    if (!start) {
> +        kfree(entry);
> +        return -ENOMEM;
> +    }
>    start =3D start - GENPOOL_OFFSET;
>    memset_io(cpm_muram_addr(start), 0, size);
> -    entry =3D kmalloc(sizeof(*entry), GFP_ATOMIC);
> -    if (!entry)
> -        goto out1;
>    entry->start =3D start;
>    entry->size =3D size;
>    list_add(&entry->head, &muram_block_list);
>=20
>    return start;
> -out1:
> -    gen_pool_free(muram_pool, start, size);
> -out2:
> -    return -ENOMEM;
> }
>=20
> /*
> --=20
> 2.23.0
>=20
>=20
>=20
> ------------------------------
>=20
> Message: 5
> Date: Thu, 28 Nov 2019 15:55:45 +0100
> From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
>    Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: linuxppc-dev@lists.ozlabs.org,
>    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
>    Scott Wood <oss@buserror.net>, Timur Tabi <timur@kernel.org>, Rasmus
>    Villemoes <linux@rasmusvillemoes.dk>
> Subject: [PATCH v6 40/49] soc: fsl: qe: avoid IS_ERR_VALUE in
>    ucc_slow.c
> Message-ID: <20191128145554.1297-41-linux@rasmusvillemoes.dk>
>=20
> When trying to build this for a 64-bit platform, one gets warnings
> from using IS_ERR_VALUE on something which is not sizeof(long).
>=20
> Instead, change the various *_offset fields to store a signed integer,
> and simply check for a negative return from qe_muram_alloc(). Since
> qe_muram_free() now accepts and ignores a negative argument, we only
> need to make sure these fields are initialized with -1, and we can
> just unconditionally call qe_muram_free() in ucc_slow_free().
>=20
> Note that the error case for us_pram_offset failed to set that field
> to 0 (which, as noted earlier, is anyway a bogus sentinel value).
>=20
> Reviewed-by: Timur Tabi <timur@kernel.org>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
> drivers/soc/fsl/qe/ucc_slow.c | 22 +++++++++-------------
> include/soc/fsl/qe/ucc_slow.h |  6 +++---
> 2 files changed, 12 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/soc/fsl/qe/ucc_slow.c b/drivers/soc/fsl/qe/ucc_slow.c=

> index 9b55fd0f50c6..274d34449846 100644
> --- a/drivers/soc/fsl/qe/ucc_slow.c
> +++ b/drivers/soc/fsl/qe/ucc_slow.c
> @@ -154,6 +154,9 @@ int ucc_slow_init(struct ucc_slow_info * us_info, stru=
ct ucc_slow_private ** ucc
>            __func__);
>        return -ENOMEM;
>    }
> +    uccs->rx_base_offset =3D -1;
> +    uccs->tx_base_offset =3D -1;
> +    uccs->us_pram_offset =3D -1;
>=20
>    /* Fill slow UCC structure */
>    uccs->us_info =3D us_info;
> @@ -179,7 +182,7 @@ int ucc_slow_init(struct ucc_slow_info * us_info, stru=
ct ucc_slow_private ** ucc
>    /* Get PRAM base */
>    uccs->us_pram_offset =3D
>        qe_muram_alloc(UCC_SLOW_PRAM_SIZE, ALIGNMENT_OF_UCC_SLOW_PRAM);
> -    if (IS_ERR_VALUE(uccs->us_pram_offset)) {
> +    if (uccs->us_pram_offset < 0) {
>        printk(KERN_ERR "%s: cannot allocate MURAM for PRAM", __func__);
>        ucc_slow_free(uccs);
>        return -ENOMEM;
> @@ -206,10 +209,9 @@ int ucc_slow_init(struct ucc_slow_info * us_info, str=
uct ucc_slow_private ** ucc
>    uccs->rx_base_offset =3D
>        qe_muram_alloc(us_info->rx_bd_ring_len * sizeof(struct qe_bd),
>                QE_ALIGNMENT_OF_BD);
> -    if (IS_ERR_VALUE(uccs->rx_base_offset)) {
> +    if (uccs->rx_base_offset < 0) {
>        printk(KERN_ERR "%s: cannot allocate %u RX BDs\n", __func__,
>            us_info->rx_bd_ring_len);
> -        uccs->rx_base_offset =3D 0;
>        ucc_slow_free(uccs);
>        return -ENOMEM;
>    }
> @@ -217,9 +219,8 @@ int ucc_slow_init(struct ucc_slow_info * us_info, stru=
ct ucc_slow_private ** ucc
>    uccs->tx_base_offset =3D
>        qe_muram_alloc(us_info->tx_bd_ring_len * sizeof(struct qe_bd),
>            QE_ALIGNMENT_OF_BD);
> -    if (IS_ERR_VALUE(uccs->tx_base_offset)) {
> +    if (uccs->tx_base_offset < 0) {
>        printk(KERN_ERR "%s: cannot allocate TX BDs", __func__);
> -        uccs->tx_base_offset =3D 0;
>        ucc_slow_free(uccs);
>        return -ENOMEM;
>    }
> @@ -352,14 +353,9 @@ void ucc_slow_free(struct ucc_slow_private * uccs)
>    if (!uccs)
>        return;
>=20
> -    if (uccs->rx_base_offset)
> -        qe_muram_free(uccs->rx_base_offset);
> -
> -    if (uccs->tx_base_offset)
> -        qe_muram_free(uccs->tx_base_offset);
> -
> -    if (uccs->us_pram)
> -        qe_muram_free(uccs->us_pram_offset);
> +    qe_muram_free(uccs->rx_base_offset);
> +    qe_muram_free(uccs->tx_base_offset);
> +    qe_muram_free(uccs->us_pram_offset);
>=20
>    if (uccs->us_regs)
>        iounmap(uccs->us_regs);
> diff --git a/include/soc/fsl/qe/ucc_slow.h b/include/soc/fsl/qe/ucc_slow.h=

> index 8696fdea2ae9..d187a6be83bc 100644
> --- a/include/soc/fsl/qe/ucc_slow.h
> +++ b/include/soc/fsl/qe/ucc_slow.h
> @@ -185,7 +185,7 @@ struct ucc_slow_private {
>    struct ucc_slow_info *us_info;
>    struct ucc_slow __iomem *us_regs; /* Ptr to memory map of UCC regs */
>    struct ucc_slow_pram *us_pram;    /* a pointer to the parameter RAM */
> -    u32 us_pram_offset;
> +    s32 us_pram_offset;
>    int enabled_tx;        /* Whether channel is enabled for Tx (ENT) */
>    int enabled_rx;        /* Whether channel is enabled for Rx (ENR) */
>    int stopped_tx;        /* Whether channel has been stopped for Tx
> @@ -194,8 +194,8 @@ struct ucc_slow_private {
>    struct list_head confQ;    /* frames passed to chip waiting for tx */
>    u32 first_tx_bd_mask;    /* mask is used in Tx routine to save status
>                   and length for first BD in a frame */
> -    u32 tx_base_offset;    /* first BD in Tx BD table offset (In MURAM) *=
/
> -    u32 rx_base_offset;    /* first BD in Rx BD table offset (In MURAM) *=
/
> +    s32 tx_base_offset;    /* first BD in Tx BD table offset (In MURAM) *=
/
> +    s32 rx_base_offset;    /* first BD in Rx BD table offset (In MURAM) *=
/
>    struct qe_bd *confBd;    /* next BD for confirm after Tx */
>    struct qe_bd *tx_bd;    /* next BD for new Tx request */
>    struct qe_bd *rx_bd;    /* next BD to collect after Rx */
> --=20
> 2.23.0
>=20
>=20
>=20
> ------------------------------
>=20
> Subject: Digest Footer
>=20
> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/linuxppc-dev
>=20
>=20
> ------------------------------
>=20
> End of Linuxppc-dev Digest, Vol 183, Issue 481
> **********************************************

