Return-Path: <linuxppc-dev+bounces-13757-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A01DC327F9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 19:02:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1GWZ6WVQz3bfN;
	Wed,  5 Nov 2025 05:02:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::54a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762279354;
	cv=none; b=QZ2z0r3XBuTA8lLbdR3cGNDnWRhbFd9wBjlCPL6o4Dvg4KRe5fs3SXpEe/tJXOT69X/1gfrrX1e7dfJmfISA7hL1JrgbFFjxcxdsdSaXHuDPoK4Yh/pLhIysZ3P4vab6nD50aJRl7M01lQBfh/PySvhueCkjjKWQod0cR++LaPrOq+26VKaBQtC8A3W+Q0M8NDFir11erEMVPrSdSQYrg8qtr3OvVGpsl6CZbMtrt9YWTLvDGUV/eYoZ4oIq2tDv8nPa8f7PfE5dHM7o0L1oohVdEplzUvm26MtDbpnyKMIR3MVKCFw4b+JUPB5jFk24hzNLkDuRrp1SIDs8hVKUOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762279354; c=relaxed/relaxed;
	bh=z7TAMX5tgRxcaQgmnIz2dr5/J34h/wClq0GmkAjx/eU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZQJSqAsSPaW2q1ZzwncZGnKcr3043Bu32q+PQqzv62FKFPc0VDael+tipmzvTAximc97fZ3f15qXKQqHqvPtTZgelGlOJFIRHRL5+blt5uR0+SLsF9mA3uVcYfXLMgcL7JZ0DHxcTdXABeB5Lwj68vNWy7dMQDS0Sa4ASTMK7qwX9DLhcWvJJKAelgg8H9Mgd7eb60rZFDwmTercZMEuDbH4SAFw9KthEQhQwC4IXWrCKm6uduJ/F+D310lLtRC38E5iteGRUqsGBfSLB2Qb9zxtDGx9cMFUeZNuWOXfMfSGT3dp4wDOHOFQHHuGHYcDFxiAOTpPqBHiro4pevXNVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=smSJ5AEC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3tz8kaqykdk4gsobxquccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=smSJ5AEC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3tz8kaqykdk4gsobxquccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1GWY6hHgz30V1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 05:02:33 +1100 (AEDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b55283ff3fcso4043682a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Nov 2025 10:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762279351; x=1762884151; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z7TAMX5tgRxcaQgmnIz2dr5/J34h/wClq0GmkAjx/eU=;
        b=smSJ5AECqDRVzcfsuigEaRNs70heIriyLHcYfAhaqmJH1qDPN5Qh//M6JfaBF7mb8d
         W6rES+WzHHtMCL2eaVGvMQ/0as4tQfFp88jfjs0uVssBmevFkkOPU3fvhP/ngLj/u1HY
         7R/VqPzzz2sYYsAI3uQkL3kjxFpLqK5o69aJkglHU3PMfmn/sQ+iq6pdqQAT1L2pa9Ub
         dp7RTSaaeg0WdMfHA4jVK+/cXu9F9P1/YlScZsOXe4dgBlugzEwXMWuSLCqYuXlaqCCO
         wH3oEIFRSfsynR6Cg/IhmTVyP5/9yQB4MoMac76/1o9qrQWSOGrMPYWA1Wbc3TNut7fG
         SCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279351; x=1762884151;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z7TAMX5tgRxcaQgmnIz2dr5/J34h/wClq0GmkAjx/eU=;
        b=hm0MgIa6qPXZJbKbRd3M/0MeAeR1VRIBQ5DFmtTzZJYRVPBs2o6lMUA+lCgCAF9Aa6
         prdHaiI55eTbmSzXlZlPfTX3GYd7T7nXcZ6EpRbD2VSo4xp841PM+xL6qtk6K6b/a6oS
         m8SFoxO/UrjHBVPOFRTPRU98QA43y9ANGkCPaEIdpPBx1Hb/CIIEGltEThTZGW6Riyzl
         Jg1t5Ep1CfhH6UUkr11Tdn1yzqype+Hov/6KPEKQvAGmCVsb1XygtQ/RrzmrqcTvC9iW
         wqBVCQRUVkQcJgrRiiqUXKYqtVujg9g3GC9bTAePbD85hkI2MZMKGGiZJ9diCT+R3/RZ
         k/Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWVcAA4Ai7QcUXLfouJQSUTOp/29TPGRSa3UoXv7PaDYcl2EvFWMW6BLFyjattlbhUI8BfDlxLDfRouhVY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyeHHN8MK8Yhui88cXIX/gPFvaTWO354J7nsfF+sb/dSo9bu+YH
	6jRYXF2D5NicD998H5KMhYxwAeLAMNnXPhATkRqf4ytTbhMtlBbPWcG50MC9WKEF6S/ty5TULE1
	pg0Al6A==
X-Google-Smtp-Source: AGHT+IEToeihVC8rNRp4WXHuCXbja7cJV9DF8/gVM9lRFkFysIMA8abH+TqAL0waWRxDGRap6/agKlo3e+8=
X-Received: from pjbmv10.prod.google.com ([2002:a17:90b:198a:b0:340:d512:22dc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6d92:b0:32b:7222:7459
 with SMTP id adf61e73a8af0-34f8591c355mr151990637.34.1762279351036; Tue, 04
 Nov 2025 10:02:31 -0800 (PST)
Date: Tue, 4 Nov 2025 10:02:26 -0800
In-Reply-To: <31da959f-d004-4ae0-a6a7-d5d31b646b70@linux.intel.com>
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
References: <20251030200951.3402865-1-seanjc@google.com> <20251030200951.3402865-28-seanjc@google.com>
 <31da959f-d004-4ae0-a6a7-d5d31b646b70@linux.intel.com>
Message-ID: <aQo_spywQuek7fUi@google.com>
Subject: Re: [PATCH v4 27/28] KVM: TDX: Bug the VM if extending the initial
 measurement fails
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 04, 2025, Binbin Wu wrote:
> 
> 
> On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> > WARN and terminate the VM if TDH_MR_EXTEND fails, as extending the
> > measurement should fail if and only if there is a KVM bug, or if the S-EPT
> > mapping is invalid.  Now that KVM makes all state transitions mutually
> > exclusive via tdx_vm_state_guard, it should be impossible for S-EPT
> > mappings to be removed between kvm_tdp_mmu_map_private_pfn() and
> > tdh_mr_extend().
> > 
> > Holding slots_lock prevents zaps due to memslot updates,
> > filemap_invalidate_lock() prevents zaps due to guest_memfd PUNCH_HOLE,
> > vcpu->mutex locks prevents updates from other vCPUs, kvm->lock prevents
> > VM-scoped ioctls from creating havoc (e.g. by creating new vCPUs), and all
> > usage of kvm_zap_gfn_range() is mutually exclusive with S-EPT entries that
> > can be used for the initial image.
> > 
> > For kvm_zap_gfn_range(), the call from sev.c is obviously mutually
> > exclusive, TDX disallows KVM_X86_QUIRK_IGNORE_GUEST_PAT so the same goes
> > for kvm_noncoherent_dma_assignment_start_or_stop(), and
> > __kvm_set_or_clear_apicv_inhibit() is blocked by virtue of holding all
> > VM and vCPU mutexes (and the APIC page has its own non-guest_memfd memslot
> 
> Nit:
> It sounds like TDX is using the memslot for the APIC page, but for a TD, the
> memslot for the APIC page is never initialized or used?

Oh!  Good point.  I'll tweak that snippet when applying.

