Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D9F69A767
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 09:49:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ5924H9wz3f7V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 19:49:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K7eZbkge;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K7eZbkge;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K7eZbkge;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K7eZbkge;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ5853gT9z3cfl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 19:48:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676623731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2eU8yeckiOADs0SAPKaxGJh7w9R7c65Q/H5mdcfdOj4=;
	b=K7eZbkgeAu+2g/01x937ak6rezu/DcjNSqEV4MDGj/kHkgM+S9devOtuNBGaDMhC1+QOQk
	zGwkD4dMSfGS3dO0w4LrXk7lipDFgcqW1j1ur6ewNABcjvbPVo4EoIiYiRmhcR5jIko0mU
	fI1nNnFZTgIiSY+ezjkU2b4O/qtYa/k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676623731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2eU8yeckiOADs0SAPKaxGJh7w9R7c65Q/H5mdcfdOj4=;
	b=K7eZbkgeAu+2g/01x937ak6rezu/DcjNSqEV4MDGj/kHkgM+S9devOtuNBGaDMhC1+QOQk
	zGwkD4dMSfGS3dO0w4LrXk7lipDFgcqW1j1ur6ewNABcjvbPVo4EoIiYiRmhcR5jIko0mU
	fI1nNnFZTgIiSY+ezjkU2b4O/qtYa/k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-582-9RRpPEL1NOOGnsQTxqrfQg-1; Fri, 17 Feb 2023 03:48:49 -0500
X-MC-Unique: 9RRpPEL1NOOGnsQTxqrfQg-1
Received: by mail-wm1-f69.google.com with SMTP id o26-20020a05600c511a00b003dfeeaa8143so393012wms.6
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 00:48:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2eU8yeckiOADs0SAPKaxGJh7w9R7c65Q/H5mdcfdOj4=;
        b=4oW8jiqTHSROafri42z46YI/e36P5sf0ryp+jQxxY/FlD35ppupHITDHT/X7Bva46u
         ICXFvYc7Ma8DfxB4Br9GOW99FcYX8YN+6+oft9NhWVD6yfJ0rTsRflws/8H+wnNbgyGT
         yvnUpWz/k7WW92/VAH5XzlSd80TTgSFeXeygD/uwe0wDu50j1c1DS8KyohNsWsXDdhf/
         V4fCByGsy2BwT8TMSlA0cC7se4lrls7SUN9YTG+mrknGaxDuId6luO7uXCABAcsn2kPo
         1C+mkfyuKtKTINrtYIfhGWFOLtYJBneix38ENlWyczNE7hg1xahC4iYwFSv5SmDXjlTA
         3Qbw==
X-Gm-Message-State: AO0yUKV3fjGYXf2iNXVl8B+8lCmpEsdTh/SmailLULMrm2n4p1SKQMvT
	pI6C+VctvjImnduIOg7DHqbZ/EDs75HQWKqXJY0F9a2uatTQpxgzzCHKvQvK/uy8K51jgbou+FV
	1XNXdL6BOb3DnUsiU/oCbgpg11w==
X-Received: by 2002:a05:600c:3096:b0:3dc:5c86:12f3 with SMTP id g22-20020a05600c309600b003dc5c8612f3mr7917281wmn.1.1676623728600;
        Fri, 17 Feb 2023 00:48:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+a6F9dptY7bjjBAON9AHGK9gU+ghqAshRPH5VyjXN8kErI5tYZZJ197OpUlukUZMZdtlZ16Q==
X-Received: by 2002:a05:600c:3096:b0:3dc:5c86:12f3 with SMTP id g22-20020a05600c309600b003dc5c8612f3mr7917267wmn.1.1676623728342;
        Fri, 17 Feb 2023 00:48:48 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id hn30-20020a05600ca39e00b003db03725e86sm4300956wmb.8.2023.02.17.00.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 00:48:48 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 06/11] fbdev: Unexport fb_mode_option
In-Reply-To: <20230209135509.7786-7-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-7-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 09:48:47 +0100
Message-ID: <87v8k0wuc0.fsf@minerva.mail-host-address-is-not-set>
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

> There are no external users of fb_mode_option. Unexport the variable
> and declare it static.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

