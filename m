Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7C2942B3C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 11:51:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dn9sN+xK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dn9sN+xK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYnRg4pFqz3d8M
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 19:51:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dn9sN+xK;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dn9sN+xK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYnQz4Sw5z3cnt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 19:50:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722419445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kF8YsGqLWNT4+a8R4w4P9MUEGEAYWYiYSABna27uXpU=;
	b=Dn9sN+xK/9kb1KlEyll9wIL7D8CDK+qVdUmD7CDfGK1eS01n5lGZRKIuKeXkBzNiP50FEF
	B1ZvTRWefeVdCaNexmXIIq33F2K5fG0Teg1MK+QZHdxCUtA/YddJmZhR/RPB07l0on8Lf/
	prR2eTGPSJyxOlmo7xNoWa6L2gw1aI0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722419445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kF8YsGqLWNT4+a8R4w4P9MUEGEAYWYiYSABna27uXpU=;
	b=Dn9sN+xK/9kb1KlEyll9wIL7D8CDK+qVdUmD7CDfGK1eS01n5lGZRKIuKeXkBzNiP50FEF
	B1ZvTRWefeVdCaNexmXIIq33F2K5fG0Teg1MK+QZHdxCUtA/YddJmZhR/RPB07l0on8Lf/
	prR2eTGPSJyxOlmo7xNoWa6L2gw1aI0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-BZcErFsCMAGHOeUzbsFIIQ-1; Wed, 31 Jul 2024 05:50:41 -0400
X-MC-Unique: BZcErFsCMAGHOeUzbsFIIQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a7ab81eea72so477816466b.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 02:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722419440; x=1723024240;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kF8YsGqLWNT4+a8R4w4P9MUEGEAYWYiYSABna27uXpU=;
        b=tzFiYsAk/SBr6MNsryyjrn4m8AwfQk2r8Qsmkp39M6AkAc/J/35Mh+Kr8lUWn30Ib+
         dEe0tZttNr+rquiuI4IBp5w3VQUm4oYFKrNmgCTCHyiFCWkt2ZszvG5eSNroNTuvWfAC
         EoK34t+ZMt3+18b/eu5SmLKLvsN3yMoWLkoY66f49wgW7qbMIt0l7Bno4TxD3BmYsyS3
         pWcvZL4kDXmqupORG3zN0Aj9tA8SPj1LiT/KuYMjMx9TuJD+/itdd4EKwyXOtEd0Jfwb
         hZajYIgfv11ljEarZ2iz7KcbRQHvokVnvEQoQ14HnQOeDpBkTSRKuTDvNjXLkEaAoz2o
         FESw==
X-Forwarded-Encrypted: i=1; AJvYcCU0YkZcVjzLuQoMX0IWrRjQETk/EzdHAJZse2vCzPeGG9io2055Ou5/mKvRbeCOqPWsJ9orv5laC/yX6GdHdbxXejBj+z0DtOIaX58AYg==
X-Gm-Message-State: AOJu0YwOah3f1eL82hL3EtAaBeQVWXV4eEd/7xDYceCFYTafBFErP8pu
	Ob6pMJOoLgysZhJE8pg/iLKCbiIs/DGy6602iYGcZNl6yOYvzdUaQI3SbguRHYAlWO/U4ZWmdRs
	P+JIJTAqAqnjL7YN6Y8hTJL4z21kiCpMeJ27nuIVKJGAam32yzgvHLHSTa2yO/bg=
X-Received: by 2002:a17:907:94cb:b0:a7a:bece:6223 with SMTP id a640c23a62f3a-a7d3ff7b8e4mr1064730266b.6.1722419440605;
        Wed, 31 Jul 2024 02:50:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHm0sw2f7Q/hSxPLtTI3KYQw5uCrmW/NKDuI5rQ7HlgfsjazxGbnWK3KS2H8Xhx5SNKvtVQug==
X-Received: by 2002:a17:907:94cb:b0:a7a:bece:6223 with SMTP id a640c23a62f3a-a7d3ff7b8e4mr1064728266b.6.1722419440130;
        Wed, 31 Jul 2024 02:50:40 -0700 (PDT)
Received: from [192.168.10.81] ([151.95.101.29])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7acad93105sm746255566b.167.2024.07.31.02.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 02:50:39 -0700 (PDT)
Message-ID: <57ba7e1d-0121-4d71-89b8-c61c476ca724@redhat.com>
Date: Wed, 31 Jul 2024 11:50:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 84/84] KVM: Don't grab reference on VM_MIXEDMAP pfns
 that have a "struct page"
To: Sean Christopherson <seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-85-seanjc@google.com>
 <992c4a07-fb84-42d8-93b3-96fb3a12c8e0@redhat.com>
 <ZqlLWl0R1p41CS0O@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <ZqlLWl0R1p41CS0O@google.com>
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

On 7/30/24 22:21, Sean Christopherson wrote:
> On Tue, Jul 30, 2024, Paolo Bonzini wrote:
>> On 7/27/24 01:52, Sean Christopherson wrote:
>>> Now that KVM no longer relies on an ugly heuristic to find its struct page
>>> references, i.e. now that KVM can't get false positives on VM_MIXEDMAP
>>> pfns, remove KVM's hack to elevate the refcount for pfns that happen to
>>> have a valid struct page.  In addition to removing a long-standing wart
>>> in KVM, this allows KVM to map non-refcounted struct page memory into the
>>> guest, e.g. for exposing GPU TTM buffers to KVM guests.
>>
>> Feel free to leave it to me for later, but there are more cleanups that
>> can be made, given how simple kvm_resolve_pfn() is now:
> 
> I'll revisit kvm_resolve_pfn(), Maxim also wasn't a fan of a similar helper that
> existed in v11.

FWIW kvm_resolve_pfn() is totally fine as an intermediate step.  Just 
food for thought for possible follow-ups.

>> Also, check_user_page_hwpoison() should not be needed anymore, probably
>> not since commit 234b239bea39 ("kvm: Faults which trigger IO release the
>> mmap_sem", 2014-09-24) removed get_user_pages_fast() from hva_to_pfn_slow().
> 
> Ha, I *knew* this sounded familiar.  Past me apparently came to the same
> conclusion[*], though I wrongly suspected a memory leak and promptly forgot to
> ever send a patch.  I'll tack one on this time around.

As you prefer.

Paolo

