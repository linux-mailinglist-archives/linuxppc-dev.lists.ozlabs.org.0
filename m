Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ACF85D669
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 12:03:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y6SAPo/o;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KIvLhM0z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tftgc5G3Lz3vhX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 22:03:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y6SAPo/o;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KIvLhM0z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfrXC53qMz3c9r
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 20:27:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708507636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JqDQzqQUNVGgLXFQ47h2MyrP+vNxqZ2Sfg76FoOL2Z4=;
	b=Y6SAPo/own6Y9bMWQqiGU4Gj2QqVahyM30URvU9hT6XBnsWh29MwZDWGcBeJJ66IEOQp9O
	oEva/PvNNe1iHgCDppDKeqEPLYDYQbd27bIFJ70P6AxJ+Z3uAMQO5iEmmiTAA2+fA1DYuz
	Y7JeIWGAydRBNj7Ph4d4HFXj0fwLRfA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708507637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JqDQzqQUNVGgLXFQ47h2MyrP+vNxqZ2Sfg76FoOL2Z4=;
	b=KIvLhM0ztkmFlLycv4SnnVDF+7pS93ddoeYdkMvmQBN5GCvgGliY1OHPoXL4ArLbr+F7Df
	Jt8n5vIiBz1lMbG9E4WmAF6KQ1YoLYzxGaHSFzN0FyfxpJgqRAAeiifB2BEQX7AltcOI1X
	cYB3490bjaVw39DiYCj0ZQYOkj7iRSM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-XwRY4r7jPNm_JlGP0ZJFFg-1; Wed, 21 Feb 2024 04:27:14 -0500
X-MC-Unique: XwRY4r7jPNm_JlGP0ZJFFg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4126c262040so9744535e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 01:27:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708507632; x=1709112432;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqDQzqQUNVGgLXFQ47h2MyrP+vNxqZ2Sfg76FoOL2Z4=;
        b=aq1kJ64QXS36sD3krGkDyVHYfJRH9oulrPBjHHGpQoFAbV26kbLX6pUkGFYDf6u+xu
         Ice4upxJOsBx5VxJUw636QiVLJ3AqNSVB4nuk/4dnsD7f4fwkI+2qLE3rkpw4rvMe0xV
         3TCYrt+0VM9UG+kDVKQpR/VRBTLKdz/aZatgu+2FWbY7CvdKTMAoGVrjxBiFDVW67Xik
         UupDwQT11jLL3ny3TwAd2pV9syp/qc6BD9i2tdZWFaHzJFBYw5RIJs4JtR//ygmn3Pym
         rBqsg32cFStf1UHMwZXM8c/mQ3BN4WaFDc23lxFeftdypAQn25LPyUpnskbfm7sE4JD2
         CIAw==
X-Forwarded-Encrypted: i=1; AJvYcCWdZ7T8OQuEcXJqpB//YVUYypxHUn58qxGWJ3ciX9ib7kmRs9TGg9CKm5kxiYH9RcCEfg2FPEcwragK0O0RF6A8o6eSVpjOpP+zPhD7Qw==
X-Gm-Message-State: AOJu0YyYhtH6IfkvdpeZLMQcUjlBUmM4/FSTH/Xs4PShOetdprQLnaXe
	Tnv3YTMs/Tc11E1qLPez5Um0tJ9+VzX9k1T2JZw6h7SdgHBG9yyh/WdnuT9LUgeiV9v3r9dbDGL
	L5ukKhUhdSi/tPcf/8Natxpei/rYuVRFrT+z7onMfZS5gEl8ET2o0TgPnUWnpmzQ=
X-Received: by 2002:a05:600c:19c7:b0:412:5296:9737 with SMTP id u7-20020a05600c19c700b0041252969737mr13136592wmq.12.1708507632028;
        Wed, 21 Feb 2024 01:27:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ7FuH/em5oiRt/ZTOR4oMLbXYFTRabnhBDn5rQM4tupeTaNWMPYn2RFDHXi6wWaSGqKntiQ==
