Return-Path: <linuxppc-dev+bounces-2468-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C7C9A72BF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2024 20:57:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXPhH13fvz2yDS;
	Tue, 22 Oct 2024 05:57:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::549"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729537071;
	cv=none; b=dmBfVEB2pSnAHWqzc/8k+7e0eQBvOao+bLCW2sAqiH4NSHRzfQt9lfI+BkTwqrKvnpWrEfUxznE1tkLqbMJglrXA3T9sYafmqDFmr4CJ6F/Q4WgVWURSb5eEMBjOADu5PmiecdhaOHm677Wk1et1vZ3ZzUzdBwIB7rk9muWI0ymWN0+YlE7+NKXPy/jpHTuDHO0W0dy9vHVlzs+RKcX9lpMOoG1QunSeLGVSVpApIITW7eqlE6gOJsMVxa96bipOYKelTzfalNCZkb0Owx4JFwmorB4eJumQDnUvtXhsb+6lWIzwyHzyL8HmASOtLJu3LGxBpd84airSLK2QXtsXCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729537071; c=relaxed/relaxed;
	bh=TRc3VGGNkUkUR9ifA4nNeX0hRZiSdlXeerhUJQ+tYBo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B1ufiyi4pe3fOwL1KplHlCemAG/MOWBsP8c9eS3Z7NUyeTjs6Qml/7ZkQnIMNQ/bBrG5etCRYXhRTfiwY/pz+bZsD5JVUFs+GMbBvxdW5LZteNOcV1jeG/5rES+QtzOwSS7kc5AUZPV5prLtiFwa7oZJ+X1jcBoWb/pqGqmrX7ItUTh1I8dXqG6DpZK69VhL670SkKugbnIeiyHU7PLghC1ac6wbifuZZSoMOJtc/63f4AXk8N3H++K896thoiggfO8vBEF+XrX2aeed6DtEzg33oozf2yc4Pqqf8t0bZsPsQZiccr4aLzbQ7utrcTmbluS2+fU/cLWKAf/K33/Jnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=U0gW4d6L; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3kkqwzwykdas3plyunrzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=U0gW4d6L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3kkqwzwykdas3plyunrzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXPhF5JHnz2xpf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2024 05:57:48 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7ea6ebdf5d3so2431967a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 11:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729537065; x=1730141865; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRc3VGGNkUkUR9ifA4nNeX0hRZiSdlXeerhUJQ+tYBo=;
        b=U0gW4d6LE1yJIBSrshUygEFC0zyT8rT+pLlIMi4+ln3OLp3tvL1XKJKm1mJ4TXb4oF
         bn7pvOf34kC6wUugjvEem5wjH8yCgbJfHqGuByqC+30zRdWN3BCygzPhx+vb0MMgSApS
         30CIItjOX3gASEzC2OvMUaboFM2ZX3DyRdcFPJzVRWZhZTFxuB6HI96eQOFyFDfaSMt5
         YSVluqetNMGbR+41ABfhwYN8G4wjMfiAlNoaRA+7FIyU6NxgiLtucyqRLfX75H/5UV1v
         mWDMW0Hiwlp/1zJ3jSNkV0vZlk3+l7RIwfr0K4arB7GNfNgqHddPBQJm/E1+7858LBiW
         Nung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729537065; x=1730141865;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TRc3VGGNkUkUR9ifA4nNeX0hRZiSdlXeerhUJQ+tYBo=;
        b=SYtJwxtOuFQaT6rUNeI73JvkokeG7+H1+rBplVgxOYySTc+XsdLe9hF+ISDd5bQEyC
         vnfXELJA0vO2NAqISGXsqUl7SodwktTDiSa6kaFVyuPDtGjzgmTYd5zwmAACF5tSXJwS
         aNkYVwGP1OfEHw7BG1xPha0N9eBo6of/UkBs9pY4kY/mfN6OvDF+XGPzHWEVmkufr7On
         qcv5c0utkl7ztcrERvi6mbj7clSyr6U7gjqMQFqROc9CjwJH/5DCD6X4Fs6VFvj3S21I
         HyMdn4mdjQrMPaFa4G2oZ0xYFfF7fYcOSSTPrMPjPoLqpHibdFb1Z+CvPMxXBCGjKBAt
         gDJg==
