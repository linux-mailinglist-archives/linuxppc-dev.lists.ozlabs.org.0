Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDEF926642
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 18:41:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hr1hiLgu;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dYfEf48l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDls904MYz3fRb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 02:41:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hr1hiLgu;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dYfEf48l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jfalempe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDlrS2mknz3cWN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 02:40:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720024817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f/NKPoncPw4sIDqFM3t6GuhdQa0oQUQo4XXTqMGF3ME=;
	b=Hr1hiLguSGzp+Ntsm0ONhMyTT/yPsioiNQjnA+1D3qy+IV6yvHXOJzQ4SiXax7Tvx0TTEm
	lwwwHBWezU7N0TUF8ENVncZCvOhFx3eDkRrms7TXbb2yKds5k8GzAB1opWxu9jtYC50fkA
	Sl/uGgiySc0510ha6304DOOEdwMp4zs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720024818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f/NKPoncPw4sIDqFM3t6GuhdQa0oQUQo4XXTqMGF3ME=;
	b=dYfEf48liX2MWhaMe7DZINleWfBUSZ/+mK5XSBYkUkUsI/ycHYUzeedLVR5I6BLKrvgRoL
	jBwyknWNrMEeI6G+/hhbYyYoR/2KaP9sNIQwhK6UCWlCNAHQvVp629Ok4WdsLuskD8bRU4
	S3DURfvmTgfqdej1SamgBCqQJijxF/k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-VPaT2eXXMvydQo4k7heACw-1; Wed, 03 Jul 2024 12:40:16 -0400
X-MC-Unique: VPaT2eXXMvydQo4k7heACw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4256718144dso51150645e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2024 09:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720024815; x=1720629615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/NKPoncPw4sIDqFM3t6GuhdQa0oQUQo4XXTqMGF3ME=;
        b=hWaiikgUFCubnCAHVlTALxG9aFHUK6ot4Yb3G8WGEeG0SdxuQh8wHayHNktpfgsLpq
         Sr5qQrZ7P7noBI6JHHIrsxZh3bRe4Ss8cZEeRb7LHLdYCBt1287EQpmshYIcBBR2rQk3
         J34qJ/hLQgD9iRVORNj4NTx6c+EWKurTOh09flKSm47aFLLW4z6K8UZeDEh5BYxYvHaP
         4HRSfuzqeRLdsHTp853FiyCsg6RGpk3+yRJ80C/UwxWdFHyy/Z3eyJ/ui87EXrNUFuEz
         JTtDkeRqEi5qpMvTmeiT6Bpv/NFTDni6ZUwCiib/dVYt3sKmhco5d3Vpdsyb8x/CLUiX
         5VWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU38m40sjuQ36Vjao8AQfNkSSLnKnjJSHBaDc+KlOvupRhqA27/NgbviWQNrsvWUb3yguhmwYD+Oc3X6RrdRNNHOha8a97CXK/rkrYNiQ==
X-Gm-Message-State: AOJu0Yx5BTZrtpIBP2KWpAyGtDfO7ujmZCz1J7jihjUtVoQin4kFqszD
	LgPSbe/D/scGy/9h/e76D0W+8sOcVph92Bc9xSRaVWYhllOxebEiM+tE07vTbu9YXAsoKssswfz
	Fr3uu00KvKttUV/bLR1OtFOiNFDiiTXAxD7iVf2P6c4h8uRQIZlO1Mr+VmBXFIvU=
X-Received: by 2002:adf:fa83:0:b0:367:890e:838e with SMTP id ffacd0b85a97d-367890e86c6mr3596769f8f.40.1720024815344;
        Wed, 03 Jul 2024 09:40:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFECIbpt3OJn614ksUNxWcM5kxqBGXD+RFA85ATl3K5a4iBL/0MjztMRm9i7OEdpByRhuroqQ==
X-Received: by 2002:adf:fa83:0:b0:367:890e:838e with SMTP id ffacd0b85a97d-367890e86c6mr3596739f8f.40.1720024814927;
        Wed, 03 Jul 2024 09:40:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b? ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36791d7a93bsm2401812f8f.81.2024.07.03.09.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 09:40:14 -0700 (PDT)
