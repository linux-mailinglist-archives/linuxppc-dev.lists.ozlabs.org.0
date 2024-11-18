Return-Path: <linuxppc-dev+bounces-3407-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E329D0FBD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2024 12:29:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsQQK118Tz2xy6;
	Mon, 18 Nov 2024 22:29:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731929385;
	cv=none; b=F+EkhN+XYyH0vierGQvxv10F793Mezcb7M0prgWJ1UtILRSwSBu/odk6MSYRGa4MnV0YyGXqpEbBrkYkD3yjNrs4t2I9RcjLIkH+4N9ge/4DO/Yfox33ymQtOVPl4V3E3B9162M5BDN7S1jZ4C6wQCfDBKacAt8/pck0KUWUYxFvnLtun4c9SSvUgWGeyUic0Mooi6163hUUF65vonnCRz7fPo+wg42Yp7hJRl1ibUsb11sqxQrBJcCMZ7WWu8BWH77KXGqbzERSRtRbvDqYhSTejFkF2xApKQTQqwpe4Mnw7PbpfoiC/Ja+mmEifckY8BQ+mgwC+QBSMPyxgowPpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731929385; c=relaxed/relaxed;
	bh=+R1FnDR/d18PL0XgQdo7E8ddqqJsostStWXSKykuwSk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S9mBvOy5RyiVLti7PJdwqc9tTwyTFKVwksKVu4gKCZfuKNW4mPTTBwXfe/Oioiaak9BAH0x/Qg1w9uNlliY+x6WbuzB5LeIrAFx5xLJ1Qrm/loQUyaaJOW+h1/kMw7S0ziJR2aPO+u01yCSoCBci85K8iuF6cCn0W5+4zo4T/cYGujbB1irRzCZvIiigBQIIWURA7aswHHn4SDXEdVBO/bC0Tu8/MAyvo51q9WFkztCKn5b9gxdliipQsEhIf88vY2/yiPJE+Ibw3nVTvd5WoiuOmZlA+NmEFTPNlchuQBIfdnn4U29FpWcgq0ys7VcLTol49590N6jQYl6zPdCm+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gju0J5EE; dkim-atps=neutral; spf=none (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=thomas.hellstrom@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gju0J5EE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=thomas.hellstrom@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 62 seconds by postgrey-1.37 at boromir; Mon, 18 Nov 2024 22:29:41 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XsQQF4XRWz2xrJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 22:29:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731929382; x=1763465382;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=eflO5BqcAdiHnObc19vuFxv1kFN4bcVh6FEadC6e/J0=;
  b=gju0J5EE6eDnWoP2Ecu6l8qb05nt+5PFOLJw4+0i6LCqNYfOXUQMpl5s
   L+hapE2RbCoQjPmb8xmCtGqk/rXmtoQv/5OMRXQrrVfeOGQuTx8GFGjyr
   toqTFY64FlLyg0QjHke8uT2mGgDCnbfFjIZt0UmcznX5WoIiIoh06BAlu
   91GA9/Zav7I3eQGFMx3ufBBNr5fS0gS9WOUKahBsALeJKIuKIzSlnshBR
   1NFWt+UShNy1JRthCq6Mzjz0csM0BExETGdXM1u0C4Xn/2lYN8pL7LWrf
   XrDAkemAUqNoxMJGKIFgcq02WVsWIu7eak2iVC8BOPPqToNpg58g26svT
   w==;
X-CSE-ConnectionGUID: BR30tIc4QpOOZAGeQwmzng==
X-CSE-MsgGUID: WfD/95d7SD2se0oOgP2btQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="42396220"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="42396220"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 03:28:31 -0800
X-CSE-ConnectionGUID: rRdUd/MrRkyoZEJD1Sac1Q==
X-CSE-MsgGUID: apTDPmdSTQ+3Y3NYJwg9xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="89329614"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO [10.245.246.149]) ([10.245.246.149])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 03:28:08 -0800
Message-ID: <62c1e9e941cec75cf8771761fb9981879fefcce5.camel@linux.intel.com>
Subject: Re: [PATCH 08/22] drm/xe: Convert timeout to secs_to_jiffies()
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
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
 Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
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
 <tiwai@suse.com>, Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>,  Christian Gmeiner
 <christian.gmeiner@gmail.com>, Louis Peens <louis.peens@corigine.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
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
Date: Mon, 18 Nov 2024 12:27:53 +0100
In-Reply-To: <20241115-converge-secs-to-jiffies-v1-8-19aadc34941b@linux.microsoft.com>
References: 
	<20241115-converge-secs-to-jiffies-v1-0-19aadc34941b@linux.microsoft.com>
	 <20241115-converge-secs-to-jiffies-v1-8-19aadc34941b@linux.microsoft.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-3.fc39) 
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
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 2024-11-15 at 21:22 +0000, Easwar Hariharan wrote:
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
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

<
> ---
> =C2=A0drivers/gpu/drm/xe/xe_device.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c
> b/drivers/gpu/drm/xe/xe_device.c
> index
> a1987b554a8d2aa42b29301f2853edddfda7fda5..bb3338ef4191e76128611eeb953
> 1c9d2089db85a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -502,7 +502,7 @@ static int wait_for_lmem_ready(struct xe_device
> *xe)
> =C2=A0	drm_dbg(&xe->drm, "Waiting for lmem initialization\n");
> =C2=A0
> =C2=A0	start =3D jiffies;
> -	timeout =3D start + msecs_to_jiffies(60 * 1000); /* 60 sec! */
> +	timeout =3D start + secs_to_jiffies(60); /* 60 sec! */
> =C2=A0
> =C2=A0	do {
> =C2=A0		if (signal_pending(current))
>=20


