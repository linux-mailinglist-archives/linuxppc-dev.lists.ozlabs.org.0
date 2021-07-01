Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A68AD3B8E87
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 10:05:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFrNh4PLhz307c
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 18:05:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VjgAcxih;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VjgAcxih; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFrNF00Yvz2xfH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 18:04:42 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id z4so3203235plg.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jul 2021 01:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=GGDX6c3bWhp7+8s6wd+GJQxCKEIt/gtf69ReO690w1w=;
 b=VjgAcxihyQIog9dGE5EjIb7vXiLlq2IKfLNfadzuCIf/7v+Dqla3Cs6DSdwfAcu+4j
 TL2Pk6MagG17KtwbpNcg5Yj3VQgHEalcu2PdgVADu6KaPz5eCuLamj975dJ8+kNWxuxl
 rmMRB/YkJ3/Y2y8yVkOSFATAB7FO3/RBn1HkY0GtgdJsqFPyW+pZhgo6TZjZo0gAM4yg
 iqGZZj2nQIL8mr2K6Y6RpoRd29/txwfmjQKcHF0Fe9YjYooIIfG2VLpxvdZp2t4uG9SV
 3g8LOMtOH6cKWHV0i55DFq4KbZB12ATaKvk10kcH/uI0Wtc6zHE1AIE4Vt8GPBZE5z3f
 wzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=GGDX6c3bWhp7+8s6wd+GJQxCKEIt/gtf69ReO690w1w=;
 b=fI7puHKtt7yiYy56gxVOdivre3EKdA96MJSp11SbyaH8CJyLLTnuIMXU/JqG3dZRD3
 PnCJDEiCX4Zuq8+xvaCbCRK0dHi9/ygvYLlwZk774MCSYCyUkRgndxHUqb9XBVjEjb4f
 z94ZYMswfU/E3WKDs1f28Rb85tyRs2eNasyDMt5oc82FfMq6BIMglfpWDskv1JfPwtg+
 hpsahmpef7yub0oNXGkN7DdOZ1MkKkNnY/zXrLwSpCOccZUSvlbQem/bqZNt01jgIbds
 LUBGx2z+5eG33xHTfaNA80doO9TO+GF7ffPSHZVYLqa1NnoYE1gVvQx0pICJ0H7usq4m
 HzeQ==
X-Gm-Message-State: AOAM531qVSuaGWZvpPpTaN3kSZZBcoLtE0VaIRgPMbt0UJJ2qU+eMjuk
 aTSlA9iGeQxgyv5ht1Mh+Uc=
X-Google-Smtp-Source: ABdhPJy66zGDfZrtRFftH1eqP3NOTctLY3VHlG1fDFrfRRfYgFwB34hOHPS08TPbtp8YePzWaUjJ4Q==
X-Received: by 2002:a17:90a:a395:: with SMTP id
 x21mr43858670pjp.63.1625126679747; 
 Thu, 01 Jul 2021 01:04:39 -0700 (PDT)
Received: from localhost (220-244-87-52.tpgi.com.au. [220.244.87.52])
 by smtp.gmail.com with ESMTPSA id s63sm15836688pfb.195.2021.07.01.01.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 01:04:39 -0700 (PDT)
Date: Thu, 01 Jul 2021 18:04:34 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 38/43] KVM: PPC: Book3S HV P9: Test dawr_enabled()
 before saving host DAWR SPRs
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210622105736.633352-1-npiggin@gmail.com>
 <20210622105736.633352-39-npiggin@gmail.com> <87eecj2qcv.fsf@linux.ibm.com>
In-Reply-To: <87eecj2qcv.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1625126603.992wxhpa1l.astroid@bobo.none>
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

Excerpts from Fabiano Rosas's message of July 1, 2021 3:51 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> Some of the DAWR SPR access is already predicated on dawr_enabled(),
>> apply this to the remainder of the accesses.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/kvm/book3s_hv_p9_entry.c | 34 ++++++++++++++++-----------
>>  1 file changed, 20 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/bo=
ok3s_hv_p9_entry.c
>> index 7aa72efcac6c..f305d1d6445c 100644
>> --- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
>> +++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
>> @@ -638,13 +638,16 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64=
 time_limit, unsigned long lpc
>>
>>  	host_hfscr =3D mfspr(SPRN_HFSCR);
>>  	host_ciabr =3D mfspr(SPRN_CIABR);
>> -	host_dawr0 =3D mfspr(SPRN_DAWR0);
>> -	host_dawrx0 =3D mfspr(SPRN_DAWRX0);
>>  	host_psscr =3D mfspr(SPRN_PSSCR);
>>  	host_pidr =3D mfspr(SPRN_PID);
>> -	if (cpu_has_feature(CPU_FTR_DAWR1)) {
>> -		host_dawr1 =3D mfspr(SPRN_DAWR1);
>> -		host_dawrx1 =3D mfspr(SPRN_DAWRX1);
>> +
>> +	if (dawr_enabled()) {
>> +		host_dawr0 =3D mfspr(SPRN_DAWR0);
>> +		host_dawrx0 =3D mfspr(SPRN_DAWRX0);
>> +		if (cpu_has_feature(CPU_FTR_DAWR1)) {
>> +			host_dawr1 =3D mfspr(SPRN_DAWR1);
>> +			host_dawrx1 =3D mfspr(SPRN_DAWRX1);
>=20
> The userspace needs to enable DAWR1 via KVM_CAP_PPC_DAWR1. That cap is
> not even implemented in QEMU currently, so we never allow the guest to
> set vcpu->arch.dawr1. If we check for kvm->arch.dawr1_enabled instead of
> the CPU feature, we could shave some more time here.

Ah good point, yes let's do that.

Thanks,
Nick
