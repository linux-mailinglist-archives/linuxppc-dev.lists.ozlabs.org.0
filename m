Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 845F5581409
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 15:18:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsctV2t98z3c6j
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 23:18:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HSfqyXYd;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YFYl8d6s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HSfqyXYd;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YFYl8d6s;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lscsm6cBJz3bb2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 23:18:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658841477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QZLeEqH10vqusPd0IzJaPflqD8TZSc6CiZ1X6z5OlBM=;
	b=HSfqyXYdHevA2+OgqBazOdPIgplEEwj7BSW5BDYRp8hLk5OzNH5dP2QKg0x20xh813Xlm0
	hAGJKhulx6tQAyIbhR1XEF+i1lSF7jB/3wrOar57IuhfhHwlmJGtX10h3c0rgFN6Zhhrki
	x/sHq0DpKH9AWmBTLQQkIflcgNa4c7I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658841478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QZLeEqH10vqusPd0IzJaPflqD8TZSc6CiZ1X6z5OlBM=;
	b=YFYl8d6sIosh4MPLHR1QR2G9y6F2BZ1n6lrfUcG1EkaApD6XRXGFk0GCLm1A9MnfGcnfFz
	JMyrDULA1hA+zgjoxnFTZFQHAlhqhPS35sLu1xOpar036QNyvwD1T9I0y8NIFiSMdYLIVq
	ANMvziV9AwKK9J8rlAMYU+YSu+lYgww=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-aIWFKQIjNlGPjWR1bgmUTg-1; Tue, 26 Jul 2022 09:17:56 -0400
X-MC-Unique: aIWFKQIjNlGPjWR1bgmUTg-1
Received: by mail-wm1-f69.google.com with SMTP id v18-20020a05600c215200b003a2fea66b7cso5400373wml.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 06:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QZLeEqH10vqusPd0IzJaPflqD8TZSc6CiZ1X6z5OlBM=;
        b=eegW1B8OZuRnbULOdFV9MeqR0jg1hfzRGLUyYl4R+dERAaMx9zRpNkBPE0DigPC8Eh
         qpducTx3t8TJx5YdVzXDYt00rjXFm5YJK7okHT70LA6GdbVCS991QJfZgj3W8fyMwGxv
         Mqa5m9EHwH9Q9kqmgq5IV2x/0e5t3kW2CjqipBDKlBeVJ0oRtXohXN+JCHaCoOxqfoyO
         m/ectMXdxZRwlKEmDN0KZsaGsvQ/OanLa0NFAM00GetSD8z+aR4uA0NPd1+AC0Fi7oNm
         Gn1oXPKhRoooLWWqJXPjMerK1Y4A8oAwgpNwOstCx2u1FJ9xADP9Y/BVBirJmj0pfT2v
         Nk3g==
X-Gm-Message-State: AJIora9mCAKExNUPolbRko895iqb+9MQiUtvo3fwKxEhsLItqVGNj7fO
	tB45v7GMyLCwECbAVLFhNuAes8VAUEBxLG00Ws4UJXJjUmwhhQ0BhkB2xuFK6AKVYN9u3v0HtII
	GjmnQODJ3PNZRMMUMNyTVeDwFMQ==
X-Received: by 2002:a5d:58c9:0:b0:21d:9374:1373 with SMTP id o9-20020a5d58c9000000b0021d93741373mr10809123wrf.20.1658841475081;
        Tue, 26 Jul 2022 06:17:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uwK0jaZriyb3HLzd94qTq2w3igX18xuKp7Xs7KKT1Eo3AyBh6uAmDSNtcGDrxJn9ORe+mJkw==
X-Received: by 2002:a5d:58c9:0:b0:21d:9374:1373 with SMTP id o9-20020a5d58c9000000b0021d93741373mr10809097wrf.20.1658841474813;
        Tue, 26 Jul 2022 06:17:54 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bg17-20020a05600c3c9100b003a04d19dab3sm3251267wmb.3.2022.07.26.06.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 06:17:54 -0700 (PDT)
Message-ID: <c08842d4-f01e-8d75-2b1d-01cf36b55a10@redhat.com>
Date: Tue, 26 Jul 2022 15:17:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 07/10] drm/ofdrm: Add ofdrm for Open Firmware
 framebuffers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-8-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220720142732.32041-8-tzimmermann@suse.de>
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

Hello Thomas,

On 7/20/22 16:27, Thomas Zimmermann wrote:
> Open Firmware provides basic display output via the 'display' node.
> DT platform code already provides a device that represents the node's
> framebuffer. Add a DRM driver for the device. The display mode and
> color format is pre-initialized by the system's firmware. Runtime
> modesetting via DRM is not possible. The display is useful during
> early boot stages or as error fallback.
> 

I'm not familiar with OF display but the driver looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

I just have a few questions below.

[...]

> +static int ofdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
> +						   struct drm_atomic_state *new_state)
> +{
> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
> +	struct drm_crtc_state *new_crtc_state;
> +	int ret;
> +
> +	if (!new_plane_state->fb)
> +		return 0;
> +
> +	new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_plane_state->crtc);
> +
> +	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
> +						  DRM_PLANE_HELPER_NO_SCALING,
> +						  DRM_PLANE_HELPER_NO_SCALING,
> +						  false, false);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

This seems to be exactly the same check than used in the simpledrm driver.
Maybe could be moved to the fwfb helper library too ?

[...]

> +
> +static void ofdrm_crtc_helper_atomic_disable(struct drm_crtc *crtc,
> +					     struct drm_atomic_state *old_state)
> +{
> +	/*
> +	 * Always enabled; disabling clears the screen in the
> +	 * primary plane's atomic_disable function.
> +	 */
> +}
> +

Same comment than for simpledrm, are these no-op helpers really needed ?

[...]

> +static const struct of_device_id ofdrm_of_match_display[] = {
> +	{ .compatible = "display", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, ofdrm_of_match_display);
> +

I don't see a binding for this in Documentation/devicetree/bindings/display.
Do we need one or it's that only required for FDT and not Open Firmware DT ?

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

