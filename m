Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DF2412211
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 20:11:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCt0W4WbDz2yw1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 04:11:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=l7KzMLHy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de
 (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=deller@gmx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=l7KzMLHy; 
 dkim-atps=neutral
X-Greylist: delayed 382 seconds by postgrey-1.36 at boromir;
 Tue, 21 Sep 2021 04:10:27 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCszl2PvBz2xfM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 04:10:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1632161415;
 bh=qs0DArqAPOvJVRu48rowJhF8MgdjMaPpAg6EqgXnKTY=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=l7KzMLHyb2N1wb/jYb4pMOuvnfDkJBuImoQ/h89ArzffQvqkMVcf7q9j/j2QKSQSo
 vMeBILQg9egOk9z3W9QuXSZ2Q3B1MXYJcSyXrBBgdu2+AKNkWTAHhBP12K4VA09efY
 N6jy1/CqWJF+AWfzNcAY6fAzvWbF29MXuLhjS/oo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.139.149]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9FnZ-1mYijQ0r9L-006KF7; Mon, 20
 Sep 2021 20:01:59 +0200
Subject: Re: [PATCH] agp: define proper stubs for empty helpers
To: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Michael Ellerman <mpe@ellerman.id.au>, "David S. Miller"
 <davem@davemloft.net>
References: <20210920121728.94045-1-arnd@kernel.org>
From: Helge Deller <deller@gmx.de>
Message-ID: <964b57bd-d9ea-2df7-72f8-4fe0a24e365c@gmx.de>
Date: Mon, 20 Sep 2021 20:01:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210920121728.94045-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ielC16M4jNM8r9XDB90QignHCy/6YlUha15mhFWovRcMy9O1zzb
 8QypFMtAxF5MzAHK++H1MBI81Sa75wLy/setk5x13DasmVS0AKNKY6GfUyCrzNgdbtkCKTc
 kwWR86U72xfpyB6Hrky0K/RNzjOCDlpPupfFbZssjNmoecQixWFYM7O/WLC1GhFaR6lMazX
 yBDHtqk4g/mtZryfF0OBQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GKtrhLsKP+4=:Rtbg1eZk3RNZKh2R5efbNe
 ha+OPXEKMXyEDCebD6gCcJZit3jw4W8uxVb6kCgdxrz4OT/DaAz1vcr6Zff38hU6R9D70cLaI
 XUEZ20OWFI2Me3uJUKJPiFie84faMpHrpAyCf/1etes60IUFUFneHuokcMwLSoRQFYPJ0p1RS
 5NrSZLu3X4tkDWq3y2l4pvc53wBK9Wj0ji99FAN3MWZfoophwj/4pwCSjblhqVE+KR/nnR84y
 0VGqo5CmHq2nENkLDhQIMO+nwv/O5oaqxtReNUffjFhiZnO8yyebamlINEhGDD3TregGoN7Lu
 y2H95HOkZzW6lh17qPnIE2DiFHdMiEcOU+LMD4u83ZYw7zNBEpPTddX9mA0RYsMbh2scmr2os
 Aoy4K7esbwSyQsOHNYCW2yl2qBloAeIYixUkl4xrSV9+GqS2IF46MGt7T/sWjSrxhFi4cV3eN
 3oeVkG7bteo23On2MoUXVGfP2dO4WZ4Ig989js9YeAQS5s5Cc5QKr5a5ontsctxdlOtJMk41l
 VRRbJCQ8ezXQd1zW19yTMGpJGvyx6MP7ucCs7kpyfHcV18hZrhetH/IB3LnEyrd9x2JdNeLWz
 VQiiYz2+ILvQI6M0ANMwiBNEUFftRJWahsThBwXzXQ3KaUHiQRJfxXHtS9qZU08awOMTaxnNS
 k++yYwyl7wGhNpVhtzyNFEQ+mVyoMMs0H4MhygZuTqxQtgDOS7nqeXiTe0Zu+Aq208ezen55D
 psTFtVcfIoIdmDyWAHR6fPLOOaVUvNsm3KeGF5Kk5xt+UCoWntXrnhY7x2ps7U7a/+n+CHe++
 YIPH+dddnWukKttfINVbl542wLO14KWzA7iyKt030ZohCNiJ4KDkeDyHojEjYnJ7QZomviZha
 fCtccZ+hZVo4VqQM3AqkRBo9DnMbx26jSMyDWDjJe9vRYH2fY2dLalctrOzveG6bme+929Iuv
 LVjTTI1FQUrwlKfHPzTfKtKH2z+iTy2jqDTcME0IGThW4kHgmir68SNIvDLjvSJbNlzhNbOqq
 +t+ia5U50ieR5xdMZbY0o9rhoucR8FYSbEE/LBZLiF1bjx3zdq4Vg0Lw4RoLmSWRBLjSoNWI2
 slcDUAIQK1YZok=
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
Cc: linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/20/21 2:17 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The empty unmap_page_from_agp() macro causes a warning when
> building with 'make W=3D1' on a couple of architectures:
>
> drivers/char/agp/generic.c: In function 'agp_generic_destroy_page':
> drivers/char/agp/generic.c:1265:28: error: suggest braces around empty b=
ody in an 'if' statement [-Werror=3Dempty-body]
>   1265 |   unmap_page_from_agp(page);
>
> Change the definitions to a 'do { } while (0)' construct to
> make these more reliable.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Helge Deller <deller@gmx.de> # parisc