Message-ID: <9e7023f4-775c-4371-ade5-1ed860545aaa@redhat.com>
Date: Wed, 3 Jul 2024 18:40:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] printk: Add a short description string to kmsg_dump()
To: Kees Cook <kees@kernel.org>, Petr Mladek <pmladek@suse.com>
References: <20240702122639.248110-1-jfalempe@redhat.com>
 <202407021326.E75B8EA@keescook>
 <10ea2ea1-e692-443e-8b48-ce9884e8b942@redhat.com>
 <ZoUKM9-RiOrv0_Vf@pathway.suse.cz> <202407030926.D5DA9B901D@keescook>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <202407030926.D5DA9B901D@keescook>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Vignesh Raghavendra <vigneshr@ti.com>, Uros Bizjak <ubizjak@gmail.com>, linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, "K. Y. Srinivasan" <kys@microsoft.com>, David Airlie <airlied@gmail.com>, Wei Liu <wei.liu@kernel.org>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Dexuan Cui <decui@microsoft.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Zimmermann <tzimmermann@suse.de>, John Ogness <john.ogness@linutronix.de>, Jani Nikula <jani.nikula@intel.com>, Haiyang Zhang <haiyangz@microsoft.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 03/07/2024 18:27, Kees Cook wrote:
> On Wed, Jul 03, 2024 at 10:22:11AM +0200, Petr Mladek wrote:
>> On Wed 2024-07-03 09:57:26, Jocelyn Falempe wrote:
>>>
>>>
>>> On 02/07/2024 22:29, Kees Cook wrote:
>>>> On Tue, Jul 02, 2024 at 02:26:04PM +0200, Jocelyn Falempe wrote:
>>>>> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
>>>>> callback.
>>>>> This patch adds a new struct kmsg_dump_detail, that will hold the
>>>>> reason and description, and pass it to the dump() callback.
>>>>
>>>> Thanks! I like this much better. :)
>>>>
>>>>>
>>>>> To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
>>>>> function and a macro for backward compatibility.
>>>>>
>>>>> I've written this for drm_panic, but it can be useful for other
>>>>> kmsg_dumper.
>>>>> It allows to see the panic reason, like "sysrq triggered crash"
>>>>> or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
>>>>>
>>>>> v2:
>>>>>    * Use a struct kmsg_dump_detail to hold the reason and description
>>>>>      pointer, for more flexibility if we want to add other parameters.
>>>>>      (Kees Cook)
>>>>>    * Fix powerpc/nvram_64 build, as I didn't update the forward
>>>>>      declaration of oops_to_nvram()
>>>>
>>>> The versioning history commonly goes after the "---".
>>>
>>> ok, I was not aware of this.
>>>>
>>>>> [...]
>>>>> diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
>>>>> index 906521c2329c..65f5a47727bc 100644
>>>>> --- a/include/linux/kmsg_dump.h
>>>>> +++ b/include/linux/kmsg_dump.h
>>>>> @@ -39,6 +39,17 @@ struct kmsg_dump_iter {
>>>>>    	u64	next_seq;
>>>>>    };
>>>>> +/**
>>>>> + *struct kmsg_dump_detail - kernel crash detail
>>>>
>>>> Is kern-doc happy with this? I think there is supposed to be a space
>>>> between the "*" and the first word:
>>>>
>>>>    /**
>>>>     * struct kmsg...
>>>>
>>>>
>>> Good catch, yes there is a space missing.
>>>
>>> I just checked with "make htmldocs", and in fact include/linux/kmsg_dump.h
>>> is not indexed for kernel documentation.
>>> And you can't find the definition of struct kmsg_dumper in the online doc.
>>> https://www.kernel.org/doc/html/latest/search.html?q=kmsg_dumper
>>>
>>>> Otherwise looks good to me!
>>>>
>>>
>>> Thanks.
>>>
>>> As this patch touches different subsystems, do you know on which tree it
>>> should land ?
>>
>> Andrew usually takes patches against kernel/panic.c.
>>
>> Or you could take it via the DRM tree, especially if you already have the code
>> using the string.

If it's not taken in Andrew's tree next week, I will see if I can push 
it to the drm-misc tree. I think there is a very low chance of conflicts.

>>
>> Also I could take it via the printk tree. The only complication is
>> that I am going to be away the following two weeks and would come
>> back in the middle of the merge window. I do not expect much problems
>> with this change but...
> 
> If DRM doesn't want to carry it, I can put it in through the pstore
> tree. Let me know! :)
> 

Thanks for the proposition, I will see how it goes, it would be nice to 
have it in time for the v6.11 merge window.

Best regards,

-- 

Jocelyn

