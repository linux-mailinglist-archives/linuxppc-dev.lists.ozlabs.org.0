Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B4F4FFD6C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 20:03:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kdr6r4j4Dz3bbB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Apr 2022 04:03:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xr2GtZ4x;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YTHqWd0J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Xr2GtZ4x; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=YTHqWd0J; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kdr675qRwz2yb9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Apr 2022 04:02:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649872954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nJWkT3KWnGWrqppu3kqAfeI4Ej96CICMiq977YBg7eE=;
 b=Xr2GtZ4xOSETAJDUAXboxO+KMe23S7N4OarvYPhVamagU7878GXnVHiaEDHFTwVdosgd0u
 sWnLQU70ZfR2p1eGQvXJyMnCFOGAgm5utRUzJvaHopVnJXxKPc4tvlAKagiqxpViZCID4O
 fjpiX+KsugO82OlxwUXgRVpHRUBXMgM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649872955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nJWkT3KWnGWrqppu3kqAfeI4Ej96CICMiq977YBg7eE=;
 b=YTHqWd0JeAf9Dzx4rbIxCDP3UqvUFQjuPm5He+2x0u4AasSN3fEWNJSUlfN2hWZNqWWn9v
 wziki24X0tvfGRPutYYQnkS9j67Sqll61Uk9HUF+STXXeXBVOHzrisqFHxl5wUCYUIZKwp
 zWlTdUIozbCvYDp7kQVs36oo1s9ngOc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-eHWWVaqjMR-GihI1lnftKw-1; Wed, 13 Apr 2022 14:02:33 -0400
X-MC-Unique: eHWWVaqjMR-GihI1lnftKw-1
Received: by mail-wm1-f70.google.com with SMTP id
 q25-20020a1ce919000000b0038ead791083so1024107wmc.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 11:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nJWkT3KWnGWrqppu3kqAfeI4Ej96CICMiq977YBg7eE=;
 b=V16RUn9T+7cYR4YyqVTEDMA7BRUeyiFUlfGt5Todrp5KewjiAbW17DR4qsh6/TeILq
 aIiyMN4r27fcBGO5jF+Hf3BBlY/GNIVa9Aay80WKvLRGSZcv/vcY92nLS3Rm/Y99wV7c
 P/Y0+DgIbyV9DbUaUBPxIZI/muW5Op87inLHpQzAY8d5AwIc0krfa/AY4j+B7Zy7UveI
 Onm6JwTSUi6ZZTet0q6k/oE4kNEWZAPI7hJfzsdQrVml3gyHeIt+fd+N5vr9io67rP3M
 0NwrNPkHOoXFq4xv8lI0sblg6eCKQNoCVgIobFJrw0kkKCvHzCc9tAw9AcOOMu+irdJC
 XrkQ==
X-Gm-Message-State: AOAM531MAcVE5FgiLzbh8vtPUpWcty2rqN7GFNlxSpL1s6t1VQglX3+J
 u92kialY5XRnM2UUIwgwpHtqDXW9V7cv9KEdiu5KeRQQV9PnHJ/XvO4HXfCcdh01STUx+/GGo5O
 NtWb2iNeSvAPjLO0n0NIRSkVwtQ==
X-Received: by 2002:a5d:59a3:0:b0:207:b776:7924 with SMTP id
 p3-20020a5d59a3000000b00207b7767924mr54773wrr.363.1649872948078; 
 Wed, 13 Apr 2022 11:02:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvH1Xn8NYsnwMxq76QG9Rz4vg2r2qKIf9mBmAj8qsiBdVFiqoPbb1VQsA9a3+gGAnK5+WoNg==
X-Received: by 2002:a5d:59a3:0:b0:207:b776:7924 with SMTP id
 p3-20020a5d59a3000000b00207b7767924mr54720wrr.363.1649872947260; 
 Wed, 13 Apr 2022 11:02:27 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a05600001cc00b00207aac5d595sm6816744wrx.38.2022.04.13.11.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 11:02:26 -0700 (PDT)
Message-ID: <e76a4599-8644-15f6-5d06-288caaa687c9@redhat.com>
Date: Wed, 13 Apr 2022 20:02:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] of: Create platform devices for OF framebuffers
To: Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>
References: <20220413092454.1073-1-tzimmermann@suse.de>
 <20220413092454.1073-2-tzimmermann@suse.de>
 <CAL_JsqK4oT47Q=XFTZ0a=g3-DiB1JsW7_j9M1qRzpeahhz0muA@mail.gmail.com>
 <b31df06c-6cce-37dd-5ec1-661fdc8151da@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <b31df06c-6cce-37dd-5ec1-661fdc8151da@suse.de>
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
Cc: devicetree@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Frank Rowand <frowand.list@gmail.com>,
 Helge Deller <deller@gmx.de>, dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/13/22 19:58, Thomas Zimmermann wrote:
> Hi

[snip]

>>>
>>>          /* Populate everything else. */
>>>          of_platform_default_populate(NULL, NULL, NULL);
>>
>> I'm pretty sure it's just this call that's the problem for PPC though
>> none of the above existed when adding this caused a regression. Can we
>> remove the ifdef and just make this call conditional on
>> !IS_ENABLED(CONFIG_PPC).
> 
> Together with the changes in of_platform_populate_framebuffers(), the 
> code is more or less an "if-else" depending on PPC. I'll drop 
> of_platform_populate_framebuffers() from the patch and make a separate 
> implementation of of_platform_default_populate_init for PPC. Seems like 
> the easiest solution to me.
>

That sounds reasonable to me as well. Feel free to retain my R-B tag
when posting v2.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

