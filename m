Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 380AD52C0F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 19:24:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3KcF0SDcz3cDX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 03:24:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256 header.s=google header.b=QXIHKcoy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=essensium.com (client-ip=2a00:1450:4864:20::634;
 helo=mail-ej1-x634.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QXIHKcoy; dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3KbW3mZYz2xXw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 03:24:04 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id tk15so5125375ejc.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 10:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nOSMeRQ9IOFC/cHF7h/iXHPCI8fOU6NkF/uXwE87O/E=;
 b=QXIHKcoypdwzF96wIGc1c4CSId7WZaF1gdjYzuJVd4Dm9xnk9ZXOUa3zNXqXyvYTJZ
 JFNtkL8kW78vDDBtp338hSFe8zqLYyIJXABILzlLKSBDoTDY5oO8phgC0DwC2CkIaRIc
 Y6OWLFzJJcRlGv9Y1td07dLLYMvIZvOvm8mzAoe5OoWOu8BQ+nyn0lYsM+UFpN+15W9b
 KN8vCZrZ2u9i2sBOs37P5gS156JM1p0TBdf6cM3WNnnDQshMDH8jApckI72k3ogwU2vI
 9I3oJJEJt0mxXXuv1sOKfCxB86FnhOpb+nwy3YCmW7C/sT2tCpAG31DrQy8fjO+Q58TO
 1svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nOSMeRQ9IOFC/cHF7h/iXHPCI8fOU6NkF/uXwE87O/E=;
 b=TeG8UCPCMZAB7k18eN8tRpcVxRUdTlytNIlOc6Kr1uM918km3VQCB6v7EUpBQRmGT9
 /efjGEbWU8GzyJHDnnBehuAWGtx2A96CdCQbmOHvG1FIHppPzJg1nLsmZ7NQZF5/MAaQ
 yzmGu7RZ0Is49zEfT5ltLzjzNcAh03F87GG7G293XonIMlTKl32hA7U/dKBPlrkYVEph
 PAMQyi/vXluzhmTDX+UAudBeLv5aQtk3/5UvZtR4io2sLozM77CbQ63CeFs7fXGwvlix
 hpi1BUV9svApJA6GJU1rlmuYnGpg070GG71lPpxGLkc/ZA/fJprT3BEAhcb+4xIX4weT
 FSFw==
X-Gm-Message-State: AOAM532OQ2n1BECshjO+gS8X9XMp+GHInv2kBqnx2iPlW9z355FNGVKK
 kXaj+/ZrTLpOf8WVAOAwf4ByEg==
X-Google-Smtp-Source: ABdhPJzy68GKpOEIzqSBT2wTahCxefmG7YolupJ1yL+2WvXAGgJ3zWJ2USvPbM3YTcFJ2Rx1se9MSw==
X-Received: by 2002:a17:907:7247:b0:6f9:bb40:efd8 with SMTP id
 ds7-20020a170907724700b006f9bb40efd8mr557790ejc.273.1652894638359; 
 Wed, 18 May 2022 10:23:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 er21-20020a170907739500b006fe50668941sm1160258ejc.158.2022.05.18.10.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 10:23:57 -0700 (PDT)
Message-ID: <693a9659-d2f2-8a74-2402-592a429af336@mind.be>
Date: Wed, 18 May 2022 19:23:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [Buildroot] [PATCH] linux: Fix powerpc64le defconfig selection
Content-Language: en-GB
To: Michael Ellerman <mpe@ellerman.id.au>, Joel Stanley <joel@jms.id.au>
References: <20220510022055.67582-1-joel@jms.id.au>
 <a18d0411-9134-2ee7-62d0-4ba6a1780846@mind.be>
 <87a6bh7h2e.fsf@mpe.ellerman.id.au>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <87a6bh7h2e.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, buildroot@buildroot.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 16/05/2022 15:17, Michael Ellerman wrote:
> Arnout Vandecappelle <arnout@mind.be> writes:
>> On 10/05/2022 04:20, Joel Stanley wrote:
>>> The default defconfig target for the 64 bit powerpc kernel is
>>> ppc64_defconfig, the big endian configuration.
>>>
>>> When building for powerpc64le users want the little endian kernel as
>>> they can't boot LE userspace on a BE kernel.
>>>
>>> Fix up the defconfig used in this case. This will avoid the following
>>> autobuilder failure:
>>>
>>>    VDSO32A arch/powerpc/kernel/vdso32/sigtramp.o
>>>    cc1: error: ‘-m32’ not supported in this configuratioin
>>>    make[4]: *** [arch/powerpc/kernel/vdso32/Makefile:49: arch/powerpc/kernel/vdso32/sigtramp.o] Error 1
>>>
>>>    http://autobuild.buildroot.net/results/dd76d53bab56470c0b83e296872d7bb90f9e8296/
>>>
>>> Note that the failure indicates the toolchain is configured to disable
>>> the 32 bit target, causing the kernel to fail when building the 32 bit
>>> VDSO. This is only a problem on the BE kernel as the LE kernel disables
>>> CONFIG_COMPAT, aka 32 bit userspace support, by default.
>>>
>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>
>>    Applied to master, thanks. However, the defconfig mechanism for *all* powerpc
>> seems pretty broken. Here's what we have in 5.16, before that there was
>> something similar:
>>
>> # If we're on a ppc/ppc64/ppc64le machine use that defconfig, otherwise just use
>> # ppc64_defconfig because we have nothing better to go on.
>> uname := $(shell uname -m)
>> KBUILD_DEFCONFIG := $(if $(filter ppc%,$(uname)),$(uname),ppc64)_defconfig
>>
>>    So I guess we should use a specific defconfig for *all* powerpc.
>>
>>    The arch-default defconfig is generally not really reliable, for example for
>> arm it always takes v7_multi, but that won't work for v7m targets...
> 
> There's a fundamental problem that just the "arch" is not sufficient
> detail when you're building a kernel.

  Yes, which is pretty much unavoidable.

> Two CPUs that implement the same user-visible "arch" may differ enough
> at the kernel level to require a different defconfig.
> 
> Having said that I think we could handle this better in the powerpc
> kernel. Other arches allow specifying a different value for ARCH, which
> then is fed into the defconfig.

  I don't know if it's worth bothering with that. It certainly would not make 
our life easier, because it would mean we need to set ARCH correctly. If we can 
do that, we can just as well set the defconfig correctly.

> That way you could at least pass ARCH=ppc/ppc64/ppc64le, and get an
> appropriate defconfig.
> 
> I'll work on some kernel changes for that.

  I think the most important thing is that it makes no sense to rely on uname 
when ARCH and/or CROSS_COMPILE are set.

  Regards,
  Arnout

> 
> cheers
