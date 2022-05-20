Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4891952E4E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 08:20:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4GmJ1D6tz3bkx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 16:20:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q/CmH/bZ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q/CmH/bZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Q/CmH/bZ; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q/CmH/bZ; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4GlY2ZSyz306K
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 16:19:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653027556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WWnyUXwbnXllaQ0uv1b5t0P1ieqzLCHOX4I/wGwYkZE=;
 b=Q/CmH/bZlJbP2zcoLA06Tv8UczHuWptZ8IYNexBppNGvD8aRrlyh+PyRIeEWaxq5/5dOCr
 yWc6ABqjkSS+j2sfvPj6iEhneTkBuRUBC31/0G9LkuRV1trxltTLIryFaq+1aaWP2scceD
 sSXp4/lowLtgn2yBk0ha33+eqeKRfMM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653027556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WWnyUXwbnXllaQ0uv1b5t0P1ieqzLCHOX4I/wGwYkZE=;
 b=Q/CmH/bZlJbP2zcoLA06Tv8UczHuWptZ8IYNexBppNGvD8aRrlyh+PyRIeEWaxq5/5dOCr
 yWc6ABqjkSS+j2sfvPj6iEhneTkBuRUBC31/0G9LkuRV1trxltTLIryFaq+1aaWP2scceD
 sSXp4/lowLtgn2yBk0ha33+eqeKRfMM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-tKbe8ofbNl6JKxvaimnwSw-1; Fri, 20 May 2022 02:19:14 -0400
X-MC-Unique: tKbe8ofbNl6JKxvaimnwSw-1
Received: by mail-wr1-f72.google.com with SMTP id
 z5-20020a5d4d05000000b0020e6457f2b4so1828694wrt.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 23:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WWnyUXwbnXllaQ0uv1b5t0P1ieqzLCHOX4I/wGwYkZE=;
 b=6e1Ul8vxXOeWOsvATj+Nr7zvLuQSGsBGEdccCw5zuHmgG2BbwESDsHSXgYWawWevJS
 AF6VqtPWgRYGU+AH0Hy8AqJa6FERu/NunejYWYB65ZgZIuJdyLsYl5KKP6/WkRJYGeq+
 NBMHVDe49A44XHnMmgcOXWFV5dmEKB4nwINtuPyL5Qp4dSxXvNk7GtWxOsDBFI/WR2pS
 WlCDm+l77i6idE/nT7NhZwlO2tc3KtIRcKwXemyidVEIRL2ft2danz5l3oGGkVvq8r3z
 KOru6KdbBCoId8HXI0tCTA31fg3W7HMaREB+EgOvjt1vqTQvRmJWFrkPAkGiIpwKPM7g
 8/sA==
X-Gm-Message-State: AOAM530tPAD5ry/SWaL3I/gRRGWn/lNjISMyEI7MA1hWwhnH+ROA/0At
 NfqHSyntM3LvNChydkhG3kdLLzSk2e6NUETlWZxSM/6SJyyR3MqR2fZNQ85T/xJ+exrl/I52Lf7
 Aff4h0N4HEXU/jszWLTwKtry7IQ==
X-Received: by 2002:adf:ea0a:0:b0:20f:afa:c885 with SMTP id
 q10-20020adfea0a000000b0020f0afac885mr947012wrm.640.1653027553117; 
 Thu, 19 May 2022 23:19:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1apKhwtDuwN5y6ql+wtzPt4dv5/GCFcazI5SvaYczGFn7reMg6aU/08qipp7Qzw+vBvg6qg==
X-Received: by 2002:adf:ea0a:0:b0:20f:afa:c885 with SMTP id
 q10-20020adfea0a000000b0020f0afac885mr946992wrm.640.1653027552861; 
 Thu, 19 May 2022 23:19:12 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s26-20020adfa29a000000b0020d069148bcsm1433018wra.110.2022.05.19.23.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 23:19:12 -0700 (PDT)
Message-ID: <84a550c3-dcef-17ac-0ae5-666cdf0fb67e@redhat.com>
Date: Fri, 20 May 2022 08:19:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] drm/tiny: Add ofdrm for Open Firmware framebuffers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org
References: <20220518183006.14548-1-tzimmermann@suse.de>
 <20220518183006.14548-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220518183006.14548-3-tzimmermann@suse.de>
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

>  
> +config DRM_OFDRM
> +	tristate "Open Firmware display driver"
> +	depends on DRM && MMU && PPC

Shouldn't depend on OF? I mean, is a DRM driver for Open Firmware after all :)

I know that the old drivers/video/fbdev/offb.c doesn't, but I think that is a
but and should `depends on OF || COMPILE_TEST`

> +
> +/*
> + * Helpers for display nodes
> + */
> +
> +static int display_get_validated_int(struct drm_device *dev, const char *name, uint32_t value)
> +{
> +	if (value > INT_MAX) {
> +		drm_err(dev, "invalid framebuffer %s of %u\n", name, value);
> +		return -EINVAL;
> +	}
> +	return (int)value;
> +}
> +
> +static int display_get_validated_int0(struct drm_device *dev, const char *name, uint32_t value)
> +{
> +	if (!value) {
> +		drm_err(dev, "invalid framebuffer %s of %u\n", name, value);
> +		return -EINVAL;
> +	}
> +	return display_get_validated_int(dev, name, value);
> +}
> +

These two helpers are the same that we already have in simpledrm.c, maybe could
include a preparatory patch that moves to drivers/gpu/drm/drm_format_helper.c
and make them public for drivers to use ? Or maybe even as static inline in
include/drm/drm_format_helper.h ?

