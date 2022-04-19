Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F61506D7A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 15:30:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjPnn5cbkz2xBf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 23:30:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.172;
 helo=mail-oi1-f172.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjPnK482tz2xBf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 23:30:29 +1000 (AEST)
Received: by mail-oi1-f172.google.com with SMTP id 12so18067987oix.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 06:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dC+9aknP1RLhEpg+1+Hw55vZvp/iuvE//q1Eib/rSk8=;
 b=H7X3tuDkfbgEXTpLQyiaAN+basDmtWTYhyanJCvPyz+7aUoaNq/a6mYVOmrCR7JF1X
 DhHT8O9qir+NPVedAvyW6UbvZcA4EZeIfoqzM9ragTestw41DWUG850aqF27zYUdO893
 2Anu4w6pagMRzBZmnYsYaVws/IBC3n7a29XzAmUp1kOGAnjLSuoatJsdsJdbXDoryrX2
 S7TymOmARL9FCehUqFgXd7KwxuuXsHZGNElu1NuZVZbt+q7K061lpQyn9Y4ucMNFgA/m
 zpTRJH/kIJL1N4Q/MYxSnhG/GgW4RcruhNqeOtGGJHUCIdrZXqJuMHWtWL3uyTcBOwrS
 /e5A==
X-Gm-Message-State: AOAM530vhOc//MIZdt/twnYQmJpM0mk2CVa/x/H6BGpejoNzRHyQCxfa
 S6k7Kasczb5rdo0h7j8+uQ==
X-Google-Smtp-Source: ABdhPJz3NesdMOUrwAzr/eSC8Mx3RfAIAeIJyoJkAIHJpN1mFId4zSJtG69YtVQ1IuW9xS8FsHja1w==
X-Received: by 2002:aca:1903:0:b0:322:68f1:79ca with SMTP id
 l3-20020aca1903000000b0032268f179camr6634474oii.189.1650375025388; 
 Tue, 19 Apr 2022 06:30:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k8-20020a544688000000b002f90678740esm5102226oic.37.2022.04.19.06.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 06:30:24 -0700 (PDT)
Received: (nullmailer pid 2377875 invoked by uid 1000);
 Tue, 19 Apr 2022 13:30:23 -0000
Date: Tue, 19 Apr 2022 08:30:23 -0500
From: Rob Herring <robh@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/2] of: Create platform devices for OF framebuffers
Message-ID: <Yl65by+ZjQdK8nIv@robh.at.kernel.org>
References: <20220419100405.12600-1-tzimmermann@suse.de>
 <20220419100405.12600-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419100405.12600-2-tzimmermann@suse.de>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 frowand.list@gmail.com, deller@gmx.de, linuxppc-dev@lists.ozlabs.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, paulus@samba.org,
 daniel@ffwll.ch, sam@ravnborg.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 19, 2022 at 12:04:04PM +0200, Thomas Zimmermann wrote:
