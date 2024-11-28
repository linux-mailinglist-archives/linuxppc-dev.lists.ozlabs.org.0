Return-Path: <linuxppc-dev+bounces-3598-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9839DB7B4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2024 13:33:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XzbLj1qYmz2yM6;
	Thu, 28 Nov 2024 23:33:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732796943;
	cv=none; b=mlaq3DM92zydOtdlTMPpKau0ethXy7sq/zDTWtubvrZZbbFW/ES1GYZjViP8CygrBrA162pu4dQRSMaZ32UMRKxB+smEfmwzieP2v8YTZZFlt2WE16BVam8mjQocysvcWZuIF/vh6cdDzyCLXWzVjtjTDvoo4f/iZXNiSKTtx5zRa2Px0rLi2ZOpR1jc9txbG3KD2lSd5OtUcRx5/b+U1EJBkXv5nriLsZ9LtHko3eTWrxg2urw8uoqOVRa/wFt55oE8HgtpEW6UyLcs3mqjp8ox0CkivxS+7Dt5ReIvrP8HKxpTVXnyW7eFyjbvrJ3Csz6ngT+TXrr0i7V/HmLD4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732796943; c=relaxed/relaxed;
	bh=ZACMslqIaF7iVtmlx12c8LPoSlN7TzLegXngDuX2z78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mK0ZHr41+8+stC+cQa8a7tXvRb3yhuXwNLtDGrbPnsozh5szRgoCP0A0i0oIsZ6Kx3/B2OLIXwi+osrejqQ1icp3esEhpx3/V7M/lQAcqREJycGl1MfoP8FLT5J1QJ4LDu9S2p0r5LGUZ7CCxKR+9pdKwqd7OBFs+MfmTlvgWa5PlYedsiXOM2ys+xrSjYdwfyIGgvqrSVGf5ljoIRRhumn6tTsgKZjPmCfWEr5bVDpQzcVdyT2cbewgIxOh6N9HCHM9re5VCEVorAmq6czSBef3y1MHR2E1Qz/WzyKvaiaN7yG8+9dBXKwF7yIPqXYYoa2HcTTaKKfpplf/ZKY9oQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SR+2143n; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cOwjQFRm; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=amarkuze@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SR+2143n;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cOwjQFRm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=amarkuze@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XzbG60f4qz2xy0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2024 23:28:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732796934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZACMslqIaF7iVtmlx12c8LPoSlN7TzLegXngDuX2z78=;
	b=SR+2143n/ny/c1ljGZjDnEADm/Ip4JnzZKHEGegX2fSpQuWWcE1/kNzNUvhvIvpffUaami
	pQnV8KfkLGfnmwFF1tW7gB4vxoTu6M1GGF94HZMZeKWCvFMHdHksmJydcDHl7j7pLyw10t
	usmZaRSuxFMIGWqNTbACv75cFVGLQL0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732796935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZACMslqIaF7iVtmlx12c8LPoSlN7TzLegXngDuX2z78=;
	b=cOwjQFRm7P+aINT5HWTReOP+pshjo9eZAcXUOpvAh9WrdyyhGdMpRFFdHFwywvzdbbmt1x
	ZdkymhW31j/Vr/dzid0SboiqOEWMJs7Y+1CM2vY0BG1CUyvNkyloFYuNEfwtP78dw9Jxfn
	ykl+N0msIK4gu9aBfOnakww5HgWD5I8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-f8mpnbr7NQe9FcY5BPxRzg-1; Thu, 28 Nov 2024 07:28:53 -0500
X-MC-Unique: f8mpnbr7NQe9FcY5BPxRzg-1
X-Mimecast-MFC-AGG-ID: f8mpnbr7NQe9FcY5BPxRzg
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385d7611ad3so48545f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2024 04:28:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732796932; x=1733401732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZACMslqIaF7iVtmlx12c8LPoSlN7TzLegXngDuX2z78=;
        b=jsLp4ks1DPBKOl1RWIH8gm3MUW/B3ED9UN+8b1Wc+M9iNpDTtWn260BThpqn7d0sml
         kQPGVraleRDLyZsHPfBi3FtYVFPLrrTrdBSn4gLpAqp7cLZvgukBmoMn7+3eADGvl54A
         uD0wlcCt/DMyuzouBch/FcJBtINktrot9nbu8tqHMQo+iFk+x2gTlvSNrKtfjPPsZZlw
         eMfqW77P8pxuSvtCq/UtMh0Dl8q8lo5GllLi92NSd5fp8cXO5QeKdjDvyXEXT5nzHx+f
         esuqZ9o/FEEEOFsZL6cpPr+X5kKVlsrLg2sPI3lr4x/3yLWZ+q7b47XJI7hE9XOe6fz8
         AmPw==
