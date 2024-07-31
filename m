Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 561F0942BBA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 12:12:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S7e2Tu2c;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S7e2Tu2c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYnvS1wd9z30W0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 20:12:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S7e2Tu2c;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S7e2Tu2c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYntl0gG5z30W0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 20:11:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722420683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tVOY32nDLXc6iJSQkl0LgklBYr2OAHTjSvree4scyEk=;
	b=S7e2Tu2cc0bk5Q+eB7nTMa04pr1ySQi9Hp4Lgupdh1ZY7sPFGeNBAtr3cBBNW+2RJVdULA
	YpopWi61jOvltMS7epk/eV8qaVkeJrrO0bi61QDjvO2gnhfHxcXVIj92bUYcKiq294v9WO
	i6CwlX031RHQK6vfsP7RuPpKdyAgq6o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722420683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tVOY32nDLXc6iJSQkl0LgklBYr2OAHTjSvree4scyEk=;
	b=S7e2Tu2cc0bk5Q+eB7nTMa04pr1ySQi9Hp4Lgupdh1ZY7sPFGeNBAtr3cBBNW+2RJVdULA
	YpopWi61jOvltMS7epk/eV8qaVkeJrrO0bi61QDjvO2gnhfHxcXVIj92bUYcKiq294v9WO
	i6CwlX031RHQK6vfsP7RuPpKdyAgq6o=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-qvnKJ-edOwy-NrGCIsKoiQ-1; Wed, 31 Jul 2024 06:11:21 -0400
X-MC-Unique: qvnKJ-edOwy-NrGCIsKoiQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a7a8a38a4bcso246445966b.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 03:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722420680; x=1723025480;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVOY32nDLXc6iJSQkl0LgklBYr2OAHTjSvree4scyEk=;
        b=A7bDoPL6tIdGXjQDzweXowB7L89xU36c+sZUhncUVl8vP7jwReHdQLe7h4uxGaDbrG
         tu9nFcLii9e5uusQEkbzIQybQfEfdVVxMfOceCvo04Wi2z22hEhY+RCxId3kS438+gA6
         5SLpTSxYj8JW4NCxRtjmBIeZnaEUM1HXOHE/pO1eltM01tpcUn2NP4Y/OE9hb1SzMhU0
         sVyaiJeA0BUlBhx+B+slLWEdjdFuiRZ/8ltdCI9By1Nk9lx11zOtAmafVwtKCh12BPY9
         CutbpMJQn5kE2cd5QnzdmSDo2v7Lp+d4ZTNWgKoaRnz/7L2ZVQWBrVLB6U3u7jEOATTA
         T5/g==
X-Forwarded-Encrypted: i=1; AJvYcCXckLJxyJ6oB/45glLessKGqgylDMKIT/KwzRqToEos+6fY40gR4ytczxfi0x103RfNxwGtCN+zvQjPl1agb47wRx6O6IC6bh8jJtFMiQ==
X-Gm-Message-State: AOJu0YwHEDLTDNY5JNPM3Kya7uaQxRp3ohMo4ojJXcIbZ5tTBpkcVnr7
	GTel0zrQpd7MAxS4ZXxGCwC+r3SaTilgYk0eTgtGoC4I2cRLPviJHwg0Jrtqur5hjzbeUizj1nt
	Mh+jXdI/UCHFCXhJpi/LT5jt4l7oQrQnHuwi5q9/XXRV3RkqhBD+Rwxzlgh1sbyQ=
X-Received: by 2002:a05:6402:1e93:b0:5a2:97d7:c728 with SMTP id 4fb4d7f45d1cf-5b01d84be21mr14060534a12.0.1722420680272;
        Wed, 31 Jul 2024 03:11:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5ltltaZS4FNkIqSYTQjIEvClgTY8vCephyRSRLNCT8UhCNDO85YiJ57LsvbZOjsbL8Hv0Cg==
X-Received: by 2002:a05:6402:1e93:b0:5a2:97d7:c728 with SMTP id 4fb4d7f45d1cf-5b01d84be21mr14060501a12.0.1722420679761;
        Wed, 31 Jul 2024 03:11:19 -0700 (PDT)
Received: from [192.168.10.81] ([151.95.101.29])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5af3ad32a9bsm7111674a12.53.2024.07.31.03.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 03:11:19 -0700 (PDT)
Message-ID: <a0418ced-260b-4b14-9124-c94ce46a0944@redhat.com>
Date: Wed, 31 Jul 2024 12:11:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 34/84] KVM: Add a helper to lookup a pfn without
 grabbing a reference
To: Sean Christopherson <seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-35-seanjc@google.com>
 <63c41e25-2523-4397-96b4-557394281443@redhat.com>
 <ZqlJxJyOdsR206Zc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <ZqlJxJyOdsR206Zc@google.com>
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, David Stevens <stevensd@chromium.org>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/30/24 22:15, Sean Christopherson wrote:
> On Tue, Jul 30, 2024, Paolo Bonzini wrote:
>> On 7/27/24 01:51, Sean Christopherson wrote:
>>> Add a kvm_follow_pfn() wrapper, kvm_lookup_pfn(), to allow looking up a
>>> gfn=>pfn mapping without the caller getting a reference to any underlying
>>> page.  The API will be used in flows that want to know if a gfn points at
>>> a valid pfn, but don't actually need to do anything with the pfn.
>>
>> Can you rename the function kvm_gfn_has_pfn(), or kvm_gfn_can_be_mapped(),
>> and make it return a bool?
> 
> Heh, sure.  I initially planned on having it return a bool, but I couldn't figure
> out a name, mainly because the kernel's pfn_valid() makes things like
> kvm_gfn_has_valid_pfn() confusing/misleading :-(
> 
>> (As an aside, I wonder if reexecute_instruction() could just use
>> kvm_is_error_hva(kvm_vcpu_gfn_to_hva(vcpu, gpa_to_gfn(gpa)) instead of going
>> all the way to a pfn.  But it's ok to be more restrictive).
> 
> Heh #2, I wondered the same thing.  I think it would work?  Verifying that there's
> a usable pfn also protects against retrying an access that hit -EHWPOISON, but I'm
> prety sure that would require a rare race, and I don't think it could result in
> the guest being put into an infinite loop.

Indeed, and even the check in kvm_alloc_apic_access_page() is totally 
useless.  The page can go away at any time between the call and 
vmx_set_apic_access_page_addr() or, for AMD, the #NPF on 
APIC_DEFAULT_PHYS_BASE.

Yes, it's verifying that the system isn't under extreme memory pressure, 
but in practice a 4K get_user_pages is never going to fail, it's just 
going to cause something else to be swapped.  I'd just get rid of both 
of them, so there's no need for kvm_lookup_pfn().

Paolo

