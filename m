Return-Path: <linuxppc-dev+bounces-3687-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2BA9E0DF5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 22:36:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2HD93DN1z2xrb;
	Tue,  3 Dec 2024 08:36:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733174234;
	cv=none; b=U6tis49N7p8QgeHfH8mBy3PPtcPNgJP2xCo1kFDHGaV10Eea5VO8ZlEFeyCtyUEMJktIFwFBQjnWbqbhJRa7FCsZmGF1NxQWv06Oi040F/QKUBAixbWu0d7ZI7UkmobeQjRYUUmYtorVSNJBMlKZao2KRt5Sf+/ocZYkjiKrONVmUJqWUtoaUU2eEBkz4HIbUqLB8yJUO81LCTR6KmK1aZjUv6W4J4yPBc1aFbLyu1o1qEf/2/bvCrc4+DWhw2db+Rs61fq+Mlm8RZF0jOJGrXrMt5H2F3MkZ38UWcD+nGby0VcSr+QSgEliWh4lnNAx6IcjG8lJqtbVRPrKP/RB3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733174234; c=relaxed/relaxed;
	bh=FZHtDSci4mxW9uObrOpyGXF4tVtVRk+OAevn+2+RUUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fqSGif1yCwPH0ZO443jV4VTJoRqwTYYSqE5K/gUY3hWwbozaW5+xa4ZFB3IvX0xdINQVISsxF/jmegemag9umULwuyFEqImtQGMoxZ3D2Vk3OK5oLXQqSzsGDH6Lvikdlm7dH+89GhXj+lea4WwXTpq4ENEeAjxApJvF7P2+eTE5XXd3WSYobg26gr28OYlZylAksNCwy29Ps4qJow3kM97qVUZ/52mpaJ9hqY/w1hfBddJLJD6cUiKt0++Qw7dCQkNJZPHizVy0HSU39ON/LuUBdrowHyuALEa9XanOvaPXUOvfBbS+0YTXU1VtKk9Gs98OOrYjXbClth5n+9ZN7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fx4aToUh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=christian.gmeiner@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fx4aToUh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=christian.gmeiner@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2Gng6yK6z2xKd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 08:17:09 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7fccc26ad01so1428081a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Dec 2024 13:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733174225; x=1733779025; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FZHtDSci4mxW9uObrOpyGXF4tVtVRk+OAevn+2+RUUc=;
        b=Fx4aToUhDupcka3g9buufKA+Ca9PC5WrYdFeErFxjgqMMAlvhgpWIG30ZF894n90Ou
         2HJzXJjnj7I+I9Oz84A9yV7QOKDuG6Pxa8H3Ahm+kkG1jyLupNJaBWelfbEmaTOqLpEc
         D71AOYhpN/piQf1p4g2BRiYaxzLrxDu7ioy+SEgNcxET32Om20M6MhXZ0MPmcavjQUbc
         /M7iF8IiLX1BoVLhZ7eUdBrudqjcPDy/2RKuDDxurkOV3vAMZ89ZMQnrZX8MbEAb/RJ0
         u/qRlKsIgLmWcXccn1kMyElo/dtHAHd0ZPHfeNJKuYDxB30P6F+RESx0j0r0l5JSBpkK
         BB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733174225; x=1733779025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZHtDSci4mxW9uObrOpyGXF4tVtVRk+OAevn+2+RUUc=;
        b=ayhwefiQZbO72uHoRwrdMBLiS59UCU+y6RUZa0VnkFU9OLDOS8BJMqV9S1iTOr/XCR
         LlAWBhqWR80armlU8d9HdYJI3Z2LSGmhR2LQSvUk/2jBiVfgRu8MzbGUMeEACfyWezzR
         rWGxk4WDliM4g3axLVADZnPWXlW9auBys6hd9SnNPOAAV6vf4zga8/ImceqIedvBa6F5
         Dr0Wf6DqVqbHpG7uy9oYGfyqkDwMrDWQlMT/mhZ06FXtYPol9HZpA3gAGkr6Gpyth42y
         GD8+CIYyi3VlrRX+MzOMQfz1SAtiY7Bv/qXcKa94xoCEF1zlpYIAEE7HJokmJ7/oEgVX
         QX7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVaQTxFIf++zcXNtCr4iVBgwX8Qsen/uBKsMsSJnzN1CkUZRe9mcWt6PD6TQr3DFsUBIMKGvNc3pp6Fg1s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YylAonZvmIK7u2WI7ONZvxrmImMd3UV+H76QGZz6UK/7IlWKxpA
	F2WZOw38WCOAG74dIiR5ykACw0hTOI4GUZzgv9AS5/i2HQwVl5WOQQ77GuU+SW09I3Cn21d70Lu
	PQFyK5DGGxE0lBfJbi09QMSjGvS4=
X-Gm-Gg: ASbGncsQdy03mUKrjKYr0S8wMNPJZ+4TozDwm7HLc4zZhOu2RiOXBwPv5vA08YKtuiP
	viX5cDg3ks7dB/brhMTQYjVAT1352bQ==
X-Google-Smtp-Source: AGHT+IFDh1yb6d6zM40EzPJelJu2iVMH0WClLwmjysRWgfnYNSB8awfS5UuhO/EqqMc0eH1dffTLKgwFM99xaAmy4L8=
X-Received: by 2002:a17:90b:1c09:b0:2ee:3cc1:793a with SMTP id
 98e67ed59e1d1-2ef0124c720mr32029a91.29.1733174224966; Mon, 02 Dec 2024
 13:17:04 -0800 (PST)
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
 <20241115-converge-secs-to-jiffies-v2-9-911fb7595e79@linux.microsoft.com>
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-9-911fb7595e79@linux.microsoft.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 2 Dec 2024 22:16:53 +0100
Message-ID: <CAH9NwWdjXKH-AcKa-prwdqj2JqWLYVp1qM+0kxtQYSwo1J1c7g@mail.gmail.com>
Subject: Re: [PATCH v2 09/21] drm/etnaviv: Convert timeouts to secs_to_jiffies()
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
	Louis Peens <louis.peens@corigine.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, netfilter-devel@vger.kernel.org, 
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
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c b/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
> index 721d633aece9d4c81f0019e4c55884f26ee61c60..0f5a2c885d0ab7029c7248e15d6ea3c31823b782 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
> @@ -100,7 +100,7 @@ int etnaviv_cmdbuf_init(struct etnaviv_cmdbuf_suballoc *suballoc,
>                 mutex_unlock(&suballoc->lock);
>                 ret = wait_event_interruptible_timeout(suballoc->free_event,
>                                                        suballoc->free_space,
> -                                                      msecs_to_jiffies(10 * 1000));
> +                                                      secs_to_jiffies(10));
>                 if (!ret) {
>                         dev_err(suballoc->dev,
>                                 "Timeout waiting for cmdbuf space\n");
>
> --
> 2.34.1
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy

