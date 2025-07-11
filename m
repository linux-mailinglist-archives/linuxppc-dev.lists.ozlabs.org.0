Return-Path: <linuxppc-dev+bounces-10193-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1361B01F4C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jul 2025 16:37:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bdvT02hmPz30VR;
	Sat, 12 Jul 2025 00:37:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752244676;
	cv=none; b=chsieVdKLLu40H8urchhzv5ytdQMUfJpbqbq9oXp3GzSyn7qkOhA0zN8TxtiWrQp3cJ/HtJ8dQjwyL9EdexP9vzNBTC6WPVn1LhVBeSjF6UYcfUzsiOaU9jApTV5mOcA1j7rTVwvO9H+eATgllgmhF2rqwks5m+zf0Hdwj79kCw0Q647tkJ+d5ux5sG5M49n4GqRbDd2M/s48OLcByOa/IzN6Agf8hbPFRD7sFnLykQ9R+lY/58+VryibuPo1HarwozsHiMl6Ic8zo3P6C17i9PRXVCITr7f+ErdptMaRKiBmz7yHXrKp3/Bm1Y9utqTThGvsKTYfXQJUI639GWgIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752244676; c=relaxed/relaxed;
	bh=/BU9s+p9vDeup7+iZfjpoY4Y+pfEtPqATP7w87mkUv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PlIfp001nyTOjK1zWKkocHn9KvkFFezIrkesLIp/l8akffdKC+g8msj9sTGHR+Baa2VpCiIOMixE/EWZRaFCYARzYd8W9FsM06xnZWJ4NBowSEMc66toYeqOTRbDaNrGY59EpspyJ5cNUtg7hiEgUqvb5bHaEsuXBVIlgKViZIWjF2fmF+qISphQVSmr7LmeyoZ/HnAtKQXXmm+zQ+aG/+xOemRaGAMJYuRGHu5vP/O1m0w9vnUyTKfI66hz/QEWEfVkZIuKWD0Ab9DmUVqS4bu74JH3tjosEQ0HkZwo5EZXQsTe77lDY9oaKXFEvbC/t96E0Sg5hPeKeCwqHGH7Ug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CvNPoGwl; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CvNPoGwl; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CvNPoGwl;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CvNPoGwl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdvSz2SHmz30MY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Jul 2025 00:37:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752244671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/BU9s+p9vDeup7+iZfjpoY4Y+pfEtPqATP7w87mkUv0=;
	b=CvNPoGwllh33/eyGmdY4dnb/d/zT08Rl+p7ERV4bbfsYcDSmd58FphzKZz5R8L2/HZeATb
	Q/0RHYrNvWPEhZXRHUPRth9HaoFdL9Xv5k5GCdjva7xeICPulM7zB8fAwhM7fhmqbmJDz1
	t8QxGl3HRCdYc7i1+8qu4I5RjwOuo04=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752244671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/BU9s+p9vDeup7+iZfjpoY4Y+pfEtPqATP7w87mkUv0=;
	b=CvNPoGwllh33/eyGmdY4dnb/d/zT08Rl+p7ERV4bbfsYcDSmd58FphzKZz5R8L2/HZeATb
	Q/0RHYrNvWPEhZXRHUPRth9HaoFdL9Xv5k5GCdjva7xeICPulM7zB8fAwhM7fhmqbmJDz1
	t8QxGl3HRCdYc7i1+8qu4I5RjwOuo04=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196--3_xvYADPJWjiXmctsgvHA-1; Fri, 11 Jul 2025 10:37:48 -0400
X-MC-Unique: -3_xvYADPJWjiXmctsgvHA-1
X-Mimecast-MFC-AGG-ID: -3_xvYADPJWjiXmctsgvHA_1752244667
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451d7de4ae3so13302785e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jul 2025 07:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752244667; x=1752849467;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BU9s+p9vDeup7+iZfjpoY4Y+pfEtPqATP7w87mkUv0=;
        b=leIFQiyiLdQUxmatFDrPlqnzBCQUgRNeNbOKQkUN+F9wqO/5gd5PWnpt7moy1jj/pr
         FiAkuxTfz/uQh2wTEk8NsX1vkC1pXRp9RTakpMGVdjYDoGl4Vpdb7LcQGUg08oZRygCX
         nQgynnLXfVTxKY6mIhhGdHAhaS48e2wgk+S+DqBWsj3gbZ5Ps3ZaBD/912JEHVXH4muS
         c8cWI/jr5V2+zMnxCQbzRjbTQcN1nnUEjrDD1r7/hyebBDFK/xPSjZ/oRR53US3evnOK
         SILLJK4ElqNLYRBCN2kPW88ph3p2sJwJqeP94yaVCZ/Kn5SGr6UJvwvagp8OD/Qqry9j
         HWvg==
