Return-Path: <linuxppc-dev+bounces-4747-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B674A0361B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 04:45:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRxkc6xRPz3bPV;
	Tue,  7 Jan 2025 14:44:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736211205;
	cv=none; b=cQzQonnvnkuMXXTFrfTAOH0b6pRaf1g9x6jYrhDcKBPgyswqwjt840OUW12tdjcrMmdAtYWsQNdE+fGPdGT7AVtPSTOemvQldQbfxFr7Mpf3yh+WS8Hb+vk0BvGYl6ahdEZmjrixtgTXxOJZVsBX/RC8PD41/zNMdcULn5Fk34+5c0joRv8wcn09tGfLihpf0ZzpWQhQCSm2UZG0bW0vxCMVs8naa9xv5poxhPFi/+1dAwxTS76WA6wI+F0aT9/C/XBSbN6ZHcWAUTDe/BoMgjuJdiR1gRQHq/T9ole/Ndqc3OyU+BazpgQ6mGnDjiJfYEZ/JwHpI+NZ9vYfzd4rGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736211205; c=relaxed/relaxed;
	bh=8Vh0pBL5XxbRXfdAMJHXvrZrZ2HC9oCwCXuoOG8KyG8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CAeBVedU8D3ouQNMCzQYPXqTP8KYqWAwk2iBAMBiLIgL575WtDQZKcRW18Pt1xVFhcH12L8DifioqxQrsmPUrkyxvbuSzQQi4kVfXbE3PpRnOyx/vB9uts+piOTQu0Nia27NiKP5NYJIAiuaoaOxxxXpV4LIfFY3eZ/IoiHeQoPLzRZZAtqMgQC9IV4jN5xsVdm3djlGMg3YKbBWfpNRS/HZR5cDa8kqHbxK2nBYUYQDcG8qDcNiSGYoGENIstrIr9xaE7l04z5zHBCMZxzxf4iEzDk0KXISRePMGVMtX9GeHpHtOM95hf22qGvuuyjAQjzQPmYuFRYzTrHvwYhDUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EDZSLu6J; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EDZSLu6J; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=crwood@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EDZSLu6J;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EDZSLu6J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=crwood@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRsx02gdcz2yNc
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 11:53:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736211197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Vh0pBL5XxbRXfdAMJHXvrZrZ2HC9oCwCXuoOG8KyG8=;
	b=EDZSLu6JJnWpGxukHy/vyO/eMHRjRJ0nhjzekYicEY2FqYgdKoonl4aezXfYPUyGyWwqAu
	Q/xcLVyJcwHi3dVNP6JGFYywD9jv+kqsDSME1P59VQ9O9qDUwiXExC+y6M64W/G93zICU2
	mp1yaDBAQpczbA5Zi3R6fWVfj12tRlY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736211197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Vh0pBL5XxbRXfdAMJHXvrZrZ2HC9oCwCXuoOG8KyG8=;
	b=EDZSLu6JJnWpGxukHy/vyO/eMHRjRJ0nhjzekYicEY2FqYgdKoonl4aezXfYPUyGyWwqAu
	Q/xcLVyJcwHi3dVNP6JGFYywD9jv+kqsDSME1P59VQ9O9qDUwiXExC+y6M64W/G93zICU2
	mp1yaDBAQpczbA5Zi3R6fWVfj12tRlY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-Nr3BuwufNNWm-iEU7AH2Qw-1; Mon, 06 Jan 2025 19:53:13 -0500
X-MC-Unique: Nr3BuwufNNWm-iEU7AH2Qw-1
X-Mimecast-MFC-AGG-ID: Nr3BuwufNNWm-iEU7AH2Qw
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6e5c9ef38so2481650385a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jan 2025 16:53:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736211193; x=1736815993;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CtbBZcEWixSx8WxKTGxxVe9YGJddjHivheFuJ/OEl4U=;
        b=YmMzH2OnmjK351KM6OrAIjRqylVCALmohLCR1K6PW6j4hDm690UXaDaXKFoTHc0TPi
         6DPkqKq7kB5QuGM/oPZqeT131qQP+KrwfhVpcBd9WOQIrtzo7d3MaiH0Ga6q83KLlcqP
         IywFo8TTYqgjtrhc7i4uo/h9cjQIRBbZTszA/2XdHhrFDfSmRNbbJVgcmDRMqPYwuMVT
         6PgI4aAYOvsiGUpgDPhihQe0jHS8DZC5zmPfN8G/Wee+t2vIfQkbZEBW5RxZd0GFZxTs
         JmZd2pzINMISp5xqVK+WOCYclvPZN9tSKATeMQf8lCzMhDinZ2Dtqts9bniEYQUPQWwL
         cTAg==
X-Forwarded-Encrypted: i=1; AJvYcCUdNDYHfkqGPXWp6WOr/sw5z774s4jSR8OTPIaGOZb9PQS8xHY6A16FwC4VsK6jE47aOtDWQFnp2oDw/ys=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwhOXZETimdQ4RJHsh0sjGrKmmWHYVauvpLAwpDkU13VfZcXMSl
	H+rZGhZKmqEkDZ1B+oJYR220y1KKZuVIsN+525+VrJwzpWy/npHbb3Q9yNhCFnVY/9lB608qHsM
	Y/zcgsD5XZ1Af0lpp1m+PKbcjPDXuRDKcb+DToujkH6Tiio7K3m6wiDRMQYO+kok=
