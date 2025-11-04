Return-Path: <linuxppc-dev+bounces-13755-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE1DC327C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 18:58:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1GRM4BFlz3bfN;
	Wed,  5 Nov 2025 04:58:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::649"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762279135;
	cv=none; b=Vf4mEW/mYmIQwhmMBw//EPmQrkGeqrbcY0EtaRyMUHpZ+hzF0atzu4BjAsQuyBwl/rX8oYd5b19Bcbk04DpMpb8P04Nqg/KJP2tcCsBIYTmLghCSswymB52oopM+xrcsy25cHoei4F/6aXiR04z16gDX8BXjRiy4VYAo+5Je4X+DFnomIdmFulSZfc9QZNO9AMvwWETz3C77EfIU194KrvgkfEFRE0rL3YLWXFy//mnlrUVRb/PQDbcB4cSqy+UE6/Q14oHxVx2RZ2cdpufeCmEXnyeZlR62gY5JjXBrPuLyTDX9mvBmmUMXs5MLC6YsHZPrNR+OysYz/Hjl5VR9hA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762279135; c=relaxed/relaxed;
	bh=sTsoW0ur76ePtMo7HcuL4NYZdCCENhkyANXlSBYjqrA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BrshuxXoPienPDl7Zyg3fQQFmj0MWcztelqoFFB4ebyQRNyT5BQacXLRaBZauFY8P6263L6eXed3d7ntpQcH1jTvNzGZPCKRgTrCmaA5/wyPPCwk8YQ4KPCuFGL3w0iKxKmaQlNxTFj5k2M3AaU2UBWxinV8o91AVyNHcrR9RN75Xd70GeXGA49MWN5PyYtBVCEZdvWwdOyewLkGz0g3uD0DhGF0QXhkjU9blyBLOTVni9rhvzzYhaWh8uAVyWf4H9nK5pbPltmUvnYKnWULc+nH1kiJffp3/HfgkkeLIcxHJWQWGkkdAEl+JHCadFxxTld8GWAQrcgvJlmI5PkKNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kB00sM+4; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=33d4kaqykdnef1xa6z3bb381.zb985ahkccz-01i85fgf.bm8xyf.be3@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kB00sM+4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=33d4kaqykdnef1xa6z3bb381.zb985ahkccz-01i85fgf.bm8xyf.be3@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1GRL4z0Wz30V1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 04:58:54 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-294ecd3fdd4so69810875ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Nov 2025 09:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762279133; x=1762883933; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTsoW0ur76ePtMo7HcuL4NYZdCCENhkyANXlSBYjqrA=;
        b=kB00sM+40iSNnb2qNy+S3RY4SXXru0ZW0rouOo2AHNV0kzyxqcrfayq900fMDJpNXi
         9/Dp7RGIZKhwBUX0LzRiKHyTgaE2B7NQBP+9i8kuhcS0iB4ch3k6orpFeCDdLkuKEv7h
         J2WkQXtlh2t6Yt6l8ebD0VIwsGxEo6iEUnWTgZhVCyWxLOjX5ey/AwfCCqzvp6uSiTup
         08ncRaybo49r6RmIUBCqfl3QKeb3sM7yulJ2HgZ2vUjsvwSOB9AwbyJXr5n5Nu5kKjRc
         1FES07de8V8QpuJr+3dnEVfaV9MAk83gR8daVRiSEKAGnZG1OVPH+EsD1mUOvmL3Rd0C
         uscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279133; x=1762883933;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sTsoW0ur76ePtMo7HcuL4NYZdCCENhkyANXlSBYjqrA=;
        b=f0qtFlFoIecGgkk5zBCYRfduB9wsa9WeyiW875KZSlj+18xBG0yiHIi/NKOCPQUePG
         eFePpm+Qf5iHXyzC44p45gdPbKJnQ/9kwi607hoY+h/8vsPO1hrwHwhXKbypMWK7CO7S
         B1CM5/gPACD6Ahh4rssMVkZzm3z1GoweOlzlVI9fErIlmgElntfLj0Ikt8rkAJ+4J7zN
         xrZAZyk9wxlobAAugZtRfFyGfZOEC18wLQUdblrNodlRpSQ7gEN5PLXi5e0waZGt2+dE
         B6QogCVkSQLS6q2ikMMvrPZwg9nQnDuW53IGYxGVwWPIpMB9/bm/Etgqus2Zsa5GGRk3
         M8Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXzCBcBPLCbWLyj9QVZzwgJCWE4l1bRhTSknY3PHNZdJ2v0t9rj7JnJNMl9AGZIT28Uk4f2TrvpxQukmDo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyaKT3H/TMrL7c7FpXCJYmx/9U6HT/cyVkiieLdmJ1SyvSCiVRe
	l0qfTwUKbRRRYcqZSBjN5UsGheWltx4Id88RaBJx1LxgN8SoJt2d2H4hPBXWQGpzJ4wE702mtED
	ZYx46oQ==