X-Forwarded-Encrypted: i=1; AJvYcCU6BCwRTIEoRSkRE1+qUaEOEX9QllhUNOwtl1fieYZQkTFzA8/g66Pry06lGdzH7aqMhuJcfWpKm3zMeRk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YysUyAnEJ0ztcl4DYgOMmXNkA4fX0+dZpcgXRajvcQGHZHan/7k
	8JncI3UqNV7nNsT4aCj7I8uPKJ8Rw4+4rAzHg3oI1TnDwaIZHxlil2I7DPyus92xCmoWlqWtPGY
	bUA==
X-Google-Smtp-Source: AGHT+IHRYlBrX6M+NH4TUGVEqm9BFtB7q+VVhXD5EoRBvSsXa42IiMZxJc+hXyxs+ZPnB8HLQQfXC/cdu0E=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:3858:0:b0:7e9:f93c:22b9 with SMTP id
 41be03b00d2f7-7eacc895cf2mr12508a12.10.1729537064143; Mon, 21 Oct 2024
 11:57:44 -0700 (PDT)
Date: Mon, 21 Oct 2024 11:57:42 -0700
In-Reply-To: <ZxYrYe/WN8XoB+fI@yzhao56-desk.sh.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com> <20241010182427.1434605-52-seanjc@google.com>
 <ZxYrYe/WN8XoB+fI@yzhao56-desk.sh.intel.com>
Message-ID: <ZxakJr_jWkU-Y54e@google.com>
Subject: Re: [PATCH v13 51/85] KVM: VMX: Use __kvm_faultin_page() to get APIC
 access page/pfn
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"Alex =?utf-8?Q?Benn=C3=A9e?=" <alex.bennee@linaro.org>, David Matlack <dmatlack@google.com>, 
	David Stevens <stevensd@chromium.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Oct 21, 2024, Yan Zhao wrote:
> On Thu, Oct 10, 2024 at 11:23:53AM -0700, Sean Christopherson wrote:
> > Use __kvm_faultin_page() get the APIC access page so that KVM can
> > precisely release the refcounted page, i.e. to remove yet another user
> > of kvm_pfn_to_refcounted_page().  While the path isn't handling a guest
> > page fault, the semantics are effectively the same; KVM just happens to
> > be mapping the pfn into a VMCS field instead of a secondary MMU.
> >=20
> > Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---

...

> > @@ -6838,10 +6840,13 @@ void vmx_set_apic_access_page_addr(struct kvm_v=
cpu *vcpu)
> >  		vmcs_write64(APIC_ACCESS_ADDR, pfn_to_hpa(pfn));
> > =20
> >  	/*
> > -	 * Do not pin apic access page in memory, the MMU notifier
> > -	 * will call us again if it is migrated or swapped out.
> > +	 * Do not pin the APIC access page in memory so that it can be freely
> > +	 * migrated, the MMU notifier will call us again if it is migrated or
> > +	 * swapped out.  KVM backs the memslot with anonymous memory, the pfn
> > +	 * should always point at a refcounted page (if the pfn is valid).
> >  	 */
> > -	kvm_release_pfn_clean(pfn);
> > +	if (!WARN_ON_ONCE(!refcounted_page))
> > +		kvm_release_page_clean(refcounted_page);
> Why it's not
> if (!WARN_ON_ONCE(!refcounted_page)) {
> 	if (writable)
> 		kvm_release_page_dirty(refcounted_page)
> 	else
> 		kvm_release_page_clean(refcounted_page)
> }
>=20
> or simply not pass "writable" to __kvm_faultin_pfn() as we know the slot =
is
> not read-only and then set dirty ?

__kvm_faultin_pfn() requires a non-NULL @writable.  The intent is to help e=
nsure
the caller is actually checking whether a readable vs. writable mapping was
acquired.  For cases that explicitly pass FOLL_WRITE, it's awkward, but tho=
se
should be few and far between.

> if (!WARN_ON_ONCE(!refcounted_page))
> 	kvm_release_page_dirty(refcounted_page)

Ya, this is probably more correct?  Though I would strongly prefer to make =
any
change in behavior on top of this series.  The use of kvm_release_page_clea=
n()
was added by commit 878940b33d76 ("KVM: VMX: Retry APIC-access page reload =
if
invalidation is in-progress"), and I suspect the only reason it added the
kvm_set_page_accessed() call is because there was no "unused" variant.  I.e=
. there
was no concious decision to set Accessed but not Dirty.

