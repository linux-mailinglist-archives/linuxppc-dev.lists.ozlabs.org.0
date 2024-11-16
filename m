Return-Path: <linuxppc-dev+bounces-3319-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FF09CFDC0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2024 11:07:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xr8gq32Ffz303d;
	Sat, 16 Nov 2024 21:07:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731751623;
	cv=none; b=BX6e2EkBA6u78Ytbwz00yIBIRG8FtCls8RKUS98CvdpDJSJfHDo7aplk4ZUOWmnmSnt5Xahyf2BBx19ndwyLTzE10rZxPS6R4lB2tiVeo2DYDefSuewHJiiIXn/PpZMvvzYUozBZiKGB93KM3muDrcTiG4v5oWupn7urO5yM61X7om7Dt7MKgKVKSxtLmnFS5yi+xtobQi/ebgFOr6VDa1+DZ6XBGW8+i1Cy6LWeX8pjWbweJmlsDWZt/Zerhh6ET0ulseZn5Lqy7lteeSESYmSgpVBG9g8rHCFu2xwgKoD4BkUmD5UgTue6IFWniTkzuN5ORbcGdddu5DC1L/z00Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731751623; c=relaxed/relaxed;
	bh=6BITrGwCktL5Jq+X71yuMGeN9lc8EktfbH6sdnkEy4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m4R9MM15sH30AvPDxW2fJxVHsxNlxFx7SaVfS+bC64rek/dusYft94/8FqaWADnvly2chhWisqZnUZ9H7YMubDOoJOI2PfU4VaL3hVGghlRBktJhy1uhUQxaF/luDaPhEINVOf60m3wg9p3qWNLh+T05y4mdSCgqaKcHZoOTVXtjg1EJfOIVfhomFBqJkdclyJjiebImTkM6tMhQQ5hRLu5myRm8e0PWvzFl+PEH1rgd3uoaYdPNfZBlqgXCjC3On5M0yBSSPG7nV3ocs3BLyi+YGk1Vv4mpgQPRvTf1OHDgC8l0mueTNC9z3CbmnLUhNJCUro/9P+QPqKeT5DZaZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xr8gp2lTLz2yGZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 21:07:02 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Xr8gl1ry9z9sSX;
	Sat, 16 Nov 2024 11:06:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GiuJ5kFiF1NH; Sat, 16 Nov 2024 11:06:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Xr8gl0b48z9sST;
	Sat, 16 Nov 2024 11:06:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ECAD08B7A0;
	Sat, 16 Nov 2024 11:06:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xw5jQJJ7h8Zy; Sat, 16 Nov 2024 11:06:58 +0100 (CET)
Received: from [192.168.232.159] (POS169858.IDSI0.si.c-s.fr [192.168.232.159])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7AEB48B763;
	Sat, 16 Nov 2024 11:06:55 +0100 (CET)
Message-ID: <b6a059d8-7b23-455d-9ecd-eb3cdddd22a2@csgroup.eu>
Date: Sat, 16 Nov 2024 11:06:55 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/21] powerpc/papr_scm: Convert timeouts to
 secs_to_jiffies()
To: Easwar Hariharan <eahariha@linux.microsoft.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King
 <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>,
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Jack Wang <jinpu.wang@cloud.ionos.com>, Marcel Holtmann
 <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Xiubo Li <xiubli@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Louis Peens <louis.peens@corigine.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
 etnaviv@lists.freedesktop.org, oss-drivers@corigine.com,
 linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen <anna-maria@linutronix.de>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-5-911fb7595e79@linux.microsoft.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-5-911fb7595e79@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 15/11/2024 à 22:26, Easwar Hariharan a écrit :
> [Vous ne recevez pas souvent de courriers de eahariha@linux.microsoft.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Changes made with the following Coccinelle rules:
> 
> @@ constant C; @@
> 
> - msecs_to_jiffies(C * 1000)
> + secs_to_jiffies(C)
> 
> @@ constant C; @@
> 
> - msecs_to_jiffies(C * MSEC_PER_SEC)
> + secs_to_jiffies(C)

Is it a special script or is it done with the script in patch 2.

That's nice to say how it is done, but you also have to say _what_ and 
_why_ you do it. This is even more important as you plan to get it 
merged independently in each tree instead of merging it as a single series.

It could be something like:

Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced 
secs_to_jiffies(). As the value here is a multiple of 1000, use 
secs_to_jiffies() instead of msecs_to_jiffies to avoid the multiplication.

This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci

> 
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>   arch/powerpc/platforms/pseries/papr_scm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 9e297f88adc5d97d4dc7b267b0bfebd58e5cf193..9e8086ec66e0f0e555ac27933854c06cfcf91a04 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -543,7 +543,7 @@ static int drc_pmem_query_health(struct papr_scm_priv *p)
> 
>          /* Jiffies offset for which the health data is assumed to be same */
>          cache_timeout = p->lasthealth_jiffies +
> -               msecs_to_jiffies(MIN_HEALTH_QUERY_INTERVAL * 1000);
> +               secs_to_jiffies(MIN_HEALTH_QUERY_INTERVAL);

Wouldn't it now fit on a single line ?

	cache_timeout = p->lasthealth_jiffies + 
secs_to_jiffies(MIN_HEALTH_QUERY_INTERVAL);


Also I'm not sure it is worth the MIN_HEALTH_QUERY_INTERVAL macro as it 
is defined localy and used only once, but that's another story.

> 
>          /* Fetch new health info is its older than MIN_HEALTH_QUERY_INTERVAL */
>          if (time_after(jiffies, cache_timeout))
> 
> --
> 2.34.1
> 

