Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF22759C74
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 19:35:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cvh+trag;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cvh+trag;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5jdN0zS5z3bX9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 03:35:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cvh+trag;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cvh+trag;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5jcR5Nxbz303d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 03:34:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689788068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FcSmUlnfPR5r9QDVWlDed1kmwKvJ4NFeMyH/cuBuG7c=;
	b=Cvh+tragkf+T0rHRmvwpvoEMk9zEO8CgA4qftNJW85sfIdE39bzgvFDQSK4mZ/I4ehg103
	kQxFnVQau3YdpDyzNPqMiVVCyoBj7IwXQRUaMOEL/TQQ1l4wjAGXFe6XwW8Zwhovi6e2do
	es0X1RSM+OPpa0IYFwUW50dcFLTOkPw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689788068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FcSmUlnfPR5r9QDVWlDed1kmwKvJ4NFeMyH/cuBuG7c=;
	b=Cvh+tragkf+T0rHRmvwpvoEMk9zEO8CgA4qftNJW85sfIdE39bzgvFDQSK4mZ/I4ehg103
	kQxFnVQau3YdpDyzNPqMiVVCyoBj7IwXQRUaMOEL/TQQ1l4wjAGXFe6XwW8Zwhovi6e2do
	es0X1RSM+OPpa0IYFwUW50dcFLTOkPw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-smdF0TuePV25Il8cPPJ-Yg-1; Wed, 19 Jul 2023 13:34:26 -0400
X-MC-Unique: smdF0TuePV25Il8cPPJ-Yg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-978a991c3f5so421417766b.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 10:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689788065; x=1692380065;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FcSmUlnfPR5r9QDVWlDed1kmwKvJ4NFeMyH/cuBuG7c=;
        b=M6l1mMpBKi0CD+/jYZ7iE3OZ6lzr17HPxtQCmjnvLEquAHXNdLLX41lXPQqWFc0XES
         VTamfLTydb0kPTzyUWNEV0AeOb3joaT4j/gLOUwcuc27/oUpX/y1Dci1gDoAdIgD6Gid
         0vuaixro3vZaV/LCef50Ud1zdD8+7Ks4UUxGaiGGdg+xJjKuUgx8qlsMzBE7WVwHPIls
         R0OADxvalMjM9tiME66izMe7rdmpVZRYmg4Xy/P8GxQekW5PDwadynxDFikvc6sNHnVG
         j4rsh2XQuDfRjvIjL6OAkW8R70JL1QlSNgPgBc5vmnrTNi8uNDtZ7F3WHONMzVfkKwPG
         nTJg==
X-Gm-Message-State: ABy/qLbNcDwttdwGH5gSxxr5ysuKbtjsCOGh0YbGRgUxsebUDFNLGBFr
	9TZZ7CYpMqvEm3iKDo6PUesA/BM/fQTxVYBeEiVJpidwRGUf5QgJ3bLZXU+9w6MhZMvahcyYI73
	jArxDWuYR0IC64XlUmAFqwsuxHA==
X-Received: by 2002:a17:906:2c9:b0:987:6372:c31f with SMTP id 9-20020a17090602c900b009876372c31fmr2869617ejk.37.1689788065623;
        Wed, 19 Jul 2023 10:34:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE859wKxHT5sx+ykGb2dhB/IoiUODuwlK2Yw9t+Sd2xKiIGoiM0e7JvZWSr4FhhJlM9v/AU5Q==
X-Received: by 2002:a17:906:2c9:b0:987:6372:c31f with SMTP id 9-20020a17090602c900b009876372c31fmr2869597ejk.37.1689788065328;
        Wed, 19 Jul 2023 10:34:25 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.googlemail.com with ESMTPSA id gz18-20020a170906f2d200b00991faf3810esm2633958ejb.146.2023.07.19.10.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 10:34:24 -0700 (PDT)
Message-ID: <cd866d4c-839a-8606-2931-063cca4df514@redhat.com>
Date: Wed, 19 Jul 2023 19:34:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Alexander Graf <graf@amazon.de>, Nicholas Piggin <npiggin@gmail.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-5-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH v11 04/29] KVM: PPC: Drop dead code related to
 KVM_ARCH_WANT_MMU_NOTIFIER
In-Reply-To: <20230718234512.1690985-5-seanjc@google.com>
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
> Signed-off-by: Sean Christopherson<seanjc@google.com>
> ---
>   arch/powerpc/kvm/powerpc.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 7197c8256668..5cf9e5e3112a 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -634,10 +634,11 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_SYNC_MMU:
>   #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
>   		r = hv_enabled;

This could actually be unnecessarily conservative.  Even book3s_pr.c 
knows how to do unmap and set_spte, so it should be able to support 
KVM_CAP_SYNC_MMU.  Alex, Nick, do you remember any of this?  This would 
mean moving KVM_CAP_SYNC_MMU to virt/kvm/kvm_main.c, which is nice.

Paolo

> -#elif defined(KVM_ARCH_WANT_MMU_NOTIFIER)
> -		r = 1;
>   #else
> -		r = 0;
> +#ifndef KVM_ARCH_WANT_MMU_NOTIFIER
> +		BUILD_BUG();
> +#endif
> +		r = 1;
>   #endif
>   		break;
>   #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE

