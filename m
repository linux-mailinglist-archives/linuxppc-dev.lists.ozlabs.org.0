Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8516D75CAF6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 17:09:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NbArCk/u;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NbArCk/u;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6tHp33kqz3cbh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 01:09:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NbArCk/u;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NbArCk/u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6tG23jh3z3c7K
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 01:07:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689952054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2LT31EnQdwzSm3B5EwQJfjJehEaFosn84rDtB5FWxnI=;
	b=NbArCk/uVETr7FGx3n6NZP6Q+FqYZIGaM2sJynHi57b4KIobeOGnHYxBfHaUVs2SwlrZrY
	YmvLfGR6qTMk7mSz1820n770HRrK0mFMkJQG6q9S8yGna2tsolsOKc240wm7s4fuZV5+Wr
	ExPOSeCJE76J/bSvqxfKXq+GkwOD4gY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689952054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2LT31EnQdwzSm3B5EwQJfjJehEaFosn84rDtB5FWxnI=;
	b=NbArCk/uVETr7FGx3n6NZP6Q+FqYZIGaM2sJynHi57b4KIobeOGnHYxBfHaUVs2SwlrZrY
	YmvLfGR6qTMk7mSz1820n770HRrK0mFMkJQG6q9S8yGna2tsolsOKc240wm7s4fuZV5+Wr
	ExPOSeCJE76J/bSvqxfKXq+GkwOD4gY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-kfR2M1uJNKKtMbzd4VCNOQ-1; Fri, 21 Jul 2023 11:07:32 -0400
X-MC-Unique: kfR2M1uJNKKtMbzd4VCNOQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-51e10b6148cso2526636a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 08:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689952051; x=1690556851;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2LT31EnQdwzSm3B5EwQJfjJehEaFosn84rDtB5FWxnI=;
        b=V0UCL8XG0CzCRULbC7hyARtM3zos1gOOAWQgkocbgaWIZCUSBXQlSpPrklt8mJboID
         gpy4wEeTGUzK7+0C+kzjgqVs9R31NG3I6kagnrvf3+VkEM5wdy8XRj8e7ncIRgqOOzOF
         floXLmAbZ3uoZT8hopPIZcZC2HYa2OqPUqGFznRsjW+Z1RDjWba292JF2hwI11RZD5Ys
         7vAeyZZxO9c6QahY9svE/PIIfNOKlSvFIeYuyf6cRl0VSMYkK1vYmqNEzULBEtjpeyRo
         jd2KiggozHPpT+Di+OMtNmjZw8p5Hhi4xfM6ApU8ki66ZUaxaTlwDCWf7wlt5jD4UFDd
         n5Ow==
X-Gm-Message-State: ABy/qLb0Tb3IS5iD4il1gkVLu8DsE6E4un3uLFOQZod7tvqmMSdhwUft
	h+tWv+h7Rb6Ns8QhmdmRX9JPus9pXReqpSNud7cL+SREOaj4ePDHKd3b/JDf9ZBIl+n9vktOCwp
	IjxDSSxjdUwzkdRFiwcxdOLwOZg==
X-Received: by 2002:a05:6402:3596:b0:521:ae30:787d with SMTP id y22-20020a056402359600b00521ae30787dmr8297794edc.21.1689952051254;
        Fri, 21 Jul 2023 08:07:31 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEmyaXBPPcDeACqrampuhZk7coBp7sKkHctpw4dd03JKW9PMu58s3JgUnfUUPbC+bjZ7T2rgQ==
X-Received: by 2002:a05:6402:3596:b0:521:ae30:787d with SMTP id y22-20020a056402359600b00521ae30787dmr8297753edc.21.1689952050947;
        Fri, 21 Jul 2023 08:07:30 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id w10-20020aa7d28a000000b00521f4ee396fsm127596edq.12.2023.07.21.08.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 08:07:30 -0700 (PDT)
Message-ID: <84a908ae-04c7-51c7-c9a8-119e1933a189@redhat.com>
Date: Fri, 21 Jul 2023 17:07:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v11 13/29] KVM: Add transparent hugepage support for
 dedicated guest memory
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-14-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230718234512.1690985-14-seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, linux-security-module@vger.kernel.org, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, kvmarm@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/19/23 01:44, Sean Christopherson wrote:
>   
> @@ -413,6 +454,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
>   	u64 flags = args->flags;
>   	u64 valid_flags = 0;
>   
> +	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
> +		valid_flags |= KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
> +

I think it should be always allowed.  The outcome would just be "never 
have a hugepage" if thp is not enabled in the kernel.

Paolo

