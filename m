Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D91484F164
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 09:33:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EivJWL74;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hg3usC9E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWRvF1KxYz3cQT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 19:33:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EivJWL74;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hg3usC9E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWRtS5YZtz30hQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 19:32:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707467549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=n1+bf0Nx8c8mDk6BEeuFlVUau/1lVtJgwfFu+gol4dA=;
	b=EivJWL747+qqFCDJFAHBBfO82hfqmnVFfvfnLZDA4lVCD/X2S9GZyaZ0TViGVInHMpErbR
	ZtHMQYtKsRt2atmQ67WTSILePhMdKjyHkBexjU9KUl9bEV2eSZFj4bbqnh6Eh3k1wnyMim
	dNk1eQfFu1D2pyzVazraK8oG0GCKtmg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707467550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=n1+bf0Nx8c8mDk6BEeuFlVUau/1lVtJgwfFu+gol4dA=;
	b=Hg3usC9ERjGs9gSGWr9mnkDcajOaP76FvBC2KIHFi1oCqsG6dc3dYtgMBE8D8IgzkVOfQY
	OW4LnZflc1TeaoKXB/DwNQYqwkH1h7tVhvarVhZObfY8y4vigB18OtESLR8cyh2qnCnGaD
	rCsRIPGBho5K9xk7XDIN5jn1lc23XlI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-Cu0z0QZ_N2WdKw-E9ucOIw-1; Fri, 09 Feb 2024 03:32:26 -0500
X-MC-Unique: Cu0z0QZ_N2WdKw-E9ucOIw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a26f2da3c7bso38028366b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Feb 2024 00:32:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707467545; x=1708072345;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n1+bf0Nx8c8mDk6BEeuFlVUau/1lVtJgwfFu+gol4dA=;
        b=O/TwVqYwF0nsqetM724BrOFppz+kyus00hOOp1YgMd6BxN8A7nfFRcfhXkvc95eE1q
         INH5IDwNhUymvFs+co3yJgF7Bb973HZHV34YT9Og/DeSpyaLNc5gEwVHqiLuhDOyWYRm
         xEgSTWmt6ICJPRGvqjIN1Br+e6UmjgYoNOLlD3ndDBW7/g15TEcU1U0ORMSeoJqCrSJ5
         oKQ7/N2kdHUME8FUwobVTjC3G+QhkmeJoOC0rfjsz5j5rth58j2F/FIqje/LPI7HTULw
         w0lPcJL1RijSAG3OQaAbUnrCVFETeDtOTkLvyE//o7NdXrSjfy+gePCiqPV73bn9hrrZ
         CDTA==
X-Forwarded-Encrypted: i=1; AJvYcCV3SyAIth6Syn6NKWSJc7JeGBdSox8cnhrVXQ2rpg0WKKZIsDxdCsTGXO31K/FsVLGZn9jPauMbAb4rQn0HPtQNMjdNvfvlVKrxyxNj5w==
X-Gm-Message-State: AOJu0YyGkOVmPfrEpg7feies5DmOQSU1zP5SYU/9W4cjCX9pLzPp207o
	cmwC5OH2uQPzTyRz4fLB4hDAa+Vr/FJuiIcUjahKa50fEjCJB/pl7lrWIMlLb6YiFNQs0fIBpWR
	JruSqPAOpxCn0bMIrw6CMhRt6No02zYxj27NOcyFWzHO25bmnRw5kIpgJ+hp/ps0=
X-Received: by 2002:a17:906:f25a:b0:a38:7541:36f6 with SMTP id gy26-20020a170906f25a00b00a38754136f6mr534592ejb.21.1707467545419;
        Fri, 09 Feb 2024 00:32:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/T6YYLfzbp3yhYxtgIsbBvBi9OmPusrYwMtKL4j3WI45fIZaoPgiu1tQyIJoywazyiWjlKA==
