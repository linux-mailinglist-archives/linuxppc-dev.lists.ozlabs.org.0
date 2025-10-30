Return-Path: <linuxppc-dev+bounces-13621-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CE0C22B94
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 00:40:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyLG60YMrz2yx7;
	Fri, 31 Oct 2025 10:40:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761867645;
	cv=none; b=TNHhPMkOpiKgw5spz/52052KuTkmxJSUTweflLytW7ulKpj40vehKjK82eb4FnhYHeGLslUjFsSLF5KnsomWYkr2IxKwZwgSeMtQOCe25TxL3rV+k37L+QfAMy2EyGICPOmoTVsHB6T9DPAb16zUDkRJ40mQIhAm3gicJ1HL7WvMVPGXoRvy92EyOIEpCW87aIm7+CSoCvtJm+IukNFK4Lru2j9XIJRuxw0XpSGbzFK92Ovjadocn1oyXnI/ayqussrd9PU7jouD0aWXxP/h6e4kMVULRBanHDaqAJhVuCwMkAGPB9+5AC+vDjGE0HOjtWC1f3RgJVsmH8oetc7ZDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761867645; c=relaxed/relaxed;
	bh=hANv7xEJBy7S5lh8h/UQF87h23G6mY0gbFBLav72O2Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IsVRnY6pnh1yx8TOcmCwtjv10bODn6BJgfYVRxIV7Lbog+xsmtjaexnSlQLtgAWGn8tNHMGF0vhb2zp0zw1GHVwsRforpAQUBTryQRzH/I3CcX26DvEUIN5ZbyvsQdywFiI/cl1v2VSXr+sDw9Oe/o9UkwXsDEv2FLZut3nefxUuH4ymkIA7sp7dOpQ3TjDpf7s5n21hfFfXGEqZIStpBgaJKd98URsKeMO2jkcO5LNA4eFwevIssyf3xgFFtiBjpTGfrwEIkTiUjHdlqzPETQ6U1vPUZUvahpMu+9n/8hNRh7fj7EWY+nRS0JdmCakCgLMj+7ohxWL3gzJfW4gGpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vqNMkeU5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3evcdaqykdmc5rn0wpt11tyr.p1zyv07a22p-qr8yv565.1cyno5.14t@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vqNMkeU5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3evcdaqykdmc5rn0wpt11tyr.p1zyv07a22p-qr8yv565.1cyno5.14t@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyLG44tJqz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 10:40:43 +1100 (AEDT)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-792722e4ebeso1604392b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 16:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761867642; x=1762472442; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hANv7xEJBy7S5lh8h/UQF87h23G6mY0gbFBLav72O2Q=;
        b=vqNMkeU5lTrz8GNY+uz3Jor9KiFcK5b6FO4ZXem1zaCQEw8WsDJZZIM3xlKjwJ+/uT
         wFww6ABFnDAQXrWIE/O5D78azw0BRXVwFrCq2t5itGIv7SdTt7c2CJRHxgu110qaTHrm
         7OqE1Fb+t3Shvhzie3+UBvDywYFc4L1gWSxshuDFVA0gOO06M6/S8LwtrsbA5ZkL4A6f
         8OIXf36ScZMgh3+9Kpm/L0wtwt/LEgWyqJjL1KLFZBOL7Q9LDT9POqQlx/jiA3SGKrG1
         67+6KmUdKq9p7IE3keVXNe5yHehF8xocsayYmUvAAaxZdBY6rg2TyF+qWRmoIMAKxzG0
         NGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761867642; x=1762472442;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hANv7xEJBy7S5lh8h/UQF87h23G6mY0gbFBLav72O2Q=;
        b=HBPeIyto+2ZHQk+LNrhSKUSeLYEhXkfAKLNTir7sZ5kFruw5B+MAExYgExBC3em/77
         rqF7qyvfytmECLxBXXyifNyA3CHH9HllwC9e+7LF7fDVMDb7lNhAJHDOsNcxNjSkd+Tz
         2orrb/GVt68r+oGKh8/bz8GM77hycJcXVUxUxzO9cQq68LctHNRqBBqPlErX/w6AFyqx
         wAjhcPrfM1A9jXUoud+NaYKitDljmJVoocJG4JY4QH4Cbky+35WZFOgOItPRap/k0WdR
         p+FAj4J1MKaRiVatA2gvfOPdRS2a2TqGfzhUVH+aS9GGnWS6KX0t02Mxm3sa4rlPzI0Q
         gBjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7TeMaZdyP+LWhE4VsTUkyHRdBIXwwcVwPHRshMLQE8Vjne86NmBT5pCQZN+l8vxS8wecKM3roUHrHD5k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzZFH7vSSiz8VSKtJRNJKll6XgSjk/QcywO7PjPxcn2DlSIlNNc
	Ux8dvHoPukQ/dF4lyZHoFBjmVEXuguxXkFtlWWG4Af4rlvDz8i6efpiAEN4aOaYzUGOr5/bRQGU
	wVeoKpQ==
