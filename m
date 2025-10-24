Return-Path: <linuxppc-dev+bounces-13292-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5535AC07571
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 18:35:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctT6W1wmLz2xR2;
	Sat, 25 Oct 2025 03:35:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::649"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761323747;
	cv=none; b=FSENmFgfwlvTQMbhNzQL4L6a5y5yia3W881o0tGhSbp3uERzP40NCK2DJT0DcxLjshXnCvwlDnvMlzFx7gAXw62ez1Obgn7nzEV0Rftg8p36rhOpS8vdYpmf6QeWRvoe2aBtMCxvTO1PktEhKIUMgp66UuMEPrHDju5DTWtsb96mRz5ZPv3VR2p19DXayKFC1p14gl+dx/28fLezbZ5DP2i0CMVBzy46oBJXP9OY+/5ZbH/WDD05t3sIlBoKnZszm/dQp4nddHFRSisVyAWqtg+criwFSaPCRMUMqNb1lnOk6pTLQbmYvc5Z3POLCIo5709xqPLWJKfTH+2XFFHv6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761323747; c=relaxed/relaxed;
	bh=cu0gmfEAQ+U9vhoL2h/iCeG4Q5kdgS/ChdUsj5vfglQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oOkeJGTGWF3iZjY4n14ChqMcFGDxL6lb3IHeqlLcdr93f3nz/8T7+0CxXBINwGB7cC2H61w0FrR64SR9jsU2t3ERiXISAoRSnXLUsaQA6vjeYFQ8iT352whzdEAfgM4xd4glZBqIVBS/Y3+ZGNyt8E3fIm/gQYhaTgHEfz3Y6cH9IkIZVLLbIH60COnd+c9E++bnlhi7qUiNhPd0o24sKeS+AEOkd7//7C8qz0BMrucGd7FfimGdH+K+f1HaVgFiI4oVntlCTNymCnRFz0Kjfe7Z6SWLwGaXRCVLlt8rYkmHvXF8ZY6NkFv29QCaUprV186qIEn5kfZ5S+3PEcnaqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ptEzpYxU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=34kr7aaykdhmjvreatxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ptEzpYxU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=34kr7aaykdhmjvreatxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctT6V3XHbz2xQ4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 03:35:46 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-26983c4d708so17924125ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 09:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761323744; x=1761928544; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cu0gmfEAQ+U9vhoL2h/iCeG4Q5kdgS/ChdUsj5vfglQ=;
        b=ptEzpYxUkoKw2xf7aDHXNHQTZjGYBVmeQAltzva6oFiZ2wZcCnmaJO8h2rza2okCpB
         DxUL/5rVvjxhxVOaUPVrKERQSIwtqwJ9JFp//VOpGysOqROpxw2YqXKTw7FRKIcx72aJ
         px3Gp+beZGAXcQ480omxNVgx/KeXXu98B3Il0wydMTA+BwwojdnUOvaX8/pBzr2a2WSn
         KIqktMcSVy6pqGZ3H8HnNlCy9Y8o/mrFvu6P/H3mxLMlfvt5dQNSD11qLwinTz3EUiY9
         U6Y8Npyq+ubWnXm2gxIPOygJe+mKFM/9bsg1zEICbVWqDiHceTIn6u0JLY1WEchSr+k/
         fjqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761323744; x=1761928544;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cu0gmfEAQ+U9vhoL2h/iCeG4Q5kdgS/ChdUsj5vfglQ=;
        b=Qhk+wcbvfbB7bZPlvRomkpputMiALwvRJ1sMvRZJd6ntmfYpwrDUSFNQ7Kc1GBfVy7
         fxr2BFlWKzJZK72f7q+cBJrjdufQ5CMOgH3AcSOuyBvKlRMgUbJnAwjdtJKZpew90RZf
         CPxskIFsB6mrViKx84P/zHkEnwrBR+KcrGYvQSADgDJOsSw0whfy3dWvkIc9f2nbSmxo
         fWCyT184nSoYyTa3wpaQSga3BYQjPHfARoa9m9sfzFLo+h/VPQKuivQSJ66KI53dVwol
         ioGefnNZYXWSekCPYGheXxUViLcip1COc6RDxr99KdKeRGmbBy8wm6MyR2rxY648Iavx
         HpqA==
