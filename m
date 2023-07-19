Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 596D9759B98
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 18:56:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GywAJTHH;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GywAJTHH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5hmW1n6gz30CT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 02:56:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GywAJTHH;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GywAJTHH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5hlX0yv2z2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 02:55:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689785732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ybZMnwXlmIEE0ADI9FsKUlcEynrHTdW2zV41y3cU4q8=;
	b=GywAJTHHLcxJVwUJVakntTMUsC9ImefzxWcs8ba2GGuU7mN0qPIBWmkS6OiMKea8ncFEmX
	GqmxHuyFFHDhYM5yhA6J+t4roOPPCnCIaXDkG4qsKtkkTzaNZ1kPGNB4hsHV+fZywytjKw
	m1nR9lV36gw3ZVAxhygmL3U5yVEGzxY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689785732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ybZMnwXlmIEE0ADI9FsKUlcEynrHTdW2zV41y3cU4q8=;
	b=GywAJTHHLcxJVwUJVakntTMUsC9ImefzxWcs8ba2GGuU7mN0qPIBWmkS6OiMKea8ncFEmX
	GqmxHuyFFHDhYM5yhA6J+t4roOPPCnCIaXDkG4qsKtkkTzaNZ1kPGNB4hsHV+fZywytjKw
	m1nR9lV36gw3ZVAxhygmL3U5yVEGzxY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-DS969UGFMR6SluzLoTruQg-1; Wed, 19 Jul 2023 12:55:30 -0400
X-MC-Unique: DS969UGFMR6SluzLoTruQg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-521a38098faso1732824a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 09:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689785729; x=1692377729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ybZMnwXlmIEE0ADI9FsKUlcEynrHTdW2zV41y3cU4q8=;
        b=MObAnXexYfAd+w471E9I5LCTvbozBRMfOAUz3AfQmM8SyZ8E3HaLSFIqld+n1z/+ow
         3lKcqD3WKlzUD1MmanyicAQYOlbRRJS7z9zM6v0L5NavYpLL+t6IBF+5cuLlpzexdMql
         qMhl8P7a0IBKn4jwNw1hfLb3bw18evs7uXXmEIlkejHhz/y3a3QhinfHv+uE0pgNzA/v
         qgDjUIXqM71Y/jr731sGGjPJ12A0O46Pu/iDlHr3NO+cKyR0RjZmiVL6a5+KhX6w1LXP
         Yso1cYEOsLc/EWPqDv+uVUCSUpkuRfMFLoXFzeev5HVn3n9FoXTx/SggfbC/riTXqbGX
         OSdg==
X-Gm-Message-State: ABy/qLY7gWmL9eYREftMbYS5ZXoAvaSc9+vHYy3FPBiApxNozgJ8fH0i
	8aKy5GPHPgvPIiQzfAEurg0CvYf3Aya/gchDzqFFXTBBLx7F0tm4Vs4fbuZwHVVNvDEui3PaNf5
	a2mvqMlCmQwcVxbDZva4MHYsdZg==
X-Received: by 2002:aa7:df12:0:b0:51e:28e6:3838 with SMTP id c18-20020aa7df12000000b0051e28e63838mr2675097edy.17.1689785729747;
        Wed, 19 Jul 2023 09:55:29 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEE4qOGG9V7ZI8+WFW37awHpPD5aiip3zVhw1ks31Z/kpX3OD6eusNtSgp6OKt44xHjSBz/kg==
X-Received: by 2002:aa7:df12:0:b0:51e:28e6:3838 with SMTP id c18-20020aa7df12000000b0051e28e63838mr2675066edy.17.1689785729461;
        Wed, 19 Jul 2023 09:55:29 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.googlemail.com with ESMTPSA id r18-20020aa7d592000000b0051df5eefa20sm2911736edq.76.2023.07.19.09.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 09:55:28 -0700 (PDT)
Message-ID: <711f74d6-fe15-6bd4-a9b9-c4f178d95bf3@redhat.com>
Date: Wed, 19 Jul 2023 18:55:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v11 01/29] KVM: Wrap kvm_gfn_range.pte in a per-action
 union
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-2-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230718234512.1690985-2-seanjc@google.com>
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
> +	BUILD_BUG_ON(sizeof(gfn_range.arg) != sizeof(gfn_range.arg.raw));
> +	BUILD_BUG_ON(sizeof(range->arg) != sizeof(range->arg.raw));

I think these should be static assertions near the definition of the 
structs.  However another possibility is to remove 'raw' and just assign 
the whole union.

Apart from this,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

> +	BUILD_BUG_ON(sizeof(gfn_range.arg) != sizeof(range->arg));


