Return-Path: <linuxppc-dev+bounces-6512-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 262A5A469EB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 19:38:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z33C60WcPz3bmJ;
	Thu, 27 Feb 2025 05:38:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740595121;
	cv=none; b=RkTAWTjkaImU0QqdQW1NI1GWfBms9CGR/ZDXLNb4dA0igLMt/zNcDGAkEUGwZnAysqfJes8+vElxgboVZMl96BwEbRFtLaecDzzwecoBWA3zsvLHZzrri1ArzTFPFO+MKUHgpzfF+geSZRmjc/3HvUwhEXJnzr8bUFvNc8RKzzeVoIC7YAIVA1Pi10osK7KE+t5KbRzxegDu1w/BdVRiv6dB+nny+m4ddBQofGtK0034xg2GAR9P8ei5i3pRzHOOrihBhnmUtcj3UcBIzmBZPQ9lOdCdNM5tPTt7e1uK2gis01Gelsk/PPYsB6fsMSDCZyjdkSMMLobEdLIvmubehA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740595121; c=relaxed/relaxed;
	bh=Po4dipnmwfGs5ho6Uar/3eIBvd8Wea1v5VEnmsiU7UA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8nJ9JrbPiReTXhL4oIItXKVa2CsRqBtjv+HkVZCHvRqf7kkqVwT9KwAXOpIqV8JgAai6Osj+W2drgeoqSYlL/yq4YuL/hY7ISWj8ucecmwuXJkAdYxPUeiOQ0jjdlfZT2jrFPFjhq38/UXVCxBTeycMEZTqdxaZkpeFBGb1GBJhf8270ZgT1FWq7H2pfPZ+BmzbPMSKgxTHGWUH/jpDrq5gp5DJTOSp2IvrFLECkE2c5FR36moyX32OYKipvuh+aeSs5m+HF831e+q10A3ZoPfnHRCpCIUvZ0PeDZFIEpFzib07P+hHrA3wOJuLIRbYtlYtA5TyIT4GfAHeO3J2YA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CshK/79d; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CshK/79d; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CshK/79d;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CshK/79d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z33C46C6jz30WS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2025 05:38:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740595114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Po4dipnmwfGs5ho6Uar/3eIBvd8Wea1v5VEnmsiU7UA=;
	b=CshK/79dTXTwicjtWzFtbfjANHpjKM/rUCnXCIdneOO60dN2mbQa6rBRLuKi+U4JVgsDRg
	QnVNFX9tEkMwgxljigJm0ZvvmVLjrsSF4iLZM8I7QaeB6XS6P1IkF9xClx3aGmDi/ng0Zu
	sxUCEhhwURSlbd/tazmasZMqjF3OFNw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740595114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Po4dipnmwfGs5ho6Uar/3eIBvd8Wea1v5VEnmsiU7UA=;
	b=CshK/79dTXTwicjtWzFtbfjANHpjKM/rUCnXCIdneOO60dN2mbQa6rBRLuKi+U4JVgsDRg
	QnVNFX9tEkMwgxljigJm0ZvvmVLjrsSF4iLZM8I7QaeB6XS6P1IkF9xClx3aGmDi/ng0Zu
	sxUCEhhwURSlbd/tazmasZMqjF3OFNw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-QSV8ORScMuiTDN91jvghMg-1; Wed, 26 Feb 2025 13:38:31 -0500
X-MC-Unique: QSV8ORScMuiTDN91jvghMg-1
X-Mimecast-MFC-AGG-ID: QSV8ORScMuiTDN91jvghMg_1740595110
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-abef9384a3bso4895466b.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 10:38:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740595109; x=1741199909;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Po4dipnmwfGs5ho6Uar/3eIBvd8Wea1v5VEnmsiU7UA=;
        b=aRm7NNeUOCUDsB9M1FpXMIUPmQINQeboTTdCMJK1wonksf+RdHggHvM5JVho8hmEl8
         ZT3E94cDn6TyjalkVFsJcwJPiK4hc8TFT1jJSISIYUwOM1QQPBWw1d/TzBoa+CshIUon
         J6s/7CttBv9I7UqiH1xlC5s2PH6n7OM9lpwmgq3N4eBRITmCTrqcle8uqqIo0Bp+uASX
         4sjXCW7jc6Sj1WQhZ5Pn/QDll2rumsJOTXPFvFBrvulCgq4SmZDvzVgjnqrCqYeHnSIf
         y8HvdOBj7/vvDsH6FMnCPxf14gAL0i2otZOzVDc9H8NUKGpLIC2g8HheH0J7R5hdUNMP
         szMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYWve/4rTbecKcXLjR9T+z0pTFHACgZgwlOF5ASoPy+XPCCh5GKY8LOTvYDpeMrGPl325Fs2s433XigGo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxFiCqgEdHD8h2Fwssw2xwfyCI/AtSXLZxtw9UcrIQvUY/vXlYC
	dGj12LJnWF55aJ5KA2KNGbOUx0HE1ekKlKt8LzUQ5ovd9u9sVBOfT603zbKRQkg6abVG5VWdaDH
	hK8c84XEE/0RxRFKKK87VDZ1h06M2JU23kdIbZQpw0ib69czosGeeYiNPyFtu/Jo=
