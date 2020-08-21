Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 461EB24D6A8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 15:54:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BY30s5ShlzDqkV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 23:54:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BY2sJ1zdyzDqrX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 23:48:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=ADQBlNiR; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BY2sH3cfbz8tY5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 23:48:03 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BY2sH254kz9sTT; Fri, 21 Aug 2020 23:48:03 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=samsung.com (client-ip=210.118.77.12;
 helo=mailout2.w1.samsung.com; envelope-from=b.zolnierkie@samsung.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=ADQBlNiR; 
 dkim-atps=neutral
X-Greylist: delayed 540 seconds by postgrey-1.36 at bilbo;
 Fri, 21 Aug 2020 23:48:00 AEST
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BY2sD1PY3z9sPB
 for <linuxppc-dev@ozlabs.org>; Fri, 21 Aug 2020 23:47:57 +1000 (AEST)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200821133850euoutp023e041766d9b2d9032039befab6214055~tTB0VS4RO0900209002euoutp02S
 for <linuxppc-dev@ozlabs.org>; Fri, 21 Aug 2020 13:38:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200821133850euoutp023e041766d9b2d9032039befab6214055~tTB0VS4RO0900209002euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598017130;
 bh=PKDp4H0K8uyocu7NrFxiqQ4LluS5nl44yexs6EOXu0w=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ADQBlNiRT6H4+nd6odQYVYj5TWyHLgs0gZ2np3pADtOwQsvPb/5aqZgJwS1Ncvovr
 1OOGsD8XoLofSZorTuxYdJDJLUb+fGv78e6Mrg1qaz8HFbino5iCxnvY788zPcewg0
 HJTMvWcX8HXvYlvFxvAPGptFjHkXdGKzTYbCOyAM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200821133850eucas1p294fd936bcd85ec542b9338f3109cd763~tTBz_Sp0E2703427034eucas1p2l;
 Fri, 21 Aug 2020 13:38:50 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 47.7A.06456.A6ECF3F5; Fri, 21
 Aug 2020 14:38:50 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200821133849eucas1p1c5312c4053aac0878841b048755991b5~tTBzqvsBZ0285102851eucas1p1B;
 Fri, 21 Aug 2020 13:38:49 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200821133849eusmtrp17099eddedfe77d945724c5cd1d30d153~tTBzqHfDc0848908489eusmtrp1f;
 Fri, 21 Aug 2020 13:38:49 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-64-5f3fce6a8eea
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 5B.28.06314.96ECF3F5; Fri, 21
 Aug 2020 14:38:49 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200821133849eusmtip1dab3a1fdf015c62eedc9b014cb4f8d45~tTBzUQE5p1814218142eusmtip1O;
 Fri, 21 Aug 2020 13:38:49 +0000 (GMT)
Subject: Re: [PATCH] video: fbdev: controlfb: Fix build for COMPILE_TEST=y
 && PPC_PMAC=n
To: Michael Ellerman <mpe@ellerman.id.au>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <cd4324bb-67f7-5ae0-af7b-42681d72d85f@samsung.com>
Date: Fri, 21 Aug 2020 15:38:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200821104910.3363818-1-mpe@ellerman.id.au>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRmVeSWpSXmKPExsWy7djP87pZ5+zjDS4t57BY+PAus8WVr+/Z
 LE70fWC1uLxrDpvF/xtvWCy2NBxis1jxcyujA7vHopcNLB57vy1g8bjffZzJY+Wli+weS6Zd
 ZfP4vEkugC2KyyYlNSezLLVI3y6BK6Pr9SW2goPcFW9evGRpYNzH2cXIySEhYCIxafcWVhBb
 SGAFo8S651FdjFxA9hdGield+9ggnM+MErffdbPAdBy/vZURIrGcUeLj91PMEO1vGSU2N3iA
 2MICURJLz15hA7FFBDQlru5exgrSwCywlFHiyeOFTCAJNgEriYntqxhBbF4BO4neZY1AcQ4O
 FgFViYZeVZCwqECExKcHh1khSgQlTs58AnYEJ1DrsmtXweYzC4hL3HoynwnClpdo3jqbGWSX
 hMA+dolrTZuZIK52kfg78yIzhC0s8er4FnYIW0bi9OQeFoiGdYwSfzteQHVvZ5RYPvkfG0SV
 tcSdc7/YQK5jBnpn/S59EFNCwFFi+zdeCJNP4sZbQYgb+CQmbZvODBHmlehoE4KYoSaxYdkG
 NpitXTtXMk9gVJqF5LNZSL6ZheSbWQhrFzCyrGIUTy0tzk1PLTbMSy3XK07MLS7NS9dLzs/d
 xAhMRaf/Hf+0g/HrpaRDjAIcjEo8vD8O2ccLsSaWFVfmHmKU4GBWEuF1Ons6Tog3JbGyKrUo
 P76oNCe1+BCjNAeLkjiv8aKXsUIC6YklqdmpqQWpRTBZJg5OqQbGRWzNhav5xL9GS2aVBOaI
 X3OK2Cs1wV69K/6o2qRFi5atDW5Nzv3oyMrhMsN727m0f3qxMwutvHqPXKt4vTd5O0POZIFb
 7z2FytvYbr6TuqbR3VDxI23t86pjF7/tElywKmK1bbih0+tr62tsW1nPBoiqP93udEJFnydX
 su7H8a6ViZNX1i1RYinOSDTUYi4qTgQAAktlTUEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xu7qZ5+zjDY5sNLRY+PAus8WVr+/Z
 LE70fWC1uLxrDpvF/xtvWCy2NBxis1jxcyujA7vHopcNLB57vy1g8bjffZzJY+Wli+weS6Zd
 ZfP4vEkugC1Kz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI
 3y5BL6Pr9SW2goPcFW9evGRpYNzH2cXIySEhYCJx/PZWxi5GLg4hgaWMEps3HmbpYuQASshI
 HF9fBlEjLPHnWhcbRM1rRomvc7aygySEBaIkbkx9xghiiwhoSlzdvYwVpIgZZNDL2UfYITp6
 GSU+bOljA6liE7CSmNi+CqyDV8BOondZIxPINhYBVYmGXlWQsKhAhMThHbOgSgQlTs58wgJi
 cwK1Lrt2FWwMs4C6xJ95l5ghbHGJW0/mM0HY8hLNW2czT2AUmoWkfRaSlllIWmYhaVnAyLKK
 USS1tDg3PbfYUK84Mbe4NC9dLzk/dxMjMP62Hfu5eQfjpY3BhxgFOBiVeHh/HLKPF2JNLCuu
 zD3EKMHBrCTC63T2dJwQb0piZVVqUX58UWlOavEhRlOg3yYyS4km5wNTQ15JvKGpobmFpaG5
 sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBkb/oFvq71tmTP5vdmG9Q77Iogjvi6t3
 ZYhr+6Xv2HKUn/l6nv1dQ74G9iUPV4hPaFv+9NGjnVZNCpVLjeuqUj48bYv/lWJcyqH0buvc
 PVJS6/b/c+L8328i3bbzt+NJoQ2mPfHuL2Tmer1/eMn+TfnU23J7s33zZOpmCLZc3SN47mSJ
 vuIJlSolluKMREMt5qLiRABNJS5i1QIAAA==
X-CMS-MailID: 20200821133849eucas1p1c5312c4053aac0878841b048755991b5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200821104924eucas1p1e4b848e88fe460b9b7063669714a36f3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200821104924eucas1p1e4b848e88fe460b9b7063669714a36f3
References: <CGME20200821104924eucas1p1e4b848e88fe460b9b7063669714a36f3@eucas1p1.samsung.com>
 <20200821104910.3363818-1-mpe@ellerman.id.au>
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
Cc: linux-fbdev@vger.kernel.org, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linuxppc-dev@ozlabs.org, sam@ravnborg.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 8/21/20 12:49 PM, Michael Ellerman wrote:
> The build is currently broken, if COMPILE_TEST=y and PPC_PMAC=n:
> 
>   linux/drivers/video/fbdev/controlfb.c: In function ‘control_set_hardware’:
>   linux/drivers/video/fbdev/controlfb.c:276:2: error: implicit declaration of function ‘btext_update_display’
>     276 |  btext_update_display(p->frame_buffer_phys + CTRLFB_OFF,
>         |  ^~~~~~~~~~~~~~~~~~~~
> 
> Fix it by including btext.h whenever CONFIG_BOOTX_TEXT is enabled.
> 
> Fixes: a07a63b0e24d ("video: fbdev: controlfb: add COMPILE_TEST support")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Thanks for fixing this.

> ---
>  drivers/video/fbdev/controlfb.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> Does anyone mind if I apply this via the powerpc tree for v5.9?
> 
> It would be nice to get the build clean.

No objections from my side.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> cheers
> 
> diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
> index 9c4f1be856ec..547abeb39f87 100644
> --- a/drivers/video/fbdev/controlfb.c
> +++ b/drivers/video/fbdev/controlfb.c
> @@ -49,6 +49,8 @@
>  #include <linux/cuda.h>
>  #ifdef CONFIG_PPC_PMAC
>  #include <asm/prom.h>
> +#endif
> +#ifdef CONFIG_BOOTX_TEXT
>  #include <asm/btext.h>
>  #endif
>  
