Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBE76C6677
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 12:24:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj30T29Y2z3f6K
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 22:24:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QOuLeGnf;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QOuLeGnf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QOuLeGnf;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QOuLeGnf;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj2zX0Yzxz3cgm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 22:24:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679570644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3N+CKRtfUVJAYw78KROWLKzIsho1cqPaJZ2vvMVYpHM=;
	b=QOuLeGnfhVd0R+wQb18SaKwL21WdgPtbbc2OFUROeDg9g089+CMdDu6fExSzREfTzMPIHX
	ag8kOvJD4+VDIdOpgwDWi1yzTG0NZpIhx8UTKjlybWN0fejw+sd0QwLPSjtqagvF9GiE5U
	45t4fJVjO/VPdzCCIq0I7WJnTVdTKoc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679570644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3N+CKRtfUVJAYw78KROWLKzIsho1cqPaJZ2vvMVYpHM=;
	b=QOuLeGnfhVd0R+wQb18SaKwL21WdgPtbbc2OFUROeDg9g089+CMdDu6fExSzREfTzMPIHX
	ag8kOvJD4+VDIdOpgwDWi1yzTG0NZpIhx8UTKjlybWN0fejw+sd0QwLPSjtqagvF9GiE5U
	45t4fJVjO/VPdzCCIq0I7WJnTVdTKoc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-jcc2RUPPN-iT9vHXvbQqxw-1; Thu, 23 Mar 2023 07:24:02 -0400
X-MC-Unique: jcc2RUPPN-iT9vHXvbQqxw-1
Received: by mail-wr1-f72.google.com with SMTP id b14-20020a05600003ce00b002cfefd8e637so2519214wrg.15
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 04:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679570641;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3N+CKRtfUVJAYw78KROWLKzIsho1cqPaJZ2vvMVYpHM=;
        b=xCoDzt5QBRnK+zWxjIZZZetC8EiIV9kFZO2uOyqMu13cqVciLhrAyZoJ1ay22STOH3
         92EHpcJqwVt+nr0lCYOdM0n7WiMHkvOfgExlXAlyWlbo8tjYLARWkZH0JdgERaO6YrRu
         o1m92+GXt7VMNcd6Fy4/kgruMiuUjRia72KJCjkFrNSQRi5tCAP9wvjx9FgE4sJpDpi/
         +k4u2FZH3U0aQPUPQa1jPIkAS7FXUBw+Weg3YVCZJHbg8GEcgBxv/J4eHFdt8DJyqYMR
         KIB3eWmkNFz/vfu/yLSwAyn74oKrmzDRHZP/kYOkvjRyCmKCwZ8+DzcUzwg+UVVjB+GU
         8avw==
X-Gm-Message-State: AAQBX9dKz/A3fWaS1WLXXSi87ybHoBYbdBTVrNfCQx8d5nuU4m/jFRa/
	mZWFdv+HbvZrS7Z7zOOXy+/0LnWNLcBZcmzUEC1ZujPdSHJe3pT0NtXvVusz2gLL4AgxIUzWUcC
	9qFsOGou/K5DmnBw8kFkVhFRVkA==
X-Received: by 2002:a5d:4848:0:b0:2d2:3b59:cbd4 with SMTP id n8-20020a5d4848000000b002d23b59cbd4mr1989627wrs.12.1679570641661;
        Thu, 23 Mar 2023 04:24:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350bvcuszABwhnciDhZmUHoYcWm5BDwzo6Ssfedx3Ofwchw0V4Xwy8PJwJe8IGH0zzAZyKxkT5g==
X-Received: by 2002:a5d:4848:0:b0:2d2:3b59:cbd4 with SMTP id n8-20020a5d4848000000b002d23b59cbd4mr1989617wrs.12.1679570641433;
        Thu, 23 Mar 2023 04:24:01 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-146.web.vodafone.de. [109.43.179.146])
        by smtp.gmail.com with ESMTPSA id n16-20020adffe10000000b002cfe63ded49sm15962459wrr.26.2023.03.23.04.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 04:24:00 -0700 (PDT)
Message-ID: <a99184db-430e-624f-5c6b-44f773aab6d4@redhat.com>
Date: Thu, 23 Mar 2023 12:23:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [kvm-unit-tests v2 01/10] MAINTAINERS: Update powerpc list
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20230320070339.915172-1-npiggin@gmail.com>
 <20230320070339.915172-2-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230320070339.915172-2-npiggin@gmail.com>
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

On 20/03/2023 08.03, Nicholas Piggin wrote:
> KVM development on powerpc has moved to the Linux on Power mailing list,
> as per linux.git commit 19b27f37ca97d ("MAINTAINERS: Update powerpc KVM
> entry").
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 649de50..b545a45 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -79,7 +79,7 @@ M: Laurent Vivier <lvivier@redhat.com>
>   M: Thomas Huth <thuth@redhat.com>
>   S: Maintained
>   L: kvm@vger.kernel.org
> -L: kvm-ppc@vger.kernel.org
> +L: linuxppc-dev@lists.ozlabs.org
>   F: powerpc/
>   F: lib/powerpc/
>   F: lib/ppc64/

Reviewed-by: Thomas Huth <thuth@redhat.com>

