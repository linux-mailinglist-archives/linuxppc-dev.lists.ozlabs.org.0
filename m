Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 485594920FA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 09:09:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JdLz21y86z30M9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 19:09:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.24; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JdLyT6jdyz2ywd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 19:09:04 +1100 (AEDT)
Received: from mail-ot1-f43.google.com ([209.85.210.43]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MTANt-1mk3xk1dOB-00UdkF for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan
 2022 09:08:59 +0100
Received: by mail-ot1-f43.google.com with SMTP id
 q13-20020a9d4b0d000000b0059b1209d708so2604128otf.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 00:08:58 -0800 (PST)
X-Gm-Message-State: AOAM533Mm5BNvlK+ycQmYauqFKLs7wQ2DPusXKJBI+vRNL1Umx7egBcC
 lGKUZHwX5QK73eQDIygG3pqfzmEXP9i5hmnZHJw=
X-Google-Smtp-Source: ABdhPJydwgmux0eMV8HI8b9BdklNP+7LV2ch1rDgfPNeEtqq30DY58YS5CzATVJf7L4CaVG1qsRotI3Rplk0R7Z1cCo=
X-Received: by 2002:a05:6830:2095:: with SMTP id
 y21mr17140172otq.368.1642493337643; 
 Tue, 18 Jan 2022 00:08:57 -0800 (PST)
MIME-Version: 1.0
References: <20220118044323.765038-1-walt@drummond.us>
 <20220118044323.765038-2-walt@drummond.us>
In-Reply-To: <20220118044323.765038-2-walt@drummond.us>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 18 Jan 2022 09:08:41 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0ohW+w8_A8qMNqxpTmFcvxQr+z9YR96RAu5-wtdG_5+g@mail.gmail.com>
Message-ID: <CAK8P3a0ohW+w8_A8qMNqxpTmFcvxQr+z9YR96RAu5-wtdG_5+g@mail.gmail.com>
Subject: Re: [PATCH 2/3] vstatus: Add user space API definitions for VSTATUS, 
 NOKERNINFO and TIOCSTAT
To: Walt Drummond <walt@drummond.us>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:lv7QkyoVa4zt4qUthI4Q4KJD1DEYQ2z0+wYD+CdD+zRvGEzO2dx
 TaTlbe2wQv/e7mSJAkvgmfMSg3Jvzm9GPgmIeJnFO0lkzIpN3qy1WZSZcseklYHVOEWG/w3
 RuqUAWjMpmC/OpXA5RoG5cb5Qw6ydfiyzQtzNpG9FXr9DBYrPJMsQmkd9yeQCTXwCcC+8I9
 uNbeMCTUmtNYsQ/m1jA3A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fg4x1qCW1+o=:LARrNM1clowPmIwLCDXFrM
 rfYwBSuaQjDSiq+dKD4Lgd4s03YYzgV7c2DhzjFXymEnUUENTWNkWEnOMtRdJuiM4aPonbei2
 8gxUMVXn5eox8wKBtG7WMyrV/PLkZLYRSFtcYMzESZR4Qj3SDTp/waKcgNClR+83FL0Hwh6Q1
 ll88klf79aN6RQBKhsd3M7rSjizbVQBbd1zy+e5CkD2yFbb/riLRYyTgwPw1+BTBGPG1HZFlx
 uGPHpHZJVklwpybxdPKVWnkEowtOTUyl9jY+lWIBw7tk2efqJvlLsgDA51N7rFTJ7do6wRtHU
 s+r5204rvze6CkEUEAuWDckKNKWA4vLT8t9iohE7vussXXWzXmIa6xdI5RQ19sfytFZFhATqO
 bYZzHfhCUxflbv7SbavmNd95r7Bj0n/IVQUD9Ps0JfCcBCgMBckWQ93yYvujAKyfhZwYRuOim
 tlwOsCszrVuAsB/h6ZghqhUDW63v3OQ9cDKC0qXcQll7QaU2GueP8BhAGTRIvxcWNWhBFD0tg
 P/kGMYvphLfrMIhB3vvSv9sRKTetQ8y0cv7rXKnPHI4+LjtDIa9SCeW95JDVGcH5h+v4iOQOf
 3cKFGLC/vR9+3L29FogdC720aEGVkMOhhqxWM9POZ8mtTBoSW6ksFzB7cJm14OixFcFCw7gEL
 y3y+51zsTS+nS19dHjXi5TojQO3BGn1a8dMjdz0DmzHDOAZIyS0Zb0CMAZO+PlZdGj04/SyGv
 34DAd2UhpLP5ZNSyOmMdlhQtCDFobrxM9dUd5l82GMMqg7VHBTu8ECteGtFDVTAvNmZERhRVt
 /MLafcPgPfZUeMuR6Kc1eqvUJ8MmxkV2pzWDQhtN9m4CkJy5WU=
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Linux-sh list <linux-sh@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, ar@cs.msu.ru,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.osdn.me>,
 Matt Turner <mattst88@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 18, 2022 at 5:43 AM Walt Drummond <walt@drummond.us> wrote:

> diff --git a/include/uapi/asm-generic/ioctls.h b/include/uapi/asm-generic/ioctls.h
> index cdc9f4ca8c27..eafb662d6a0e 100644
> --- a/include/uapi/asm-generic/ioctls.h
> +++ b/include/uapi/asm-generic/ioctls.h
> @@ -97,6 +97,7 @@
>
>  #define TIOCMIWAIT     0x545C  /* wait for a change on serial input line(s) */
>  #define TIOCGICOUNT    0x545D  /* read serial port inline interrupt counts */
> +#define TIOCSTAT        0x545E /* display process group stats on tty */
>
>  /*
>   * Some arches already define FIOQSIZE due to a historical

I don't see any advantage in using the old-style ioctl command definitions
here, and looking through the history of this file, all recent additions used
the now normal _IOWR() style macros, so please use those as well.

       Arnd
