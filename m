Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F447EDEE0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 11:49:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I2TMjGzE;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I2TMjGzE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWGxk0PdGz3d8Y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 21:49:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I2TMjGzE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I2TMjGzE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWGwp624hz2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 21:48:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700131717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ypSMusxu7iqOH9G9Y+yTp1W0QKNM3WZxsK2UxHgzZ+c=;
	b=I2TMjGzEPO14TYUx+/Ldd7IdIpHXyNFMdZ3vp61S5zVzRjfzKsXk2l/4jHawjyHcpJC0CI
	8gOOoYfY02PwssLpxpF+gZjGuU7CFmbCe7tv5Xyda4WMziLHhuLJGe9W+Yv+4gTDMn5UNn
	22NJeIcUE0hV5IzzZt8TZPZUCOe7eTU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700131717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ypSMusxu7iqOH9G9Y+yTp1W0QKNM3WZxsK2UxHgzZ+c=;
	b=I2TMjGzEPO14TYUx+/Ldd7IdIpHXyNFMdZ3vp61S5zVzRjfzKsXk2l/4jHawjyHcpJC0CI
	8gOOoYfY02PwssLpxpF+gZjGuU7CFmbCe7tv5Xyda4WMziLHhuLJGe9W+Yv+4gTDMn5UNn
	22NJeIcUE0hV5IzzZt8TZPZUCOe7eTU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-07gm6Kz1NFSssGCauFBmvg-1; Thu, 16 Nov 2023 05:48:35 -0500
X-MC-Unique: 07gm6Kz1NFSssGCauFBmvg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-32de9f93148so332760f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 02:48:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700131714; x=1700736514;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ypSMusxu7iqOH9G9Y+yTp1W0QKNM3WZxsK2UxHgzZ+c=;
        b=XCZAjXbffwkIGpcBH9HOjjM0kPgjQPfcj9oZdeSbV8EAIpBiW3GmE+lR8nbXbSHgqE
         f9uwdNUkE1TmwOew07xiuIm3AfLRYYifbQLP1B2zlhfhuH82LyUhlHDDBR42nvtLvAgK
         9KI++oba44+fJxGEDduFkPV3r+hZNIep7EMhZolzHgHCgBd+OxhA8hZGwERQnfE0CX8n
         J2BB4Xqi28jNSrnbfukTN+v76VVfHV62UvrJWFkY0QEuNBobA/HQk1UNC8365Jlf7z+/
         tuK4Rs6uzOz2frIZ8RcA3xt6Dpq8u2NWqutykIgvhvD1ScWFJSsQ93GpLBIYLoDPOMPY
         XuvQ==
X-Gm-Message-State: AOJu0YyAUHfEr863ssMuzZ286GRwLDsyaAwgqM1Kgpv1ZEVjJfgnjvfT
	lBM9Xq0t/7xw6mc9itr0eoa8fILUdwcwXunr4E1mFMaFpkylxPyCbLxktg3kj0LPyrzwCOG8SZt
	/qn/9FsRWWIpB5DFL7NVCA26rjQ==
X-Received: by 2002:a5d:5984:0:b0:331:3cec:2165 with SMTP id n4-20020a5d5984000000b003313cec2165mr2007875wri.8.1700131714567;
        Thu, 16 Nov 2023 02:48:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7NsKKEAAjbY8zJdDPa65leIeCkC6dEdyIoSE7iJYMq/buhxbY80svcu2UXMWuNi65+e3tsw==
X-Received: by 2002:a5d:5984:0:b0:331:3cec:2165 with SMTP id n4-20020a5d5984000000b003313cec2165mr2007865wri.8.1700131714310;
        Thu, 16 Nov 2023 02:48:34 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id w7-20020adff9c7000000b0033130644c87sm13244575wrr.54.2023.11.16.02.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 02:48:34 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 18/32] fbdev/ps3fb: Set FBINFO_VIRTFB flag
In-Reply-To: <20231115102954.7102-19-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-19-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 11:48:33 +0100
Message-ID: <874jhm3rem.fsf@minerva.mail-host-address-is-not-set>
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

> The ps3fb driver operates on system memory. Mark the framebuffer
> accordingly. Helpers operating on the framebuffer memory will test
> for the presence of this flag.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  drivers/video/fbdev/ps3fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

