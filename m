Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC6F581A3E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 21:23:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lsmyq08Gbz3cfL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 05:22:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cN2r67Ua;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cN2r67Ua;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cN2r67Ua;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cN2r67Ua;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lsmy20rbSz3bgR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 05:22:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658863330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HM/992FpowUrZBdOewYXTdFa78rfvZ1wIMJtEZDEzFo=;
	b=cN2r67UaTp5zrWI4EkfRQyUi8Txa3UtON2qB9KdIOip1YlFiYifcPk0XZXGarr3Wip6D5U
	w6vz7+MsKQ+zSLVpQoY2lxrwnnrv9hOxWBJkciCMa0aP0xzC5vZh/tkLQrDW7HNEyfhb9G
	rKfh1f6Neoc3e2tt/9oWfSMHJunvt8o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658863330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HM/992FpowUrZBdOewYXTdFa78rfvZ1wIMJtEZDEzFo=;
	b=cN2r67UaTp5zrWI4EkfRQyUi8Txa3UtON2qB9KdIOip1YlFiYifcPk0XZXGarr3Wip6D5U
	w6vz7+MsKQ+zSLVpQoY2lxrwnnrv9hOxWBJkciCMa0aP0xzC5vZh/tkLQrDW7HNEyfhb9G
	rKfh1f6Neoc3e2tt/9oWfSMHJunvt8o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-u4MLbdzAN3mcSFrN8pD4KA-1; Tue, 26 Jul 2022 15:22:08 -0400
X-MC-Unique: u4MLbdzAN3mcSFrN8pD4KA-1
Received: by mail-wm1-f72.google.com with SMTP id h65-20020a1c2144000000b003a30cae106cso10626547wmh.8
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 12:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HM/992FpowUrZBdOewYXTdFa78rfvZ1wIMJtEZDEzFo=;
        b=hQMm7DnRpsELvBsaYypuYMz3EAYyOADqOVviTitg4u0EQYMlkwf0dANy6UsWjmw7Rl
         85rYgkNv3qqU8J0e647GJJFqVJAlQyg7Wd1X6nIV4JER30hkUBz58NwWzBThpqLzHaYz
         KD/Dh+LYjtnksV2faiTQ1o9lhEucPD1e79kSDZR7u4oa8CHPQJfA+cXL7ZjD6+ekyN1J
         f145JszIeiWSIicRaFf1EonvI0HRh/YpoETIJQDNgkv76G2KW1RiCVln1tFBwJyCZ7uZ
         DYnHtNfILnePH6oLUDB7jneKs2pV2xXjJF/odh1GzOgGmiCu6pH/WhE84ER/GqMXk1ha
         6c+Q==
X-Gm-Message-State: AJIora/DQ2ma/VMRtrh26Pc5y6876RsPDrdVnhxJBZTK/xxHnLGXfSla
	SXMfGvgJH8fYKDS99aqylEZKjifxpciSL0s0G71refhQONiRWB5HTFFiNKdTX1iOMA5COTDj6zi
	zeRS/wPD73lM63CidbJFXeQd5QA==
X-Received: by 2002:a5d:64e5:0:b0:21d:945a:e7c4 with SMTP id g5-20020a5d64e5000000b0021d945ae7c4mr12161322wri.0.1658863327406;
        Tue, 26 Jul 2022 12:22:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vGZKU+Yu4t/pJR7G/x3ABdDb+Jc5JIBwBhoD8uXuQNqfQGzOOG9RFUs5hjLn5ORhAmUgcRxw==
X-Received: by 2002:a5d:64e5:0:b0:21d:945a:e7c4 with SMTP id g5-20020a5d64e5000000b0021d945ae7c4mr12161300wri.0.1658863326979;
        Tue, 26 Jul 2022 12:22:06 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id z21-20020a05600c0a1500b0039c454067ddsm19704276wmp.15.2022.07.26.12.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 12:22:06 -0700 (PDT)
Message-ID: <90aef621-b686-12dd-de55-9a680f5783d7@redhat.com>
Date: Tue, 26 Jul 2022 21:22:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 09/10] drm/ofdrm: Add per-model device function
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-10-tzimmermann@suse.de>
 <7b1a2807-59c7-d524-af8e-1ec634c740a7@redhat.com>
 <20220726144024.GP17705@kitsune.suse.cz>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220726144024.GP17705@kitsune.suse.cz>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, sam@ravnborg.org, airlied@linux.ie, deller@gmx.de, mark.cave-ayland@ilande.co.uk, dri-devel@lists.freedesktop.org, paulus@samba.org, maxime@cerno.tech, Thomas Zimmermann <tzimmermann@suse.de>, geert@linux-m68k.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Michal,

On 7/26/22 16:40, Michal Suchánek wrote:
> Hello,
> 
> On Tue, Jul 26, 2022 at 03:38:37PM +0200, Javier Martinez Canillas wrote:
>> On 7/20/22 16:27, Thomas Zimmermann wrote:
>>> Add a per-model device-function structure in preparation of adding
>>> color-management support. Detection of the individual models has been
>>> taken from fbdev's offb.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>>
>> [...]
>>
>>> +static bool is_avivo(__be32 vendor, __be32 device)
>>> +{
>>> +	/* This will match most R5xx */
>>> +	return (vendor == 0x1002) &&
>>> +	       ((device >= 0x7100 && device < 0x7800) || (device >= 0x9400));
>>> +}
>>
>> Maybe add some constant macros to not have these magic numbers ?
> 
> This is based on the existing fbdev implementation's magic numbers:
> 
> drivers/video/fbdev/offb.c:                 ((*did >= 0x7100 && *did < 0x7800) ||
>

Ah, I see. Then we might have to go with the magic numbers...
 
> Of course, it would be great if somebody knowledgeable could clarify
> those.
>

Indeed.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

