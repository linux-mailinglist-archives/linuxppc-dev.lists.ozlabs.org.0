Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C461A77D8EF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 05:20:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=s3C8ACJj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQYKn3vywz3cTQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 13:20:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=s3C8ACJj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=jniethe5@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQYJw4NJ2z2yVd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 13:19:27 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-686f1240a22so6005152b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 20:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692155964; x=1692760764;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zx6N9SoWNF/u8V+Sw75Ge9zPmSloa2YLfzZtVAyqGyY=;
        b=s3C8ACJj/lDPCCddh1QoxVHfewVO7396V2p0GBnixVGYMJKuEn8LI1f58ij29dTrPT
         aTccs/sE4GUWui4HNce/CCxS3/5UXv/C5xU/IFQ6gHV+yUxcP2D9vM3mdXtwDuLZJR76
         aeIIrXMhonKMbDxjGvoDN3XN3NYmOVgTiTKtTYcZ7C+mOJN5JoJa/6fgnaqqTgR6PGEU
         F5VeaQLA0AtEtPLQsYlkB8X2tHqquPgrTYXkIFupBNn1b6/DOavYgJ6FfEsCgQQkz0Hl
         AtjFbDDRP9YtWXtX0qb1EZicp1a0WzT2G1KYBJ7UZRWyuDTFqkNtFUqsC3xlGvM8IF+1
         ZyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692155964; x=1692760764;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zx6N9SoWNF/u8V+Sw75Ge9zPmSloa2YLfzZtVAyqGyY=;
        b=G1HveO3ow4GdS2qUBZ+58lV/v5GMgJyidVE2D8PDp5o0QnrhpdF6pUH0FsHhMxyOLO
         TPXz+SWZFJYJ1HaloBhsJUpxt4lZZtvlc8WtfNHVshEHR9OWhZ2A8+0zNz18ZkJwZ1/p
         GX3AmWA5/X88vLb4jzxxZ+QGZYKfn9USHrHO8tyWQxXiA8j/Alc5vPeUPPZq2eFZe2ZY
         Q9mqtQMQY/1hJ+RpBoPG/lQEyANnHnrE4AQWCYpHRvTWT5GhMChfrQ+pqnXLDc1qzYKe
         FA9UWL8FTUMvMVOGjBgYUVb1nuID9TrSkuV2/A4gszY8I3OX3UxdEmOQqSgLUO8Ocop8
         eJXw==
X-Gm-Message-State: AOJu0Yw96UhQarLEO6DBk8zXDhUxsdMRW7K6Qck+ZdRu4WkqnhFdTdSx
	/vAuMnoJGehIEU+4swJRYLw=
X-Google-Smtp-Source: AGHT+IEsefrY5bIASd4gMz3zA3GYRyya7JFTsszT0s4RlXNEyyyIpIa7AqHk4qYms/LNviBFAwlnpw==
X-Received: by 2002:a05:6a00:22d0:b0:676:ad06:29d7 with SMTP id f16-20020a056a0022d000b00676ad0629d7mr971769pfj.15.1692155964000;
        Tue, 15 Aug 2023 20:19:24 -0700 (PDT)
Received: from localhost.localdomain ([146.112.118.69])
        by smtp.gmail.com with ESMTPSA id m22-20020aa78a16000000b00686f048bb9dsm122891pfa.74.2023.08.15.20.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 20:19:23 -0700 (PDT)
Subject: Re: [PATCH v3 4/6] KVM: PPC: Book3s HV: Hold LPIDs in an unsigned
 long
To: David Laight <David.Laight@ACULAB.COM>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20230807014553.1168699-1-jniethe5@gmail.com>
 <20230807014553.1168699-5-jniethe5@gmail.com>
 <014488c6d90446f38154a2f7645aa053@AcuMS.aculab.com>
From: Jordan Niethe <jniethe5@gmail.com>
Message-ID: <1b187307-596d-392f-45a6-3da2c9aa20d9@gmail.com>
Date: Wed, 16 Aug 2023 13:19:17 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <014488c6d90446f38154a2f7645aa053@AcuMS.aculab.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: "mikey@neuling.org" <mikey@neuling.org>, "sbhat@linux.ibm.com" <sbhat@linux.ibm.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "amachhiw@linux.vnet.ibm.com" <amachhiw@linux.vnet.ibm.com>, "gautam@linux.ibm.com" <gautam@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>, "vaibhav@linux.ibm.com" <vaibhav@linux.ibm.com>, "kconsul@linux.vnet.ibm.com" <kconsul@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 14/8/23 6:15 pm, David Laight wrote:
> From: Jordan Niethe
>> Sent: 07 August 2023 02:46
>>
>> The LPID register is 32 bits long. The host keeps the lpids for each
>> guest in an unsigned word struct kvm_arch. Currently, LPIDs are already
>> limited by mmu_lpid_bits and KVM_MAX_NESTED_GUESTS_SHIFT.
>>
>> The nestedv2 API returns a 64 bit "Guest ID" to be used be the L1 host
>> for each L2 guest. This value is used as an lpid, e.g. it is the
>> parameter used by H_RPT_INVALIDATE. To minimize needless special casing
>> it makes sense to keep this "Guest ID" in struct kvm_arch::lpid.
>>
>> This means that struct kvm_arch::lpid is too small so prepare for this
>> and make it an unsigned long. This is not a problem for the KVM-HV and
>> nestedv1 cases as their lpid values are already limited to valid ranges
>> so in those contexts the lpid can be used as an unsigned word safely as
>> needed.
> 
> Shouldn't it be changed to u64?

This will only be for 64-bit PPC so an unsigned long will always be 64 
bits wide, but I can use a u64 instead.

> 
> 	David
>   
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 