> +static const struct drm_format_info *display_get_validated_format(struct drm_device *dev,
> +								  u32 depth)
> +{
> +	const struct drm_format_info *info;
> +	u32 format;
> +
> +	switch (depth) {
> +	case 8:
> +		format = drm_mode_legacy_fb_format(8, 8);
> +		break;
> +	case 15:

I think is customary now to add /* fall through */ here to silence GCC warns ?

> +}
> +
> +static int display_read_u32_of(struct drm_device *dev, struct device_node *of_node,
> +			       const char *name, u32 *value)
> +{
> +	int ret = of_property_read_u32(of_node, name, value);
> +
> +	if (ret)
> +		drm_err(dev, "cannot parse framebuffer %s: error %d\n", name, ret);
> +	return ret;
> +}
> +

[snip]

> +static u64 display_get_address_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +	u32 address;
> +	int ret;
> +
> +	/*
> +	 * Not all devices provide an address property, it's not
> +	 * a bug if this fails. The driver will try to find the
> +	 * framebuffer base address from the device's memory regions.
> +	 */
> +	ret = of_property_read_u32(of_node, "address", &address);
> +	if (ret)
> +		return OF_BAD_ADDR;
> +
> +	return address;
> +}
> +

All these helpers seems to be quite generic and something that other OF
drivers could benefit from. Maybe add them to drivers/gpu/drm/drm_of.c ?

> +#if defined(CONFIG_PCI)
> +static struct pci_dev *display_get_pci_dev_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +	const __be32 *vendor_p, *device_p;
> +	u32 vendor, device;
> +	struct pci_dev *pcidev;
> +
> +	vendor_p = of_get_property(of_node, "vendor-id", NULL);
> +	if (!vendor_p)
> +		return ERR_PTR(-ENODEV);
> +	vendor = be32_to_cpup(vendor_p);
> +
> +	device_p = of_get_property(of_node, "device-id", NULL);
> +	if (!device_p)
> +		return ERR_PTR(-ENODEV);
> +	device = be32_to_cpup(device_p);
> +
> +	pcidev = pci_get_device(vendor, device, NULL);
> +	if (!pcidev)
> +		return ERR_PTR(-ENODEV);
> +
> +	return pcidev;
> +}
> +#else
> +static struct pci_dev *display_get_pci_dev_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +#endif
> +

Unsure about this one, I don't see other display driver using a "vendor-id"
or "device-id" when looking at Documentation/devicetree/bindings/, so guess
this one would have to remain in the driver and not in a helper library.

But since you have #ifdefery here, maybe would be cleaner to have that stub
defined as static inline in include/drm/drm_of.h ?


> +static struct ofdrm_device *ofdrm_device_of_dev(struct drm_device *dev)
> +{
> +	return container_of(dev, struct ofdrm_device, dev);
> +}
> +
> +/*
> + *  OF display settings
> + */
> +

This seems like another candidate to move to the include/drm/drm_of.h header. 

> +static struct drm_display_mode ofdrm_mode(unsigned int width, unsigned int height)
> +{
> +	struct drm_display_mode mode = { OFDRM_MODE(width, height) };
> +
> +	mode.clock = mode.hdisplay * mode.vdisplay * 60 / 1000 /* kHz */;

Maybe a comment here about the clock value chosen ?

> +	drm_mode_set_name(&mode);
> +
> +	return mode;
> +}
> +

[snip]

> +
> +	/*
> +	 * Never use pcim_ or other managed helpers on the returned PCI
> +	 * device. Otherwise, probing the native driver will fail for
> +	 * resource conflicts. PCI-device management has to be tied to
> +	 * the lifetime of the platform device until the native driver
> +	 * takes over.
> +	 */

Ah, was this the issue that you mentioned the other day? How interesting.


> +/*
> + * Support all formats of OF display and maybe more; in order
> + * of preference. The display's update function will do any
> + * conversion necessary.
> + *
> + * TODO: Add blit helpers for remaining formats and uncomment
> + *       constants.
> + */
> +static const uint32_t ofdrm_default_formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_RGB565,
> +	//DRM_FORMAT_XRGB1555,

Wonder if makes sense to keep this commented and the TODO, why not
leave that format from first version and just do it as follow-up ?

> +static const struct drm_connector_funcs ofdrm_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};

All of the callbacks used comes from helper libraries so I maybe we
could have a macro or something to set those ? It's the same set that
are used in simpledrm so it would make sense to have them defined in
the same place.

> +static const struct drm_mode_config_funcs ofdrm_mode_config_funcs = {
> +	.fb_create = drm_gem_fb_create_with_dirty,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +};
> +

Same for these. We could also have a macro to define this for both
simpledrm and ofdrm.

> +static const uint32_t *ofdrm_device_formats(struct ofdrm_device *odev, size_t *nformats_out)
> +{
> +	struct drm_device *dev = &odev->dev;
> +	size_t i;
> +
> +	if (odev->nformats)
> +		goto out; /* don't rebuild list on recurring calls */
> +

Nice optimization to cache this.

> +	/*
> +	 * TODO: The ofdrm driver converts framebuffers to the native
> +	 * format when copying them to device memory. If there are more
> +	 * formats listed than supported by the driver, the native format
> +	 * is not supported by the conversion helpers. Therefore *only*
> +	 * support the native format and add a conversion helper ASAP.
> +	 */
> +	if (drm_WARN_ONCE(dev, i != odev->nformats,
> +			  "format conversion helpers required for %p4cc",
> +			  &odev->format->format)) {
> +		odev->nformats = 1;
> +	}
> +

Interesting. Did you find some formats that were not supported ?

The rest of the patch looks good to me, thanks a lot for writing this.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

