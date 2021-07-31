Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C1E3DC6C1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jul 2021 17:53:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GcTMX4ndkz3cWk
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Aug 2021 01:53:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GcTMB1hg9z303F
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Aug 2021 01:53:23 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GcTM42YjWzBB1L;
 Sat, 31 Jul 2021 17:53:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4l5wWljqrlnt; Sat, 31 Jul 2021 17:53:20 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GcTM41Kf4zBB0X;
 Sat, 31 Jul 2021 17:53:20 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 6751263F; Sat, 31 Jul 2021 17:58:42 +0200 (CEST)
Received: from 37-173-18-216.coucou-networks.fr
 (37-173-18-216.coucou-networks.fr [37.173.18.216]) by messagerie.c-s.fr
 (Horde Framework) with HTTP; Sat, 31 Jul 2021 17:58:42 +0200
Date: Sat, 31 Jul 2021 17:58:42 +0200
Message-ID: <20210731175842.Horde.UunWM8rZMP0dRCaeWUo-og1@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Stan Johnson <userm57@yahoo.com>
Subject: Re: Debian SID kernel doesn't boot on PowerBook 3400c
References: <60841a75-ed7c-8789-15db-272bf43055f5.ref@yahoo.com>
 <60841a75-ed7c-8789-15db-272bf43055f5@yahoo.com>
In-Reply-To: <60841a75-ed7c-8789-15db-272bf43055f5@yahoo.com>
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
Cc: Debian PowerPC <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stan Johnson <userm57@yahoo.com> a =C3=A9crit=C2=A0:

> Hello,
>
> The current Debian SID kernel will not boot on a PowerBook 3400c running
> the latest version of Debian SID. If booted using the BootX extension,
> the kernel hangs immediately:
>
> "Welcome to Linux, kernel 5.10.0-8-powerpc"
>
> If booted from Mac OS, the Mac OS screen hangs.
>
> Booting also hangs if the "No video driver" option is selected in BootX,
> "No video driver" causes "video=3Dofonly" to be passed to the kernel.
>
> This is the current command line that I'm using in BootX:
> root=3D/dev/sda13 video=3Dchips65550:vmode:14,cmode:16
>
> Kernel v5.9 works as expected.
>
> The config file I'm using is attached.
>
> Here are the results of a git bisect, marking v5.9 as "good" and the
> most current kernel as "bad":
>
> $ cd linux
> $ git remote update
> $ git bisect reset
> $ git bisect start
> $ git bisect bad
> $ git bisect good v5.9
>
> Note: "bad" -> hangs at boot; "good" -> boots to login prompt
>
>  1) 5.11.0-rc5-pmac-00034-g684da7628d9 (bad)
>  2) 5.10.0-rc3-pmac-00383-gbb9dd3ce617 (good)
>  3) 5.10.0-pmac-06637-g2911ed9f47b (good)
>     Note: I had to disable SMP to build this kernel.
>  4) 5.10.0-pmac-10584-g9805529ec54 (good)
>     Note: I had to disable SMP to build this kernel.
>  5) 5.10.0-pmac-12577-g8552d28e140 (bad)
>  6) 5.10.0-pmac-11576-g8a5be36b930 (bad)
>  7) 5.10.0-pmac-11044-gbe695ee29e8 (good)
>     Note: I had to disable SMP to build this kernel.
>  8) 5.10.0-rc2-pmac-00288-g59d512e4374 (bad)
>  9) 5.10.0-rc2-pmac-00155-gc3d35ddd1ec (good)
> 10) 5.10.0-rc2-pmac-00221-g7049b288ea8 (good)
> 11) 5.10.0-rc2-pmac-00254-g4b74a35fc7e (bad)
> 12) 5.10.0-rc2-pmac-00237-ged22bb8d39f (good)
> 13) 5.10.0-rc2-pmac-00245-g87b57ea7e10 (good)
> 14) 5.10.0-rc2-pmac-00249-gf10881a46f8 (bad)
> 15) 5.10.0-rc2-pmac-00247-gf8a4b277c3c (good)
> 16) 5.10.0-rc2-pmac-00248-gdb972a3787d (bad)
>
> db972a3787d12b1ce9ba7a31ec376d8a79e04c47 is the first bad commit

Not sure this is really the root of the problem.

Can you try again without CONFIG_VMAP_STACK ?

Thanks
Christophe


> commit db972a3787d12b1ce9ba7a31ec376d8a79e04c47
> Author: Christophe Leroy <christophe.leroy@csgroup.eu>
> Date:   Tue Dec 8 05:24:19 2020 +0000
>
>     powerpc/powermac: Fix low_sleep_handler with CONFIG_VMAP_STACK
>
>     low_sleep_handler() can't restore the context from standard
>     stack because the stack can hardly be accessed with MMU OFF.
>
>     Store everything in a global storage area instead of storing
>     a pointer to the stack in that global storage area.
>
>     To avoid a complete churn of the function, still use r1 as
>     the pointer to the storage area during restore.
>
>     Fixes: cd08f109e262 ("powerpc/32s: Enable CONFIG_VMAP_STACK")
>     Reported-by: Giuseppe Sacco <giuseppe@sguazz.it>
>     Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>     Tested-by: Giuseppe Sacco <giuseppe@sguazz.it>
>     Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>     Link:
> https://lore.kernel.org/r/e3e0d8042a3ba75cb4a9546c19c408b5b5b28994.160740=
4931.git.christophe.leroy@csgroup.eu
>
> :040000 040000 d5039513d19748fc13712a2c67ae034371b95fe7
> cbbdbdc4b05c713ea2577674260fd37e71306cc0 M	arch
>
> Please let me know if you need more information.
>
> -Stan Johnson


