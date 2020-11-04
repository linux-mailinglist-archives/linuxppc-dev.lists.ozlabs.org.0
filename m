Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A08A2A71E0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 00:37:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRNPD6QKvzDqhC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 10:37:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRNMV1cQSzDqRW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 10:36:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XdXW2pCM; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRNMT3KkJz9sPB;
 Thu,  5 Nov 2020 10:36:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1604532981;
 bh=tvf1yvsQMnkIfDvVfNZUhP9qZGxh2S8Or2/lDBF1aOI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=XdXW2pCMgVmKFvXcjiUbZo2ARcycAwcoCf4vOBZDhVoZ84vVSBrmHJYwYhMqGatny
 oQvrtmfOvkkCxdZJBFj7d9NG1fVfYLj69/zRctymbln+Yr76SUvwPVmKnRk9oi5LsX
 bImBBk8dlc8WtzAjBBPX8cm82M91Txb6600UEzGdplO43LLcpWWmdtTi/0EBa6hvGU
 nH7XcL94NmPayMLRJlqI8nJC5iciUIM1npRz1N7y+ldbAkiZzW4EPx2Oxc2t2Rfze6
 rXLrJ7/LSzTyQ7gQ5MQ/a+rU6yxTzzUXFWTJ9AalLFRik5kQWxR73Dbp+QFfH+hp16
 7dwR1o9Q02J7g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Lee Jones <lee.jones@linaro.org>, lee.jones@linaro.org
Subject: Re: [PATCH 31/36] powerpc: asm: hvconsole: Move 'hvc_vio_init_early's
 prototype to shared location
In-Reply-To: <20201104193549.4026187-32-lee.jones@linaro.org>
References: <20201104193549.4026187-1-lee.jones@linaro.org>
 <20201104193549.4026187-32-lee.jones@linaro.org>
Date: Thu, 05 Nov 2020 10:36:19 +1100
Message-ID: <87r1p8u230.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Lee Jones <lee.jones@linaro.org> writes:
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/tty/hvc/hvc_vio.c:385:13: warning: no previous prototype for =E2=
=80=98hvc_vio_init_early=E2=80=99 [-Wmissing-prototypes]
>  385 | void __init hvc_vio_init_early(void)
>  | ^~~~~~~~~~~~~~~~~~
>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  arch/powerpc/include/asm/hvconsole.h     | 3 +++
>  arch/powerpc/platforms/pseries/pseries.h | 3 ---
>  arch/powerpc/platforms/pseries/setup.c   | 1 +
>  3 files changed, 4 insertions(+), 3 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

> diff --git a/arch/powerpc/include/asm/hvconsole.h b/arch/powerpc/include/=
asm/hvconsole.h
> index 999ed5ac90531..936a1ee1ac786 100644
> --- a/arch/powerpc/include/asm/hvconsole.h
> +++ b/arch/powerpc/include/asm/hvconsole.h
> @@ -24,5 +24,8 @@
>  extern int hvc_get_chars(uint32_t vtermno, char *buf, int count);
>  extern int hvc_put_chars(uint32_t vtermno, const char *buf, int count);
>=20=20
> +/* Provided by HVC VIO */
> +extern void hvc_vio_init_early(void);

extern isn't needed, but don't feel you need to respin just to drop it.

cheers