X-Received: by 2002:a05:600c:19c7:b0:412:5296:9737 with SMTP id u7-20020a05600c19c700b0041252969737mr13136504wmq.12.1708507631270;
        Wed, 21 Feb 2024 01:27:11 -0800 (PST)
Received: from [10.32.64.237] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id jj2-20020a05600c6a0200b004126732390asm1837805wmb.37.2024.02.21.01.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 01:27:10 -0800 (PST)
Message-ID: <cf5409c3-254a-459b-8969-429db2ec6439@redhat.com>
Date: Wed, 21 Feb 2024 10:27:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] mm: pgalloc: support address-conditional pmd
 allocation
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Maxwell Bland <mbland@motorola.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20240220203256.31153-1-mbland@motorola.com>
 <20240220203256.31153-3-mbland@motorola.com>
 <838a05f0-568d-481d-b826-d2bb61908ace@csgroup.eu>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <838a05f0-568d-481d-b826-d2bb61908ace@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 21 Feb 2024 21:59:20 +1100
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "ast@kernel.org" <ast@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "ryabinin.a.a@gmail.com" <ryabinin.a.a@gmail.com>, "guoren@kernel.org" <guoren@kernel.org>, "sdf@google.com" <sdf@google.com>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "wuqiang.matt@bytedance.com" <wuqiang.matt@bytedance.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "vincenzo.frascino@arm.com" <vincenzo.frascino@arm.com>, "will@kernel.org" <will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>, "michael.christie@oracle.com" <michael.christie@oracle.com>, "quic_nprakash@quicinc.com" <quic_nprakash@quicinc.com>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "hch@infradead.o
 rg" <hch@infradead.org>, "arnd@arndb.de" <arnd@arndb.de>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "andrii@kernel.org" <andrii@kernel.org>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "urezki@gmail.com" <urezki@gmail.com>, "samitolvanen@google.com" <samitolvanen@google.com>, "zlim.lnx@gmail.com" <zlim.lnx@gmail.com>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "dennis@kernel.org" <dennis@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "cl@linux.com" <cl@linux.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "meted@linux.ibm.com" <meted@linux.ibm.c
 om>, "quic_pkondeti@quicinc.com" <quic_pkondeti@quicinc.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "surenb@google.com" <surenb@google.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "dvyukov@google.com" <dvyukov@google.com>, "andreyknvl@gmail.com" <andreyknvl@gmail.com>, "haoluo@google.com" <haoluo@google.com>, "brauner@kernel.org" <brauner@kernel.org>, "mjguzik@gmail.com" <mjguzik@gmail.com>, "lstoakes@gmail.com" <lstoakes@gmail.com>, "song@kernel.org" <song@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "muchun.song@linux.dev" <muchun.song@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "awheeler@motorola.com" <awheeler@motorola.com>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "tj@kernel.org" <tj@kern
 el.org>, "glider@google.com" <glider@google.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "rick.p.edgecombe@intel.com" <rick.p.edgecombe@intel.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21.02.24 08:13, Christophe Leroy wrote:
> 
> 
> Le 20/02/2024 à 21:32, Maxwell Bland a écrit :
>> [Vous ne recevez pas souvent de courriers de mbland@motorola.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>
>> While other descriptors (e.g. pud) allow allocations conditional on
>> which virtual address is allocated, pmd descriptor allocations do not.
>> However, adding support for this is straightforward and is beneficial to
>> future kernel development targeting the PMD memory granularity.
>>
>> As many architectures already implement pmd_populate_kernel in an
>> address-generic manner, it is necessary to roll out support
>> incrementally. For this purpose a preprocessor flag,
> 
> Is it really worth it ? It is only 48 call sites that need to be
> updated. It would avoid that processor flag and avoid introducing that
> pmd_populate_kernel_at() in kernel core.

+1, let's avoid that if possible.

-- 
Cheers,

David / dhildenb