X-Google-Smtp-Source: AGHT+IH6kktSpJB8uW8dOccHej0bRJlF9t4mdGsOdXoLRdKSPbgGpCfMdKkfH5SPES5/Onbr9IfT7/Ky4i8=
X-Received: from pfbhm7.prod.google.com ([2002:a05:6a00:6707:b0:77e:40c7:d12e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3996:b0:7a4:460e:f86a
 with SMTP id d2e1a72fcca58-7a7796c8a99mr1645968b3a.25.1761867642073; Thu, 30
 Oct 2025 16:40:42 -0700 (PDT)
Date: Thu, 30 Oct 2025 16:40:40 -0700
In-Reply-To: <6572689b28a76bd95bc653b1fc1131fa57ed7669.camel@intel.com>
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
Precedence: list
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com> <20251030200951.3402865-13-seanjc@google.com>
 <6572689b28a76bd95bc653b1fc1131fa57ed7669.camel@intel.com>
Message-ID: <aQP3eJmLTHscDoI4@google.com>
Subject: Re: [PATCH v4 12/28] KVM: TDX: WARN if mirror SPTE doesn't have full
 RWX when creating S-EPT mapping
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"kas@kernel.org" <kas@kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, 
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, Vishal Annapurve <vannapurve@google.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 30, 2025, Kai Huang wrote:
> On Thu, 2025-10-30 at 13:09 -0700, Sean Christopherson wrote:
> > Pass in the mirror_spte to kvm_x86_ops.set_external_spte() to provide
> > symmetry with .remove_external_spte(), and assert in TDX that the mirro=
r
> > SPTE is shadow-present with full RWX permissions (the TDX-Module doesn'=
t
> > allow the hypervisor to control protections).
> >=20
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
>=20
> Reviewed-by: Kai Huang <kai.huang@intel.com>
>=20
> [...]
>=20
> >  static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
> > -				     enum pg_level level, kvm_pfn_t pfn)
> > +				     enum pg_level level, u64 mirror_spte)
> >  {
> >  	struct kvm_tdx *kvm_tdx =3D to_kvm_tdx(kvm);
> > +	kvm_pfn_t pfn =3D spte_to_pfn(mirror_spte);
> > =20
> >  	/* TODO: handle large pages. */
> >  	if (KVM_BUG_ON(level !=3D PG_LEVEL_4K, kvm))
> >  		return -EIO;
> > =20
> > +	WARN_ON_ONCE(!is_shadow_present_pte(mirror_spte) ||
> > +		     (mirror_spte & VMX_EPT_RWX_MASK) !=3D VMX_EPT_RWX_MASK);
> > +
>=20
> Nit:=C2=A0
>=20
> I am a little bit confused about when to use WARN_ON_ONCE() and
> KVM_BUG_ON(). :-)

Very loosely: WARN if there's a decent chance carrying on might be fine,
KVM_BUG_ON() if there's a good chance carrying on will crash the host and/o=
r
corrupt the guest, e.g. if KVM suspects a hardware/TDX-Module issue.