X-Google-Smtp-Source: AGHT+IHo6/KH4EkXGXP40ZLufzSsgW7yh9/qU70MiYfxQR70XqX2CyQgg6697l1DVe5Ug6vhYlNvwdh/uJA=
X-Received: from plok6.prod.google.com ([2002:a17:903:3bc6:b0:269:8ca7:6998])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f609:b0:295:4d97:84dd
 with SMTP id d9443c01a7336-2962adb8f9cmr4243385ad.51.1762279132506; Tue, 04
 Nov 2025 09:58:52 -0800 (PST)
Date: Tue, 4 Nov 2025 09:58:48 -0800
In-Reply-To: <725c68f2607ad2d4f742fd749ea517a98d669384.camel@intel.com>
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
References: <20251030200951.3402865-1-seanjc@google.com> <725c68f2607ad2d4f742fd749ea517a98d669384.camel@intel.com>
Message-ID: <aQo-2OQd8ktU0ygn@google.com>
Subject: Re: [PATCH v4 00/28] KVM: x86/mmu: TDX post-populate cleanups
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"kas@kernel.org" <kas@kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, 
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Kai Huang <kai.huang@intel.com>, 
	Yan Y Zhao <yan.y.zhao@intel.com>, "michael.roth@amd.com" <michael.roth@amd.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, Vishal Annapurve <vannapurve@google.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 31, 2025, Rick P Edgecombe wrote:
> On Thu, 2025-10-30 at 13:09 -0700, Sean Christopherson wrote:
> > v4:
> > =C2=A0- Collect reviews/acks.
> > =C2=A0- Add a lockdep assertion in kvm_tdp_mmu_map_private_pfn(). [Yan]
> > =C2=A0- Wrap kvm_tdp_mmu_map_private_pfn() with CONFIG_KVM_GUEST_MEMFD=
=3Dy. [test bot]
> > =C2=A0- Improve (or add) comments. [Kai, and probably others]
> > =C2=A0- s/spte/mirror_spte to make it clear what's being passed in
> > =C2=A0- Update set_external_spte() to take @mirror_spte as well. [Yan]
> > =C2=A0- Move the KVM_BUG_ON() on tdh_mr_extend() failure to the end. [R=
ick]
> > =C2=A0- Take "all" the locks in tdx_vm_ioctl(). [Kai]
> > =C2=A0- WARN if KVM attempts to map SPTEs into an invalid root. [Yan]
> > =C2=A0- Use tdx_flush_vp_on_cpu() instead of tdx_disassociate_vp() when=
 freeing
> > =C2=A0=C2=A0 a vCPU in VCPU_TD_STATE_UNINITIALIZED state. [Yan]
>=20
> Do you want someone to follow up with a v2 of this after the series lands=
? (with
> Binbin's verbiage comments incorporated)

Feel free to send a v2 now.  Or just reply to Binbin's mail with the update=
d
comment.

> https://lore.kernel.org/kvm/20251028002824.1470939-1-rick.p.edgecombe@int=
el.com/#t

