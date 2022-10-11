Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A485FADAE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 09:47:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mmntb5Jlpz3dtD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 18:47:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GvCbj3aK;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GvCbj3aK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GvCbj3aK;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GvCbj3aK;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mmnsd2H6Gz2xfm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 18:46:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665474382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WSO31FFSWdoXBgwUfILs3D/eoN5/MJjkcgNLNdrIA0I=;
	b=GvCbj3aKFpdoOcxZWZfnbw8SR1LxGCLqZgbT4y34kpYxriXbBViwMU0Z5gd9eL7SL85HoX
	gSOjJAUZGyKyR9mvXZJ14uR1neH1/bY0wOaOfEjKlTxO/ApzBs/eb2w3oEoWUNusp7YGTI
	pEw7GJgcSVyVvbRW8X7WPEXV33td4ak=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665474382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WSO31FFSWdoXBgwUfILs3D/eoN5/MJjkcgNLNdrIA0I=;
	b=GvCbj3aKFpdoOcxZWZfnbw8SR1LxGCLqZgbT4y34kpYxriXbBViwMU0Z5gd9eL7SL85HoX
	gSOjJAUZGyKyR9mvXZJ14uR1neH1/bY0wOaOfEjKlTxO/ApzBs/eb2w3oEoWUNusp7YGTI
	pEw7GJgcSVyVvbRW8X7WPEXV33td4ak=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-601-HTqeiEBCOTCRtJ2qA0E6Tw-1; Tue, 11 Oct 2022 03:46:20 -0400
X-MC-Unique: HTqeiEBCOTCRtJ2qA0E6Tw-1
Received: by mail-wm1-f71.google.com with SMTP id 133-20020a1c028b000000b003c5e6b44ebaso3176164wmc.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 00:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WSO31FFSWdoXBgwUfILs3D/eoN5/MJjkcgNLNdrIA0I=;
        b=lh8+E9p7bLnAU0KYXCpKiC7ijxT+NKXeuhp2HS58qSnNLTitwtrSZC6A6fSIkHC6v2
         UUec6DEPwXRNVxSna5Ppg/K2L5Af6ZAifahpyHWY0CwoB8OhDN3CieTvJDL9UEujqBtu
         pyyrpq302YhFVLMBv/DfOwdtQtFxSVOZAYR9ZU5tz9v9Vd04MLy/cgPuEv7iHucjEcon
         LmJFEoJrUiY65Mvq0RSNoi5APb6sX7F19wK3hBBQ9H+npfZ5GOMcc0zrGhfnsOU3LzTI
         QNhhTFTnyGhrx/YNgfbzLelfnKGWWOATQwt7fMMg69DKw/UFpTk+MUuLeaHf3ciMGVe+
         E2SQ==
X-Gm-Message-State: ACrzQf1CVOAzK+dWgxlp0iTd5ji2wyHPSlCce8pubeRplxTfoNAJFPjp
	dOVG1QGbiy4x4svhBtu+44I61gJ7qvDL1DkRNwiP5JMrrn9IClPD9qcexPkWGJfs1h38tMZ0Qvx
	WEkmBXASbt8hMOgU+AFGAKMAUzg==
X-Received: by 2002:a05:6000:184c:b0:22f:edd8:821f with SMTP id c12-20020a056000184c00b0022fedd8821fmr7415912wri.363.1665474379402;
        Tue, 11 Oct 2022 00:46:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4dmWgqCGPFqZN8NPA8TsXuF3935TrGX3QAoadmbEV1e0/uHHFpUzYt1J3ZTNf2xQER2QOE6g==
X-Received: by 2002:a05:6000:184c:b0:22f:edd8:821f with SMTP id c12-20020a056000184c00b0022fedd8821fmr7415879wri.363.1665474379063;
        Tue, 11 Oct 2022 00:46:19 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bp15-20020a5d5a8f000000b0022cbf4cda62sm13716589wrb.27.2022.10.11.00.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 00:46:18 -0700 (PDT)
Message-ID: <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
Date: Tue, 11 Oct 2022 09:46:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220928105010.18880-6-tzimmermann@suse.de>
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

On 9/28/22 12:50, Thomas Zimmermann wrote:
> All DRM formats assume little-endian byte order. On big-endian systems,
> it is likely that the scanout buffer is in big endian as well. Update

You say it is likely, not always then? Does it depend on whether the Open
Firmware is BE or LE ?

[...]

> +static bool display_get_big_endian_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +	bool big_endian;
> +
> +#ifdef __BIG_ENDIAN
> +	big_endian = true;
> +	if (of_get_property(of_node, "little-endian", NULL))
> +		big_endian = false;
> +#else
> +	big_endian = false;
> +	if (of_get_property(of_node, "big-endian", NULL))
> +		big_endian = true;
> +#endif
> +
> +	return big_endian;
> +}
> +

Ah, I see. The heuristic then is whether the build is BE or LE or if the Device
Tree has an explicit node defining the endianess. The patch looks good to me:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

