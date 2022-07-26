Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E84758144A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 15:37:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsdHs2FHRz3c63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 23:37:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eyQnV0Hg;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PHyae1vw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eyQnV0Hg;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PHyae1vw;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsdH60jSdz2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 23:36:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658842589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o2u/FwFPSYIYZn3XhpsCa5MLVVbvOOeOfOubBmW1ly8=;
	b=eyQnV0Hg5+QUCwYrbJh6lALe6t/h0lTOvR32S+2sHMuWil/a5gLkOmN7k4q2tsi7Y1sI8Z
	687EXx0ID4MoyAn3Hj4AdcbBV6tsu83cqR94T8zOuzwtQQqH3pU85KrFNDDVfPL8XcsJwO
	MpIVhk3KT1da4SmzDnaZmwy5kkhOV5I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658842590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o2u/FwFPSYIYZn3XhpsCa5MLVVbvOOeOfOubBmW1ly8=;
	b=PHyae1vwMTV+HVqMZmfwp/9tDN952dPhqF4Qn5tj5TgN2CgphwZ4S0tDSDEyTfsAVpBzel
	AM2/0eVXMTHNKgcxsybEfEsaDYNrI7kv1b9p5FkglrtNUgKIT/k7/TV5O/rg/669xIwGtq
	tw4Z+JUiXKpB2gHAhSK/itLoDYVpofU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-Imhv1uvZNIagMvNyDQQB2A-1; Tue, 26 Jul 2022 09:36:28 -0400
X-MC-Unique: Imhv1uvZNIagMvNyDQQB2A-1
Received: by mail-wm1-f72.google.com with SMTP id n30-20020a05600c501e00b003a3264465ebso686417wmr.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 06:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=o2u/FwFPSYIYZn3XhpsCa5MLVVbvOOeOfOubBmW1ly8=;
        b=eZF22YkCtj/iLQ/8hjCo1LEmQ5BifsijIqe2XFuBntCF+N3xrdGfRxHlt7BsaRPlDg
         QZR5wi0RjhH5o5wn1BCGq34zXSKc90EzePlIkRMbTX906RpiPjaDYh2k8XD3MmTkPAEH
         p2whzq8THZ00l9Fyfi7LuQ1ElB8f3X682H0ugkzQXZ/GGlOLyV68c0BJnHTN8nBZ2aBG
         VfO37g3/B49VyaIEkuBFU1jW+p3SphA/OiUsuJu+VGqumzMSeBu0CrmDpqwbOUaJIYEK
         f//6Xd/3bgCw/qaCUg/1ZNeHB3wcrI7dMUn98/SdqBfkrpoyeQwi5Mp5jpnDSAL4Ycn7
         WGdA==
X-Gm-Message-State: AJIora/1Xm4hUX/UnmKM4/mQGPnXUmCuw86z7WYpFEup/Ve3E+KlzNLY
	yNrriNlNi9WoYoWVYRR7Q4zUwTBY8FmdcPDcNRzwzqXSDN1dUkBEK/EbZJDDEYS+OeXnTbqGucO
	islSnyM18QoOU5iRVKnpoO5EfDQ==
X-Received: by 2002:a1c:e902:0:b0:3a0:2d95:49d4 with SMTP id q2-20020a1ce902000000b003a02d9549d4mr12603650wmc.189.1658842587587;
        Tue, 26 Jul 2022 06:36:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s+6AG/nzdOXc385y1ed+df7G89IH7y4dgdzREPE3h30Z3oCxeMhVdXILhe/dWGuohiWiGT+A==
X-Received: by 2002:a1c:e902:0:b0:3a0:2d95:49d4 with SMTP id q2-20020a1ce902000000b003a02d9549d4mr12603622wmc.189.1658842587119;
        Tue, 26 Jul 2022 06:36:27 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id h19-20020a1ccc13000000b003a326ba4e99sm16742676wmb.34.2022.07.26.06.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 06:36:26 -0700 (PDT)
Message-ID: <3fb4d471-2653-07a6-8fbd-f59da6c113e0@redhat.com>
Date: Tue, 26 Jul 2022 15:36:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 08/10] drm/ofdrm: Add CRTC state
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-9-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220720142732.32041-9-tzimmermann@suse.de>
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
> Add a dedicated CRTC state to ofdrm to later store information for
> palette updates.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tiny/ofdrm.c | 62 ++++++++++++++++++++++++++++++++++--
>  

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

[...]

> +static void ofdrm_crtc_reset(struct drm_crtc *crtc)
> +{
> +	struct ofdrm_crtc_state *ofdrm_crtc_state;
> +
> +	if (crtc->state) {
> +		ofdrm_crtc_state_destroy(to_ofdrm_crtc_state(crtc->state));
> +		crtc->state = NULL; /* must be set to NULL here */
> +	}
> +
> +	ofdrm_crtc_state = kzalloc(sizeof(*ofdrm_crtc_state), GFP_KERNEL);
> +	if (!ofdrm_crtc_state)
> +		return;
> +	__drm_atomic_helper_crtc_reset(crtc, &ofdrm_crtc_state->base);
> +}
> +

IMO this function is hard to read, I would instead write it as following:

static void ofdrm_crtc_reset(struct drm_crtc *crtc)
{
        struct ofdrm_crtc_state *ofdrm_crtc_state = kzalloc(sizeof(*ofdrm_crtc_state), GFP_KERNEL);

	if (!ofdrm_crtc_state)
		return;

        if (crtc->state) {
                ofdrm_crtc_state_destroy(to_ofdrm_crtc_state(crtc->state));
		crtc->state = NULL; /* must be set to NULL here */
	}

        __drm_atomic_helper_crtc_reset(crtc, &ofdrm_crtc_state->base);
}

Also with that form I think that the crtc->state = NULL could just be dropped ?

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

