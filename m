Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7463512A3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 11:45:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9ywy4dnlz3btS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 20:45:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=l8j5HhBu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=l8j5HhBu; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9ywW2c4Lz2yxd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 20:45:30 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id l1so730350plg.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 02:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=cxJdpEx/qaSyYLkc2fRUsLM6PN0Yk9OCyV658jn3wQw=;
 b=l8j5HhBu2NMWk5khRpRrTjj6hXiWysYLf7Om3Tzwq8w6Gr9sjWIkV0U3uIt+XRjTMq
 58j0F7hcRwAiO4o8eTAMe9gPkqJPH7nox1iZ5Zi2DXdU9w5CuCHOYo7j8/ixCJM7uFQi
 Q9XbqYqyfmL0QcESJDZZ9DfodF6meShZqmqI2LLQe+EQlNRW0gdaykom+0AKsgqC/GLI
 Y4SmgrtvvbdWL+7UU3jKRxh97AjundWz9KqPRE2f6OA34wsDf/S5eDwPg8JXKlx3vsvw
 NELRCpC00AZAVI1KFXPcddBgt+QW9qtoxmn9tiuC9rE1dKXe25QL2Ei/EEAUhSRsWelU
 BhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=cxJdpEx/qaSyYLkc2fRUsLM6PN0Yk9OCyV658jn3wQw=;
 b=nKMtrIL2rliNsJOtQqqlBpOYUnkuhLRVFjHClpBLbW3KNWxztExfRbWhL4Y8qgDB1H
 fCGvfuRTQY6mKHcMT6ueL95sNcXhaPp1wDG7J/Wh4ecVIYD3/M876Q8iUVaBJgK+bUjr
 Fv2lJlrI7ZsKUFGPxgYL49ZDq9t1xbLNKglnvium39H4ezVH4QBscc/H8+OoNP4TaS1P
 IPqHD8SEEUDRq8RWQ+60CqTkJjFTvm7TIAB2kSlcHTVH7iykc5wpIDBmBMFRg4DJkgg8
 e+GdUv8K8l7OZXAt5EEdptobEmUcQvOCgLKPsy3pP7JYDPH3kxHzdv63fd30fBqibNft
 MGeg==
X-Gm-Message-State: AOAM531Y7CRUZz9+JmaX11rgdZX2gmi3MBSKzRm+CJ7lyP7+6fcY7UwA
 y793k05Q9BO+Sn1CWspCelM=
X-Google-Smtp-Source: ABdhPJxdWFYfE6O7Q+j5sbwdf2QmgDQVt4PvxApyIGNP2vWkKbb4/984ZUfbaeJ1CX6ocCJmJYuJTg==
X-Received: by 2002:a17:902:a412:b029:e5:d7dd:9e41 with SMTP id
 p18-20020a170902a412b02900e5d7dd9e41mr7317919plq.78.1617270327264; 
 Thu, 01 Apr 2021 02:45:27 -0700 (PDT)
Received: from localhost ([1.128.222.144])
 by smtp.gmail.com with ESMTPSA id s22sm4958637pjs.42.2021.04.01.02.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 02:45:27 -0700 (PDT)
Date: Thu, 01 Apr 2021 19:45:21 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 04/46] KVM: PPC: Book3S HV: Prevent radix guests from
 setting LPCR[TC]
To: Paul Mackerras <paulus@ozlabs.org>
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-5-npiggin@gmail.com>
 <YGP74QVmx5yyE8Rc@thinks.paulus.ozlabs.org>
In-Reply-To: <YGP74QVmx5yyE8Rc@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1617269806.5qka0ltce0.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul Mackerras's message of March 31, 2021 2:34 pm:
> On Tue, Mar 23, 2021 at 11:02:23AM +1000, Nicholas Piggin wrote:
>> This bit only applies to hash partitions.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/kvm/book3s_hv.c        | 6 ++++++
>>  arch/powerpc/kvm/book3s_hv_nested.c | 3 +--
>>  2 files changed, 7 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index c5de7e3f22b6..1ffb0902e779 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -1645,6 +1645,12 @@ static int kvm_arch_vcpu_ioctl_set_sregs_hv(struc=
t kvm_vcpu *vcpu,
>>   */
>>  unsigned long kvmppc_filter_lpcr_hv(struct kvmppc_vcore *vc, unsigned l=
ong lpcr)
>>  {
>> +	struct kvm *kvm =3D vc->kvm;
>> +
>> +	/* LPCR_TC only applies to HPT guests */
>> +	if (kvm_is_radix(kvm))
>> +		lpcr &=3D ~LPCR_TC;
>=20
> I'm not sure I see any benefit from this, and it is a little extra
> complexity.

Principle of allowing a guest to mess with as little HV state as=20
possible (but not littler), which I think is a good one to follow.

>=20
>>  	/* On POWER8 and above, userspace can modify AIL */
>>  	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
>>  		lpcr &=3D ~LPCR_AIL;
>> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book=
3s_hv_nested.c
>> index f7b441b3eb17..851e3f527eb2 100644
>> --- a/arch/powerpc/kvm/book3s_hv_nested.c
>> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
>> @@ -140,8 +140,7 @@ static void sanitise_hv_regs(struct kvm_vcpu *vcpu, =
struct hv_guest_state *hr)
>>  	/*
>>  	 * Don't let L1 change LPCR bits for the L2 except these:
>>  	 */
>> -	mask =3D LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
>> -		LPCR_LPES | LPCR_MER;
>> +	mask =3D LPCR_DPFD | LPCR_ILE | LPCR_AIL | LPCR_LD | LPCR_LPES | LPCR_=
MER;
>=20
> Doesn't this make it completely impossible to set TC for any guest?

Argh, yes Fabiano pointed this out in an earlier rev and I didn't
fix this hunk after adding the filter bit. Thanks.

Thanks,
Nick