X-Gm-Gg: ASbGncvIKWvOTgp9YnJkP5eAjBRmSyvlvq42NpfNoPmeNNRAEOwC9g/xrX4/cIv15nI
	FldUkQGY+UGjxdPdEGQfE/s2EgzEKmQFZiv0WBtBo3czBhkja9UfGKJjUuM4E80CcPdnKJvPhP5
	z45h3cFpUm8UmsBgd32k3ppb08FOddh0D9it7KQW8ll0RqfJkENbre0ATWJxdbGAMc5hFDzgbWx
	RFXUfqGdpjNJdySF9oa4iK6BiIEFWGJrS+OQHVwH4aAiUz+HOEM0sFwNCdYaBzMAdCwuRPgPMZ8
	U5ca+qVvF3NlQc0urcIx
X-Received: by 2002:a17:906:6185:b0:ab7:c1d5:14f9 with SMTP id a640c23a62f3a-abeeecf6f63mr518736566b.10.1740595109605;
        Wed, 26 Feb 2025 10:38:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCDnvlNLlcOiBeBNB6S3TtqOxMTUK/PR46JW7lLq0KgREP2FusBvOHa60dTZ6MWayPAjFhrw==
X-Received: by 2002:a17:906:6185:b0:ab7:c1d5:14f9 with SMTP id a640c23a62f3a-abeeecf6f63mr518730666b.10.1740595109199;
        Wed, 26 Feb 2025 10:38:29 -0800 (PST)
Received: from [192.168.10.81] ([176.206.102.52])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abed20ac11bsm364226166b.163.2025.02.26.10.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 10:38:28 -0800 (PST)
Message-ID: <be33873f-ae4e-4db9-bca4-e83e8d4b39c3@redhat.com>
Date: Wed, 26 Feb 2025 19:38:21 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] KVM: x86: nVMX IRQ fix and VM teardown cleanups
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>,
 Yan Zhao <yan.y.zhao@intel.com>,
 Rick P Edgecombe <rick.p.edgecombe@intel.com>,
 Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
References: <20250224235542.2562848-1-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250224235542.2562848-1-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _4l6PRJdxKfaaTdwz1BBBZKZB4QoSbSzB3MB8l33k60_1740595110
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2/25/25 00:55, Sean Christopherson wrote:
> This was _supposed_ to be a tiny one-off patch to fix a nVMX bug where KVM
> fails to detect that, after nested VM-Exit, L1 has a pending IRQ (or NMI).
> But because x86's nested teardown flows are garbage (KVM simply forces a
> nested VM-Exit to put the vCPU back into L1), that simple fix snowballed.
> 
> The immediate issue is that checking for a pending interrupt accesses the
> legacy PIC, and x86's kvm_arch_destroy_vm() currently frees the PIC before
> destroying vCPUs, i.e. checking for IRQs during the forced nested VM-Exit
> results in a NULL pointer deref (or use-after-free if KVM didn't nullify
> the PIC pointer).  That's patch 1.
> 
> Patch 2 is the original nVMX fix.
> 
> The remaining patches attempt to bring a bit of sanity to x86's VM
> teardown code, which has accumulated a lot of cruft over the years.  E.g.
> KVM currently unloads each vCPU's MMUs in a separate operation from
> destroying vCPUs, all because when guest SMP support was added, KVM had a
> kludgy MMU teardown flow that broken when a VM had more than one 1 vCPU.
> And that oddity lived on, for 18 years...

Queued patches 1 and 2 to kvm/master, and everything to kvm/queue 
(pending a little more testing and the related TDX change).

Paolo


