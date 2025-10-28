Return-Path: <linuxppc-dev+bounces-13358-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D22F1C122D8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 01:37:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwWfX2zn2z304H;
	Tue, 28 Oct 2025 11:37:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761611828;
	cv=none; b=jC5Jx7ox+8+SUUjJRRP91xVfStWmDba98OYsJ2QlfJd38VRmyh6nROgsPDQptxHuSLS8kEufgMmxpPTKlDXOP1kT49JCI8+p43HszoQvbATFEZ3JKBPzLrEXEePNiu/6akW3W7PATACRX8PH8sevKw+pEablkh5WMvD8fswj7ALjU/c7fLK8ZgIKPNYTgugqovLJRXEDWd3iDSCBBc7WnpBGcCetvRXAphGimCNrZM9Zycimq7B5b1JxKVJXYR6wJ/PV9ddM8YTnWSr5JUJHJMG4tHrlS4qdj/fZ3vREMIlkNJu7BUc3WKIPhx01NwwofZhsY3g3NNjz+yj7VOld0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761611828; c=relaxed/relaxed;
	bh=J3mxOKer4OGfyDxlfqvGDsZ/A3KYgtdet3LczK0ONqE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bggT8+M1uxumXUT+ie4MAP3B/81tk7GO/A9ygG8hkkldzGKFQdSwgMT1m6p4sxuu2VqvkceM3Yr/cpzWtvZA7ubDr5N6kCO9YCc6R7+OZF+9U/pdKZmsltaXNs+TnOG7Sf1iVKOtEXjrV5MGhM1GAFIAl+x9oVaWSED4hAgAk0n+mDT+zmX/4KQXL3ck3jRz6yzMCeU/E/ZivVPphOh2QiPfVZV9FfKrlqIeZNFg+fA4cB+gp7cBrZJUdfskRbO45ggIQsqfHI5CloRo6eAuOnsZoz5+3f3afsb0EZ9tW+8ornwlSfI4+lTr5bM5J4DkO1xZTENR2akcHwwnJmFQyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vW0XgWNJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3mraaaqykdkaseanjcgoogle.comlinuxppc-devlists.ozlabs.org@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vW0XgWNJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3mraaaqykdkaseanjcgoogle.comlinuxppc-devlists.ozlabs.org@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwWfW4F75z2yFx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 11:37:06 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-339b704e2e3so4969844a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 17:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761611825; x=1762216625; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3mxOKer4OGfyDxlfqvGDsZ/A3KYgtdet3LczK0ONqE=;
        b=vW0XgWNJWQt1C9XrL8OcNv9kwPwKS2he/ZSsz3zD3ZBqMfhBwKDe/vFknRoov7mHqL
         8KzhB7XRlIX6JD2ACoAOiYX09hrEpz5C3V5JlESa0mrEwIn9GwkvJc2mKB2nb37etZnC
         pap9sVNPW3FDAsIC5t1wJ8heFyMcp8KzcKCasHFmhMhC9fHH1U/PLWktY7hBLB4irOmw
         XE8HdPCb5NCzL4V8UzpVPK26p5PpccNSGBX4cxnxBOr5ZWQ+ZCjBzyWmSlbzs0fCU3Vg
         1Pmasb3weyaslS5ceSpaVKEYJtEszV2yvDjJvFSjdzm7KRWOjdPeYJZcpSVnp1rb7f1j
         q9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761611825; x=1762216625;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J3mxOKer4OGfyDxlfqvGDsZ/A3KYgtdet3LczK0ONqE=;
        b=rb2bPM6XHNb46wqm//m8AxGjcjSxPKby1noE73MiiAnm8bphLdijYHVvHpJiU/74hA
         nTIovuN+frcKjFWQl9jLPPA68NvTXyYjXU7MeXa7eCAwzFoMEQR/m/eFLNKgLEHz7Hgc
         +agWJd5eqp27/na+VjtJcRsS4PBT8kmWwrajWe1nLbucjoE6HRW5T8AO8LDpLTsiXpT2
         P3Ch/Iminuw/urnQsGw9VZleIKVGuPpb3FaBGzHjhbeAsLJLoqj7r0NMz/1G5rYso+GE
         glj0hC2uWNtyK7MsmK4wsHltDT2leAktHYexIVjJ6qdGe7VNWbGdA7PowGdDl8l5uH4k
         oOGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs/SdWiKjjr92NJhA/U14n1tmmHM8LQmojowo7OnxYcee4iF1rZgmcXEXDK+c+1wUAHl4AHi5AlcFOm8k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyh540UD396NlSiKC6dV0b7ghio+FK40JIugBUuqi/hZU1F97/4
	g8M6lQHgayCznC6u6OI8GK0569B4+vMdQJpURW5D0ZYHirsA9uH5EtmXScBSAV7gYRPVuPbwqVv
	8RwrGtA==