X-Received: by 2002:a17:906:f25a:b0:a38:7541:36f6 with SMTP id gy26-20020a170906f25a00b00a38754136f6mr534582ejb.21.1707467545120;
        Fri, 09 Feb 2024 00:32:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWXiUg04J0xyZA2xGb9Fu4y0ntNnaZfu5u3wCECya3Mj6SWlZwp5ICs3/Ov2/qiL9su432EHDvLiVJ0KuNjkJ9dA+qBka4y8ssadh6OiEJ5wpy1En3Fx6anCAdFa7L7MQ/5WVXwqd08bOmyybu5k7Qp1UMvIypUKIMPgtveVcd/GscsLTNJxkC7CaS/yJcLRXIRobE2cKHHIHL5sNoJ059E+mN1EgspRqxG1jLZpHKIRYudg+rhDdl4OtfFPow7/DAAcE/0UIo+I6M8OqxAw4LzeRm++4M4N032W3p0NvaLAdALIWIF/bz89lF45wQXVnsgVCFvipJxUOfJqVQ+tLKDf7Dm8rNEogN2oEb+qJl5xCTmAsxN0sSXNr0ar2u0ZxLikYF3QyLVUj9CsgOiEbIs2k7zhC71oFP6Eq0BDU/dVGAP0Ip74uqtYXDZDXYkmdNY01V18wx696yEfj1s7ZfgIstsNWb5OHSzpU25dubiYvEDA39m6AxMqZD8gr65Yuhuq60pdfoXeVeQ9K7ds7G3+Qqc
Received: from [192.168.0.9] (ip-109-43-177-145.web.vodafone.de. [109.43.177.145])
        by smtp.gmail.com with ESMTPSA id tb5-20020a1709078b8500b00a35e3202d81sm519996ejc.122.2024.02.09.00.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 00:32:24 -0800 (PST)
Message-ID: <32a940e0-2b6d-489d-b987-41d640d04dd0@redhat.com>
Date: Fri, 9 Feb 2024 09:32:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v3 8/8] migration: add a migration selftest
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240209070141.421569-1-npiggin@gmail.com>
 <20240209070141.421569-9-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240209070141.421569-9-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09/02/2024 08.01, Nicholas Piggin wrote:
> Add a selftest for migration support in  guest library and test harness
> code. It performs migrations a tight loop to irritate races and bugs in

"*in* a tight loop" ?

> the test harness code.
> 
> Include the test in arm, s390, powerpc.
> 
> Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com> (s390x)
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> This has flushed out several bugs in developing the multi migration test
> harness code already.
> 
> Thanks,
> Nick
> 
>   arm/Makefile.common          |  1 +
>   arm/selftest-migration.c     |  1 +
>   arm/unittests.cfg            |  6 ++++++
>   common/selftest-migration.c  | 34 ++++++++++++++++++++++++++++++++++
>   powerpc/Makefile.common      |  1 +
>   powerpc/selftest-migration.c |  1 +
>   powerpc/unittests.cfg        |  4 ++++
>   s390x/Makefile               |  1 +
>   s390x/selftest-migration.c   |  1 +
>   s390x/unittests.cfg          |  4 ++++
>   10 files changed, 54 insertions(+)
>   create mode 120000 arm/selftest-migration.c
>   create mode 100644 common/selftest-migration.c
>   create mode 120000 powerpc/selftest-migration.c
>   create mode 120000 s390x/selftest-migration.c
> 
> diff --git a/arm/Makefile.common b/arm/Makefile.common
> index f828dbe0..f107c478 100644
> --- a/arm/Makefile.common
> +++ b/arm/Makefile.common
> @@ -5,6 +5,7 @@
>   #
>   
>   tests-common  = $(TEST_DIR)/selftest.$(exe)
> +tests-common += $(TEST_DIR)/selftest-migration.$(exe)
>   tests-common += $(TEST_DIR)/spinlock-test.$(exe)
>   tests-common += $(TEST_DIR)/pci-test.$(exe)
>   tests-common += $(TEST_DIR)/pmu.$(exe)
> diff --git a/arm/selftest-migration.c b/arm/selftest-migration.c
> new file mode 120000
> index 00000000..bd1eb266
> --- /dev/null
> +++ b/arm/selftest-migration.c
> @@ -0,0 +1 @@
> +../common/selftest-migration.c
> \ No newline at end of file
> diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> index fe601cbb..1ffd9a82 100644
> --- a/arm/unittests.cfg
> +++ b/arm/unittests.cfg
> @@ -55,6 +55,12 @@ smp = $MAX_SMP
>   extra_params = -append 'smp'
>   groups = selftest
>   
> +# Test migration
> +[selftest-migration]
> +file = selftest-migration.flat
> +groups = selftest migration
> +
> +arch = arm64

Please swap the last two lines!

>   # Test PCI emulation
>   [pci-test]
>   file = pci-test.flat

With the nits fixed:
Reviewed-by: Thomas Huth <thuth@redhat.com>

