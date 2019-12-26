Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5BA12AEE3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Dec 2019 22:23:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47kNGn0WpVzDqBS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Dec 2019 08:23:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47kNDx2F6kzDqFS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Dec 2019 08:21:34 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47kNDm5XNmz9vK4M;
 Thu, 26 Dec 2019 22:21:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jeNv5bw7Fs1z; Thu, 26 Dec 2019 22:21:28 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47kNDm4H21z9vK4L;
 Thu, 26 Dec 2019 22:21:28 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 1F68B605; Thu, 26 Dec 2019 22:22:02 +0100 (CET)
Received: from 37-165-97-118.coucou-networks.fr
 (37-165-97-118.coucou-networks.fr [37.165.97.118]) by messagerie.si.c-s.fr
 (Horde Framework) with HTTP; Thu, 26 Dec 2019 22:22:02 +0100
Date: Thu, 26 Dec 2019 22:22:02 +0100
Message-ID: <20191226222202.Horde.0xaecj7x1FoNwm4fHxlH0Q2@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] powerpc/pmac/smp: Fix old-style declaration
In-Reply-To: <20191225114943.17216-1-yuehaibing@huawei.com>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

YueHaibing <yuehaibing@huawei.com> a =C3=A9crit=C2=A0:

> There expect the 'static' keyword to come first in a declaration
>
> arch/powerpc/platforms/powermac/smp.c:664:1: warning: static is not=20=20
>=20at beginning of declaration [-Wold-style-declaration]
> arch/powerpc/platforms/powermac/smp.c:665:1: warning: static is not=20=20
>=20at beginning of declaration [-Wold-style-declaration]
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  arch/powerpc/platforms/powermac/smp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/platforms/powermac/smp.c=20=20
>=20b/arch/powerpc/platforms/powermac/smp.c
> index f95fbde..7233b85 100644
> --- a/arch/powerpc/platforms/powermac/smp.c
> +++ b/arch/powerpc/platforms/powermac/smp.c
> @@ -661,8 +661,8 @@ static void smp_core99_gpio_tb_freeze(int freeze)
>  #endif /* !CONFIG_PPC64 */
>
>  /* L2 and L3 cache settings to pass from CPU0 to CPU1 on G4 cpus */
> -volatile static long int core99_l2_cache;
> -volatile static long int core99_l3_cache;
> +static volatile long int core99_l2_cache;
> +static volatile long int core99_l3_cache;

Is it correct to declare it as volatile ?

See=20=20
https://www.kernel.org/doc/html/latest/process/volatile-considered-harmful.=
html

Christophe

