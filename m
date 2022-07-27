Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31572582371
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 11:45:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lt86P0LlVz3cf4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 19:45:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QPtBKN+J;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QPtBKN+J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QPtBKN+J;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QPtBKN+J;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lt85j0zk6z304j
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 19:45:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658915108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d7wwuGLjAZB3K+Voj80d4Ozo5qLQ+l1QsRMGTb08BDM=;
	b=QPtBKN+J3b3qXIth+rxCs7rMxzKCaNFGhEXapV7qc8ffPr+WOmk6dAgGRmzvRb2Y6GWm93
	t3Iw7f5GxfRRLcWdZLMpT2yXTVVJLZkDbkipVmrUgqFAGXTsuxNJ7f4PIyhsVlsDWl+FaW
	IZRvEwkIlk15DNwwBdnw//kWWF/f4Mw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658915108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d7wwuGLjAZB3K+Voj80d4Ozo5qLQ+l1QsRMGTb08BDM=;
	b=QPtBKN+J3b3qXIth+rxCs7rMxzKCaNFGhEXapV7qc8ffPr+WOmk6dAgGRmzvRb2Y6GWm93
	t3Iw7f5GxfRRLcWdZLMpT2yXTVVJLZkDbkipVmrUgqFAGXTsuxNJ7f4PIyhsVlsDWl+FaW
	IZRvEwkIlk15DNwwBdnw//kWWF/f4Mw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-oKQm2KEsMdG_Fzwh0BdXhA-1; Wed, 27 Jul 2022 05:45:06 -0400
X-MC-Unique: oKQm2KEsMdG_Fzwh0BdXhA-1
Received: by mail-wm1-f72.google.com with SMTP id n19-20020a05600c3b9300b003a314062cf4so1710799wms.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 02:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=d7wwuGLjAZB3K+Voj80d4Ozo5qLQ+l1QsRMGTb08BDM=;
        b=aQuRkcVa6PHbvwDVGnNBz3rmvx80KCB497jO0FG/fABP3i9XnOePzX07NN/JBsC9CS
         4taPUsxt+h/6zEGcVTNZcy5DRvKAsPxnHTyEYq/FvuibUA2R6+SrXCY1RyPm1fbyWUQP
         NWYbUzkwmH1dCMHrBG9NCnr1Bgzq+evfcrvSdKNdgklnJQoSoe0VaudqZsGes15AJw5H
         hISFCtyoxt/Z5DGgEq79yNozOIhGsX0uxOjL2/SZNCqT2yGRvBH4nfOwSIaDLmaTOaq/
         213nOvGygaE8sqsU79j7eCtyztxJ4puAZnQbH/iXZd+DfToi3fTPtHU5ASj5VoBG4Y5S
         pJkQ==
X-Gm-Message-State: AJIora+/2jHyGhtto0j56mRR96EHiuM8HI+rPejc/dOIs+zlkmZqKQT6
	MtxJizxFSCRoWmDNP+XVe5OR4+FWOocITGo4ZaK1cBL3u7QigUXZRf0bbh2FZpSclQWhPl2ZEqz
	WkNThGfjr0U3X9TRp/Y437/Pi2Q==
X-Received: by 2002:a05:600c:3caa:b0:3a0:18e4:781b with SMTP id bg42-20020a05600c3caa00b003a018e4781bmr2469508wmb.199.1658915105266;
        Wed, 27 Jul 2022 02:45:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tY1NapkC+jkHigs52/MIzuEN8IcNKNYICxfk8KUt9jGlsGLWmG7Fj2fsNnrteJALcuFgDk/A==
X-Received: by 2002:a05:600c:3caa:b0:3a0:18e4:781b with SMTP id bg42-20020a05600c3caa00b003a018e4781bmr2469489wmb.199.1658915105054;
        Wed, 27 Jul 2022 02:45:05 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t6-20020a05600c198600b003a326ba4e99sm1915497wmq.34.2022.07.27.02.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 02:45:03 -0700 (PDT)
Message-ID: <6b7bdf72-5ed3-f075-ecb8-639e569c5cb9@redhat.com>
Date: Wed, 27 Jul 2022 11:45:02 +0200
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
 <abe3fa95-942b-6d2f-7167-83d0cea59444@redhat.com>
 <05511c35-da46-aefd-3e03-364b7311284c@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <05511c35-da46-aefd-3e03-364b7311284c@suse.de>
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

On 7/27/22 10:41, Thomas Zimmermann wrote:

[...]

>>
>>> +static void __iomem *ofdrm_mach64_cmap_ioremap(struct ofdrm_device *odev,
>>> +					       struct device_node *of_node,
>>> +					       u64 fb_base)
>>> +{
>>> +	struct drm_device *dev = &odev->dev;
>>> +	u64 address;
>>> +	void __iomem *cmap_base;
>>> +
>>> +	address = fb_base & 0xff000000ul;
>>> +	address += 0x7ff000;
>>> +
>>
>> It would be good to know where these addresses are coming from. Maybe some
>> constant macros or a comment ? Same for the other places where addresses
>> and offsets are used.
> 
> I have no idea where these values come from. I took them from offb. And 
> I suspect that some of these CMAP helpers could be further merged if 
> only it was clear where the numbers come from.  But as i don't have the 
> equipment for testing, I took most of this literally as-is from offb.
>

I see. As Michal mentioned maybe someone more familiar with this platform
could shed some light about these but in any case that could be done later.

[...]

>>> +
>>> +	new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_plane_state->crtc);
>>> +
>>> +	new_ofdrm_crtc_state = to_ofdrm_crtc_state(new_crtc_state);
>>> +	new_ofdrm_crtc_state->format = new_fb->format;
>>> +
>>
>> Ah, I understand now why you didn't factor out the .atomic_check callbacks
>> for the two drivers in a fwfb helper. Maybe you can also add a comment to
>> mention that this updates the format so the CRTC palette can be applied in
>> the .atomic_flush callback ?
> 
> Yeah, this code is one reason for not sharing atomic_check in fwfb.  The 
> other reason is that the fwfb code is only a wrapper around the atomic 
> helpers with little extra value.  I did have such fwfb helpers a some 
> point, but removed them.
>

Got it.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

