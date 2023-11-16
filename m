Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CC87EDEFC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 11:54:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gjywyrj8;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gjywyrj8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWH3L2rtgz3cbL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 21:54:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gjywyrj8;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gjywyrj8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWH2S6Bvlz3bV7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 21:53:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700132013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tuX86pnoqOc9Lm4Xg+0oGA/Hd0KoSUsDWQB7iIHvV00=;
	b=gjywyrj8hvJx6px8JYsBAtgV4baarzZpYIaolmPmXdtyylTRTY3NY5NECgBfhJIQZ50CLG
	B1yHXaJwQDCwEW1Gi7ZCn3io9ewg8ek4eQU2VzwE62wAQwDxqSPhIW+d1i97iL/eQTw/y7
	JJKvHt7yGKG/uXTO7YfcoqXLXCoSNSc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700132013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tuX86pnoqOc9Lm4Xg+0oGA/Hd0KoSUsDWQB7iIHvV00=;
	b=gjywyrj8hvJx6px8JYsBAtgV4baarzZpYIaolmPmXdtyylTRTY3NY5NECgBfhJIQZ50CLG
	B1yHXaJwQDCwEW1Gi7ZCn3io9ewg8ek4eQU2VzwE62wAQwDxqSPhIW+d1i97iL/eQTw/y7
	JJKvHt7yGKG/uXTO7YfcoqXLXCoSNSc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-LhNu2eHTMqqTZoSbzWo8Fw-1; Thu, 16 Nov 2023 05:53:31 -0500
X-MC-Unique: LhNu2eHTMqqTZoSbzWo8Fw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-407d3e55927so3409385e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 02:53:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700132010; x=1700736810;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tuX86pnoqOc9Lm4Xg+0oGA/Hd0KoSUsDWQB7iIHvV00=;
        b=c7IUeApuG4EUi6D928T46AI4d/JGCXTx6ft5h+Lrcq9r8Csnt5kE80Yc5cWsA1a+In
         zdVn75errma6qBQmthrIBLEhvssAgJ6GHJUcl2hWLWEYBlk1VfWrZRoh36GQu+wcdzgr
         hussxvIZl2q2DXTnlJjY05mu4+sJtNsMt6Tt5mat9LmfQYXBcDi79PJBIaXK7qcXuWb4
         C66VSrkf0p3gZ95FIDyFC6rAL9wV+gDOqNxREmxk5+N8DHqNheOuDbxX64REJbVjTXeV
         R2NRoqpWaJinnrDb7f+JheeM4Eh/RxBBDgflylRku1NS6iK845BDvGOZuOaKsi3SMZuL
         s1uw==
X-Gm-Message-State: AOJu0Ywldn/pw5Su42pTnGoIcc/wiSE57oNSBbVEg4ATMVbmQMWklCe9
	u4u3YibIIIlZ9jvG6ZQetjZCzwtUW4oDmYQPNRmADTve2Td7HbWjIlkq9cLVwxvHUdd5MgQFJSK
	R4kgHxG3cac++jvFqIeyNhF8dXA==
X-Received: by 2002:a05:600c:524c:b0:3fd:2e89:31bd with SMTP id fc12-20020a05600c524c00b003fd2e8931bdmr1701740wmb.14.1700132010352;
        Thu, 16 Nov 2023 02:53:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxYqt6JEW+U1HNFI57UlEcmFdgsubjyvb53Do4Fx+Au2XkUvyLPoKV7okM0NVKFoXjgldOnw==
X-Received: by 2002:a05:600c:524c:b0:3fd:2e89:31bd with SMTP id fc12-20020a05600c524c00b003fd2e8931bdmr1701718wmb.14.1700132009917;
        Thu, 16 Nov 2023 02:53:29 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id s9-20020a05600c45c900b0040651505684sm3086548wmo.29.2023.11.16.02.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 02:53:29 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 19/32] fbdev/ps3fb: Initialize fb_ops with fbdev macros
In-Reply-To: <20231115102954.7102-20-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-20-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 11:53:29 +0100
Message-ID: <871qcq3r6e.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Nicholas Piggin <npiggin@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Initialize the instance of struct fb_ops with fbdev initializer
> macros for framebuffers in virtual address space. Set the read/write,
> draw and mmap callbacks to the correct implementation and avoid
> implicit defaults. Also select the necessary helpers in Kconfig.
>
> Fbdev drivers sometimes rely on the callbacks being NULL for a
> default I/O-memory-based implementation to be invoked; hence
> requiring the I/O helpers to be built in any case. Setting all
> callbacks in all drivers explicitly will allow to make the I/O
> helpers optional. This benefits systems that do not use these
> functions.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  drivers/video/fbdev/Kconfig | 5 +----
>  drivers/video/fbdev/ps3fb.c | 7 ++-----
>  2 files changed, 3 insertions(+), 9 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

