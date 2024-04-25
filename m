Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A70188B2652
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 18:23:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=epV2lGUS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQLkS2KkJz3vhv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 02:23:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=epV2lGUS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com; envelope-from=skhan@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQLjh6pB8z3dFm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 02:22:31 +1000 (AEST)
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-7da9f6c9c17so8901639f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Apr 2024 09:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1714062148; x=1714666948; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZwpXS/k0DYed9wD5OBUEJ5ypdpSnZbheBH2rdFMtPA=;
        b=epV2lGUSpCVPE+KTLE4kaFyDP6f/9vcQP1vqqdehB7gOTHisVGNPlhUujeRKblitoH
         l7KIKJ2jRkBFUvWS42yk1n1p/1l/w1lxCCfCWBjf20WTZWeHPYbZ3pqiIsjaWeNAU45v
         lMhZKLfj4ERprYBdb1VWHMVaGyGEXUkzOE4Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714062148; x=1714666948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tZwpXS/k0DYed9wD5OBUEJ5ypdpSnZbheBH2rdFMtPA=;
        b=hgZ8uAofzZaX5+1IBHIHjZDyZVZG5OpuzzyKb/w5Oha8nH1mtw5gjg7DsdeKf1Ndrn
         fr7BjEJuVCHA5fY05ZPXV5m2EEF6+OgVMe5GXl9QD99RUypkoIqiHcBc5Ewo92cuprmO
         ylrS1BmBH06UxbUsKx03wBnz8j9OTwH3g3VJO9U7wU2lZ4YEdFpgttr3d+NlstdBdj/f
         DLrVYcfMANvfHTD4hcJJJRN/UGlI5jY8/PcQXyUQkG8QHXZVpAtHsx+RLOj0Cqd8K1af
         wqTlJj+8shNyAtKs1GDbjTIuEKZW9vEp0z0f+fPO7sgFo0TtMr4D6LA5M3KlkI5THzWT
         tcWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbQooEhzVmVpRZ04p75RB1Tp/lkd3Cp1+draT46DnhjWn1QC/vvQ2HVdu8X31bNfwP/baaUrZseR94+ivu6rLZrkQOdrt+eLPBUZtEig==
X-Gm-Message-State: AOJu0YzVwYV0YxH83lYs355gEVevq7S4nUehlUFdsOS47XK0VgKJKTfP
	BIJRyAi5QCZ2/DSbrhGzHnT5fq8UymkoyQmBWfL1rJN6bwFKQ0OS9ucUm/88B3A=
X-Google-Smtp-Source: AGHT+IFwsbdYoXOctiJAidygEpyjdbBI6reVPMMOFHtDCREzxeaCqAED6LqVik99m0cV8ef76M2rcQ==
X-Received: by 2002:a6b:ea07:0:b0:7da:cdf3:7bec with SMTP id m7-20020a6bea07000000b007dacdf37becmr160971ioc.1.1714062147803;
        Thu, 25 Apr 2024 09:22:27 -0700 (PDT)
Received: from [192.168.43.82] ([223.185.79.208])
        by smtp.gmail.com with ESMTPSA id m2-20020a638c02000000b005e857e39b10sm13196097pgd.56.2024.04.25.09.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 09:22:27 -0700 (PDT)
Message-ID: <763ee03a-817d-4833-b42f-e5b4bd25dc7f@linuxfoundation.org>
Date: Thu, 25 Apr 2024 10:22:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 25/35] KVM: selftests: Convert lib's mem regions to
 KVM_SET_USER_MEMORY_REGION2
To: Sean Christopherson <seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-26-seanjc@google.com>
 <69ae0694-8ca3-402c-b864-99b500b24f5d@moroto.mountain>
 <3848a9ad-07aa-48da-a2b7-264c4a990b5b@linuxfoundation.org>
 <ZipyPYR8Nv_usoU4@google.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ZipyPYR8Nv_usoU4@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, Benjamin Copeland <ben.copeland@linaro.org>, Marc Zyngier <maz@kernel.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Isaku Yamahata <isaku.yamahata@gmail.com>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.c
 om>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?= =?UTF-8?Q?n?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/25/24 09:09, Sean Christopherson wrote:
> On Thu, Apr 25, 2024, Shuah Khan wrote:
>> On 4/25/24 08:12, Dan Carpenter wrote:
>>> On Fri, Oct 27, 2023 at 11:22:07AM -0700, Sean Christopherson wrote:
>>>> Use KVM_SET_USER_MEMORY_REGION2 throughout KVM's selftests library so that
>>>> support for guest private memory can be added without needing an entirely
>>>> separate set of helpers.
>>>>
>>>> Note, this obviously makes selftests backwards-incompatible with older KVM
>>>     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>> versions from this point forward.
>>>     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>
>>> Is there a way we could disable the tests on older kernels instead of
>>> making them fail?  Check uname or something?  There is probably a
>>> standard way to do this...  It's these tests which fail.
>>
>> They shouldn't fail - the tests should be skipped on older kernels.
> 
> Ah, that makes sense.  Except for a few outliers that aren't all that interesting,
> all KVM selftests create memslots, so I'm tempted to just make it a hard requirement
> to spare us headache, e.g.
> 
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index b2262b5fad9e..4b2038b1f11f 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -2306,6 +2306,9 @@ void __attribute((constructor)) kvm_selftest_init(void)
>          /* Tell stdout not to buffer its content. */
>          setbuf(stdout, NULL);
>   
> +       __TEST_REQUIRE(kvm_has_cap(KVM_CAP_USER_MEMORY2),
> +                      "KVM selftests from v6.8+ require KVM_SET_USER_MEMORY_REGION2");
> +
>          kvm_selftest_arch_init();
>   }
> 
> --
> 
> but it's also easy enough to be more precise and skip only those that actually
> create memslots.

This is approach is what is recommended in kselfest document. Rubn as many tests
as possible and skip the ones that can't be run due to unmet dependencies.

> 
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index b2262b5fad9e..b21152adf448 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -944,6 +944,9 @@ int __vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot, uint32_t flag
>                  .guest_memfd_offset = guest_memfd_offset,
>          };
>   
> +       __TEST_REQUIRE(kvm_has_cap(KVM_CAP_USER_MEMORY2),
> +                      "KVM selftests from v6.8+ require KVM_SET_USER_MEMORY_REGION2");
> +
>          return ioctl(vm->fd, KVM_SET_USER_MEMORY_REGION2, &region);
>   }
>   
> @@ -970,6 +973,9 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>          size_t mem_size = npages * vm->page_size;
>          size_t alignment;
>   
> +       __TEST_REQUIRE(kvm_has_cap(KVM_CAP_USER_MEMORY2),
> +                      "KVM selftests from v6.8+ require KVM_SET_USER_MEMORY_REGION2");
> +
>          TEST_ASSERT(vm_adjust_num_guest_pages(vm->mode, npages) == npages,
>                  "Number of guest pages is not compatible with the host. "
>                  "Try npages=%d", vm_adjust_num_guest_pages(vm->mode, npages));
> --

thanks,
-- Shuah
