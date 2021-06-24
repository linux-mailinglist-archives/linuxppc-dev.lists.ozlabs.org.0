Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6F43B2A9E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 10:43:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9YZJ3Xt6z309g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 18:43:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gAOPVlMk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gAOPVlMk; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9YYq3pNxz2yxl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 18:43:10 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso3019008pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 01:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=yhvFMq52QAZ9Grg2JNZMftQHgs3RA/23cRzSXZS17k0=;
 b=gAOPVlMk/C7twisLQPwKCNWWewikvdh3rxAsE3ZtniqnTTajI/NMXYxiFGdNgFsAb5
 HygkoSZIJ35Gv0csn5ROrHrh88J/UJu+eQftLB0ieYLqxUsTshCjLCXS6gCtoawRaivr
 09ywa3Xbj5hpxhL9dwXklJBlZskMpYTiquDzecxyLb9cNgD5q6A07FqSvRwXDFm8rCjX
 BNwM+/+ntQwzLzmsj9QUq7rwCh6LY1EpIQpDwzEMVK8zxcfbTYEjGD1dfARZQBO2ATzQ
 bXhbvn6/C4gpLxmOLhsNYYF/nPrsfEvzkHwVbcZduLr1uAs8pjNAgfhm1dhPRaqpCZmK
 qi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=yhvFMq52QAZ9Grg2JNZMftQHgs3RA/23cRzSXZS17k0=;
 b=McalerhmpCIjtgUoTMMcqGqlCa277RYWVWMIdCIsOQj0ZZ5XtyA1gIDR5F1CYgRaB6
 nxGyz5nfi3UPHMFIKV12H9tct/uc45WO++Bc02ehi6qI5MNdmMuDt64XZTVTqWzwaEB1
 IvoYEXA8ZpFkFNfASCM4nlC/lanyOmNDJ3Z7GDdgHHR9j9Yy/05RgDBJjFJAtUEhbKUn
 gnVAIbdohs8dPKwY6loll/PNdDbC58O+2IsEYQyq6wEnAiM6Wl4W1Ucn0LWDdPm84Hax
 1As7NVdYuYAqGuWmrQKC1mHA2A6+JPw3g6fSrZ2RFONqXk2na4Uml7gR7K5CegRlAumC
 n7Ig==
X-Gm-Message-State: AOAM530/wR7nSVv2O1pT8NbcpDEtAoYy/jTnlKOLnOIGePqTi6OaN+pW
 v6ekWsuifooTk6+BomHEbuo=
X-Google-Smtp-Source: ABdhPJxPYtDJj0lFNs0Ok5TeYJmivmtsbDnnr/kiA2/ldwDSYWrbmF8IsiSMPIQHeLM0imoUnt26JQ==
X-Received: by 2002:a17:90b:793:: with SMTP id
 l19mr14007232pjz.111.1624524186360; 
 Thu, 24 Jun 2021 01:43:06 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id 23sm1841779pjw.28.2021.06.24.01.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 01:43:06 -0700 (PDT)
Date: Thu, 24 Jun 2021 18:43:00 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/6] KVM: x86/mmu: release audited pfns
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Huacai Chen
 <chenhuacai@kernel.org>, Marc Zyngier <maz@kernel.org>, Paul Mackerras
 <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>, David Stevens
 <stevensd@chromium.org>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.a.wang@intel.com>
References: <20210624035749.4054934-1-stevensd@google.com>
 <20210624035749.4054934-2-stevensd@google.com>
In-Reply-To: <20210624035749.4054934-2-stevensd@google.com>
MIME-Version: 1.0
Message-Id: <1624524156.04etgk7zmz.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, intel-gfx@lists.freedesktop.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kvmarm@lists.cs.columbia.edu,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 kvm-ppc@vger.kernel.org, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linux-mips@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from David Stevens's message of June 24, 2021 1:57 pm:
> From: David Stevens <stevensd@chromium.org>

Changelog? This looks like a bug, should it have a Fixes: tag?

Thanks,
Nick

>=20
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>  arch/x86/kvm/mmu/mmu_audit.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/x86/kvm/mmu/mmu_audit.c b/arch/x86/kvm/mmu/mmu_audit.c
> index cedc17b2f60e..97ff184084b4 100644
> --- a/arch/x86/kvm/mmu/mmu_audit.c
> +++ b/arch/x86/kvm/mmu/mmu_audit.c
> @@ -121,6 +121,8 @@ static void audit_mappings(struct kvm_vcpu *vcpu, u64=
 *sptep, int level)
>  		audit_printk(vcpu->kvm, "levels %d pfn %llx hpa %llx "
>  			     "ent %llxn", vcpu->arch.mmu->root_level, pfn,
>  			     hpa, *sptep);
> +
> +	kvm_release_pfn_clean(pfn);
>  }
> =20
>  static void inspect_spte_has_rmap(struct kvm *kvm, u64 *sptep)
> --=20
> 2.32.0.93.g670b81a890-goog
>=20
>=20
