Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0C36BE9AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 13:53:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdPFF5Zklz3cjR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 23:53:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lmcewst2;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lmcewst2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lmcewst2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lmcewst2;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdPDH21Tmz3cdD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 23:52:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679057545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1vHGDmUcm1FSb8Ot+w6EwhZZd8hgraBnIv5bRhFqLac=;
	b=Lmcewst2CPGuNn9jTSYy03q1eOZh6QyybLXYBD6ejIbNjngrTQYHoAJ7NjzIJoSHs/4dM2
	2ovndvAcF+rFfz6nW6ABC0u5is2Pwjkeqd3AtPYeLDbSZdNM7oU12eYpTItMqejjHWTmJd
	RpJz6mQEvqRFw6b5Qixwo1SWttL5k9Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679057545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1vHGDmUcm1FSb8Ot+w6EwhZZd8hgraBnIv5bRhFqLac=;
	b=Lmcewst2CPGuNn9jTSYy03q1eOZh6QyybLXYBD6ejIbNjngrTQYHoAJ7NjzIJoSHs/4dM2
	2ovndvAcF+rFfz6nW6ABC0u5is2Pwjkeqd3AtPYeLDbSZdNM7oU12eYpTItMqejjHWTmJd
	RpJz6mQEvqRFw6b5Qixwo1SWttL5k9Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-ag0w9SCDOLm30e912BQ0rg-1; Fri, 17 Mar 2023 08:52:23 -0400
X-MC-Unique: ag0w9SCDOLm30e912BQ0rg-1
Received: by mail-wm1-f71.google.com with SMTP id az7-20020a05600c600700b003ed25435106so1840778wmb.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 05:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679057542;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1vHGDmUcm1FSb8Ot+w6EwhZZd8hgraBnIv5bRhFqLac=;
        b=m/s+AOxFNeudyYBFS+cmpTRFD+1gtfe1+H9+kIY79KPjwrSSk60XovlDAW7+rYeubw
         phXf7xpFF3HC2Ea5FOC8mZrsq6zkmYKcskQAE/tRNL7mC1npS7oLXcCywwKFBDyd80te
         2lxJ6Q7/MnS/zKKUwxW1qHk2XuiLmmuBB9I2tk/W6Z+GTRtJTAJkE8dxJ61PXQoknL8U
         8lEkzU0bGtwivHZZOVcCGklOE6mdcESNI7ygQSbhCJpKpQCE24Ou9T2oszphN+HEW67S
         XpebdfJ6HfHkpHlvASagXTFfz+zIt1uA2SUiQDZE8QrCVqdWHvM/tNxr47SY0T+9MadB
         zU1g==
X-Gm-Message-State: AO0yUKVOIryq68OWIWyKQqzWOoffiuybsJN4gEFhW8+zcz9KVYO+OFwt
	t9Q9JcK3fevCdBdY5qXTkUHK2sNYMIa1uIXI0Z29MFjSc7BfkwtIt85i3UGebjZJxwX7WoySan5
	OEVgRGznUbCoR0KTucyE8x0WSEQ==
X-Received: by 2002:a05:600c:4511:b0:3ed:307e:3f69 with SMTP id t17-20020a05600c451100b003ed307e3f69mr9951097wmo.7.1679057542578;
        Fri, 17 Mar 2023 05:52:22 -0700 (PDT)
X-Google-Smtp-Source: AK7set+PecfKfOrJrhR/QICpygEjaPHQnC3TpgmLa0II646fjrceLyUW0i4IkLgx03pYVVUshExAnQ==
X-Received: by 2002:a05:600c:4511:b0:3ed:307e:3f69 with SMTP id t17-20020a05600c451100b003ed307e3f69mr9951084wmo.7.1679057542349;
        Fri, 17 Mar 2023 05:52:22 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-33.web.vodafone.de. [109.43.176.33])
        by smtp.gmail.com with ESMTPSA id 4-20020a05600c028400b003eb192787bfsm1920747wmk.25.2023.03.17.05.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 05:52:21 -0700 (PDT)
Message-ID: <a2bdc644-0300-13f4-701f-e77cfab77f65@redhat.com>
Date: Fri, 17 Mar 2023 13:52:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [kvm-unit-tests PATCH 2/7] powerpc: add local variant of SPR test
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20230317123614.3687163-1-npiggin@gmail.com>
 <20230317123614.3687163-2-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230317123614.3687163-2-npiggin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 17/03/2023 13.36, Nicholas Piggin wrote:
> This adds the non-migration variant of the SPR test to the matrix,
> which can be simpler to run and debug.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   powerpc/unittests.cfg | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
> index 1e74948..3e41598 100644
> --- a/powerpc/unittests.cfg
> +++ b/powerpc/unittests.cfg
> @@ -68,5 +68,9 @@ groups = h_cede_tm
>   
>   [sprs]
>   file = sprs.elf
> +groups = sprs
> +
> +[sprs-migration]
> +file = sprs.elf
>   extra_params = -append '-w'
>   groups = migration

Reviewed-by: Thomas Huth <thuth@redhat.com>

