Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5E252E444
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 07:18:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4FPr220Hz3bm1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 15:18:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C3u3QdFN;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C3u3QdFN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=C3u3QdFN; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=C3u3QdFN; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4FP63fxsz3bWm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 15:18:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653023894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AojK9fdDlk+robhCF8PY6mP/b2uer1ZGJkY3jjz44AE=;
 b=C3u3QdFNFOwJyMZRUsb/mBXYgz2bzyXfK7T9Rjn7YqnvSZ/OnfMYVI6qXGStYXezP5Af0S
 VR4CBwHn4Bt84jkCl2Lw94CShp9ldJeG1Q6FjrTN83kWIB7qGyi9r7DF3Ogy5LHzBvUkmN
 pEjQDS5dyCYTMrwwW+ST76yu7zgRCVk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653023894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AojK9fdDlk+robhCF8PY6mP/b2uer1ZGJkY3jjz44AE=;
 b=C3u3QdFNFOwJyMZRUsb/mBXYgz2bzyXfK7T9Rjn7YqnvSZ/OnfMYVI6qXGStYXezP5Af0S
 VR4CBwHn4Bt84jkCl2Lw94CShp9ldJeG1Q6FjrTN83kWIB7qGyi9r7DF3Ogy5LHzBvUkmN
 pEjQDS5dyCYTMrwwW+ST76yu7zgRCVk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-zj8ySGcAPuq6PDK6Mi-zbw-1; Fri, 20 May 2022 01:18:13 -0400
X-MC-Unique: zj8ySGcAPuq6PDK6Mi-zbw-1
Received: by mail-wr1-f71.google.com with SMTP id
 o13-20020adfa10d000000b0020c6fa5a77cso2202404wro.23
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 22:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AojK9fdDlk+robhCF8PY6mP/b2uer1ZGJkY3jjz44AE=;
 b=hVQ2eQZIi2vsK5+f7IQBzEyXwHVU9/Hb4ClSG+RV2/jALHCXGDBGdTLC+UcWsJjNKH
 3htGK4R1G/tXy4DxWiNFc7x7+y3T8Z4GXnpDKW56MVtoMGp416tOkLDF5GklvPeXpMf9
 OxaP812Vj7Y4GUZxcXu60XaGyMSWieTWrmSJU6NfeNrMuDAll+AQtDUVGiXT+8Gk8DXZ
 MCyTWmme8zpOBTv1mb+cOkRoL5FztnqqmLQeEkgh0m/CMKEDvf6kU8kpoFr/A1ilaSRY
 krlB2SmoOifrul0BVdosnprhrtABpLm+3rdbHF7iJqaRd+UjjzRDsICqF/vna/pgi7V3
 Oscg==
X-Gm-Message-State: AOAM531PlVPlzCUwdbMaj1ZggcaVTWmYb4W6BvFIjyKw81b9L5euHPP+
 H/IcRGbnb9Dv3ZxtUUCks1zCUhKv3uSARGHVqsTlKmNWqt8x8XuHmfsgr7/V+t2gTO952U37H9R
 1fZvqr7TjUEWaYUSPOED2KhMBLQ==
X-Received: by 2002:adf:fe42:0:b0:20d:297:f86e with SMTP id
 m2-20020adffe42000000b0020d0297f86emr6731317wrs.382.1653023891709; 
 Thu, 19 May 2022 22:18:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZXqQy9NPRkq8RsuzAXsi3g2v9mePIB4+gjaCXquJOoX1jBb5+EgH3gcFfRjFHtBJgLajfaw==
X-Received: by 2002:adf:fe42:0:b0:20d:297:f86e with SMTP id
 m2-20020adffe42000000b0020d0297f86emr6731295wrs.382.1653023891497; 
 Thu, 19 May 2022 22:18:11 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o9-20020adf8b89000000b0020d0351dbb6sm1345823wra.80.2022.05.19.22.18.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 22:18:11 -0700 (PDT)
Message-ID: <1f63406f-5160-462a-2e79-0938421057a9@redhat.com>
Date: Fri, 20 May 2022 07:18:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/2] MAINTAINERS: Broaden scope of simpledrm entry
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org
References: <20220518183006.14548-1-tzimmermann@suse.de>
 <20220518183006.14548-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220518183006.14548-2-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Thomas,

On 5/18/22 20:30, Thomas Zimmermann wrote:
> There will be more DRM drivers for firmware-provided framebuffers. Use
> the existing entry for simpledrm instead of adding a new one for each
> driver. Also add DRM's aperture helpers, which are part of the driver's
> infrastructure.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

I think you could push this without waiting for 2/2 to be ready.

>  MAINTAINERS | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5c1fd93d9050..43d833273ae9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6388,13 +6388,15 @@ S:	Orphan / Obsolete
>  F:	drivers/gpu/drm/savage/
>  F:	include/uapi/drm/savage_drm.h
>  
> -DRM DRIVER FOR SIMPLE FRAMEBUFFERS
> +DRM DRIVER FOR FIRMWARE FRAMEBUFFERS
>  M:	Thomas Zimmermann <tzimmermann@suse.de>
>  M:	Javier Martinez Canillas <javierm@redhat.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	drivers/gpu/drm/drm_aperture.c
>  F:	drivers/gpu/drm/tiny/simpledrm.c
> +F:	include/drm/drm_aperture.h

I wonder if we could add drivers/firmware/sysfb* as well, it certainly is
related since is the place where different platforms register the device.

But it's not in drivers/gpu, hence the question if we could include it 
(and possibly merge it through drm-misc as well, etc).

Dave, Daniel, what do you think ?

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

