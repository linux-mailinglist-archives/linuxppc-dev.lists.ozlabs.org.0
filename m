Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EAF69A7BA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 10:02:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ5RR1q5wz3fDv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 20:02:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ehjb2094;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ehjb2094;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ehjb2094;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ehjb2094;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ5Pv50M7z3f7p
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 20:00:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676624448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B97UIS8ie9w9KzGcrCkLog9xnQRWw2knn3o4yQp4rpI=;
	b=Ehjb2094xhTOgt8TgC/jXo4imbipng3Y1uEDPKk2O1M/cyvj6rZpxhB7UTuycXGS6hP7NK
	44t3PTbMO5LyEQhdpi0r6f7Ohac1Ym2cJkGwK6lKDPui4lm7tY1AJihUPI0pxEB8MkQYqM
	y99hROoEVauDER9C9zidqrWRhh4z7co=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676624448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B97UIS8ie9w9KzGcrCkLog9xnQRWw2knn3o4yQp4rpI=;
	b=Ehjb2094xhTOgt8TgC/jXo4imbipng3Y1uEDPKk2O1M/cyvj6rZpxhB7UTuycXGS6hP7NK
	44t3PTbMO5LyEQhdpi0r6f7Ohac1Ym2cJkGwK6lKDPui4lm7tY1AJihUPI0pxEB8MkQYqM
	y99hROoEVauDER9C9zidqrWRhh4z7co=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-499-VjzX5C3RMSyT6p714td-dw-1; Fri, 17 Feb 2023 04:00:46 -0500
X-MC-Unique: VjzX5C3RMSyT6p714td-dw-1
Received: by mail-wr1-f72.google.com with SMTP id ay22-20020a5d6f16000000b002bde0366b11so38447wrb.7
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 01:00:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B97UIS8ie9w9KzGcrCkLog9xnQRWw2knn3o4yQp4rpI=;
        b=jxFLbI8kF36NAyJvu7BRhJWGRbBl8IX8IZnYrGrFWYEtO1qZhWqeWvdzAmN6QZnt/C
         BIrCDj9GP6vJEimLMJJjyJ4iD6ablIC7kt2wNcgXEBIVomWn0HCMgfdfRnj9VC2hvZX4
         Tu6MgbRlFq2fykbBjMgRkzuF/krxFDHFfqv+z/rSNXyLztcpsIXMTFQTS8us/eQTFiBo
         ZzjZcvTGC6I+JG1Lh5D6Mx/Tj312r8gX6gTKTVFgpgEmTnIhdL5JF7S13eKTQ7m+7ZQ7
         JxckODoi1NGpZHAebGUEeVO9CvzpTiGcRA6SQnou6q8G4ZrYXJ28IEdTgG4maZNaVJPK
         5uXQ==
X-Gm-Message-State: AO0yUKX7qQlTzGWY+3RVfiCvemzlI0L4jfM+ven5hRjJP8qpPNXeMRuB
	oI1ZBEgEGSJNyXHmwsN4B3pfcTak81UMkvGllSNxKfx2ZOvEt7eQBS5xVC3vALSYh4qINPPX+xG
	08AbZIvf2xHG+rH+f1NHGu3cMJg==
X-Received: by 2002:a5d:5144:0:b0:2c5:5d1d:b244 with SMTP id u4-20020a5d5144000000b002c55d1db244mr7050964wrt.29.1676624445658;
        Fri, 17 Feb 2023 01:00:45 -0800 (PST)
X-Google-Smtp-Source: AK7set+GAEaS+cnDn75pZnbKNpaEwNXZM1nwMs4PYXOVZhHBD2pvwDjNBKmLaq3OkX/jJUVj+CLJgg==
X-Received: by 2002:a5d:5144:0:b0:2c5:5d1d:b244 with SMTP id u4-20020a5d5144000000b002c55d1db244mr7050941wrt.29.1676624445403;
        Fri, 17 Feb 2023 01:00:45 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f18-20020adff592000000b002c592535838sm3149086wro.2.2023.02.17.01.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 01:00:44 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 08/11] fbdev: Handle video= parameter in video/cmdline.c
In-Reply-To: <20230209135509.7786-9-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-9-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 10:00:43 +0100
Message-ID: <87pma8wts4.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Handle the command-line parameter video= in video/cmdline.c. Implement
> the fbdev helper fb_get_options() on top. Will allows to handle the
> kernel parameter in DRM without fbdev dependencies.
>
> Note that __video_get_options() has the meaning of its return value
> inverted compared to fb_get_options(). The new helper returns true if
> the adapter has been enabled, and false otherwise.
>
> There is the ofonly parameter, which disables output for non-OF-based
> framebuffers. It is only for offb and looks like a workaround. The actual
> purpose it not clear to me. Use 'video=off' or 'nomodeset' instead.
>

s/it/is

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[..]

> +#include <linux/fb.h> /* for FB_MAX */

I believe including <uapi/linux/fb.h> is enough here.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

