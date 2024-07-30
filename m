Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B8C941133
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 13:53:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hf5X5npP;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hf5X5npP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYDBN5VmTz3ckp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 21:53:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hf5X5npP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hf5X5npP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYD9j4gnRz3cgl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 21:52:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722340341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kBFBIKd1rJgOI9YcivSLfU1/eAHX+x0Dw4M+NCBYe5U=;
	b=Hf5X5npPCSB3TJunaCO7/yEglHaWSbpLOg7or/hkRqXSVOyYZtkyK6hgC1QIR1Kbxl8Vqh
	TAmCGanWbuTWf/HB4k3YG4ySXy0RM62Cu7nTnqsSuEzg/YyaEz/ndYnKnuOsKhnvfwY/CH
	HR23bPkVSPAn+IKNNdhRtEu0J5XT5X0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722340341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kBFBIKd1rJgOI9YcivSLfU1/eAHX+x0Dw4M+NCBYe5U=;
	b=Hf5X5npPCSB3TJunaCO7/yEglHaWSbpLOg7or/hkRqXSVOyYZtkyK6hgC1QIR1Kbxl8Vqh
	TAmCGanWbuTWf/HB4k3YG4ySXy0RM62Cu7nTnqsSuEzg/YyaEz/ndYnKnuOsKhnvfwY/CH
	HR23bPkVSPAn+IKNNdhRtEu0J5XT5X0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-WlJ4FkvlOK-nZfkW9lSQCQ-1; Tue, 30 Jul 2024 07:52:19 -0400
X-MC-Unique: WlJ4FkvlOK-nZfkW9lSQCQ-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5a7661b251aso4674166a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 04:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722340338; x=1722945138;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBFBIKd1rJgOI9YcivSLfU1/eAHX+x0Dw4M+NCBYe5U=;
        b=TbsvJ/Pr+qUX3aYtnwNJaBYjDOI9SpJpZcNKwolMKaPKuJTHcp839326LS7qvvLWvT
         14EPOiGpFvpW/YR4wLMqIYwTYNyU5cozCJ+LSxFB7j9eJ9T+cBt8BM+XgT530BC7tScp
         v3F5HfrL7JEZkzpQJUG4jmDt1NwZ4pIK94RohHegYaFoQ3KTt2ew/slVoMiqYs8AdD6D
         mNXGY4x/nFE4P94ED529tb3AHkL9WAxICR8VOa1xKHstY6jkSpMWZDGzfz8uo3ep5eQQ
         yIHj0ArolnOBpmp7FrBGbPOrvYTUv9cz6GXfdEULEXsajh04OM8DQFAd7SH1WQeOA2sE
         nGIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYkEbJtVBWt/C6AcRWA3W2b7JOQM33FV1LtFeInx6qqyGaftOrZI2PiZsGGCgOLWvNrsxzyOAOuppxgUKaqWHHXoAg3DkGzSSFCLITJQ==
X-Gm-Message-State: AOJu0YwXw2T+4SwytHX20tQE30eKXi/FFtAdOiq+2Ubdrd3IV99CJtlw
	7G0/6DuHImCrPQTyWrcCKGaTPJrYNOv0pAZU/C9GwZ6DgiBAjTC2EnP/4ezSd8vMVJMbHfuWiLO
	dB+rNq7M9ePbXaDLDxjEWd3NJ8RWWmOcDsfxO/xZC/lMUcUnJfyGzuvb8zrZGrJ4=
X-Received: by 2002:a50:d742:0:b0:5a1:6c50:a35 with SMTP id 4fb4d7f45d1cf-5b022b8cd30mr5926679a12.37.1722340338219;
        Tue, 30 Jul 2024 04:52:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBJKwuTl3GcCc5YuDbeqMD1zDkMcs4VmkJUQMAj6w6PoPQ2QTlBUJ4IvJ66qrB4FTpUDSGzA==
X-Received: by 2002:a50:d742:0:b0:5a1:6c50:a35 with SMTP id 4fb4d7f45d1cf-5b022b8cd30mr5926669a12.37.1722340337692;
        Tue, 30 Jul 2024 04:52:17 -0700 (PDT)
Received: from [192.168.10.47] ([151.95.101.29])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5b0044c72d4sm5211327a12.70.2024.07.30.04.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 04:52:17 -0700 (PDT)
Message-ID: <419ea6ce-83ca-413e-936c-1935e2c51497@redhat.com>
Date: Tue, 30 Jul 2024 13:52:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 00/84] KVM: Stop grabbing references to PFNMAP'd pages
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
References: <20240726235234.228822-1-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
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
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, loongarch@lists.linux.dev, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/27/24 01:51, Sean Christopherson wrote:
> arm64 folks, the first two patches are bug fixes, but I have very low
> confidence that they are correct and/or desirable.  If they are more or
> less correct, I can post them separately if that'd make life easier.  I
> included them here to avoid conflicts, and because I'm pretty sure how
> KVM deals with MTE tags vs. dirty logging will impact what APIs KVM needs
> to provide to arch code.
> 
> On to the series...  The TL;DR is that I would like to get input on two
> things:
> 
>   1. Marking folios dirty/accessed only on the intial stage-2 page fault
>   2. The new APIs for faulting, prefetching, and doing "lookups" on pfns

Wow!

Splitting out prefetching makes a lot of sense, as it's the only one 
with npages > 1 and it doesn't need all the complexity of hva_to_pfn().

I've left a comment on the lookup API, which is probably the only one 
that can be simplified further.

The faulting API looks good as a first iteration.  Code-wise, 
kvm_resolve_pfn() is probably unnecessary at the end of the series but I 
can see why you had to restrain yourself and declare it done. :)

An interesting evolution of the API could be to pass a struct 
kvm_follow_pfn pointer to {,__}kvm_faultin_pfn() and __gfn_to_page() 
(the "constructors"); and on the other side to 
kvm_release_faultin_page() and kvm_release_page_*().  The struct 
kvm_follow_pfn could be embedded in the (x86) kvm_page_fault and 
(generic) kvm_host_map structs.  But certainly not as part of this 
already huge work.

Paolo