Thanks,
Helge

> ---
>   arch/parisc/include/asm/agp.h  | 4 ++--
>   arch/powerpc/include/asm/agp.h | 4 ++--
>   arch/sparc/include/asm/agp.h   | 6 +++---
>   3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/parisc/include/asm/agp.h b/arch/parisc/include/asm/agp=
.h
> index cb04470e63d0..14ae54cfd368 100644
> --- a/arch/parisc/include/asm/agp.h
> +++ b/arch/parisc/include/asm/agp.h
> @@ -8,8 +8,8 @@
>    *
>    */
>
> -#define map_page_into_agp(page)		/* nothing */
> -#define unmap_page_from_agp(page)	/* nothing */
> +#define map_page_into_agp(page)		do { } while (0)
> +#define unmap_page_from_agp(page)	do { } while (0)
>   #define flush_agp_cache()		mb()
>
>   /* GATT allocation. Returns/accepts GATT kernel virtual address. */
> diff --git a/arch/powerpc/include/asm/agp.h b/arch/powerpc/include/asm/a=
gp.h
> index b29b1186f819..6b6485c988dd 100644
> --- a/arch/powerpc/include/asm/agp.h
> +++ b/arch/powerpc/include/asm/agp.h
> @@ -5,8 +5,8 @@
>
>   #include <asm/io.h>
>
> -#define map_page_into_agp(page)
> -#define unmap_page_from_agp(page)
> +#define map_page_into_agp(page) do {} while (0)
> +#define unmap_page_from_agp(page) do {} while (0)
>   #define flush_agp_cache() mb()
>
>   /* GATT allocation. Returns/accepts GATT kernel virtual address. */
> diff --git a/arch/sparc/include/asm/agp.h b/arch/sparc/include/asm/agp.h
> index efe0d6a12e5a..2d0ff84cee3f 100644
> --- a/arch/sparc/include/asm/agp.h
> +++ b/arch/sparc/include/asm/agp.h
> @@ -4,9 +4,9 @@
>
>   /* dummy for now */
>
> -#define map_page_into_agp(page)
> -#define unmap_page_from_agp(page)
> -#define flush_agp_cache() mb()
> +#define map_page_into_agp(page)		do { } while (0)
> +#define unmap_page_from_agp(page)	do { } while (0)
> +#define flush_agp_cache()		mb()
>
>   /* GATT allocation. Returns/accepts GATT kernel virtual address. */
>   #define alloc_gatt_pages(order)		\
>