X-Forwarded-Encrypted: i=1; AJvYcCUg18g0sgPju8CLZLg7c0HbE0nub4zEDNQf5vh0uTj349JR+6c6gttkcwwuBiXDcajdOgxqoyDvTFQVzRE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyWGtnaJin3WX1RMsate1rxtbP2UDyU7pEw6n9BoOQPdlY3O1nu
	TuhCKDya2Txz4A+Fv+t88MXmlwn6UCugn5E5U0BEAex+MkN86YtYATsl0EANbj0fAXFeqscl/Sl
	R63SEkYHD4OqpF6qMVRjb0QOngCDInM1oV8dcP9c0D3h9FKJ0sMTrKEtRVnq82O5xU68=
X-Gm-Gg: ASbGncvPP582J2WHaGh02GTwqjkA329n3WcxQwpeghxzfZzueHNbyaX+ZQLcesILW9Y
	tbW5e2mDLBtqr42aBWQKYcy5RdFKwqYStFO2qe6xCvNQNfPBH3zIQc0hOnljLorxqAu9MqQSwp0
	XfrSd9zRT4SICvYbRUPtY3Q01zO1aEZB/6VI8nA9Q7k3uaoIMmcp0gKOBKAfD8uJpCn+yzwu66i
	UiUPM7JVxV2BKnegPQd5+dHZH2OaRC21TDFZHw9UGQDSvF0cBrycqQ6Gsck5oYRfSgakKfTjYvw
	yxv7t9XAB3s5ekScx41KhSE9MzlSf32EmVPpoobpfgBhcnA0plyBEBpgVnafUSAFOcdwSutT2E3
	95l9Z
X-Received: by 2002:a05:6000:20ca:b0:3a6:d349:1b52 with SMTP id ffacd0b85a97d-3b5f1887badmr2596041f8f.21.1752244666607;
        Fri, 11 Jul 2025 07:37:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXCQnwKJ4P2xru4rDXDie6A6u61embhawOE9E4KtDmPAJ5DNlW7yRl8zSbtPMgPw96iVGU/Q==
X-Received: by 2002:a05:6000:20ca:b0:3a6:d349:1b52 with SMTP id ffacd0b85a97d-3b5f1887badmr2596020f8f.21.1752244666189;
        Fri, 11 Jul 2025 07:37:46 -0700 (PDT)
Received: from [192.168.0.6] (ltea-047-064-115-149.pools.arcor-ip.net. [47.64.115.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cdc4671bsm74502545e9.3.2025.07.11.07.37.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 07:37:45 -0700 (PDT)
Message-ID: <c1b1ca55-13e3-44ff-9889-f31f27501372@redhat.com>
Date: Fri, 11 Jul 2025 16:37:43 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v4 07/13] scripts: Add default arguments
 for kvmtool
To: Andrew Jones <andrew.jones@linux.dev>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, eric.auger@redhat.com,
 lvivier@redhat.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com,
 nrb@linux.ibm.com, david@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, will@kernel.org,
 julien.thierry.kdev@gmail.com, maz@kernel.org, oliver.upton@linux.dev,
 suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com,
 andre.przywara@arm.com, shahuang@redhat.com, Boqiao Fu <bfu@redhat.com>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
 <20250625154813.27254-8-alexandru.elisei@arm.com>
 <ce92db8c-6d26-4953-9f74-142d00d2bc2a@redhat.com>
 <20250711-357d520bb64154cbe119679b@orel>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250711-357d520bb64154cbe119679b@orel>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1GEcine5n6k0SJ87yY92mLYwSfed9gKMVKBelkiMw0k_1752244667
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/07/2025 16.35, Andrew Jones wrote:
> On Fri, Jul 11, 2025 at 01:32:33PM +0200, Thomas Huth wrote:
> ...
>>> +function vmm_default_opts()
>>> +{
>>> +	echo ${vmm_optname[$(vmm_get_target),default_opts]}
>>> +}
>>
>>
>> This causes now a problem on s390x:
>>
>> https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/jobs/10604334029#L591
>>
>> scripts/common.bash: line 56: vmm_defaults_opts: command not found
>>
>> ... any ideas how to fix it?
> 
> This is fixed by https://lore.kernel.org/all/20250709085938.33254-2-andrew.jones@linux.dev/
> which I just pushed.

Ah, right, thanks! And sorry for missing the patch!

  Thomas


