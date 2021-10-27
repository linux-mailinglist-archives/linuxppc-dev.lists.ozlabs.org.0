Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1898443C832
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 12:59:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfQgJ0JFXz303H
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 21:59:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VFDdqoLF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VFDdqoLF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=VFDdqoLF; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=VFDdqoLF; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfQfX1YNgz2xXm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 21:58:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635332317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qj8iuBeW+SwYxG4JX9Q8fVc5FJNZbXtV8v6zQfHvcBQ=;
 b=VFDdqoLFpHp3gZBdvOFFIuwfOMbDx6VgbBrOEXLPcMwV7s2qs7fmU5q5V2O9vweVD2lHVu
 vXr3s+6mZJqCcLDeUHAaP8Wvp1S3GTRykbKL91PVXOor7fb/JbAEhzinYhPHMcRPe4MoIC
 /JvbC/X0uOrv1bC67oQ+EaaWwnajap0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635332317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qj8iuBeW+SwYxG4JX9Q8fVc5FJNZbXtV8v6zQfHvcBQ=;
 b=VFDdqoLFpHp3gZBdvOFFIuwfOMbDx6VgbBrOEXLPcMwV7s2qs7fmU5q5V2O9vweVD2lHVu
 vXr3s+6mZJqCcLDeUHAaP8Wvp1S3GTRykbKL91PVXOor7fb/JbAEhzinYhPHMcRPe4MoIC
 /JvbC/X0uOrv1bC67oQ+EaaWwnajap0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-5W9iv6GYPRaRhVjA6-LoTg-1; Wed, 27 Oct 2021 06:58:33 -0400
X-MC-Unique: 5W9iv6GYPRaRhVjA6-LoTg-1
Received: by mail-ed1-f70.google.com with SMTP id
 v9-20020a50d849000000b003dcb31eabaaso1925985edj.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 03:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qj8iuBeW+SwYxG4JX9Q8fVc5FJNZbXtV8v6zQfHvcBQ=;
 b=KhPYE0U2SF0N990NqMlpAKnRYa47ndK45u8D6bcI5IZ419UCj6Yr9wQTZjLc7wvEBU
 Ik4fN+Yr14JWFXLLGdMNxWxVYb4myHBmPWCEOitiduaae0hn5s2cD2cO+rKxtM5Jv41Y
 o8nknRW6zucliNcJ6busKuEKxOx+dtKuXpQZGh3dMIy1FgkJmyio9HPXymtzMPUk190s
 XTx43BpcvFCzcYTOnthVvHBFYaVT9Q3VjtRDwDzFMDY2na8DgutpVc08vGrbQxUmdu1E
 N+2BOTl6ycdnew30+WNhxeFE9qaPLzAkJgT7XVyBiWW6pQWmAEJHv35V8J3QLj+8Gpz7
 ebVA==
X-Gm-Message-State: AOAM530gjJkYqCyHrnNYhhA99K635Y6wskfK7WRFORIQ9sqL2EyDmX+x
 M7WPxYkLCv0amJ4jwd6Dq8PRsH9wS5HPpHCtSDAiP4/bMRPZBKnThnUxGQ3y+d3y10B5LT6cV3v
 jXgjyS7pe+zW5aBsqeeL8YmVR5w==
X-Received: by 2002:a50:fd93:: with SMTP id o19mr521155edt.174.1635332312317; 
 Wed, 27 Oct 2021 03:58:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8+o6dvUUaSaBXx8qz7NmzfUaR6FGeBVuoZSngvvAw9kfQvVWaceKd6ZFZNCZp9huNPMjDeg==
X-Received: by 2002:a50:fd93:: with SMTP id o19mr521126edt.174.1635332312094; 
 Wed, 27 Oct 2021 03:58:32 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p25sm12439125edt.23.2021.10.27.03.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 03:58:31 -0700 (PDT)
Message-ID: <1216740e-ba36-4f9b-d393-d6364c545a09@redhat.com>
Date: Wed, 27 Oct 2021 12:58:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] MAINTAINERS: Update powerpc KVM entry
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 paulus@samba.org
References: <20211027061646.540708-1-mpe@ellerman.id.au>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211027061646.540708-1-mpe@ellerman.id.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
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
Cc: kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, npiggin@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27/10/21 08:16, Michael Ellerman wrote:
> Paul is no longer handling patches for kvmppc.
> 
> Instead we'll treat them as regular powerpc patches, taking them via the
> powerpc tree, using the topic/ppc-kvm branch when necessary.
> 
> Also drop the web reference, it doesn't have any information
> specifically relevant to powerpc KVM.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>   MAINTAINERS | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ca6d6fde85cf..fbfd3345c40d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10260,11 +10260,8 @@ F:	arch/mips/include/uapi/asm/kvm*
>   F:	arch/mips/kvm/
>   
>   KERNEL VIRTUAL MACHINE FOR POWERPC (KVM/powerpc)
> -M:	Paul Mackerras <paulus@ozlabs.org>
> -L:	kvm-ppc@vger.kernel.org
> -S:	Supported
> -W:	http://www.linux-kvm.org/
> -T:	git git://github.com/agraf/linux-2.6.git
> +L:	linuxppc-dev@lists.ozlabs.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
>   F:	arch/powerpc/include/asm/kvm*
>   F:	arch/powerpc/include/uapi/asm/kvm*
>   F:	arch/powerpc/kernel/kvm*
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks Michael and Paul!

Paolo

