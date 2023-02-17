Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B76969A7C2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 10:04:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ5V51dqTz3f8t
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 20:04:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KzdQ1giy;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KzdQ1giy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KzdQ1giy;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KzdQ1giy;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ5T56vXmz3ch6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 20:03:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676624615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BhPN5mXNi0FwgA6Dw1wLPbnc9UnJcdK55RqJoCtSbCM=;
	b=KzdQ1giy8S9nwHE5Csndl5Z1HY2OmJUtEbmK9ZR2FAevwkVGdQOlhdnYoCquXwzujELigL
	klfBrmqpWGJ7Og2XVN/+W6UbtjdMHJbM+cpUJP1TigAX9MCP+Da/JXnMq55daoFv+WqXYs
	ZcqbCa7AFwCa7qecPp+viw5isQzcMMQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676624615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BhPN5mXNi0FwgA6Dw1wLPbnc9UnJcdK55RqJoCtSbCM=;
	b=KzdQ1giy8S9nwHE5Csndl5Z1HY2OmJUtEbmK9ZR2FAevwkVGdQOlhdnYoCquXwzujELigL
	klfBrmqpWGJ7Og2XVN/+W6UbtjdMHJbM+cpUJP1TigAX9MCP+Da/JXnMq55daoFv+WqXYs
	ZcqbCa7AFwCa7qecPp+viw5isQzcMMQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-76-ethAvMISMb2_aYlUCZRA8A-1; Fri, 17 Feb 2023 04:03:34 -0500
X-MC-Unique: ethAvMISMb2_aYlUCZRA8A-1
Received: by mail-wm1-f69.google.com with SMTP id k2-20020a05600c1c8200b003dd41ad974bso338205wms.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 01:03:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BhPN5mXNi0FwgA6Dw1wLPbnc9UnJcdK55RqJoCtSbCM=;
        b=aEoCgVlzwqUxNR82zTi3zG3AbsmDzYz0lUtZ/qp7nyS/PehfRhPJdxuDp1U0k/hXS+
         5oLyTBnhBNTFDTmH7aMLI3eQe7B8TlZbGGlnwch7AGeLcJl5zVYPs97DHwxm2ZcDcbmM
         nkDXIom5tpFgKV+sbPD8j3Cnu80scfoDwxdif3ndLbVRgEuSG/W6nezHOOPQTzfv9SAo
         aBMnw2QPdIFCO7TWn6uP5YnRRv2b43jA/FbXyF9sfV74O5GVMA7ZqazyuwP/FYZ/GUtl
         J09OsJ80LSJI+m3D/G0N9jDEChhUpj31zJIff05lQnDpvpg9iBQA6tt7E+iNLuHmQGXt
         wW+w==
X-Gm-Message-State: AO0yUKULu14bn0uwUBLRJBZ4O/+cTjTIJLVUjU/SoJU7ZTYV1M5TOOC0
	YtnyhTXO5cWI6ICHQxIK4A7RYvxClKrKz2lX7yO9vFhEXj3BJQvpxwPwKzB9ESE8Lhjf814fQwb
	7xdbR455rgydty9y3f7XOnCqQJg==
X-Received: by 2002:a05:600c:43d5:b0:3e2:1d1e:78d0 with SMTP id f21-20020a05600c43d500b003e21d1e78d0mr2417370wmn.22.1676624612973;
        Fri, 17 Feb 2023 01:03:32 -0800 (PST)
X-Google-Smtp-Source: AK7set9DaCWKnN1w1UtSO4QwVrREcTxPmS1GlzqesHtTH8itx7pHTxCmH391IDvaQDCHi/hMWPC/XA==
X-Received: by 2002:a05:600c:43d5:b0:3e2:1d1e:78d0 with SMTP id f21-20020a05600c43d500b003e21d1e78d0mr2417345wmn.22.1676624612696;
        Fri, 17 Feb 2023 01:03:32 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bi23-20020a05600c3d9700b003e200d3b2d1sm4400599wmb.38.2023.02.17.01.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 01:03:32 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 10/11] drm: Include <video/cmdline.h> for mode parsing
In-Reply-To: <20230209135509.7786-11-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-11-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 10:03:31 +0100
Message-ID: <87k00gwtng.fsf@minerva.mail-host-address-is-not-set>
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

> Include <video/cmdline.h> in drm_connector.c to get video_get_options()
> and avoid the dependency on <linux/fb.h>. The replaced function
> fb_get_options() is just a tiny wrapper around video_get_opions(). No
> functional changes.
>
> Include <linux/property.h> to get fwnode_handle_put(), which had been
> provided via <linux/fb.h>.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

