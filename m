Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFFF58029A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 18:24:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ls53S159mz3cC4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 02:24:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y8q3YJcG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y8q3YJcG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y8q3YJcG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y8q3YJcG;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls52N205Jz3c2h
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 02:23:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658766216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmfeEstC7MzRi4GsM10cgjXuSOhlEtm6GXZ2w8tMu/Q=;
	b=Y8q3YJcGGJHjvcK4Hf1vkUpjhxV92kn0kxi/Y+FyDKbvyuzFknOSgAvFwRJyV3Dx98gaV2
	cqd74VMXZmpESCv4kDFcdxdvVMnGQxmXScfVMNSYEa96YiCGS4BxWbor5BpAkmLstwlnd1
	iJgY0UWt6lpla2bnkvRtBQ3oVSAExHI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658766216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmfeEstC7MzRi4GsM10cgjXuSOhlEtm6GXZ2w8tMu/Q=;
	b=Y8q3YJcGGJHjvcK4Hf1vkUpjhxV92kn0kxi/Y+FyDKbvyuzFknOSgAvFwRJyV3Dx98gaV2
	cqd74VMXZmpESCv4kDFcdxdvVMnGQxmXScfVMNSYEa96YiCGS4BxWbor5BpAkmLstwlnd1
	iJgY0UWt6lpla2bnkvRtBQ3oVSAExHI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-FKUH3BnmMCiZxKVUrO4y8A-1; Mon, 25 Jul 2022 12:23:33 -0400
X-MC-Unique: FKUH3BnmMCiZxKVUrO4y8A-1
Received: by mail-wm1-f70.google.com with SMTP id h65-20020a1c2144000000b003a30cae106cso8907165wmh.8
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 09:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZmfeEstC7MzRi4GsM10cgjXuSOhlEtm6GXZ2w8tMu/Q=;
        b=W2JiQWows7bb4Im0SHcpchjMUlkgB/iCllCG2rK1e4TJ1dZfkAbQt8hq2dyObYanZa
         Ym5/o1ozWpPT99HTWtO4Xzb9lklQMhjah9BTEJRFJ9MpMrKYz0t5tWZ1KjIz+pP2LbHj
         sEYNtZaz0tGvno+y1tG4zwtaPEWEo2PMuZnOH8lw5cN6umM3jPkch3pdNDtyru4IJiuK
         Q6CTiqGPDPTtNVe9LTwKFPDUfkWgh3FKHe7Y01+6jimcixPvtXIFi+zwuTp4YibpNtKU
         k37HKI4XpBnPq93059gYKRViGxWMWndiWItg6HrfH8KwSJPXlNb80ds90Rz59Qkq99TK
         Yopg==
X-Gm-Message-State: AJIora9P34yHdJddEmSB/+7rFLsyss2adcvc8ufJbkkWZN024vCgoSsZ
	i80GqHXzAhjxKFLbo7VBVZsdftbcF2T7W2EKq6vqys6VvoI1a3frLNCOyIjsLIMsiwnEk70WW2C
	ErXpIJIBQJOz+GmNkKelvo5HvHA==
X-Received: by 2002:a5d:64e5:0:b0:21d:945a:e7c4 with SMTP id g5-20020a5d64e5000000b0021d945ae7c4mr8441266wri.0.1658766212174;
        Mon, 25 Jul 2022 09:23:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tptHt0Y0I7YhJpqW280Dm+5gcnOs9JNd6o1Fbej5pCDlkvS7qocPnvna/n/WFRv1F+04pmvg==
X-Received: by 2002:a5d:64e5:0:b0:21d:945a:e7c4 with SMTP id g5-20020a5d64e5000000b0021d945ae7c4mr8441228wri.0.1658766211550;
        Mon, 25 Jul 2022 09:23:31 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c4fd400b003a305c0ab06sm20504556wmq.31.2022.07.25.09.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 09:23:31 -0700 (PDT)
Message-ID: <c411480b-27b2-8c0b-534f-bbabd8018577@redhat.com>
Date: Mon, 25 Jul 2022 18:23:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 06/10] drm/simpledrm: Move some functionality into fwfb
 helper library
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-7-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220720142732.32041-7-tzimmermann@suse.de>
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
> Move some of simpledrm's functionality into a helper library. Other
> drivers for firmware-provided framebuffers will also need functions
> to handle fixed modes and color formats, or update the back buffer.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Nice patch!

[...]

> +
> +/**
> + * DOC: overview
> + *
> + * The Firmware Framebuffer library FWFB provides helpers for devices with
> + * fixed-mode backing storage. It helps drivers to export a display mode of
> + * te correct size and copy updates to the backing storage.

the

it is "backing storage" or "backing store" ? I always thought that storage was
used for non-volatile media while "store" could be volatile and non-volatile.

[...]

> +/**
> + * drm_fwfb_init - Initializes an fwfb buffer
> + * @fwfb: fwfb buffer
> + * @screen_base: Address of the backing buffer in kernel address space
> + * @width: Number of pixels per scanline
> + * @height: Number of scanlines
> + * @format: Color format
> + * @pitch: Distance between two consecutive scanlines in bytes
> + *
> + * Returns:
> + * 0 on success, or a negative errno code otherwise.
> + */
> +int drm_fwfb_init(struct drm_fwfb *fwfb, struct iosys_map *screen_base,
> +		  unsigned int width, unsigned int height,
> +		  const struct drm_format_info *format, unsigned int pitch)
> +{
> +	fwfb->screen_base = *screen_base;
> +	fwfb->mode = drm_fwfb_mode(width, height);
> +	fwfb->format = format;

It seems a little bit arbitrary to me that format is the only field that's
a pointer and the other ones are embedded into the struct drm_fwfb. Any
reason for that or is just a consequence of how types were used by the
simpledrm_device_create() function before that code moved into helpers ?

[...]

> +static bool is_listed_fourcc(const uint32_t *fourccs, size_t nfourccs, uint32_t fourcc)
> +{
> +	const uint32_t *fourccs_end = fourccs + nfourccs;
> +
> +	while (fourccs < fourccs_end) {
> +		if (*fourccs == fourcc)
> +			return true;
> +		++fourccs;
> +	}
> +	return false;
> +}

This seems a helper that could be useful besides the drm_fwfb_helper.c file.

I believe patches 1-6 shouldn't wait for the others in this series and could
just be merged when ready. Patches 7-10 can follow later.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