X-Forwarded-Encrypted: i=1; AJvYcCUdfUxVRhHtLko7zqhYoRaUeTMECRM6/AWyRzaYDPKS4lLbk2by8OkHLnMJBeRbofC5uD+L0R6KGzEwGx8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzSZgk0gYTYLfoOlzGaoCTLsoSmvxBGjsj0oXS3kDmerzn+y2V3
	7OrxkSd+Uh3dq1yUjVQGyuT4xktgzWpdsukrUAe54C/qeYl7rynDzyYK8+8dA/TGmL8H24KLtTF
	gpJTMyQ==
X-Google-Smtp-Source: AGHT+IHEqEX/8GwSPDTtO9R4g/+ZtFO0C94Pe4ULgHF/AbXONvqtNga/vyT3hE3hD5zVd0KE3EnoXL2eWbI=
X-Received: from pjyj8.prod.google.com ([2002:a17:90a:e608:b0:33b:51fe:1a8b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db05:b0:24e:3cf2:2450
 with SMTP id d9443c01a7336-290c9c8a5e6mr368813165ad.2.1761323744332; Fri, 24
 Oct 2025 09:35:44 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:35:43 -0700
In-Reply-To: <442f5488e4a66f6a1517082df3d2ae47316be010.camel@intel.com>
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
 <442f5488e4a66f6a1517082df3d2ae47316be010.camel@intel.com>
Message-ID: <aPuq33-qEJsDhdgG@google.com>
Subject: Re: [PATCH v3 14/25] KVM: TDX: Bug the VM if extended the initial
 measurement fails
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
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 23, 2025, Kai Huang wrote:
> On Thu, 2025-10-16 at 17:32 -0700, Sean Christopherson wrote:
> > WARN and terminate the VM if TDH_MR_EXTEND fails, as extending the
> > measurement should fail if and only if there is a KVM bug, or if the S-EPT
> > mapping is invalid, and it should be impossible for the S-EPT mappings to
> > be removed between kvm_tdp_mmu_map_private_pfn() and tdh_mr_extend().
> > 
> > Holding slots_lock prevents zaps due to memslot updates,
> > filemap_invalidate_lock() prevents zaps due to guest_memfd PUNCH_HOLE,
> > and all usage of kvm_zap_gfn_range() is mutually exclusive with S-EPT
> > entries that can be used for the initial image.  The call from sev.c is
> > obviously mutually exclusive, TDX disallows KVM_X86_QUIRK_IGNORE_GUEST_PAT
> > so same goes for kvm_noncoherent_dma_assignment_start_or_stop, and while
> > __kvm_set_or_clear_apicv_inhibit() can likely be tripped while building the
> > image, the APIC page has its own non-guest_memfd memslot and so can't be
> > used for the initial image, which means that too is mutually exclusive.
> > 
> > Opportunistically switch to "goto" to jump around the measurement code,
> > partly to make it clear that KVM needs to bail entirely if extending the
> > measurement fails, partly in anticipation of reworking how and when
> > TDH_MEM_PAGE_ADD is done.
> > 
> > Fixes: d789fa6efac9 ("KVM: TDX: Handle vCPU dissociation")
> 
> So IIUC this patch only adds a KVM_BUG_ON() when TDH.MR.EXTEND fails.  How
> does this fix anything?

Hmm, yeah, I'll drop the Fixes.  It made more sense when I thought it was
impossible for tdh_mr_extend() to fail, as returning an error and not explicitly
terminating the VM was "wrong".  But I agree it does far more harm than good,
even when relocated to the end of the series.