> Create a platform device for each OF-declared framebuffer and have
> offb bind to these devices. Allows for real hot-unplugging and other
> drivers besides offb.
> 
> Originally, offb created framebuffer devices while initializing its
> module by parsing the OF device tree. No actual Linux device was set
> up. This tied OF framebuffers to offb and makes writing other drivers
> for the OF framebuffers complicated. The absence of a Linux device
> further prevented real hot-unplugging. Adding a distinct platform
> device for each OF framebuffer solves both problems. Specifically, a
> DRM driver can now provide graphics output for modern userspace.
> 
> Some of the offb init code is now located in the OF initialization.
> There's now also an implementation of of_platform_default_populate_init(),
> which was missing before. The OF side creates different devices for
> either OF display nodes or BootX displays as they require different
> handling by the driver. The offb drivers picks up each type of device
> and runs the appropriate fbdev initialization.
> 
> Tested with OF display nodes on qemu's ppc64le target.
> 
> v2:
> 	* run PPC code as part of existing initialization (Rob)
> 	* add a few more error warnings (Javier)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/of/platform.c      | 88 ++++++++++++++++++++++++++--------
>  drivers/video/fbdev/offb.c | 98 +++++++++++++++++++++++++-------------
>  2 files changed, 132 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index a16b74f32aa9..738ba2e2838c 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -507,7 +507,6 @@ int of_platform_default_populate(struct device_node *root,
>  }
>  EXPORT_SYMBOL_GPL(of_platform_default_populate);
>  
> -#ifndef CONFIG_PPC
>  static const struct of_device_id reserved_mem_matches[] = {
>  	{ .compatible = "qcom,rmtfs-mem" },
>  	{ .compatible = "qcom,cmd-db" },
> @@ -520,33 +519,81 @@ static const struct of_device_id reserved_mem_matches[] = {
>  
>  static int __init of_platform_default_populate_init(void)
>  {
> -	struct device_node *node;
> -

As both if/else clauses need 'node', I'd keep this declared here.

>  	device_links_supplier_sync_state_pause();
>  
>  	if (!of_have_populated_dt())
>  		return -ENODEV;
>  
> -	/*
> -	 * Handle certain compatibles explicitly, since we don't want to create
> -	 * platform_devices for every node in /reserved-memory with a
> -	 * "compatible",
> -	 */
> -	for_each_matching_node(node, reserved_mem_matches)
> -		of_platform_device_create(node, NULL, NULL);
> +	if (IS_ENABLED(CONFIG_PPC)) {
> +		struct device_node *boot_display = NULL;
> +		struct device_node *node;
> +		struct platform_device *dev;
> +		int ret;
> +
> +		/* Check if we have a MacOS display without a node spec */
> +		if (of_get_property(of_chosen, "linux,bootx-noscreen", NULL)) {
> +			/*
> +			 * The old code tried to work out which node was the MacOS
> +			 * display based on the address. I'm dropping that since the
> +			 * lack of a node spec only happens with old BootX versions
> +			 * (users can update) and with this code, they'll still get
> +			 * a display (just not the palette hacks).
> +			 */
> +			dev = platform_device_alloc("bootx-noscreen", 0);
> +			if (WARN_ON(!dev))
> +				return -ENOMEM;
> +			ret = platform_device_add(dev);
> +			if (WARN_ON(ret)) {
> +				platform_device_put(dev);
> +				return ret;
> +			}
> +		}
>  
> -	node = of_find_node_by_path("/firmware");
> -	if (node) {
> -		of_platform_populate(node, NULL, NULL, NULL);
> -		of_node_put(node);
> -	}
> +		/*
> +		 * For OF framebuffers, first create the device for the boot display,
> +		 * then for the other framebuffers. Only fail for the boot display;
> +		 * ignore errors for the rest.
> +		 */
> +		for_each_node_by_type(node, "display") {
> +			if (!of_get_property(node, "linux,opened", NULL) ||
> +			    !of_get_property(node, "linux,boot-display", NULL))
> +				continue;
> +			dev = of_platform_device_create(node, "of-display", NULL);
> +			if (WARN_ON(!dev))
> +				return -ENOMEM;
> +			boot_display = node;
> +			break;
> +		}
> +		for_each_node_by_type(node, "display") {
> +			if (!of_get_property(node, "linux,opened", NULL) || node == boot_display)
> +				continue;
> +			of_platform_device_create(node, "of-display", NULL);
> +		}
>  
> -	node = of_get_compatible_child(of_chosen, "simple-framebuffer");
> -	of_platform_device_create(node, NULL, NULL);
> -	of_node_put(node);
> +	} else {
> +		struct device_node *node;
> +
> +		/*
> +		 * Handle certain compatibles explicitly, since we don't want to create
> +		 * platform_devices for every node in /reserved-memory with a
> +		 * "compatible",
> +		 */
> +		for_each_matching_node(node, reserved_mem_matches)
> +			of_platform_device_create(node, NULL, NULL);
>  
> -	/* Populate everything else. */
> -	of_platform_default_populate(NULL, NULL, NULL);
> +		node = of_find_node_by_path("/firmware");
> +		if (node) {
> +			of_platform_populate(node, NULL, NULL, NULL);
> +			of_node_put(node);
> +		}
> +
> +		node = of_get_compatible_child(of_chosen, "simple-framebuffer");
> +		of_platform_device_create(node, NULL, NULL);
> +		of_node_put(node);

In v1, you supported "simple-framebuffer" on PPC. Don't we want to allow 
that? Maybe no one cares ATM, but that could change. Either way:

Reviewed-by: Rob Herring <robh@kernel.org>


> +
> +		/* Populate everything else. */
> +		of_platform_default_populate(NULL, NULL, NULL);
> +	}
>  
>  	return 0;
>  }
> @@ -558,7 +605,6 @@ static int __init of_platform_sync_state_init(void)
>  	return 0;
>  }
>  late_initcall_sync(of_platform_sync_state_init);
> -#endif
>  
>  int of_platform_device_destroy(struct device *dev, void *data)
>  {
