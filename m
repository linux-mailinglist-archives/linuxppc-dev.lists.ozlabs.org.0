Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F2269A6BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 09:18:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ4TJ3JJYz3f8H
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 19:18:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ULmN6kPy;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ULmN6kPy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ULmN6kPy;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ULmN6kPy;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ4SK1f0tz3bhJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 19:17:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676621868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wtFVX3dHOB8+DY5YF2q7KTLFhIxjv3h/l+UG59nF41A=;
	b=ULmN6kPydkblpdnJdalDER3E6FhDqRWd0tw/UHqc7QZzQTfbHQDzKAa4qDCeO9oFSzWnkY
	oJlGdJryREyRClcn0o797DsQMVtTnhVwZUb1gFthJfwanl9XEZZkp2aV07KZTHNxsctqKP
	Ppg+lgjb3AWTRWAUN3tfVtca3SNSsQA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676621868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wtFVX3dHOB8+DY5YF2q7KTLFhIxjv3h/l+UG59nF41A=;
	b=ULmN6kPydkblpdnJdalDER3E6FhDqRWd0tw/UHqc7QZzQTfbHQDzKAa4qDCeO9oFSzWnkY
	oJlGdJryREyRClcn0o797DsQMVtTnhVwZUb1gFthJfwanl9XEZZkp2aV07KZTHNxsctqKP
	Ppg+lgjb3AWTRWAUN3tfVtca3SNSsQA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-481-vLD-phQSN4er3K5tCf9oXQ-1; Fri, 17 Feb 2023 03:17:45 -0500
X-MC-Unique: vLD-phQSN4er3K5tCf9oXQ-1
Received: by mail-wm1-f72.google.com with SMTP id l36-20020a05600c1d2400b003dfe4bae099so285793wms.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 00:17:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wtFVX3dHOB8+DY5YF2q7KTLFhIxjv3h/l+UG59nF41A=;
        b=PJRSrfjNMM9u5Rwv6VilJFy/Uul0tIpZJrsJV9HAxD+ji/dfvVdsqQLVTGwqqHsUWe
         JEmDvzOJD7klxuQFnoLcAJ8L45EPYEEIYiNmk0LT09NCzS0Ex262vESCVTIpB59FgdVG
         6GyU+LtR6UoRlrFaCHwiLcds4GNy1X3Hh8Cg/Gferily96Yg9iAdlJbkCWiHY2TRcY6e
         nDkc1f2f3jeKOqi+lUi2NmOq4X3FTkrexRcgaRJ4XKMJt8eriyyO5e20DM8tftB8M/yM
         azLbX9cSdTNUUbPUVOwq6Bx2nb70Ot21E8MZvRaA5R5kLvU4tE+XN3ZPqKw/CLSarGja
         Wvvw==
X-Gm-Message-State: AO0yUKU/vmXiCEdBfPa5ErwsCjso58p1AQwsfyy+oZu3BFDFQ5qj5cCw
	MYk0naDWPHhTs1wDbTmg65G/D7wuWFUDegnX61+SXfh/8mQbpE3nNdyimdVoTep24cf1180mgKg
	DqyY0ZeR2p8S3U0EqvNH2g4Ns6Q==
X-Received: by 2002:a05:600c:2ad6:b0:3df:eea8:1fe5 with SMTP id t22-20020a05600c2ad600b003dfeea81fe5mr137438wme.14.1676621864626;
        Fri, 17 Feb 2023 00:17:44 -0800 (PST)
X-Google-Smtp-Source: AK7set+v0I61y27bR+2XJ6an3+9nBMwpY84s+ynDtSH/Xq+FeMfX4cwaGQQ6iI5v0gNhFUVv3oSOjA==
X-Received: by 2002:a05:600c:2ad6:b0:3df:eea8:1fe5 with SMTP id t22-20020a05600c2ad600b003dfeea81fe5mr137410wme.14.1676621864243;
        Fri, 17 Feb 2023 00:17:44 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id x9-20020a05600c21c900b003e11ad0750csm4235812wmj.47.2023.02.17.00.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 00:17:43 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 01/11] fbdev: Fix contact info in fb_cmdline.c
In-Reply-To: <20230209135509.7786-2-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-2-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 09:17:42 +0100
Message-ID: <87edqoyac9.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Fix Daniel's email address. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

