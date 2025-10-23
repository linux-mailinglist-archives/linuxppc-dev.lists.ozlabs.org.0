Return-Path: <linuxppc-dev+bounces-13212-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFBEC01F41
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 17:00:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csq2X64FMz2xgQ;
	Fri, 24 Oct 2025 02:00:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761231604;
	cv=none; b=d9W99bupcZKyT5HYjiG/EOvO6qhNEGYLQwyt7aJszXy4/q8/TUxEId7PQiljKlroexAoAHc54Ht4dwdaSAHcrxgnUhREYL2Sk8iFH6l9NPzgxHOTiWKmkDBAImRyXVdZILZcglPC+NZcoD7LSnUB/rexpS9iTk1nTJ4J7JDFF159/IHFDjWzv4XVcRJ++VcTrV1c6HdynqR0DOzRkWMGbzOlgnVIgwubT5IGGH2kQnfbSiof8hq2pOhDWcpsyaeheR7iVAGp6MPKxUoa8nN84tSPcYLnslQE8UrmdzAb/VeUfB7QAiw0Ny10o+Zq17IbfwsRwSkRAbqvQQt3xCmX9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761231604; c=relaxed/relaxed;
	bh=DsY3zzD8XUrRiTLyLBawfwaQI9/sErmot+/rfYHcY0U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AcTLGLOguBAbiofO9m+m3UxXatiHfg63rKhF2GrK2dtNOE61TP/y2pOV2e7YEueniXMjhPyZOruU++yVTqwf3QJ6VFx7ArIG06cbUCxCV5dqYKrTd7rJeSlqR9/QHXP/M1kHR9zv+bnIfX2bor0bMDgsBD16OrVYupWnkZ0PZ3izmPCfy/gQjHfSmyx0Ry2YN8G1+/Dj7yq8a8yzN1qhu+rMN8ajGtBLiSYVTou22lypOutOehbQr7UB0rCP/5Aiec+fkLCgiSMGWRfnLy6EPUR62T/3HfXc99L3nHNL7Jc0kgo6pAdv5lslxFFYx4QPPxbTKnpU3Fy23XwyXPKVTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kQdtOX7X; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=370l6aaykdkweqmzvosaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kQdtOX7X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=370l6aaykdkweqmzvosaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csq2V73wcz30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 02:00:02 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-336b9f3b5b0so982819a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 08:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761231600; x=1761836400; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DsY3zzD8XUrRiTLyLBawfwaQI9/sErmot+/rfYHcY0U=;
        b=kQdtOX7XAgsU2V6XZCAVVbDcBDO85v5wk8nZYY4PP2erjZpjbIHhV2c+n7NYX7/LUN
         zIMs7ib99p4EAmqAl8CbGKBYHgy7D+EW5vdlVYThrm9z8/JdO5MyROZk1dVUJrZugtJx
         BAPH0ATC4ShrknOCkUIOv9Gj/BnkM23MyBByepTE9wQ9rgY1WmGSBvNlTYOmpg65+yhc
         cUJ8uAcNPio+uu7JE6nabHLyZpyDmdlB15dq5EHvyhkcK3FIWWorR/PvoH0v+JNhsEEe
         lfcoF2Ga/Mi6aOsO2UR0JOfp3XQcyxlPGsrEifeV0T04/yDKF6KfPDRKBi88eNigkTMR
         kTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761231600; x=1761836400;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DsY3zzD8XUrRiTLyLBawfwaQI9/sErmot+/rfYHcY0U=;
        b=sensN6blYqRJKhtmCIbwvVVj+bm/DRkiE0CgdllwZSqbmv27zCRQbeyqn8isd8x62V
         yFIPJT/v/QSnWZyXNT/WcdtAdj3/dTY8eY/hyiMBGChnKZwJEiYicLHE69Br9yLFESKj
         CN3nbX5ZyCJlRqQ/j2Qs0HqJcOrKDunvfZQoNKCyP81fH37KpofvwR34gyfPQrFXzI4N
         y3BCyzxcyT6/T4dVO7lZuSVktq63Gv8iVDF7VsPtKmak12d1K3toeYmM8ZX9tphDJebp
         tFp8t/aL2bKKLCpCSEAE9mOOh4UMheTLd8ZSnY+ZaJQfzuvKrhlO8Y/NdzcBmgsvmzQf
         QX9w==
X-Forwarded-Encrypted: i=1; AJvYcCWiPNGlsqWwoM8XT7PsTZWyvH+re38fUhxPm4D8diTeZRZQeJhP8Z5cl18Wlj2UraBbo3+/kx5gNYV6r04=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywsj+Re3u4JO2nsI07Jy4nqAxKMScNIS47D83dmDNh3FgJCkEOd
	Ddm7e4wHFzjdibZdsmNm9pu+9BwNlIHGPWDnjjA5mFhyWIxFtHCyKDHpf1AhsHjsFXuGz8wj0DL
	Yn0pXgg==
X-Google-Smtp-Source: AGHT+IGIKST/5gTXkhLeNb6+zo5OEJ6E7Tz0ILKzp1TDg+5uVro2JJ+z5T3UkH4GmCDPjUQAuY2o81CumRA=
X-Received: from pjbsp15.prod.google.com ([2002:a17:90b:52cf:b0:330:a006:a384])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5291:b0:32e:859:c79
 with SMTP id 98e67ed59e1d1-33bcec1ab25mr31136898a91.0.1761231599767; Thu, 23
 Oct 2025 07:59:59 -0700 (PDT)
Date: Thu, 23 Oct 2025 07:59:58 -0700
In-Reply-To: <28136b62074550826efa3f57b1f7be07f571abdc.camel@intel.com>
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
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-10-seanjc@google.com>
 <28136b62074550826efa3f57b1f7be07f571abdc.camel@intel.com>
Message-ID: <aPpC7mt3CwWuhv1p@google.com>
Subject: Re: [PATCH v3 09/25] KVM: TDX: Fold tdx_sept_drop_private_spte() into tdx_sept_remove_private_spte()
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
> > Fold tdx_sept_drop_private_spte() into tdx_sept_remove_private_spte() to
> > avoid having to differnatiate between "zap", "drop", and "remove", and to
> 		  ^
> 		  differentiate
> 
> Nit: it's a wee bit confusing that you mentioned "zap", because after this
> patch tdx_sept_zap_private_spte() is still there.  But it may be only me
> feeling that way.

Hmm, yeah, I agree that's a confusing/misleading.  How about this?

  KVM: TDX: Fold tdx_sept_drop_private_spte() into tdx_sept_remove_private_spte()
  
  Fold tdx_sept_drop_private_spte() into tdx_sept_remove_private_spte() as a
  step towards having "remove" be the only and only function that deals with
  removing/zapping/dropping a SPTE, e.g. to avoid having to differentiate
  between "zap", "drop", and "remove".  Eliminating the "drop" helper also
  gets rid of what is effectively dead code due to redundant checks, e.g. on
  an HKID being assigned.
  
  No functional change intended.

