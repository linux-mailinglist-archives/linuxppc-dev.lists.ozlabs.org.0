Return-Path: <linuxppc-dev+bounces-13217-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 346D3C02B95
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 19:27:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cstJZ2WS6z3bfF;
	Fri, 24 Oct 2025 04:27:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::649"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761240446;
	cv=none; b=jX4Hnp6PwAajCW14cdG0OHa38XifCxhVZiVrTmb/Xvdqq+3JRuB3v1FWC46HrH1y2yHII+KBqdWdl/2Kq/g4q8MZb3dFr0sAwUuSGKdpfippDmrfA/W6ypVxCvnenGeXWC6MeMJqp8hqypFm1jeG25nV8VoP8jsAbX3EGCcNDwrxhgz5l3bZQHYzvLBc8HgrUxhoDkRTTaecZNf5a41s0lzoBrYWm1ytj9z7u6Trx3ionwNcbpNzx6vbBfpUMGfMUnMJfA0EKuGmKO+Vh7twyKIsQBdb72sQhzl+e6KfguQzaXVdGRHpShA8UOzjuy5N5EHjtYgRq78Tf6ifbUbE9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761240446; c=relaxed/relaxed;
	bh=PMd4YohbYBDUY30TTRBHmO9DyPvx8MjhdR/tVFXtYYI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MB//fINre+oi5SXLa91PZ4y5o557a/XbllTjHcK9cczmAwa70vbQwtYMRUYqHsqIooVwtEon+uDMmXhNi3k3P6F/gKSLD3/XTh8Z+jt9sxvd+h+PePoqxEgkCCPr0wR38ADWhVU3ADjsFF0AOhHZVdjl9T77ZNhCy8xzp1Ci8s79PLPAAuX/QF9Zccd12FExElw5cJjHE7RkkFIvZcJlVL71slmIsfzHmjbxEghbtXcN33luWZ5a7YOVjFjMBfJyCUMptJzYmmmN4cs/o8lOCwiTqW/E6QkPRHsPNQCzjAZVr1BT95FKyE6KXVuBJM1quwtnHCk9lSVvSFTplv9fDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ET/DPV4C; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3dwx6aaykdhgoawjfyckkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ET/DPV4C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3dwx6aaykdhgoawjfyckkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cstJY0hLhz3bf4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 04:27:24 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-27356178876so7254285ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 10:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761240437; x=1761845237; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMd4YohbYBDUY30TTRBHmO9DyPvx8MjhdR/tVFXtYYI=;
        b=ET/DPV4Cpk7Pi91Y6d4MmoR9xk3O/g5jSuiqu5Lp5jZ/BXTBkzkiRDyl88Ba4kG68+
         Y4I6sLodHkSenoViA7MApiwq3f14M7QgVCjpqBNDvjtOJGnkIKg/hVNs1JSi+GSEIDiD
         +R4SuhN4zqapBn/lO5pbLJjVF4qK/L0wZNXk7mb//XFU4EMdMy3NSmnp8MX8xoR2vw1F
         ILSK1MvK6Eru+msflBsQyKsICHcECC8TKVkIKqt3o/hG4GzRfLD16EeeIatEm6eW4pti
         yQHZC/T6XADybL0vBFLP4c+yscNERdVzdV+I3nR99OLfEN4GdppwFoj9ppj/8YABhDf0
         fiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761240437; x=1761845237;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PMd4YohbYBDUY30TTRBHmO9DyPvx8MjhdR/tVFXtYYI=;
        b=jJ+iApT/4lB0ARsAHt40U8pLNQkTio2XKxdz8tYKal3IjlJS18zuvecqOizJ/7CAkc
         xKecZyU71bPotTycXO75O1Rnc9wos1R9SD+Ia/ZKrnIHUlnFjrDgzLC88XpXnqA/02IC
         j4CQDARbQnk+LCRK+H+qdvoju6g28TD7duLSM+qMfTysxQ/FxE/1BXtwRXBlv7jVs/fE
         GQvsfiNxuZwp3fHmpyzaEIbsbcSW+pJlXaDNgmCIzrkcdabJ5m+j5gAf/KSYWAW1S8LT
         9aX/40VEMqxjhRj+v4kb52qWQCdvSWxQ9CVgst0FEh4mjD+hGjajdZBSxOmGzZ8Jc/ob
         Rv+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4FDVaeBz3T4AM012aFozyIwph0vCeP/e4Fcj3IkQqdXJ4A+oiYgh+1o0oHUWy+xlyMjl5NLKxBULsA8U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzLUOWBlyzb4LvOk7DhBs61F5iRh9dK4Bgkc4FqTxNVGU9uYZUc
	+6qabyCdcJoIt0c55rktgsbpqnigOOta02TzE0Z+U9w0rbjH8Gpglv7ueuwOXVUHL3enJM3valV
	5RpkKCQ==
