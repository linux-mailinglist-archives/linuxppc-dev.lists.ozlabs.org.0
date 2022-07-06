Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 393B9567F94
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 09:10:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ld9gK5KF6z3c7N
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 17:10:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.126.130; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ld9fs2QK3z3bc3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 17:10:27 +1000 (AEST)
Received: from mail-yw1-f175.google.com ([209.85.128.175]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N7QM9-1nWNAO2psj-017pK0 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Jul
 2022 09:05:17 +0200
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-317a66d62dfso130865057b3.7
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Jul 2022 00:05:15 -0700 (PDT)
X-Gm-Message-State: AJIora/zLH/6st01M222OT9+g6kIToYULr513PJf+zHDBp+SQYY+eued
	/xDq0zT5KCKjeZmhpG0BORomt2pJNPezBUyII3s=
X-Google-Smtp-Source: AGRyM1sFkLoTiaaVIBkcDzO6lGV11chQSm3x6oRhEtv1xOtqIu5uDObFEe7OPQNG4jMZlSfDIkbGiGD4cv9otOB20XA=
X-Received: by 2002:a81:f8f:0:b0:31c:bd9f:31ce with SMTP id
 137-20020a810f8f000000b0031cbd9f31cemr10731679ywp.347.1657091114041; Wed, 06
 Jul 2022 00:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220630051630.1718927-1-anshuman.khandual@arm.com>
 <8a6ccbae-7d7c-6e08-cc28-eeb649f86112@arm.com> <85fff3f6-373f-3e6a-325e-0fa8ad46273a@csgroup.eu>
In-Reply-To: <85fff3f6-373f-3e6a-325e-0fa8ad46273a@csgroup.eu>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 6 Jul 2022 09:04:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1gb1Xrg4AGnncFpN=aDxVKfjkt1TmSvZXXADZTv7eE-g@mail.gmail.com>
Message-ID: <CAK8P3a1gb1Xrg4AGnncFpN=aDxVKfjkt1TmSvZXXADZTv7eE-g@mail.gmail.com>
Subject: Re: [PATCH V6 00/26] mm/mmap: Drop __SXXX/__PXXX macros from across platforms
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:a1fcpxRi8ABClXb4v0b/gmQqtScsOyfb2ZAP4IUJPHj7qfWBzSE
 7zTWVtr4u/foBY0A4aAfLX7eUFS5H0AJpntbv94qV5B2T1xc9bn1Q+9TM5826dSyjQs31+N
 9pocq54I4dmZQMKDq0BSur9RMljp1Y7a2xfSbggN5Sd7+0I8m4GJaqQMFT/cMAOH8ZNsFVM
 Qzn2k+QgGhPHco3fYj05w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IZ2ym38PUrw=:fQHdpH/N71pIfAsYmgCPWv
 J3V80BDKkYVeDZ3gok9TC/8XaFlFwM916gZqbYz7rGnIZJWGvP/qHhQlwZdfqiHiXR9UX5VSG
 pJXcqcjIeMmJDHuQiidrOeN65dBFDBUigZe17dPTiR34LsKjKl3APd9w4bJN1/BnGUuAYDudH
 7vr6KjWt3nrIao9nvfVLroc6T5RVWZJF8g2RDBBj+P3q1fACEhlqKRa2w07Tl/vWO0x7UvVqn
 267f7M0z+xfGt0odZBOY6r/Y043zrX/ugbec8nNPM/kDmdmxuMRiPS0kvLCru2JpI/MM//Noc
 QZC6+B86ktOSmblY0DhBk//F4UnqnwjbrbRocsTUgZXqIERqvS14nYBzX91u4peYYLeB1K6Jv
 GLjBKcRQq2FE9Nvi8SnDxe5Mwp3Qz+ZcK2zICLUbRMurONnWvNbVdHK80wmG3/ZPICyyXzoGe
 AhOdTbSmI2vsgXmfYIoKpRiCsEFqCi3MIEiboOIjpHNq/YSW16EzyF3H4xvxROeKkMUg89tAd
 kUpxc+lnJa/k0JjS7QzK8/LDYzrIf9CfZwlKH/lIuMaNeypV5tme21lOSCWmk2c+zxvlF7/y/
 kPKWA60rsBCQqLR664eaVogBhz12Sl87j/GVPpfYT077JxFD6FOc3q7kWA739Mev7G8cCHbtr
 zSMlMBQPh49lJTzgiFTTvXpacfMeQVGbPx183N4Bw8I77XUdwg12WsWv1nMBCyK+QZBBJXy9y
 ggez1idymNkJo+udVnt1ZgG/PvUosb4uDmqFVoB9bbb8AjeMN+qEoY3o/N2tyngYgygUXHDty
 bEBsQXIUSmA3FjIROEHgmWg58JZOq1/6D4PmsbQsD2chFQC9Dh+0Omzr2iqDxKuY4IKtOkEAj
 GEabaef+rjSkI2+Z5GKw==
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "hch@infradead.org" <hch@infradead.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, Anshuman Khandual <anshuman.khandual@arm.com>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, "li
 nux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 6, 2022 at 8:33 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:

> As far as I can see in Kconfig, CONFIG_MMU is user selectable on the
> following architectures:
> - ARM
> - M68K
> - RISCV
> - SH
>
> And is disabled by default on XTENSA.

Right, the list is complete, though it's also default-enabled for
every CPU core on xtensa, and you can only disable it for
"custom" CPU cores.

        Arnd
