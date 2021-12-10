Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B04D47032D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 15:54:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9Yns08Lnz3c9K
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 01:54:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=axcBhrYY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::529;
 helo=mail-ed1-x529.google.com; envelope-from=paolo.bonzini@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=axcBhrYY; dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9Yn66Twbz3bXV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 01:53:28 +1100 (AEDT)
Received: by mail-ed1-x529.google.com with SMTP id y12so30102620eda.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 06:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZPopxfZRkg4NTOl+klIySl5FTmEnEGA7/rHJVRlm4p0=;
 b=axcBhrYY5F+b/7Id5o19CVMf16DlNK++Iv+QQkzI9Mnf7ZTRnJCaH9XidNQOFsOBwc
 KF/wXTKGrFlcXFR9QcXh0tmfQaqluH4DlsgXOrJpdK/LJQrYRJUCa1eRc6to96/IwV2B
 BlyqvjvgggseyLJ8qtFA8u7nkulUxlTbfdET3/IxAhjbM4n3l7+In1S5EkRZyqGZl5Ck
 wKgANnRzx+uuEJWvWG98rzsSbQ650jB+d4dvhyUIs42e58MDzXi1cDPbfAvmMlzdfpM0
 BOcEFYO9Tm6j84wjCz2oTA6sCdsavxKcq1hTPn1dIX2c8ATBFG3sdm+KRLTm8NvOgy5R
 pgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZPopxfZRkg4NTOl+klIySl5FTmEnEGA7/rHJVRlm4p0=;
 b=L9jOdQxEMDW9fVyNWYsjgGXc8JYXDr5EgP7/oluPBilr2yyfce7eJ5VvWu4UYzwpEE
 ingJ4qutHuFR+vYcg0/VgiV1IB24imOMDoyq9KybfUg6yCXRjeRZbK9K9FfwYsL40yxe
 gYt7amH0RIitJJMLPfcxHxCin4294vsGelyC0Cpf0uOAC880T2vbcVZW7wGC1ZLmd+ep
 7ArNKFQajCHcpret/3HjPoFA4ELvKuL+k7O5G4ZtYCXPKaT+Mh/M/Yd6PGqRIoVFTzBl
 wBOqaxzP75ZTeoVFXalewEsc+RzkB1Lo76YzYZ7H8rVfGbNEhoPSOxabNk72tmegjfb3
 UdFg==
X-Gm-Message-State: AOAM532PAvwOvdg8sinOQm1+J9EMiWTO13S9DhSTXHrBQZJ3fsAuzwS+
 KNpm/yaGiMZNDLoXTy0Gyac=
X-Google-Smtp-Source: ABdhPJzHeROj3HC5Sukl5Uto4GX2p0nJsKAKZ5t4nooil+qkn+wpDmJamxHHNUoZnQ1//006tmFgjQ==
X-Received: by 2002:a50:e003:: with SMTP id e3mr38840536edl.374.1639147986203; 
 Fri, 10 Dec 2021 06:53:06 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:48f9:bea:a04c:3dfe?
 ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.googlemail.com with ESMTPSA id
 yc24sm1573561ejb.104.2021.12.10.06.53.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 06:53:05 -0800 (PST)
Message-ID: <2d864e94-1bae-4cc2-7242-676ef102398f@redhat.com>
Date: Fri, 10 Dec 2021 15:53:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 08/12] KVM: Reinstate gfn_to_pfn_cache with
 invalidation support
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, kvm <kvm@vger.kernel.org>
References: <20211121125451.9489-1-dwmw2@infradead.org>
 <20211121125451.9489-9-dwmw2@infradead.org>
 <b1bacc6f-be56-4108-6e52-4315a021184b@redhat.com>
 <b614d9ae0fe7910cfa72eee0b4077776f8012e5f.camel@infradead.org>
 <6cb2cd57-16f3-d0ec-adf6-cb8fdcbae035@redhat.com>
 <5d0a68cd0d06884a2a58338aace811144990f8f5.camel@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <5d0a68cd0d06884a2a58338aace811144990f8f5.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Anup Patel <anup.patel@wdc.com>,
 "wanpengli @ tencent . com" <wanpengli@tencent.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 "joro @ 8bytes . org" <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, karahmed@amazon.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 butt3rflyh4ck <butterflyhuangxx@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "jmattson @ google . com" <jmattson@google.com>,
 "seanjc @ google . com" <seanjc@google.com>,
 "mtosatti @ redhat . com" <mtosatti@redhat.com>, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, "vkuznets @ redhat . com" <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/10/21 13:25, David Woodhouse wrote:
> On Thu, 2021-12-09 at 23:34 +0100, Paolo Bonzini wrote:
>>
>> Compared to the review it's missing this hunk:
>>
>> @@ -265,7 +265,7 @@ void kvm_gfn_to_pfn_cache_unmap(struct kvm *kvm, struct gfn_to_pfn_cache *gpc)
>>
>>          gpc->valid = false;
>>
>> -       old_khva = gpc->khva;
>> +       old_khva = (void *)((unsigned long)gpc->khva & ~PAGE_MASK);
>>          old_dirty = gpc->dirty;
> 
> Do you know what? I couldn't bring myself to add that a second time. I
> managed it once, but it made me sad.
> 
> Did it like this instead:
> 
> -       old_khva = gpc->khva;
> +       old_khva = gpc->khva - offset_in_page(gpc->khva);

Very nice, and it would have deserved a macro in include/linux if there 
wasn't a decent way to write it.

> I checked that for me at least, GCC is clever enough to just do the
> mask.
> 
>          old_khva = gpc->khva - offset_in_page(gpc->khva);
>   131:   48 8b 43 78             mov    0x78(%rbx),%rax
>   135:   48 25 00 f0 ff ff       and    $0xfffffffffffff000,%rax
> 
> 
> I still don't see the previous patches in kvm/next — is that an
> automatic push after testing has passed, or is the kernel.org
> infrastructure just *really* slow?

No, it's me really wanting to send out the -rc5 pull request before the 
weekend.  Just wait five more minutes.

Paolo

> I've pushed based on the currently-visible kvm/next to
> https://git.infradead.org/users/dwmw2/linux.git/shortlog/refs/heads/xen-evtchn
> and can resend when the tree finally surfaces.
> 

