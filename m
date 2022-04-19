Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C655065B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 09:23:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjFfJ0Pb3z3brL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 17:23:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SFFrbTIi;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jWcpsYOi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=SFFrbTIi; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=jWcpsYOi; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjFcq33jYz2yS3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 17:22:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650352950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XE7bs+vMucrnxP7rX6KAEFBKjoWlCkL1ofuWPanz4ws=;
 b=SFFrbTIix/vcyTcp9/1wj07gz7HCkbTkX2DUU5vZBKl+6/KmYO9x9ePDGVwPR9iTDW9hjF
 XYzfwZmhWC/CQ0W3enat8717+6mrxGGm5X6CKHXk28QzIZReYVrvtEE6OIV1Sd6pdEJHVe
 mv4nZDGB3gHDxSbdW208QuzAda4iJLw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650352951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XE7bs+vMucrnxP7rX6KAEFBKjoWlCkL1ofuWPanz4ws=;
 b=jWcpsYOiyJCojFv23acUdv2ZJsZ7NYMMVmhljC6jFRiGumuadOaqWbLQ4hpIz74UZ2YrVp
 w/9KYmbikFQ0RkO7x3iEPSn9w/Vr4LxHnpSUi19lJ1yAAhew18wXLSM3+8MpCHe+m0I4WS
 FDrntoXGWirBkijmZEKBq9ByFXJGO5A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-JgkGvBHfP_y0kuL7EzNLwQ-1; Tue, 19 Apr 2022 03:22:27 -0400
X-MC-Unique: JgkGvBHfP_y0kuL7EzNLwQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 bh11-20020a05600c3d0b00b003928fe7ba07so799149wmb.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 00:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XE7bs+vMucrnxP7rX6KAEFBKjoWlCkL1ofuWPanz4ws=;
 b=nbcaYRqsxHn71L/ARUCenRRCsv4D59JzmE3+paROlYVYgOHLCOp4R385nZ5F5IgYw7
 d+TQrp/PzOIvk94QZ2GQpf1RrYIFd7vpM7Q+8hGPh+0bUJdylJ64IjnFFsPJqF5EfYTW
 dT90GMOhTZNo8ZF6OKSRVMIcMYtkIe/mNKc8eHn26bjkhAFyEVAhhYoA3hMLxsXnFQoX
 irY9iub5H18Eluy4mPT/LUJ7xBvXKLjMG3RlCp4/wKbEKIkt9Ctpnqt4IkXXujiA0lZC
 FbPKNXXPNmeOOgbyO1nCaobeSd/dAoeAev0XQVCII71+cvhBQ6A19zmHeyBtuhQG1vO5
 A3+A==
X-Gm-Message-State: AOAM530BQkaKrSv78/NRwb2bGkqt335I7HvU4MhPD85W/Bzr2NNuX1eJ
 b+RIigjdgtjQ7Q8e/YY+H8IZ/xZ1C7lP8RsKUJEdH9Z52npXn9+53DhbvHXlG8J3wCfw7xfEgPw
 ZSfOzlD3yrr4qCU+Ldrk+5SHYFA==
X-Received: by 2002:a05:6000:1b08:b0:207:ad5b:83a0 with SMTP id
 f8-20020a0560001b0800b00207ad5b83a0mr10619556wrz.564.1650352946330; 
 Tue, 19 Apr 2022 00:22:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPE0Lfb8036FFd0ol7Vvhr6xWQ3rGpwS+oyiFhkfgu+5MXMGjFNhcWkb9aY1gomEOacxFDLg==
X-Received: by 2002:a05:6000:1b08:b0:207:ad5b:83a0 with SMTP id
 f8-20020a0560001b0800b00207ad5b83a0mr10619538wrz.564.1650352946065; 
 Tue, 19 Apr 2022 00:22:26 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c378600b0038eca3cdbb3sm15128816wmr.13.2022.04.19.00.22.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 00:22:25 -0700 (PDT)
Message-ID: <fb7b8ca6-a252-c021-fe74-4e7ffbb3eb7e@redhat.com>
Date: Tue, 19 Apr 2022 09:22:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] fbdev: Remove hot-unplug workaround for framebuffers
 without device
To: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>
References: <20220413092454.1073-1-tzimmermann@suse.de>
 <20220413092454.1073-3-tzimmermann@suse.de>
 <2e183cc9-603d-f038-54aa-5601f11b0484@redhat.com>
 <Ylb0316ABOhOe1Rb@phenom.ffwll.local>
 <9d4599d9-e094-e7dd-5b91-282c2679aae4@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <9d4599d9-e094-e7dd-5b91-282c2679aae4@suse.de>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, sam@ravnborg.org,
 frowand.list@gmail.com, deller@gmx.de, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Thomas,

On 4/13/22 20:09, Thomas Zimmermann wrote:

[snip]

>>>> index bc6ed750e915..bdd00d381bbc 100644
>>>> --- a/drivers/video/fbdev/core/fbmem.c
>>>> +++ b/drivers/video/fbdev/core/fbmem.c
>>>> @@ -1579,14 +1579,7 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
>>>>   			 * If it's not a platform device, at least print a warning. A
>>>>   			 * fix would add code to remove the device from the system.
>>>>   			 */
>>>> -			if (!device) {
>>>> -				/* TODO: Represent each OF framebuffer as its own
>>>> -				 * device in the device hierarchy. For now, offb
>>>> -				 * doesn't have such a device, so unregister the
>>>> -				 * framebuffer as before without warning.
>>>> -				 */
>>>> -				do_unregister_framebuffer(registered_fb[i]);
>>>
>>> Maybe we could still keep this for a couple of releases but with a big
>>> warning that's not supported in case there are out-of-tree drivers out
>>> there that still do this ?
>>>
>>> Or at least a warning if the do_unregister_framebuffer() call is removed.
>>
>> Yeah dying while holding console_lock isn't fun, and not having a WARN_ON
>> + bail-out code pretty much forces bug reporters to do a bisect here to
>> give us something more than "machine dies at boot with no messages".
>>
>> I'd just outright keep the WARN_ON here for 1-2 years even to really make
>> sure we got all the bug reports, since often these older machines only
>> update onto LTS releases.
> 
> If that's what the consent is, I'll go with it.
> 
> I'm just not sure if we talk about the same problem. offb didn't have a 
> platform device, so we recently added this workaround with 'if 
> (!device)'.  All the other fbdev drivers have a platform device; and 
> anything else that could fail is out-of-tree. We don't really care about 
> those AFAIK.
>

Yes, agreed on the offb change but I'm not really sure if we don't care
about out-of-tree modules. I mean, you are right in theory but I still
feel that we are changing a core behavior without giving people time to
sort out if needed.

Since before commit 27599aacbaef ("fbdev: Hot-unplug firmware fb devices
on forced removal") registered FBs didn't need to have a device, but now
that will lead to a NULL pointer dereference in dev_is_platform(device).

And that change only landed in v5.18-rc1, so it is fairly recent.

I know that we follow https://www.kernel.org/doc/Documentation/process/stable-api-nonsense.rst
but still my opinion is that having a warning for a couple of releases
if registered_fb[i]->device is NULL, instead of just crashing would be
a better way to handle this.
 
> With offb converted, we could practically remove all of the checks here 
> and call platform_device_unregister() unconditionally.
>

Yes for mainline, but as mentioned I thought mostly about out-of-tree. If
folks agree that we shouldn't care about these, I'm Ok with that as well.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

