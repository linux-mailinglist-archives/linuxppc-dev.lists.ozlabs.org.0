Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D37BD324EB4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 12:00:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmVF56d7jz3cRC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 22:00:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=POgd72FP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=POgd72FP; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmVDZ0BMyz30NM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 21:59:55 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id 201so3368264pfw.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 02:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=xGroUyWCT31sVVQ60G/9L3y5R8a5+elyKISQ35AcBIU=;
 b=POgd72FP+RBHr/pG+sArA12DOyP6HehKQMpHUa+aDHxIjKW78C10mclu6bNMzWfYuo
 7+JW73xrmLqZmzityMUc+37wwQR3CuAwsJ1AfV0JBtYdUB/r9FZ9d2hF/exolZciIrV0
 ZxDaMA/cZU3ZB00kuF/4wsqMPTW6+h4OLdgTsRa2wmtCEfFRkVbiIow8iLhP+/VzhBAh
 JycKXsfAzm7SaHRbzwrKVL5zwSGtfQuRDinkFZxpRzEY+95ZCtB7NWx8IQaZjsGTi2Mz
 f5G9iWiKuCrxaSbaZMiRETqfRllUpMmrmA9NF4bHXmgkASPiTjplPiPBffSZn0/ulGR+
 t9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=xGroUyWCT31sVVQ60G/9L3y5R8a5+elyKISQ35AcBIU=;
 b=Qt5Z30zztLyxqtJ3Oc1MsR6vtaERBJiaCU/92mwMTTgvoKT8pjAQkDmcvbpKwzHXjN
 eXVtT7jTImFhGlgpaNHeasGgkfNqGB643tGvjNbeAIG4JnyfuTFcbFT78EIulQNhmkyO
 M9sASBZlodyyUyVN6Ev35ygJtTgdXUOUFvMe3vXGV8IK0cShpqHe64hrhANymMxCysXC
 /0BTVAgeNASnV8WKs80HwuLnVqQiKQXr0KGmogNR74UGYGbj2FTzcFOB8fIxKqM5R/6p
 LUGGTAzlIPqFnV9JsfQY1WcKjHhYi1KtpHwz5NIaMA+9npPZ4JNE1N785tR3dn1atne9
 rlXg==
X-Gm-Message-State: AOAM530SLmXaC5qk/pxh7oayhY4BgLhU16nfpLuq2U5dw1nR903nEQbi
 lFn2M32Bgu8OPqGFf6fBLfJ7CVyKFICXFA==
X-Google-Smtp-Source: ABdhPJyDnUTqPNUoeLPpGS+f75QJ1DMvUVfllFD2r7Imr2pRu/wAyL9mbvtTSH7CgbzJSKXaNSILPQ==
X-Received: by 2002:a05:6a00:22ca:b029:1ed:f915:ca98 with SMTP id
 f10-20020a056a0022cab02901edf915ca98mr2692042pfj.68.1614250792901; 
 Thu, 25 Feb 2021 02:59:52 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id 67sm6123116pfw.92.2021.02.25.02.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 02:59:52 -0800 (PST)
Date: Thu, 25 Feb 2021 20:59:46 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 12/13] KVM: PPC: Book3S HV: Move radix MMU switching
 together in the P9 path
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210219063542.1425130-1-npiggin@gmail.com>
 <20210219063542.1425130-13-npiggin@gmail.com> <878s7dxkxr.fsf@linux.ibm.com>
In-Reply-To: <878s7dxkxr.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1614250755.4zzkisf6bg.astroid@bobo.none>
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

Excerpts from Fabiano Rosas's message of February 25, 2021 6:36 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> Switching the MMU from radix<->radix mode is tricky particularly as the
>> MMU can remain enabled and requires a certain sequence of SPR updates.
>> Move these together into their own functions.
>>
>> This also includes the radix TLB check / flush because it's tied in to
>> MMU switching due to tlbiel getting LPID from LPIDR.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>=20
> <snip>
>=20
>> @@ -4117,7 +4138,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u=
64 time_limit,
>>  {
>>  	struct kvm_run *run =3D vcpu->run;
>>  	int trap, r, pcpu;
>> -	int srcu_idx, lpid;
>> +	int srcu_idx;
>>  	struct kvmppc_vcore *vc;
>>  	struct kvm *kvm =3D vcpu->kvm;
>>  	struct kvm_nested_guest *nested =3D vcpu->arch.nested;
>> @@ -4191,13 +4212,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, =
u64 time_limit,
>>  	vc->vcore_state =3D VCORE_RUNNING;
>>  	trace_kvmppc_run_core(vc, 0);
>>
>> -	if (cpu_has_feature(CPU_FTR_HVMODE)) {
>> -		lpid =3D nested ? nested->shadow_lpid : kvm->arch.lpid;
>> -		mtspr(SPRN_LPID, lpid);
>> -		isync();
>> -		kvmppc_check_need_tlb_flush(kvm, pcpu, nested);
>> -	}
>> -
>=20
> What about the counterpart to this^ down below?
>=20
> 	if (cpu_has_feature(CPU_FTR_HVMODE)) {
> 		mtspr(SPRN_LPID, kvm->arch.host_lpid);
> 		isync();
> 	}

Good catch, you're right that can be removed too.

Thanks,
Nick
