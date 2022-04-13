Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 770394FF73E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 14:57:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdjL92pyNz3bcV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 22:57:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZM1AOWhc;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZM1AOWhc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ZM1AOWhc; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZM1AOWhc; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdfPX3byMz2yjS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 20:45:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649846713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iFhpaO4flQWRHjopPtTFPWapfyKNAixT16D8GlIdtis=;
 b=ZM1AOWhcS4FhGt9/TpXInt2jAAsMUmeOZ1/UXueWi2G0Ui7qadUkIQJ5YxaAJTcw1mp41j
 K6c+CD65iOftVuPujhGjmd3adU1BsscwDmX77wUYHzIoksmKOKfZ9h9zdEdJzRbZ3m/WcZ
 Nz3OILNG6CXkelRNCVbJcYsSax51mJ8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649846713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iFhpaO4flQWRHjopPtTFPWapfyKNAixT16D8GlIdtis=;
 b=ZM1AOWhcS4FhGt9/TpXInt2jAAsMUmeOZ1/UXueWi2G0Ui7qadUkIQJ5YxaAJTcw1mp41j
 K6c+CD65iOftVuPujhGjmd3adU1BsscwDmX77wUYHzIoksmKOKfZ9h9zdEdJzRbZ3m/WcZ
 Nz3OILNG6CXkelRNCVbJcYsSax51mJ8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-dQKJnDpQNnqeXhziPut5-A-1; Wed, 13 Apr 2022 06:45:12 -0400
X-MC-Unique: dQKJnDpQNnqeXhziPut5-A-1
Received: by mail-wm1-f72.google.com with SMTP id
 g13-20020a1c4e0d000000b0038eba16aa46so665174wmh.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 03:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iFhpaO4flQWRHjopPtTFPWapfyKNAixT16D8GlIdtis=;
 b=MfSz07urUq7gyR5ReUCC2R1Eml/EHnBmtQSvSzQj3kaPK/daT7ssRUYDWNqmolpvoi
 6Jqjnd/+UV3BPtMGAvoYP7uxoR2BWaUsAgACIPU0PaoqHcjel+3oPEZ0yuSdIJNmB9GH
 9NBsZeiLLJLCfAIeTPi3gZXgCl01eLsxIfXzeS8yY2BkloAHr+pqVGU36B99KV3EM/lx
 AAkgyjvTcEHbvERshGIG8d93pkBaqydlJfBwcjnFzGFH6y9PEYXGFAXO6qPCVfYseNmi
 uvrfwu8vStoulkmDj/D6Dz4xz1sx7PGA7ObQvIEiA87in8K9KiPdesZFnIM9bIOXIpeQ
 E4PA==
X-Gm-Message-State: AOAM530TGdiP38HlHUs+s5bgVOu45yv+ZPc4eGFHs336yNLoU3NgsQ+6
 pBbjKScgOWGobKbRyDvERer7kBhmViTBUuohKy1EdFSvmTht79RlURG/AeTE6TzS3obrH8YNXwa
 4Rzs+Q6Dnw4HAmgV5W00z15R+YQ==
X-Received: by 2002:a7b:c350:0:b0:38c:6d3c:6c8 with SMTP id
 l16-20020a7bc350000000b0038c6d3c06c8mr7843245wmj.45.1649846710859; 
 Wed, 13 Apr 2022 03:45:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrABkEapBmyT3q0GmcVo1LIayLaVhccVgfexcQ/xcAqoykIRQcU/wRPqN7irY6KO22Ca1QDg==
X-Received: by 2002:a7b:c350:0:b0:38c:6d3c:6c8 with SMTP id
 l16-20020a7bc350000000b0038c6d3c06c8mr7843206wmj.45.1649846710486; 
 Wed, 13 Apr 2022 03:45:10 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a5d5587000000b00207a8cde900sm6685468wrv.19.2022.04.13.03.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 03:45:10 -0700 (PDT)
Message-ID: <23060462-5700-e17a-0abe-a4c5123abe29@redhat.com>
Date: Wed, 13 Apr 2022 12:45:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] of: Create platform devices for OF framebuffers
To: Thomas Zimmermann <tzimmermann@suse.de>, robh+dt@kernel.org,
 frowand.list@gmail.com, daniel@ffwll.ch, deller@gmx.de, sam@ravnborg.org,
 linux@roeck-us.net, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org
References: <20220413092454.1073-1-tzimmermann@suse.de>
 <20220413092454.1073-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220413092454.1073-2-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 13 Apr 2022 22:57:01 +1000
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
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Thomas,

Thanks for working on this.

On 4/13/22 11:24, Thomas Zimmermann wrote:
> Create a platform device for each OF-declared framebuffer and have
> offb bind to these devices. Allows for real hot-unplugging and other
> drivers besides offb.
> 
> Originally, offb created framebuffer devices while initializing its
> module by parsing the OF device tree. No actual Linux device was set
> up. This tied OF framebuffers to offb and makes writing other drivers
> for the OF framebuffers complicated. The absence of a Linux device
> prevented real hot-unplugging. Adding a distinct platform device for
> each OF framebuffer solves both problems. Specifically, a DRM drivers
> can now provide graphics output with modern userspace.
> 
> Some of the offb init code is now located in the OF initialization.
> There's now also an implementation of of_platform_default_populate_init(),
> which was missing before. The OF side creates different devices for
> either OF display nodes or bootx displays as they require different
> handling by the driver. The offb drivers picks up each type of device
> and runs the appropriate fbdev initialization.
> 
> Tested with OF display nodes on qemu's ppc64le target.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[snip]

> +	for_each_node_by_type(node, "display") {
> +		if (!of_get_property(node, "linux,opened", NULL) ||
> +		    !of_get_property(node, "linux,boot-display", NULL))
> +			continue;
> +		dev = of_platform_device_create(node, "of-display", NULL);
> +		if (WARN_ON(!dev))
> +			return -ENOMEM;
> +		boot_display = node;
> +		break;
> +	}
> +	for_each_node_by_type(node, "display") {
> +		if (!of_get_property(node, "linux,opened", NULL) || node == boot_display)
> +			continue;
> +		of_platform_device_create(node, "of-display", NULL);

Shouldn't check for the return value here too ?

Other than this small nit, it looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

