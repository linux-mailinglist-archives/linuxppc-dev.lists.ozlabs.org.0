Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 363D67DBE04
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 17:35:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gD1FC8yq;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gD1FC8yq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SJzQX0qDDz3cVk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 03:35:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gD1FC8yq;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gD1FC8yq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SJzPh32Lqz3bsP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 03:34:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698683669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ulhjanvCdPYtWw9EzE0x+t1LRIaefb0ftsJSrZGZk2I=;
	b=gD1FC8yq1RXGhMg9PI0MaLk3wUea71Oev+APxcyh3MycdcEkFazjR8+7vMhqfS+VlzOjdB
	dn7qdKy5xm6b61DPiHP+p/uUerjSndRNgsKGeqK2FfTG3R74Aw1dPki7bXmIrBXwuYL4s/
	az5uy2iJVH2WtDtz7FrxT8enSxZXR48=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698683669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ulhjanvCdPYtWw9EzE0x+t1LRIaefb0ftsJSrZGZk2I=;
	b=gD1FC8yq1RXGhMg9PI0MaLk3wUea71Oev+APxcyh3MycdcEkFazjR8+7vMhqfS+VlzOjdB
	dn7qdKy5xm6b61DPiHP+p/uUerjSndRNgsKGeqK2FfTG3R74Aw1dPki7bXmIrBXwuYL4s/
	az5uy2iJVH2WtDtz7FrxT8enSxZXR48=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-l-60DUQNPqmBnRT9i1cFyw-1; Mon, 30 Oct 2023 12:34:27 -0400
X-MC-Unique: l-60DUQNPqmBnRT9i1cFyw-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-507cee14477so5619173e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 09:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698683666; x=1699288466;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ulhjanvCdPYtWw9EzE0x+t1LRIaefb0ftsJSrZGZk2I=;
        b=gy9zDntaTst9TC86EpargHaA+VzDCCsNSlFBzBNJ6qafLgpsGXKS+gogS6BStPWK0I
         xvJxewzL9+B/kD2Fj7bNzwouEep6Guimy3N+X2yD+kmYWppfDluxEwsuIbsaEtePmGjL
         NwA2l2uiV0rurt9yYWadqOQpotFFof+47knIsT/KGS+5kEHF5+1Bb13isX/v+tFsCN+K
         o6VHK/eueZp6YCRpvEp1OcVoTg5KiMOe5Vnn0RzQXz5W0NqSgw04ooDd6ZSEQVqKMR1g
         F2UwgDiLyBS0OpMXJCHWk5ePOcITd3ELtOQUPGrtB8D1LAUQpbixtV5w/yQ5GhSxQe8R
         8ZRA==
X-Gm-Message-State: AOJu0YyHa8y1iBIcr4oN3z6RcPp3IRiQzmT+++4o56kfMGdhhkY/AruC
	oT02eBYX6OeDVjK0+s5ygS3l4aypGGZRAn5RR0XSz5mflp1szLt60RNe7R/3AT22vEgypEpvIv9
	a55E1EedpxCbcKmR13qbAnJh+ig==
X-Received: by 2002:a05:6512:401b:b0:509:e5e:232a with SMTP id br27-20020a056512401b00b005090e5e232amr5897982lfb.42.1698683666095;
        Mon, 30 Oct 2023 09:34:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0aPhq7RmLOdQg/8nTPuKQcnNKQWBpA0tLrO9vQ6yVW69xTZheoxNXQCLJzHXUuVLJUPNNOQ==
X-Received: by 2002:a05:6512:401b:b0:509:e5e:232a with SMTP id br27-20020a056512401b00b005090e5e232amr5897924lfb.42.1698683665637;
        Mon, 30 Oct 2023 09:34:25 -0700 (PDT)
Received: from [192.168.1.174] ([151.81.68.207])
        by smtp.googlemail.com with ESMTPSA id c8-20020a5d4cc8000000b003197869bcd7sm8612041wrt.13.2023.10.30.09.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 09:34:25 -0700 (PDT)
Message-ID: <4e2eee77-721f-4b0f-a825-a664951640f0@redhat.com>
Date: Mon, 30 Oct 2023 17:34:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 05/35] KVM: PPC: Drop dead code related to
 KVM_ARCH_WANT_MMU_NOTIFIER
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-6-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20231027182217.3615211-6-seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Xiaoyao Li <xiaoyao.li@intel.com>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, David Matlack <dmatlack@google.com>, Vlastimil Babka <vbabka@suse.cz>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?= =?UTF-8?Q?n?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal A
 nnapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/27/23 20:21, Sean Christopherson wrote:
> Assert that both KVM_ARCH_WANT_MMU_NOTIFIER and CONFIG_MMU_NOTIFIER are
> defined when KVM is enabled, and return '1' unconditionally for the
> CONFIG_KVM_BOOK3S_HV_POSSIBLE=n path.  All flavors of PPC support for KVM
> select MMU_NOTIFIER, and KVM_ARCH_WANT_MMU_NOTIFIER is unconditionally
> defined by arch/powerpc/include/asm/kvm_host.h.
> 
> Effectively dropping use of KVM_ARCH_WANT_MMU_NOTIFIER will simplify a
> future cleanup to turn KVM_ARCH_WANT_MMU_NOTIFIER into a Kconfig, i.e.
> will allow combining all of the
> 
>    #if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
> 
> checks into a single
> 
>    #ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
> 
> without having to worry about PPC's "bare" usage of
> KVM_ARCH_WANT_MMU_NOTIFIER.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/powerpc/kvm/powerpc.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 7197c8256668..b0a512ede764 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -632,12 +632,13 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   		break;
>   #endif
>   	case KVM_CAP_SYNC_MMU:
> +#if !defined(CONFIG_MMU_NOTIFIER) || !defined(KVM_ARCH_WANT_MMU_NOTIFIER)
> +		BUILD_BUG();
> +#endif
>   #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
>   		r = hv_enabled;
> -#elif defined(KVM_ARCH_WANT_MMU_NOTIFIER)
> -		r = 1;
>   #else
> -		r = 0;
> +		r = 1;
>   #endif
>   		break;
>   #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

