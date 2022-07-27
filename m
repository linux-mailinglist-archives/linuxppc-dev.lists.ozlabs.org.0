Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B74B582324
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 11:31:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lt7nl3Rs4z3cfZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 19:31:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BUU4gB4c;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZcsOAqVv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BUU4gB4c;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZcsOAqVv;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lt7n21YY8z3bsl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 19:30:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658914240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WnlbuoDO11+s0PkrtymLUg/RTeerO1YGjIAWzaLsXI8=;
	b=BUU4gB4cSIXZUdPPF/1zwiSzdOqEluuj3RcMj+lUrTpsRpPtzQsyI+fSmBCrzWu5aXYyQM
	Ivun0Yehu1JPEKTI/S/nQ5oxIsvMb6HWE//g5rJIjVAb7KMQRNrdOOnPYrFfo0lfp/CGtk
	/zSvjbSQcY9XvBrPKpqCoK0cD00hg4A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658914241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WnlbuoDO11+s0PkrtymLUg/RTeerO1YGjIAWzaLsXI8=;
	b=ZcsOAqVvrJ2eTAUxTVmgbzwwsdAsU//3wrTt1BIlXh+iLe/8XdF0nh/awCHsMJtqmJOAjy
	zjgTg1iDJ/m9zCSceKjjWA6hasFLs5yKp8rmZ640vPp50AQ4JYOpnVunYZuVtA+6fPEtEo
	3Eh41liZt97jnGCed5xDO7h3HvBKVls=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-ZkgjhqQeNo6wp7T7ATexPA-1; Wed, 27 Jul 2022 05:30:34 -0400
X-MC-Unique: ZkgjhqQeNo6wp7T7ATexPA-1
Received: by mail-wm1-f69.google.com with SMTP id f21-20020a1cc915000000b003a3551598a1so373212wmb.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 02:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WnlbuoDO11+s0PkrtymLUg/RTeerO1YGjIAWzaLsXI8=;
        b=y1JzP0fgbJ2tU2wYaAAvkEhXcH4Nx+L18c1GFnYOV6KPXa8wp0o7ZYTU/4u72d/+Gk
         IrLHeIUzOLJZribLU/bBkmd9Ql36OxnBqxcWjYeIoYfe+0JYnqq70xua+zz0b76CAumw
         aX4msK2+aVKTFFMtiQ8d3TfqA3X3VOjIlI8p4c3SvgZfdlVBGCMlBecvHFDNddX/uCLm
         Tf3qCZoE2USPPf49TZ6932uEZTUgZnrmCLBcCZwMjekpUv8g7iF6fYscL1vHP4eyGFxD
         I2jIeulZEq9owSVevIxbTf3F7V0tlI4zgr6KZCWNFQQNf2+Gpicna+QmKTzUMFTsb/6r
         P4MQ==
X-Gm-Message-State: AJIora/y1Nqp/waNx0OKrrIXoRyShSk/q3StLsLhvd4TVfVDwSSmVIDN
	hGZHjknX6i2WUQs96nikzCns524Ewp75BIpf7MWxY7k2luBiyednCn3FyavUaLh+c8Jc004DQcZ
	teN6nuXtKIHfcyGyTTWcjo1jaFQ==
X-Received: by 2002:a05:600c:41c6:b0:3a3:4cab:74c1 with SMTP id t6-20020a05600c41c600b003a34cab74c1mr2242289wmh.175.1658914233596;
        Wed, 27 Jul 2022 02:30:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uXQimwmNj3iiuQIjR5+7GqsX0PKlNmy42WJ5vwSnDC//JqOwhL7VkEb/l38nriYGA+tApYpA==
X-Received: by 2002:a05:600c:41c6:b0:3a3:4cab:74c1 with SMTP id t6-20020a05600c41c600b003a34cab74c1mr2242250wmh.175.1658914233261;
        Wed, 27 Jul 2022 02:30:33 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id w6-20020adfec46000000b0021ed0202015sm1037150wrn.10.2022.07.27.02.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 02:30:32 -0700 (PDT)
Message-ID: <123b9590-8a5d-70b3-b27b-59e71d4cf6da@redhat.com>
Date: Wed, 27 Jul 2022 11:30:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 02/10] drm/simpledrm: Inline device-init helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-3-tzimmermann@suse.de>
 <be24a47c-c41a-411a-da63-c699b53cb459@redhat.com>
 <314820f8-3609-9182-97eb-ee30e240d114@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <314820f8-3609-9182-97eb-ee30e240d114@suse.de>
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

On 7/27/22 09:50, Thomas Zimmermann wrote:
> Hi
> 
> Am 25.07.22 um 17:01 schrieb Javier Martinez Canillas:
>> Hello Thomas,
>>
>> On 7/20/22 16:27, Thomas Zimmermann wrote:
>>> Inline the helpers for initializing the hardware FB, the memory
>>> management and the modesetting into the device-creation function.
>>> No functional changes.
>>>
>>
>> Could you please elaborate in the commit message why this change is
>> desirable?  Without this additional context, this feels like going
>> backwards, since you are dropping few helpers that have quite self
>> contained code and making simpledrm_device_create() much larger.
> 
> To clarify: I want to make the init code more easy to follow. These old 
> init functions still had to be called in the right order as each > possibly depends on settings from the others. It also feels like it's 
> easier to extract common code for ofdrm. And the pipeline is static, so 
> it doesn't require complex chains of helper calls. Having everything in 
> one helper seems beneficial. (It's a trade-off, I know.)
>

I see. That makes sense to me. Could you please add the explanation to
the commit message ? And feel free to add my Acked-by for this one too.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

