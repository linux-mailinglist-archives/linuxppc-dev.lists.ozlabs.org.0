Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F88326A90
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 00:59:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DnRTn60Q0z3d30
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 10:59:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ZqDfPF2O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZqDfPF2O; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DnRTP1Q5Sz30Pg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 10:59:20 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id k22so6130191pll.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 15:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=MdnJV7L+flQpiq1z76Nfmc99kpcCv9yxwq6tbq/YWPU=;
 b=ZqDfPF2Orz1qA8SiA3Q8s1sbgEuwDf94rWDFAJy0GEOesgXrS46keo20LadEPS40Xl
 CAfhaZjZ+iBQI/wCrRyZ1vb2vk5MWyA1aZzy4M80cnSZiUyvNSHYTaTG2Uo6u7KDfEqC
 gMXtBMuxUo2NJEa6xjER7XrAKL7Der+qXYLQYKdeuxOvCbu0d1EqvGamjGv5qWocK/PO
 on9qQUW3m76mWnKtzy4t0GEZyygY/NlAYc/Vi/9EZ7Ds5yOCa//CsPwSJ7nbXyddXpfX
 2g5NI6+8jidgLOInygKP1ZOvD5eoFqEr/Ci84TLykwq+u43ggHd/khzB2Cig2Fe+Ig2E
 BtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=MdnJV7L+flQpiq1z76Nfmc99kpcCv9yxwq6tbq/YWPU=;
 b=VhL2UwlXkUQNbZKmLfTXVc8dmTh6nSEKmFXdwlACN06fPhBs/xlL7RiY0ToEAnzSVX
 dEVZ08msGBhLjYJOGGodqD0c7PWjdmZU8TehERsRHGh1BQyNjFNJE3fVsFLEfMEXuguS
 XTeQUUQwZH+aNY/FM9Q09S1cjA7cdLPe87JLHr9sOGbDB2aY7w5fCAOsqOXMlikCbsHs
 adyfZVcfSDqCnUrxQMXBBiCPWdZGh+63iyvZ7WMyPZmjICw8vLo7p7XBqCioGBfVlD0p
 GItc534YcYGXgD9y5XiJQEyxNGsFETAhNYCGepw5nYct4Xjeabmk1qCYqZEPXKn4ITg8
 w/Sg==
X-Gm-Message-State: AOAM532sd/BaBjSleQs2D5ko9M6Srr3DYl9nfNYyod2BjcWlIKov66qV
 YqWjU0Q/16Oi8N2tPJJREXk=
X-Google-Smtp-Source: ABdhPJx2q+U+TINlMd/GtxDI/hjQxEfddz0DuKOeRBrxDZgrC3xzdfqi/pfBmwEk9IL5JbwLu4lhAw==
X-Received: by 2002:a17:90b:2281:: with SMTP id
 kx1mr5717929pjb.113.1614383959303; 
 Fri, 26 Feb 2021 15:59:19 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id u66sm11621578pfc.72.2021.02.26.15.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 15:59:18 -0800 (PST)
Date: Sat, 27 Feb 2021 09:59:13 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 16/37] KVM: PPC: Book3S HV P9: Stop handling hcalls in
 real-mode in the P9 path
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, kvm-ppc@vger.kernel.org
References: <20210225134652.2127648-1-npiggin@gmail.com>
 <20210225134652.2127648-17-npiggin@gmail.com>
 <47ae7b2f-9356-6cff-da38-142eaea773ca@kaod.org>
In-Reply-To: <47ae7b2f-9356-6cff-da38-142eaea773ca@kaod.org>
MIME-Version: 1.0
Message-Id: <1614383911.azeq7dbfo9.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from C=C3=A9dric Le Goater's message of February 26, 2021 12:51 am=
:
> On 2/25/21 2:46 PM, Nicholas Piggin wrote:
>> In the interest of minimising the amount of code that is run in
>> "real-mode", don't handle hcalls in real mode in the P9 path.
>>=20
>> POWER8 and earlier are much more expensive to exit from HV real mode
>> and switch to host mode, because on those processors HV interrupts get
>> to the hypervisor with the MMU off, and the other threads in the core
>> need to be pulled out of the guest, and SLBs all need to be saved,
>> ERATs invalidated, and host SLB reloaded before the MMU is re-enabled
>> in host mode. Hash guests also require a lot of hcalls to run. The
>> XICS interrupt controller requires hcalls to run.
>>=20
>> By contrast, POWER9 has independent thread switching, and in radix mode
>> the hypervisor is already in a host virtual memory mode when the HV
>> interrupt is taken. Radix + xive guests don't need hcalls to handle
>> interrupts or manage translations.
>>=20
>> So it's much less important to handle hcalls in real mode in P9.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/include/asm/kvm_ppc.h      |  5 +++++
>>  arch/powerpc/kvm/book3s_hv.c            | 25 ++++++++++++++++++++++---
>>  arch/powerpc/kvm/book3s_hv_rmhandlers.S |  5 +++++
>>  arch/powerpc/kvm/book3s_xive.c          | 25 +++++++++++++++++++++++++
>>  4 files changed, 57 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/a=
sm/kvm_ppc.h
>> index 73b1ca5a6471..db6646c2ade2 100644
>> --- a/arch/powerpc/include/asm/kvm_ppc.h
>> +++ b/arch/powerpc/include/asm/kvm_ppc.h
>> @@ -607,6 +607,7 @@ extern void kvmppc_free_pimap(struct kvm *kvm);
>>  extern int kvmppc_xics_rm_complete(struct kvm_vcpu *vcpu, u32 hcall);
>>  extern void kvmppc_xics_free_icp(struct kvm_vcpu *vcpu);
>>  extern int kvmppc_xics_hcall(struct kvm_vcpu *vcpu, u32 cmd);
>> +extern int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req);
>>  extern u64 kvmppc_xics_get_icp(struct kvm_vcpu *vcpu);
>>  extern int kvmppc_xics_set_icp(struct kvm_vcpu *vcpu, u64 icpval);
>>  extern int kvmppc_xics_connect_vcpu(struct kvm_device *dev,
>> @@ -639,6 +640,8 @@ static inline int kvmppc_xics_enabled(struct kvm_vcp=
u *vcpu)
>>  static inline void kvmppc_xics_free_icp(struct kvm_vcpu *vcpu) { }
>>  static inline int kvmppc_xics_hcall(struct kvm_vcpu *vcpu, u32 cmd)
>>  	{ return 0; }
>> +static inline int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req=
)
>> +	{ return 0; }
>>  #endif
>> =20
>>  #ifdef CONFIG_KVM_XIVE
>> @@ -673,6 +676,7 @@ extern int kvmppc_xive_set_irq(struct kvm *kvm, int =
irq_source_id, u32 irq,
>>  			       int level, bool line_status);
>>  extern void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu);
>>  extern void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu);
>> +extern void kvmppc_xive_cede_vcpu(struct kvm_vcpu *vcpu);
>=20
> I can not find this routine. Is it missing or coming later in the patchse=
t ?=20

Yeah it leaked into a later patch but it belongs here. I'll fix it.

Thanks,
Nick