X-Google-Smtp-Source: AGHT+IGoxyiEdJHjsguM4HhfYAa3a3WGl9IwGzua+OMwKu3+3dxnKcX9NeqRP2yYPcwFhiCcHGTefjSDvqI=
X-Received: from pjcc13.prod.google.com ([2002:a17:90b:574d:b0:33d:813f:6829])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5241:b0:329:cb75:fef2
 with SMTP id 98e67ed59e1d1-340279e5c84mr1590788a91.3.1761611825209; Mon, 27
 Oct 2025 17:37:05 -0700 (PDT)
Date: Mon, 27 Oct 2025 17:37:03 -0700
In-Reply-To: <55461c549803e08db97528127c29e092c597adc5.camel@intel.com>
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
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-25-seanjc@google.com>
 <55461c549803e08db97528127c29e092c597adc5.camel@intel.com>
Message-ID: <aQAQLzxyGFooGtNV@google.com>
Subject: Re: [PATCH v3 24/25] KVM: TDX: Guard VM state transitions with "all"
 the locks
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
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, Vishal Annapurve <vannapurve@google.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 28, 2025, Kai Huang wrote:
> On Thu, 2025-10-16 at 17:32 -0700, Sean Christopherson wrote:
> > @@ -2781,8 +2827,6 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *ar=
gp)
> > =C2=A0	if (r)
> > =C2=A0		return r;
> > =C2=A0
> > -	guard(mutex)(&kvm->lock);
> > -
> > =C2=A0	switch (tdx_cmd.id) {
> > =C2=A0	case KVM_TDX_CAPABILITIES:
> > =C2=A0		r =3D tdx_get_capabilities(&tdx_cmd);
>=20
> IIRC, this patch removes grabbing the kvm->lock in tdx_vm_ioctl() but onl=
y
> adds the "big hammer" to tdx_td_init() and tdx_td_finalize(), so the
> tdx_get_capabilities() lost holding the kvm->lock.

Ooh, yeah, nice catch, that is indeed silly and unnecessary churn.

> As replied earlier, I think we can just hold the "big hammer" in
> tdx_vm_ioctl()?

Actually, I think we can have our cake and eat it too.  With this slotted i=
n as
a prep patch, the big hammer can land directly in tdx_vm_ioctl(), without a=
ny
change in functionality for KVM_TDX_CAPABILITIES.

--
From: Sean Christopherson <seanjc@google.com>
Date: Mon, 27 Oct 2025 17:32:34 -0700
Subject: [PATCH] KVM: TDX: Don't copy "cmd" back to userspace for
 KVM_TDX_CAPABILITIES

Don't copy the kvm_tdx_cmd structure back to userspace when handling
KVM_TDX_CAPABILITIES, as tdx_get_capabilities() doesn't modify hw_error or
any other fields.

Opportunistically hoist the call to tdx_get_capabilities() outside of the
kvm->lock critical section, as getting the capabilities doesn't touch the
VM in any way, e.g. doesn't even take @kvm.

Suggested-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 1642da9c1fa9..43c0c3f6a8c0 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2807,12 +2807,12 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp=
)
 	if (r)
 		return r;
=20
+	if (tdx_cmd.id =3D=3D KVM_TDX_CAPABILITIES)
+		return tdx_get_capabilities(&tdx_cmd);
+
 	guard(mutex)(&kvm->lock);
=20
 	switch (tdx_cmd.id) {
-	case KVM_TDX_CAPABILITIES:
-		r =3D tdx_get_capabilities(&tdx_cmd);
-		break;
 	case KVM_TDX_INIT_VM:
 		r =3D tdx_td_init(kvm, &tdx_cmd);
 		break;

base-commit: 672537233b8da2c29dca7154bf3a3211af7f6128
--