X-Forwarded-Encrypted: i=1; AJvYcCUhLbDz3i1glfN/yP744vvpawLegx4c+ssmMsbNG9xaKl1FMtwBoqqqdr9MW3oE2ST/BCbssSNZoDIPCDI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxUlPyoftyol1cx3QUO9mXRM43iuzjsDcaXVEqsv5795vnsAP7F
	mKymeDe3r9ux6fFlY7aVaQg7GVLY/yALGAgsJ6oIFvur4Uwb9uXdVuooy5+cZfv4Mxag6QnbdHL
	FFSWm/cB8ZeTo12G60hwefdnDsv0QzvuqAW2k/mE5T/5tYxwVJEO9CKRmioVIwQS/RIjr9hwPQX
	pLgzYR09DkChXAE34X7ISqNOuOc67HJ7rHvaZA2A==
X-Gm-Gg: ASbGncuK/ARKD6JEb0HrGpLvSPdUgSORmQ8OqTNF6eb3kD3gaCiHpdktdymKE2ZSFxq
	Z8ut4mtQ5d6Zq7RpqRYif7IhxSSoZmAk=
X-Received: by 2002:a05:6000:18ac:b0:382:4a27:1319 with SMTP id ffacd0b85a97d-385c6eb5840mr5776158f8f.6.1732796932007;
        Thu, 28 Nov 2024 04:28:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGOqoP8tsZ6KQpRsoqtGa6KHF61EJ3NUmj3Aw3MlprtODTvHQ/TDY7uTpa3Nw0Vy2Is2RlK3QrcXMwzmVV8rU=
X-Received: by 2002:a05:6000:18ac:b0:382:4a27:1319 with SMTP id
 ffacd0b85a97d-385c6eb5840mr5776067f8f.6.1732796931576; Thu, 28 Nov 2024
 04:28:51 -0800 (PST)
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
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-18-911fb7595e79@linux.microsoft.com>
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-18-911fb7595e79@linux.microsoft.com>
From: Alex Markuze <amarkuze@redhat.com>
Date: Thu, 28 Nov 2024 14:28:40 +0200
Message-ID: <CAO8a2SgQ-==SjhDFZpi2s3r9FUGA96jwuJL7kTDwE=Hw4UcgUg@mail.gmail.com>
Subject: Re: [PATCH v2 18/21] ceph: Convert timeouts to secs_to_jiffies()
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>, 
	Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jack Wang <jinpu.wang@cloud.ionos.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Xiubo Li <xiubli@redhat.com>, 
	Ilya Dryomov <idryomov@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, 
	Christian Gmeiner <christian.gmeiner@gmail.com>, Louis Peens <louis.peens@corigine.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, netfilter-devel@vger.kernel.org, 
	coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cocci@inria.fr, linux-arm-kernel@lists.infradead.org, 
	linux-s390@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-scsi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-mm@kvack.org, linux-bluetooth@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	ceph-devel@vger.kernel.org, live-patching@vger.kernel.org, 
	linux-sound@vger.kernel.org, etnaviv@lists.freedesktop.org, 
	oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WVBN_VxdxPxGE65vnNuOSAclVIuaGfUygSj8mIQf104_1732796932
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

looks good

On Sat, Nov 16, 2024 at 12:32=E2=80=AFAM Easwar Hariharan
<eahariha@linux.microsoft.com> wrote:
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
>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>  fs/ceph/quota.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ceph/quota.c b/fs/ceph/quota.c
> index 06ee397e0c3a6172592e62dba95cd267cfff0db1..d90eda19bcc4618f98bfed833=
c10a6071cf2e2ac 100644
> --- a/fs/ceph/quota.c
> +++ b/fs/ceph/quota.c
> @@ -166,7 +166,7 @@ static struct inode *lookup_quotarealm_inode(struct c=
eph_mds_client *mdsc,
>         if (IS_ERR(in)) {
>                 doutc(cl, "Can't lookup inode %llx (err: %ld)\n", realm->=
ino,
>                       PTR_ERR(in));
> -               qri->timeout =3D jiffies + msecs_to_jiffies(60 * 1000); /=
* XXX */
> +               qri->timeout =3D jiffies + secs_to_jiffies(60); /* XXX */
>         } else {
>                 qri->timeout =3D 0;
>                 qri->inode =3D in;
>
> --
> 2.34.1
>
>