X-Google-Smtp-Source: AGHT+IFjhG//1khxmFCKdE4+6wWu9+6PA/jOl4XyR0eCgR53v+ZECkEt8twGk0B4jVNQwQCsevpreYrKXxc=
X-Received: from pjuj5.prod.google.com ([2002:a17:90a:d005:b0:33b:a35b:861])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db11:b0:240:48f4:40f7
 with SMTP id d9443c01a7336-290cba4efc9mr387536115ad.39.1761240437319; Thu, 23
 Oct 2025 10:27:17 -0700 (PDT)
Date: Thu, 23 Oct 2025 10:27:16 -0700
In-Reply-To: <707a01ee36c28863bdc6a4444a5560e9a0b19597.camel@intel.com>
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
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-15-seanjc@google.com>
 <707a01ee36c28863bdc6a4444a5560e9a0b19597.camel@intel.com>
Message-ID: <aPpldKdiQYYnl4uC@google.com>
Subject: Re: [PATCH v3 14/25] KVM: TDX: Bug the VM if extended the initial
 measurement fails
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
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	Vishal Annapurve <vannapurve@google.com>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, 
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

On Tue, Oct 21, 2025, Rick P Edgecombe wrote:
> On Thu, 2025-10-16 at 17:32 -0700, Sean Christopherson wrote:
> > WARN and terminate the VM if TDH_MR_EXTEND fails, as extending the
> > measurement should fail if and only if there is a KVM bug, or if the S-=
EPT
> > mapping is invalid, and it should be impossible for the S-EPT mappings =
to
> > be removed between kvm_tdp_mmu_map_private_pfn() and tdh_mr_extend().
> >=20
> > Holding slots_lock prevents zaps due to memslot updates,
> > filemap_invalidate_lock() prevents zaps due to guest_memfd PUNCH_HOLE,
> > and all usage of kvm_zap_gfn_range() is mutually exclusive with S-EPT
> > entries that can be used for the initial image.=C2=A0 The call from sev=
.c is
> > obviously mutually exclusive, TDX disallows KVM_X86_QUIRK_IGNORE_GUEST_=
PAT
> > so same goes for kvm_noncoherent_dma_assignment_start_or_stop, and whil=
e
> > __kvm_set_or_clear_apicv_inhibit() can likely be tripped while building=
 the
> > image, the APIC page has its own non-guest_memfd memslot and so can't b=
e
> > used for the initial image, which means that too is mutually exclusive.
> >=20
> > Opportunistically switch to "goto" to jump around the measurement code,
> > partly to make it clear that KVM needs to bail entirely if extending th=
e
> > measurement fails, partly in anticipation of reworking how and when
> > TDH_MEM_PAGE_ADD is done.
> >=20
> > Fixes: d789fa6efac9 ("KVM: TDX: Handle vCPU dissociation")
> > Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
>=20
> Per the discussion in v2, shouldn't it go after patch 24 'KVM: TDX: Guard=
 VM
> state transitions with "all" the locks'? Otherwise it introduces a KVM_BU=
G_ON()
> that can be triggered from userspace. not a huge deal though.

Oh, right.  And then the changelog needs to be updated too.

