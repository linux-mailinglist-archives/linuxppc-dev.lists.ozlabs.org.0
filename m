Return-Path: <linuxppc-dev+bounces-3314-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F66E9CFCE9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2024 07:38:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xr43B52j4z30PJ;
	Sat, 16 Nov 2024 17:38:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.12.242.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731739110;
	cv=none; b=O9Q/g/RBRXx8knGZcE8OE6TN1nXZv9UiFXgJanYGwsiXN0jb0mQNkbCSVapbndFIZ6LokhZJlJ4fwtUzHhzFPg82o6KQfuY4vDrDuCZCSiPXFGlD1ojTdlSxAS85EmMAGONW8x1cs3XGcF8URY0pJZ7Tz8fApDbxVKZ8y6hFTnn9NTFjONmYV+Dn1CIRdum7IM4YYw0X4lwjouj9TiTWw4CoW+DvH4rvVCzRvF3gf9eYj/kpdmFrOZqipt3v1Ddnd5z7a5ei82bC59z7EO5ykbXMVbe7uyeaTv9B28+I9kWxFtmBQlpKB5i3ibZllPTilSdJcpjXTVFnWzKvDvbxYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731739110; c=relaxed/relaxed;
	bh=1GOO379j5kHelQgT13xeDCIW+pFPJCeiM7WSIuvag78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y4xZjkBSg9LiqdDEzZv2mMpf0OdQTM/Kw5lVJheV4Pr8XAHClE3T2wPXyC1gMmbHj8xjqnZIhuPJgwIOKcUVwQ+ugUYuex9DdcbWYnRm2C3XtFdhhK93XjBu4BWoNJmqngeVB9JoY/3JeN59LPaiOEwyliCCYnbMULWUDYYTKT7NBYRH2jTAapTd23iELtwrXP57xllAop+t1Z4uw3Dwl+1tRIscQcQu9JJJzjMdqMiRjElWnfZTeM2QluQW3lGyMtD1nD9orKKVuWy/eo7saajKjGBO3UWDSKzepRMzL3S3RPaOJYYWfsBxaFpYuwh09ZFJs1iQbf7L9J+VNrWv+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=mL98MjzV; dkim-atps=neutral; spf=pass (client-ip=80.12.242.18; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org) smtp.mailfrom=wanadoo.fr
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=mL98MjzV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.18; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 1878 seconds by postgrey-1.37 at boromir; Sat, 16 Nov 2024 17:38:27 AEDT
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr [80.12.242.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xr43750QCz30DL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 17:38:26 +1100 (AEDT)
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id CBwItlkEVyQmhCBwItrt0n; Sat, 16 Nov 2024 07:06:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731737162;
	bh=1GOO379j5kHelQgT13xeDCIW+pFPJCeiM7WSIuvag78=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=mL98MjzVZSShtzisX9zbjDjIb7KE72buAzIx9jorkgCEIlxacBGBiKDqnznYupede
	 vEhaEvssP8Otw+abSwd4UipThVl5qw3v6w8RixuAXgrl/p9FBRiYmldRfZZljgK0OD
	 FX0UB9px2S9OjhfpAHnQggpK1elWNH8UBNVIvO5x+AsAiYtyf4oGwInz8jFtqh7DDu
	 OMNwG4GURPpChqfcVzLVhpacwz+NEqWf9xIvmwF/gxmCGy7nRrRkaf4TeGrlu6c0Ll
	 o9NHONgP90fIf7c6ZsyFFLJ/v2i9NFywx5+jxHfxBiA3eBfpU5DKAu5obNXbrUQywu
	 rI95zY+eQlUcg==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 16 Nov 2024 07:06:02 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: eahariha@linux.microsoft.com
Cc: James.Bottomley@HansenPartnership.com,
	Julia.Lawall@inria.fr,
	agordeev@linux.ibm.com,
	airlied@gmail.com,
	akpm@linux-foundation.org,
	andrew+netdev@lunn.ch,
	anna-maria@linutronix.de,
	ath11k@lists.infradead.org,
	axboe@kernel.dk,
	bcm-kernel-feedback-list@broadcom.com,
	borntraeger@linux.ibm.com,
	catalin.marinas@arm.com,
	ceph-devel@vger.kernel.org,
	christian.gmeiner@gmail.com,
	christophe.leroy@csgroup.eu,
	cocci@inria.fr,
	coreteam@netfilter.org,
	daniel@zonque.org,
	davem@davemloft.net,
	dick.kennedy@broadcom.com,
	dri-devel@lists.freedesktop.org,
	edumazet@google.com,
	etnaviv@lists.freedesktop.org,
	florian.fainelli@broadcom.com,
	gor@linux.ibm.com,
	gregkh@linuxfoundation.org,
	haojian.zhuang@gmail.com,
	hca@linux.ibm.com,
	horms@kernel.org,
	idryomov@gmail.com,
	intel-xe@lists.freedesktop.org,
	james.smart@broadcom.com,
	jeroendb@google.com,
	jikos@kernel.org,
	jinpu.wang@cloud.ionos.com,
	jjohnson@kernel.org,
	joe.lawrence@redhat.com,
	johan.hedberg@gmail.com,
	jpoimboe@kernel.org,
	kadlec@netfilter.org,
	kuba@kernel.org,
	kvalo@kernel.org,
	l.stach@pengutronix.de,
	linux+etnaviv@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	linux@armlinux.org.uk,
	linuxppc-dev@lists.ozlabs.org,
	live-patching@vger.kernel.org,
	louis.peens@corigine.com,
	lucas.demarchi@intel.com,
	luiz.dentz@gmail.com,
	maarten.lankhorst@linux.intel.com,
	maddy@linux.ibm.com,
	marcel@holtmann.org,
	martin.petersen@oracle.com,
	mbenes@suse.cz,
	mpe@ellerman.id.au,
	mripard@kernel.org,
	naveen@kernel.org,
	netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	nicolas.palix@imag.fr,
	npiggin@gmail.com,
	obitton@habana.ai,
	ogabbay@kernel.org,
	oss-drivers@corigine.com,
	pabeni@redhat.com,
	pablo@netfilter.org,
	perex@perex.cz,
	pkaligineedi@google.com,
	pmladek@suse.com,
	rjui@broadcom.com,
	robert.jarzmik@free.fr,
	rodrigo.vivi@intel.com,
	roger.pau@citrix.com,
	sbranden@broadcom.com,
	shailend@google.com,
	simona@ffwll.ch,
	svens@linux.ibm.com,
	thomas.hellstrom@linux.intel.com,
	tiwai@suse.com,
	tzimmermann@suse.de,
	xen-devel@lists.xenproject.org,
	xiubli@redhat.com
Subject: Re: [PATCH v2 02/21] coccinelle: misc: Add secs_to_jiffies script
Date: Sat, 16 Nov 2024 07:05:40 +0100
Message-ID: <20241116060541.5798-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-2-911fb7595e79@linux.microsoft.com>
References: <20241115-converge-secs-to-jiffies-v2-2-911fb7595e79@linux.microsoft.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Le 15/11/2024 à 22:26, Easwar Hariharan a écrit :
> Suggested-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>   scripts/coccinelle/misc/secs_to_jiffies.cocci | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/scripts/coccinelle/misc/secs_to_jiffies.cocci b/scripts/coccinelle/misc/secs_to_jiffies.cocci
> new file mode 100644
> index 0000000000000000000000000000000000000000..af762b1c0aac8f044f21150bfaafd9efc834ee87
> --- /dev/null
> +++ b/scripts/coccinelle/misc/secs_to_jiffies.cocci
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +///
> +/// Find usages of:
> +/// - msecs_to_jiffies(value*1000)
> +/// - msecs_to_jiffies(value*MSEC_PER_SEC)
> +///
> +// Confidence: High
> +// Copyright: (C) 2024 Easwar Hariharan Microsoft
> +//
> +// Keywords: secs, seconds, jiffies
> +//
> +
> +@@ constant C; @@
> +
> +- msecs_to_jiffies(C * 1000)
> ++ secs_to_jiffies(C)
> +
> +@@ constant C; @@
> +
> +- msecs_to_jiffies(C * MSEC_PER_SEC)
> ++ secs_to_jiffies(C)
> 
Hi,

	@@ constant C =~ "000"; @@

	* msecs_to_jiffies(C)

also spots things like msecs_to_jiffies(1000)

I'm not sure that coccinelle is enable to capture part of the regex to automate the removal of the 000 when converting from ms to s.

Just my 2c,

CJ

