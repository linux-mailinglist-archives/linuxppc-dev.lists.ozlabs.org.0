Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 772D05807AD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 00:41:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsFQ72QLSz3c70
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 08:41:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qUtmtma6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qUtmtma6;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsFPW3fbTz304J
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 08:40:45 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id y15so11688824plp.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 15:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=+gsloq9DrRj40wgtL1Bj5I/zKXAptLmoCHjL2BnUObw=;
        b=qUtmtma6HAQJVGOAzv8j1zpuhY/PD+n2lLtrvXqfLjDEbW/92oJFBSdQSqvu0vrBl1
         6wA5y5aBh4XKOitO+OtYvo6eIpaT54/UGk0fdpdZZrk5dWPezSTLL1T1dX5bNd6Fejmy
         wLZQ58Uh9DVm4Q9Vwasenaz16K7iKmeICk5jmwSYudByNWr4HffVTxdC0gZv5NSfXM7d
         h38haZ1YMo7ToVhCDJr7KtgZ+MhXyr2vZFb8eeHqZk9oqtrUHMJN2887ZizkRpG4a9Xq
         a/V6LSSiy7mRYJSLoWW67r75jEdfwxX8h22LSYiYxrZqvGTo1UdtTggGJHe6S4fqi1gM
         pIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=+gsloq9DrRj40wgtL1Bj5I/zKXAptLmoCHjL2BnUObw=;
        b=BzUd6ehitqLL3pxuilTup3GYUzb+01br3ffjX53oRwCSF/AECyb9+HqtHMRRQ31Toc
         KCoPHgsvlk5j4TDZtkxej+/bTF43U4kzUskooFwTzqEak1k9u46vdKDD2MEjZdZPITyg
         ahA+eSM5mCdpMXbA01hO5AaqQmtGLzCpdIhNtev2fmO8gxoZSpmsZCBkgPnEotneilUc
         O+0ozanmFd1EoaP79PMN1XNWfMu9k0QhIJZkY2RU6cdZBTwD70ANmy3bEMeX+32s7KhB
         wowECfX85laMk7UzZRIgHU+WXYxWDB+iH1PHYuk+9A2uOdkKXvd1COg2RLHOK72OIt4s
         7AQw==
X-Gm-Message-State: AJIora+0cb+lefmYc2Db/nCozlFvO4n9YJAhWyYguEWtyib38jMaTCjU
	xM2QFDcELTXotVjc6k8HAoI=
X-Google-Smtp-Source: AGRyM1sY6xs2vLFIRjWV2bnzc91l1WGwCvv+DJXVUNptBy7iZlV1vdS9ruecuC6uACy/vvyxKuwSiQ==
X-Received: by 2002:a17:902:ba91:b0:16c:6b8e:cd06 with SMTP id k17-20020a170902ba9100b0016c6b8ecd06mr13859080pls.33.1658788842670;
        Mon, 25 Jul 2022 15:40:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z14-20020aa7958e000000b0052a75004c51sm10440383pfj.146.2022.07.25.15.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 15:40:41 -0700 (PDT)
Message-ID: <5ef016a9-c1bb-91dd-454d-504d26074477@roeck-us.net>
Date: Mon, 25 Jul 2022 15:40:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <20220725123918.1903255-1-mpe@ellerman.id.au>
 <CAHk-=wihON4Ytte5zLHWNQtTapUvCpkToxY06OjX-_2B+Gq6Gg@mail.gmail.com>
 <1446417444.13111032.1658777648586.JavaMail.zimbra@raptorengineeringinc.com>
 <20220725204217.GU25951@gate.crashing.org>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] drm/amdgpu: Re-enable DCN for 64-bit powerpc
In-Reply-To: <20220725204217.GU25951@gate.crashing.org>
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
Cc: =?UTF-8?Q?Dan_Hor=c3=a1k?= <dan@danny.cz>, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, amd-gfx <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexdeucher@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/25/22 13:42, Segher Boessenkool wrote:
> On Mon, Jul 25, 2022 at 02:34:08PM -0500, Timothy Pearson wrote:
>>>> Further digging shows that the build failures only occur with compilers
>>>> that default to 64-bit long double.
>>>
>>> Where the heck do we have 'long double' things anywhere in the kernel?
>>>
>>> I tried to grep for it, and failed miserably. I found some constants
>>> that would qualify, but they were in the v4l colorspaces-details.rst
>>> doc file.
>>>
>>> Strange.
>>
>> We don't, at least not that I can see.  The affected code uses standard doubles.
>>
>> What I'm wondering is if the compiler is getting confused between standard and long doubles when they are both the same bit length...
> 
> The compiler emits the same code (DFmode things, double precision float)
> in both cases, and it itself does not see any difference anymore fairly
> early in the pipeline.  Compare to int and long on most 32-bit targets,
> both are SImode, the compiler will not see different types anymore:
> there *are* no types, except in the compiler frontend.
> 
> It only happens for powerpc64le things, and not for powerpc64 builds.
> 
> It is probably a GCC problem.  I don't see what forces the GCC build
> here to use 64-bit long double either btw?  Compilers build via buildall
> have all kinds of unnecessary things disabled, but not that, not
> directly at least.
> 

 From what little documentation I can find, there appears to be
"--with-long-double-128" and "--with-long-double-format=ieee".
That looks like something that would need to be enabled, not disabled.

FWIW, depending on compiler build options such as the above for kernel
builds seems to be a little odd to me, and I am not sure I'd want to
blame gcc if the kernel wants to be built with 128-bit floating point
as default. At the very least, that should be documented somewhere,
and if possible the kernel should refuse to build if the compiler build
options don't meet the requirements.

Guenter
