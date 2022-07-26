Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D19581451
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 15:39:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsdLK16xrz3c4W
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 23:39:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RDOWtdst;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fnPNX4CC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RDOWtdst;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fnPNX4CC;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsdKd4XTvz3bd5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 23:38:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658842722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Adj4jrU1SP5osnWw1jwoXpRrBSvPiISvLrv57eggvs=;
	b=RDOWtdstZoZ5QI2vQ4r6lAtNgf1PnWf1hM0LhDm+hbEJwxCr/qS5CPsml6FpNNQ2/Eq7LQ
	DOk6WQaJF7BZcCu5l3hFBZinkBBPKTu2F2gHgswyx6qSdAflab2Wv8a4EOzYsaBslcu2SG
	3soNNh7tRd8gehutGJe2+fJDaygnRnE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658842723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Adj4jrU1SP5osnWw1jwoXpRrBSvPiISvLrv57eggvs=;
	b=fnPNX4CCj6+7S4r6/ULLOV79jQE4hmEflgZXvrthOvtecVNMs7jdVIJuSiL0m/SeEd7TPQ
	BujIcruOzIvnalDj4ZDSgAhBYeQ1EaV9LcqycHGs7DRUhwLOoINZI+B2duJkqr/bZPKDod
	Xx/m8God8+wDEnTukvfxZOJ5pl2of40=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-9bWMqnSONDKB7iY2egFo2Q-1; Tue, 26 Jul 2022 09:38:41 -0400
X-MC-Unique: 9bWMqnSONDKB7iY2egFo2Q-1
Received: by mail-wr1-f71.google.com with SMTP id c7-20020adfc6c7000000b0021db3d6961bso2138188wrh.23
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 06:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+Adj4jrU1SP5osnWw1jwoXpRrBSvPiISvLrv57eggvs=;
        b=LSuXGwEIT5exSGHJCm0qH5aO8mpkkC1FFG4ymD4ylNE+FWf1dx9M/Sr3HV5W10Q9/I
         rSByJHT7xZ2sSGOedCyoah0QLiNd47XXdMTnNYW7QsGCt4XRXLYNA0HDyo5C1i6Dusao
         ez2i4IuwYFbHc93R0HHhMWLzUhBLGmEJ8ymTfyYXwyRHuYCFgaCRF53qGHMQUMYim84m
         8D8YDB8POyqsxiQY/36Jr+FT5VWlYAcW4v7SQhpXIU5gnpau6rHdZyZRF5vBLwSDgPyo
         pGp5vTmFwCo+BY2dkwq2HvtnEN0kTdSaarnYUg3+YkcZnFfSVjqzSQ71Bp0L3QvT3Ezn
         JGzA==
X-Gm-Message-State: AJIora+XQYxSea4oMnJ11rwBbyOv7X1m6F/YPGxDh9JB4SrVD5Vh3g2l
	C7cSr2bG8CZpDcZ70y/NqibOd4v+s4h951y8uGkuBdawfnnCKMZ7ERFs2+/K6D7QBsq3hkiG0N+
	2r+JcHqJPSr12NtCHetVi66V88Q==
X-Received: by 2002:a05:6000:1541:b0:21d:b298:96be with SMTP id 1-20020a056000154100b0021db29896bemr10656797wry.206.1658842719914;
        Tue, 26 Jul 2022 06:38:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vn5gO3Bopg+51fzCZTQS+LUztnjj2PQ5ldn7oubUEVRSuljc6/I3CCwqkTlMx6jNch/xeE8g==
X-Received: by 2002:a05:6000:1541:b0:21d:b298:96be with SMTP id 1-20020a056000154100b0021db29896bemr10656771wry.206.1658842719436;
        Tue, 26 Jul 2022 06:38:39 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id 5-20020a05600c248500b003a3279b9037sm21045175wms.16.2022.07.26.06.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 06:38:39 -0700 (PDT)
Message-ID: <7b1a2807-59c7-d524-af8e-1ec634c740a7@redhat.com>
Date: Tue, 26 Jul 2022 15:38:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 09/10] drm/ofdrm: Add per-model device function
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-10-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220720142732.32041-10-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/20/22 16:27, Thomas Zimmermann wrote:
> Add a per-model device-function structure in preparation of adding
> color-management support. Detection of the individual models has been
> taken from fbdev's offb.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

[...]

> +static bool is_avivo(__be32 vendor, __be32 device)
> +{
> +	/* This will match most R5xx */
> +	return (vendor == 0x1002) &&
> +	       ((device >= 0x7100 && device < 0x7800) || (device >= 0x9400));
> +}

Maybe add some constant macros to not have these magic numbers ?

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

