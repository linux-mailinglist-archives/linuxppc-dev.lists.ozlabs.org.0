Return-Path: <linuxppc-dev+bounces-13754-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB75AC327A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 18:57:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1GPn1gtFz3bf8;
	Wed,  5 Nov 2025 04:57:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::64a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762279053;
	cv=none; b=ULK/NoLI2cyz0cMTON7LV3XtgxWWqIx3S1hXiIJIQ0NNuB1MW8oIi3VcL3JskA7nQ2La7u70tSHkq7GAvlAfpuBwmyz2qdmChKKBpIHA2E0nOx1qKXGSI0x925Px+UacJvyuXEoFnyG0+RO9XEGG5WKjQc5tG2EPMudWARbFPudPs7Wx8Vl8KG5f4z1IbCqTJgLN2fNcpwPfx+Bnlfmztzxwfc2SVf8+uGrRom+9KBrD4dJQVRiK4yuohFdiuQcjbXnGhq+e6Wp1qZvv5/iVhQGd1x/d4FMrdwJZDNwkorq6tCpsT7Xzc97mF5uz0LW3mfG3Wb19GeqpPfm82uptKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762279053; c=relaxed/relaxed;
	bh=kxFvD6gKxB44i1bxk1sbjy38espILrC0yFM/UcBrpew=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DOJblPhuC8goLjTvyXi0S3Ml9NJzBc/iAeDM9zr3++DuWq9KGMMhQABzJ77u9ly1pf9SS+ve4Tv+5bnBmaWLmO8wX5uT5CRO0fbubo2cU/wT53q69pkmmok0/ykhG4VGOqU0hu0xNZQl4rmseo15uJ8JYL7af6wqICxVSCJCOcevlyymhtUZ8W9TGovtIi1Bw02bHix3nqn60IlfYiDuDjSUf1WEfspsWPkqM4FBY2YVT0C58MNgLxF1n5lnySwppj1Nd3+GUfebKZiNujYoF/+McDO144b7l5p172Q7Zuv6hhLUCak0+5dsat8FQlIn7kuY3CRRHrgAt/+bKrAqFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4OAynR4R; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3hz4kaqykdhwxjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4OAynR4R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3hz4kaqykdhwxjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1GPl3F35z2yvv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 04:57:30 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-29557f43d56so38463285ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Nov 2025 09:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762279048; x=1762883848; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kxFvD6gKxB44i1bxk1sbjy38espILrC0yFM/UcBrpew=;
        b=4OAynR4RRAYpLGwkKy/FjBDeLu51HpPRaQCSce6xTmgDGj8Wm9iu/rzwasMDAV+YFA
         +7j/2IJi9Hd2w+hXZrD/MQokOlKKJOt4poI3Us6Fpu/BvbleAR4RQeOQPHQGgaj8oYR6
         QMtOkGtjvw4pRpHabOS+PK3qpW+wSS3AShEPmJV7bT6Mo4gWZDLTA06LFYGwXe26Q8So
         ztyWqZxTYe6ZyjL7pNny3/E2Fjr56agQz9YgvnaC+B71wgOIFDu2wXXLazHD/vBiaXHD
         ngySxvc8XYmgvhJFiYaBPfFjIF6+ZyRIY5CcqZcEevADGS/dV1+tr1U6e2Sa6WtKsULZ
         0wdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279048; x=1762883848;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kxFvD6gKxB44i1bxk1sbjy38espILrC0yFM/UcBrpew=;
        b=Kb8MxCHQ2DAPW73AZBIDFEczJSxXba5NBBm1W74aCzxDQYi0bFj6WNTW8UfafFS/RE
         fk0geJS+IG8Ax9/X3C9uahNSAuaeCgAcsEY1rJXSEs6kh5Gm/dSz5iSkyd2oKovKilLo
         lwQSFUbNp41qR97xoTqnrcHtZ6izRvsWpZjbMOSIrSeMaUTxafdrA5NoUzwJi/zeo2pF
         oCWfQfjhjASDSAlDWBnEW/XxvbijP7ffa/OyQhWJxGepoemgX6dT6M0g9oQPgRDPrGA9
         jwuOgtSsvlKT14jo52xNSsCf0PK6K+aRKKdm18XQJQlmkUht6kewyLz4RXU1PlpRzKt/
         LppQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYyQ2xr1LLffP2CbnbbSl1Zauc62iD7X9SIft+P9eI964zc439vr3C+zAfnbq/IxFzYY0QNntjRVnDjAE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyStDzc61mbVvAEj4dlMcexhhCFKvfdryNJxDvJsRCBzAW1gxid
	7ezJLt1Hs+HJ3vNjjZyqaUYE64XBb5HuZminFiQlja1858i5vgb+2br7sizFCVvYkH250UUAPw7
	EL9WTGA==
X-Google-Smtp-Source: AGHT+IFJG/V0EfaymcoM6cPfayQ+DGikxVc9kN5RoO6CmqYed2gXkivkS54tuPy9BQi+XScmFB78yDVh2jQ=
X-Received: from plblv11.prod.google.com ([2002:a17:903:2a8b:b0:290:28e2:ce5d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ffcf:b0:295:2c8e:8e56
 with SMTP id d9443c01a7336-2962ae715edmr5562415ad.44.1762279047867; Tue, 04
 Nov 2025 09:57:27 -0800 (PST)
Date: Tue, 4 Nov 2025 09:57:26 -0800
In-Reply-To: <aQMi/n9DVyeaWsVH@yzhao56-desk.sh.intel.com>
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
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-5-seanjc@google.com>
 <aPhjYcOFjL1Z8m2s@yzhao56-desk.sh.intel.com> <aQMi/n9DVyeaWsVH@yzhao56-desk.sh.intel.com>
Message-ID: <aQo-hus99rE7WBgb@google.com>
Subject: Re: [PATCH v3 04/25] KVM: x86/mmu: Add dedicated API to map
 guest_memfd pfn into TDP MMU
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
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
	Michael Roth <michael.roth@amd.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 30, 2025, Yan Zhao wrote:
> On Wed, Oct 22, 2025 at 12:53:53PM +0800, Yan Zhao wrote:
> > On Thu, Oct 16, 2025 at 05:32:22PM -0700, Sean Christopherson wrote:
> > > Link: https://lore.kernel.org/all/20250709232103.zwmufocd3l7sqk7y@amd.com
> > 
> > Hi Sean,                                                                         
> > 
> > Will you post [1] to fix the AB-BA deadlock issue for huge page in-place
> > conversion as well?

If you (or anyone) has the bandwidth, please pick it up.  I won't have cycles to
look at that for many weeks (potentially not even this calendar year).

