Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id F1FCA8D2492
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 21:26:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=AKQlHxLL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vpj1m36JSz79v1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 05:17:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=AKQlHxLL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3fs1wzgykdgoamivrkowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vpj120p8Tz78kx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 05:16:20 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-df771bdee6bso1938258276.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2024 12:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716923773; x=1717528573; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aN1FoCckBsPH3nlr2F+fxU8+3rgvDDBf83ZZTupmDzY=;
        b=AKQlHxLLHHSP/1M1B1O7A3VgoccKAHguQKmoDLiZyFP/Y1QZRBc0ttvIx+fOWd2IdA
         TRxSkI1ntOnK4lQZNOXjsttASzWM8nNsLOAdeq+Fd+8sYn5Y4HSIEyQEtmyc/gAnLbu8
         tOWHUcG2DjvziGfd4p+QEXbBuuvWbckr5aSe5EqORE8E86tHtzPOIknAj2RLQ+r4oPYc
         ticHtCW3hGe/fSGeIUwUdS+zfAYGmtwvhoAtbZJHJjJMmrn2CaaGDwKzKftzf6MWAkdh
         CeqjjFH9/82oRE1TYnHv684Z6YixAW5R+6dtUPbqyT/4nHbqrxBlQaarBv416LqGoe3h
         iR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716923773; x=1717528573;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aN1FoCckBsPH3nlr2F+fxU8+3rgvDDBf83ZZTupmDzY=;
        b=gRTiKK8j6upUKPok9eP5w5jRb9aUaJwlQTXHV/D1aHqHOcPRjW3/1a/uM+DVJfuUKj
         Us34XnwRq+LfaTwGij0VQTxX8XofRkCkV0lqv/ODargxYhbws/oHt24bLCc9QBRunSjW
         Dqm0DEDsAIeF7t4erSu6IzRJyBUS8SXbNKRaKi5YhiUEe8isoxdqj8B1AM/p0fylb6gg
         yvJfZ0kjFDmeaDoZZkIjM7lNurKmUqtKt9kI0MILIuaEkRy09RN0hjBIFgyCxAJZbwvC
         sBZexjchLaG9636PByP4QIfEhl5GT6QyoXL3CJtvJpoz6aN2vUjSv2iellKuJj43WBtm
         mAKA==
X-Forwarded-Encrypted: i=1; AJvYcCX9uq9HoufrefkRcLBtKuMCMzUVNqaPmQrlTnSNkWMLuKyI/DQ4ahi/pP98BUiVd75n24HEiAtAGrPLrIFkAFMjNmtTsNpcgEkxOoqzbw==
X-Gm-Message-State: AOJu0YyUuvfuAS/n3Zj46/W/5kcmkFEmly7UQAbt9Msv3EhrbN266B4J
	OkoVlEoGNhxb71CG/koFAEvLilBBooOwfr7TKdvGERmN6Ln1E76RPac0/uw2jhdoaxqTktZ1ouq
	k5Q==
X-Google-Smtp-Source: AGHT+IEYffSoUdZ4cg7KX8v+KoP4uvokISlIeu5qUtxtXAQ85EyWGJZei7jVgr6jZvnufr8gfWsoMUgR1K8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:10c3:b0:df7:943d:f935 with SMTP id
 3f1490d57ef6-df7943e55a0mr788014276.2.1716923773190; Tue, 28 May 2024
 12:16:13 -0700 (PDT)
Date: Tue, 28 May 2024 12:16:11 -0700
In-Reply-To: <c77f3931-31b2-4695-bd74-c69cba9b96c1@intel.com>
Mime-Version: 1.0
References: <20240522014013.1672962-1-seanjc@google.com> <20240522014013.1672962-4-seanjc@google.com>
 <c77f3931-31b2-4695-bd74-c69cba9b96c1@intel.com>
Message-ID: <ZlYte16cvQpPGHkx@google.com>
Subject: Re: [PATCH v2 3/6] KVM: x86: Fold kvm_arch_sched_in() into kvm_arch_vcpu_load()
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 24, 2024, Kai Huang wrote:
> > @@ -1548,6 +1548,9 @@ static void svm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> >   	struct vcpu_svm *svm = to_svm(vcpu);
> >   	struct svm_cpu_data *sd = per_cpu_ptr(&svm_data, cpu);
> > +	if (vcpu->scheduled_out && !kvm_pause_in_guest(vcpu->kvm))
> > +		shrink_ple_window(vcpu);
> > +
> 
> [...]
> 
> > @@ -1517,6 +1517,9 @@ void vmx_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> >   {
> >   	struct vcpu_vmx *vmx = to_vmx(vcpu);
> > +	if (vcpu->scheduled_out && !kvm_pause_in_guest(vcpu->kvm))
> > +		shrink_ple_window(vcpu);
> > +
> 
> Nit:  Perhaps we need a kvm_x86_ops::shrink_ple_window()?  :-)

Heh, that duplicate code annoys me too.  The problem is the "old" window value
comes from the VMCS/VMCB, so either we'd end up with multiple kvm_x86_ops, or
we'd only be able to consolidate the scheduled_out + kvm_pause_in_guest() code,
which isn't all that interesting.

Aha!  Actually, VMX already open codes the functionality provided by VCPU_EXREG_*,
e.g. has vmx->ple_window_dirty.  If we add VCPU_EXREG_PLE_WINDOW, then the info
get be made available to common x86 code without having to add new hooks.  And
that would also allow moving the guts of handle_pause()/pause_interception() to
common code, i.e. will also allow deduplicating the "grow" side of things.
