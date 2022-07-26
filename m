Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0B658147E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 15:50:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsdZf5xJrz3c42
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 23:50:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RIJKrKbO;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RIJKrKbO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RIJKrKbO;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RIJKrKbO;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsdZ05z35z2xkb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 23:49:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658843365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yx+6GZt1MNJVcGz7GTKwesVhWHXoxflnw9Q7t0FYoHA=;
	b=RIJKrKbOcPKEmzHrB0+llonv03A9LXiZvbdBJNS60d0m190iuYHH5zjIq8xjRD9/fylott
	2uMgrQviMT5wqVLN+YaOQoqa2jCJTVubvhd9Y1qKe2n/oSu2aboAN0NLxqtThhZodeq7WX
	ax/DrGJzPOD85c/wrjaf2REKsnSfkA8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658843365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yx+6GZt1MNJVcGz7GTKwesVhWHXoxflnw9Q7t0FYoHA=;
	b=RIJKrKbOcPKEmzHrB0+llonv03A9LXiZvbdBJNS60d0m190iuYHH5zjIq8xjRD9/fylott
	2uMgrQviMT5wqVLN+YaOQoqa2jCJTVubvhd9Y1qKe2n/oSu2aboAN0NLxqtThhZodeq7WX
	ax/DrGJzPOD85c/wrjaf2REKsnSfkA8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-rWDspRI1PdyvWBPQuEQS1g-1; Tue, 26 Jul 2022 09:49:24 -0400
X-MC-Unique: rWDspRI1PdyvWBPQuEQS1g-1
Received: by mail-wr1-f72.google.com with SMTP id t13-20020adfe10d000000b0021bae3def1eso2119973wrz.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 06:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Yx+6GZt1MNJVcGz7GTKwesVhWHXoxflnw9Q7t0FYoHA=;
        b=Ls6vHQtBRKci3soYWQkluIoaK+25Fh+To9Qmb6qovxBL3eXOL62VTvzombpGAmWear
         iIv6fjl3eyeunnelntWSYPsqVPalg0Ki6rRhBE9k5cTx23fx8rTGgBUrMvLEgx1birRx
         7JDKQ5lO23YMRmbBnY88AsOX/YHu56mFjf0FfOJ5qTaRX+drLonYkNfWw2eevMwjh96v
         syKI2kj3LEH8NP6ypYE1HTSAHaSuArM7YwXuUx9LEqZCiz0D82bJYxBIZehWTUVY/GsC
         SoR5tJpsTFzlth1vPgs5bIO/Wkiweho2MgjhB/wIGbrDQ6mkXfc8LKWTOM2pDuJuog4N
         xD5Q==
X-Gm-Message-State: AJIora+NOMJrZFAVd8rxYvkX6mtY/CFPlxT+c7S6WWe7zs0ut8IcyKo+
	VOZooJNqxJUsCBxZHKQbHiZRQXyh9FI61SAjVh7qU7PPi7HP2IR74dJ0NKCalRalDqeN+Ona1Mq
	BishxlU4w+lU968AatJBqqeYtMQ==
X-Received: by 2002:adf:e19b:0:b0:21e:4bb9:9a14 with SMTP id az27-20020adfe19b000000b0021e4bb99a14mr11108330wrb.354.1658843363204;
        Tue, 26 Jul 2022 06:49:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t08UKa6vLvAxqYUWQY3Aj3EC9x4jPF2Jb9qsrCmz2vWnABUqOa3+dDEQyXjEVoWWkYL7yAlA==
X-Received: by 2002:adf:e19b:0:b0:21e:4bb9:9a14 with SMTP id az27-20020adfe19b000000b0021e4bb99a14mr11108315wrb.354.1658843362891;
        Tue, 26 Jul 2022 06:49:22 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id u16-20020a05600c00d000b003a31c4f6f74sm25502543wmm.32.2022.07.26.06.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 06:49:22 -0700 (PDT)
Message-ID: <abe3fa95-942b-6d2f-7167-83d0cea59444@redhat.com>
Date: Tue, 26 Jul 2022 15:49:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 10/10] drm/ofdrm: Support color management
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-11-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220720142732.32041-11-tzimmermann@suse.de>
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
> Support the CRTC's color-management property and implement each model's
> palette support.
> 
> The OF hardware has different methods of setting the palette. The
> respective code has been taken from fbdev's offb and refactored into
> per-model device functions. The device functions integrate this
> functionality into the overall modesetting.
> 
> As palette handling is a CRTC property that depends on the primary
> plane's color format, the plane's atomic_check helper now updates the
> format field in ofdrm's custom CRTC state. The CRTC's atomic_flush
> helper updates the palette for the format as needed.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

[...]

> +static void __iomem *ofdrm_mach64_cmap_ioremap(struct ofdrm_device *odev,
> +					       struct device_node *of_node,
> +					       u64 fb_base)
> +{
> +	struct drm_device *dev = &odev->dev;
> +	u64 address;
> +	void __iomem *cmap_base;
> +
> +	address = fb_base & 0xff000000ul;
> +	address += 0x7ff000;
> +

It would be good to know where these addresses are coming from. Maybe some
constant macros or a comment ? Same for the other places where addresses
and offsets are used.

[...]

>  static struct ofdrm_crtc_state *to_ofdrm_crtc_state(struct drm_crtc_state *base)
> @@ -376,10 +735,12 @@ static int ofdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
>  						   struct drm_atomic_state *new_state)
>  {
>  	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
> +	struct drm_framebuffer *new_fb = new_plane_state->fb;
>  	struct drm_crtc_state *new_crtc_state;
> +	struct ofdrm_crtc_state *new_ofdrm_crtc_state;
>  	int ret;
>  
> -	if (!new_plane_state->fb)
> +	if (!new_fb)
>  		return 0;
>  
>  	new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_plane_state->crtc);
> @@ -391,6 +752,14 @@ static int ofdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
>  	if (ret)
>  		return ret;
>  
> +	if (!new_plane_state->visible)
> +		return 0;
> +
> +	new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_plane_state->crtc);
> +
> +	new_ofdrm_crtc_state = to_ofdrm_crtc_state(new_crtc_state);
> +	new_ofdrm_crtc_state->format = new_fb->format;
> +

Ah, I understand now why you didn't factor out the .atomic_check callbacks
for the two drivers in a fwfb helper. Maybe you can also add a comment to
mention that this updates the format so the CRTC palette can be applied in
the .atomic_flush callback ?

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

