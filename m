Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F02870DB0B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 12:58:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQWX33SnVz3f8x
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 20:58:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dOQwlVtH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2a; helo=mail-vk1-xa2a.google.com; envelope-from=42.hyeyoo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dOQwlVtH;
	dkim-atps=neutral
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQWWC3pH6z3bYW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 20:57:57 +1000 (AEST)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-4573e1e6cb9so2023485e0c.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 03:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684839472; x=1687431472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPZGzse+EwoYxx5aP+jOlzsmNfWXOwQHS1xYrgjsec4=;
        b=dOQwlVtHCe09Vk6RBJyv4UlmNvYYMnzQdN2fEZMcAJCu/TvLE+aT6q3cEIc8MDOmBx
         HP4ow/lRyQjX5ou5gynKDIgwRGlxnKP17GdXlnjq6uz1ijUiCnacny3Md+zs9HDXlWpd
         /vJJE9f2AKfUpQCBaZ86Lp475NcG+d8oj3/lzlNgDDkfbpoahI9iEBZqgJGax+ZttcuR
         gxFYk69/1/g6u8rT0LmqyntNq4QgPOiylA448Fmme9hwmf33rBx4ObygcWDs9zyaVSfI
         o7vxmAgMbJLQQXRgL/2ax63tRT4pKoFENMaUoAU0k0zcTFUWAtxubuxDUMY5St7Chco4
         J29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684839472; x=1687431472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPZGzse+EwoYxx5aP+jOlzsmNfWXOwQHS1xYrgjsec4=;
        b=jjAjuNyvCzeXAPseVJF8i7ymZVrNJ+mPOYu8jBcZ3sHYDm6tSdL5HuHv8KPmRHSp0S
         m4UEeTM5X5u/P8prsQoNsXAqS1SNTqM3o5Tmwjdm/PmD4st6oq3ITD/1ezmuwXFCH4Hj
         Lmb0S3TybncyCCXopSlXRO2JQ2uMmwsOSqH2rd0/dwjytTLC3uJeOTu111dRegxK+Lv0
         ttfim+SoIRUMkRv+2GO4a9JDPqF6It81lYgnNAMf8t5KwDOVjhZL5ojZTiHhrrOn2XZ+
         mo6EuFoOFAdkXpyyZpDQI9giOt6re6340zQo/zxIksl34aIoS12PZh77zZZzuDOXXxia
         4jsQ==
X-Gm-Message-State: AC+VfDy4ZZNftX4P7bUeC6O63M8wIple24AgK0+k2c0Mp9LP9BqVyqnM
	cVWeghmKAnRs9U5Mx+WIjDHyINBloT+8x4Ou/MI=
X-Google-Smtp-Source: ACHHUZ5BnP3gkAdc5bGRbbNu8BA4XYUOvijVFedQabDgzPfHyqbd3wbCe7zKvL1rqhCSR6cTKzJAQSc6wb3cCiUjneM=
X-Received: by 2002:a1f:2cce:0:b0:440:4c82:6508 with SMTP id
 s197-20020a1f2cce000000b004404c826508mr4142026vks.3.1684839472183; Tue, 23
 May 2023 03:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230523091139.21449-1-vbabka@suse.cz>
In-Reply-To: <20230523091139.21449-1-vbabka@suse.cz>
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Date: Tue, 23 May 2023 19:58:03 +0900
Message-ID: <CAB=+i9RycsnDbJ1f1jTiJ6fXnGUmH95h23G37Ss6XNAA3VJ3_w@mail.gmail.com>
Subject: Re: [PATCH] mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED
To: Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew Lunn <andrew@lunn.ch>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Roman Gushchin <roman.gushchin@linux.dev>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, Helge Deller <deller@gmx.de>, sparclinux@vger.kernel.org, Christoph Lameter <cl@linux.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-renesas-soc@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, Gregory Clement <gregory.clement@bootlin.com>, David Rientjes <rientjes@google.com>, linux-snps-arc@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, Vladimir Zapolskiy <vz@mleia.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-arm-ker
 nel@lists.infradead.org, Qin Jian <qinjian@cqplus1.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Andrew Morton <akpm@linux-foundation.org>, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, Pekka Enberg <penberg@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 23, 2023 at 6:12=E2=80=AFPM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> As discussed at LSF/MM [1] [2] and with no objections raised there,
> deprecate the SLAB allocator. Rename the user-visible option so that
> users with CONFIG_SLAB=3Dy get a new prompt with explanation during make
> oldconfig, while make olddefconfig will just switch to SLUB.
>
> In all defconfigs with CONFIG_SLAB=3Dy remove the line so those also
> switch to SLUB. Regressions due to the switch should be reported to
> linux-mm and slab maintainers.
>
> [1] https://lore.kernel.org/all/4b9fc9c6-b48c-198f-5f80-811a44737e5f@suse=
.cz/
> [2] https://lwn.net/Articles/932201/
>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---

<snip>

> diff --git a/mm/Kconfig b/mm/Kconfig
> index 7672a22647b4..b537c4436d18 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -218,11 +218,18 @@ choice
>         help
>            This option allows to select a slab allocator.
>
> -config SLAB
> -       bool "SLAB"
> +config SLAB_DEPRECATED
> +       bool "SLAB (DEPRECATED)"
>         depends on !PREEMPT_RT
>         select HAVE_HARDENED_USERCOPY_ALLOCATOR
>         help
> +         Deprecated and scheduled for removal in a few cycles. Replaced =
by
> +         SLUB.
> +
> +         If you cannot migrate to SLUB, please contact linux-mm@kvack.or=
g
> +         and the people listed in the SLAB ALLOCATOR section of MAINTAIN=
ERS
> +         file, explaining why.
> +
>           The regular slab allocator that is established and known to wor=
k
>           well in all environments. It organizes cache hot objects in
>           per cpu and per node queues.
> @@ -240,6 +247,11 @@ config SLUB
>
>  endchoice
>
> +config SLAB
> +       bool
> +       default y
> +       depends on SLAB_DEPRECATED
> +
>  config SLUB_TINY
>         bool "Configure SLUB for minimal memory footprint"
>         depends on SLUB && EXPERT
> --
> 2.40.1

Thank you for the work!
It looks good to me.
let's see some users raise their voice.

Acked-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
