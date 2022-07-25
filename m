Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0394258022C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 17:47:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ls4DN6T1wz3cj5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 01:47:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QLlTi3+7;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QLlTi3+7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QLlTi3+7;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QLlTi3+7;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls4Cg1vXlz3bmD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 01:46:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658763996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZJ885KKzcUvf1e2EVl4lSKhnhoxNx06B5g4T95NscQU=;
	b=QLlTi3+7VQ8ttDQ+z/lEH46mQLREKPXKjdbuOXDlwL00BoY7FbexOw7tfIPaev70CToVlX
	SJpaFbwnWYonm7PI24VszSpPZwSp+cjDP51Xvwa32DwXk5/tasERcWZIdrID5cEBObbJf/
	byIKxQT9WUj+Twz7EmxThDqG+vRDMf4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658763996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZJ885KKzcUvf1e2EVl4lSKhnhoxNx06B5g4T95NscQU=;
	b=QLlTi3+7VQ8ttDQ+z/lEH46mQLREKPXKjdbuOXDlwL00BoY7FbexOw7tfIPaev70CToVlX
	SJpaFbwnWYonm7PI24VszSpPZwSp+cjDP51Xvwa32DwXk5/tasERcWZIdrID5cEBObbJf/
	byIKxQT9WUj+Twz7EmxThDqG+vRDMf4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-pY5-VUGRMB60z653BKlSNw-1; Mon, 25 Jul 2022 11:46:35 -0400
X-MC-Unique: pY5-VUGRMB60z653BKlSNw-1
Received: by mail-wm1-f70.google.com with SMTP id v132-20020a1cac8a000000b003a34081050bso5411987wme.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 08:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZJ885KKzcUvf1e2EVl4lSKhnhoxNx06B5g4T95NscQU=;
        b=1kIla4cT9d5T/PRfXnLjwVaDL0Yc1m9csPI/B4sBGKOK6pi+ZvOTzRhvWHJqmH0K3R
         gelX1UGS4Bri/QtJbeSPHyT+pL9a11pub+7uYHikkW9IjF735xs2TKzfgqzf27gkEoq0
         0gTQPTJ7zvOLrwBEiU7konu1Eny8cPCZ9U8MBo8HqUmAHO2J7sEiyD+i5Bokqmond0rr
         oHXdl4jzcBP/LFZsj0YUtiapQf0t7Eaht9wL/TzCa7/lSwHPRN038Pz2qARlWVRO/lpj
         0dC8j4I4DRVOo5nuLwDZSItfpSdLJlHcY6Yo3Z5XJ4ZibMTDhGoDdEYyhgxcEUrgHliE
         G/zA==
X-Gm-Message-State: AJIora/1aOJ0vrvEWSvPXXk7WYo7zzlDWPR83lggwHpLP6bGln+5E9GZ
	JvY4NU/PRpHfzgBMCf4BUtWvjLbLvhhYN1ATnyunKpsxkaZOG4q/vJy42/S6BlES+HfBnTPNI0y
	/H+w38ObCdrsq7nMq/rOa0gvIeg==
X-Received: by 2002:a05:6000:79b:b0:21e:9709:2c28 with SMTP id bu27-20020a056000079b00b0021e97092c28mr1207789wrb.539.1658763993863;
        Mon, 25 Jul 2022 08:46:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sef1GCaKVbSp+vxG6KoAAfgr161OZAbpd5DTP5j+7q2VRX59IcIlySPt3xxwReMmx+Yu5DCg==
X-Received: by 2002:a05:6000:79b:b0:21e:9709:2c28 with SMTP id bu27-20020a056000079b00b0021e97092c28mr1207777wrb.539.1658763993587;
        Mon, 25 Jul 2022 08:46:33 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id e13-20020a5d65cd000000b0021e47386eb8sm12290743wrw.2.2022.07.25.08.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 08:46:33 -0700 (PDT)
Message-ID: <3d2de29a-2a96-867d-907f-6b85573586ab@redhat.com>
Date: Mon, 25 Jul 2022 17:46:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 05/10] drm/simpledrm: Convert to atomic helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-6-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220720142732.32041-6-tzimmermann@suse.de>
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
> Replace the simple-KMS helpers with the regular atomic helpers. The
> regular helpers are better architectured and therefore allow for easier
> code sharing among drivers. No functional changes.
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

But I've a question below...
 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tiny/simpledrm.c | 283 ++++++++++++++++++++-----------
>  1 file changed, 180 insertions(+), 103 deletions(-)

[...]

> +static void simpledrm_crtc_helper_atomic_enable(struct drm_crtc *crtc,
> +						struct drm_atomic_state *old_state)
> +{
> +	/*
> +	 * Always enabled; screen updates are performed by
> +	 * the primary plane's atomic_update function.
> +	 */
> +}
> +
> +static void simpledrm_crtc_helper_atomic_disable(struct drm_crtc *crtc,
> +						 struct drm_atomic_state *old_state)
> +{
> +	/*
> +	 * Always enabled; disabling clears the screen in the
> +	 * primary plane's atomic_disable function.
> +	 */
> +}

...do we really need to have these ? Can't we just not set them ?

> +
> +static const struct drm_crtc_helper_funcs simpledrm_crtc_helper_funcs = {
> +	.mode_valid = simpledrm_crtc_helper_mode_valid,
> +	.atomic_check = simpledrm_crtc_helper_atomic_check,
> +	.atomic_enable = simpledrm_crtc_helper_atomic_enable,
> +	.atomic_disable = simpledrm_crtc_helper_atomic_disable,
> +};
> +
looking at https://elixir.bootlin.com/linux/latest/source/include/drm/drm_modeset_helper_vtables.h#L703
that says the .atomic_{en,dis}able handlers are optional.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

