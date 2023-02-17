Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F9169A7BE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 10:03:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ5SS6YVJz3fR9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 20:03:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BdhqJcfP;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BdhqJcfP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BdhqJcfP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BdhqJcfP;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ5RH4Ltmz3fQW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 20:02:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676624520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iX/V/ayuIBSrZtIRFg5DW3vDK9omTeaZk0P2mOKN4MI=;
	b=BdhqJcfPgC7yWniv9ziCtMP6Tfj5YIUIAYdf5puk1cwLyFwuTybhjDTZh+2krbjTLXNRIp
	ewinoURtbCG+ofQwN+x3tSLiufNKcGnOF08OVa/jLRGDFrfbRYLz4QRaf/HNavNp4cxmvi
	UWCmFBBW5uFsSl7SbBKToKRxw7AAhlE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676624520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iX/V/ayuIBSrZtIRFg5DW3vDK9omTeaZk0P2mOKN4MI=;
	b=BdhqJcfPgC7yWniv9ziCtMP6Tfj5YIUIAYdf5puk1cwLyFwuTybhjDTZh+2krbjTLXNRIp
	ewinoURtbCG+ofQwN+x3tSLiufNKcGnOF08OVa/jLRGDFrfbRYLz4QRaf/HNavNp4cxmvi
	UWCmFBBW5uFsSl7SbBKToKRxw7AAhlE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-414-W3ex0PI3OuS_n26mZGTGyw-1; Fri, 17 Feb 2023 04:01:56 -0500
X-MC-Unique: W3ex0PI3OuS_n26mZGTGyw-1
Received: by mail-wm1-f70.google.com with SMTP id j10-20020a05600c1c0a00b003e000facbb1so310079wms.9
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 01:01:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iX/V/ayuIBSrZtIRFg5DW3vDK9omTeaZk0P2mOKN4MI=;
        b=ZcW2qlQFaJp0L17najTdj21xwVdlUEbiTgLgphoTUQzqfg6Gk2tx08HqbhiBip1+8l
         jIyGP4OGlpdbu4DgDMDXIxoz4HPb6d4X1qWCwhDLFwBB/U8cw3sExO4r8wDNVyVXvSDH
         qCqXcgPpzMEbCtDUstjs5DL5xA9hBZyepru8dOIDtvBGbxEsD4FRcG7ooK0oqRs7jaZX
         XZ+MA6Xik4ljttEjXVnbIOjRNnUuF6PfAQip58VtyXWge4S/IWNBSxdel3uQIo1+4Wda
         A5Wxe8QsRxhH2M05A3akMqZvae6oWeKtWQpQUO3MAi32vshlABVDdtNf18mDdVqE3VLX
         wBiQ==
X-Gm-Message-State: AO0yUKW5vFZDg82ZVuK/YOeZtpv/2bamuomW0GqvmIJRjsfv59c4WIir
	Uydkpu53Tw24YUpOdOIRI0l9jYJipN7m2/rr8i6Ug7j5VKcv8sfRYE9DEGHbKfi85Ldehdd1JXA
	hCOoRC9agtoLd2fkLX/F/ix6s+w==
X-Received: by 2002:a05:600c:1656:b0:3e0:c75:7071 with SMTP id o22-20020a05600c165600b003e00c757071mr607297wmn.5.1676624515354;
        Fri, 17 Feb 2023 01:01:55 -0800 (PST)
X-Google-Smtp-Source: AK7set/6LO81+kz9vV6QLUhodmDEJr26PzK9QZHVy10kd0C6ka1mmiRMz10jyhAUjwG0w24sNhK/BQ==
X-Received: by 2002:a05:600c:1656:b0:3e0:c75:7071 with SMTP id o22-20020a05600c165600b003e00c757071mr607280wmn.5.1676624515102;
        Fri, 17 Feb 2023 01:01:55 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id c190-20020a1c35c7000000b003e21558ee9dsm3933693wma.2.2023.02.17.01.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 01:01:54 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 09/11] driver/ps3: Include <video/cmdline.h> for mode
 parsing
In-Reply-To: <20230209135509.7786-10-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-10-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 10:01:53 +0100
Message-ID: <87mt5cwtq6.fsf@minerva.mail-host-address-is-not-set>
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

> Include <video/cmdline.h> in ps3av.c to get video_get_options() and
> avoid the dependency on <linux/fb.h>. The replaced function
> fb_get_options() is just a tiny wrapper around video_get_opions(). No
> functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