X-Gm-Gg: ASbGnctnW7aT5MreLJfmMxqaea+g6EQW2+HRxteIxJC0Ism/UvcpI3baGuYnYZpNqQ8
	4rUXeAJ8VU4SIGGtLIwEFJ9brcDgv42SGUDlYYBcKtdQ+2QWWoFels+0GEXQzs4drqcmLhwJTNC
	qAMzBpO7yRvJ+gS5716YBm1qRQZfM931gPImPpW+zS0PJOcQfcnu5RJztFbaAfKFnpyOz1NfLxK
	Ab+6qTWdMGwaZuIAK75m5yQngPu19efW2sHSPxIyclNWTfpx3Xh0WutO0whZhJfJJR9DnuHQxlM
	yppq+s8NnhCL4PmGRpjRD0zETA3QPXjnfO88S5sEbu28Tg==
X-Received: by 2002:a05:620a:4391:b0:7b1:5545:7104 with SMTP id af79cd13be357-7bb90248f5emr233294785a.2.1736211193458;
        Mon, 06 Jan 2025 16:53:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGH3zXukWoOxxE9GTC98eC7YuZVzhkxHUhqQrhYMYf+Tp1nGh3nJP16xZ6Vg5mME8zl35azTw==
X-Received: by 2002:a05:620a:4391:b0:7b1:5545:7104 with SMTP id af79cd13be357-7bb90248f5emr233291885a.2.1736211193119;
        Mon, 06 Jan 2025 16:53:13 -0800 (PST)
Received: from crwood-thinkpadp16vgen1.minnmso.csb (syn-050-074-019-099.biz.spectrum.com. [50.74.19.99])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac4cd95fsm1549579385a.103.2025.01.06.16.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 16:53:12 -0800 (PST)
Message-ID: <e7972ba881ed8c0ed8c82379c4e9a2e88cd94ceb.camel@redhat.com>
Subject: Re: [PATCH v2 3/5] powerpc: kvm: drop 32-bit booke
From: Crystal Wood <crwood@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, kvm@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Huacai Chen <chenhuacai@kernel.org>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Alexander Graf <graf@amazon.com>, Anup
 Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, Marc Zyngier
 <maz@kernel.org>,  "A. Wilcox" <AWilcox@Wilcox-Tech.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org
Date: Mon, 06 Jan 2025 19:53:11 -0500
In-Reply-To: <20241221214223.3046298-4-arnd@kernel.org>
References: <20241221214223.3046298-1-arnd@kernel.org>
	 <20241221214223.3046298-4-arnd@kernel.org>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r0DYm48Nws-3diPF9VC5ywWUtjn5VKICFTgookC_vug_1736211193
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=3.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, 2024-12-21 at 22:42 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> KVM on PowerPC BookE was introduced in 2008 and supported IBM 44x,
> Freescale e500v2 (32-bit mpc85xx, QuorIQ P1/P2), e500mc (32bit QorIQ
> P2/P3/P4), e5500 (64-bit QorIQ P5/T1) and e6500 (64-bit QorIQ T2/T4).
>=20
> Support for 44x was dropped in 2014 as it was seeing very little use,
> but e500v2 and e500mc are still supported as most of the code is shared
> with the 64-bit e5500/e6500 implementation.
>=20
> The last of those 32-bit chips were introduced in 2010 but not widely
> adopted when the following 64-bit PowerPC and Arm variants ended up
> being more successful.
>=20
> The 64-bit e5500/e6500 are still known to be used with KVM, but I could
> not find any evidence of continued use of the 32-bit ones, so drop
> discontinue those in order to simplify the implementation.
> The changes are purely mechanical, dropping all #ifdef checks for
> CONFIG_64BIT, CONFIG_KVM_E500V2, CONFIG_KVM_E500MC, CONFIG_KVM_BOOKE_HV,
> CONFIG_PPC_85xx, CONFIG_PPC_FPU, CONFIG_SPE and CONFIG_SPE_POSSIBLE,
> which are all known on e5500/e6500.
>=20
> Support for 64-bit hosts remains unchanged, for both 32-bit and
> 64-bit guests.
>=20
> Link: https://lore.kernel.org/lkml/Z1B1phcpbiYWLgCD@google.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/powerpc/include/asm/kvm_book3s_32.h    |  36 --
>  arch/powerpc/include/asm/kvm_booke.h        |   4 -
>  arch/powerpc/include/asm/kvm_booke_hv_asm.h |   2 -
>  arch/powerpc/kernel/head_85xx.S             |  14 -
>  arch/powerpc/kernel/head_booke.h            |  39 --
>  arch/powerpc/kvm/Kconfig                    |  22 +-
>  arch/powerpc/kvm/Makefile                   |  15 -
>  arch/powerpc/kvm/book3s_32_mmu_host.c       | 396 --------------

Why are book3s files removed by this patch?

> @@ -228,23 +176,16 @@ static inline void kvmppc_save_guest_altivec(struct=
 kvm_vcpu *vcpu)
>  static void kvmppc_vcpu_sync_debug(struct kvm_vcpu *vcpu)
>  {
>  =09/* Synchronize guest's desire to get debug interrupts into shadow MSR=
 */
> -#ifndef CONFIG_KVM_BOOKE_HV
>  =09vcpu->arch.shadow_msr &=3D ~MSR_DE;
>  =09vcpu->arch.shadow_msr |=3D vcpu->arch.shared->msr & MSR_DE;
> -#endif

This is an ifndef... the contents should be removed.

-Crystal


