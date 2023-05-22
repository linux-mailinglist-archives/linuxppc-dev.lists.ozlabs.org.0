Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D950F70B2A8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 May 2023 03:00:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QPfHv4fpmz3f6D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 May 2023 11:00:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VHunKFXM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QPfH403WFz3bck
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 May 2023 10:59:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VHunKFXM;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QPfGz0VlGz4x3x;
	Mon, 22 May 2023 10:59:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1684717164;
	bh=NcOxMgq8TvvhdzUGOGPEsHFpZuTqpWx3N3QVCPjo0Jw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VHunKFXMg3G8W3SyuU0IfGzTnEzVJN+5tqGL6YE/f6O0Yx+eFKs7oIdoBWjviuYD7
	 lvi0o8hiqI4gntU808PuELCGNXNzLmvgC6242pYSdUPsSpTvPD6JjBfEIvJlYKbSMh
	 X7ZkFpQ+g8M5vgjaFI7dd1AGpTf/bvtONqLhmfOA9i3yKDgabp+SCmRR+bJ4XLdczs
	 PnNmA8ipY8km9hMhYrV0/yQTADpuZFgXLU7VMLbwJrFYd2oAe62rP2eddtNzZ1k83w
	 saO3fh6Y7d+DSefHDr7aJgNEnWVUhvZUQkGrmx5MEpXMbtYhNgi03SRwgoD7lcK+df
	 XA0uTduEMYGPg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] powerpc/crypto: fix build warnings when DEBUG_FS is not
 enabled
In-Reply-To: <20230519223334.11992-1-rdunlap@infradead.org>
References: <20230519223334.11992-1-rdunlap@infradead.org>
Date: Mon, 22 May 2023 10:59:17 +1000
Message-ID: <87jzx19o62.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Nayna Jain <nayna@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paulo Flabiano Smorigo <pfsmorigo@gmail.com>, linux-crypto@vger.kernel.org, Breno =?utf-8?Q?Leit=C3=A3o?= <leitao@debian.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Randy Dunlap <rdunlap@infradead.org> writes:
> Fix build warnings when DEBUG_FS is not enabled by using an empty
> do-while loop instead of a value:
>
> In file included from ../drivers/crypto/nx/nx.c:27:
> ../drivers/crypto/nx/nx.c: In function 'nx_register_algs':
> ../drivers/crypto/nx/nx.h:173:33: warning: statement with no effect [-Wun=
used-value]
>   173 | #define NX_DEBUGFS_INIT(drv)    (0)
> ../drivers/crypto/nx/nx.c:573:9: note: in expansion of macro 'NX_DEBUGFS_=
INIT'
>   573 |         NX_DEBUGFS_INIT(&nx_driver);
> ../drivers/crypto/nx/nx.c: In function 'nx_remove':
> ../drivers/crypto/nx/nx.h:174:33: warning: statement with no effect [-Wun=
used-value]
>   174 | #define NX_DEBUGFS_FINI(drv)    (0)
> ../drivers/crypto/nx/nx.c:793:17: note: in expansion of macro 'NX_DEBUGFS=
_FINI'
>   793 |                 NX_DEBUGFS_FINI(&nx_driver);
>
> Also, there is no need to build nx_debugfs.o when DEBUG_FS is not
> enabled, so change the Makefile to accommodate that.
>
> Fixes: ae0222b7289d ("powerpc/crypto: nx driver code supporting nx encryp=
tion")
> Fixes: aef7b31c8833 ("powerpc/crypto: Build files for the nx device drive=
r")

In recent years the subject prefix for this code has been "crypto: nx:"
or similar.

Maybe Herbert can fix it up to his liking when he applies it.

cheers

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Breno Leit=C3=A3o <leitao@debian.org>
> Cc: Nayna Jain <nayna@linux.ibm.com>
> Cc: Paulo Flabiano Smorigo <pfsmorigo@gmail.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: linux-crypto@vger.kernel.org
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  drivers/crypto/nx/Makefile |    2 +-
>  drivers/crypto/nx/nx.h     |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff -- a/drivers/crypto/nx/Makefile b/drivers/crypto/nx/Makefile
> --- a/drivers/crypto/nx/Makefile
> +++ b/drivers/crypto/nx/Makefile
> @@ -1,7 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_CRYPTO_DEV_NX_ENCRYPT) +=3D nx-crypto.o
>  nx-crypto-objs :=3D nx.o \
> -		  nx_debugfs.o \
>  		  nx-aes-cbc.o \
>  		  nx-aes-ecb.o \
>  		  nx-aes-gcm.o \
> @@ -11,6 +10,7 @@ nx-crypto-objs :=3D nx.o \
>  		  nx-sha256.o \
>  		  nx-sha512.o
>=20=20
> +nx-crypto-$(CONFIG_DEBUG_FS) +=3D nx_debugfs.o
>  obj-$(CONFIG_CRYPTO_DEV_NX_COMPRESS_PSERIES) +=3D nx-compress-pseries.o =
nx-compress.o
>  obj-$(CONFIG_CRYPTO_DEV_NX_COMPRESS_POWERNV) +=3D nx-compress-powernv.o =
nx-compress.o
>  nx-compress-objs :=3D nx-842.o
> diff -- a/drivers/crypto/nx/nx.h b/drivers/crypto/nx/nx.h
> --- a/drivers/crypto/nx/nx.h
> +++ b/drivers/crypto/nx/nx.h
> @@ -170,8 +170,8 @@ struct nx_sg *nx_walk_and_build(struct n
>  void nx_debugfs_init(struct nx_crypto_driver *);
>  void nx_debugfs_fini(struct nx_crypto_driver *);
>  #else
> -#define NX_DEBUGFS_INIT(drv)	(0)
> -#define NX_DEBUGFS_FINI(drv)	(0)
> +#define NX_DEBUGFS_INIT(drv)	do {} while (0)
> +#define NX_DEBUGFS_FINI(drv)	do {} while (0)
>  #endif
>=20=20
>  #define NX_PAGE_NUM(x)		((u64)(x) & 0xfffffffffffff000ULL)
