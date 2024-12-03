Return-Path: <linuxppc-dev+bounces-3744-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D00C69E2A3B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 19:04:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2pSg3dBdz30Pl;
	Wed,  4 Dec 2024 05:04:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733249059;
	cv=none; b=O1Vx/MMfUE48s4ckRnPISEuaOQUQBRxmy7wqnTTP2WjEKv56rXfRArQXNIPxx2UlfrSCwsFN8v7uOGoaaOZXTMm1Vaw9+D1LqsTuJ/taQXonWSRMGJprH4eitkQY0yzTtCBiRUyOLuWdrjE4RcAa/YmDb8NGRbKybBqbnFnFbrDnuf6voHoxvnqOEas/Zu279p/f1TZ4oAbu9bxzylQLXLHTDa2csau+5FLVP2BegBK+K1Ki3XonIva5GO/xPDyKovCy8pK3h8nRJmERDQ+qReqLi+RUyFeBhS4ItTgx9kIhvCYE1PySfPiJgLO7Raipq0ku2Bkl/DApBnaPZHOdeA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733249059; c=relaxed/relaxed;
	bh=VQMebrBWojbOWHLi2V6GeEXp4jzM3FFKoHNY4IchQ7M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m2ngrvYwvv+Noy6xywsLaCJ+X2wc5xGnduGdGZKd4iTKHB+7oKOYOJ84XQOFIZqJOCAApzKL/8iAmOWlFncDw1D+YoySTq9zSHanPsAOcI3XKUkXaeTT7WfV+oPi5dfl1b4ZPq9DtQniThqkMNmiLUHDRHFWJetx5G3opliEg1PFvCIKyNOOY2Z6FId482RmFXd74XuMdZK1gvZVE9UiFy9CXUpTXmgip09HDA19+5EvoUfgvzeLsNIRs/E2Dc9PBesZ0T0++C73npYc44L0ekRU6yk+5AW7dh83I+Qt2FP72I76ZsZYG6jx9T48NStsTmPF0FoQrJmya+h4v2tNyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=l.stach@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=l.stach@pengutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 985 seconds by postgrey-1.37 at boromir; Wed, 04 Dec 2024 05:04:17 AEDT
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2pSd6h7Rz30Pg
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 05:04:17 +1100 (AEDT)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1tIWyE-0003sq-Mm; Tue, 03 Dec 2024 18:45:58 +0100
Message-ID: <fc624e3fd4a4a38dedf02e31be9e4f1c85fb40a0.camel@pengutronix.de>
Subject: Re: [PATCH 09/22] drm/etnaviv: Convert timeouts to secs_to_jiffies()
From: Lucas Stach <l.stach@pengutronix.de>
To: Easwar Hariharan <eahariha@linux.microsoft.com>, Pablo Neira Ayuso
 <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>,  Nicolas Palix
 <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Ofir
 Bitton <obitton@habana.ai>, Oded Gabbay <ogabbay@kernel.org>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 James Smart <james.smart@broadcom.com>, Dick Kennedy
 <dick.kennedy@broadcom.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Jens Axboe <axboe@kernel.dk>, Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Jack
 Wang <jinpu.wang@cloud.ionos.com>, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz
 <luiz.dentz@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Xiubo
 Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,  Josh Poimboeuf
 <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, Miroslav Benes
 <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Russell King <linux+etnaviv@armlinux.org.uk>, Christian
 Gmeiner <christian.gmeiner@gmail.com>,  Louis Peens
 <louis.peens@corigine.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr, 
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org, 
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org,  linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org,  ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org,  linux-sound@vger.kernel.org,
 etnaviv@lists.freedesktop.org,  oss-drivers@corigine.com,
 linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen <anna-maria@linutronix.de>
Date: Tue, 03 Dec 2024 18:45:50 +0100
In-Reply-To: <20241115-converge-secs-to-jiffies-v1-9-19aadc34941b@linux.microsoft.com>
References: 
	<20241115-converge-secs-to-jiffies-v1-0-19aadc34941b@linux.microsoft.com>
	 <20241115-converge-secs-to-jiffies-v1-9-19aadc34941b@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
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
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Am Freitag, dem 15.11.2024 um 21:22 +0000 schrieb Easwar Hariharan:
> Changes made with the following Coccinelle rules:
>=20
> @@ constant C; @@
>=20
> - msecs_to_jiffies(C * 1000)
> + secs_to_jiffies(C)
>=20
> @@ constant C; @@
>=20
> - msecs_to_jiffies(C * MSEC_PER_SEC)
> + secs_to_jiffies(C)
>=20
Thanks, applied to etnaviv/next.

Regards,
Lucas

> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c b/drivers/gpu/drm/e=
tnaviv/etnaviv_cmdbuf.c
> index 721d633aece9d4c81f0019e4c55884f26ee61c60..0f5a2c885d0ab7029c7248e15=
d6ea3c31823b782 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
> @@ -100,7 +100,7 @@ int etnaviv_cmdbuf_init(struct etnaviv_cmdbuf_suballo=
c *suballoc,
>  		mutex_unlock(&suballoc->lock);
>  		ret =3D wait_event_interruptible_timeout(suballoc->free_event,
>  						       suballoc->free_space,
> -						       msecs_to_jiffies(10 * 1000));
> +						       secs_to_jiffies(10));
>  		if (!ret) {
>  			dev_err(suballoc->dev,
>  				"Timeout waiting for cmdbuf space\n");
>=20


