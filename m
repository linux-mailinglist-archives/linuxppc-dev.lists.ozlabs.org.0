Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5142074D73D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 15:17:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NDekGdoV;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RJ16MDXS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R04L94ZRfz3cVq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 23:17:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NDekGdoV;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RJ16MDXS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=btissoir@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R044L103Vz3ccf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 23:05:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688994333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cSSXjKtHNo2g+s4fKQO8ycwZ9VSR9y5qDmg/kPz0J+8=;
	b=NDekGdoVFuvPxqBPm/p8URYHUEwrlee7pnACszE4CztEXS8QClMi+uhA/7W5iKi6rNAU7A
	ImwAW4o9H6riexZj7hlloOSE6AgNJcBLna4YcmqgtWhnM3Q8sxoa2otZsO/plrPDDIJjjv
	S03AAqBX54a0A6gBqFiIzhASVHqu3NQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688994334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cSSXjKtHNo2g+s4fKQO8ycwZ9VSR9y5qDmg/kPz0J+8=;
	b=RJ16MDXSd1BZ8NAFs0DdjNs37ZM5ac5i9pU9Iu2pYG9F+QD0ggiAX81paUX1TW3wHQnoxU
	wV3IZcNM9hCgYutflnSVLBkdHPBkx0apTw8VIxkgGq2v/F1vZen9Mf4KDpk7XGyuIjuu7o
	CFrPqCU/OlQQAAr7jg7n+5eZ+sPkEnU=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-Ot3Lv0nrN1GcG5uDSyj6Ig-1; Mon, 10 Jul 2023 09:05:32 -0400
X-MC-Unique: Ot3Lv0nrN1GcG5uDSyj6Ig-1
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-c0f35579901so5453175276.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 06:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688994331; x=1691586331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSSXjKtHNo2g+s4fKQO8ycwZ9VSR9y5qDmg/kPz0J+8=;
        b=Ft2dV5KCQwRIPYusj/tvPlLMyLeDKyKIgmpoB7cpvCxCfec3iweEMBtohIp9Nbk6Su
         ULHn23A8FrsSFmIYay6TgY3786+CJrClwQu/1rwlJEufcfg8RD+URdEgGXLne+P7Flge
         Yx3HquLVjTwtXWeFMWrb91lmKdgxouLVT9Ghq9YOcKjUnIe9j2g+vos12fM1BOXpFMIO
         Bqtk9nGi//3elebvE1TIOP1j8xTesMt6tKCOSm0xkAU2ZwgOCtLLidIpuGXrSVyK0bKA
         oqH9LjjyuCDc1tlFh5hccakma/7qJ6hQV3HMFDaeSvtuRhYSiaJBGt1Ogah8sWHZ5Xhh
         R7hA==
X-Gm-Message-State: ABy/qLYyrJ24u7oREU0C0jn+BJ3SX/U0WvMC48tLyD9I5/WGkU6Ln15o
	WFXGr6svh0wN6BOeYNFfng7yIgmS/OnlPuHV2C2Fw+XJt9DsTg7vPytWZBqCwuEtX7pkZKFPqig
	lswdmWX46dpDZ9OOq051lluvB/SxYVjHxbzj6INGf1A==
X-Received: by 2002:a25:1f02:0:b0:c67:8903:532b with SMTP id f2-20020a251f02000000b00c678903532bmr9557482ybf.44.1688994331592;
        Mon, 10 Jul 2023 06:05:31 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFYCDVRqXESu2lKlw5OOq57+bm9EWCrFUc3sqkdq7rbGFO3X2AFRnXejnh8LqRK8eFbanSG74Fa5+uKsOptTgw=
X-Received: by 2002:a25:1f02:0:b0:c67:8903:532b with SMTP id
 f2-20020a251f02000000b00c678903532bmr9557452ybf.44.1688994331376; Mon, 10 Jul
 2023 06:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230710130113.14563-1-tzimmermann@suse.de> <20230710130113.14563-11-tzimmermann@suse.de>
In-Reply-To: <20230710130113.14563-11-tzimmermann@suse.de>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Mon, 10 Jul 2023 15:05:19 +0200
Message-ID: <CAO-hwJLvBpNu1z4qM9+331-oUroh4g5HORL=EZS0nb+HHe+fdw@mail.gmail.com>
Subject: Re: [PATCH 10/17] hid/picolcd: Remove flag FBINFO_FLAG_DEFAULT from
 fbdev driver
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: linux-fbdev@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, deller@gmx.de, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, javierm@redhat.com, =?UTF-8?Q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>, dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-geode@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 10, 2023 at 3:01=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> The flag FBINFO_FLAG_DEFAULT is 0 and has no effect, as struct
> fbinfo.flags has been allocated to zero by framebuffer_alloc(). So do
> not set it.
>
> Flags should signal differences from the default values. After cleaning
> up all occurences of FBINFO_FLAG_DEFAULT, the token can be removed.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "Bruno Pr=C3=A9mont" <bonbons@linux-vserver.org>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Feel free to take this through the DRI tree (or any other that handles
FB) with the rest of the series if you want.

Cheers,
Benjamin

> ---
>  drivers/hid/hid-picolcd_fb.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
> index dabcd054dad9..d726aaafb146 100644
> --- a/drivers/hid/hid-picolcd_fb.c
> +++ b/drivers/hid/hid-picolcd_fb.c
> @@ -527,7 +527,6 @@ int picolcd_init_framebuffer(struct picolcd_data *dat=
a)
>         info->var =3D picolcdfb_var;
>         info->fix =3D picolcdfb_fix;
>         info->fix.smem_len   =3D PICOLCDFB_SIZE*8;
> -       info->flags =3D FBINFO_FLAG_DEFAULT;
>
>         fbdata =3D info->par;
>         spin_lock_init(&fbdata->lock);
> --
> 2.41.0
>

