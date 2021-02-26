Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D25A1326A7F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 00:50:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DnRHS5l0Kz3d2r
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 10:50:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Z8yq0c7k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Z8yq0c7k; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DnRH202qSz3cLS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 10:50:20 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id f8so6121106plg.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 15:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ZgDG+DAFXWS90lnwRgCLnPtPK1bMSB9QU23qIicCGtM=;
 b=Z8yq0c7khU84dYB+4wYJ+0RCMVyZ1ebXnB5WK2DAvqhnCJWpFKe+mH4CB/mrrkW7mk
 +mkUj2pMe2B4c/wqmGsFdwrZihKTKvfSE7lEv5siCVaKJTqD3gan4PXM2DGtrJsnXQK/
 cmI/mwUgHLzB1/OAZabpEKik1vHRH7JG1RjmMCHOnYroE6ixcQtk3NHNDiDsd/D09joD
 C0fVKalcsnFzWPS4qfl185r8e20QgpJaPWgCh7KxqB1YPtvPBs1n6YmzXNUB/zmYpfIE
 DVdS2pE6AxxNgr3BUMk59aDfpzMZyvTN/HIHvRGsNjVGZExpUZ5EGx1Xn+xXFDURPiX+
 HvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ZgDG+DAFXWS90lnwRgCLnPtPK1bMSB9QU23qIicCGtM=;
 b=O132cskEzsMLFGxkukOVjd5aG7FTw1Mj230PQ3Fuj+KCji2nkZBBGQ3zrrIND49eAJ
 amw9KYetaKt0h/NfeW0HNkMntrfcwOpVh+Jjq7EyHNfP0nn6yXBKEyB4sH1o0qxe6P9D
 72atmw+ZcPoVZ8L4yLo21kkaGk+hd7ZRyV8oDVv03OExXX24U9H1FVJW7EU9N+3gNNCP
 2JTxyz6jTe4fyed/bTRAV7/3ADBhyvTwMnH0KEqKKoTCVgYRo5R5buAMNUAOyqEezCA5
 udpOUROuhOaZik0yHEhM+4qyUdvtQ1oO7HvUK+ZUYO5Db1FxXi7ZtikUyA8p9OZwU//E
 GY1Q==
X-Gm-Message-State: AOAM532kAL6XYd5jwTixHS1fKe7GdhIfjppk9iAwPzSWO/lfG185NpS/
 YYkiVc6RSLkh5uTMQNkIxAk=
X-Google-Smtp-Source: ABdhPJwFc17Ja+0MIdiQQAo2vQTSyBJLLloXneUgYT1RCrhB5fu6fYZ0ON+O+v+tv9TGTT8kMN5rbw==
X-Received: by 2002:a17:90a:6a04:: with SMTP id
 t4mr5646719pjj.125.1614383416009; 
 Fri, 26 Feb 2021 15:50:16 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id r123sm10652023pfc.211.2021.02.26.15.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 15:50:15 -0800 (PST)
Date: Sat, 27 Feb 2021 09:50:09 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 01/37] KVM: PPC: Book3S 64: remove unused
 kvmppc_h_protect argument
To: Daniel Axtens <dja@axtens.net>, kvm-ppc@vger.kernel.org
References: <20210225134652.2127648-1-npiggin@gmail.com>
 <20210225134652.2127648-2-npiggin@gmail.com>
 <878s7ba0cm.fsf@linkitivity.dja.id.au>
In-Reply-To: <878s7ba0cm.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Message-Id: <1614383256.cikqwycx8o.astroid@bobo.none>
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

Excerpts from Daniel Axtens's message of February 26, 2021 3:01 pm:
> Hi Nick,
>=20
>> The va argument is not used in the function or set by its asm caller,
>> so remove it to be safe.
>=20
> Huh, so it isn't. I tracked the original implementation down to commit
> a8606e20e41a ("KVM: PPC: Handle some PAPR hcalls in the kernel") where
> paulus first added the ability to handle it in the kernel - there it
> takes a va argument but even then doesn't do anything with it.
>=20
> ajd also pointed out that we don't pass a va when linux is running as a
> guest, and LoPAR does not mention va as an argument.

Yeah interesting, maybe it was from a pre-release version of PAPR? Who
knows.

> One small nit: checkpatch is complaining about spaces vs tabs:
> ERROR: code indent should use tabs where possible
> #25: FILE: arch/powerpc/include/asm/kvm_ppc.h:770:
> +                      unsigned long pte_index, unsigned long avpn);$
>=20
> WARNING: please, no spaces at the start of a line
> #25: FILE: arch/powerpc/include/asm/kvm_ppc.h:770:
> +                      unsigned long pte_index, unsigned long avpn);$

All the declarations are using the same style in this file so I think
I'll leave it for someone to do a cleanup patch on. Okay?

>=20
> Once that is resolved,
>   Reviewed-by: Daniel Axtens <dja@axtens.net>

Thanks,
Nick

>=20
> Kind regards,
> Daniel Axtens
>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/include/asm/kvm_ppc.h  | 3 +--
>>  arch/powerpc/kvm/book3s_hv_rm_mmu.c | 3 +--
>>  2 files changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/a=
sm/kvm_ppc.h
>> index 8aacd76bb702..9531b1c1b190 100644
>> --- a/arch/powerpc/include/asm/kvm_ppc.h
>> +++ b/arch/powerpc/include/asm/kvm_ppc.h
>> @@ -767,8 +767,7 @@ long kvmppc_h_remove(struct kvm_vcpu *vcpu, unsigned=
 long flags,
>>                       unsigned long pte_index, unsigned long avpn);
>>  long kvmppc_h_bulk_remove(struct kvm_vcpu *vcpu);
>>  long kvmppc_h_protect(struct kvm_vcpu *vcpu, unsigned long flags,
>> -                      unsigned long pte_index, unsigned long avpn,
>> -                      unsigned long va);
>> +                      unsigned long pte_index, unsigned long avpn);
>>  long kvmppc_h_read(struct kvm_vcpu *vcpu, unsigned long flags,
>>                     unsigned long pte_index);
>>  long kvmppc_h_clear_ref(struct kvm_vcpu *vcpu, unsigned long flags,
>> diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book=
3s_hv_rm_mmu.c
>> index 88da2764c1bb..7af7c70f1468 100644
>> --- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
>> +++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
>> @@ -673,8 +673,7 @@ long kvmppc_h_bulk_remove(struct kvm_vcpu *vcpu)
>>  }
>> =20
>>  long kvmppc_h_protect(struct kvm_vcpu *vcpu, unsigned long flags,
>> -		      unsigned long pte_index, unsigned long avpn,
>> -		      unsigned long va)
>> +		      unsigned long pte_index, unsigned long avpn)
>>  {
>>  	struct kvm *kvm =3D vcpu->kvm;
>>  	__be64 *hpte;
>> --=20
>> 2.23.0
>=20
