Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 130415801E5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 17:31:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ls3sm6Jfcz3g1w
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 01:31:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sdu7yZgQ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AKkIi+Vr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sdu7yZgQ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AKkIi+Vr;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls3Tp6Wlyz3dx0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 01:13:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658762027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qIjBp600Z2DVdMwt/gjvKJmffQT0bObTcC/1zEfoAm8=;
	b=Sdu7yZgQbUO63mMBa1SxI0vVYDKVaTmqoOSZo/LGoscM90yHYYGNqObXLEN3i3XufUEY9S
	TqeYwYSGSletugOUbdqmuGiIrqLSzT1ilh+sYCwuR5p6Oo/IMxPITi0HBJtlsFBbqa/X1F
	e2PdkOL44tuim0EXP7SEtMwCcALenoY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658762028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qIjBp600Z2DVdMwt/gjvKJmffQT0bObTcC/1zEfoAm8=;
	b=AKkIi+VrP5bVKrK2whNMs7W8McY4vbf4jiVDGZdxE5tcvv2ksVyD4NG3kkrfXL11y7wZQ/
	hZCDIJmPAEjys8DMDLCHzY+JAa82WAdeQlCfhDp7lqGqYXVSMrIS0FBE1zHGZ9SJqy83FY
	0Etjc+rahSOHJMoaljAd0aiti4/ViLk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-gvYHrgI-NaSJ-kGJ60Y45w-1; Mon, 25 Jul 2022 11:13:44 -0400
X-MC-Unique: gvYHrgI-NaSJ-kGJ60Y45w-1
Received: by mail-wr1-f71.google.com with SMTP id n7-20020adfc607000000b0021a37d8f93aso1682698wrg.21
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 08:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qIjBp600Z2DVdMwt/gjvKJmffQT0bObTcC/1zEfoAm8=;
        b=LBZlMqJ1aREJ65vzym8lLZJH4x5WThcfQtmk+YRSbuGabZ7mmwwvu7RDgBA7AYx+h6
         iiKcRc+pksq8uzuFgjwy6PKO3OpgcMDWVqzS0wZfMsxjW4UF8pRRKKDvdSu+hTkzc6mO
         H7FGtBoLFc9NrNqI+ye9X00C9gW+RVRC0eTwAJGRW2Lf2E1dI1HSKy297/p8JuUCJSCw
         x4T/g1+V568ScZYS76Rwl234/JivJ3fStfRVgNsZTYY771TT8KSt6JL0Fz40WDF5toXD
         qPs2d93jCHx71k9qiNfsuLq23vDqNS2c9HnnbpKLCFWUsci1CqSCO66auCxu+z8nL9au
         6EKg==
X-Gm-Message-State: AJIora/hxckH4Wczp5tlNyreDCR4hRq71qLdFQzaE4/aTq8+HY6ARaL6
	5rEJdJqbk5dP1Vw9qaKMQD0uRF4z5JsRaipShyo9h9tF44Wc36A6QYsA9NgppD7TJdGZTgxHZTj
	McA8Jc2rhLLYq7XoB4afj8u2SSQ==
X-Received: by 2002:a05:6000:1e04:b0:21d:7ec3:fe5a with SMTP id bj4-20020a0560001e0400b0021d7ec3fe5amr8403036wrb.116.1658762023279;
        Mon, 25 Jul 2022 08:13:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sg48NwSZslMMuiqCHHVdPEPWZQ5xtRMvOi0g+wQFzFzNZnoLqP7GO9eKmHlB+7GyvtZqAIGQ==
X-Received: by 2002:a05:6000:1e04:b0:21d:7ec3:fe5a with SMTP id bj4-20020a0560001e0400b0021d7ec3fe5amr8403017wrb.116.1658762022953;
        Mon, 25 Jul 2022 08:13:42 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id o2-20020a05600c510200b003a2d6f26babsm15568434wms.3.2022.07.25.08.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 08:13:42 -0700 (PDT)
Message-ID: <4a7c2c1d-2bf9-84e7-9257-41fcfd66ab9d@redhat.com>
Date: Mon, 25 Jul 2022 17:13:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 04/10] drm/simpledrm: Compute framebuffer stride if not
 set
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-5-tzimmermann@suse.de>
 <CAMuHMdWEah62Ho4C8NQr-qwz62pKQiJiTi8Fa4KcXNRzo7ySJA@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdWEah62Ho4C8NQr-qwz62pKQiJiTi8Fa4KcXNRzo7ySJA@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>, David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, DRI Development <dri-devel@lists.freedesktop.org>, Paul Mackerras <paulus@samba.org>, Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>, Michal Suchanek <msuchanek@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Geert,

On 7/21/22 16:46, Geert Uytterhoeven wrote:
> Hi Thomas,
> 
> On Wed, Jul 20, 2022 at 4:27 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Compute the framebuffer's scanline stride length if not given by
>> the simplefb data.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Thanks for your patch!
> 
>> --- a/drivers/gpu/drm/tiny/simpledrm.c
>> +++ b/drivers/gpu/drm/tiny/simpledrm.c
>> @@ -743,6 +743,9 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
>>                 drm_err(dev, "no simplefb configuration found\n");
>>                 return ERR_PTR(-ENODEV);
>>         }
>> +       if (!stride)
>> +               stride = format->cpp[0] * width;
> 
> DIV_ROUND_UP(drm_format_info_bpp(format) * width, 8)
>

I think you meant here:

DIV_ROUND_UP(drm_format_info_bpp(format, 0) * width, 8) ?
 
With that change,

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

